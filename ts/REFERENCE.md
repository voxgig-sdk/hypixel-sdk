# Hypixel TypeScript SDK Reference

Complete API reference for the Hypixel TypeScript SDK.


## HypixelSDK

### Constructor

```ts
new HypixelSDK(options?: object)
```

Create a new SDK client instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `options` | `object` | SDK configuration options. |
| `options.apikey` | `string` | API key for authentication. |
| `options.base` | `string` | Base URL for API requests. |
| `options.prefix` | `string` | URL prefix appended after base. |
| `options.suffix` | `string` | URL suffix appended after path. |
| `options.headers` | `object` | Custom headers for all requests. |
| `options.feature` | `object` | Feature configuration. |
| `options.system` | `object` | System overrides (e.g. custom fetch). |


### Static Methods

#### `HypixelSDK.test(testopts?, sdkopts?)`

Create a test client with mock features active.

```ts
const client = HypixelSDK.test()
```

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `testopts` | `object` | Test feature options. |
| `sdkopts` | `object` | Additional SDK options merged with test defaults. |

**Returns:** `HypixelSDK` instance in test mode.


### Instance Methods

#### `Guild(data?: object)`

Create a new `Guild` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `GuildEntity` instance.

#### `Housing(data?: object)`

Create a new `Housing` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `HousingEntity` instance.

#### `Other(data?: object)`

Create a new `Other` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `OtherEntity` instance.

#### `Player(data?: object)`

Create a new `Player` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PlayerEntity` instance.

#### `PlayerData(data?: object)`

Create a new `PlayerData` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `PlayerDataEntity` instance.

#### `Resource(data?: object)`

Create a new `Resource` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `ResourceEntity` instance.

#### `SkyBlock(data?: object)`

Create a new `SkyBlock` entity instance.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `data` | `object` | Initial entity data. |

**Returns:** `SkyBlockEntity` instance.

#### `options()`

Return a deep copy of the current SDK options.

**Returns:** `object`

#### `utility()`

Return a copy of the SDK utility object.

**Returns:** `object`

#### `direct(fetchargs?: object)`

Make a direct HTTP request to any API endpoint.

**Parameters:**

| Name | Type | Description |
| --- | --- | --- |
| `fetchargs.path` | `string` | URL path with optional `{param}` placeholders. |
| `fetchargs.method` | `string` | HTTP method (default: `GET`). |
| `fetchargs.params` | `object` | Path parameter values for `{param}` substitution. |
| `fetchargs.query` | `object` | Query string parameters. |
| `fetchargs.headers` | `object` | Request headers (merged with defaults). |
| `fetchargs.body` | `any` | Request body (objects are JSON-serialized). |
| `fetchargs.ctrl` | `object` | Control options (e.g. `{ explain: true }`). |

**Returns:** `Promise<{ ok, status, headers, data } | Error>`

#### `prepare(fetchargs?: object)`

Prepare a fetch definition without sending the request. Accepts the
same parameters as `direct()`.

**Returns:** `Promise<{ url, method, headers, body } | Error>`

#### `tester(testopts?, sdkopts?)`

Alias for `HypixelSDK.test()`.

**Returns:** `HypixelSDK` instance in test mode.


---

## GuildEntity

```ts
const guild = client.Guild()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `guild` | `Record<string, any>` | No |  |
| `success` | `boolean` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Guild().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `GuildEntity` instance with the same client and
options.

#### `client()`

Return the parent `HypixelSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## HousingEntity

```ts
const housing = client.Housing()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `house` | `Record<string, any>` | No |  |
| `success` | `boolean` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Housing().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Housing().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `HousingEntity` instance with the same client and
options.

#### `client()`

Return the parent `HypixelSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## OtherEntity

```ts
const other = client.Other()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `booster` | `any[]` | No |  |
| `booster_state` | `Record<string, any>` | No |  |
| `game` | `Record<string, any>` | No |  |
| `leaderboard` | `Record<string, any>` | No |  |
| `player_count` | `number` | No |  |
| `staff_rolling_daily` | `number` | No |  |
| `staff_total` | `number` | No |  |
| `success` | `boolean` | No |  |
| `watchdog_last_minute` | `number` | No |  |
| `watchdog_rolling_daily` | `number` | No |  |
| `watchdog_total` | `number` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.Other().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Other().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `OtherEntity` instance with the same client and
options.

#### `client()`

Return the parent `HypixelSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PlayerEntity

```ts
const player = client.Player()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `player` | `Record<string, any>` | No |  |
| `success` | `boolean` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Player().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PlayerEntity` instance with the same client and
options.

#### `client()`

Return the parent `HypixelSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## PlayerDataEntity

```ts
const player_data = client.PlayerData()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `date` | `number` | No |  |
| `ended` | `number` | No |  |
| `game_type` | `string` | No |  |
| `map` | `string` | No |  |
| `mode` | `string` | No |  |
| `session` | `Record<string, any>` | No |  |
| `success` | `boolean` | No |  |
| `uuid` | `string` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.PlayerData().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.PlayerData().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `PlayerDataEntity` instance with the same client and
options.

#### `client()`

Return the parent `HypixelSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## ResourceEntity

```ts
const resource = client.Resource()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `achievement` | `Record<string, any>` | No |  |
| `challenge` | `Record<string, any>` | No |  |
| `game` | `Record<string, any>` | No |  |
| `last_updated` | `number` | No |  |
| `one_time` | `Record<string, any>` | No |  |
| `quest` | `Record<string, any>` | No |  |
| `rarity` | `Record<string, any>` | No |  |
| `success` | `boolean` | No |  |
| `tiered` | `Record<string, any>` | No |  |
| `type` | `Record<string, any>` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Resource().load()
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `ResourceEntity` instance with the same client and
options.

#### `client()`

Return the parent `HypixelSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## SkyBlockEntity

```ts
const sky_block = client.SkyBlock()
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `auction` | `any[]` | No |  |
| `auctioneer` | `string` | No |  |
| `bid` | `any[]` | No |  |
| `category` | `string` | No |  |
| `claimed` | `boolean` | No |  |
| `claimed_bidder` | `any[]` | No |  |
| `collection` | `Record<string, any>` | No |  |
| `color` | `string` | No |  |
| `coop` | `any[]` | No |  |
| `current` | `Record<string, any>` | No |  |
| `end` | `number` | No |  |
| `event` | `any[]` | No |  |
| `extra` | `string` | No |  |
| `full_lore` | `any[]` | No |  |
| `garden` | `Record<string, any>` | No |  |
| `highest_bid_amount` | `number` | No |  |
| `id` | `string` | No |  |
| `item` | `Record<string, any>` | No |  |
| `item_byte` | `Record<string, any>` | No |  |
| `item_lore` | `string` | No |  |
| `item_name` | `string` | No |  |
| `last_updated` | `number` | No |  |
| `link` | `string` | No |  |
| `lore` | `string` | No |  |
| `material` | `string` | No |  |
| `mayor` | `Record<string, any>` | No |  |
| `member` | `Record<string, any>` | No |  |
| `name` | `string` | No |  |
| `npc_sell_price` | `number` | No |  |
| `page` | `number` | No |  |
| `product` | `Record<string, any>` | No |  |
| `profile` | `Record<string, any>` | No |  |
| `profile_id` | `string` | No |  |
| `progress` | `number` | No |  |
| `required_amount` | `number` | No |  |
| `sale` | `any[]` | No |  |
| `skill` | `Record<string, any>` | No |  |
| `start` | `number` | No |  |
| `starting_bid` | `number` | No |  |
| `stat` | `Record<string, any>` | No |  |
| `success` | `boolean` | No |  |
| `text` | `string` | No |  |
| `tier` | `string` | No |  |
| `title` | `string` | No |  |
| `total_auction` | `number` | No |  |
| `total_page` | `number` | No |  |
| `uuid` | `string` | No |  |
| `version` | `string` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.SkyBlock().list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.SkyBlock().load({ id: 'sky_block_id' })
```

### Common Methods

#### `data(data?: object)`

Get or set the entity data. When called with data, sets the entity's
internal data and returns the current data. When called without
arguments, returns a copy of the current data.

#### `match(match?: object)`

Get or set the entity match criteria. Works the same as `data()`.

#### `make()`

Create a new `SkyBlockEntity` instance with the same client and
options.

#### `client()`

Return the parent `HypixelSDK` instance.

#### `entopts()`

Return a copy of the entity options.


---

## Features

| Feature | Version | Description |
| --- | --- | --- |
| `test` | 0.0.1 | In-memory mock transport for testing without a live server |


Features are activated via the `feature` option:

```ts
const client = new HypixelSDK({
  feature: {
    test: { active: true },
  }
})
```

