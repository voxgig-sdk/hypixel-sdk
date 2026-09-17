# Hypixel SDK configuration

module HypixelConfig
  # Return the process-wide config, built once on first use. The SDK reads
  # the config on every request and never writes to it, so one instance is
  # shared by every client rather than rebuilt per client.
  #
  # The returned hash is shared: treat it as read-only. Callers that need to
  # mutate should use make_config, which always returns a fresh copy.
  def self.shared_config
    @shared_config ||= make_config
  end


  # Build a fresh, fully materialised config hash. Every call rebuilds the
  # whole structure, so prefer shared_config unless you need a private copy
  # you intend to mutate.
  def self.make_config
    {
      "main" => {
        "name" => "Hypixel",
        "slug" => "hypixel",
        "version" => "0.0.1",
        "target" => "rb",
      },
      "feature" => {
        "ratelimit" => {
          "options" => {
            "active" => false,
            "burst" => 5,
            "rate" => 5,
          },
          "optspec" => {
            "now" => "`$FUNCTION`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "retry" => {
          "options" => {
            "active" => false,
            "factor" => 2,
            "maxDelay" => 2000,
            "minDelay" => 50,
            "retries" => 2,
            "statuses" => [
              408,
              425,
              429,
              500,
              502,
              503,
              504,
            ],
          },
          "optspec" => {
            "jitter" => "`$BOOLEAN`",
            "sleep" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
        "test" => {
          "options" => {
            "active" => false,
          },
          "optspec" => {
            "entity" => "`$MAP`",
            "net" => "`$MAP`",
          },
          "strict" => false,
          "transport" => "base",
        },
        "timeout" => {
          "options" => {
            "active" => false,
            "ms" => 30000,
          },
          "optspec" => {
            "clearTimer" => "`$FUNCTION`",
            "setTimer" => "`$FUNCTION`",
          },
          "strict" => false,
          "transport" => "wrap",
        },
      },
      "options" => {
        "base" => "https://api.hypixel.net",
        "auth" => {
          "prefix" => "",
          "name" => "API-Key",
        },
        "headers" => {
          "content-type" => "application/json",
        },
        "entity" => {
          "guild" => {},
          "housing" => {},
          "other" => {},
          "player" => {},
          "player_data" => {},
          "resource" => {},
          "sky_block" => {},
        },
      },
      "entity" => {
        "guild" => {
          "fields" => [],
          "name" => "guild",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "id",
                        "orig" => "id",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "player",
                        "orig" => "player",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/guild",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "guild",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "id",
                      "name",
                      "player",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.guild`",
                  },
                  "parts" => [
                    "v2",
                    "guild",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "housing" => {
          "fields" => [],
          "name" => "housing",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/housing/player",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "housing",
                    },
                    {
                      "lit" => "player",
                    },
                  ],
                  "select" => {
                    "$action" => "player",
                    "exist" => [
                      "uuid",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.houses`",
                  },
                  "parts" => [
                    "v2",
                    "housing",
                    "player",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/housing/houses",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "housing",
                    },
                    {
                      "lit" => "houses",
                    },
                  ],
                  "select" => {
                    "$action" => "house",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.houses`",
                  },
                  "parts" => [
                    "v2",
                    "housing",
                    "houses",
                  ],
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "house",
                        "orig" => "house",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/housing/house",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "housing",
                    },
                    {
                      "lit" => "house",
                    },
                  ],
                  "select" => {
                    "$action" => "house",
                    "exist" => [
                      "house",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.house`",
                  },
                  "parts" => [
                    "v2",
                    "housing",
                    "house",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "other" => {
          "fields" => [
            {
              "name" => "boosterState",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "boosters",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "staff_rollingDaily",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "staff_total",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "success",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "watchdog_lastMinute",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "watchdog_rollingDaily",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "watchdog_total",
              "type" => "`$INTEGER`",
            },
          ],
          "name" => "other",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/boosters",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "boosters",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "v2",
                    "boosters",
                  ],
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/counts",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "counts",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.games`",
                  },
                  "parts" => [
                    "v2",
                    "counts",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/leaderboards",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "leaderboards",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.leaderboards`",
                  },
                  "parts" => [
                    "v2",
                    "leaderboards",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/punishmentstats",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "punishmentstats",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "v2",
                    "punishmentstats",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "player" => {
          "fields" => [
            {
              "name" => "displayname",
              "type" => "`$STRING`",
            },
            {
              "format" => "int64",
              "name" => "firstLogin",
              "short" => "Unix timestamp in milliseconds",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
              "name" => "lastLogin",
              "short" => "Unix timestamp in milliseconds",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
              "name" => "lastLogout",
              "short" => "Unix timestamp in milliseconds",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "monthlyPackageRank",
              "type" => "`$STRING`",
            },
            {
              "name" => "newPackageRank",
              "type" => "`$STRING`",
            },
            {
              "name" => "packageRank",
              "type" => "`$STRING`",
            },
            {
              "name" => "rank",
              "type" => "`$STRING`",
            },
            {
              "name" => "stats",
              "short" => "Game statistics organized by game type database name",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "uuid",
              "type" => "`$STRING`",
            },
          ],
          "name" => "player",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/player",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "player",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "uuid",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.player`",
                  },
                  "parts" => [
                    "v2",
                    "player",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "player_data" => {
          "fields" => [
            {
              "format" => "int64",
              "name" => "date",
              "type" => "`$INTEGER`",
            },
            {
              "format" => "int64",
              "name" => "ended",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "gameType",
              "type" => "`$STRING`",
            },
            {
              "name" => "map",
              "type" => "`$STRING`",
            },
            {
              "name" => "mode",
              "type" => "`$STRING`",
            },
            {
              "name" => "online",
              "type" => "`$BOOLEAN`",
            },
          ],
          "name" => "player_data",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/recentgames",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "recentgames",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "uuid",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.games`",
                  },
                  "parts" => [
                    "v2",
                    "recentgames",
                  ],
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/status",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "status",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "uuid",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.session`",
                  },
                  "parts" => [
                    "v2",
                    "status",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "resource" => {
          "fields" => [
            {
              "format" => "int64",
              "name" => "lastUpdated",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "one_time",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "rarities",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "success",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "tiered",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "types",
              "type" => "`$OBJECT`",
            },
          ],
          "name" => "resource",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/achievements",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "achievements",
                    },
                  ],
                  "select" => {
                    "$action" => "achievement",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.achievements`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "achievements",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/challenges",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "challenges",
                    },
                  ],
                  "select" => {
                    "$action" => "challenge",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.challenges`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "challenges",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/games",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "games",
                    },
                  ],
                  "select" => {
                    "$action" => "game",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.games`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "games",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/guilds/achievements",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "guilds",
                    },
                    {
                      "lit" => "achievements",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "guilds",
                    "achievements",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/quests",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "quests",
                    },
                  ],
                  "select" => {
                    "$action" => "quest",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.quests`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "quests",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/vanity/companions",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "vanity",
                    },
                    {
                      "lit" => "companions",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "vanity",
                    "companions",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/vanity/pets",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "vanity",
                    },
                    {
                      "lit" => "pets",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "vanity",
                    "pets",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "sky_block" => {
          "fields" => [
            {
              "name" => "auctioneer",
              "type" => "`$STRING`",
            },
            {
              "name" => "auctions",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "bids",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "category",
              "type" => "`$STRING`",
            },
            {
              "name" => "claimed",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "claimed_bidders",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "color",
              "type" => "`$STRING`",
            },
            {
              "name" => "coop",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "current",
              "type" => "`$OBJECT`",
            },
            {
              "format" => "int64",
              "name" => "end",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "events",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "extra",
              "type" => "`$STRING`",
            },
            {
              "name" => "fullLore",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "highest_bid_amount",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "id",
              "type" => "`$STRING`",
            },
            {
              "name" => "item",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "item_bytes",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "item_lore",
              "type" => "`$STRING`",
            },
            {
              "name" => "item_name",
              "type" => "`$STRING`",
            },
            {
              "format" => "int64",
              "name" => "lastUpdated",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "link",
              "type" => "`$STRING`",
            },
            {
              "name" => "lore",
              "type" => "`$STRING`",
            },
            {
              "name" => "material",
              "type" => "`$STRING`",
            },
            {
              "name" => "mayor",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
            },
            {
              "name" => "npc_sell_price",
              "type" => "`$NUMBER`",
            },
            {
              "name" => "page",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "profile_id",
              "type" => "`$STRING`",
            },
            {
              "name" => "profiles",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "progress",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "requiredAmount",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "sales",
              "type" => "`$ARRAY`",
            },
            {
              "format" => "int64",
              "name" => "start",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "starting_bid",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "stats",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "success",
              "type" => "`$BOOLEAN`",
            },
            {
              "name" => "text",
              "type" => "`$STRING`",
            },
            {
              "name" => "tier",
              "type" => "`$STRING`",
            },
            {
              "name" => "tiers",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "title",
              "type" => "`$STRING`",
            },
            {
              "name" => "totalAuctions",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "totalPages",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "uuid",
              "type" => "`$STRING`",
            },
          ],
          "id" => {
            "field" => "id",
            "name" => "id",
          },
          "name" => "sky_block",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "player",
                        "orig" => "player",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "profile",
                        "orig" => "profile",
                        "type" => "`$STRING`",
                      },
                      {
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/auction",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "auction",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "player",
                      "profile",
                      "uuid",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.auctions`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "auction",
                  ],
                },
                {
                  "args" => {
                    "query" => [
                      {
                        "example" => 0,
                        "kind" => "query",
                        "name" => "page",
                        "orig" => "page",
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/auctions",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "auctions",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "page",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.auctions`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "auctions",
                  ],
                },
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/bingo",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "bingo",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "uuid",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.events`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "bingo",
                  ],
                },
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/profiles",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "profiles",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "uuid",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.profiles`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "profiles",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/bingo",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "bingo",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.goals`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "bingo",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/items",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "items",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.items`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "items",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/auctions_ended",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "auctions_ended",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.auctions`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "auctions_ended",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/firesales",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "firesales",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.sales`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "firesales",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/news",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "news",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.items`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "news",
                  ],
                },
              ],
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "profile",
                        "orig" => "profile",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/garden",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "garden",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "profile",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.garden`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "garden",
                  ],
                },
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "profile",
                        "orig" => "profile",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/museum",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "museum",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "profile",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.members`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "museum",
                  ],
                },
                {
                  "args" => {
                    "query" => [
                      {
                        "kind" => "query",
                        "name" => "profile",
                        "orig" => "profile",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/profile",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "profile",
                    },
                  ],
                  "select" => {
                    "exist" => [
                      "profile",
                    ],
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.profile`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "profile",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/collections",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "collections",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.collections`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "collections",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/election",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "election",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "election",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/skills",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "resources",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "skills",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.skills`",
                  },
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "skills",
                  ],
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/bazaar",
                  "segments" => [
                    {
                      "lit" => "v2",
                    },
                    {
                      "lit" => "skyblock",
                    },
                    {
                      "lit" => "bazaar",
                    },
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.products`",
                  },
                  "parts" => [
                    "v2",
                    "skyblock",
                    "bazaar",
                  ],
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
      },
    }
  end


  def self.make_feature(name)
    require_relative 'features'
    HypixelFeatures.make_feature(name)
  end
end
