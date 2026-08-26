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
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
				"transport": "base",
			},
		},
		"options": map[string]any{
			"base": "https://api.hypixel.net",
			"auth": map[string]any{
				"prefix": "",
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
								"parts": []any{
									"v2",
									"guild",
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
							},
						},
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"housing": map[string]any{
				"fields": []any{
					map[string]any{
						"name": "houses",
						"type": "`$ARRAY`",
					},
					map[string]any{
						"name": "success",
						"type": "`$BOOLEAN`",
					},
				},
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
								"parts": []any{
									"v2",
									"housing",
									"player",
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
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/housing/houses",
								"parts": []any{
									"v2",
									"housing",
									"houses",
								},
								"select": map[string]any{
									"$action": "house",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.houses`",
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
								"parts": []any{
									"v2",
									"housing",
									"house",
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
								"parts": []any{
									"v2",
									"boosters",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
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
								"parts": []any{
									"v2",
									"counts",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.games`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/leaderboards",
								"parts": []any{
									"v2",
									"leaderboards",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.leaderboards`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/punishmentstats",
								"parts": []any{
									"v2",
									"punishmentstats",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
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
						"name": "firstLogin",
						"short": "Unix timestamp in milliseconds",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "lastLogin",
						"short": "Unix timestamp in milliseconds",
						"type": "`$INTEGER`",
					},
					map[string]any{
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
								"parts": []any{
									"v2",
									"player",
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
						"name": "date",
						"type": "`$INTEGER`",
					},
					map[string]any{
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
								"parts": []any{
									"v2",
									"recentgames",
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
								"parts": []any{
									"v2",
									"status",
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
						"name": "databaseName",
						"type": "`$STRING`",
					},
					map[string]any{
						"name": "id",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "lastUpdated",
						"type": "`$INTEGER`",
					},
					map[string]any{
						"name": "modeNames",
						"type": "`$OBJECT`",
					},
					map[string]any{
						"name": "name",
						"type": "`$STRING`",
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
								"parts": []any{
									"v2",
									"resources",
									"achievements",
								},
								"select": map[string]any{
									"$action": "achievement",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.achievements`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/challenges",
								"parts": []any{
									"v2",
									"resources",
									"challenges",
								},
								"select": map[string]any{
									"$action": "challenge",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.challenges`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/games",
								"parts": []any{
									"v2",
									"resources",
									"games",
								},
								"select": map[string]any{
									"$action": "game",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.games`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/guilds/achievements",
								"parts": []any{
									"v2",
									"resources",
									"guilds",
									"achievements",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/quests",
								"parts": []any{
									"v2",
									"resources",
									"quests",
								},
								"select": map[string]any{
									"$action": "quest",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.quests`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/vanity/companions",
								"parts": []any{
									"v2",
									"resources",
									"vanity",
									"companions",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/vanity/pets",
								"parts": []any{
									"v2",
									"resources",
									"vanity",
									"pets",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
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
								"parts": []any{
									"v2",
									"skyblock",
									"auction",
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
								"parts": []any{
									"v2",
									"skyblock",
									"auctions",
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
								"parts": []any{
									"v2",
									"skyblock",
									"bingo",
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
								"parts": []any{
									"v2",
									"skyblock",
									"profiles",
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
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/bingo",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"bingo",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.goals`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/items",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"items",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.items`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/auctions_ended",
								"parts": []any{
									"v2",
									"skyblock",
									"auctions_ended",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.auctions`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/firesales",
								"parts": []any{
									"v2",
									"skyblock",
									"firesales",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.sales`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/news",
								"parts": []any{
									"v2",
									"skyblock",
									"news",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.items`",
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
								"parts": []any{
									"v2",
									"skyblock",
									"garden",
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
								"parts": []any{
									"v2",
									"skyblock",
									"museum",
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
								"parts": []any{
									"v2",
									"skyblock",
									"profile",
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
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/collections",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"collections",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.collections`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/election",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"election",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/resources/skyblock/skills",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"skills",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.skills`",
								},
							},
							map[string]any{
								"args": map[string]any{},
								"kind": "http",
								"method": "GET",
								"orig": "/v2/skyblock/bazaar",
								"parts": []any{
									"v2",
									"skyblock",
									"bazaar",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body.products`",
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
	case "test":
		if NewTestFeatureFunc != nil {
			return NewTestFeatureFunc()
		}
	default:
		if NewBaseFeatureFunc != nil {
			return NewBaseFeatureFunc()
		}
	}
	return nil
}
