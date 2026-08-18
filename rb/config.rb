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
      },
      "feature" => {
        "test" => {
          "options" => {
            "active" => false,
          },
        },
      },
      "options" => {
        "base" => "https://api.hypixel.net",
        "auth" => {
          "prefix" => "",
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
                  "parts" => [
                    "v2",
                    "guild",
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
                },
              ],
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "housing" => {
          "fields" => [
            {
              "name" => "houses",
              "type" => "`$ARRAY`",
            },
            {
              "name" => "success",
              "type" => "`$BOOLEAN`",
            },
          ],
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
                  "parts" => [
                    "v2",
                    "housing",
                    "player",
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
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/housing/houses",
                  "parts" => [
                    "v2",
                    "housing",
                    "houses",
                  ],
                  "select" => {
                    "$action" => "house",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.houses`",
                  },
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
                  "parts" => [
                    "v2",
                    "housing",
                    "house",
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
                  "parts" => [
                    "v2",
                    "boosters",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
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
                  "parts" => [
                    "v2",
                    "counts",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.games`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/leaderboards",
                  "parts" => [
                    "v2",
                    "leaderboards",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.leaderboards`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/punishmentstats",
                  "parts" => [
                    "v2",
                    "punishmentstats",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
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
              "name" => "firstLogin",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "lastLogin",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "lastLogout",
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
                  "parts" => [
                    "v2",
                    "player",
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
              "name" => "date",
              "type" => "`$INTEGER`",
            },
            {
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
                  "parts" => [
                    "v2",
                    "recentgames",
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
                  "parts" => [
                    "v2",
                    "status",
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
              "name" => "databaseName",
              "type" => "`$STRING`",
            },
            {
              "name" => "id",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "lastUpdated",
              "type" => "`$INTEGER`",
            },
            {
              "name" => "modeNames",
              "type" => "`$OBJECT`",
            },
            {
              "name" => "name",
              "type" => "`$STRING`",
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
                  "parts" => [
                    "v2",
                    "resources",
                    "achievements",
                  ],
                  "select" => {
                    "$action" => "achievement",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.achievements`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/challenges",
                  "parts" => [
                    "v2",
                    "resources",
                    "challenges",
                  ],
                  "select" => {
                    "$action" => "challenge",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.challenges`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/games",
                  "parts" => [
                    "v2",
                    "resources",
                    "games",
                  ],
                  "select" => {
                    "$action" => "game",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.games`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/guilds/achievements",
                  "parts" => [
                    "v2",
                    "resources",
                    "guilds",
                    "achievements",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/quests",
                  "parts" => [
                    "v2",
                    "resources",
                    "quests",
                  ],
                  "select" => {
                    "$action" => "quest",
                  },
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.quests`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/vanity/companions",
                  "parts" => [
                    "v2",
                    "resources",
                    "vanity",
                    "companions",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/vanity/pets",
                  "parts" => [
                    "v2",
                    "resources",
                    "vanity",
                    "pets",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
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
                  "parts" => [
                    "v2",
                    "skyblock",
                    "auction",
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
                  "parts" => [
                    "v2",
                    "skyblock",
                    "auctions",
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
                  "parts" => [
                    "v2",
                    "skyblock",
                    "bingo",
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
                  "parts" => [
                    "v2",
                    "skyblock",
                    "profiles",
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
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/bingo",
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "bingo",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.goals`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/items",
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "items",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.items`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/auctions_ended",
                  "parts" => [
                    "v2",
                    "skyblock",
                    "auctions_ended",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.auctions`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/firesales",
                  "parts" => [
                    "v2",
                    "skyblock",
                    "firesales",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.sales`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/news",
                  "parts" => [
                    "v2",
                    "skyblock",
                    "news",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.items`",
                  },
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
                  "parts" => [
                    "v2",
                    "skyblock",
                    "garden",
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
                  "parts" => [
                    "v2",
                    "skyblock",
                    "museum",
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
                  "parts" => [
                    "v2",
                    "skyblock",
                    "profile",
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
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/collections",
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "collections",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.collections`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/election",
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "election",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/resources/skyblock/skills",
                  "parts" => [
                    "v2",
                    "resources",
                    "skyblock",
                    "skills",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.skills`",
                  },
                },
                {
                  "args" => {},
                  "kind" => "http",
                  "method" => "GET",
                  "orig" => "/v2/skyblock/bazaar",
                  "parts" => [
                    "v2",
                    "skyblock",
                    "bazaar",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body.products`",
                  },
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
