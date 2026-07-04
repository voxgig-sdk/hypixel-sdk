# Hypixel Ruby SDK Reference

Complete API reference for the Hypixel Ruby SDK.


## HypixelSDK

### Constructor

```ruby
require_relative 'hypixel_sdk'

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
| `guild` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Guild.load({ "id" => "guild_id" })
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
| `house` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.Housing.list(nil)
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Housing.load({ "id" => "housing_id" })
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
| `booster` | ``$ARRAY`` | No |  |
| `booster_state` | ``$OBJECT`` | No |  |
| `game` | ``$OBJECT`` | No |  |
| `leaderboard` | ``$OBJECT`` | No |  |
| `player_count` | ``$INTEGER`` | No |  |
| `staff_rolling_daily` | ``$INTEGER`` | No |  |
| `staff_total` | ``$INTEGER`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |
| `watchdog_last_minute` | ``$INTEGER`` | No |  |
| `watchdog_rolling_daily` | ``$INTEGER`` | No |  |
| `watchdog_total` | ``$INTEGER`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.Other.list(nil)
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Other.load({ "id" => "other_id" })
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
| `player` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Player.load({ "id" => "player_id" })
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
| `date` | ``$INTEGER`` | No |  |
| `ended` | ``$INTEGER`` | No |  |
| `game_type` | ``$STRING`` | No |  |
| `map` | ``$STRING`` | No |  |
| `mode` | ``$STRING`` | No |  |
| `session` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |
| `uuid` | ``$STRING`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.PlayerData.list(nil)
```

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.PlayerData.load({ "id" => "player_data_id" })
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
| `achievement` | ``$OBJECT`` | No |  |
| `challenge` | ``$OBJECT`` | No |  |
| `game` | ``$OBJECT`` | No |  |
| `last_updated` | ``$INTEGER`` | No |  |
| `one_time` | ``$OBJECT`` | No |  |
| `quest` | ``$OBJECT`` | No |  |
| `rarity` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |
| `tiered` | ``$OBJECT`` | No |  |
| `type` | ``$OBJECT`` | No |  |

### Operations

#### `load(reqmatch, ctrl = nil) -> result`

Load a single entity matching the given criteria. Raises on error.

```ruby
result = client.Resource.load({ "id" => "resource_id" })
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
| `auction` | ``$ARRAY`` | No |  |
| `auctioneer` | ``$STRING`` | No |  |
| `bid` | ``$ARRAY`` | No |  |
| `category` | ``$STRING`` | No |  |
| `claimed` | ``$BOOLEAN`` | No |  |
| `claimed_bidder` | ``$ARRAY`` | No |  |
| `collection` | ``$OBJECT`` | No |  |
| `color` | ``$STRING`` | No |  |
| `coop` | ``$ARRAY`` | No |  |
| `current` | ``$OBJECT`` | No |  |
| `end` | ``$INTEGER`` | No |  |
| `event` | ``$ARRAY`` | No |  |
| `extra` | ``$STRING`` | No |  |
| `full_lore` | ``$ARRAY`` | No |  |
| `garden` | ``$OBJECT`` | No |  |
| `highest_bid_amount` | ``$INTEGER`` | No |  |
| `id` | ``$STRING`` | No |  |
| `item` | ``$OBJECT`` | No |  |
| `item_byte` | ``$OBJECT`` | No |  |
| `item_lore` | ``$STRING`` | No |  |
| `item_name` | ``$STRING`` | No |  |
| `last_updated` | ``$INTEGER`` | No |  |
| `link` | ``$STRING`` | No |  |
| `lore` | ``$STRING`` | No |  |
| `material` | ``$STRING`` | No |  |
| `mayor` | ``$OBJECT`` | No |  |
| `member` | ``$OBJECT`` | No |  |
| `name` | ``$STRING`` | No |  |
| `npc_sell_price` | ``$NUMBER`` | No |  |
| `page` | ``$INTEGER`` | No |  |
| `product` | ``$OBJECT`` | No |  |
| `profile` | ``$OBJECT`` | No |  |
| `profile_id` | ``$STRING`` | No |  |
| `progress` | ``$INTEGER`` | No |  |
| `required_amount` | ``$INTEGER`` | No |  |
| `sale` | ``$ARRAY`` | No |  |
| `skill` | ``$OBJECT`` | No |  |
| `start` | ``$INTEGER`` | No |  |
| `starting_bid` | ``$INTEGER`` | No |  |
| `stat` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |
| `text` | ``$STRING`` | No |  |
| `tier` | ``$STRING`` | No |  |
| `title` | ``$STRING`` | No |  |
| `total_auction` | ``$INTEGER`` | No |  |
| `total_page` | ``$INTEGER`` | No |  |
| `uuid` | ``$STRING`` | No |  |
| `version` | ``$STRING`` | No |  |

### Operations

#### `list(reqmatch, ctrl = nil) -> Array`

List entities matching the given criteria. Returns an array. Raises on error.

```ruby
results = client.SkyBlock.list(nil)
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

