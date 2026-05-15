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

#### `TestSDK(testopts, sdkopts map[string]any) *HypixelSDK`

Create a test client with mock features active. Both arguments may be `nil`.

```go
client := sdk.TestSDK(nil, nil)
```


### Instance Methods

#### `Guild(data map[string]any) HypixelEntity`

Create a new `Guild` entity instance. Pass `nil` for no initial data.

#### `Hous(data map[string]any) HypixelEntity`

Create a new `Hous` entity instance. Pass `nil` for no initial data.

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
| `guild` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Guild(nil).Load(map[string]any{"id": "guild_id"}, nil)
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

## HousEntity

```go
hous := client.Hous(nil)
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `hous` | ``$ARRAY`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Hous(nil).List(nil, nil)
```

### Common Methods

#### `Data(args ...any) any`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `Match(args ...any) any`

Get or set the entity match criteria. Works the same as `Data()`.

#### `Make() Entity`

Create a new `HousEntity` instance with the same client and
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
| `hous` | ``$ARRAY`` | No |  |
| `houses` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Housing(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Housing(nil).Load(map[string]any{"id": "housing_id"}, nil)
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

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.Other(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Other(nil).Load(map[string]any{"id": "other_id"}, nil)
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
| `player` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Player(nil).Load(map[string]any{"id": "player_id"}, nil)
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
| `date` | ``$INTEGER`` | No |  |
| `ended` | ``$INTEGER`` | No |  |
| `game_type` | ``$STRING`` | No |  |
| `map` | ``$STRING`` | No |  |
| `mode` | ``$STRING`` | No |  |
| `session` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |
| `uuid` | ``$STRING`` | No |  |

### Operations

#### `List(reqmatch, ctrl map[string]any) (any, error)`

List entities matching the given criteria. Returns an array.

```go
results, err := client.PlayerData(nil).List(nil, nil)
```

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.PlayerData(nil).Load(map[string]any{"id": "player_data_id"}, nil)
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

#### `Load(reqmatch, ctrl map[string]any) (any, error)`

Load a single entity matching the given criteria.

```go
result, err := client.Resource(nil).Load(map[string]any{"id": "resource_id"}, nil)
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

