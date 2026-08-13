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
guild = client.Guild()
```

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Guild().load()
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
housing = client.Housing()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `houses` | `list` | No |  |
| `success` | `bool` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Housing().list()
for housing in results:
    print(housing)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Housing().load()
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
other = client.Other()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `boosterState` | `dict` | No |  |
| `boosters` | `list` | No |  |
| `staff_rollingDaily` | `int` | No |  |
| `staff_total` | `int` | No |  |
| `success` | `bool` | No |  |
| `watchdog_lastMinute` | `int` | No |  |
| `watchdog_rollingDaily` | `int` | No |  |
| `watchdog_total` | `int` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.Other().list()
for other in results:
    print(other)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Other().load()
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
player = client.Player()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `displayname` | `str` | No |  |
| `firstLogin` | `int` | No |  |
| `lastLogin` | `int` | No |  |
| `lastLogout` | `int` | No |  |
| `monthlyPackageRank` | `str` | No |  |
| `newPackageRank` | `str` | No |  |
| `packageRank` | `str` | No |  |
| `rank` | `str` | No |  |
| `stats` | `dict` | No |  |
| `uuid` | `str` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Player().load()
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
player_data = client.PlayerData()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `date` | `int` | No |  |
| `ended` | `int` | No |  |
| `gameType` | `str` | No |  |
| `map` | `str` | No |  |
| `mode` | `str` | No |  |
| `online` | `bool` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.PlayerData().list()
for player_data in results:
    print(player_data)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.PlayerData().load()
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
resource = client.Resource()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `databaseName` | `str` | No |  |
| `id` | `int` | No |  |
| `lastUpdated` | `int` | No |  |
| `modeNames` | `dict` | No |  |
| `name` | `str` | No |  |
| `one_time` | `dict` | No |  |
| `rarities` | `dict` | No |  |
| `success` | `bool` | No |  |
| `tiered` | `dict` | No |  |
| `types` | `dict` | No |  |

### Operations

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.Resource().load({"id": 1})
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
sky_block = client.SkyBlock()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `auctioneer` | `str` | No |  |
| `auctions` | `list` | No |  |
| `bids` | `list` | No |  |
| `category` | `str` | No |  |
| `claimed` | `bool` | No |  |
| `claimed_bidders` | `list` | No |  |
| `color` | `str` | No |  |
| `coop` | `list` | No |  |
| `current` | `dict` | No |  |
| `end` | `int` | No |  |
| `events` | `list` | No |  |
| `extra` | `str` | No |  |
| `fullLore` | `list` | No |  |
| `highest_bid_amount` | `int` | No |  |
| `id` | `str` | No |  |
| `item` | `dict` | No |  |
| `item_bytes` | `dict` | No |  |
| `item_lore` | `str` | No |  |
| `item_name` | `str` | No |  |
| `lastUpdated` | `int` | No |  |
| `link` | `str` | No |  |
| `lore` | `str` | No |  |
| `material` | `str` | No |  |
| `mayor` | `dict` | No |  |
| `name` | `str` | No |  |
| `npc_sell_price` | `float` | No |  |
| `page` | `int` | No |  |
| `profile_id` | `str` | No |  |
| `profiles` | `list` | No |  |
| `progress` | `int` | No |  |
| `requiredAmount` | `int` | No |  |
| `sales` | `list` | No |  |
| `start` | `int` | No |  |
| `starting_bid` | `int` | No |  |
| `stats` | `dict` | No |  |
| `success` | `bool` | No |  |
| `text` | `str` | No |  |
| `tier` | `str` | No |  |
| `tiers` | `list` | No |  |
| `title` | `str` | No |  |
| `totalAuctions` | `int` | No |  |
| `totalPages` | `int` | No |  |
| `uuid` | `str` | No |  |

### Operations

#### `list(reqmatch=None, ctrl=None) -> list`

List entities matching the given criteria. The match is optional — call `list()` with no argument to list all records. Returns a list and raises on error.

```python
results = client.SkyBlock().list()
for sky_block in results:
    print(sky_block)
```

#### `load(reqmatch, ctrl=None) -> dict`

Load a single entity matching the given criteria. Returns the entity data and raises on error.

```python
result = client.SkyBlock().load({"id": "sky_block_id"})
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

