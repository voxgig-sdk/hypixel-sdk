# Hypixel SDK

Read player stats, guild info, and SkyBlock data from the Hypixel Minecraft server

> TypeScript, Python, PHP, Golang, Ruby, Lua SDKs, a CLI, an interactive REPL, and an MCP server for AI agents — all generated from one OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).

## About Hypixel API

The [Hypixel API](https://api.hypixel.net) is the public HTTP interface for the [Hypixel Network](https://hypixel.net), one of the largest Minecraft servers. It exposes player profiles, guild data, game resources, and SkyBlock-specific information for community tooling, leaderboards, and stat trackers.

What you can retrieve:

- Player profiles, stats, and game-mode history
- Guild membership and metadata
- SkyBlock auctions, bazaar listings, profiles, and collections
- Housing data for player-built houses
- Static game resources (achievements, challenges, quests, pets, etc.)

Most endpoints require an API key obtained from the [Hypixel developer dashboard](https://developer.hypixel.net/). Requests are rate-limited and CORS is enabled. Responses are JSON.

## Try it

**TypeScript**
```bash
npm install hypixel
```

**Python**
```bash
pip install hypixel-sdk
```

**PHP**
```bash
composer require voxgig/hypixel-sdk
```

**Golang**
```bash
go get github.com/voxgig-sdk/hypixel-sdk/go
```

**Ruby**
```bash
gem install hypixel-sdk
```

**Lua**
```bash
luarocks install hypixel-sdk
```

## 30-second quickstart

### TypeScript

```ts
import { HypixelSDK } from 'hypixel'

const client = new HypixelSDK({})

```

See the [TypeScript README](ts/README.md) for the
full guide, or scroll down for the same example in other languages.

## What's in the box

| Surface | Use it for | Path |
| --- | --- | --- |
| **SDK** (TypeScript, Python, PHP, Golang, Ruby, Lua) | App integration | `ts/` `py/` `php/` `go/` `rb/` `lua/` |
| **CLI** | Scripts, CI, ops, one-off API calls | `go-cli/` |
| **MCP server** | AI agents (Claude, Cursor, Cline) | `go-mcp/` |

## Use it from an AI agent (MCP)

The generated MCP server exposes every operation in this SDK as an
[MCP](https://modelcontextprotocol.io) tool that Claude, Cursor or Cline
can call directly. Build and register it:

```bash
cd go-mcp && go build -o hypixel-mcp .
```

Then add it to your agent's MCP config (Claude Desktop, Cursor, etc.):

```json
{
  "mcpServers": {
    "hypixel": {
      "command": "/abs/path/to/hypixel-mcp"
    }
  }
}
```

## Entities

The API exposes 7 entities:

| Entity | Description | API path |
| --- | --- | --- |
| **Guild** | Guild lookup operations returning guild metadata and member rosters under `/guild`. | `/v2/guild` |
| **Housing** | Player housing data exposing publicly listed houses and their metadata. | `/v2/housing/player` |
| **Other** | Miscellaneous endpoints that do not belong to a specific game or resource group (e.g. server status, key info, punishment stats). | `/v2/boosters` |
| **Player** | Player lookup endpoints returning profile, rank, and per-game statistics, typically under `/player`. | `/v2/player` |
| **PlayerData** | Higher-level aggregated player datasets such as recent games, status, and online presence. | `/v2/recentgames` |
| **Resource** | Static game resource catalogues such as achievements, challenges, quests, vanity items, and pets under `/resources`. | `/v2/resources/achievements` |
| **SkyBlock** | SkyBlock-specific data including auctions, the bazaar, player profiles, collections, and election results under `/skyblock`. | `/v2/skyblock/auction` |

Each entity supports the following operations where available: **load**,
**list**, **create**, **update**, and **remove**.

## Quickstart in other languages

### Python

```python
from hypixel_sdk import HypixelSDK

client = HypixelSDK({})


# Load a specific guild
guild, err = client.Guild(None).load(
    {"id": "example_id"}, None
)
```

### PHP

```php
<?php
require_once 'hypixel_sdk.php';

$client = new HypixelSDK([]);


// Load a specific guild
[$guild, $err] = $client->Guild(null)->load(
    ["id" => "example_id"], null
);
```

### Golang

```go
import sdk "github.com/voxgig-sdk/hypixel-sdk/go"

client := sdk.NewHypixelSDK(map[string]any{})

```

### Ruby

```ruby
require_relative "Hypixel_sdk"

client = HypixelSDK.new({})


# Load a specific guild
guild, err = client.Guild(nil).load(
  { "id" => "example_id" }, nil
)
```

### Lua

```lua
local sdk = require("hypixel_sdk")

local client = sdk.new({})


-- Load a specific guild
local guild, err = client:Guild(nil):load(
  { id = "example_id" }, nil
)
```

## Unit testing in offline mode

Every SDK ships a test mode that swaps the HTTP transport for an
in-memory mock, so unit tests run offline.

### TypeScript

```ts
const client = HypixelSDK.test()
const result = await client.Guild().load({ id: 'test01' })
// result.ok === true, result.data contains mock data
```

### Python

```python
client = HypixelSDK.test(None, None)
result, err = client.Guild(None).load(
    {"id": "test01"}, None
)
```

### PHP

```php
$client = HypixelSDK::test(null, null);
[$result, $err] = $client->Guild(null)->load(
    ["id" => "test01"], null
);
```

### Golang

```go
client := sdk.TestSDK(nil, nil)
result, err := client.Guild(nil).Load(
    map[string]any{"id": "test01"}, nil,
)
```

### Ruby

```ruby
client = HypixelSDK.test(nil, nil)
result, err = client.Guild(nil).load(
  { "id" => "test01" }, nil
)
```

### Lua

```lua
local client = sdk.test(nil, nil)
local result, err = client:Guild(nil):load(
  { id = "test01" }, nil
)
```

## How it works

Every SDK call runs the same five-stage pipeline:

1. **Point** — resolve the API endpoint from the operation definition.
2. **Spec** — build the HTTP specification (URL, method, headers, body).
3. **Request** — send the HTTP request.
4. **Response** — receive and parse the response.
5. **Result** — extract the result data for the caller.

A feature hook fires at each stage (e.g. `PrePoint`, `PreSpec`,
`PreRequest`), so features can inspect or modify the pipeline without
forking the SDK.

### Features

| Feature | Purpose |
| --- | --- |
| **TestFeature** | In-memory mock transport for testing without a live server |

Pass custom features via the `extend` option at construction time.

### Direct and Prepare

For endpoints the entity model doesn't cover, use the low-level methods:

- **`direct(fetchargs)`** — build and send an HTTP request in one step.
- **`prepare(fetchargs)`** — build the request without sending it.

Both accept a map with `path`, `method`, `params`, `query`,
`headers`, and `body`. See the [How-to guides](#how-to-guides) below.

## How-to guides

### Make a direct API call

When the entity interface does not cover an endpoint, use `direct`:

**TypeScript:**
```ts
const result = await client.direct({
  path: '/api/resource/{id}',
  method: 'GET',
  params: { id: 'example' },
})
console.log(result.data)
```

**Python:**
```python
result, err = client.direct({
    "path": "/api/resource/{id}",
    "method": "GET",
    "params": {"id": "example"},
})
```

**PHP:**
```php
[$result, $err] = $client->direct([
    "path" => "/api/resource/{id}",
    "method" => "GET",
    "params" => ["id" => "example"],
]);
```

**Go:**
```go
result, err := client.Direct(map[string]any{
    "path":   "/api/resource/{id}",
    "method": "GET",
    "params": map[string]any{"id": "example"},
})
```

**Ruby:**
```ruby
result, err = client.direct({
  "path" => "/api/resource/{id}",
  "method" => "GET",
  "params" => { "id" => "example" },
})
```

**Lua:**
```lua
local result, err = client:direct({
  path = "/api/resource/{id}",
  method = "GET",
  params = { id = "example" },
})
```

## Per-language documentation

- [TypeScript](ts/README.md)
- [Python](py/README.md)
- [PHP](php/README.md)
- [Golang](go/README.md)
- [Ruby](rb/README.md)
- [Lua](lua/README.md)

## Using the Hypixel API

- Upstream: [https://developer.hypixel.net/](https://developer.hypixel.net/)
- API docs: [https://api.hypixel.net/](https://api.hypixel.net/)

- Access requires a Hypixel developer account and API key issued via the developer dashboard
- Use is subject to the Hypixel API Terms of Service
- Rate limits are enforced on requests; abuse may result in key revocation
- No specific open-source licence is published for the API itself

---

Generated from the Hypixel API OpenAPI spec by [@voxgig/sdkgen](https://github.com/voxgig/sdkgen).
