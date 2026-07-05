# Hypixel PHP SDK



The PHP SDK for the Hypixel API — an entity-oriented client using PHP conventions.

The SDK exposes the API as capitalised, semantic **Entities** — for example `$client->Guild()` — with named operations (`list`/`load`) instead of raw URL paths and query strings. Working with resources and verbs keeps call sites self-describing and reduces cognitive load.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to Packagist. Install it from the
GitHub release tag (`php/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/hypixel-sdk/releases](https://github.com/voxgig-sdk/hypixel-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```php
<?php
require_once 'hypixel_sdk.php';

$client = new HypixelSDK([
    "apikey" => getenv("HYPIXEL_APIKEY"),
]);
```

### 3. Load a guild

```php
try {
    // load() returns the bare Guild record (throws on error).
    $guild = $client->Guild()->load();
    print_r($guild);
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```


## Error handling

Entity operations throw a `\Throwable` on failure, so wrap them in
`try` / `catch`:

```php
try {
    $guild = $client->Guild()->load();
} catch (\Throwable $err) {
    echo "Error: " . $err->getMessage();
}
```

`direct()` does **not** throw — it returns the result array. Branch on
`ok`; on failure `status` holds the HTTP status (for error responses) and
`err` holds a transport error, so read both defensively:

```php
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example_id"],
]);

if (! $result["ok"]) {
    $err = $result["err"] ?? null;
    echo "request failed: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```php
// direct() is the raw-HTTP escape hatch: it returns a result array
// (it does not throw). Branch on $result["ok"].
$result = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);

if ($result["ok"]) {
    echo $result["status"];  // 200
    print_r($result["data"]);  // response body
} else {
    // On an HTTP error status there is no err (only a transport failure sets
    // it), so fall back to the status code.
    $err = $result["err"] ?? null;
    echo "Error: " . ($err ? $err->getMessage() : "HTTP " . $result["status"]);
}
```

### Prepare a request without sending it

```php
// prepare() throws on error and returns the fetch definition.
$fetchdef = $client->prepare([
    "path" => "/api/resource/{id}",
    "method" => "DELETE",
    "params" => ["id" => "example"],
]);

echo $fetchdef["url"];
echo $fetchdef["method"];
print_r($fetchdef["headers"]);
```

### Use test mode

Create a mock client for unit testing — no server required:

```php
$client = HypixelSDK::test();

// Entity ops return the bare mock record (throws on error).
$guild = $client->Guild()->load();
print_r($guild);
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
HYPIXEL_APIKEY=<your-key>
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
| `apikey` | `string` | API key for authentication. |
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
| `Other` | `($data): OtherEntity` | Create an Other entity instance. |
| `Player` | `($data): PlayerEntity` | Create a Player entity instance. |
| `PlayerData` | `($data): PlayerDataEntity` | Create a PlayerData entity instance. |
| `Resource` | `($data): ResourceEntity` | Create a Resource entity instance. |
| `SkyBlock` | `($data): SkyBlockEntity` | Create a SkyBlock entity instance. |

### Entity interface

All entities share the same interface.

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `($reqmatch, $ctrl): array` | Load a single entity by match criteria. |
| `list` | `(?array $reqmatch = null, $ctrl): array` | List entities matching the criteria (call with no argument to list all). |
| `data_get` | `(): array` | Get entity data. |
| `data_set` | `($data): void` | Set entity data. |
| `match_get` | `(): array` | Get entity match criteria. |
| `match_set` | `($match): void` | Set entity match criteria. |
| `make` | `(): Entity` | Create a new instance with the same options. |
| `get_name` | `(): string` | Return the entity name. |

### Result shape

Entity operations return the bare result data (an `array` for single-entity
ops, a `list` for `list`) and throw on error. Wrap calls in
`try`/`catch` to handle failures.

The `direct()` escape hatch never throws — it returns a result `array`
you branch on via `$result["ok"]`:

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

Create an instance: `$guild = $client->Guild();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `guild` | `array` |  |
| `success` | `bool` |  |

#### Example: Load

```php
// load() returns the bare Guild record (throws on error).
$guild = $client->Guild()->load();
```


### Housing

Create an instance: `$housing = $client->Housing();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `house` | `array` |  |
| `success` | `bool` |  |

#### Example: Load

```php
// load() returns the bare Housing record (throws on error).
$housing = $client->Housing()->load();
```

#### Example: List

```php
// list() returns an array of Housing records (throws on error).
$housings = $client->Housing()->list();
```


### Other

Create an instance: `$other = $client->Other();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `booster` | `array` |  |
| `booster_state` | `array` |  |
| `game` | `array` |  |
| `leaderboard` | `array` |  |
| `player_count` | `int` |  |
| `staff_rolling_daily` | `int` |  |
| `staff_total` | `int` |  |
| `success` | `bool` |  |
| `watchdog_last_minute` | `int` |  |
| `watchdog_rolling_daily` | `int` |  |
| `watchdog_total` | `int` |  |

#### Example: Load

```php
// load() returns the bare Other record (throws on error).
$other = $client->Other()->load();
```

#### Example: List

```php
// list() returns an array of Other records (throws on error).
$others = $client->Other()->list();
```


### Player

Create an instance: `$player = $client->Player();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `player` | `array` |  |
| `success` | `bool` |  |

#### Example: Load

```php
// load() returns the bare Player record (throws on error).
$player = $client->Player()->load();
```


### PlayerData

Create an instance: `$player_data = $client->PlayerData();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `date` | `int` |  |
| `ended` | `int` |  |
| `game_type` | `string` |  |
| `map` | `string` |  |
| `mode` | `string` |  |
| `session` | `array` |  |
| `success` | `bool` |  |
| `uuid` | `string` |  |

#### Example: Load

```php
// load() returns the bare PlayerData record (throws on error).
$player_data = $client->PlayerData()->load();
```

#### Example: List

```php
// list() returns an array of PlayerData records (throws on error).
$player_datas = $client->PlayerData()->list();
```


### Resource

Create an instance: `$resource = $client->Resource();`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `achievement` | `array` |  |
| `challenge` | `array` |  |
| `game` | `array` |  |
| `last_updated` | `int` |  |
| `one_time` | `array` |  |
| `quest` | `array` |  |
| `rarity` | `array` |  |
| `success` | `bool` |  |
| `tiered` | `array` |  |
| `type` | `array` |  |

#### Example: Load

```php
// load() returns the bare Resource record (throws on error).
$resource = $client->Resource()->load();
```


### SkyBlock

Create an instance: `$sky_block = $client->SkyBlock();`

#### Operations

| Method | Description |
| --- | --- |
| `list(match)` | List entities matching the criteria. |
| `load(match)` | Load a single entity by match criteria. |

#### Fields

| Field | Type | Description |
| --- | --- | --- |
| `auction` | `array` |  |
| `auctioneer` | `string` |  |
| `bid` | `array` |  |
| `category` | `string` |  |
| `claimed` | `bool` |  |
| `claimed_bidder` | `array` |  |
| `collection` | `array` |  |
| `color` | `string` |  |
| `coop` | `array` |  |
| `current` | `array` |  |
| `end` | `int` |  |
| `event` | `array` |  |
| `extra` | `string` |  |
| `full_lore` | `array` |  |
| `garden` | `array` |  |
| `highest_bid_amount` | `int` |  |
| `id` | `string` |  |
| `item` | `array` |  |
| `item_byte` | `array` |  |
| `item_lore` | `string` |  |
| `item_name` | `string` |  |
| `last_updated` | `int` |  |
| `link` | `string` |  |
| `lore` | `string` |  |
| `material` | `string` |  |
| `mayor` | `array` |  |
| `member` | `array` |  |
| `name` | `string` |  |
| `npc_sell_price` | `float` |  |
| `page` | `int` |  |
| `product` | `array` |  |
| `profile` | `array` |  |
| `profile_id` | `string` |  |
| `progress` | `int` |  |
| `required_amount` | `int` |  |
| `sale` | `array` |  |
| `skill` | `array` |  |
| `start` | `int` |  |
| `starting_bid` | `int` |  |
| `stat` | `array` |  |
| `success` | `bool` |  |
| `text` | `string` |  |
| `tier` | `string` |  |
| `title` | `string` |  |
| `total_auction` | `int` |  |
| `total_page` | `int` |  |
| `uuid` | `string` |  |
| `version` | `string` |  |

#### Example: Load

```php
// load() returns the bare SkyBlock record (throws on error).
$sky_block = $client->SkyBlock()->load(["id" => "sky_block_id"]);
```

#### Example: List

```php
// list() returns an array of SkyBlock records (throws on error).
$sky_blocks = $client->SkyBlock()->list();
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
$guild = $client->Guild();
$guild->load();

// $guild->data_get() now returns the guild data from the last load
// $guild->match_get() returns the last match criteria
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
