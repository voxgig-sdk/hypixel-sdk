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
| `houses` | `any[]` | No |  |
| `success` | `boolean` | No |  |

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `house` | `/v2/housing/houses` | `client.Housing().list({ $action: 'house', ... })` |
| `player` | `/v2/housing/player` | `client.Housing().list({ $action: 'player', ... })` |
| `house` | `/v2/housing/house` | `client.Housing().load({ $action: 'house', ... })` |

An action returns that action's OWN response, which is not necessarily a
Housing record — check the API definition for its shape.

```ts
const result = await client.Housing().list({
  $action: 'house',
  /* ...the action's own arguments */
})
```

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
| `boosterState` | `Record<string, any>` | No |  |
| `boosters` | `any[]` | No |  |
| `staff_rollingDaily` | `number` | No |  |
| `staff_total` | `number` | No |  |
| `success` | `boolean` | No |  |
| `watchdog_lastMinute` | `number` | No |  |
| `watchdog_rollingDaily` | `number` | No |  |
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
| `displayname` | `string` | No |  |
| `firstLogin` | `number` | No |  |
| `lastLogin` | `number` | No |  |
| `lastLogout` | `number` | No |  |
| `monthlyPackageRank` | `string` | No |  |
| `newPackageRank` | `string` | No |  |
| `packageRank` | `string` | No |  |
| `rank` | `string` | No |  |
| `stats` | `Record<string, any>` | No |  |
| `uuid` | `string` | No |  |

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
| `gameType` | `string` | No |  |
| `map` | `string` | No |  |
| `mode` | `string` | No |  |
| `online` | `boolean` | No |  |

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
| `databaseName` | `string` | No |  |
| `id` | `number` | No |  |
| `lastUpdated` | `number` | No |  |
| `modeNames` | `Record<string, any>` | No |  |
| `name` | `string` | No |  |
| `one_time` | `Record<string, any>` | No |  |
| `rarities` | `Record<string, any>` | No |  |
| `success` | `boolean` | No |  |
| `tiered` | `Record<string, any>` | No |  |
| `types` | `Record<string, any>` | No |  |

### Actions

This entity exposes custom API actions in addition to the standard
operations. Select one with `$action` in the call's argument; the
remaining keys are sent as that action's payload.

| Action | Route | Call |
| --- | --- | --- |
| `achievement` | `/v2/resources/achievements` | `client.Resource().load({ $action: 'achievement', ... })` |
| `challenge` | `/v2/resources/challenges` | `client.Resource().load({ $action: 'challenge', ... })` |
| `game` | `/v2/resources/games` | `client.Resource().load({ $action: 'game', ... })` |
| `quest` | `/v2/resources/quests` | `client.Resource().load({ $action: 'quest', ... })` |

An action returns that action's OWN response, which is not necessarily a
Resource record — check the API definition for its shape.

```ts
const result = await client.Resource().load({
  $action: 'achievement',
  /* ...the action's own arguments */
})
```

### Operations

#### `load(match: object, ctrl?: object)`

Load a single entity matching the given criteria.

```ts
const result = await client.Resource().load({ id: 1 })
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
| `auctioneer` | `string` | No |  |
| `auctions` | `any[]` | No |  |
| `bids` | `any[]` | No |  |
| `category` | `string` | No |  |
| `claimed` | `boolean` | No |  |
| `claimed_bidders` | `any[]` | No |  |
| `color` | `string` | No |  |
| `coop` | `any[]` | No |  |
| `current` | `Record<string, any>` | No |  |
| `end` | `number` | No |  |
| `events` | `any[]` | No |  |
| `extra` | `string` | No |  |
| `fullLore` | `any[]` | No |  |
| `highest_bid_amount` | `number` | No |  |
| `id` | `string` | No |  |
| `item` | `Record<string, any>` | No |  |
| `item_bytes` | `Record<string, any>` | No |  |
| `item_lore` | `string` | No |  |
| `item_name` | `string` | No |  |
| `lastUpdated` | `number` | No |  |
| `link` | `string` | No |  |
| `lore` | `string` | No |  |
| `material` | `string` | No |  |
| `mayor` | `Record<string, any>` | No |  |
| `name` | `string` | No |  |
| `npc_sell_price` | `number` | No |  |
| `page` | `number` | No |  |
| `profile_id` | `string` | No |  |
| `profiles` | `any[]` | No |  |
| `progress` | `number` | No |  |
| `requiredAmount` | `number` | No |  |
| `sales` | `any[]` | No |  |
| `start` | `number` | No |  |
| `starting_bid` | `number` | No |  |
| `stats` | `Record<string, any>` | No |  |
| `success` | `boolean` | No |  |
| `text` | `string` | No |  |
| `tier` | `string` | No |  |
| `tiers` | `any[]` | No |  |
| `title` | `string` | No |  |
| `totalAuctions` | `number` | No |  |
| `totalPages` | `number` | No |  |
| `uuid` | `string` | No |  |

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

