package core

import (
	"sync"
)

// MakeConfig builds a fresh, fully materialised config map. Every call
// rebuilds the whole structure, so prefer SharedConfig unless you need a
// private copy you intend to mutate.
func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Hypixel",
			"slug": "hypixel",
			"version": "0.0.1",
			"target": "go",
		},
		"feature": map[string]any{
			"ratelimit": map[string]any{
				"options": map[string]any{
					"active": false,
					"burst": 5,
					"rate": 5,
				},
				"optspec": map[string]any{
					"now": "`$FUNCTION`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"retry": map[string]any{
				"options": map[string]any{
					"active": false,
					"factor": 2,
					"maxDelay": 2000,
					"minDelay": 50,
					"retries": 2,
					"statuses": []any{
						408,
						425,
						429,
						500,
						502,
						503,
						504,
					},
				},
				"optspec": map[string]any{
					"jitter": "`$BOOLEAN`",
					"sleep": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"optspec": map[string]any{
					"entity": "`$MAP`",
					"net": "`$MAP`",
				},
				"strict": false,
				"transport": "base",
			},
			"timeout": map[string]any{
				"options": map[string]any{
					"active": false,
					"ms": 30000,
				},
				"optspec": map[string]any{
					"clearTimer": "`$FUNCTION`",
					"setTimer": "`$FUNCTION`",
				},
				"strict": false,
				"transport": "wrap",
			},
		},
		"options": map[string]any{
			"base": "https://api.hypixel.net",
			"auth": map[string]any{
				"prefix": "",
				"name": "API-Key",
			},
			"headers": map[string]any{
				"content-type": "application/json",
			},
			"entity": map[string]any{
				"guild": map[string]any{},
				"housing": map[string]any{},
				"other": map[string]any{},
				"player": map[string]any{},
				"player_data": map[string]any{},
				"resource": map[string]any{},
				"sky_block": map[string]any{},
			},
		},
		"entity": map[string]any{
			"guild": map[string]any{
				"fields": []any{},
				"name": "guild",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "id",
											"orig": "id",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "player",
											"orig": "player",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/guild",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "guild",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"id",
										"name",
										"player",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.guild`",
								},
								"parts": []any{
									"v2",
									"guild",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"housing": map[string]any{
				"fields": []any{},
				"name": "housing",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/housing/player",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "housing",
									},
									map[string]any{
										"lit": "player",
									},
								},
								"select": map[string]any{
									"$action": "player",
									"exist": []any{
										"uuid",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.houses`",
								},
								"parts": []any{
									"v2",
									"housing",
									"player",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/housing/houses",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "housing",
									},
									map[string]any{
										"lit": "houses",
									},
								},
								"select": map[string]any{
									"$action": "house",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.houses`",
								},
								"parts": []any{
									"v2",
									"housing",
									"houses",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "house",
											"orig": "house",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/housing/house",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "housing",
									},
									map[string]any{
										"lit": "house",
									},
								},
								"select": map[string]any{
									"$action": "house",
									"exist": []any{
										"house",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.house`",
								},
								"parts": []any{
									"v2",
									"housing",
									"house",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"other": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "boosterState",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "boosters",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "staff_rollingDaily",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "staff_total",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "success",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "watchdog_lastMinute",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "watchdog_rollingDaily",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "watchdog_total",
						"type": "`$INTEGER`",
					},
				},
				"name": "other",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/boosters",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "boosters",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"v2",
									"boosters",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/counts",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "counts",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.games`",
								},
								"parts": []any{
									"v2",
									"counts",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/leaderboards",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "leaderboards",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.leaderboards`",
								},
								"parts": []any{
									"v2",
									"leaderboards",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/punishmentstats",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "punishmentstats",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"v2",
									"punishmentstats",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"player": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "displayname",
						"type": "`$STRING`",
					},
					map[string]any{
						"format": "int64",
						"name": "firstLogin",
						"short": "Unix timestamp in milliseconds",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "lastLogin",
						"short": "Unix timestamp in milliseconds",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "lastLogout",
						"short": "Unix timestamp in milliseconds",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "monthlyPackageRank",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "newPackageRank",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "packageRank",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "rank",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "stats",
						"short": "Game statistics organized by game type database name",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "uuid",
						"type": "`$STRING`",
					},
				},
				"name": "player",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/player",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "player",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"uuid",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.player`",
								},
								"parts": []any{
									"v2",
									"player",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"player_data": map[string]any{
				"fields": []any{
					map[string]any{
						"format": "int64",
						"name": "date",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"format": "int64",
						"name": "ended",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "gameType",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "map",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mode",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "online",
						"type": "`$BOOLEAN`",
					},
				},
				"name": "player_data",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/recentgames",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "recentgames",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"uuid",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.games`",
								},
								"parts": []any{
									"v2",
									"recentgames",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/status",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "status",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"uuid",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.session`",
								},
								"parts": []any{
									"v2",
									"status",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"resource": map[string]any{
				"fields": []any{
					map[string]any{
						"format": "int64",
						"name": "lastUpdated",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "one_time",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "rarities",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "success",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "tiered",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "types",
						"type": "`$OBJECT`",
					},
				},
				"name": "resource",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/achievements",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "achievements",
									},
								},
								"select": map[string]any{
									"$action": "achievement",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.achievements`",
								},
								"parts": []any{
									"v2",
									"resources",
									"achievements",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/challenges",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "challenges",
									},
								},
								"select": map[string]any{
									"$action": "challenge",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.challenges`",
								},
								"parts": []any{
									"v2",
									"resources",
									"challenges",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/games",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "games",
									},
								},
								"select": map[string]any{
									"$action": "game",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.games`",
								},
								"parts": []any{
									"v2",
									"resources",
									"games",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/guilds/achievements",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "guilds",
									},
									map[string]any{
										"lit": "achievements",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"v2",
									"resources",
									"guilds",
									"achievements",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/quests",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "quests",
									},
								},
								"select": map[string]any{
									"$action": "quest",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.quests`",
								},
								"parts": []any{
									"v2",
									"resources",
									"quests",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/vanity/companions",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "vanity",
									},
									map[string]any{
										"lit": "companions",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"v2",
									"resources",
									"vanity",
									"companions",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/vanity/pets",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "vanity",
									},
									map[string]any{
										"lit": "pets",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"v2",
									"resources",
									"vanity",
									"pets",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"sky_block": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "auctioneer",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "auctions",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "bids",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "category",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "claimed",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "claimed_bidders",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "color",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "coop",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "current",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"format": "int64",
						"name": "end",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "events",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "extra",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "fullLore",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "highest_bid_amount",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "item",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "item_bytes",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "item_lore",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "item_name",
						"type": "`$STRING`",
					},
					map[string]any{
						"format": "int64",
						"name": "lastUpdated",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "link",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "lore",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "material",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "mayor",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "npc_sell_price",
						"type": "`$NUMBER`",
					},
					map[string]any{
						"name": "page",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "profile_id",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "profiles",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "progress",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "requiredAmount",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "sales",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"format": "int64",
						"name": "start",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "starting_bid",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "stats",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "success",
						"type": "`$BOOLEAN`",
					},
					map[string]any{
						"name": "text",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "tier",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "tiers",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "title",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "totalAuctions",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "totalPages",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "uuid",
						"type": "`$STRING`",
					},
				},
				"id": map[string]any{
					"field": "id",
					"name": "id",
				},
				"name": "sky_block",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "player",
											"orig": "player",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "profile",
											"orig": "profile",
											"type": "`$STRING`",
										},
										map[string]any{
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/auction",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "auction",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"player",
										"profile",
										"uuid",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.auctions`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"auction",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "page",
											"orig": "page",
											"type": "`$INTEGER`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/auctions",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "auctions",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"page",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.auctions`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"auctions",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/bingo",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "bingo",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"uuid",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.events`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"bingo",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/profiles",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "profiles",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"uuid",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.profiles`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"profiles",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/bingo",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "bingo",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.goals`",
								},
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"bingo",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/items",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "items",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.items`",
								},
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"items",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/auctions_ended",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "auctions_ended",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.auctions`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"auctions_ended",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/firesales",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "firesales",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.sales`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"firesales",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/news",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "news",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.items`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"news",
								},
							},
						},
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "profile",
											"orig": "profile",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/garden",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "garden",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"profile",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.garden`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"garden",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "profile",
											"orig": "profile",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/museum",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "museum",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"profile",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.members`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"museum",
								},
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "profile",
											"orig": "profile",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/profile",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "profile",
									},
								},
								"select": map[string]any{
									"exist": []any{
										"profile",
									},
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.profile`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"profile",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/collections",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "collections",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.collections`",
								},
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"collections",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/election",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "election",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"election",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/skills",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "resources",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "skills",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.skills`",
								},
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"skills",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/bazaar",
								"segments": []any{
									map[string]any{
										"lit": "v2",
									},
									map[string]any{
										"lit": "skyblock",
									},
									map[string]any{
										"lit": "bazaar",
									},
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.products`",
								},
								"parts": []any{
									"v2",
									"skyblock",
									"bazaar",
								},
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
}

// The plugin definitions the model selected per feature, as []any so a
// feature package can consume them without core naming its types. Empty
// when no active feature declares active plugin groups for this target.
var featurePlugins = map[string][]any{
}

// FeaturePlugins is the definitions list for one feature's chain.
func FeaturePlugins(name string) []any {
	return featurePlugins[name]
}

var (
	sharedConfigOnce sync.Once
	sharedConfigVal  map[string]any
)

// SharedConfig returns the process-wide config, built once on first use.
// The SDK reads the config on every request and never writes to it, so one
// instance is shared by every client rather than rebuilt per client.
//
// The returned map is shared: treat it as read-only. Callers that need to
// mutate should use MakeConfig, which always returns a fresh copy.
func SharedConfig() map[string]any {
	sharedConfigOnce.Do(func() {
		sharedConfigVal = MakeConfig()
	})
	return sharedConfigVal
}

func makeFeature(name string) Feature {
	switch name {
	case "ratelimit":
		if NewRatelimitFeatureFunc != nil {
			return NewRatelimitFeatureFunc()
		}
	case "retry":
		if NewRetryFeatureFunc != nil {
			return NewRetryFeatureFunc()
		}
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	case "timeout":
		if NewTimeoutFeatureFunc != nil {
			return NewTimeoutFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
