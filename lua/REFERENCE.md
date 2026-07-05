# Hypixel Lua SDK Reference

Complete API reference for the Hypixel Lua SDK.


## HypixelSDK

### Constructor

```lua
local sdk = require("hypixel_sdk")
local client = sdk.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `table` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `table` | Custom headers for all requests. |
| `options.feature` | `table` | Feature configuration. |
| `options.system` | `table` | System overrides (e.g. custom fetch). |


### Static Methods

#### `sdk.test(testopts?, sdkopts?)`

Create a test client with mock features active. Both arguments are optional.

```lua
local client = sdk.test()
```


### Instance Methods

#### `Guild(data)`

Create a new `Guild` entity instance. Pass `nil` for no initial data.

#### `Housing(data)`

Create a new `Housing` entity instance. Pass `nil` for no initial data.

#### `Other(data)`

Create a new `Other` entity instance. Pass `nil` for no initial data.

#### `Player(data)`

Create a new `Player` entity instance. Pass `nil` for no initial data.

#### `PlayerData(data)`

Create a new `PlayerData` entity instance. Pass `nil` for no initial data.

#### `Resource(data)`

Create a new `Resource` entity instance. Pass `nil` for no initial data.

#### `SkyBlock(data)`

Create a new `SkyBlock` entity instance. Pass `nil` for no initial data.

#### `options_map() -> table`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs) -> table, err`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `"GET"`). |
| `fetchargs.params` | `table` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `table` | Query string parameters. |
| `fetchargs.headers` | `table` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (tables are JSON-serialized). |
| `fetchargs.ctrl` | `table` | Control options (e.g. `{ explain = true }`). |

**Returns:** `table, err`

#### `prepare(fetchargs) -> table, err`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `table, err`


---

## GuildEntity

```lua
local guild = client:Guild(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `guild` | `table` | No |  |
| `success` | `boolean` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Guild():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GuildEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## HousingEntity

```lua
local housing = client:Housing(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `house` | `table` | No |  |
| `success` | `boolean` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Housing():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Housing():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HousingEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## OtherEntity

```lua
local other = client:Other(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `booster` | `table` | No |  |
| `booster_state` | `table` | No |  |
| `game` | `table` | No |  |
| `leaderboard` | `table` | No |  |
| `player_count` | `number` | No |  |
| `staff_rolling_daily` | `number` | No |  |
| `staff_total` | `number` | No |  |
| `success` | `boolean` | No |  |
| `watchdog_last_minute` | `number` | No |  |
| `watchdog_rolling_daily` | `number` | No |  |
| `watchdog_total` | `number` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:Other():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Other():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OtherEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PlayerEntity

```lua
local player = client:Player(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `player` | `table` | No |  |
| `success` | `boolean` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Player():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PlayerEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## PlayerDataEntity

```lua
local player_data = client:PlayerData(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `date` | `number` | No |  |
| `ended` | `number` | No |  |
| `game_type` | `string` | No |  |
| `map` | `string` | No |  |
| `mode` | `string` | No |  |
| `session` | `table` | No |  |
| `success` | `boolean` | No |  |
| `uuid` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:PlayerData():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:PlayerData():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PlayerDataEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## ResourceEntity

```lua
local resource = client:Resource(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `achievement` | `table` | No |  |
| `challenge` | `table` | No |  |
| `game` | `table` | No |  |
| `last_updated` | `number` | No |  |
| `one_time` | `table` | No |  |
| `quest` | `table` | No |  |
| `rarity` | `table` | No |  |
| `success` | `boolean` | No |  |
| `tiered` | `table` | No |  |
| `type` | `table` | No |  |

### Operations

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:Resource():load()
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ResourceEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## SkyBlockEntity

```lua
local sky_block = client:SkyBlock(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `auction` | `table` | No |  |
| `auctioneer` | `string` | No |  |
| `bid` | `table` | No |  |
| `category` | `string` | No |  |
| `claimed` | `boolean` | No |  |
| `claimed_bidder` | `table` | No |  |
| `collection` | `table` | No |  |
| `color` | `string` | No |  |
| `coop` | `table` | No |  |
| `current` | `table` | No |  |
| `end` | `number` | No |  |
| `event` | `table` | No |  |
| `extra` | `string` | No |  |
| `full_lore` | `table` | No |  |
| `garden` | `table` | No |  |
| `highest_bid_amount` | `number` | No |  |
| `id` | `string` | No |  |
| `item` | `table` | No |  |
| `item_byte` | `table` | No |  |
| `item_lore` | `string` | No |  |
| `item_name` | `string` | No |  |
| `last_updated` | `number` | No |  |
| `link` | `string` | No |  |
| `lore` | `string` | No |  |
| `material` | `string` | No |  |
| `mayor` | `table` | No |  |
| `member` | `table` | No |  |
| `name` | `string` | No |  |
| `npc_sell_price` | `number` | No |  |
| `page` | `number` | No |  |
| `product` | `table` | No |  |
| `profile` | `table` | No |  |
| `profile_id` | `string` | No |  |
| `progress` | `number` | No |  |
| `required_amount` | `number` | No |  |
| `sale` | `table` | No |  |
| `skill` | `table` | No |  |
| `start` | `number` | No |  |
| `starting_bid` | `number` | No |  |
| `stat` | `table` | No |  |
| `success` | `boolean` | No |  |
| `text` | `string` | No |  |
| `tier` | `string` | No |  |
| `title` | `string` | No |  |
| `total_auction` | `number` | No |  |
| `total_page` | `number` | No |  |
| `uuid` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `list(reqmatch, ctrl) -> any, err`

List entities matching the given criteria. Returns an array.

```lua
local results, err = client:SkyBlock():list()
```

#### `load(reqmatch, ctrl) -> any, err`

Load a single entity matching the given criteria.

```lua
local result, err = client:SkyBlock():load({ id = "sky_block_id" })
```

### Common Methods

#### `data_get() -> table`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> table`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SkyBlockEntity` instance with the same client and
options.

#### `get_name() -> string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```lua
local client = sdk.new({
  feature = {
    test = { active = true },
  },
})
```

