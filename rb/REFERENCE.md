# Hypixel Ruby SDK Reference

Complete API reference for the Hypixel Ruby SDK.


## HypixelSDK

### Constructor

```ruby
require_relative 'Hypixel_sdk'

client = HypixelSDK.new(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `Hash` | SDK configuration options. |
| `options["apikey"]` | `String` | API key for authentication. |
| `options["base"]` | `String` | Base URL for API requests. |
| `options["prefix"]` | `String` | URL prefix appended after base. |
| `options["suffix"]` | `String` | URL suffix appended after path. |
| `options["headers"]` | `Hash` | Custom headers for all requests. |
| `options["feature"]` | `Hash` | Feature configuration. |
| `options["system"]` | `Hash` | System overrides (e.g. custom fetch). |


### Static Methods

#### `HypixelSDK.test(testopts = nil, sdkopts = nil)`

Create a test client with mock features active. Both arguments may be `nil`.

```ruby
client = HypixelSDK.test
```


### Instance Methods

#### `Guild(data = nil)`

Create a new `Guild` entity instance. Pass `nil` for no initial data.

#### `Housing(data = nil)`

Create a new `Housing` entity instance. Pass `nil` for no initial data.

#### `Other(data = nil)`

Create a new `Other` entity instance. Pass `nil` for no initial data.

#### `Player(data = nil)`

Create a new `Player` entity instance. Pass `nil` for no initial data.

#### `PlayerData(data = nil)`

Create a new `PlayerData` entity instance. Pass `nil` for no initial data.

#### `Resource(data = nil)`

Create a new `Resource` entity instance. Pass `nil` for no initial data.

#### `SkyBlock(data = nil)`

Create a new `SkyBlock` entity instance. Pass `nil` for no initial data.

#### `options_map -> Hash`

Return a deep copy of the current SDK options.

#### `get_utility -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs = {}) -> Hash`

Make a direct HTTP request to any API endpoint. Returns a result hash
(`{ "ok" => ..., "status" => ..., "data" => ..., "err" => ... }`); it
does not raise — inspect `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `String` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `String` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `Hash` | Path parameter values for `{param}` substitution. |
| `fetchargs["query"]` | `Hash` | Query string parameters. |
| `fetchargs["headers"]` | `Hash` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (hashes are JSON-serialized). |
| `fetchargs["ctrl"]` | `Hash` | Control options (e.g. `{ "explain" => true }`). |

**Returns:** `Hash`

#### `prepare(fetchargs = {}) -> Hash`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`. Raises on error.

**Returns:** `Hash` (the fetch definition; raises on error)


---

## GuildEntity

```ruby
guild = client.Guild
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `guild` | `Hash` | No |  |
| `success` | `Boolean` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Guild.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `GuildEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## HousingEntity

```ruby
housing = client.Housing
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `house` | `Hash` | No |  |
| `success` | `Boolean` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Housing.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Housing.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `HousingEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## OtherEntity

```ruby
other = client.Other
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `booster` | `Array` | No |  |
| `booster_state` | `Hash` | No |  |
| `game` | `Hash` | No |  |
| `leaderboard` | `Hash` | No |  |
| `player_count` | `Integer` | No |  |
| `staff_rolling_daily` | `Integer` | No |  |
| `staff_total` | `Integer` | No |  |
| `success` | `Boolean` | No |  |
| `watchdog_last_minute` | `Integer` | No |  |
| `watchdog_rolling_daily` | `Integer` | No |  |
| `watchdog_total` | `Integer` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.Other.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Other.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `OtherEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PlayerEntity

```ruby
player = client.Player
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `player` | `Hash` | No |  |
| `success` | `Boolean` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Player.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PlayerEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## PlayerDataEntity

```ruby
player_data = client.PlayerData
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `date` | `Integer` | No |  |
| `ended` | `Integer` | No |  |
| `game_type` | `String` | No |  |
| `map` | `String` | No |  |
| `mode` | `String` | No |  |
| `session` | `Hash` | No |  |
| `success` | `Boolean` | No |  |
| `uuid` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.PlayerData.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.PlayerData.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `PlayerDataEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## ResourceEntity

```ruby
resource = client.Resource
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `achievement` | `Hash` | No |  |
| `challenge` | `Hash` | No |  |
| `game` | `Hash` | No |  |
| `last_updated` | `Integer` | No |  |
| `one_time` | `Hash` | No |  |
| `quest` | `Hash` | No |  |
| `rarity` | `Hash` | No |  |
| `success` | `Boolean` | No |  |
| `tiered` | `Hash` | No |  |
| `type` | `Hash` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Resource.load()
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `ResourceEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## SkyBlockEntity

```ruby
sky_block = client.SkyBlock
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `auction` | `Array` | No |  |
| `auctioneer` | `String` | No |  |
| `bid` | `Array` | No |  |
| `category` | `String` | No |  |
| `claimed` | `Boolean` | No |  |
| `claimed_bidder` | `Array` | No |  |
| `collection` | `Hash` | No |  |
| `color` | `String` | No |  |
| `coop` | `Array` | No |  |
| `current` | `Hash` | No |  |
| `end` | `Integer` | No |  |
| `event` | `Array` | No |  |
| `extra` | `String` | No |  |
| `full_lore` | `Array` | No |  |
| `garden` | `Hash` | No |  |
| `highest_bid_amount` | `Integer` | No |  |
| `id` | `String` | No |  |
| `item` | `Hash` | No |  |
| `item_byte` | `Hash` | No |  |
| `item_lore` | `String` | No |  |
| `item_name` | `String` | No |  |
| `last_updated` | `Integer` | No |  |
| `link` | `String` | No |  |
| `lore` | `String` | No |  |
| `material` | `String` | No |  |
| `mayor` | `Hash` | No |  |
| `member` | `Hash` | No |  |
| `name` | `String` | No |  |
| `npc_sell_price` | `Float` | No |  |
| `page` | `Integer` | No |  |
| `product` | `Hash` | No |  |
| `profile` | `Hash` | No |  |
| `profile_id` | `String` | No |  |
| `progress` | `Integer` | No |  |
| `required_amount` | `Integer` | No |  |
| `sale` | `Array` | No |  |
| `skill` | `Hash` | No |  |
| `start` | `Integer` | No |  |
| `starting_bid` | `Integer` | No |  |
| `stat` | `Hash` | No |  |
| `success` | `Boolean` | No |  |
| `text` | `String` | No |  |
| `tier` | `String` | No |  |
| `title` | `String` | No |  |
| `total_auction` | `Integer` | No |  |
| `total_page` | `Integer` | No |  |
| `uuid` | `String` | No |  |
| `version` | `String` | No |  |

### Operations

#### `list(reqmatch = nil, ctrl = nil) -> Array`

List entities matching the given criteria (call with no argument to list all). Returns an array. Raises on error.

```ruby
results = client.SkyBlock.list
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.SkyBlock.load({ "id" => "sky_block_id" })
```

### Common Methods

#### `data_get -> Hash`

Get the entity data. Returns a copy of the current data.

#### `data_set(data)`

Set the entity data.

#### `match_get -> Hash`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make -> Entity`

Create a new `SkyBlockEntity` instance with the same client and
options.

#### `get_name -> String`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ruby
client = HypixelSDK.new({
  "feature" => {
    "test" => { "active" => true },
  },
})
```

