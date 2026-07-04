# Hypixel Python SDK



The Python SDK for the Hypixel API — an entity-oriented client following Pythonic conventions.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to PyPI. Install it from the GitHub
release tag (`py/vX.Y.Z`, see [Releases](https://github.com/voxgig-sdk/hypixel-sdk/releases)) or
from a source checkout:

```bash
pip install -e .
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```python
import os
from hypixel_sdk import HypixelSDK

client = HypixelSDK({
    "apikey": os.environ.get("HYPIXEL_APIKEY"),
})
```

### 3. Load a guild

`load()` returns the bare record (a `dict`) and raises on error.

```python
try:
    guild = client.Guild().load({"id": "example_id"})
    print(guild)
except Exception as err:
    print(f"load failed: {err}")
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```python
result = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})

if result["ok"]:
    print(result["status"])  # 200
    print(result["data"])    # response body
else:
    print(result["err"])     # error value
```

### Prepare a request without sending it

```python
# prepare() returns the fetch definition and raises on error.
fetchdef = client.prepare({
    "path": "/api/resource/{id}",
    "method": "DELETE",
    "params": {"id": "example"},
})

print(fetchdef["url"])
print(fetchdef["method"])
print(fetchdef["headers"])
```

### Use test mode

Create a mock client for unit testing — no server required:

```python
client = HypixelSDK.test()

# Entity ops return the bare record and raise on error.
guild = client.Guild().load({"id": "test01"})
# guild contains the mock response record
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```python
def mock_fetch(url, init):
    return {
        "status": 200,
        "statusText": "OK",
        "headers": {},
        "json": lambda: {"id": "mock01"},
    }, None

client = HypixelSDK({
    "base": "http://localhost:8080",
    "system": {
        "fetch": mock_fetch,
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
cd py && pytest test/
```


## Reference

### HypixelSDK

```python
from hypixel_sdk import HypixelSDK

client = HypixelSDK(options)
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `str` | API key for authentication. |
| `base` | `str` | Base URL of the API server. |
| `prefix` | `str` | URL path prefix prepended to all requests. |
| `suffix` | `str` | URL path suffix appended to all requests. |
| `feature` | `dict` | Feature activation flags. |
| `extend` | `list` | Additional Feature instances to load. |
| `system` | `dict` | System overrides (e.g. custom `fetch` function). |

### test

```python
client = HypixelSDK.test(testopts, sdkopts)
```

Creates a test-mode client with mock transport. Both arguments may be `None`.

### HypixelSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `() -> dict` | Deep copy of current SDK options. |
| `get_utility` | `() -> Utility` | Copy of the SDK utility object. |
| `prepare` | `(fetchargs) -> dict` | Build an HTTP request definition without sending. Raises on error. |
| `direct` | `(fetchargs) -> dict` | Build and send an HTTP request. Returns a result dict (branch on `ok`). |
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
| `list` | `(reqmatch, ctrl) -> list` | List entities matching the criteria. Raises on error. |
| `create` | `(reqdata, ctrl) -> any` | Create a new entity. Raises on error. |
| `update` | `(reqdata, ctrl) -> any` | Update an existing entity. Raises on error. |
| `remove` | `(reqmatch, ctrl) -> any` | Remove an entity. Raises on error. |
| `data_get` | `() -> dict` | Get entity data. |
| `data_set` | `(data)` | Set entity data. |
| `match_get` | `() -> dict` | Get entity match criteria. |
| `match_set` | `(match)` | Set entity match criteria. |
| `make` | `() -> Entity` | Create a new instance with the same options. |
| `get_name` | `() -> str` | Return the entity name. |

### Result shape

Entity operations return the bare result data (a `dict` for single-entity
ops, a `list` for `list`) and raise on error. Wrap calls in
`try`/`except` to handle failures.

The `direct()` escape hatch never raises — it returns a result `dict`
you branch on via `result["ok"]`:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `True` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `dict` | Response headers. |
| `data` | `any` | Parsed JSON response body. |

On error, `ok` is `False` and `err` contains the error value.

### Entities

#### Guild

| Field | Description |
| --- | --- |
| `guild` |  |
| `success` |  |

Operations: Load.

API path: `/v2/guild`

#### Housing

| Field | Description |
| --- | --- |
| `house` |  |
| `success` |  |

Operations: List, Load.

API path: `/v2/housing/player`

#### Other

| Field | Description |
| --- | --- |
| `booster` |  |
| `booster_state` |  |
| `game` |  |
| `leaderboard` |  |
| `player_count` |  |
| `staff_rolling_daily` |  |
| `staff_total` |  |
| `success` |  |
| `watchdog_last_minute` |  |
| `watchdog_rolling_daily` |  |
| `watchdog_total` |  |

Operations: List, Load.

API path: `/v2/boosters`

#### Player

| Field | Description |
| --- | --- |
| `player` |  |
| `success` |  |

Operations: Load.

API path: `/v2/player`

#### PlayerData

| Field | Description |
| --- | --- |
| `date` |  |
| `ended` |  |
| `game_type` |  |
| `map` |  |
| `mode` |  |
| `session` |  |
| `success` |  |
| `uuid` |  |

Operations: List, Load.

API path: `/v2/recentgames`

#### Resource

| Field | Description |
| --- | --- |
| `achievement` |  |
| `challenge` |  |
| `game` |  |
| `last_updated` |  |
| `one_time` |  |
| `quest` |  |
| `rarity` |  |
| `success` |  |
| `tiered` |  |
| `type` |  |

Operations: Load.

API path: `/v2/resources/achievements`

#### SkyBlock

| Field | Description |
| --- | --- |
| `auction` |  |
| `auctioneer` |  |
| `bid` |  |
| `category` |  |
| `claimed` |  |
| `claimed_bidder` |  |
| `collection` |  |
| `color` |  |
| `coop` |  |
| `current` |  |
| `end` |  |
| `event` |  |
| `extra` |  |
| `full_lore` |  |
| `garden` |  |
| `highest_bid_amount` |  |
| `id` |  |
| `item` |  |
| `item_byte` |  |
| `item_lore` |  |
| `item_name` |  |
| `last_updated` |  |
| `link` |  |
| `lore` |  |
| `material` |  |
| `mayor` |  |
| `member` |  |
| `name` |  |
| `npc_sell_price` |  |
| `page` |  |
| `product` |  |
| `profile` |  |
| `profile_id` |  |
| `progress` |  |
| `required_amount` |  |
| `sale` |  |
| `skill` |  |
| `start` |  |
| `starting_bid` |  |
| `stat` |  |
| `success` |  |
| `text` |  |
| `tier` |  |
| `title` |  |
| `total_auction` |  |
| `total_page` |  |
| `uuid` |  |
| `version` |  |

Operations: List, Load.

API path: `/v2/skyblock/auction`



## Entities


### Guild

Create an instance: `guild = client.Guild()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `guild` | ``$OBJECT`` |  |
| `success` | ``$BOOLEAN`` |  |

#### Example: Load

```python
guild = client.Guild().load({"id": "guild_id"})
```


### Housing

Create an instance: `housing = client.Housing()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `house` | ``$OBJECT`` |  |
| `success` | ``$BOOLEAN`` |  |

#### Example: Load

```python
housing = client.Housing().load({"id": "housing_id"})
```

#### Example: List

```python
housings = client.Housing().list({})
```


### Other

Create an instance: `other = client.Other()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

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

```python
other = client.Other().load({"id": "other_id"})
```

#### Example: List

```python
others = client.Other().list({})
```


### Player

Create an instance: `player = client.Player()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `player` | ``$OBJECT`` |  |
| `success` | ``$BOOLEAN`` |  |

#### Example: Load

```python
player = client.Player().load({"id": "player_id"})
```


### PlayerData

Create an instance: `player_data = client.PlayerData()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

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

```python
player_data = client.PlayerData().load({"id": "player_data_id"})
```

#### Example: List

```python
player_datas = client.PlayerData().list({})
```


### Resource

Create an instance: `resource = client.Resource()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

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

```python
resource = client.Resource().load({"id": "resource_id"})
```


### SkyBlock

Create an instance: `sky_block = client.SkyBlock()`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

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

```python
sky_block = client.SkyBlock().load({"id": "sky_block_id"})
```

#### Example: List

```python
sky_blocks = client.SkyBlock().list({})
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
error is returned to the caller as the second element in the return tuple.

### Features and hooks

Features are the extension mechanism. A feature is a Python class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as dicts

The Python SDK uses plain dicts throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `helpers.to_map()` to safely validate that a value is a dict.

### Module structure

```
py/
├── hypixel_sdk.py         -- Main SDK module
├── config.py                    -- Configuration
├── features.py                  -- Feature factory
├── core/                        -- Core types and context
├── entity/                      -- Entity implementations
├── feature/                     -- Built-in features (Base, Test, Log)
├── utility/                     -- Utility functions and struct library
└── test/                        -- Test suites
```

The main module (`hypixel_sdk`) exports the SDK class.
Import entity or utility modules directly only when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```python
guild = client.Guild()
guild.load({"id": "example_id"})

# guild.data_get() now returns the loaded guild data
# guild.match_get() returns the last match criteria
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

`direct()` gives full control over the HTTP request. Use it for
non-standard endpoints, bulk operations, or any path not modelled as
an entity. `prepare()` builds the request without sending it — useful
for debugging or custom transport.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
