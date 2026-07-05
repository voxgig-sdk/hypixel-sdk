# Hypixel PHP SDK Reference

Complete API reference for the Hypixel PHP SDK.


## HypixelSDK

### Constructor

```php
require_once __DIR__ . '/hypixel_sdk.php';

$client = new HypixelSDK($options);
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$options` | `array` | SDK configuration options. |
| `$options["apikey"]` | `string` | API key for authentication. |
| `$options["base"]` | `string` | Base URL for API requests. |
| `$options["prefix"]` | `string` | URL prefix appended after base. |
| `$options["suffix"]` | `string` | URL suffix appended after path. |
| `$options["headers"]` | `array` | Custom headers for all requests. |
| `$options["feature"]` | `array` | Feature configuration. |
| `$options["system"]` | `array` | System overrides (e.g. custom fetch). |


### Static Methods

#### `HypixelSDK::test($testopts = null, $sdkopts = null)`

Create a test client with mock features active. Both arguments may be `null`.

```php
$client = HypixelSDK::test();
```


### Instance Methods

#### `Guild($data = null)`

Create a new `GuildEntity` instance. Pass `null` for no initial data.

#### `Housing($data = null)`

Create a new `HousingEntity` instance. Pass `null` for no initial data.

#### `Other($data = null)`

Create a new `OtherEntity` instance. Pass `null` for no initial data.

#### `Player($data = null)`

Create a new `PlayerEntity` instance. Pass `null` for no initial data.

#### `PlayerData($data = null)`

Create a new `PlayerDataEntity` instance. Pass `null` for no initial data.

#### `Resource($data = null)`

Create a new `ResourceEntity` instance. Pass `null` for no initial data.

#### `SkyBlock($data = null)`

Create a new `SkyBlockEntity` instance. Pass `null` for no initial data.

#### `options_map(): array`

Return a deep copy of the current SDK options.

#### `get_utility(): HypixelUtility`

Return a copy of the SDK utility object.

#### `direct(array $fetchargs = []): array`

Make a direct HTTP request to any API endpoint. This is the raw-HTTP escape
hatch: it does **not** throw. It returns a result array
`["ok" => bool, "status" => int, "headers" => array, "data" => mixed]`, or
`["ok" => false, "err" => \Exception]` on failure. Branch on `$result["ok"]`.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `$fetchargs["path"]` | `string` | URL path with optional `{param}` placeholders. |
| `$fetchargs["method"]` | `string` | HTTP method (default: `"GET"`). |
| `$fetchargs["params"]` | `array` | Path parameter values for `{param}` substitution. |
| `$fetchargs["query"]` | `array` | Query string parameters. |
| `$fetchargs["headers"]` | `array` | Request headers (merged with defaults). |
| `$fetchargs["body"]` | `mixed` | Request body (arrays are JSON-serialized). |
| `$fetchargs["ctrl"]` | `array` | Control options. |

**Returns:** `array` — the result dict (see above); never throws.

#### `prepare(array $fetchargs = []): mixed`

Prepare a fetch definition without sending the request. Returns the
`$fetchdef` array. Throws on error.


---

## GuildEntity

```php
$guild = $client->Guild();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `guild` | `array` | No |  |
| `success` | `bool` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Guild()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): GuildEntity`

Create a new `GuildEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## HousingEntity

```php
$housing = $client->Housing();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `house` | `array` | No |  |
| `success` | `bool` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Housing()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Housing()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): HousingEntity`

Create a new `HousingEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## OtherEntity

```php
$other = $client->Other();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `booster` | `array` | No |  |
| `booster_state` | `array` | No |  |
| `game` | `array` | No |  |
| `leaderboard` | `array` | No |  |
| `player_count` | `int` | No |  |
| `staff_rolling_daily` | `int` | No |  |
| `staff_total` | `int` | No |  |
| `success` | `bool` | No |  |
| `watchdog_last_minute` | `int` | No |  |
| `watchdog_rolling_daily` | `int` | No |  |
| `watchdog_total` | `int` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->Other()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Other()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): OtherEntity`

Create a new `OtherEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PlayerEntity

```php
$player = $client->Player();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `player` | `array` | No |  |
| `success` | `bool` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Player()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PlayerEntity`

Create a new `PlayerEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## PlayerDataEntity

```php
$player_data = $client->PlayerData();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `date` | `int` | No |  |
| `ended` | `int` | No |  |
| `game_type` | `string` | No |  |
| `map` | `string` | No |  |
| `mode` | `string` | No |  |
| `session` | `array` | No |  |
| `success` | `bool` | No |  |
| `uuid` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->PlayerData()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->PlayerData()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): PlayerDataEntity`

Create a new `PlayerDataEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## ResourceEntity

```php
$resource = $client->Resource();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `achievement` | `array` | No |  |
| `challenge` | `array` | No |  |
| `game` | `array` | No |  |
| `last_updated` | `int` | No |  |
| `one_time` | `array` | No |  |
| `quest` | `array` | No |  |
| `rarity` | `array` | No |  |
| `success` | `bool` | No |  |
| `tiered` | `array` | No |  |
| `type` | `array` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Resource()->load();
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): ResourceEntity`

Create a new `ResourceEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## SkyBlockEntity

```php
$sky_block = $client->SkyBlock();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `auction` | `array` | No |  |
| `auctioneer` | `string` | No |  |
| `bid` | `array` | No |  |
| `category` | `string` | No |  |
| `claimed` | `bool` | No |  |
| `claimed_bidder` | `array` | No |  |
| `collection` | `array` | No |  |
| `color` | `string` | No |  |
| `coop` | `array` | No |  |
| `current` | `array` | No |  |
| `end` | `int` | No |  |
| `event` | `array` | No |  |
| `extra` | `string` | No |  |
| `full_lore` | `array` | No |  |
| `garden` | `array` | No |  |
| `highest_bid_amount` | `int` | No |  |
| `id` | `string` | No |  |
| `item` | `array` | No |  |
| `item_byte` | `array` | No |  |
| `item_lore` | `string` | No |  |
| `item_name` | `string` | No |  |
| `last_updated` | `int` | No |  |
| `link` | `string` | No |  |
| `lore` | `string` | No |  |
| `material` | `string` | No |  |
| `mayor` | `array` | No |  |
| `member` | `array` | No |  |
| `name` | `string` | No |  |
| `npc_sell_price` | `float` | No |  |
| `page` | `int` | No |  |
| `product` | `array` | No |  |
| `profile` | `array` | No |  |
| `profile_id` | `string` | No |  |
| `progress` | `int` | No |  |
| `required_amount` | `int` | No |  |
| `sale` | `array` | No |  |
| `skill` | `array` | No |  |
| `start` | `int` | No |  |
| `starting_bid` | `int` | No |  |
| `stat` | `array` | No |  |
| `success` | `bool` | No |  |
| `text` | `string` | No |  |
| `tier` | `string` | No |  |
| `title` | `string` | No |  |
| `total_auction` | `int` | No |  |
| `total_page` | `int` | No |  |
| `uuid` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `list(?array $reqmatch = null, ?array $ctrl = null): mixed`

List entities matching the given criteria (call with no argument to list all). Returns an array. Throws on error.

```php
$results = $client->SkyBlock()->list();
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->SkyBlock()->load(["id" => "sky_block_id"]);
```

### Common Methods

#### `data_get(): array`

Get the entity data. Returns a copy of the current data.

#### `data_set($data): void`

Set the entity data.

#### `match_get(): array`

Get the entity match criteria.

#### `match_set($match): void`

Set the entity match criteria.

#### `make(): SkyBlockEntity`

Create a new `SkyBlockEntity` instance with the same client and
options.

#### `get_name(): string`

Return the entity name.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```php
$client = new HypixelSDK([
  "feature" => [
    "test" => ["active" => true],
  ],
]);
```

