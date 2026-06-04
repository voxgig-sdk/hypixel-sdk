# Hypixel PHP SDK

The PHP SDK for the Hypixel API. Provides an entity-oriented interface using PHP conventions.


## Install
```bash
composer require voxgig/hypixel-sdk
```


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'hypixel_sdk.php';

$client = new HypixelSDK([]);
```

### 3. Load a guild

```php
[$result, $err] = $client->Guild(null)->load(["id" => "example_id"], null);
if ($err) { throw new \Exception($err); }
print_r($result);
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
if ($err) { throw new \Exception($err); }

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
}
```

### Prepare a request without sending it

```php
[$fetchdef, $err] = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);
if ($err) { throw new \Exception($err); }

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```php
$client = HypixelSDK::test(null, null);

[$result, $err] = $client->Hypixel(null)->load(
    ["id" => "test01"], null
);
// $result contains mock response data
```

### Use a custom fetch function

Replace the HTTP transport with your own function:

```php
$mock_fetch = function ($url, $init) {
    return [
        [
            "status" => 200,
            "statusText" => "OK",
            "headers" => [],
            "json" => function () { return ["id" => "mock01"]; },
        ],
        null,
    ];
};

$client = new HypixelSDK([
    "base" => "http://localhost:8080",
    "system" => [
        "fetch" => $mock_fetch,
    ],
]);
```

### Run live tests

Create a `.env.local` file at the project root:

```
HYPIXEL_TEST_LIVE=TRUE
```

Then run:

```bash
cd php && ./vendor/bin/phpunit test/
```


## Reference

### HypixelSDK

```php
require_once 'hypixel_sdk.php';
$client = new HypixelSDK($options);
```

Creates a new SDK client.

| Option | Type | Description |
| --- | --- | --- |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `array` | Feature activation flags. |
| `extend` | `array` | Additional Feature instances to load. |
| `system` | `array` | System overrides (e.g. custom `fetch` callable). |

### test

```php
$client = HypixelSDK::test($testopts, $sdkopts);
```

Creates a test-mode client with mock transport. Both arguments may be `null`.

### HypixelSDK methods

| Method | Signature | Description |
| --- | --- | --- |
| `options_map` | `(): array` | Deep copy of current SDK options. |
| `get_utility` | `(): Utility` | Copy of the SDK utility object. |
| `prepare` | `(array $fetchargs): array` | Build an HTTP request definition without sending. |
| `direct` | `(array $fetchargs): array` | Build and send an HTTP request. |
| `Guild` | `($data): GuildEntity` | Create a Guild entity instance. |
| `Housing` | `($data): HousingEntity` | Create a Housing entity instance. |
| `Other` | `($data): OtherEntity` | Create a Other entity instance. |
| `Player` | `($data): PlayerEntity` | Create a Player entity instance. |
| `PlayerData` | `($data): PlayerDataEntity` | Create a PlayerData entity instance. |
| `Resource` | `($data): ResourceEntity` | Create a Resource entity instance. |
| `SkyBlock` | `($data): SkyBlockEntity` | Create a SkyBlock entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `($reqmatch, $ctrl): array` | List entities matching the criteria. |
| `create` | `($reqdata, $ctrl): array` | Create a new entity. |
| `update` | `($reqdata, $ctrl): array` | Update an existing entity. |
| `remove` | `($reqmatch, $ctrl): array` | Remove an entity. |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return `[$result, $err]`. The first value is an
`array` with these keys:

| Key | Type | Description |
| --- | --- | --- |
| `ok` | `bool` | `true` if the HTTP status is 2xx. |
| `status` | `int` | HTTP status code. |
| `headers` | `array` | Response headers. |
| `data` | `mixed` | Parsed JSON response body. |

On error, `ok` is `false` and `$err` contains the error value.

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

Create an instance: `const guild = client.Guild()`

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

```ts
const guild = await client.Guild().load({ id: 'guild_id' })
```


### Housing

Create an instance: `const housing = client.Housing()`

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

```ts
const housing = await client.Housing().load({ id: 'housing_id' })
```

#### Example: List

```ts
const housings = await client.Housing().list()
```


### Other

Create an instance: `const other = client.Other()`

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

```ts
const other = await client.Other().load({ id: 'other_id' })
```

#### Example: List

```ts
const others = await client.Other().list()
```


### Player

Create an instance: `const player = client.Player()`

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

```ts
const player = await client.Player().load({ id: 'player_id' })
```


### PlayerData

Create an instance: `const player_data = client.PlayerData()`

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

```ts
const player_data = await client.PlayerData().load({ id: 'player_data_id' })
```

#### Example: List

```ts
const player_datas = await client.PlayerData().list()
```


### Resource

Create an instance: `const resource = client.Resource()`

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

```ts
const resource = await client.Resource().load({ id: 'resource_id' })
```


### SkyBlock

Create an instance: `const sky_block = client.SkyBlock()`

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

```ts
const sky_block = await client.SkyBlock().load({ id: 'sky_block_id' })
```

#### Example: List

```ts
const sky_blocks = await client.SkyBlock().list()
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
error is returned to the caller as the second element in the return array.

### Features and hooks

Features are the extension mechanism. A feature is a PHP class
with hook methods named after pipeline stages (e.g. `PrePoint`,
`PreSpec`). Each method receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Data as arrays

The PHP SDK uses plain PHP associative arrays throughout rather than typed
objects. This mirrors the dynamic nature of the API and keeps the
SDK flexible — no code generation is needed when the API schema
changes.

Use `Helpers::to_map()` to safely validate that a value is an array.

### Directory structure

```
php/
├── hypixel_sdk.php          -- Main SDK class
├── config.php                     -- Configuration
├── features.php                   -- Feature factory
├── core/                          -- Core types and context
├── entity/                        -- Entity implementations
├── feature/                       -- Built-in features (Base, Test, Log)
├── utility/                       -- Utility functions and struct library
└── test/                          -- Test suites
```

The main class (`hypixel_sdk.php`) exports the SDK class
and test helper. Import entity or utility modules directly only
when needed.

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally.

```php
$moon = $client->Moon();
[$result, $err] = $moon->load(["planet_id" => "earth", "id" => "luna"]);

// $moon->dataGet() now returns the loaded moon data
// $moon->matchGet() returns the last match criteria
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
