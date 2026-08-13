# Hypixel TypeScript SDK



The TypeScript SDK for the Hypixel API — a type-safe, entity-oriented client with full async/await support.

The API is exposed as capitalised, semantic **Entities** — e.g.
`client.Guild()` — each with a small set of operations (`list`, `load`)
instead of raw URL paths and query parameters. This keeps the surface
predictable and low-friction for both humans and AI agents.

> Other languages, the CLI, and MCP server live alongside this one — see
> the [top-level README](../README.md).


## Install
This package is not yet published to npm. Install it from the GitHub
release tag (`ts/vX.Y.Z`):

- Releases: [https://github.com/voxgig-sdk/hypixel-sdk/releases](https://github.com/voxgig-sdk/hypixel-sdk/releases)


## Tutorial: your first API call

This tutorial walks through creating a client, listing entities, and
loading a specific record.

### 1. Create a client

```ts
import { HypixelSDK } from '@voxgig-sdk/hypixel'

const client = new HypixelSDK({
  apikey: process.env.HYPIXEL_APIKEY,
})
```

### 3. Load a guild

`load()` returns the entity directly and throws on failure:

```ts
try {
  const guild = await client.Guild().load()
  console.log(guild)
} catch (err) {
  console.error('load failed:', err)
}
```


## Error handling

Entity operations reject on failure, so wrap them in `try` / `catch`:

```ts
try {
  const others = await client.Other().list()
  console.log(others)
} catch (err) {
  console.error('list failed:', err)
}
```

The low-level `direct()` method does **not** throw — it returns the
value or an `Error`, so check the result before using it:

```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example_id' },
})

if (result instanceof Error) {
  throw result
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

if (result instanceof Error) {
  throw result
}
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

const other = await client.Other().list()
// other is the entity, populated with mock response data
// — call other.data() for the record itself
console.log(other)
```

You can also use the instance method:

```ts
const client = new HypixelSDK({ apikey: '...' })
const testClient = client.tester()
```

### Retain entity state across calls

Entity instances remember their last match and data:

```ts
const entity = client.Other()

// First call runs the operation and stores its result
await entity.list()

// Subsequent calls reuse the stored state
const data = entity.data()
console.log(data)
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
| `Other(data?)` | `OtherEntity` | Create an Other entity instance. |
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
| `load` | `load(reqmatch?, ctrl?): Promise<Entity>` | Load a single entity by match criteria. |
| `list` | `list(reqmatch?, ctrl?): Promise<Entity[]>` | List entities matching the criteria. |
| `data` | `data(data?: Partial<Entity>): Entity` | Get or set entity data. |
| `match` | `match(match?: Partial<Entity>): Partial<Entity>` | Get or set entity match criteria. |
| `make` | `make(): Entity` | Create a new instance with the same options. |
| `client` | `client(): HypixelSDK` | Return the parent SDK client. |
| `entopts` | `entopts(): object` | Return a copy of the entity options. |

#### Return values

Entity operations resolve to the entity data directly — there is no
result envelope:

- `load` resolves to a single entity object.
- `list` resolves to an **array** of entity objects (iterate it directly;
  there is no `.data` and no `.ok`).

On a failed request these methods **throw**, so wrap calls in
`try`/`catch` to handle errors. Only `direct()` returns the result
envelope described below.

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

Operations: load.

API path: `/v2/guild`

#### Housing

| Field | Description |
| --- | --- |
| `houses` |  |
| `success` |  |

Operations: list, load.

API path: `/v2/housing/player`

#### Other

| Field | Description |
| --- | --- |
| `boosterState` |  |
| `boosters` |  |
| `staff_rollingDaily` |  |
| `staff_total` |  |
| `success` |  |
| `watchdog_lastMinute` |  |
| `watchdog_rollingDaily` |  |
| `watchdog_total` |  |

Operations: list, load.

API path: `/v2/boosters`

#### Player

| Field | Description |
| --- | --- |
| `displayname` |  |
| `firstLogin` |  |
| `lastLogin` |  |
| `lastLogout` |  |
| `monthlyPackageRank` |  |
| `newPackageRank` |  |
| `packageRank` |  |
| `rank` |  |
| `stats` |  |
| `uuid` |  |

Operations: load.

API path: `/v2/player`

#### PlayerData

| Field | Description |
| --- | --- |
| `date` |  |
| `ended` |  |
| `gameType` |  |
| `map` |  |
| `mode` |  |
| `online` |  |

Operations: list, load.

API path: `/v2/recentgames`

#### Resource

| Field | Description |
| --- | --- |
| `databaseName` |  |
| `id` |  |
| `lastUpdated` |  |
| `modeNames` |  |
| `name` |  |
| `one_time` |  |
| `rarities` |  |
| `success` |  |
| `tiered` |  |
| `types` |  |

Operations: load.

API path: `/v2/resources/achievements`

#### SkyBlock

| Field | Description |
| --- | --- |
| `auctioneer` |  |
| `auctions` |  |
| `bids` |  |
| `category` |  |
| `claimed` |  |
| `claimed_bidders` |  |
| `color` |  |
| `coop` |  |
| `current` |  |
| `end` |  |
| `events` |  |
| `extra` |  |
| `fullLore` |  |
| `highest_bid_amount` |  |
| `id` |  |
| `item` |  |
| `item_bytes` |  |
| `item_lore` |  |
| `item_name` |  |
| `lastUpdated` |  |
| `link` |  |
| `lore` |  |
| `material` |  |
| `mayor` |  |
| `name` |  |
| `npc_sell_price` |  |
| `page` |  |
| `profile_id` |  |
| `profiles` |  |
| `progress` |  |
| `requiredAmount` |  |
| `sales` |  |
| `start` |  |
| `starting_bid` |  |
| `stats` |  |
| `success` |  |
| `text` |  |
| `tier` |  |
| `tiers` |  |
| `title` |  |
| `totalAuctions` |  |
| `totalPages` |  |
| `uuid` |  |

Operations: list, load.

API path: `/v2/skyblock/auction`



## Entities


### Guild

Create an instance: `const guild = client.Guild()`

#### Operations

| Method | Description |
| --- | --- |
| `load(match)` | Load a single entity by match criteria. |

#### Example: Load

```ts
const guild = await client.Guild().load()
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
| `houses` | `any[]` |  |
| `success` | `boolean` |  |

#### Example: Load

```ts
const housing = await client.Housing().load()
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
| `boosterState` | `Record<string, any>` |  |
| `boosters` | `any[]` |  |
| `staff_rollingDaily` | `number` |  |
| `staff_total` | `number` |  |
| `success` | `boolean` |  |
| `watchdog_lastMinute` | `number` |  |
| `watchdog_rollingDaily` | `number` |  |
| `watchdog_total` | `number` |  |

#### Example: Load

```ts
const other = await client.Other().load()
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
| `displayname` | `string` |  |
| `firstLogin` | `number` |  |
| `lastLogin` | `number` |  |
| `lastLogout` | `number` |  |
| `monthlyPackageRank` | `string` |  |
| `newPackageRank` | `string` |  |
| `packageRank` | `string` |  |
| `rank` | `string` |  |
| `stats` | `Record<string, any>` |  |
| `uuid` | `string` |  |

#### Example: Load

```ts
const player = await client.Player().load()
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
| `date` | `number` |  |
| `ended` | `number` |  |
| `gameType` | `string` |  |
| `map` | `string` |  |
| `mode` | `string` |  |
| `online` | `boolean` |  |

#### Example: Load

```ts
const player_data = await client.PlayerData().load()
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
| `databaseName` | `string` |  |
| `id` | `number` |  |
| `lastUpdated` | `number` |  |
| `modeNames` | `Record<string, any>` |  |
| `name` | `string` |  |
| `one_time` | `Record<string, any>` |  |
| `rarities` | `Record<string, any>` |  |
| `success` | `boolean` |  |
| `tiered` | `Record<string, any>` |  |
| `types` | `Record<string, any>` |  |

#### Example: Load

```ts
const resource = await client.Resource().load({ id: 1 })
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
| `auctioneer` | `string` |  |
| `auctions` | `any[]` |  |
| `bids` | `any[]` |  |
| `category` | `string` |  |
| `claimed` | `boolean` |  |
| `claimed_bidders` | `any[]` |  |
| `color` | `string` |  |
| `coop` | `any[]` |  |
| `current` | `Record<string, any>` |  |
| `end` | `number` |  |
| `events` | `any[]` |  |
| `extra` | `string` |  |
| `fullLore` | `any[]` |  |
| `highest_bid_amount` | `number` |  |
| `id` | `string` |  |
| `item` | `Record<string, any>` |  |
| `item_bytes` | `Record<string, any>` |  |
| `item_lore` | `string` |  |
| `item_name` | `string` |  |
| `lastUpdated` | `number` |  |
| `link` | `string` |  |
| `lore` | `string` |  |
| `material` | `string` |  |
| `mayor` | `Record<string, any>` |  |
| `name` | `string` |  |
| `npc_sell_price` | `number` |  |
| `page` | `number` |  |
| `profile_id` | `string` |  |
| `profiles` | `any[]` |  |
| `progress` | `number` |  |
| `requiredAmount` | `number` |  |
| `sales` | `any[]` |  |
| `start` | `number` |  |
| `starting_bid` | `number` |  |
| `stats` | `Record<string, any>` |  |
| `success` | `boolean` |  |
| `text` | `string` |  |
| `tier` | `string` |  |
| `tiers` | `any[]` |  |
| `title` | `string` |  |
| `totalAuctions` | `number` |  |
| `totalPages` | `number` |  |
| `uuid` | `string` |  |

#### Example: Load

```ts
const sky_block = await client.SkyBlock().load({ id: 'sky_block_id' })
```

#### Example: List

```ts
const sky_blocks = await client.SkyBlock().list()
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
import { HypixelSDK } from '@voxgig-sdk/hypixel'
```

### Entity state

Entity instances are stateful. After a successful `list`, the entity
stores the returned data and match criteria internally. Subsequent
calls on the same instance can rely on this state.

```ts
const other = client.Other()
await other.list()

// other.data() now returns the other data from the last `list`
// other.match() returns the last match criteria
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
