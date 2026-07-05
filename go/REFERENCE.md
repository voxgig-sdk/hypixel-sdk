# Hypixel Golang SDK Reference

Complete API reference for the Hypixel Golang SDK.


## HypixelSDK

### Constructor

```go
func NewHypixelSDK(options map[string]any) *HypixelSDK
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `map[string]any` | SDK configuration options. |
| `options["apikey"]` | `string` | API key for authentication. |
| `options["base"]` | `string` | Base URL for API requests. |
| `options["prefix"]` | `string` | URL prefix appended after base. |
| `options["suffix"]` | `string` | URL suffix appended after path. |
| `options["headers"]` | `map[string]any` | Custom headers for all requests. |
| `options["feature"]` | `map[string]any` | Feature configuration. |
| `options["system"]` | `map[string]any` | System overrides (e.g. custom fetch). |


### Static Methods

#### `Test() *HypixelSDK`

No-arg convenience constructor for the common no-options test case.

```go
client := sdk.Test()
```

#### `TestSDK(testopts, sdkopts map[string]any) *HypixelSDK`

Test client with options. Both arguments may be `nil`.

```go
client := sdk.TestSDK(testopts, sdkopts)
```


### Instance Methods

#### `Guild(data map[string]any) HypixelEntity`

Create a new `Guild` entity instance. Pass `nil` for no initial data.

#### `Housing(data map[string]any) HypixelEntity`

Create a new `Housing` entity instance. Pass `nil` for no initial data.

#### `Other(data map[string]any) HypixelEntity`

Create a new `Other` entity instance. Pass `nil` for no initial data.

#### `Player(data map[string]any) HypixelEntity`

Create a new `Player` entity instance. Pass `nil` for no initial data.

#### `PlayerData(data map[string]any) HypixelEntity`

Create a new `PlayerData` entity instance. Pass `nil` for no initial data.

#### `Resource(data map[string]any) HypixelEntity`

Create a new `Resource` entity instance. Pass `nil` for no initial data.

#### `SkyBlock(data map[string]any) HypixelEntity`

Create a new `SkyBlock` entity instance. Pass `nil` for no initial data.

#### `OptionsMap() map[string]any`

Return a deep copy of the current SDK options.

#### `GetUtility() *Utility`

Return a copy of the SDK utility object.

#### `Direct(fetchargs map[string]any) (map[string]any, error)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `map[string]any` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `map[string]any` | Query string parameters. |
| `fetchargs["headers"]` | `map[string]any` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (maps are JSON-serialized). |
| `fetchargs["ctrl"]` | `map[string]any` | Control options (e.g. `map[string]any{"explain": true}`). |

**Returns:** `(map[string]any, error)`

#### `Prepare(fetchargs map[string]any) (map[string]any, error)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `Direct()`.

**Returns:** `(map[string]any, error)`


---

## GuildEntity

```go
guild := client.Guild(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `guild` | `map[string]any` | No |  |
| `success` | `bool` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Guild(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `GuildEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## HousingEntity

```go
housing := client.Housing(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `house` | `map[string]any` | No |  |
| `success` | `bool` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Housing(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Housing(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `HousingEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## OtherEntity

```go
other := client.Other(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `booster` | `[]any` | No |  |
| `booster_state` | `map[string]any` | No |  |
| `game` | `map[string]any` | No |  |
| `leaderboard` | `map[string]any` | No |  |
| `player_count` | `int` | No |  |
| `staff_rolling_daily` | `int` | No |  |
| `staff_total` | `int` | No |  |
| `success` | `bool` | No |  |
| `watchdog_last_minute` | `int` | No |  |
| `watchdog_rolling_daily` | `int` | No |  |
| `watchdog_total` | `int` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Other(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Other(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `OtherEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PlayerEntity

```go
player := client.Player(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `player` | `map[string]any` | No |  |
| `success` | `bool` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Player(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PlayerEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## PlayerDataEntity

```go
player_data := client.PlayerData(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `date` | `int` | No |  |
| `ended` | `int` | No |  |
| `game_type` | `string` | No |  |
| `map` | `string` | No |  |
| `mode` | `string` | No |  |
| `session` | `map[string]any` | No |  |
| `success` | `bool` | No |  |
| `uuid` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.PlayerData(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.PlayerData(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `PlayerDataEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## ResourceEntity

```go
resource := client.Resource(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `achievement` | `map[string]any` | No |  |
| `challenge` | `map[string]any` | No |  |
| `game` | `map[string]any` | No |  |
| `last_updated` | `int` | No |  |
| `one_time` | `map[string]any` | No |  |
| `quest` | `map[string]any` | No |  |
| `rarity` | `map[string]any` | No |  |
| `success` | `bool` | No |  |
| `tiered` | `map[string]any` | No |  |
| `type` | `map[string]any` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Resource(nil).Load(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `ResourceEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## SkyBlockEntity

```go
sky_block := client.SkyBlock(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `auction` | `[]any` | No |  |
| `auctioneer` | `string` | No |  |
| `bid` | `[]any` | No |  |
| `category` | `string` | No |  |
| `claimed` | `bool` | No |  |
| `claimed_bidder` | `[]any` | No |  |
| `collection` | `map[string]any` | No |  |
| `color` | `string` | No |  |
| `coop` | `[]any` | No |  |
| `current` | `map[string]any` | No |  |
| `end` | `int` | No |  |
| `event` | `[]any` | No |  |
| `extra` | `string` | No |  |
| `full_lore` | `[]any` | No |  |
| `garden` | `map[string]any` | No |  |
| `highest_bid_amount` | `int` | No |  |
| `id` | `string` | No |  |
| `item` | `map[string]any` | No |  |
| `item_byte` | `map[string]any` | No |  |
| `item_lore` | `string` | No |  |
| `item_name` | `string` | No |  |
| `last_updated` | `int` | No |  |
| `link` | `string` | No |  |
| `lore` | `string` | No |  |
| `material` | `string` | No |  |
| `mayor` | `map[string]any` | No |  |
| `member` | `map[string]any` | No |  |
| `name` | `string` | No |  |
| `npc_sell_price` | `float64` | No |  |
| `page` | `int` | No |  |
| `product` | `map[string]any` | No |  |
| `profile` | `map[string]any` | No |  |
| `profile_id` | `string` | No |  |
| `progress` | `int` | No |  |
| `required_amount` | `int` | No |  |
| `sale` | `[]any` | No |  |
| `skill` | `map[string]any` | No |  |
| `start` | `int` | No |  |
| `starting_bid` | `int` | No |  |
| `stat` | `map[string]any` | No |  |
| `success` | `bool` | No |  |
| `text` | `string` | No |  |
| `tier` | `string` | No |  |
| `title` | `string` | No |  |
| `total_auction` | `int` | No |  |
| `total_page` | `int` | No |  |
| `uuid` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.SkyBlock(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.SkyBlock(nil).Load(map[string]any{"id": "sky_block_id"}, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `SkyBlockEntity` instance with the same client and
options.

#### `GetName() string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```go
client := sdk.NewHypixelSDK(map[string]any{
    "feature": map[string]any{
        "test": map[string]any{"active": true},
    },
})
```

