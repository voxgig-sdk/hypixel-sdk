-- Hypixel SDK configuration

local function make_config()
  return {
    main = {
      name = "Hypixel",
    },
    feature = {
      ["test"] = {
        ["options"] = {
          ["active"] = false,
        },
      },
    },
    options = {
      base = "https://api.hypixel.net",
      auth = {
        prefix = "",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["guild"] = {},
        ["housing"] = {},
        ["other"] = {},
        ["player"] = {},
        ["player_data"] = {},
        ["resource"] = {},
        ["sky_block"] = {},
      },
    },
    entity = {
      ["guild"] = {
        ["fields"] = {},
        ["name"] = "guild",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "id",
                      ["orig"] = "id",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "name",
                      ["orig"] = "name",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "player",
                      ["orig"] = "player",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/guild",
                ["parts"] = {
                  "v2",
                  "guild",
                },
                ["select"] = {
                  ["exist"] = {
                    "id",
                    "name",
                    "player",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.guild`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["housing"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "houses",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 1,
          },
        },
        ["name"] = "housing",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/housing/player",
                ["parts"] = {
                  "v2",
                  "housing",
                  "player",
                },
                ["select"] = {
                  ["$action"] = "player",
                  ["exist"] = {
                    "uuid",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.houses`",
                },
                ["index$"] = 0,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/housing/houses",
                ["parts"] = {
                  "v2",
                  "housing",
                  "houses",
                },
                ["select"] = {
                  ["$action"] = "house",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.houses`",
                },
                ["index$"] = 1,
              },
            },
            ["key$"] = "list",
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "house",
                      ["orig"] = "house",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/housing/house",
                ["parts"] = {
                  "v2",
                  "housing",
                  "house",
                },
                ["select"] = {
                  ["$action"] = "house",
                  ["exist"] = {
                    "house",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.house`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["other"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "boosterState",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "boosters",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "staff_rollingDaily",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "staff_total",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 4,
          },
          {
            ["active"] = true,
            ["name"] = "watchdog_lastMinute",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 5,
          },
          {
            ["active"] = true,
            ["name"] = "watchdog_rollingDaily",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 6,
          },
          {
            ["active"] = true,
            ["name"] = "watchdog_total",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 7,
          },
        },
        ["name"] = "other",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/boosters",
                ["parts"] = {
                  "v2",
                  "boosters",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "list",
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/counts",
                ["parts"] = {
                  "v2",
                  "counts",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.games`",
                },
                ["index$"] = 0,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/leaderboards",
                ["parts"] = {
                  "v2",
                  "leaderboards",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.leaderboards`",
                },
                ["index$"] = 1,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/punishmentstats",
                ["parts"] = {
                  "v2",
                  "punishmentstats",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 2,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["player"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "displayname",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "firstLogin",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "lastLogin",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "lastLogout",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "monthlyPackageRank",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 4,
          },
          {
            ["active"] = true,
            ["name"] = "newPackageRank",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 5,
          },
          {
            ["active"] = true,
            ["name"] = "packageRank",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 6,
          },
          {
            ["active"] = true,
            ["name"] = "rank",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 7,
          },
          {
            ["active"] = true,
            ["name"] = "stats",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 8,
          },
          {
            ["active"] = true,
            ["name"] = "uuid",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 9,
          },
        },
        ["name"] = "player",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/player",
                ["parts"] = {
                  "v2",
                  "player",
                },
                ["select"] = {
                  ["exist"] = {
                    "uuid",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.player`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["player_data"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "date",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "ended",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "gameType",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "map",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "mode",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 4,
          },
          {
            ["active"] = true,
            ["name"] = "online",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 5,
          },
        },
        ["name"] = "player_data",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/recentgames",
                ["parts"] = {
                  "v2",
                  "recentgames",
                },
                ["select"] = {
                  ["exist"] = {
                    "uuid",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.games`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "list",
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/status",
                ["parts"] = {
                  "v2",
                  "status",
                },
                ["select"] = {
                  ["exist"] = {
                    "uuid",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.session`",
                },
                ["index$"] = 0,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["resource"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "databaseName",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "id",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "lastUpdated",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "modeNames",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "name",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 4,
          },
          {
            ["active"] = true,
            ["name"] = "one_time",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 5,
          },
          {
            ["active"] = true,
            ["name"] = "rarities",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 6,
          },
          {
            ["active"] = true,
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 7,
          },
          {
            ["active"] = true,
            ["name"] = "tiered",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 8,
          },
          {
            ["active"] = true,
            ["name"] = "types",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 9,
          },
        },
        ["name"] = "resource",
        ["op"] = {
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/achievements",
                ["parts"] = {
                  "v2",
                  "resources",
                  "achievements",
                },
                ["select"] = {
                  ["$action"] = "achievement",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.achievements`",
                },
                ["index$"] = 0,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/challenges",
                ["parts"] = {
                  "v2",
                  "resources",
                  "challenges",
                },
                ["select"] = {
                  ["$action"] = "challenge",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.challenges`",
                },
                ["index$"] = 1,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/games",
                ["parts"] = {
                  "v2",
                  "resources",
                  "games",
                },
                ["select"] = {
                  ["$action"] = "game",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.games`",
                },
                ["index$"] = 2,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/guilds/achievements",
                ["parts"] = {
                  "v2",
                  "resources",
                  "guilds",
                  "achievements",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 3,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/quests",
                ["parts"] = {
                  "v2",
                  "resources",
                  "quests",
                },
                ["select"] = {
                  ["$action"] = "quest",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.quests`",
                },
                ["index$"] = 4,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/vanity/companions",
                ["parts"] = {
                  "v2",
                  "resources",
                  "vanity",
                  "companions",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 5,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/vanity/pets",
                ["parts"] = {
                  "v2",
                  "resources",
                  "vanity",
                  "pets",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 6,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["sky_block"] = {
        ["fields"] = {
          {
            ["active"] = true,
            ["name"] = "auctioneer",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 0,
          },
          {
            ["active"] = true,
            ["name"] = "auctions",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 1,
          },
          {
            ["active"] = true,
            ["name"] = "bids",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 2,
          },
          {
            ["active"] = true,
            ["name"] = "category",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 3,
          },
          {
            ["active"] = true,
            ["name"] = "claimed",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 4,
          },
          {
            ["active"] = true,
            ["name"] = "claimed_bidders",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 5,
          },
          {
            ["active"] = true,
            ["name"] = "color",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 6,
          },
          {
            ["active"] = true,
            ["name"] = "coop",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 7,
          },
          {
            ["active"] = true,
            ["name"] = "current",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 8,
          },
          {
            ["active"] = true,
            ["name"] = "end",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 9,
          },
          {
            ["active"] = true,
            ["name"] = "events",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 10,
          },
          {
            ["active"] = true,
            ["name"] = "extra",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 11,
          },
          {
            ["active"] = true,
            ["name"] = "fullLore",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 12,
          },
          {
            ["active"] = true,
            ["name"] = "highest_bid_amount",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 13,
          },
          {
            ["active"] = true,
            ["name"] = "id",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 14,
          },
          {
            ["active"] = true,
            ["name"] = "item",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 15,
          },
          {
            ["active"] = true,
            ["name"] = "item_bytes",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 16,
          },
          {
            ["active"] = true,
            ["name"] = "item_lore",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 17,
          },
          {
            ["active"] = true,
            ["name"] = "item_name",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 18,
          },
          {
            ["active"] = true,
            ["name"] = "lastUpdated",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 19,
          },
          {
            ["active"] = true,
            ["name"] = "link",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 20,
          },
          {
            ["active"] = true,
            ["name"] = "lore",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 21,
          },
          {
            ["active"] = true,
            ["name"] = "material",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 22,
          },
          {
            ["active"] = true,
            ["name"] = "mayor",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 23,
          },
          {
            ["active"] = true,
            ["name"] = "name",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 24,
          },
          {
            ["active"] = true,
            ["name"] = "npc_sell_price",
            ["req"] = false,
            ["type"] = "`$NUMBER`",
            ["index$"] = 25,
          },
          {
            ["active"] = true,
            ["name"] = "page",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 26,
          },
          {
            ["active"] = true,
            ["name"] = "profile_id",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 27,
          },
          {
            ["active"] = true,
            ["name"] = "profiles",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 28,
          },
          {
            ["active"] = true,
            ["name"] = "progress",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 29,
          },
          {
            ["active"] = true,
            ["name"] = "requiredAmount",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 30,
          },
          {
            ["active"] = true,
            ["name"] = "sales",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 31,
          },
          {
            ["active"] = true,
            ["name"] = "start",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 32,
          },
          {
            ["active"] = true,
            ["name"] = "starting_bid",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 33,
          },
          {
            ["active"] = true,
            ["name"] = "stats",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["index$"] = 34,
          },
          {
            ["active"] = true,
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["index$"] = 35,
          },
          {
            ["active"] = true,
            ["name"] = "text",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 36,
          },
          {
            ["active"] = true,
            ["name"] = "tier",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 37,
          },
          {
            ["active"] = true,
            ["name"] = "tiers",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["index$"] = 38,
          },
          {
            ["active"] = true,
            ["name"] = "title",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 39,
          },
          {
            ["active"] = true,
            ["name"] = "totalAuctions",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 40,
          },
          {
            ["active"] = true,
            ["name"] = "totalPages",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["index$"] = 41,
          },
          {
            ["active"] = true,
            ["name"] = "uuid",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["index$"] = 42,
          },
        },
        ["name"] = "sky_block",
        ["op"] = {
          ["list"] = {
            ["input"] = "data",
            ["name"] = "list",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "player",
                      ["orig"] = "player",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "profile",
                      ["orig"] = "profile",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/auction",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "auction",
                },
                ["select"] = {
                  ["exist"] = {
                    "player",
                    "profile",
                    "uuid",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.auctions`",
                },
                ["index$"] = 0,
              },
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["example"] = 0,
                      ["kind"] = "query",
                      ["name"] = "page",
                      ["orig"] = "page",
                      ["reqd"] = false,
                      ["type"] = "`$INTEGER`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/auctions",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "auctions",
                },
                ["select"] = {
                  ["exist"] = {
                    "page",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.auctions`",
                },
                ["index$"] = 1,
              },
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/bingo",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "bingo",
                },
                ["select"] = {
                  ["exist"] = {
                    "uuid",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.events`",
                },
                ["index$"] = 2,
              },
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/profiles",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "profiles",
                },
                ["select"] = {
                  ["exist"] = {
                    "uuid",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.profiles`",
                },
                ["index$"] = 3,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/bingo",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "bingo",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.goals`",
                },
                ["index$"] = 4,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/items",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "items",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.items`",
                },
                ["index$"] = 5,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/auctions_ended",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "auctions_ended",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.auctions`",
                },
                ["index$"] = 6,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/firesales",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "firesales",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.sales`",
                },
                ["index$"] = 7,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/news",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "news",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.items`",
                },
                ["index$"] = 8,
              },
            },
            ["key$"] = "list",
          },
          ["load"] = {
            ["input"] = "data",
            ["name"] = "load",
            ["points"] = {
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "profile",
                      ["orig"] = "profile",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/garden",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "garden",
                },
                ["select"] = {
                  ["exist"] = {
                    "profile",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.garden`",
                },
                ["index$"] = 0,
              },
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "profile",
                      ["orig"] = "profile",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/museum",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "museum",
                },
                ["select"] = {
                  ["exist"] = {
                    "profile",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.members`",
                },
                ["index$"] = 1,
              },
              {
                ["active"] = true,
                ["args"] = {
                  ["query"] = {
                    {
                      ["active"] = true,
                      ["kind"] = "query",
                      ["name"] = "profile",
                      ["orig"] = "profile",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                    },
                  },
                },
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/profile",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "profile",
                },
                ["select"] = {
                  ["exist"] = {
                    "profile",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.profile`",
                },
                ["index$"] = 2,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/collections",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "collections",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.collections`",
                },
                ["index$"] = 3,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/election",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "election",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["index$"] = 4,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/skills",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "skills",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.skills`",
                },
                ["index$"] = 5,
              },
              {
                ["active"] = true,
                ["args"] = {},
                ["kind"] = "http",
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/bazaar",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "bazaar",
                },
                ["select"] = {},
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body.products`",
                },
                ["index$"] = 6,
              },
            },
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
    },
  }
end


local function make_feature(name)
  local features = require("features")
  local factory = features[name]
  if factory ~= nil then
    return factory()
  end
  return features.base()
end


-- Attach make_feature to the SDK class
local function setup_sdk(SDK)
  SDK._make_feature = make_feature
end


return make_config
