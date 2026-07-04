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

#### `optionsMap(): array`

Return a deep copy of the current SDK options.

#### `getUtility(): ProjectNameUtility`

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
| `guild` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Guild()->load(["id" => "guild_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): GuildEntity`

Create a new `GuildEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## HousingEntity

```php
$housing = $client->Housing();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `house` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Housing()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Housing()->load(["id" => "housing_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): HousingEntity`

Create a new `HousingEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## OtherEntity

```php
$other = $client->Other();
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

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->Other()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Other()->load(["id" => "other_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): OtherEntity`

Create a new `OtherEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## PlayerEntity

```php
$player = $client->Player();
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `player` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Player()->load(["id" => "player_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): PlayerEntity`

Create a new `PlayerEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## PlayerDataEntity

```php
$player_data = $client->PlayerData();
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

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->PlayerData()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->PlayerData()->load(["id" => "player_data_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): PlayerDataEntity`

Create a new `PlayerDataEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## ResourceEntity

```php
$resource = $client->Resource();
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

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->Resource()->load(["id" => "resource_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): ResourceEntity`

Create a new `ResourceEntity` instance with the same client and
options.

#### `getName(): string`

Return the entity name.


---

## SkyBlockEntity

```php
$sky_block = $client->SkyBlock();
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

#### `list(array $reqmatch, ?array $ctrl = null): mixed`

List entities matching the given criteria. Returns an array. Throws on error.

```php
$results = $client->SkyBlock()->list([]);
```

#### `load(array $reqmatch, ?array $ctrl = null): mixed`

Load a single entity matching the given criteria. Throws on error.

```php
$result = $client->SkyBlock()->load(["id" => "sky_block_id"]);
```

### Common Methods

#### `dataGet(): array`

Get the entity data. Returns a copy of the current data.

#### `dataSet($data): void`

Set the entity data.

#### `matchGet(): array`

Get the entity match criteria.

#### `matchSet($match): void`

Set the entity match criteria.

#### `make(): SkyBlockEntity`

Create a new `SkyBlockEntity` instance with the same client and
options.

#### `getName(): string`

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

