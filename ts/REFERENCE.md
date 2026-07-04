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
const guild = client.guild
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `guild` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.guild.load({ id: 'guild_id' })
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
const housing = client.housing
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `house` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.housing.list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.housing.load({ id: 'housing_id' })
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
const other = client.other
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.other.list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.other.load({ id: 'other_id' })
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
const player = client.player
```

### Fields

| Field | Type | Required | Description |
| --- | --- | --- | --- |
| `player` | ``$OBJECT`` | No |  |
| `success` | ``$BOOLEAN`` | No |  |

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.player.load({ id: 'player_id' })
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
const player_data = client.player_data
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.player_data.list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.player_data.load({ id: 'player_data_id' })
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
const resource = client.resource
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

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.resource.load({ id: 'resource_id' })
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
const sky_block = client.sky_block
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

#### `list(match: object, ctrl?: object)`

List entities matching the given criteria. Returns an array.

```ts
const results = await client.sky_block.list()
```

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.sky_block.load({ id: 'sky_block_id' })
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

