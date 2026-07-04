# Hypixel Python SDK Reference

Complete API reference for the Hypixel Python SDK.


## HypixelSDK

### Constructor

```python
from hypixel_sdk import HypixelSDK

client = HypixelSDK(options)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `dict` | SDK configuration options. |
| `options["apikey"]` | `str` | API key for authentication. |
| `options["base"]` | `str` | Base URL for API requests. |
| `options["prefix"]` | `str` | URL prefix appended after base. |
| `options["suffix"]` | `str` | URL suffix appended after path. |
| `options["headers"]` | `dict` | Custom headers for all requests. |
| `options["feature"]` | `dict` | Feature configuration. |
| `options["system"]` | `dict` | System overrides (e.g. custom fetch). |


### Static Methods

#### `HypixelSDK.test(testopts=None, sdkopts=None)`

Create a test client with mock features active. Both arguments may be `None`.

```python
client = HypixelSDK.test()
```


### Instance Methods

#### `Guild(data=None)`

Create a new `GuildEntity` instance. Pass `None` for no initial data.

#### `Housing(data=None)`

Create a new `HousingEntity` instance. Pass `None` for no initial data.

#### `Other(data=None)`

Create a new `OtherEntity` instance. Pass `None` for no initial data.

#### `Player(data=None)`

Create a new `PlayerEntity` instance. Pass `None` for no initial data.

#### `PlayerData(data=None)`

Create a new `PlayerDataEntity` instance. Pass `None` for no initial data.

#### `Resource(data=None)`

Create a new `ResourceEntity` instance. Pass `None` for no initial data.

#### `SkyBlock(data=None)`

Create a new `SkyBlockEntity` instance. Pass `None` for no initial data.

#### `options_map() -> dict`

Return a deep copy of the current SDK options.

#### `get_utility() -> Utility`

Return a copy of the SDK utility object.

#### `direct(fetchargs=None) -> dict`

Make a direct HTTP request to any API endpoint. Returns a result `dict` with `ok`, `status`, `headers`, and `data` (or `err` on failure). This escape hatch never raises — branch on `result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs["path"]` | `str` | URL path with optional `{param}` placeholders. |
| `fetchargs["method"]` | `str` | HTTP method (default: `"GET"`). |
| `fetchargs["params"]` | `dict` | Path parameter values. |
| `fetchargs["query"]` | `dict` | Query string parameters. |
| `fetchargs["headers"]` | `dict` | Request headers (merged with defaults). |
| `fetchargs["body"]` | `any` | Request body (dicts are JSON-serialized). |

**Returns:** `result_dict`

#### `prepare(fetchargs=None) -> dict`

Prepare a fetch definition without sending. Returns the `fetchdef` and raises on error.


---

## GuildEntity

```python
guild = client.guild
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `guild` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.guild.load({"id": "guild_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `GuildEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## HousingEntity

```python
housing = client.housing
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `house` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `list(reqmatch, ctrl=None) -> list`

List entities matching the given criteria. Returns a list and raises on error.

```python
results = client.housing.list({})
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.housing.load({"id": "housing_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `HousingEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## OtherEntity

```python
other = client.other
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

#### `list(reqmatch, ctrl=None) -> list`

List entities matching the given criteria. Returns a list and raises on error.

```python
results = client.other.list({})
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.other.load({"id": "other_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `OtherEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PlayerEntity

```python
player = client.player
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `player` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.player.load({"id": "player_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PlayerEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## PlayerDataEntity

```python
player_data = client.player_data
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

#### `list(reqmatch, ctrl=None) -> list`

List entities matching the given criteria. Returns a list and raises on error.

```python
results = client.player_data.list({})
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.player_data.load({"id": "player_data_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `PlayerDataEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## ResourceEntity

```python
resource = client.resource
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

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.resource.load({"id": "resource_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `ResourceEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## SkyBlockEntity

```python
sky_block = client.sky_block
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

#### `list(reqmatch, ctrl=None) -> list`

List entities matching the given criteria. Returns a list and raises on error.

```python
results = client.sky_block.list({})
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.sky_block.load({"id": "sky_block_id"})
```

### Common Methods

#### `data_get() -> dict`

Get the entity data.

#### `data_set(data)`

Set the entity data.

#### `match_get() -> dict`

Get the entity match criteria.

#### `match_set(match)`

Set the entity match criteria.

#### `make() -> Entity`

Create a new `SkyBlockEntity` instance with the same options.

#### `get_name() -> str`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```python
client = HypixelSDK({
    "feature": {
        "test": {"active": True},
    },
})
```

