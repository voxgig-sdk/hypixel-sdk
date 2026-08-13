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
            "auth": {
                "prefix": "",
            },
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
        "fields": [],
        "name": "guild",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "id",
                      "orig": "id",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                    {
                      "active": True,
                      "kind": "query",
                      "name": "name",
                      "orig": "name",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                    {
                      "active": True,
                      "kind": "query",
                      "name": "player",
                      "orig": "player",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.guild`",
                },
                "index$": 0,
              },
            ],
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
            "active": True,
            "name": "houses",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 1,
          },
        ],
        "name": "housing",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.houses`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
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
                  "res": "`body.houses`",
                },
                "index$": 1,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "house",
                      "orig": "house",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.house`",
                },
                "index$": 0,
              },
            ],
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
            "active": True,
            "name": "boosterState",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "boosters",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "staff_rollingDaily",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "staff_total",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "watchdog_lastMinute",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "watchdog_rollingDaily",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "watchdog_total",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 7,
          },
        ],
        "name": "other",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/boosters",
                "parts": [
                  "v2",
                  "boosters",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/counts",
                "parts": [
                  "v2",
                  "counts",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.games`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/leaderboards",
                "parts": [
                  "v2",
                  "leaderboards",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.leaderboards`",
                },
                "index$": 1,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/punishmentstats",
                "parts": [
                  "v2",
                  "punishmentstats",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 2,
              },
            ],
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
            "active": True,
            "name": "displayname",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "firstLogin",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "lastLogin",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "lastLogout",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "monthlyPackageRank",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "newPackageRank",
            "req": False,
            "type": "`$STRING`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "packageRank",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "rank",
            "req": False,
            "type": "`$STRING`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "stats",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "uuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 9,
          },
        ],
        "name": "player",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.player`",
                },
                "index$": 0,
              },
            ],
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
            "active": True,
            "name": "date",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "ended",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "gameType",
            "req": False,
            "type": "`$STRING`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "map",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "mode",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "online",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 5,
          },
        ],
        "name": "player_data",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.games`",
                },
                "index$": 0,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.session`",
                },
                "index$": 0,
              },
            ],
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
            "active": True,
            "name": "databaseName",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "lastUpdated",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "modeNames",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "name",
            "req": False,
            "type": "`$STRING`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "one_time",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "rarities",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "tiered",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "types",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 9,
          },
        ],
        "name": "resource",
        "op": {
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {},
                "kind": "http",
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
                  "res": "`body.achievements`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
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
                  "res": "`body.challenges`",
                },
                "index$": 1,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
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
                  "res": "`body.games`",
                },
                "index$": 2,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/resources/guilds/achievements",
                "parts": [
                  "v2",
                  "resources",
                  "guilds",
                  "achievements",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 3,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
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
                  "res": "`body.quests`",
                },
                "index$": 4,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/resources/vanity/companions",
                "parts": [
                  "v2",
                  "resources",
                  "vanity",
                  "companions",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 5,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/resources/vanity/pets",
                "parts": [
                  "v2",
                  "resources",
                  "vanity",
                  "pets",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 6,
              },
            ],
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
            "active": True,
            "name": "auctioneer",
            "req": False,
            "type": "`$STRING`",
            "index$": 0,
          },
          {
            "active": True,
            "name": "auctions",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 1,
          },
          {
            "active": True,
            "name": "bids",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 2,
          },
          {
            "active": True,
            "name": "category",
            "req": False,
            "type": "`$STRING`",
            "index$": 3,
          },
          {
            "active": True,
            "name": "claimed",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 4,
          },
          {
            "active": True,
            "name": "claimed_bidders",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 5,
          },
          {
            "active": True,
            "name": "color",
            "req": False,
            "type": "`$STRING`",
            "index$": 6,
          },
          {
            "active": True,
            "name": "coop",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 7,
          },
          {
            "active": True,
            "name": "current",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 8,
          },
          {
            "active": True,
            "name": "end",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 9,
          },
          {
            "active": True,
            "name": "events",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 10,
          },
          {
            "active": True,
            "name": "extra",
            "req": False,
            "type": "`$STRING`",
            "index$": 11,
          },
          {
            "active": True,
            "name": "fullLore",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 12,
          },
          {
            "active": True,
            "name": "highest_bid_amount",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 13,
          },
          {
            "active": True,
            "name": "id",
            "req": False,
            "type": "`$STRING`",
            "index$": 14,
          },
          {
            "active": True,
            "name": "item",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 15,
          },
          {
            "active": True,
            "name": "item_bytes",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 16,
          },
          {
            "active": True,
            "name": "item_lore",
            "req": False,
            "type": "`$STRING`",
            "index$": 17,
          },
          {
            "active": True,
            "name": "item_name",
            "req": False,
            "type": "`$STRING`",
            "index$": 18,
          },
          {
            "active": True,
            "name": "lastUpdated",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 19,
          },
          {
            "active": True,
            "name": "link",
            "req": False,
            "type": "`$STRING`",
            "index$": 20,
          },
          {
            "active": True,
            "name": "lore",
            "req": False,
            "type": "`$STRING`",
            "index$": 21,
          },
          {
            "active": True,
            "name": "material",
            "req": False,
            "type": "`$STRING`",
            "index$": 22,
          },
          {
            "active": True,
            "name": "mayor",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 23,
          },
          {
            "active": True,
            "name": "name",
            "req": False,
            "type": "`$STRING`",
            "index$": 24,
          },
          {
            "active": True,
            "name": "npc_sell_price",
            "req": False,
            "type": "`$NUMBER`",
            "index$": 25,
          },
          {
            "active": True,
            "name": "page",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 26,
          },
          {
            "active": True,
            "name": "profile_id",
            "req": False,
            "type": "`$STRING`",
            "index$": 27,
          },
          {
            "active": True,
            "name": "profiles",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 28,
          },
          {
            "active": True,
            "name": "progress",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 29,
          },
          {
            "active": True,
            "name": "requiredAmount",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 30,
          },
          {
            "active": True,
            "name": "sales",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 31,
          },
          {
            "active": True,
            "name": "start",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 32,
          },
          {
            "active": True,
            "name": "starting_bid",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 33,
          },
          {
            "active": True,
            "name": "stats",
            "req": False,
            "type": "`$OBJECT`",
            "index$": 34,
          },
          {
            "active": True,
            "name": "success",
            "req": False,
            "type": "`$BOOLEAN`",
            "index$": 35,
          },
          {
            "active": True,
            "name": "text",
            "req": False,
            "type": "`$STRING`",
            "index$": 36,
          },
          {
            "active": True,
            "name": "tier",
            "req": False,
            "type": "`$STRING`",
            "index$": 37,
          },
          {
            "active": True,
            "name": "tiers",
            "req": False,
            "type": "`$ARRAY`",
            "index$": 38,
          },
          {
            "active": True,
            "name": "title",
            "req": False,
            "type": "`$STRING`",
            "index$": 39,
          },
          {
            "active": True,
            "name": "totalAuctions",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 40,
          },
          {
            "active": True,
            "name": "totalPages",
            "req": False,
            "type": "`$INTEGER`",
            "index$": 41,
          },
          {
            "active": True,
            "name": "uuid",
            "req": False,
            "type": "`$STRING`",
            "index$": 42,
          },
        ],
        "name": "sky_block",
        "op": {
          "list": {
            "input": "data",
            "name": "list",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "player",
                      "orig": "player",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                    {
                      "active": True,
                      "kind": "query",
                      "name": "profile",
                      "orig": "profile",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                    {
                      "active": True,
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": False,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.auctions`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "example": 0,
                      "kind": "query",
                      "name": "page",
                      "orig": "page",
                      "reqd": False,
                      "type": "`$INTEGER`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.auctions`",
                },
                "index$": 1,
              },
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.events`",
                },
                "index$": 2,
              },
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "uuid",
                      "orig": "uuid",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.profiles`",
                },
                "index$": 3,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/resources/skyblock/bingo",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "bingo",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.goals`",
                },
                "index$": 4,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/resources/skyblock/items",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "items",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.items`",
                },
                "index$": 5,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/skyblock/auctions_ended",
                "parts": [
                  "v2",
                  "skyblock",
                  "auctions_ended",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.auctions`",
                },
                "index$": 6,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/skyblock/firesales",
                "parts": [
                  "v2",
                  "skyblock",
                  "firesales",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.sales`",
                },
                "index$": 7,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/skyblock/news",
                "parts": [
                  "v2",
                  "skyblock",
                  "news",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.items`",
                },
                "index$": 8,
              },
            ],
            "key$": "list",
          },
          "load": {
            "input": "data",
            "name": "load",
            "points": [
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "profile",
                      "orig": "profile",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.garden`",
                },
                "index$": 0,
              },
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "profile",
                      "orig": "profile",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.members`",
                },
                "index$": 1,
              },
              {
                "active": True,
                "args": {
                  "query": [
                    {
                      "active": True,
                      "kind": "query",
                      "name": "profile",
                      "orig": "profile",
                      "reqd": True,
                      "type": "`$STRING`",
                    },
                  ],
                },
                "kind": "http",
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
                  "res": "`body.profile`",
                },
                "index$": 2,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/resources/skyblock/collections",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "collections",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.collections`",
                },
                "index$": 3,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/resources/skyblock/election",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "election",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body`",
                },
                "index$": 4,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/resources/skyblock/skills",
                "parts": [
                  "v2",
                  "resources",
                  "skyblock",
                  "skills",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.skills`",
                },
                "index$": 5,
              },
              {
                "active": True,
                "args": {},
                "kind": "http",
                "method": "GET",
                "orig": "/v2/skyblock/bazaar",
                "parts": [
                  "v2",
                  "skyblock",
                  "bazaar",
                ],
                "select": {},
                "transform": {
                  "req": "`reqdata`",
                  "res": "`body.products`",
                },
                "index$": 6,
              },
            ],
            "key$": "load",
          },
        },
        "relations": {
          "ancestors": [],
        },
      },
    },
    }
