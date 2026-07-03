# Hypixel TypeScript SDK



The TypeScript SDK for the Hypixel API — a type-safe, entity-oriented client with full async/await support.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
```bash
npm install hypixel
```
## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { HypixelSDK } from 'hypixel'

const client = new HypixelSDK({
  apikey: process.env.HYPIXEL_APIKEY,
})
```

### 3. Load a guild

```ts
const result = await client.Guild().load({ id: 'example_id' })

if (result.ok) {
  console.log(result.data)
}
```


## How-to guides

### Make a direct HTTP request

For endpoints not covered by entity methods:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})

if (result.ok) {
  console.log(result.status)  // 200
  console.log(result.data)    // response body
}
```

### Prepare a request without sending it

```ts
const fetchdef = await client.prepare({
  path: '/api/resource/{id}',
  method: 'DELETE',
  params: { id: 'example' },
})

// Inspect before sending
console.log(fetchdef.url)
console.log(fetchdef.method)
console.log(fetchdef.headers)
```

### Use test mode

Create a mock client for unit testing — no server required:

```ts
const client = HypixelSDK.test()

const result = await client.Planet().load({ id: 'test01' })
// result.ok === true
// result.data contains mock response data
```

You can also use the instance method:

```ts
const client = new HypixelSDK({ apikey: '...' })
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Planet()

// First call sets internal match
await entity.load({ id: 'example' })

// Subsequent calls reuse the stored match
const data = entity.data()
console.log(data.id) // 'example'
```

### Add custom middleware

Pass features via the `extend` option:

```ts
const logger = {
  hooks: {
    PreRequest: (ctx: any) => {
      console.log('Requesting:', ctx.spec.method, ctx.spec.path)
    },
    PreResponse: (ctx: any) => {
      console.log('Status:', ctx.out.request?.status)
    },
  },
}

const client = new HypixelSDK({
  apikey: '...',
  extend: [logger],
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
cd ts && npm test
```


## Reference

### HypixelSDK

#### Constructor

```ts
new HypixelSDK(options?: {
  apikey?: string
  base?: string
  prefix?: string
  suffix?: string
  feature?: Record<string, { active: boolean }>
  extend?: Feature[]
})
```

| Option | Type | Description |
| --- | --- | --- |
| `apikey` | `string` | API key for authentication. |
| `base` | `string` | Base URL of the API server. |
| `prefix` | `string` | URL path prefix prepended to all requests. |
| `suffix` | `string` | URL path suffix appended to all requests. |
| `feature` | `object` | Feature activation flags (e.g. `{ test: { active: true } }`). |
| `extend` | `Feature[]` | Additional feature instances to load. |

#### Methods

| Method | Returns | Description |
| --- | --- | --- |
| `options()` | `object` | Deep copy of current SDK options. |
| `utility()` | `Utility` | Deep copy of the SDK utility object. |
| `prepare(fetchargs?)` | `Promise<FetchDef>` | Build an HTTP request definition without sending it. |
| `direct(fetchargs?)` | `Promise<DirectResult>` | Build and send an HTTP request. |
| `Guild(data?)` | `GuildEntity` | Create a Guild entity instance. |
| `Housing(data?)` | `HousingEntity` | Create a Housing entity instance. |
| `Other(data?)` | `OtherEntity` | Create a Other entity instance. |
| `Player(data?)` | `PlayerEntity` | Create a Player entity instance. |
| `PlayerData(data?)` | `PlayerDataEntity` | Create a PlayerData entity instance. |
| `Resource(data?)` | `ResourceEntity` | Create a Resource entity instance. |
| `SkyBlock(data?)` | `SkyBlockEntity` | Create a SkyBlock entity instance. |
| `tester(testopts?, sdkopts?)` | `HypixelSDK` | Create a test-mode client instance. |

#### Static methods

| Method | Returns | Description |
| --- | --- | --- |
| `HypixelSDK.test(testopts?, sdkopts?)` | `HypixelSDK` | Create a test-mode client. |

### Entity interface

All entities share the same interface.

#### Methods

| Method | Signature | Description |
| --- | --- | --- |
| `load` | `load(reqmatch?, ctrl?): Promise<Result>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Result>` | List entities matching the criteria. |
| `create` | `create(reqdata?, ctrl?): Promise<Result>` | Create a new entity. |
| `update` | `update(reqdata?, ctrl?): Promise<Result>` | Update an existing entity. |
| `remove` | `remove(reqmatch?, ctrl?): Promise<Result>` | Remove an entity. |
| `data` | `data(data?): any` | Get or set entity data. |
| `match` | `match(match?): any` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): HypixelSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Result shape

All entity operations return a Result object:

```ts
{
  ok: boolean      // true if the HTTP status is 2xx
  status: number   // HTTP status code
  headers: object  // response headers
  data: any        // parsed JSON response body
}
```

### DirectResult shape

The `direct()` method returns:

```ts
{
  ok: boolean
  status: number
  headers: object
  data: any
}
```

On error, `ok` is `false` and an `err` property contains the error.

### FetchDef shape

The `prepare()` method returns:

```ts
{
  url: string
  method: string
  headers: Record<string, string>
  body?: any
}
```

### Entities

#### Guild

| Field | Description |
| --- | --- |
| `guild` |  |
| `success` |  |

Operations: load.

API path: `/v2/guild`

#### Housing

| Field | Description |
| --- | --- |
| `house` |  |
| `success` |  |

Operations: list, load.

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

Operations: list, load.

API path: `/v2/boosters`

#### Player

| Field | Description |
| --- | --- |
| `player` |  |
| `success` |  |

Operations: load.

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

Operations: list, load.

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

Operations: load.

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

Operations: list, load.

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
error is returned to the caller.

An unexpected exception triggers the `PreUnexpected` hook before
propagating.

### Features and hooks

Features are the extension mechanism. A feature is an object with a
`hooks` map. Each hook key is a pipeline stage name, and the value is
a function that receives the context.

The SDK ships with built-in features:

- **TestFeature**: In-memory mock transport for testing without a live server

Features are initialized in order. Hooks fire in the order features
were added, so later features can override earlier ones.

### Module structure

```
hypixel/
├── src/
│   ├── HypixelSDK.ts        # Main SDK class
│   ├── entity/             # Entity implementations
│   ├── feature/            # Built-in features (Base, Test, Log)
│   └── utility/            # Utility functions
├── test/                   # Test suites
└── dist/                   # Compiled output
```

Import the SDK from the package root:

```ts
import { HypixelSDK } from 'hypixel'
```

### Entity state

Entity instances are stateful. After a successful `load`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const moon = client.Moon()
await moon.load({ planet_id: 'earth', id: 'luna' })

// moon.data() now returns the loaded moon data
// moon.match() returns { planet_id: 'earth', id: 'luna' }
```

Call `make()` to create a fresh instance with the same configuration
but no stored state.

### Direct vs entity access

The entity interface handles URL construction, parameter placement,
and response parsing automatically. Use it for standard CRUD operations.

The `direct` method gives full control over the HTTP request. Use it
for non-standard endpoints, bulk operations, or any path not modelled
as an entity. The `prepare` method is useful for debugging — it
shows exactly what `direct` would send.


## Full Reference

See [REFERENCE.md](REFERENCE.md) for complete API reference
documentation including all method signatures, entity field schemas,
and detailed usage examples.
