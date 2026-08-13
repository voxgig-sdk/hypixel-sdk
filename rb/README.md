# Hypixel Ruby SDK



The Ruby SDK for the Hypixel API — an entity-oriented client using idiomatic Ruby conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `client.Guild` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to RubyGems. Install it from the
GitHub release tag (`rb/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/hypixel-sdk/releases](https://github.com/voxgig-sdk/hypixel-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ruby
require_relative "Hypixel_sdk"

client = HypixelSDK.new({
  "apikey" => ENV["HYPIXEL_APIKEY"],
})
```

### 3. Load a guild

```ruby
begin
  # load returns the ENTITY — call data_get for the Guild record (raises on error).
  guild = client.Guild.load()
  puts guild
rescue => err
  warn "load failed: #{err}"
end
```


## Error handling

Entity operations raise on failure, so rescue them:

```ruby
begin
  others = client.Other.list()
rescue => err
  warn "list failed: #{err}"
end
```

`direct` does **not** raise — it returns the result hash. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example_id" },
})

warn "request failed: #{result["err"] || "HTTP #{result["status"]}"}" unless result["ok"]
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ruby
result = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})

if result["ok"]
  puts result["status"]  # 200
  puts result["data"]    # response body
else
  # On an HTTP error status there is no err (only a transport failure sets
  # it), so fall back to the status code.
  warn(result["err"] || "HTTP #{result["status"]}")
end
```

### Prepare a request without sending it

```ruby
begin
  fetchdef = client.prepare({
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => { "id" => "example" },
  })
  puts fetchdef["url"]
  puts fetchdef["method"]
  puts fetchdef["headers"]
rescue => err
  warn "prepare failed: #{err}"
end
```

### Use test mode

Create a mock client for unit testing — no server required:

```ruby
client = HypixelSDK.test

# Entity ops return the ENTITY (raises on error);
# call data_get for the mock record.
other = client.Other.list()
puts other
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```ruby
mock_fetch = ->(url, init) {
  return {
    "status" => 200,
    "statusText" => "OK",
    "headers" => {},
    "json" => ->() { { "id" => "mock01" } },
  }, nil
}

client = HypixelSDK.new({
  "base" => "http://localhost:8080",
  "system" => {
    "fetch" => mock_fetch,
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
cd rb && ruby -Itest -e "Dir['test/*_test.rb'].each { |f| require_relative f }"
```


## Reference

### HypixelSDK

```ruby
require_relative "Hypixel_sdk"
client = HypixelSDK.new(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `String` | API key for authentication. |
| `base` | `String` | Base URL of the API server. |
| `prefix` | `String` | URL path prefix prepended to all requests. |
| `suffix` | `String` | URL path suffix appended to all requests. |
| `feature` | `Hash` | Feature activation flags. |
| `extend` | `Hash` | Additional Feature instances to load. |
| `system` | `Hash` | System overrides (e.g. custom `fetch` lambda). |

### test

```ruby
client = HypixelSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `nil`.

### HypixelSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> Hash` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> Hash` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> Hash` | Build and send an HTTP request. Returns a result hash (`result["ok"]`); does not raise. |
| `Guild` | `(data) -> GuildEntity` | Create a Guild entity instance. |
| `Housing` | `(data) -> HousingEntity` | Create a Housing entity instance. |
| `Other` | `(data) -> OtherEntity` | Create an Other entity instance. |
| `Player` | `(data) -> PlayerEntity` | Create a Player entity instance. |
| `PlayerData` | `(data) -> PlayerDataEntity` | Create a PlayerData entity instance. |
| `Resource` | `(data) -> ResourceEntity` | Create a Resource entity instance. |
| `SkyBlock` | `(data) -> SkyBlockEntity` | Create a SkyBlock entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `(reqmatch, ctrl) -> any` | Load a single entity by match criteria. Raises on error. |
| `list` | `(reqmatch = nil, ctrl) -> Array` | List entities matching the criteria (call with no argument to list all). Raises on error. |
| `data_get` | `() -> Hash` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> Hash` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> String` | Return the entity name. |

### Result shape

Entity operations return the result data directly. On failure they
raise a `HypixelError` (a `StandardError` subclass), so wrap
calls in `begin`/`rescue` where you need to handle errors.

The `direct` escape hatch is the exception: it never raises and instead
returns a result `Hash` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `Boolean` | `true` if the HTTP status is 2xx. |
| `status` | `Integer` | HTTP status code. |
| `headers` | `Hash` | Response headers. |
| `data` | `any` | Parsed JSON response body. |
| `err` | `Error` | Present when `ok` is `false`. |

### Entities

#### Guild

| Field | Description |
| --- | --- |

Operations: Load.

API path: `/v2/guild`

#### Housing

| Field | Description |
| --- | --- |
| `houses` |  |
| `success` |  |

Operations: List, Load.

API path: `/v2/housing/player`

#### Other

| Field | Description |
| --- | --- |
| `boosterState` |  |
| `boosters` |  |
| `staff_rollingDaily` |  |
| `staff_total` |  |
| `success` |  |
| `watchdog_lastMinute` |  |
| `watchdog_rollingDaily` |  |
| `watchdog_total` |  |

Operations: List, Load.

API path: `/v2/boosters`

#### Player

| Field | Description |
| --- | --- |
| `displayname` |  |
| `firstLogin` |  |
| `lastLogin` |  |
| `lastLogout` |  |
| `monthlyPackageRank` |  |
| `newPackageRank` |  |
| `packageRank` |  |
| `rank` |  |
| `stats` |  |
| `uuid` |  |

Operations: Load.

API path: `/v2/player`

#### PlayerData

| Field | Description |
| --- | --- |
| `date` |  |
| `ended` |  |
| `gameType` |  |
| `map` |  |
| `mode` |  |
| `online` |  |

Operations: List, Load.

API path: `/v2/recentgames`

#### Resource

| Field | Description |
| --- | --- |
| `databaseName` |  |
| `id` |  |
| `lastUpdated` |  |
| `modeNames` |  |
| `name` |  |
| `one_time` |  |
| `rarities` |  |
| `success` |  |
| `tiered` |  |
| `types` |  |

Operations: Load.

API path: `/v2/resources/achievements`

#### SkyBlock

| Field | Description |
| --- | --- |
| `auctioneer` |  |
| `auctions` |  |
| `bids` |  |
| `category` |  |
| `claimed` |  |
| `claimed_bidders` |  |
| `color` |  |
| `coop` |  |
| `current` |  |
| `end` |  |
| `events` |  |
| `extra` |  |
| `fullLore` |  |
| `highest_bid_amount` |  |
| `id` |  |
| `item` |  |
| `item_bytes` |  |
| `item_lore` |  |
| `item_name` |  |
| `lastUpdated` |  |
| `link` |  |
| `lore` |  |
| `material` |  |
| `mayor` |  |
| `name` |  |
| `npc_sell_price` |  |
| `page` |  |
| `profile_id` |  |
| `profiles` |  |
| `progress` |  |
| `requiredAmount` |  |
| `sales` |  |
| `start` |  |
| `starting_bid` |  |
| `stats` |  |
| `success` |  |
| `text` |  |
| `tier` |  |
| `tiers` |  |
| `title` |  |
| `totalAuctions` |  |
| `totalPages` |  |
| `uuid` |  |

Operations: List, Load.

API path: `/v2/skyblock/auction`



## Entities


### Guild

Create an instance: `guild = client.Guild`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Guild record (raises on error).
guild = client.Guild.load()
```


### Housing

Create an instance: `housing = client.Housing`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `houses` | `Array` |  |
| `success` | `Boolean` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Housing record (raises on error).
housing = client.Housing.load()
```

#### Example: List

```ruby
# list returns an Array of Housing records (raises on error).
housings = client.Housing.list
```


### Other

Create an instance: `other = client.Other`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `boosterState` | `Hash` |  |
| `boosters` | `Array` |  |
| `staff_rollingDaily` | `Integer` |  |
| `staff_total` | `Integer` |  |
| `success` | `Boolean` |  |
| `watchdog_lastMinute` | `Integer` |  |
| `watchdog_rollingDaily` | `Integer` |  |
| `watchdog_total` | `Integer` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Other record (raises on error).
other = client.Other.load()
```

#### Example: List

```ruby
# list returns an Array of Other records (raises on error).
others = client.Other.list
```


### Player

Create an instance: `player = client.Player`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `displayname` | `String` |  |
| `firstLogin` | `Integer` |  |
| `lastLogin` | `Integer` |  |
| `lastLogout` | `Integer` |  |
| `monthlyPackageRank` | `String` |  |
| `newPackageRank` | `String` |  |
| `packageRank` | `String` |  |
| `rank` | `String` |  |
| `stats` | `Hash` |  |
| `uuid` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Player record (raises on error).
player = client.Player.load()
```


### PlayerData

Create an instance: `player_data = client.PlayerData`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `date` | `Integer` |  |
| `ended` | `Integer` |  |
| `gameType` | `String` |  |
| `map` | `String` |  |
| `mode` | `String` |  |
| `online` | `Boolean` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the PlayerData record (raises on error).
player_data = client.PlayerData.load()
```

#### Example: List

```ruby
# list returns an Array of PlayerData records (raises on error).
player_datas = client.PlayerData.list
```


### Resource

Create an instance: `resource = client.Resource`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `databaseName` | `String` |  |
| `id` | `Integer` |  |
| `lastUpdated` | `Integer` |  |
| `modeNames` | `Hash` |  |
| `name` | `String` |  |
| `one_time` | `Hash` |  |
| `rarities` | `Hash` |  |
| `success` | `Boolean` |  |
| `tiered` | `Hash` |  |
| `types` | `Hash` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the Resource record (raises on error).
resource = client.Resource.load({ "id" => 1 })
```


### SkyBlock

Create an instance: `sky_block = client.SkyBlock`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `auctioneer` | `String` |  |
| `auctions` | `Array` |  |
| `bids` | `Array` |  |
| `category` | `String` |  |
| `claimed` | `Boolean` |  |
| `claimed_bidders` | `Array` |  |
| `color` | `String` |  |
| `coop` | `Array` |  |
| `current` | `Hash` |  |
| `end` | `Integer` |  |
| `events` | `Array` |  |
| `extra` | `String` |  |
| `fullLore` | `Array` |  |
| `highest_bid_amount` | `Integer` |  |
| `id` | `String` |  |
| `item` | `Hash` |  |
| `item_bytes` | `Hash` |  |
| `item_lore` | `String` |  |
| `item_name` | `String` |  |
| `lastUpdated` | `Integer` |  |
| `link` | `String` |  |
| `lore` | `String` |  |
| `material` | `String` |  |
| `mayor` | `Hash` |  |
| `name` | `String` |  |
| `npc_sell_price` | `Float` |  |
| `page` | `Integer` |  |
| `profile_id` | `String` |  |
| `profiles` | `Array` |  |
| `progress` | `Integer` |  |
| `requiredAmount` | `Integer` |  |
| `sales` | `Array` |  |
| `start` | `Integer` |  |
| `starting_bid` | `Integer` |  |
| `stats` | `Hash` |  |
| `success` | `Boolean` |  |
| `text` | `String` |  |
| `tier` | `String` |  |
| `tiers` | `Array` |  |
| `title` | `String` |  |
| `totalAuctions` | `Integer` |  |
| `totalPages` | `Integer` |  |
| `uuid` | `String` |  |

#### Example: Load

```ruby
# load returns the ENTITY — call data_get for the SkyBlock record (raises on error).
sky_block = client.SkyBlock.load({ "id" => "sky_block_id" })
```

#### Example: List

```ruby
# list returns an Array of SkyBlock records (raises on error).
sky_blocks = client.SkyBlock.list
```


## Advanced

> The sections above cover everyday use. The material below explains the
> SDK's internals — useful when extending it with custom features, but not
> needed for normal use.

### The operation pipeline

Every entity operation follows a six-stage pipeline. Each stage fires a
feature hook before executing:

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

If any stage errors, the pipeline short-circuits and the error surfaces
to the caller — see [Error handling](#error-handling) for how that looks
in this language.

### Features and hooks

Features are the extension mechanism. A feature is a Ruby class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as hashes

The Ruby SDK uses plain Ruby hashes throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers.to_map()` to safely validate that a value is a hash.

### Module structure

```
rb/
├── Hypixel_sdk.rb       -- Main SDK module
├── config.rb                  -- Configuration
├── features.rb                -- Feature factory
├── core/                      -- Core types and context
├── entity/                    -- Entity implementations
├── feature/                   -- Built-in features (Base, Test, Log)
├── utility/                   -- Utility functions and struct library
└── test/                      -- Test suites
```

The main module (`Hypixel_sdk`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally.

```ruby
other = client.Other
other.list()

# other.data_get now returns the other data from the last list
# other.match_get returns the last match criteria
```

Call `make` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
