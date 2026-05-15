-- ProjectName SDK configuration

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
        prefix = "Bearer",
      },
      headers = {
        ["content-type"] = "application/json",
      },
      entity = {
        ["guild"] = {},
        ["hous"] = {},
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
        ["fields"] = {
          {
            ["name"] = "guild",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["active"] = true,
            ["index$"] = 1,
          },
        },
        ["name"] = "guild",
        ["op"] = {
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "id",
                      ["orig"] = "id",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "name",
                      ["orig"] = "name",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "player",
                      ["orig"] = "player",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "load",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["hous"] = {
        ["fields"] = {
          {
            ["name"] = "hous",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["active"] = true,
            ["index$"] = 1,
          },
        },
        ["name"] = "hous",
        ["op"] = {
          ["list"] = {
            ["name"] = "list",
            ["points"] = {
              {
                ["method"] = "GET",
                ["orig"] = "/v2/housing/houses",
                ["parts"] = {
                  "v2",
                  "housing",
                  "houses",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "list",
          },
        },
        ["relations"] = {
          ["ancestors"] = {},
        },
      },
      ["housing"] = {
        ["fields"] = {
          {
            ["name"] = "hous",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "houses",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 1,
          },
          {
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["active"] = true,
            ["index$"] = 2,
          },
        },
        ["name"] = "housing",
        ["op"] = {
          ["list"] = {
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "list",
          },
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "houses",
                      ["orig"] = "houses",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
                ["method"] = "GET",
                ["orig"] = "/v2/housing/house",
                ["parts"] = {
                  "v2",
                  "housing",
                  "house",
                },
                ["select"] = {
                  ["$action"] = "houses",
                  ["exist"] = {
                    "houses",
                  },
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
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
            ["name"] = "booster",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "booster_state",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 1,
          },
          {
            ["name"] = "game",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 2,
          },
          {
            ["name"] = "leaderboard",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 3,
          },
          {
            ["name"] = "player_count",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 4,
          },
          {
            ["name"] = "staff_rolling_daily",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 5,
          },
          {
            ["name"] = "staff_total",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 6,
          },
          {
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["active"] = true,
            ["index$"] = 7,
          },
          {
            ["name"] = "watchdog_last_minute",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 8,
          },
          {
            ["name"] = "watchdog_rolling_daily",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 9,
          },
          {
            ["name"] = "watchdog_total",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 10,
          },
        },
        ["name"] = "other",
        ["op"] = {
          ["list"] = {
            ["name"] = "list",
            ["points"] = {
              {
                ["method"] = "GET",
                ["orig"] = "/v2/boosters",
                ["parts"] = {
                  "v2",
                  "boosters",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "list",
          },
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["method"] = "GET",
                ["orig"] = "/v2/counts",
                ["parts"] = {
                  "v2",
                  "counts",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 0,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/leaderboards",
                ["parts"] = {
                  "v2",
                  "leaderboards",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 1,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/punishmentstats",
                ["parts"] = {
                  "v2",
                  "punishmentstats",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 2,
              },
            },
            ["input"] = "data",
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
            ["name"] = "player",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["active"] = true,
            ["index$"] = 1,
          },
        },
        ["name"] = "player",
        ["op"] = {
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
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
            ["name"] = "date",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "ended",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 1,
          },
          {
            ["name"] = "game_type",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 2,
          },
          {
            ["name"] = "map",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 3,
          },
          {
            ["name"] = "mode",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 4,
          },
          {
            ["name"] = "session",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 5,
          },
          {
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["active"] = true,
            ["index$"] = 6,
          },
          {
            ["name"] = "uuid",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 7,
          },
        },
        ["name"] = "player_data",
        ["op"] = {
          ["list"] = {
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
            ["key$"] = "list",
          },
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
            },
            ["input"] = "data",
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
            ["name"] = "achievement",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "challenge",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 1,
          },
          {
            ["name"] = "game",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 2,
          },
          {
            ["name"] = "last_updated",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 3,
          },
          {
            ["name"] = "one_time",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 4,
          },
          {
            ["name"] = "quest",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 5,
          },
          {
            ["name"] = "rarity",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 6,
          },
          {
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["active"] = true,
            ["index$"] = 7,
          },
          {
            ["name"] = "tiered",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 8,
          },
          {
            ["name"] = "type",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 9,
          },
        },
        ["name"] = "resource",
        ["op"] = {
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["index$"] = 0,
              },
              {
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["index$"] = 1,
              },
              {
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["index$"] = 2,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/resources/guilds/achievements",
                ["parts"] = {
                  "v2",
                  "resources",
                  "guilds",
                  "achievements",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 3,
              },
              {
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["index$"] = 4,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/resources/vanity/companions",
                ["parts"] = {
                  "v2",
                  "resources",
                  "vanity",
                  "companions",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 5,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/resources/vanity/pets",
                ["parts"] = {
                  "v2",
                  "resources",
                  "vanity",
                  "pets",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 6,
              },
            },
            ["input"] = "data",
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
            ["name"] = "auction",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 0,
          },
          {
            ["name"] = "auctioneer",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 1,
          },
          {
            ["name"] = "bid",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 2,
          },
          {
            ["name"] = "category",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 3,
          },
          {
            ["name"] = "claimed",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["active"] = true,
            ["index$"] = 4,
          },
          {
            ["name"] = "claimed_bidder",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 5,
          },
          {
            ["name"] = "collection",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 6,
          },
          {
            ["name"] = "color",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 7,
          },
          {
            ["name"] = "coop",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 8,
          },
          {
            ["name"] = "current",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 9,
          },
          {
            ["name"] = "end",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 10,
          },
          {
            ["name"] = "event",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 11,
          },
          {
            ["name"] = "extra",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 12,
          },
          {
            ["name"] = "full_lore",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 13,
          },
          {
            ["name"] = "garden",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 14,
          },
          {
            ["name"] = "highest_bid_amount",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 15,
          },
          {
            ["name"] = "id",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 16,
          },
          {
            ["name"] = "item",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 17,
          },
          {
            ["name"] = "item_byte",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 18,
          },
          {
            ["name"] = "item_lore",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 19,
          },
          {
            ["name"] = "item_name",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 20,
          },
          {
            ["name"] = "last_updated",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 21,
          },
          {
            ["name"] = "link",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 22,
          },
          {
            ["name"] = "lore",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 23,
          },
          {
            ["name"] = "material",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 24,
          },
          {
            ["name"] = "mayor",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 25,
          },
          {
            ["name"] = "member",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 26,
          },
          {
            ["name"] = "name",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 27,
          },
          {
            ["name"] = "npc_sell_price",
            ["req"] = false,
            ["type"] = "`$NUMBER`",
            ["active"] = true,
            ["index$"] = 28,
          },
          {
            ["name"] = "page",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 29,
          },
          {
            ["name"] = "product",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 30,
          },
          {
            ["name"] = "profile",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 31,
          },
          {
            ["name"] = "profile_id",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 32,
          },
          {
            ["name"] = "progress",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 33,
          },
          {
            ["name"] = "required_amount",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 34,
          },
          {
            ["name"] = "sale",
            ["req"] = false,
            ["type"] = "`$ARRAY`",
            ["active"] = true,
            ["index$"] = 35,
          },
          {
            ["name"] = "skill",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 36,
          },
          {
            ["name"] = "start",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 37,
          },
          {
            ["name"] = "starting_bid",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 38,
          },
          {
            ["name"] = "stat",
            ["req"] = false,
            ["type"] = "`$OBJECT`",
            ["active"] = true,
            ["index$"] = 39,
          },
          {
            ["name"] = "success",
            ["req"] = false,
            ["type"] = "`$BOOLEAN`",
            ["active"] = true,
            ["index$"] = 40,
          },
          {
            ["name"] = "text",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 41,
          },
          {
            ["name"] = "tier",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 42,
          },
          {
            ["name"] = "title",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 43,
          },
          {
            ["name"] = "total_auction",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 44,
          },
          {
            ["name"] = "total_page",
            ["req"] = false,
            ["type"] = "`$INTEGER`",
            ["active"] = true,
            ["index$"] = 45,
          },
          {
            ["name"] = "uuid",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 46,
          },
          {
            ["name"] = "version",
            ["req"] = false,
            ["type"] = "`$STRING`",
            ["active"] = true,
            ["index$"] = 47,
          },
        },
        ["name"] = "sky_block",
        ["op"] = {
          ["list"] = {
            ["name"] = "list",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "player",
                      ["orig"] = "player",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "profile",
                      ["orig"] = "profile",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                    {
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = false,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["example"] = 0,
                      ["kind"] = "query",
                      ["name"] = "page",
                      ["orig"] = "page",
                      ["reqd"] = false,
                      ["type"] = "`$INTEGER`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 1,
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 2,
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "uuid",
                      ["orig"] = "uuid",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 3,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/bingo",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "bingo",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 4,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/items",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "items",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 5,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/auctions_ended",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "auctions_ended",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 6,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/firesales",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "firesales",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 7,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/news",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "news",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 8,
              },
            },
            ["input"] = "data",
            ["key$"] = "list",
          },
          ["load"] = {
            ["name"] = "load",
            ["points"] = {
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "profile",
                      ["orig"] = "profile",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 0,
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "profile",
                      ["orig"] = "profile",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 1,
              },
              {
                ["args"] = {
                  ["query"] = {
                    {
                      ["kind"] = "query",
                      ["name"] = "profile",
                      ["orig"] = "profile",
                      ["reqd"] = true,
                      ["type"] = "`$STRING`",
                      ["active"] = true,
                    },
                  },
                },
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
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["index$"] = 2,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/collections",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "collections",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 3,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/election",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "election",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 4,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/resources/skyblock/skills",
                ["parts"] = {
                  "v2",
                  "resources",
                  "skyblock",
                  "skills",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 5,
              },
              {
                ["method"] = "GET",
                ["orig"] = "/v2/skyblock/bazaar",
                ["parts"] = {
                  "v2",
                  "skyblock",
                  "bazaar",
                },
                ["transform"] = {
                  ["req"] = "`reqdata`",
                  ["res"] = "`body`",
                },
                ["active"] = true,
                ["args"] = {},
                ["select"] = {},
                ["index$"] = 6,
              },
            },
            ["input"] = "data",
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
