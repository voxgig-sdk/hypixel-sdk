# Hypixel SDK configuration

module HypixelConfig
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
          "prefix" => "Bearer",
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
          "fields" => [
            {
              "active" => true,
              "name" => "guild",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "success",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 1,
            },
          ],
          "name" => "guild",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "id",
                        "orig" => "id",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "name",
                        "orig" => "name",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "player",
                        "orig" => "player",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "housing" => {
          "fields" => [
            {
              "active" => true,
              "name" => "house",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "success",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 1,
            },
          ],
          "name" => "housing",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 1,
                },
              ],
              "key$" => "list",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "house",
                        "orig" => "house",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "other" => {
          "fields" => [
            {
              "active" => true,
              "name" => "booster",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "booster_state",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "game",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "leaderboard",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "player_count",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "staff_rolling_daily",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "staff_total",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "success",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "watchdog_last_minute",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "watchdog_rolling_daily",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "watchdog_total",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 10,
            },
          ],
          "name" => "other",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
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
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/v2/counts",
                  "parts" => [
                    "v2",
                    "counts",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {},
                  "method" => "GET",
                  "orig" => "/v2/leaderboards",
                  "parts" => [
                    "v2",
                    "leaderboards",
                  ],
                  "select" => {},
                  "transform" => {
                    "req" => "`reqdata`",
                    "res" => "`body`",
                  },
                  "index$" => 1,
                },
                {
                  "active" => true,
                  "args" => {},
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
                  "index$" => 2,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "player" => {
          "fields" => [
            {
              "active" => true,
              "name" => "player",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "success",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 1,
            },
          ],
          "name" => "player",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "player_data" => {
          "fields" => [
            {
              "active" => true,
              "name" => "date",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "ended",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "game_type",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "map",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "mode",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "session",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "success",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "uuid",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 7,
            },
          ],
          "name" => "player_data",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "list",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "resource" => {
          "fields" => [
            {
              "active" => true,
              "name" => "achievement",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "challenge",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "game",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "last_updated",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "one_time",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "quest",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "rarity",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "success",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "tiered",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "type",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 9,
            },
          ],
          "name" => "resource",
          "op" => {
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 1,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 2,
                },
                {
                  "active" => true,
                  "args" => {},
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
                  "index$" => 3,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 4,
                },
                {
                  "active" => true,
                  "args" => {},
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
                  "index$" => 5,
                },
                {
                  "active" => true,
                  "args" => {},
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
                  "index$" => 6,
                },
              ],
              "key$" => "load",
            },
          },
          "relations" => {
            "ancestors" => [],
          },
        },
        "sky_block" => {
          "fields" => [
            {
              "active" => true,
              "name" => "auction",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 0,
            },
            {
              "active" => true,
              "name" => "auctioneer",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 1,
            },
            {
              "active" => true,
              "name" => "bid",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 2,
            },
            {
              "active" => true,
              "name" => "category",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 3,
            },
            {
              "active" => true,
              "name" => "claimed",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 4,
            },
            {
              "active" => true,
              "name" => "claimed_bidder",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 5,
            },
            {
              "active" => true,
              "name" => "collection",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 6,
            },
            {
              "active" => true,
              "name" => "color",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 7,
            },
            {
              "active" => true,
              "name" => "coop",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 8,
            },
            {
              "active" => true,
              "name" => "current",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 9,
            },
            {
              "active" => true,
              "name" => "end",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 10,
            },
            {
              "active" => true,
              "name" => "event",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 11,
            },
            {
              "active" => true,
              "name" => "extra",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 12,
            },
            {
              "active" => true,
              "name" => "full_lore",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 13,
            },
            {
              "active" => true,
              "name" => "garden",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 14,
            },
            {
              "active" => true,
              "name" => "highest_bid_amount",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 15,
            },
            {
              "active" => true,
              "name" => "id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 16,
            },
            {
              "active" => true,
              "name" => "item",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 17,
            },
            {
              "active" => true,
              "name" => "item_byte",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 18,
            },
            {
              "active" => true,
              "name" => "item_lore",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 19,
            },
            {
              "active" => true,
              "name" => "item_name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 20,
            },
            {
              "active" => true,
              "name" => "last_updated",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 21,
            },
            {
              "active" => true,
              "name" => "link",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 22,
            },
            {
              "active" => true,
              "name" => "lore",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 23,
            },
            {
              "active" => true,
              "name" => "material",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 24,
            },
            {
              "active" => true,
              "name" => "mayor",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 25,
            },
            {
              "active" => true,
              "name" => "member",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 26,
            },
            {
              "active" => true,
              "name" => "name",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 27,
            },
            {
              "active" => true,
              "name" => "npc_sell_price",
              "req" => false,
              "type" => "`$NUMBER`",
              "index$" => 28,
            },
            {
              "active" => true,
              "name" => "page",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 29,
            },
            {
              "active" => true,
              "name" => "product",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 30,
            },
            {
              "active" => true,
              "name" => "profile",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 31,
            },
            {
              "active" => true,
              "name" => "profile_id",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 32,
            },
            {
              "active" => true,
              "name" => "progress",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 33,
            },
            {
              "active" => true,
              "name" => "required_amount",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 34,
            },
            {
              "active" => true,
              "name" => "sale",
              "req" => false,
              "type" => "`$ARRAY`",
              "index$" => 35,
            },
            {
              "active" => true,
              "name" => "skill",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 36,
            },
            {
              "active" => true,
              "name" => "start",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 37,
            },
            {
              "active" => true,
              "name" => "starting_bid",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 38,
            },
            {
              "active" => true,
              "name" => "stat",
              "req" => false,
              "type" => "`$OBJECT`",
              "index$" => 39,
            },
            {
              "active" => true,
              "name" => "success",
              "req" => false,
              "type" => "`$BOOLEAN`",
              "index$" => 40,
            },
            {
              "active" => true,
              "name" => "text",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 41,
            },
            {
              "active" => true,
              "name" => "tier",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 42,
            },
            {
              "active" => true,
              "name" => "title",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 43,
            },
            {
              "active" => true,
              "name" => "total_auction",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 44,
            },
            {
              "active" => true,
              "name" => "total_page",
              "req" => false,
              "type" => "`$INTEGER`",
              "index$" => 45,
            },
            {
              "active" => true,
              "name" => "uuid",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 46,
            },
            {
              "active" => true,
              "name" => "version",
              "req" => false,
              "type" => "`$STRING`",
              "index$" => 47,
            },
          ],
          "name" => "sky_block",
          "op" => {
            "list" => {
              "input" => "data",
              "name" => "list",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "player",
                        "orig" => "player",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "profile",
                        "orig" => "profile",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => false,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "example" => 0,
                        "kind" => "query",
                        "name" => "page",
                        "orig" => "page",
                        "reqd" => false,
                        "type" => "`$INTEGER`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 1,
                },
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 2,
                },
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "uuid",
                        "orig" => "uuid",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 3,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 4,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 5,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 6,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 7,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 8,
                },
              ],
              "key$" => "list",
            },
            "load" => {
              "input" => "data",
              "name" => "load",
              "points" => [
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "profile",
                        "orig" => "profile",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 0,
                },
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "profile",
                        "orig" => "profile",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 1,
                },
                {
                  "active" => true,
                  "args" => {
                    "query" => [
                      {
                        "active" => true,
                        "kind" => "query",
                        "name" => "profile",
                        "orig" => "profile",
                        "reqd" => true,
                        "type" => "`$STRING`",
                      },
                    ],
                  },
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
                    "res" => "`body`",
                  },
                  "index$" => 2,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 3,
                },
                {
                  "active" => true,
                  "args" => {},
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
                  "index$" => 4,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 5,
                },
                {
                  "active" => true,
                  "args" => {},
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
                    "res" => "`body`",
                  },
                  "index$" => 6,
                },
              ],
              "key$" => "load",
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
