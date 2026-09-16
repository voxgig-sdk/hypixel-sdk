# Hypixel API

Official Hypixel API documentation for accessing player data, game information, resources, and more. Requires API key for authentication and has rate limits for requests.

## Start here

This guide introduces the API, the client libraries, and the companion tools in this repository. Start with the API capabilities, choose a client for your application, and use the linked reference when you need exact request and response details.

The selected API surface contains 7 entities and 34 HTTP routes. There are 6 SDK targets and 2 companion tools.

An entity groups related API operations. An operation can have several routes with different inputs or authentication requirements. The SDK exposes the entity and its operations using the conventions of the selected language.

## What the API provides

### Guild

Results: Get guild information.

SDK operations: `load`.

### Housing

Results: A successful response.

SDK operations: `list`, `load`.

### Other

Results: A successful response.

SDK operations: `list`, `load`.

### Player

Results: Get player&#39;s data.

SDK operations: `load`.

Key fields to recognise:

- `firstLogin`: Unix timestamp in milliseconds
- `lastLogin`: Unix timestamp in milliseconds
- `lastLogout`: Unix timestamp in milliseconds
- `stats`: Game statistics organized by game type database name

### PlayerData

Results: Get player&#39;s recent game; Get player status.

SDK operations: `list`, `load`.

### Resource

Results: A successful response.

SDK operations: `load`.

### SkyBlock

Results: A successful response.

SDK operations: `list`, `load`.

### Route map

Use this map to locate a capability. Consult the entity reference before supplying request data; routes for the same operation can require different fields.

| Entity | SDK operation | HTTP route | Authentication |
| --- | --- | --- | --- |
| Guild | `load` | `GET /v2/guild` | Required |
| Housing | `list` | `GET /v2/housing/player` | Required |
| Housing | `list` | `GET /v2/housing/houses` | Required |
| Housing | `load` | `GET /v2/housing/house` | Required |
| Other | `list` | `GET /v2/boosters` | Required |
| Other | `load` | `GET /v2/counts` | Required |
| Other | `load` | `GET /v2/leaderboards` | Required |
| Other | `load` | `GET /v2/punishmentstats` | Required |
| Player | `load` | `GET /v2/player` | Required |
| PlayerData | `list` | `GET /v2/recentgames` | Required |
| PlayerData | `load` | `GET /v2/status` | Required |
| Resource | `load` | `GET /v2/resources/achievements` | Required |
| Resource | `load` | `GET /v2/resources/challenges` | Required |
| Resource | `load` | `GET /v2/resources/games` | Required |
| Resource | `load` | `GET /v2/resources/guilds/achievements` | Required |
| Resource | `load` | `GET /v2/resources/quests` | Required |
| Resource | `load` | `GET /v2/resources/vanity/companions` | Required |
| Resource | `load` | `GET /v2/resources/vanity/pets` | Required |
| SkyBlock | `list` | `GET /v2/skyblock/auction` | Required |
| SkyBlock | `list` | `GET /v2/skyblock/auctions` | Required |
| SkyBlock | `list` | `GET /v2/skyblock/bingo` | Required |
| SkyBlock | `list` | `GET /v2/skyblock/profiles` | Required |
| SkyBlock | `list` | `GET /v2/resources/skyblock/bingo` | Required |
| SkyBlock | `list` | `GET /v2/resources/skyblock/items` | Required |
| SkyBlock | `list` | `GET /v2/skyblock/auctions_ended` | Required |
| SkyBlock | `list` | `GET /v2/skyblock/firesales` | Required |
| SkyBlock | `list` | `GET /v2/skyblock/news` | Required |
| SkyBlock | `load` | `GET /v2/skyblock/garden` | Required |
| SkyBlock | `load` | `GET /v2/skyblock/museum` | Required |
| SkyBlock | `load` | `GET /v2/skyblock/profile` | Required |
| SkyBlock | `load` | `GET /v2/resources/skyblock/collections` | Required |
| SkyBlock | `load` | `GET /v2/resources/skyblock/election` | Required |
| SkyBlock | `load` | `GET /v2/resources/skyblock/skills` | Required |
| SkyBlock | `load` | `GET /v2/skyblock/bazaar` | Required |

## Connect to the API

- Production server: `https://api.hypixel.net`

The default credential is sent in the `API-Key` header.

Obtained via the Hypixel Developer Dashboard when creating an application. You can also request higher limits for production applications in this dashboard.

Check authentication for the route you plan to call. A route that declares no authentication can be used without credentials; this does not change the requirements of other routes. Keep credentials in environment variables or a configured secret provider, and keep them out of source control and logs.

## Make a first request

1. Choose the API server and an operation that matches your task.
2. Check the operation’s required input and authentication. Use values valid for your account and environment.
3. Send one request and inspect the returned data before adding retries, concurrency, or a larger batch.

For an SDK call, install or build the chosen client, create a client instance with its documented configuration, and call the required entity operation. Language references describe the argument shape, asynchronous behaviour, and returned values.

## Choose an SDK

Choose the language already used by your application or service. The clients represent the same API model, while package setup, naming, and return types follow each language. Check the selected client’s reference and tests before integrating it into an existing application.

| Client | Repository directory | Distribution |
| --- | --- | --- |
| Golang | `go/` | Build from source |
| Lua | `lua/` | Build from source |
| PHP | `php/` | Build from source |
| Python | `py/` | Build from source |
| Ruby | `rb/` | Build from source |
| TypeScript | `ts/` | Build from source |

Build-from-source entries are not marked as published in the project model. Follow the build instructions in that target’s README, then consume the resulting package using your language’s local dependency mechanism. Published entries give the installation command recorded for that client.

## Companion tools

These targets provide another way to use the API. Their available commands or tools can cover a smaller set of operations than the client libraries.

### Go CLI

Use the command-line interface for shell-based tasks and scripts.

Repository directory: `go-cli/`. Not published. Build from the go-cli directory.


### Go MCP server

Use the MCP server to expose supported API operations to an MCP client.

Repository directory: `go-mcp/`. Not published. Build from the go-mcp directory.

- `hypixel_list`: List records for an entity. Supported entities: `housing`, `other`, `player_data`, `sky_block`.
- `hypixel_load`: Load one record for an entity. Supported entities: `guild`, `housing`, `other`, `player`, `player_data`, `resource`, `sky_block`.

## Operational features

Features supply behaviour around API calls, such as request handling, diagnostics, or local testing. Inclusion in this project does not mean a feature is enabled at runtime. Check the selected SDK’s supported features and configuration defaults, then enable the behaviour your application needs.

- `ratelimit`: Client-side rate limiting via a token bucket
- `retry`: Automatic retry of transient failures with exponential backoff
- `test`: In-memory mock transport for testing without a live server
- `timeout`: Per-request timeout with transport abort

Start with the default client configuration. Add request limits and diagnostics as needed, test error paths, and review retry behaviour before using operations that change data. A retry can repeat an operation unless the API provides a suitable guarantee.

## Continue with the documentation

- Follow the first-call guide for the setup sequence.
- Read the authentication guide before using protected routes.
- Use the API reference for request schemas, response formats, and status codes.
- Check the chosen SDK or companion tool reference for its configuration and supported operations.

