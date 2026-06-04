# Hypixel SDK configuration


def make_config():
    return {
        "main": {
            "name": "Hypixel",
        },
        "feature": {
            "test": {
        "options": {
          "active": False,
        },
      },
        },
        "options": {
            "base": "https://api.hypixel.net",
            "headers": {
        "content-type": "application/json",
      },
            "entity": {
                "guild": {},
                "housing": {},
                "other": {},
                "player": {},
                "player_data": {},
                "resource": {},
                "sky_block": {},
            },
        },
        "entity": {
      "guild": {
        "fields": [
          {
            "name": "guild",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "active": True,
            "index$": 1,
          },
        ],
        "name": "guild",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "id",
                      "orig": "id",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "query",
                      "name": "name",
                      "orig": "name",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "query",
                      "name": "player",
                      "orig": "player",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/guild",
                "parts": [
                  "v2",
                  "guild",
                ],
                "select": {
                  "exist": [
                    "id",
                    "name",
                    "player",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "housing": {
        "fields": [
          {
            "name": "house",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "active": True,
            "index$": 1,
          },
        ],
        "name": "housing",
        "op": {
          "list": {
            "name": "list",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/housing/player",
                "parts": [
                  "v2",
                  "housing",
                  "player",
                ],
                "select": {
                  "$action": "player",
                  "exist": [
                    "uuid",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
              {
                "method": "GET",
                "orig": "/v2/housing/houses",
                "parts": [
                  "v2",
                  "housing",
                  "houses",
                ],
                "select": {
                  "$action": "house",
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "index$": 1,
              },
            ],
            "input": "data",
            "key$": "list",
          },
          "load": {
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "house",
                      "orig": "house",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/housing/house",
                "parts": [
                  "v2",
                  "housing",
                  "house",
                ],
                "select": {
                  "$action": "house",
                  "exist": [
                    "house",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "other": {
        "fields": [
          {
            "name": "booster",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "booster_state",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "game",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 2,
          },
          {
            "name": "leaderboard",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 3,
          },
          {
            "name": "player_count",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 4,
          },
          {
            "name": "staff_rolling_daily",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 5,
          },
          {
            "name": "staff_total",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 6,
          },
          {
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "active": True,
            "index$": 7,
          },
          {
            "name": "watchdog_last_minute",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 8,
          },
          {
            "name": "watchdog_rolling_daily",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 9,
          },
          {
            "name": "watchdog_total",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 10,
          },
        ],
        "name": "other",
        "op": {
          "list": {
            "name": "list",
            "points": [
              {
                "method": "GET",
                "orig": "/v2/boosters",
                "parts": [
                  "v2",
                  "boosters",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "list",
          },
          "load": {
            "name": "load",
            "points": [
              {
                "method": "GET",
                "orig": "/v2/counts",
                "parts": [
                  "v2",
                  "counts",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 0,
              },
              {
                "method": "GET",
                "orig": "/v2/leaderboards",
                "parts": [
                  "v2",
                  "leaderboards",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 1,
              },
              {
                "method": "GET",
                "orig": "/v2/punishmentstats",
                "parts": [
                  "v2",
                  "punishmentstats",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 2,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "player": {
        "fields": [
          {
            "name": "player",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "active": True,
            "index$": 1,
          },
        ],
        "name": "player",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/player",
                "parts": [
                  "v2",
                  "player",
                ],
                "select": {
                  "exist": [
                    "uuid",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "player_data": {
        "fields": [
          {
            "name": "date",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "ended",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "game_type",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 2,
          },
          {
            "name": "map",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 3,
          },
          {
            "name": "mode",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 4,
          },
          {
            "name": "session",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 5,
          },
          {
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "active": True,
            "index$": 6,
          },
          {
            "name": "uuid",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 7,
          },
        ],
        "name": "player_data",
        "op": {
          "list": {
            "name": "list",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/recentgames",
                "parts": [
                  "v2",
                  "recentgames",
                ],
                "select": {
                  "exist": [
                    "uuid",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "list",
          },
          "load": {
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/status",
                "parts": [
                  "v2",
                  "status",
                ],
                "select": {
                  "exist": [
                    "uuid",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "resource": {
        "fields": [
          {
            "name": "achievement",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "challenge",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "game",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 2,
          },
          {
            "name": "last_updated",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 3,
          },
          {
            "name": "one_time",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 4,
          },
          {
            "name": "quest",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 5,
          },
          {
            "name": "rarity",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 6,
          },
          {
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "active": True,
            "index$": 7,
          },
          {
            "name": "tiered",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 8,
          },
          {
            "name": "type",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 9,
          },
        ],
        "name": "resource",
        "op": {
          "load": {
            "name": "load",
            "points": [
              {
                "method": "GET",
                "orig": "/v2/resources/achievements",
                "parts": [
                  "v2",
                  "resources",
                  "achievements",
                ],
                "select": {
                  "$action": "achievement",
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "index$": 0,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/challenges",
                "parts": [
                  "v2",
                  "resources",
                  "challenges",
                ],
                "select": {
                  "$action": "challenge",
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "index$": 1,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/games",
                "parts": [
                  "v2",
                  "resources",
                  "games",
                ],
                "select": {
                  "$action": "game",
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "index$": 2,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/guilds/achievements",
                "parts": [
                  "v2",
                  "resources",
                  "guilds",
                  "achievements",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 3,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/quests",
                "parts": [
                  "v2",
                  "resources",
                  "quests",
                ],
                "select": {
                  "$action": "quest",
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "index$": 4,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/vanity/companions",
                "parts": [
                  "v2",
                  "resources",
                  "vanity",
                  "companions",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 5,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/vanity/pets",
                "parts": [
                  "v2",
                  "resources",
                  "vanity",
                  "pets",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 6,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
      "sky_block": {
        "fields": [
          {
            "name": "auction",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 0,
          },
          {
            "name": "auctioneer",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 1,
          },
          {
            "name": "bid",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 2,
          },
          {
            "name": "category",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 3,
          },
          {
            "name": "claimed",
            "req": False,
            "type": "`$BOOLEAN`",
            "active": True,
            "index$": 4,
          },
          {
            "name": "claimed_bidder",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 5,
          },
          {
            "name": "collection",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 6,
          },
          {
            "name": "color",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 7,
          },
          {
            "name": "coop",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 8,
          },
          {
            "name": "current",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 9,
          },
          {
            "name": "end",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 10,
          },
          {
            "name": "event",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 11,
          },
          {
            "name": "extra",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 12,
          },
          {
            "name": "full_lore",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 13,
          },
          {
            "name": "garden",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 14,
          },
          {
            "name": "highest_bid_amount",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 15,
          },
          {
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 16,
          },
          {
            "name": "item",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 17,
          },
          {
            "name": "item_byte",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 18,
          },
          {
            "name": "item_lore",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 19,
          },
          {
            "name": "item_name",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 20,
          },
          {
            "name": "last_updated",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 21,
          },
          {
            "name": "link",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 22,
          },
          {
            "name": "lore",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 23,
          },
          {
            "name": "material",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 24,
          },
          {
            "name": "mayor",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 25,
          },
          {
            "name": "member",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 26,
          },
          {
            "name": "name",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 27,
          },
          {
            "name": "npc_sell_price",
            "req": False,
            "type": "`$NUMBER`",
            "active": True,
            "index$": 28,
          },
          {
            "name": "page",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 29,
          },
          {
            "name": "product",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 30,
          },
          {
            "name": "profile",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 31,
          },
          {
            "name": "profile_id",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 32,
          },
          {
            "name": "progress",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 33,
          },
          {
            "name": "required_amount",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 34,
          },
          {
            "name": "sale",
            "req": False,
            "type": "`$ARRAY`",
            "active": True,
            "index$": 35,
          },
          {
            "name": "skill",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 36,
          },
          {
            "name": "start",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 37,
          },
          {
            "name": "starting_bid",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 38,
          },
          {
            "name": "stat",
            "req": False,
            "type": "`$OBJECT`",
            "active": True,
            "index$": 39,
          },
          {
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "active": True,
            "index$": 40,
          },
          {
            "name": "text",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 41,
          },
          {
            "name": "tier",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 42,
          },
          {
            "name": "title",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 43,
          },
          {
            "name": "total_auction",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 44,
          },
          {
            "name": "total_page",
            "req": False,
            "type": "`$INTEGER`",
            "active": True,
            "index$": 45,
          },
          {
            "name": "uuid",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 46,
          },
          {
            "name": "version",
            "req": False,
            "type": "`$STRING`",
            "active": True,
            "index$": 47,
          },
        ],
        "name": "sky_block",
        "op": {
          "list": {
            "name": "list",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "player",
                      "orig": "player",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "query",
                      "name": "profile",
                      "orig": "profile",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                    {
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": False,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/skyblock/auction",
                "parts": [
                  "v2",
                  "skyblock",
                  "auction",
                ],
                "select": {
                  "exist": [
                    "player",
                    "profile",
                    "uuid",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
              {
                "args": {
                  "query": [
                    {
                      "example": 0,
                      "kind": "query",
                      "name": "page",
                      "orig": "page",
                      "reqd": False,
                      "type": "`$INTEGER`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/skyblock/auctions",
                "parts": [
                  "v2",
                  "skyblock",
                  "auctions",
                ],
                "select": {
                  "exist": [
                    "page",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 1,
              },
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/skyblock/bingo",
                "parts": [
                  "v2",
                  "skyblock",
                  "bingo",
                ],
                "select": {
                  "exist": [
                    "uuid",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 2,
              },
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/skyblock/profiles",
                "parts": [
                  "v2",
                  "skyblock",
                  "profiles",
                ],
                "select": {
                  "exist": [
                    "uuid",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 3,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/skyblock/bingo",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "bingo",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 4,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/skyblock/items",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "items",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 5,
              },
              {
                "method": "GET",
                "orig": "/v2/skyblock/auctions_ended",
                "parts": [
                  "v2",
                  "skyblock",
                  "auctions_ended",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 6,
              },
              {
                "method": "GET",
                "orig": "/v2/skyblock/firesales",
                "parts": [
                  "v2",
                  "skyblock",
                  "firesales",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 7,
              },
              {
                "method": "GET",
                "orig": "/v2/skyblock/news",
                "parts": [
                  "v2",
                  "skyblock",
                  "news",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 8,
              },
            ],
            "input": "data",
            "key$": "list",
          },
          "load": {
            "name": "load",
            "points": [
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "profile",
                      "orig": "profile",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/skyblock/garden",
                "parts": [
                  "v2",
                  "skyblock",
                  "garden",
                ],
                "select": {
                  "exist": [
                    "profile",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 0,
              },
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "profile",
                      "orig": "profile",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/skyblock/museum",
                "parts": [
                  "v2",
                  "skyblock",
                  "museum",
                ],
                "select": {
                  "exist": [
                    "profile",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 1,
              },
              {
                "args": {
                  "query": [
                    {
                      "kind": "query",
                      "name": "profile",
                      "orig": "profile",
                      "reqd": True,
                      "type": "`$STRING`",
                      "active": True,
                    },
                  ],
                },
                "method": "GET",
                "orig": "/v2/skyblock/profile",
                "parts": [
                  "v2",
                  "skyblock",
                  "profile",
                ],
                "select": {
                  "exist": [
                    "profile",
                  ],
                },
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "index$": 2,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/skyblock/collections",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "collections",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 3,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/skyblock/election",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "election",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 4,
              },
              {
                "method": "GET",
                "orig": "/v2/resources/skyblock/skills",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "skills",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 5,
              },
              {
                "method": "GET",
                "orig": "/v2/skyblock/bazaar",
                "parts": [
                  "v2",
                  "skyblock",
                  "bazaar",
                ],
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "active": True,
                "args": {},
                "select": {},
                "index$": 6,
              },
            ],
            "input": "data",
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
