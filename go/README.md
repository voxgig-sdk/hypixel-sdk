# Hypixel Golang SDK



The Golang SDK for the Hypixel API — an entity-oriented client using standard Go conventions. No generics required; data flows as `map[string]any`.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
go get github.com/voxgig-sdk/hypixel-sdk/go@latest
```

The Go module proxy resolves the version from the `go/vX.Y.Z` GitHub
release tag — see [Releases](https://github.com/voxgig-sdk/hypixel-sdk/releases) for the available versions.

To vendor from a local checkout instead, clone this repo alongside your
project and add a `replace` directive pointing at the checked-out
`go/` directory:

```bash
go mod edit -replace github.com/voxgig-sdk/hypixel-sdk/go=../hypixel-sdk/go
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### Quickstart

A complete program: create a client, then call the entity operations.
Each operation returns `(value, error)` — the value is the data itself
(there is no `{ok, data}` wrapper), so check `err` and use the value
directly.

```go
package main

import (
    "fmt"
    "os"
    sdk "github.com/voxgig-sdk/hypixel-sdk/go"
)

func main() {
    client := sdk.NewHypixelSDK(map[string]any{
        "apikey": os.Getenv("HYPIXEL_APIKEY"),
    })

    // Load a single guild — the value is the loaded record.
    guild, err := client.Guild(nil).Load(map[string]any{"id": "example_id"}, nil)
    if err != nil {
        panic(err)
    }
    fmt.Println(guild)
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

if result["ok"] == true {
    fmt.Println(result["status"]) // 200
    fmt.Println(result["data"])   // response body
}
```

### Prepare a request without sending it

```go
fetchdef, err := client.Prepare(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "DELETE",
    "params": map[string]any{"id": "example"},
})
if err != nil {
    panic(err)
}

fmt.Println(fetchdef["url"])
fmt.Println(fetchdef["method"])
fmt.Println(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```go
client := sdk.Test()

guild, err := client.Guild(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
if err != nil {
    panic(err)
}
fmt.Println(guild) // the loaded mock data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```go
mockFetch := func(url string, init map[string]any) (map[string]any, error) {
    return map[string]any{
        "status":     200,
        "statusText": "OK",
        "headers":    map[string]any{},
        "json": (func() any)(func() any {
            return map[string]any{"id": "mock01"}
        }),
    }, nil
}

client := sdk.NewHypixelSDK(map[string]any{
    "base": "http://localhost:8080",
    "system": map[string]any{
        "fetch": (func(string, map[string]any) (map[string]any, error))(mockFetch),
    },
})
```

### Run live tests

Create a `.env.local` file at the project root:

```
HYPIXEL_TEST_LIVE=TRUE
HYPIXEL_APIKEY=<your-key>
```

Then run:

```bash
cd go && go test ./test/...
```


## Reference

### NewHypixelSDK

```go
func NewHypixelSDK(options map[string]any) *HypixelSDK
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `"apikey"` | `string` | API key for authentication. |
| `"base"` | `string` | Base URL of the API server. |
| `"prefix"` | `string` | URL path prefix prepended to all requests. |
| `"suffix"` | `string` | URL path suffix appended to all requests. |
| `"feature"` | `map[string]any` | Feature activation flags. |
| `"extend"` | `[]any` | Additional Feature instances to load. |
| `"system"` | `map[string]any` | System overrides (e.g. custom `"fetch"` function). |

### TestSDK

```go
func TestSDK(testopts map[string]any, sdkopts map[string]any) *HypixelSDK
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### HypixelSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `OptionsMap` | `() map[string]any` | Deep copy of current SDK options. |
| `GetUtility` | `() *Utility` | Copy of the SDK utility object. |
| `Prepare` | `(fetchargs map[string]any) (map[string]any, error)` | Build an HTTP request definition without sending. |
| `Direct` | `(fetchargs map[string]any) (map[string]any, error)` | Build and send an HTTP request. |
| `Guild` | `(data map[string]any) HypixelEntity` | Create a Guild entity instance. |
| `Housing` | `(data map[string]any) HypixelEntity` | Create a Housing entity instance. |
| `Other` | `(data map[string]any) HypixelEntity` | Create an Other entity instance. |
| `Player` | `(data map[string]any) HypixelEntity` | Create a Player entity instance. |
| `PlayerData` | `(data map[string]any) HypixelEntity` | Create a PlayerData entity instance. |
| `Resource` | `(data map[string]any) HypixelEntity` | Create a Resource entity instance. |
| `SkyBlock` | `(data map[string]any) HypixelEntity` | Create a SkyBlock entity instance. |

### Entity interface (HypixelEntity)

All entities implement the `HypixelEntity` interface.

| Method | Signature | Description |
| --- | --- | --- |
| `Load` | `(reqmatch, ctrl map[string]any) (any, error)` | Load a single entity by match criteria. |
| `List` | `(reqmatch, ctrl map[string]any) (any, error)` | List entities matching the criteria. |
| `Create` | `(reqdata, ctrl map[string]any) (any, error)` | Create a new entity. |
| `Update` | `(reqdata, ctrl map[string]any) (any, error)` | Update an existing entity. |
| `Remove` | `(reqmatch, ctrl map[string]any) (any, error)` | Remove an entity. |
| `Data` | `(args ...any) any` | Get or set entity data. |
| `Match` | `(args ...any) any` | Get or set entity match criteria. |
| `Make` | `() Entity` | Create a new instance with the same options. |
| `GetName` | `() string` | Return the entity name. |

### Result shape

Entity operations return `(value, error)`. The `value` is the
operation's data **directly** — there is no wrapper:

| Operation | `value` |
| --- | --- |
| `Load` / `Create` / `Update` / `Remove` | the entity record (`map[string]any`) |
| `List` | a `[]any` of entity records |

Check `err` first, then use the value directly (or the typed
`...Typed` variants, which return the entity's model struct and a typed
slice):

    guild, err := client.Guild(nil).Load(map[string]any{"id": "example_id"}, nil)
    if err != nil { /* handle */ }
    // guild is the loaded record

Only `Direct()` returns a response envelope — a `map[string]any` with
`"ok"`, `"status"`, `"headers"`, and `"data"` keys.

### Entities

#### Guild

| Field | Description |
| --- | --- |
| `"guild"` |  |
| `"success"` |  |

Operations: Load.

API path: `/v2/guild`

#### Housing

| Field | Description |
| --- | --- |
| `"house"` |  |
| `"success"` |  |

Operations: List, Load.

API path: `/v2/housing/player`

#### Other

| Field | Description |
| --- | --- |
| `"booster"` |  |
| `"booster_state"` |  |
| `"game"` |  |
| `"leaderboard"` |  |
| `"player_count"` |  |
| `"staff_rolling_daily"` |  |
| `"staff_total"` |  |
| `"success"` |  |
| `"watchdog_last_minute"` |  |
| `"watchdog_rolling_daily"` |  |
| `"watchdog_total"` |  |

Operations: List, Load.

API path: `/v2/boosters`

#### Player

| Field | Description |
| --- | --- |
| `"player"` |  |
| `"success"` |  |

Operations: Load.

API path: `/v2/player`

#### PlayerData

| Field | Description |
| --- | --- |
| `"date"` |  |
| `"ended"` |  |
| `"game_type"` |  |
| `"map"` |  |
| `"mode"` |  |
| `"session"` |  |
| `"success"` |  |
| `"uuid"` |  |

Operations: List, Load.

API path: `/v2/recentgames`

#### Resource

| Field | Description |
| --- | --- |
| `"achievement"` |  |
| `"challenge"` |  |
| `"game"` |  |
| `"last_updated"` |  |
| `"one_time"` |  |
| `"quest"` |  |
| `"rarity"` |  |
| `"success"` |  |
| `"tiered"` |  |
| `"type"` |  |

Operations: Load.

API path: `/v2/resources/achievements`

#### SkyBlock

| Field | Description |
| --- | --- |
| `"auction"` |  |
| `"auctioneer"` |  |
| `"bid"` |  |
| `"category"` |  |
| `"claimed"` |  |
| `"claimed_bidder"` |  |
| `"collection"` |  |
| `"color"` |  |
| `"coop"` |  |
| `"current"` |  |
| `"end"` |  |
| `"event"` |  |
| `"extra"` |  |
| `"full_lore"` |  |
| `"garden"` |  |
| `"highest_bid_amount"` |  |
| `"id"` |  |
| `"item"` |  |
| `"item_byte"` |  |
| `"item_lore"` |  |
| `"item_name"` |  |
| `"last_updated"` |  |
| `"link"` |  |
| `"lore"` |  |
| `"material"` |  |
| `"mayor"` |  |
| `"member"` |  |
| `"name"` |  |
| `"npc_sell_price"` |  |
| `"page"` |  |
| `"product"` |  |
| `"profile"` |  |
| `"profile_id"` |  |
| `"progress"` |  |
| `"required_amount"` |  |
| `"sale"` |  |
| `"skill"` |  |
| `"start"` |  |
| `"starting_bid"` |  |
| `"stat"` |  |
| `"success"` |  |
| `"text"` |  |
| `"tier"` |  |
| `"title"` |  |
| `"total_auction"` |  |
| `"total_page"` |  |
| `"uuid"` |  |
| `"version"` |  |

Operations: List, Load.

API path: `/v2/skyblock/auction`



## Entities


### Guild

Create an instance: `guild := client.Guild(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `guild` | ``$OBJECT`` |  |
| `success` | ``$BOOLEAN`` |  |

#### Example: Load

```go
guild, err := client.Guild(nil).Load(map[string]any{"id": "guild_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(guild) // the loaded record
```


### Housing

Create an instance: `housing := client.Housing(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `house` | ``$OBJECT`` |  |
| `success` | ``$BOOLEAN`` |  |

#### Example: Load

```go
housing, err := client.Housing(nil).Load(map[string]any{"id": "housing_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(housing) // the loaded record
```

#### Example: List

```go
housings, err := client.Housing(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(housings) // the array of records
```


### Other

Create an instance: `other := client.Other(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `booster` | ``$ARRAY`` |  |
| `booster_state` | ``$OBJECT`` |  |
| `game` | ``$OBJECT`` |  |
| `leaderboard` | ``$OBJECT`` |  |
| `player_count` | ``$INTEGER`` |  |
| `staff_rolling_daily` | ``$INTEGER`` |  |
| `staff_total` | ``$INTEGER`` |  |
| `success` | ``$BOOLEAN`` |  |
| `watchdog_last_minute` | ``$INTEGER`` |  |
| `watchdog_rolling_daily` | ``$INTEGER`` |  |
| `watchdog_total` | ``$INTEGER`` |  |

#### Example: Load

```go
other, err := client.Other(nil).Load(map[string]any{"id": "other_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(other) // the loaded record
```

#### Example: List

```go
others, err := client.Other(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(others) // the array of records
```


### Player

Create an instance: `player := client.Player(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `player` | ``$OBJECT`` |  |
| `success` | ``$BOOLEAN`` |  |

#### Example: Load

```go
player, err := client.Player(nil).Load(map[string]any{"id": "player_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(player) // the loaded record
```


### PlayerData

Create an instance: `player_data := client.PlayerData(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `date` | ``$INTEGER`` |  |
| `ended` | ``$INTEGER`` |  |
| `game_type` | ``$STRING`` |  |
| `map` | ``$STRING`` |  |
| `mode` | ``$STRING`` |  |
| `session` | ``$OBJECT`` |  |
| `success` | ``$BOOLEAN`` |  |
| `uuid` | ``$STRING`` |  |

#### Example: Load

```go
player_data, err := client.PlayerData(nil).Load(map[string]any{"id": "player_data_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(player_data) // the loaded record
```

#### Example: List

```go
player_datas, err := client.PlayerData(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(player_datas) // the array of records
```


### Resource

Create an instance: `resource := client.Resource(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `achievement` | ``$OBJECT`` |  |
| `challenge` | ``$OBJECT`` |  |
| `game` | ``$OBJECT`` |  |
| `last_updated` | ``$INTEGER`` |  |
| `one_time` | ``$OBJECT`` |  |
| `quest` | ``$OBJECT`` |  |
| `rarity` | ``$OBJECT`` |  |
| `success` | ``$BOOLEAN`` |  |
| `tiered` | ``$OBJECT`` |  |
| `type` | ``$OBJECT`` |  |

#### Example: Load

```go
resource, err := client.Resource(nil).Load(map[string]any{"id": "resource_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(resource) // the loaded record
```


### SkyBlock

Create an instance: `sky_block := client.SkyBlock(nil)`

#### Operations

| Method | Description |
| --- | --- |
| `List(match, ctrl)` | List entities matching the criteria. |
| `Load(match, ctrl)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `auction` | ``$ARRAY`` |  |
| `auctioneer` | ``$STRING`` |  |
| `bid` | ``$ARRAY`` |  |
| `category` | ``$STRING`` |  |
| `claimed` | ``$BOOLEAN`` |  |
| `claimed_bidder` | ``$ARRAY`` |  |
| `collection` | ``$OBJECT`` |  |
| `color` | ``$STRING`` |  |
| `coop` | ``$ARRAY`` |  |
| `current` | ``$OBJECT`` |  |
| `end` | ``$INTEGER`` |  |
| `event` | ``$ARRAY`` |  |
| `extra` | ``$STRING`` |  |
| `full_lore` | ``$ARRAY`` |  |
| `garden` | ``$OBJECT`` |  |
| `highest_bid_amount` | ``$INTEGER`` |  |
| `id` | ``$STRING`` |  |
| `item` | ``$OBJECT`` |  |
| `item_byte` | ``$OBJECT`` |  |
| `item_lore` | ``$STRING`` |  |
| `item_name` | ``$STRING`` |  |
| `last_updated` | ``$INTEGER`` |  |
| `link` | ``$STRING`` |  |
| `lore` | ``$STRING`` |  |
| `material` | ``$STRING`` |  |
| `mayor` | ``$OBJECT`` |  |
| `member` | ``$OBJECT`` |  |
| `name` | ``$STRING`` |  |
| `npc_sell_price` | ``$NUMBER`` |  |
| `page` | ``$INTEGER`` |  |
| `product` | ``$OBJECT`` |  |
| `profile` | ``$OBJECT`` |  |
| `profile_id` | ``$STRING`` |  |
| `progress` | ``$INTEGER`` |  |
| `required_amount` | ``$INTEGER`` |  |
| `sale` | ``$ARRAY`` |  |
| `skill` | ``$OBJECT`` |  |
| `start` | ``$INTEGER`` |  |
| `starting_bid` | ``$INTEGER`` |  |
| `stat` | ``$OBJECT`` |  |
| `success` | ``$BOOLEAN`` |  |
| `text` | ``$STRING`` |  |
| `tier` | ``$STRING`` |  |
| `title` | ``$STRING`` |  |
| `total_auction` | ``$INTEGER`` |  |
| `total_page` | ``$INTEGER`` |  |
| `uuid` | ``$STRING`` |  |
| `version` | ``$STRING`` |  |

#### Example: Load

```go
sky_block, err := client.SkyBlock(nil).Load(map[string]any{"id": "sky_block_id"}, nil)
if err != nil {
    panic(err)
}
fmt.Println(sky_block) // the loaded record
```

#### Example: List

```go
sky_blocks, err := client.SkyBlock(nil).List(nil, nil)
if err != nil {
    panic(err)
}
fmt.Println(sky_blocks) // the array of records
```


## Explanation

### The operation pipeline

Every entity operation (load, list, create, update, remove) follows a
six-stage pipeline. Each stage fires a feature hook before executing:

```
PrePoint → PreSpec → PreRequest → PreResponse → PreResult → PreDone
```

- **PrePoint**: Resolves which API endpoint to call based on the
  operation name and entity configuration.
- **PreSpec**: Builds the HTTP spec — URL, method, headers, body —
  from the resolved point and the caller's parameters.
- **PreRequest**: Sends the HTTP request. Features can intercept here
  to replace the transport (as TestFeature does with mocks).
- **PreResponse**: Parses the raw HTTP response.
- **PreResult**: Extracts the business data from the parsed response.
- **PreDone**: Final stage before returning to the caller. Entity
  state (match, data) is updated here.

If any stage returns an error, the pipeline short-circuits and the
error is returned to the caller. An unexpected panic triggers the
`PreUnexpected` hook.

### Features and hooks

Features are the extension mechanism. A feature implements the
`Feature` interface and provides hooks — functions keyed by pipeline
stage names.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as maps

The Go SDK uses `map[string]any` throughout rather than typed structs.
This mirrors the dynamic nature of the API and keeps the SDK
flexible — no code generation is needed when the API schema changes.

Use `core.ToMapAny()` to safely cast results and nested data.

### Package structure

```
github.com/voxgig-sdk/hypixel-sdk/go/
├── hypixel.go        # Root package — type aliases and constructors
├── core/               # SDK core — client, types, pipeline
├── entity/             # Entity implementations
├── feature/            # Built-in features (Base, Test, Log)
├── utility/            # Utility functions and struct library
└── test/               # Test suites
```

The root package (`github.com/voxgig-sdk/hypixel-sdk/go`) re-exports everything needed
for normal use. Import sub-packages only when you need specific types
like `core.ToMapAny`.

### Entity state

Entity instances are stateful. After a successful `Load`, the entity
stores the returned data and match criteria internally.

```go
guild := client.Guild(nil)
guild.Load(map[string]any{"id": "example_id"}, nil)

// guild.Data() now returns the loaded guild data
// guild.Match() returns the last match criteria
```

Call `Make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`Direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `Prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
