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
						"name": "guild",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 1,
					},
				},
				"name": "guild",
				"op": map[string]any{
					"load": map[string]any{
						"name": "load",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "id",
											"orig": "id",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "name",
											"orig": "name",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "player",
											"orig": "player",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
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
									"res": "`body`",
								},
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
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
						"name": "house",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 1,
					},
				},
				"name": "housing",
				"op": map[string]any{
					"list": map[string]any{
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
											"active": true,
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
								"active": true,
								"index$": 0,
							},
							map[string]any{
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
								"active": true,
								"args": map[string]any{},
								"index$": 1,
							},
						},
						"input": "data",
						"key$": "list",
					},
					"load": map[string]any{
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
											"active": true,
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
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
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
						"name": "booster",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "booster_state",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "game",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "leaderboard",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "player_count",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "staff_rolling_daily",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 5,
					},
					map[string]any{
						"name": "staff_total",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 6,
					},
					map[string]any{
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 7,
					},
					map[string]any{
						"name": "watchdog_last_minute",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 8,
					},
					map[string]any{
						"name": "watchdog_rolling_daily",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 9,
					},
					map[string]any{
						"name": "watchdog_total",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 10,
					},
				},
				"name": "other",
				"op": map[string]any{
					"list": map[string]any{
						"name": "list",
						"points": []any{
							map[string]any{
								"method": "GET",
								"orig": "/v2/boosters",
								"parts": []any{
									"v2",
									"boosters",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "list",
					},
					"load": map[string]any{
						"name": "load",
						"points": []any{
							map[string]any{
								"method": "GET",
								"orig": "/v2/counts",
								"parts": []any{
									"v2",
									"counts",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 0,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/leaderboards",
								"parts": []any{
									"v2",
									"leaderboards",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 1,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/punishmentstats",
								"parts": []any{
									"v2",
									"punishmentstats",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 2,
							},
						},
						"input": "data",
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
						"name": "player",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 1,
					},
				},
				"name": "player",
				"op": map[string]any{
					"load": map[string]any{
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
											"active": true,
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
									"res": "`body`",
								},
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
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
						"name": "date",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "ended",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "game_type",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "map",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "mode",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "session",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 5,
					},
					map[string]any{
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 6,
					},
					map[string]any{
						"name": "uuid",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 7,
					},
				},
				"name": "player_data",
				"op": map[string]any{
					"list": map[string]any{
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
											"active": true,
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
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
						"key$": "list",
					},
					"load": map[string]any{
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
											"active": true,
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
								"active": true,
								"index$": 0,
							},
						},
						"input": "data",
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
						"name": "achievement",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "challenge",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "game",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "last_updated",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "one_time",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "quest",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 5,
					},
					map[string]any{
						"name": "rarity",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 6,
					},
					map[string]any{
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 7,
					},
					map[string]any{
						"name": "tiered",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 8,
					},
					map[string]any{
						"name": "type",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 9,
					},
				},
				"name": "resource",
				"op": map[string]any{
					"load": map[string]any{
						"name": "load",
						"points": []any{
							map[string]any{
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
								"active": true,
								"args": map[string]any{},
								"index$": 0,
							},
							map[string]any{
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
								"active": true,
								"args": map[string]any{},
								"index$": 1,
							},
							map[string]any{
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
								"active": true,
								"args": map[string]any{},
								"index$": 2,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/resources/guilds/achievements",
								"parts": []any{
									"v2",
									"resources",
									"guilds",
									"achievements",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 3,
							},
							map[string]any{
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
								"active": true,
								"args": map[string]any{},
								"index$": 4,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/resources/vanity/companions",
								"parts": []any{
									"v2",
									"resources",
									"vanity",
									"companions",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 5,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/resources/vanity/pets",
								"parts": []any{
									"v2",
									"resources",
									"vanity",
									"pets",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 6,
							},
						},
						"input": "data",
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
						"name": "auction",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 0,
					},
					map[string]any{
						"name": "auctioneer",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 1,
					},
					map[string]any{
						"name": "bid",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 2,
					},
					map[string]any{
						"name": "category",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 3,
					},
					map[string]any{
						"name": "claimed",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 4,
					},
					map[string]any{
						"name": "claimed_bidder",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 5,
					},
					map[string]any{
						"name": "collection",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 6,
					},
					map[string]any{
						"name": "color",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 7,
					},
					map[string]any{
						"name": "coop",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 8,
					},
					map[string]any{
						"name": "current",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 9,
					},
					map[string]any{
						"name": "end",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 10,
					},
					map[string]any{
						"name": "event",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 11,
					},
					map[string]any{
						"name": "extra",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 12,
					},
					map[string]any{
						"name": "full_lore",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 13,
					},
					map[string]any{
						"name": "garden",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 14,
					},
					map[string]any{
						"name": "highest_bid_amount",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 15,
					},
					map[string]any{
						"name": "id",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 16,
					},
					map[string]any{
						"name": "item",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 17,
					},
					map[string]any{
						"name": "item_byte",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 18,
					},
					map[string]any{
						"name": "item_lore",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 19,
					},
					map[string]any{
						"name": "item_name",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 20,
					},
					map[string]any{
						"name": "last_updated",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 21,
					},
					map[string]any{
						"name": "link",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 22,
					},
					map[string]any{
						"name": "lore",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 23,
					},
					map[string]any{
						"name": "material",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 24,
					},
					map[string]any{
						"name": "mayor",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 25,
					},
					map[string]any{
						"name": "member",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 26,
					},
					map[string]any{
						"name": "name",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 27,
					},
					map[string]any{
						"name": "npc_sell_price",
						"req": false,
						"type": "`$NUMBER`",
						"active": true,
						"index$": 28,
					},
					map[string]any{
						"name": "page",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 29,
					},
					map[string]any{
						"name": "product",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 30,
					},
					map[string]any{
						"name": "profile",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 31,
					},
					map[string]any{
						"name": "profile_id",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 32,
					},
					map[string]any{
						"name": "progress",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 33,
					},
					map[string]any{
						"name": "required_amount",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 34,
					},
					map[string]any{
						"name": "sale",
						"req": false,
						"type": "`$ARRAY`",
						"active": true,
						"index$": 35,
					},
					map[string]any{
						"name": "skill",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 36,
					},
					map[string]any{
						"name": "start",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 37,
					},
					map[string]any{
						"name": "starting_bid",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 38,
					},
					map[string]any{
						"name": "stat",
						"req": false,
						"type": "`$OBJECT`",
						"active": true,
						"index$": 39,
					},
					map[string]any{
						"name": "success",
						"req": false,
						"type": "`$BOOLEAN`",
						"active": true,
						"index$": 40,
					},
					map[string]any{
						"name": "text",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 41,
					},
					map[string]any{
						"name": "tier",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 42,
					},
					map[string]any{
						"name": "title",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 43,
					},
					map[string]any{
						"name": "total_auction",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 44,
					},
					map[string]any{
						"name": "total_page",
						"req": false,
						"type": "`$INTEGER`",
						"active": true,
						"index$": 45,
					},
					map[string]any{
						"name": "uuid",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 46,
					},
					map[string]any{
						"name": "version",
						"req": false,
						"type": "`$STRING`",
						"active": true,
						"index$": 47,
					},
				},
				"name": "sky_block",
				"op": map[string]any{
					"list": map[string]any{
						"name": "list",
						"points": []any{
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"kind": "query",
											"name": "player",
											"orig": "player",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "profile",
											"orig": "profile",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
										},
										map[string]any{
											"kind": "query",
											"name": "uuid",
											"orig": "uuid",
											"reqd": false,
											"type": "`$STRING`",
											"active": true,
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
								"active": true,
								"index$": 0,
							},
							map[string]any{
								"args": map[string]any{
									"query": []any{
										map[string]any{
											"example": 0,
											"kind": "query",
											"name": "page",
											"orig": "page",
											"reqd": false,
											"type": "`$INTEGER`",
											"active": true,
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
								"active": true,
								"index$": 1,
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
											"active": true,
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
								"active": true,
								"index$": 2,
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
											"active": true,
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
								"active": true,
								"index$": 3,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/resources/skyblock/bingo",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"bingo",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 4,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/resources/skyblock/items",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"items",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 5,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/skyblock/auctions_ended",
								"parts": []any{
									"v2",
									"skyblock",
									"auctions_ended",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 6,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/skyblock/firesales",
								"parts": []any{
									"v2",
									"skyblock",
									"firesales",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 7,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/skyblock/news",
								"parts": []any{
									"v2",
									"skyblock",
									"news",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 8,
							},
						},
						"input": "data",
						"key$": "list",
					},
					"load": map[string]any{
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
											"active": true,
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
								"active": true,
								"index$": 0,
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
											"active": true,
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
								"active": true,
								"index$": 1,
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
											"active": true,
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
								"active": true,
								"index$": 2,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/resources/skyblock/collections",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"collections",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 3,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/resources/skyblock/election",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"election",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 4,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/resources/skyblock/skills",
								"parts": []any{
									"v2",
									"resources",
									"skyblock",
									"skills",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 5,
							},
							map[string]any{
								"method": "GET",
								"orig": "/v2/skyblock/bazaar",
								"parts": []any{
									"v2",
									"skyblock",
									"bazaar",
								},
								"transform": map[string]any{
									"req": "`reqdata`",
									"res": "`body`",
								},
								"active": true,
								"args": map[string]any{},
								"select": map[string]any{},
								"index$": 6,
							},
						},
						"input": "data",
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
