package core

func MakeConfig() map[string]any {
	return map[string]any{
		"main": map[string]any{
			"name": "Hypixel",
		},
		"feature": map[string]any{
			"test": map[string]any{
				"options": map[string]any{
					"active": false,
				},
			},
		},
		"options": map[string]any{
			"base": "https://api.hypixel.net",
			"auth": map[string]any{
				"prefix": "Bearer",
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
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "guild",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 1,
					},
				},
				"name": "guild",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "id",
											"orig": "id",
											"reqd": false,
											"type": "`$STRING`",
										},
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "name",
											"orig": "name",
											"reqd": false,
											"type": "`$STRING`",
										},
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "player",
											"orig": "player",
											"reqd": false,
											"type": "`$STRING`",
										},
									},
								},
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
								"index$": 0,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"housing": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "house",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 1,
					},
				},
				"name": "housing",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 0,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 1,
							},
						},
						"key$": "list",
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "house",
											"orig": "house",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"other": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "booster",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "booster_state",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "game",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "leaderboard",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "player_count",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "staff_rolling_daily",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "staff_total",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "watchdog_last_minute",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "watchdog_rolling_daily",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 9,
					},
					map[string]any{
						"active": true,
						"name": "watchdog_total",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 10,
					},
				},
				"name": "other",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
								"index$": 0,
							},
						},
						"key$": "list",
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{},
								"method": "GET",
								"orig": "/v2/counts",
								"parts": []any{
									"v2",
									"counts",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 0,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
								"method": "GET",
								"orig": "/v2/leaderboards",
								"parts": []any{
									"v2",
									"leaderboards",
								},
								"select": map[string]any{},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"index$": 1,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
								"index$": 2,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"player": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "player",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 1,
					},
				},
				"name": "player",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
								"index$": 0,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"player_data": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "date",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "ended",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "game_type",
						"req": false,
						"type": "`$STRING`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "map",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "mode",
						"req": false,
						"type": "`$STRING`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "session",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "uuid",
						"req": false,
						"type": "`$STRING`",
						"index$": 7,
					},
				},
				"name": "player_data",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "list",
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 0,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"resource": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "achievement",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "challenge",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "game",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "last_updated",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "one_time",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "quest",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "rarity",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "tiered",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "type",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 9,
					},
				},
				"name": "resource",
				"op": map[string]any{
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 0,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 1,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 2,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
								"index$": 3,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 4,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
								"index$": 5,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
								"index$": 6,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
			"sky_block": map[string]any{
				"fields": []any{
					map[string]any{
						"active": true,
						"name": "auction",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 0,
					},
					map[string]any{
						"active": true,
						"name": "auctioneer",
						"req": false,
						"type": "`$STRING`",
						"index$": 1,
					},
					map[string]any{
						"active": true,
						"name": "bid",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 2,
					},
					map[string]any{
						"active": true,
						"name": "category",
						"req": false,
						"type": "`$STRING`",
						"index$": 3,
					},
					map[string]any{
						"active": true,
						"name": "claimed",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 4,
					},
					map[string]any{
						"active": true,
						"name": "claimed_bidder",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 5,
					},
					map[string]any{
						"active": true,
						"name": "collection",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 6,
					},
					map[string]any{
						"active": true,
						"name": "color",
						"req": false,
						"type": "`$STRING`",
						"index$": 7,
					},
					map[string]any{
						"active": true,
						"name": "coop",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 8,
					},
					map[string]any{
						"active": true,
						"name": "current",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 9,
					},
					map[string]any{
						"active": true,
						"name": "end",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 10,
					},
					map[string]any{
						"active": true,
						"name": "event",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 11,
					},
					map[string]any{
						"active": true,
						"name": "extra",
						"req": false,
						"type": "`$STRING`",
						"index$": 12,
					},
					map[string]any{
						"active": true,
						"name": "full_lore",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 13,
					},
					map[string]any{
						"active": true,
						"name": "garden",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 14,
					},
					map[string]any{
						"active": true,
						"name": "highest_bid_amount",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 15,
					},
					map[string]any{
						"active": true,
						"name": "id",
						"req": false,
						"type": "`$STRING`",
						"index$": 16,
					},
					map[string]any{
						"active": true,
						"name": "item",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 17,
					},
					map[string]any{
						"active": true,
						"name": "item_byte",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 18,
					},
					map[string]any{
						"active": true,
						"name": "item_lore",
						"req": false,
						"type": "`$STRING`",
						"index$": 19,
					},
					map[string]any{
						"active": true,
						"name": "item_name",
						"req": false,
						"type": "`$STRING`",
						"index$": 20,
					},
					map[string]any{
						"active": true,
						"name": "last_updated",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 21,
					},
					map[string]any{
						"active": true,
						"name": "link",
						"req": false,
						"type": "`$STRING`",
						"index$": 22,
					},
					map[string]any{
						"active": true,
						"name": "lore",
						"req": false,
						"type": "`$STRING`",
						"index$": 23,
					},
					map[string]any{
						"active": true,
						"name": "material",
						"req": false,
						"type": "`$STRING`",
						"index$": 24,
					},
					map[string]any{
						"active": true,
						"name": "mayor",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 25,
					},
					map[string]any{
						"active": true,
						"name": "member",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 26,
					},
					map[string]any{
						"active": true,
						"name": "name",
						"req": false,
						"type": "`$STRING`",
						"index$": 27,
					},
					map[string]any{
						"active": true,
						"name": "npc_sell_price",
						"req": false,
						"type": "`$NUMBER`",
						"index$": 28,
					},
					map[string]any{
						"active": true,
						"name": "page",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 29,
					},
					map[string]any{
						"active": true,
						"name": "product",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 30,
					},
					map[string]any{
						"active": true,
						"name": "profile",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 31,
					},
					map[string]any{
						"active": true,
						"name": "profile_id",
						"req": false,
						"type": "`$STRING`",
						"index$": 32,
					},
					map[string]any{
						"active": true,
						"name": "progress",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 33,
					},
					map[string]any{
						"active": true,
						"name": "required_amount",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 34,
					},
					map[string]any{
						"active": true,
						"name": "sale",
						"req": false,
						"type": "`$ARRAY`",
						"index$": 35,
					},
					map[string]any{
						"active": true,
						"name": "skill",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 36,
					},
					map[string]any{
						"active": true,
						"name": "start",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 37,
					},
					map[string]any{
						"active": true,
						"name": "starting_bid",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 38,
					},
					map[string]any{
						"active": true,
						"name": "stat",
						"req": false,
						"type": "`$OBJECT`",
						"index$": 39,
					},
					map[string]any{
						"active": true,
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"index$": 40,
					},
					map[string]any{
						"active": true,
						"name": "text",
						"req": false,
						"type": "`$STRING`",
						"index$": 41,
					},
					map[string]any{
						"active": true,
						"name": "tier",
						"req": false,
						"type": "`$STRING`",
						"index$": 42,
					},
					map[string]any{
						"active": true,
						"name": "title",
						"req": false,
						"type": "`$STRING`",
						"index$": 43,
					},
					map[string]any{
						"active": true,
						"name": "total_auction",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 44,
					},
					map[string]any{
						"active": true,
						"name": "total_page",
						"req": false,
						"type": "`$INTEGER`",
						"index$": 45,
					},
					map[string]any{
						"active": true,
						"name": "uuid",
						"req": false,
						"type": "`$STRING`",
						"index$": 46,
					},
					map[string]any{
						"active": true,
						"name": "version",
						"req": false,
						"type": "`$STRING`",
						"index$": 47,
					},
				},
				"name": "sky_block",
				"op": map[string]any{
					"list": map[string]any{
						"input": "data",
						"name": "list",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "player",
											"orig": "player",
											"reqd": false,
											"type": "`$STRING`",
										},
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "profile",
											"orig": "profile",
											"reqd": false,
											"type": "`$STRING`",
										},
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": false,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 0,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"example": 0,
											"kind": "query",
											"name": "page",
											"orig": "page",
											"reqd": false,
											"type": "`$INTEGER`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 1,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 2,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 3,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 4,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 5,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 6,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 7,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 8,
							},
						},
						"key$": "list",
					},
					"load": map[string]any{
						"input": "data",
						"name": "load",
						"points": []any{
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "profile",
											"orig": "profile",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 0,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "profile",
											"orig": "profile",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 1,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"active": true,
											"kind": "query",
											"name": "profile",
											"orig": "profile",
											"reqd": true,
											"type": "`$STRING`",
										},
									},
								},
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
									"res": "`body`",
								},
								"index$": 2,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 3,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
								"index$": 4,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 5,
							},
							map[string]any{
								"active": true,
								"args": map[string]any{},
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
									"res": "`body`",
								},
								"index$": 6,
							},
						},
						"key$": "load",
					},
				},
				"relations": map[string]any{
					"ancestors": []any{},
				},
			},
		},
	}
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
