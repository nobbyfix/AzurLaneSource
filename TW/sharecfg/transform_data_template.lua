pg = pg or {}
pg.transform_data_template = {
	[1901] = {
		use_gold = 400,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 1901,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 45
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[1902] = {
		use_gold = 600,
		name = "機動強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 1902,
		icon = "dd_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1901
		},
		effect = {
			{
				dodge = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			10
		}
	},
	[1903] = {
		use_gold = 800,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 1903,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1901
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[1904] = {
		use_gold = 1000,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 1904,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1903
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					5
				}
			}
		},
		gear_score = {
			15
		}
	},
	[1905] = {
		use_gold = 1200,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 1905,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1903
		},
		effect = {
			{
				durability = 45
			},
			{
				durability = 75
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			10
		}
	},
	[1906] = {
		use_gold = 1500,
		name = "機動強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 1906,
		icon = "dd_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1902,
			1905
		},
		effect = {
			{
				dodge = 5
			},
			{
				dodge = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					1
				}
			}
		},
		gear_score = {
			10,
			10
		}
	},
	[1907] = {
		use_gold = 1800,
		name = "主炮改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 1907,
		icon = "mgup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1905
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			},
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[1908] = {
		use_gold = 2000,
		name = "炮擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 1908,
		icon = "cn_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1907
		},
		effect = {
			{
				cannon = 5
			},
			{
				cannon = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[1909] = {
		use_gold = 2500,
		name = "主炮改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 1909,
		icon = "mgup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1907
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				}
			},
			{
				{
					18003,
					1
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[1910] = {
		use_gold = 3000,
		name = "雷擊強化III",
		max_level = 3,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 1910,
		icon = "Tp_3",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1904,
			1909
		},
		effect = {
			{
				torpedo = 5
			},
			{
				torpedo = 10
			},
			{
				torpedo = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				},
				{
					17023,
					5
				}
			},
			{
				{
					18003,
					1
				},
				{
					17023,
					10
				}
			},
			{
				{
					18003,
					1
				},
				{
					17023,
					15
				}
			}
		},
		gear_score = {
			5,
			10,
			15
		}
	},
	[1911] = {
		use_gold = 4000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 101179,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 1911,
		icon = "mt_red",
		skill_id = 0,
		descrip = "",
		condition_id = {
			1909,
			1910
		},
		effect = {
			{
				cannon = 30,
				dodge = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					3
				}
			}
		},
		gear_score = {
			50
		}
	},
	[1912] = {
		use_gold = 3000,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 90,
		star_limit = 5,
		id = 1912,
		icon = "skill_red",
		skill_id = 11210,
		descrip = "",
		condition_id = {
			1911
		},
		effect = {
			{
				torpedo = 10
			},
			{
				skill_id = 11210
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					2
				},
				{
					17013,
					20
				}
			}
		},
		gear_score = {
			30
		}
	},
	[2701] = {
		use_gold = 300,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 2701,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 60
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[2702] = {
		use_gold = 400,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 2702,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			2701
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[2703] = {
		use_gold = 600,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 2703,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			2701
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[2704] = {
		use_gold = 800,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 2704,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			2703
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[2705] = {
		use_gold = 1000,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 2705,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			2703
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[2706] = {
		use_gold = 1200,
		name = "裝填強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 2706,
		icon = "rl_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			2702,
			2705
		},
		effect = {
			{
				reload = 5
			},
			{
				reload = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			},
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10,
			10
		}
	},
	[2707] = {
		use_gold = 1500,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 2707,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			2705
		},
		effect = {
			{
				durability = 60
			},
			{
				durability = 90
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[2708] = {
		use_gold = 1800,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 2708,
		icon = "skill_blue",
		skill_id = 4091,
		descrip = "",
		condition_id = {
			2707
		},
		effect = {
			{
				skill_id = 4091
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[2709] = {
		use_gold = 2000,
		name = "動力強化",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 2709,
		icon = "sp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			2707
		},
		effect = {
			{
				speed = 3
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			30
		}
	},
	[2710] = {
		use_gold = 2500,
		name = "防空強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 2710,
		icon = "aa_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			2704,
			2709
		},
		effect = {
			{
				antiaircraft = 15
			},
			{
				antiaircraft = 25
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[2711] = {
		use_gold = 3000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 101259,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 2711,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			2708,
			2709,
			2710
		},
		effect = {
			{
				cannon = 15,
				antiaircraft = 35
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	[4401] = {
		use_gold = 300,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 4401,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 80
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[4402] = {
		use_gold = 400,
		name = "機動強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 4402,
		icon = "dd_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4401
		},
		effect = {
			{
				dodge = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[4403] = {
		use_gold = 600,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 4403,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4401
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[4404] = {
		use_gold = 800,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 4404,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4403
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[4405] = {
		use_gold = 1000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 4405,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4403
		},
		effect = {
			{
				durability = 80
			},
			{
				durability = 120
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			},
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			10,
			10
		}
	},
	[4406] = {
		use_gold = 1200,
		name = "副炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 4406,
		icon = "sgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4405
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[4407] = {
		use_gold = 1500,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 4407,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4405
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			25
		}
	},
	[4408] = {
		use_gold = 1800,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 4408,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4407
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			25
		}
	},
	[4409] = {
		use_gold = 2000,
		name = "艦體改良III",
		max_level = 3,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 4409,
		icon = "hp_3",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4407
		},
		effect = {
			{
				durability = 80
			},
			{
				durability = 120
			},
			{
				durability = 160
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					2
				}
			},
			{
				{
					18012,
					2
				}
			},
			{
				{
					18012,
					3
				}
			}
		},
		gear_score = {
			10,
			10,
			10
		}
	},
	[4410] = {
		use_gold = 2500,
		name = "機動強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 4410,
		icon = "dd_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4402,
			4409
		},
		effect = {
			{
				dodge = 5
			},
			{
				dodge = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					2
				}
			},
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[4411] = {
		use_gold = 3000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 103069,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 4411,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			4408,
			4409,
			4410
		},
		effect = {
			{
				durability = 150,
				cannon = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18013,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	[7001] = {
		use_gold = 300,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 7001,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 60
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[7002] = {
		use_gold = 400,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 7002,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7001
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[7003] = {
		use_gold = 600,
		name = "空戰精通I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 7003,
		icon = "ffup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7001
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[7004] = {
		use_gold = 800,
		name = "航空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 7004,
		icon = "air_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7003
		},
		effect = {
			{
				air = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[7005] = {
		use_gold = 1000,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 7005,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7003
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[7006] = {
		use_gold = 1200,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 7006,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7005
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[7007] = {
		use_gold = 1500,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 7007,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7005
		},
		effect = {
			{
				durability = 60
			},
			{
				durability = 90
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					1
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[7008] = {
		use_gold = 1800,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 7008,
		icon = "skill_yellow",
		skill_id = 3041,
		descrip = "",
		condition_id = {
			7007
		},
		effect = {
			{
				skill_id = 3041
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[7009] = {
		use_gold = 2000,
		name = "空戰精通II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 7009,
		icon = "ffup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7007,
			7008
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[7010] = {
		use_gold = 2500,
		name = "航空強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 7010,
		icon = "air_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7004,
			7009
		},
		effect = {
			{
				air = 10
			},
			{
				air = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					2
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[7011] = {
		use_gold = 3000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 106019,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 7011,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7009,
			7010
		},
		effect = {
			{
				air = 25,
				antiaircraft = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18033,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	[7101] = {
		use_gold = 200,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 1,
		id = 7101,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 60
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					1
				}
			}
		},
		gear_score = {
			10
		}
	},
	[7102] = {
		use_gold = 300,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 1,
		id = 7102,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7101
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[7103] = {
		use_gold = 400,
		name = "轟炸精通I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 2,
		id = 7103,
		icon = "bfup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7101
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[7104] = {
		use_gold = 500,
		name = "航空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 2,
		id = 7104,
		icon = "air_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7103
		},
		effect = {
			{
				air = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[7105] = {
		use_gold = 600,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 3,
		id = 7105,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7103
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[7106] = {
		use_gold = 800,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 3,
		id = 7106,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7105
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[7107] = {
		use_gold = 1000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 3,
		id = 7107,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7105
		},
		effect = {
			{
				durability = 60
			},
			{
				durability = 90
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					1
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[7108] = {
		use_gold = 1200,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 3,
		id = 7108,
		icon = "skill_yellow",
		skill_id = 1045,
		descrip = "",
		condition_id = {
			7107
		},
		effect = {
			{
				skill_id = 1045
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[7109] = {
		use_gold = 1400,
		name = "轟炸精通II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 4,
		id = 7109,
		icon = "bfup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7107,
			7108
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			},
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[7110] = {
		use_gold = 1600,
		name = "航空強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 4,
		id = 7110,
		icon = "air_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7104,
			7109
		},
		effect = {
			{
				air = 10
			},
			{
				air = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					2
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[7111] = {
		use_gold = 2000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 106029,
		use_ship = 1,
		level_limit = 80,
		star_limit = 4,
		id = 7111,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7109,
			7110
		},
		effect = {
			{
				air = 25,
				antiaircraft = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					6
				}
			}
		},
		gear_score = {
			50
		}
	},
	[7201] = {
		use_gold = 200,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 1,
		id = 7201,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 70
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					1
				}
			}
		},
		gear_score = {
			10
		}
	},
	[7202] = {
		use_gold = 300,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 1,
		id = 7202,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7201
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[7203] = {
		use_gold = 400,
		name = "空戰精通I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 2,
		id = 7203,
		icon = "ffup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7201
		},
		effect = {
			{
				equipment_proficiency_2 = 0.04,
				equipment_proficiency_1 = 0.04
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[7204] = {
		use_gold = 500,
		name = "航空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 2,
		id = 7204,
		icon = "air_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7203
		},
		effect = {
			{
				air = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[7205] = {
		use_gold = 600,
		name = "轟炸精通I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 3,
		id = 7205,
		icon = "bfup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7203
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[7206] = {
		use_gold = 800,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 3,
		id = 7206,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7205
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[7207] = {
		use_gold = 1000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 3,
		id = 7207,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7205
		},
		effect = {
			{
				durability = 70
			},
			{
				durability = 100
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					1
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[7208] = {
		use_gold = 1200,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 3,
		id = 7208,
		icon = "skill_yellow",
		skill_id = 1037,
		descrip = "",
		condition_id = {
			7207
		},
		effect = {
			{
				skill_id = 1037
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[7209] = {
		use_gold = 1400,
		name = "空戰精通II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 4,
		id = 7209,
		icon = "ffup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7207,
			7208
		},
		effect = {
			{
				equipment_proficiency_2 = 0.04,
				equipment_proficiency_1 = 0.04
			},
			{
				equipment_proficiency_2 = 0.07,
				equipment_proficiency_1 = 0.07
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[7210] = {
		use_gold = 1600,
		name = "航空強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 4,
		id = 7210,
		icon = "air_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7204,
			7209
		},
		effect = {
			{
				air = 10
			},
			{
				air = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					2
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[7211] = {
		use_gold = 2000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 107019,
		use_ship = 1,
		level_limit = 80,
		star_limit = 4,
		id = 7211,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7209,
			7210
		},
		effect = {
			{
				air = 25,
				antiaircraft = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					6
				}
			}
		},
		gear_score = {
			50
		}
	},
	[7501] = {
		use_gold = 200,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 1,
		id = 7501,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 70
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					1
				}
			}
		},
		gear_score = {
			10
		}
	},
	[7502] = {
		use_gold = 300,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 1,
		id = 7502,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7501
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[7503] = {
		use_gold = 400,
		name = "轟炸精通I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 2,
		id = 7503,
		icon = "bfup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7501
		},
		effect = {
			{
				equipment_proficiency_3 = 0.04,
				equipment_proficiency_2 = 0.04
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[7504] = {
		use_gold = 500,
		name = "航空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 2,
		id = 7504,
		icon = "air_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7503
		},
		effect = {
			{
				air = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[7505] = {
		use_gold = 600,
		name = "魚雷俯衝I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 3,
		id = 7505,
		icon = "tfup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7503
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[7506] = {
		use_gold = 800,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 3,
		id = 7506,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7505
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[7507] = {
		use_gold = 1000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 3,
		id = 7507,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7505
		},
		effect = {
			{
				durability = 70
			},
			{
				durability = 100
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					1
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[7508] = {
		use_gold = 1200,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 3,
		id = 7508,
		icon = "skill_yellow",
		skill_id = 3011,
		descrip = "",
		condition_id = {
			7507
		},
		effect = {
			{
				skill_id = 3011
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[7509] = {
		use_gold = 1400,
		name = "轟炸精通II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 4,
		id = 7509,
		icon = "bfup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7507,
			7508
		},
		effect = {
			{
				equipment_proficiency_3 = 0.04,
				equipment_proficiency_2 = 0.04
			},
			{
				equipment_proficiency_3 = 0.07,
				equipment_proficiency_2 = 0.07
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[7510] = {
		use_gold = 1600,
		name = "航空強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 4,
		id = 7510,
		icon = "air_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7504,
			7509
		},
		effect = {
			{
				air = 10
			},
			{
				air = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					2
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[7511] = {
		use_gold = 2000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 107049,
		use_ship = 1,
		level_limit = 80,
		star_limit = 4,
		id = 7511,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			7509,
			7510
		},
		effect = {
			{
				air = 25,
				antiaircraft = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					6
				}
			}
		},
		gear_score = {
			50
		}
	},
	[9001] = {
		use_gold = 200,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 1,
		id = 9001,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 45
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					1
				}
			}
		},
		gear_score = {
			10
		}
	},
	[9002] = {
		use_gold = 300,
		name = "機動強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 1,
		id = 9002,
		icon = "dd_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9001
		},
		effect = {
			{
				dodge = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[9003] = {
		use_gold = 400,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 2,
		id = 9003,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9001
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[9004] = {
		use_gold = 500,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 2,
		id = 9004,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9003
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[9005] = {
		use_gold = 600,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 3,
		id = 9005,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9003
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[9006] = {
		use_gold = 800,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 3,
		id = 9006,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9005
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[9007] = {
		use_gold = 1000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 3,
		id = 9007,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9005
		},
		effect = {
			{
				durability = 45
			},
			{
				durability = 75
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					1
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[9008] = {
		use_gold = 1200,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 3,
		id = 9008,
		icon = "skill_blue",
		skill_id = 4081,
		descrip = "",
		condition_id = {
			9007
		},
		effect = {
			{
				skill_id = 4081
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[9009] = {
		use_gold = 1400,
		name = "動力強化",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 4,
		id = 9009,
		icon = "sp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9007
		},
		effect = {
			{
				speed = 3
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			30
		}
	},
	[9010] = {
		use_gold = 1600,
		name = "機動強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 4,
		id = 9010,
		icon = "dd_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9002,
			9009
		},
		effect = {
			{
				dodge = 5
			},
			{
				dodge = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[9011] = {
		use_gold = 2000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 201109,
		use_ship = 1,
		level_limit = 80,
		star_limit = 4,
		id = 9011,
		icon = "mt_yellow",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9008,
			9009,
			9010
		},
		effect = {
			{
				cannon = 20,
				dodge = 25
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					6
				}
			}
		},
		gear_score = {
			50
		}
	},
	[9201] = {
		use_gold = 300,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 9201,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 45
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[9202] = {
		use_gold = 400,
		name = "機動強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 9202,
		icon = "dd_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9201
		},
		effect = {
			{
				dodge = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[9203] = {
		use_gold = 600,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 9203,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9201
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[9204] = {
		use_gold = 800,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 9204,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9203
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[9205] = {
		use_gold = 1000,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 9205,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9203
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[9206] = {
		use_gold = 1200,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 9206,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9205
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[9207] = {
		use_gold = 1500,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 9207,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9205
		},
		effect = {
			{
				durability = 45
			},
			{
				durability = 75
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[9208] = {
		use_gold = 1800,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 9208,
		icon = "skill_blue",
		skill_id = 1061,
		descrip = "",
		condition_id = {
			9207
		},
		effect = {
			{
				skill_id = 1061
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[9209] = {
		use_gold = 2000,
		name = "動力強化",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 9209,
		icon = "sp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9207
		},
		effect = {
			{
				speed = 3
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			30
		}
	},
	[9210] = {
		use_gold = 2500,
		name = "機動強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 9210,
		icon = "dd_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9202,
			9209
		},
		effect = {
			{
				dodge = 5
			},
			{
				dodge = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[9211] = {
		use_gold = 3000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 201129,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 9211,
		icon = "mt_yellow",
		skill_id = 0,
		descrip = "",
		condition_id = {
			9208,
			9209,
			9210
		},
		effect = {
			{
				cannon = 25,
				dodge = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	[10101] = {
		use_gold = 400,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 10101,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 45
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[10102] = {
		use_gold = 600,
		name = "機動強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 10102,
		icon = "dd_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10101
		},
		effect = {
			{
				dodge = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			10
		}
	},
	[10103] = {
		use_gold = 800,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 10103,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10101
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[10104] = {
		use_gold = 1000,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 10104,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10103
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					5
				}
			}
		},
		gear_score = {
			15
		}
	},
	[10105] = {
		use_gold = 1200,
		name = "魚雷改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 10105,
		icon = "tpup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10103
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[10106] = {
		use_gold = 1500,
		name = "雷擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 10106,
		icon = "tp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10105
		},
		effect = {
			{
				torpedo = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			20
		}
	},
	[10107] = {
		use_gold = 1800,
		name = "動力強化",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 10107,
		icon = "sp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10105
		},
		effect = {
			{
				speed = 3
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					5
				}
			}
		},
		gear_score = {
			25
		}
	},
	[10108] = {
		use_gold = 2000,
		name = "機動強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 10108,
		icon = "dd_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10102,
			10107
		},
		effect = {
			{
				dodge = 5
			},
			{
				dodge = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[10109] = {
		use_gold = 2500,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 10109,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10107
		},
		effect = {
			{
				durability = 45
			},
			{
				durability = 75
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				}
			},
			{
				{
					18003,
					1
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[10110] = {
		use_gold = 3000,
		name = "雷擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 10110,
		icon = "tp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10109
		},
		effect = {
			{
				torpedo = 5
			},
			{
				torpedo = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				},
				{
					17023,
					5
				}
			},
			{
				{
					18003,
					2
				},
				{
					17023,
					15
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[10111] = {
		use_gold = 4000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 201219,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 10111,
		icon = "mt_red",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10109,
			10110
		},
		effect = {
			{
				dodge = 20,
				torpedo = 25
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					3
				}
			}
		},
		gear_score = {
			50
		}
	},
	[10112] = {
		use_gold = 3000,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 90,
		star_limit = 5,
		id = 10112,
		icon = "skill_red",
		skill_id = 10860,
		descrip = "",
		condition_id = {
			10111
		},
		effect = {
			{
				skill_id = 10860
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					2
				},
				{
					17023,
					20
				}
			}
		},
		gear_score = {
			30
		}
	},
	[10401] = {
		use_gold = 200,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 1,
		id = 10401,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 70
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					1
				}
			}
		},
		gear_score = {
			10
		}
	},
	[10402] = {
		use_gold = 300,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 1,
		id = 10402,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10401
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[10403] = {
		use_gold = 400,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 2,
		id = 10403,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10401
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[10404] = {
		use_gold = 500,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 2,
		id = 10404,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10403
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			15
		}
	},
	[10405] = {
		use_gold = 600,
		name = "魚雷改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 3,
		id = 10405,
		icon = "tpup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10403
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[10406] = {
		use_gold = 800,
		name = "雷擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 3,
		id = 10406,
		icon = "tp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10405
		},
		effect = {
			{
				torpedo = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[10407] = {
		use_gold = 1000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 3,
		id = 10407,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10405
		},
		effect = {
			{
				durability = 70
			},
			{
				durability = 100
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					1
				}
			},
			{
				{
					18012,
					1
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[10408] = {
		use_gold = 1200,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 3,
		id = 10408,
		icon = "skill_red",
		skill_id = 4081,
		descrip = "",
		condition_id = {
			10407
		},
		effect = {
			{
				skill_id = 4081
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[10409] = {
		use_gold = 1400,
		name = "主炮改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 4,
		id = 10409,
		icon = "mgup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10407,
			10408
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					1
				}
			},
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[10410] = {
		use_gold = 1600,
		name = "炮擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 4,
		id = 10410,
		icon = "cn_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10404,
			10409
		},
		effect = {
			{
				cannon = 5
			},
			{
				cannon = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					2
				}
			},
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[10411] = {
		use_gold = 2000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 202019,
		use_ship = 1,
		level_limit = 80,
		star_limit = 4,
		id = 10411,
		icon = "mt_red",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10409,
			10410
		},
		effect = {
			{
				cannon = 20,
				torpedo = 25
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					6
				}
			}
		},
		gear_score = {
			50
		}
	},
	[10601] = {
		use_gold = 300,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 10601,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 70
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[10602] = {
		use_gold = 400,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 10602,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10601
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[10603] = {
		use_gold = 600,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 10603,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10601
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[10604] = {
		use_gold = 800,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 10604,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10603
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[10605] = {
		use_gold = 1000,
		name = "魚雷改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 10605,
		icon = "tpup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10603
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[10606] = {
		use_gold = 1200,
		name = "雷擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 10606,
		icon = "tp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10605
		},
		effect = {
			{
				torpedo = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[10607] = {
		use_gold = 1500,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 10607,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10605
		},
		effect = {
			{
				durability = 70
			},
			{
				durability = 100
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					1
				}
			},
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[10608] = {
		use_gold = 1800,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 10608,
		icon = "skill_red",
		skill_id = 10710,
		descrip = "",
		condition_id = {
			10607
		},
		effect = {
			{
				skill_id = 10710
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[10609] = {
		use_gold = 2000,
		name = "主炮改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 10609,
		icon = "mgup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10607,
			10608
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					2
				}
			},
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[10610] = {
		use_gold = 2500,
		name = "炮擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 10610,
		icon = "cn_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10604,
			10609
		},
		effect = {
			{
				cannon = 5
			},
			{
				cannon = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					2
				}
			},
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[10611] = {
		use_gold = 3000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 202039,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 10611,
		icon = "mt_red",
		skill_id = 0,
		descrip = "",
		condition_id = {
			10609,
			10610
		},
		effect = {
			{
				cannon = 20,
				torpedo = 25
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18013,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	[12201] = {
		use_gold = 300,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 12201,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 80
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[12202] = {
		use_gold = 400,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 12202,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			12201
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[12203] = {
		use_gold = 600,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 12203,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			12201
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[12204] = {
		use_gold = 800,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 12204,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			12203
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[12205] = {
		use_gold = 1000,
		name = "魚雷改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 12205,
		icon = "tpup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			12203
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[12206] = {
		use_gold = 1200,
		name = "雷擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 12206,
		icon = "tp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			12205
		},
		effect = {
			{
				torpedo = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18011,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[12207] = {
		use_gold = 1500,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 12207,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			12205
		},
		effect = {
			{
				durability = 80
			},
			{
				durability = 120
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					1
				}
			},
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[12208] = {
		use_gold = 1800,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 12208,
		icon = "skill_red",
		skill_id = 2011,
		descrip = "",
		condition_id = {
			12207
		},
		effect = {
			{
				skill_id = 2011
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[12209] = {
		use_gold = 2000,
		name = "主炮改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 12209,
		icon = "mgup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			12207
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					2
				}
			},
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[12210] = {
		use_gold = 2500,
		name = "炮擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 12210,
		icon = "cn_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			12204,
			12209
		},
		effect = {
			{
				cannon = 5
			},
			{
				cannon = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18012,
					2
				}
			},
			{
				{
					18012,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[12211] = {
		use_gold = 3000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 203049,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 12211,
		icon = "mt_red",
		skill_id = 0,
		descrip = "",
		condition_id = {
			12208,
			12209,
			12210
		},
		effect = {
			{
				cannon = 25,
				torpedo = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18013,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	[15501] = {
		use_gold = 400,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 15501,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 45
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[15502] = {
		use_gold = 600,
		name = "機動強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 15502,
		icon = "dd_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15501
		},
		effect = {
			{
				dodge = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			10
		}
	},
	[15503] = {
		use_gold = 800,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 15503,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15501
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[15504] = {
		use_gold = 1000,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 15504,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15503
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					5
				}
			}
		},
		gear_score = {
			15
		}
	},
	[15505] = {
		use_gold = 1200,
		name = "魚雷改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 15505,
		icon = "tpup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15503
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[15506] = {
		use_gold = 1500,
		name = "雷擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 15506,
		icon = "tp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15505
		},
		effect = {
			{
				torpedo = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			20
		}
	},
	[15507] = {
		use_gold = 1800,
		name = "動力強化",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 15507,
		icon = "sp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15505
		},
		effect = {
			{
				speed = 3
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					5
				}
			}
		},
		gear_score = {
			25
		}
	},
	[15508] = {
		use_gold = 2000,
		name = "裝填強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 15508,
		icon = "rl_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15504,
			15507
		},
		effect = {
			{
				reload = 5
			},
			{
				reload = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[15509] = {
		use_gold = 2500,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 15509,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15507
		},
		effect = {
			{
				durability = 45
			},
			{
				durability = 75
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				}
			},
			{
				{
					18003,
					1
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[15510] = {
		use_gold = 3000,
		name = "雷擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 15510,
		icon = "tp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15506,
			15509
		},
		effect = {
			{
				torpedo = 5
			},
			{
				torpedo = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				},
				{
					17023,
					5
				}
			},
			{
				{
					18003,
					2
				},
				{
					17023,
					15
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[15511] = {
		use_gold = 4000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 301059,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 15511,
		icon = "mt_red",
		skill_id = 0,
		descrip = "",
		condition_id = {
			15509,
			15510
		},
		effect = {
			{
				dodge = 15,
				torpedo = 30
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					3
				}
			}
		},
		gear_score = {
			50
		}
	},
	[15512] = {
		use_gold = 3000,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 90,
		star_limit = 5,
		id = 15512,
		icon = "skill_blue",
		skill_id = 10940,
		descrip = "",
		condition_id = {
			15508,
			15511
		},
		effect = {
			{
				skill_id = 10940
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					2
				},
				{
					17023,
					20
				}
			}
		},
		gear_score = {
			30
		}
	},
	[20801] = {
		use_gold = 200,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 20801,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 100
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[20802] = {
		use_gold = 300,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 20802,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20801
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[20803] = {
		use_gold = 400,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 20803,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20801,
			20802
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[20804] = {
		use_gold = 500,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 20804,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20803
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[20805] = {
		use_gold = 600,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 20805,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20803
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[20806] = {
		use_gold = 800,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 20806,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20805
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[20807] = {
		use_gold = 1000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 20807,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20805
		},
		effect = {
			{
				durability = 100
			},
			{
				durability = 150
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18022,
					1
				}
			},
			{
				{
					18022,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[20808] = {
		use_gold = 1200,
		name = "主炮改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 20808,
		icon = "mgup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20807
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18022,
					2
				}
			},
			{
				{
					18022,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[20809] = {
		use_gold = 1400,
		name = "炮擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 20809,
		icon = "cn_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20804,
			20808
		},
		effect = {
			{
				cannon = 5
			},
			{
				cannon = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18022,
					2
				}
			},
			{
				{
					18022,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[20810] = {
		use_gold = 5000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 305019,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 20810,
		icon = "mt_red",
		skill_id = 0,
		descrip = [[
近代化改造完成

習得技能<color=#A9F548>【航空預備】</color>
第一次執行空中支援時，額外進行一輪航空彈幕攻擊(威力隨技能等級提升) ，每場戰鬥只能觸發1次

改造後<color=#A9F548>【主炮底座-1】</color>
改造後<color=#A9F548>主炮效率</color>提高20%
改造後<color=#A9F548>【副武器】</color>裝備欄位裝備類型更改為<color=#A9F548>【水偵】</color>
在裝備<color=#A9F548 >【水偵】</color>的情況下，<color=#A9F548>【扶桑改】</color>可以進行<color=#A9F548>空中支援</color>]],
		condition_id = {
			20808
		},
		effect = {
			{
				cannon = 20,
				air = 25
			}
		},
		ship_id = {
			{
				305014,
				310014
			}
		},
		use_item = {
			{
				{
					18023,
					3
				},
				{
					17043,
					60
				}
			}
		},
		gear_score = {
			50
		}
	},
	[20811] = {
		use_gold = 1600,
		name = "航空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 85,
		star_limit = 5,
		id = 20811,
		icon = "air_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20806,
			20810
		},
		effect = {
			{
				air = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18033,
					2
				}
			}
		},
		gear_score = {
			25
		}
	},
	[20901] = {
		use_gold = 200,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 20901,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 100
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[20902] = {
		use_gold = 300,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 20902,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20901
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[20903] = {
		use_gold = 400,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 20903,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20901,
			20902
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[20904] = {
		use_gold = 500,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 20904,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20903
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[20905] = {
		use_gold = 600,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 20905,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20903
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[20906] = {
		use_gold = 800,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 20906,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20905
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18021,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[20907] = {
		use_gold = 1000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 20907,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20905
		},
		effect = {
			{
				durability = 100
			},
			{
				durability = 150
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18022,
					1
				}
			},
			{
				{
					18022,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[20908] = {
		use_gold = 1200,
		name = "主炮改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 20908,
		icon = "mgup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20907
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18022,
					2
				}
			},
			{
				{
					18022,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[20909] = {
		use_gold = 1400,
		name = "炮擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 20909,
		icon = "cn_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20904,
			20908
		},
		effect = {
			{
				cannon = 5
			},
			{
				cannon = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18022,
					2
				}
			},
			{
				{
					18022,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[20910] = {
		use_gold = 5000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 305029,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 20910,
		icon = "mt_red",
		skill_id = 0,
		descrip = [[
近代化改造完成

習得技能<color=#A9F548>【航空預備】</color>
第一次執行空中支援時，額外進行一輪航空彈幕攻擊(威力隨技能等級提升) ，每場戰鬥只能觸發1次

改造後<color=#A9F548>【主炮底座-1】</color>
改造後<color=#A9F548>主炮效率</color>提高20%
改造後<color=#A9F548>【副武器】</color>裝備欄位裝備類型更改為<color=#A9F548>【水偵】</color>
在裝備<color=#A9F548 >【水偵】</color>的情況下，<color=#A9F548>【山城改】</color>可以進行<color=#A9F548>空中支援</color>]],
		condition_id = {
			20908
		},
		effect = {
			{
				cannon = 20,
				air = 25
			}
		},
		ship_id = {
			{
				305024,
				310024
			}
		},
		use_item = {
			{
				{
					18023,
					3
				},
				{
					17043,
					60
				}
			}
		},
		gear_score = {
			50
		}
	},
	[20911] = {
		use_gold = 1600,
		name = "航空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 85,
		star_limit = 5,
		id = 20911,
		icon = "air_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			20906,
			20910
		},
		effect = {
			{
				air = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18033,
					2
				}
			}
		},
		gear_score = {
			25
		}
	},
	[22201] = {
		use_gold = 200,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 22201,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 70
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[22202] = {
		use_gold = 300,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 22202,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			22201
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[22203] = {
		use_gold = 400,
		name = "轟炸精通I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 22203,
		icon = "bfup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			22201,
			22202
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[22204] = {
		use_gold = 500,
		name = "航空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 22204,
		icon = "air_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			22203
		},
		effect = {
			{
				air = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[22205] = {
		use_gold = 600,
		name = "魚雷俯衝I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 22205,
		icon = "tfup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			22203
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[22206] = {
		use_gold = 800,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 22206,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			22205
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18031,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[22207] = {
		use_gold = 1000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 22207,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			22205
		},
		effect = {
			{
				durability = 70
			},
			{
				durability = 100
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[22208] = {
		use_gold = 1200,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 22208,
		icon = "skill_yellow",
		skill_id = 3041,
		descrip = "",
		condition_id = {
			22207
		},
		effect = {
			{
				skill_id = 3041
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[22209] = {
		use_gold = 1400,
		name = "轟炸精通II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 22209,
		icon = "bfup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			22207,
			22208
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					1
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[22210] = {
		use_gold = 1600,
		name = "航空強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 22210,
		icon = "air_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			22204,
			22209
		},
		effect = {
			{
				air = 10
			},
			{
				air = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18032,
					2
				}
			},
			{
				{
					18032,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[22211] = {
		use_gold = 2000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 306059,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 22211,
		icon = "mt_yellow",
		skill_id = 0,
		descrip = "",
		condition_id = {
			22209,
			22210
		},
		effect = {
			{
				air = 25,
				antiaircraft = 20
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18033,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	[23601] = {
		use_gold = 400,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 23601,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 45
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[23602] = {
		use_gold = 600,
		name = "機動強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 23602,
		icon = "dd_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23601
		},
		effect = {
			{
				dodge = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			10
		}
	},
	[23603] = {
		use_gold = 800,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 23603,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23601
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[23604] = {
		use_gold = 1000,
		name = "炮擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 23604,
		icon = "cn_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23603
		},
		effect = {
			{
				cannon = 5
			},
			{
				cannon = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			},
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			5,
			10
		}
	},
	[23605] = {
		use_gold = 1200,
		name = "防空炮改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 23605,
		icon = "Aaup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23603
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			},
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			10
		}
	},
	[23606] = {
		use_gold = 1500,
		name = "防空強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 23606,
		icon = "aa_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23605
		},
		effect = {
			{
				antiaircraft = 15
			},
			{
				antiaircraft = 25
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					1
				}
			}
		},
		gear_score = {
			10,
			10
		}
	},
	[23607] = {
		use_gold = 1800,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 23607,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23605
		},
		effect = {
			{
				durability = 45
			},
			{
				durability = 75
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			},
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[23608] = {
		use_gold = 2000,
		name = "雷擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 23608,
		icon = "tp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23607
		},
		effect = {
			{
				torpedo = 5
			},
			{
				torpedo = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			15
		}
	},
	[23609] = {
		use_gold = 2500,
		name = "主炮改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 23609,
		icon = "mgup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23607
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			},
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				}
			},
			{
				{
					18003,
					1
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[23610] = {
		use_gold = 3000,
		name = "炮擊強化III",
		max_level = 3,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 23610,
		icon = "Cn_3",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23604,
			23609
		},
		effect = {
			{
				cannon = 5
			},
			{
				cannon = 10
			},
			{
				cannon = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				},
				{
					17013,
					5
				}
			},
			{
				{
					18003,
					1
				},
				{
					17013,
					10
				}
			},
			{
				{
					18003,
					1
				},
				{
					17013,
					15
				}
			}
		},
		gear_score = {
			5,
			10,
			15
		}
	},
	[23611] = {
		use_gold = 4000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 401239,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 23611,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			23609
		},
		effect = {
			{
				antisub = 20,
				antiaircraft = 25
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					3
				}
			}
		},
		gear_score = {
			50
		}
	},
	[23612] = {
		use_gold = 3000,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 90,
		star_limit = 5,
		id = 23612,
		icon = "skill_red",
		skill_id = 11320,
		descrip = "",
		condition_id = {
			23611
		},
		effect = {
			{
				skill_id = 11320
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					2
				},
				{
					17013,
					20
				}
			}
		},
		gear_score = {
			30
		}
	},
	[26901] = {
		use_gold = 300,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 26901,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 45
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[26902] = {
		use_gold = 400,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 26902,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			26901
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[26903] = {
		use_gold = 600,
		name = "魚雷改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 26903,
		icon = "tpup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			26901
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[26904] = {
		use_gold = 800,
		name = "雷擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 26904,
		icon = "tp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			26903
		},
		effect = {
			{
				torpedo = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[26905] = {
		use_gold = 1000,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 26905,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			26903
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[26906] = {
		use_gold = 1200,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 26906,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			26905
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[26907] = {
		use_gold = 1500,
		name = "動力強化",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 26907,
		icon = "sp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			26905
		},
		effect = {
			{
				speed = 3
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[26908] = {
		use_gold = 1800,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 26908,
		icon = "skill_red",
		skill_id = 11130,
		descrip = "",
		condition_id = {
			26907
		},
		effect = {
			{
				skill_id = 11130
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[26909] = {
		use_gold = 2000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 26909,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			26907
		},
		effect = {
			{
				durability = 45
			},
			{
				durability = 75
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[26910] = {
		use_gold = 2500,
		name = "裝填強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 26910,
		icon = "rl_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			26902,
			26909
		},
		effect = {
			{
				reload = 5
			},
			{
				reload = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[26911] = {
		use_gold = 3000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 301309,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 26911,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			26908,
			26909,
			26910
		},
		effect = {
			{
				antiaircraft = 25,
				hit = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	[27001] = {
		use_gold = 300,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 27001,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 45
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[27002] = {
		use_gold = 400,
		name = "裝填強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 27002,
		icon = "rl_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			27001
		},
		effect = {
			{
				reload = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[27003] = {
		use_gold = 600,
		name = "魚雷改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 27003,
		icon = "tpup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			27001
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[27004] = {
		use_gold = 800,
		name = "雷擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 27004,
		icon = "tp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			27003
		},
		effect = {
			{
				torpedo = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[27005] = {
		use_gold = 1000,
		name = "防空炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 27005,
		icon = "aaup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			27003
		},
		effect = {
			{
				equipment_proficiency_3 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			20
		}
	},
	[27006] = {
		use_gold = 1200,
		name = "防空強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 27006,
		icon = "aa_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			27005
		},
		effect = {
			{
				antiaircraft = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[27007] = {
		use_gold = 1500,
		name = "動力強化",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 27007,
		icon = "sp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			27005
		},
		effect = {
			{
				speed = 3
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[27008] = {
		use_gold = 1800,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 27008,
		icon = "skill_blue",
		skill_id = 4071,
		descrip = "",
		condition_id = {
			27007
		},
		effect = {
			{
				skill_id = 4071
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[27009] = {
		use_gold = 2000,
		name = "艦體改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 27009,
		icon = "hp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			27007
		},
		effect = {
			{
				durability = 45
			},
			{
				durability = 75
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[27010] = {
		use_gold = 2500,
		name = "裝填強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 27010,
		icon = "rl_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			27002,
			27009
		},
		effect = {
			{
				reload = 5
			},
			{
				reload = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[27011] = {
		use_gold = 3000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 301319,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 27011,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			27008,
			27009,
			27010
		},
		effect = {
			{
				antiaircraft = 25,
				hit = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	[31801] = {
		use_gold = 200,
		name = "艦體改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 1,
		star_limit = 2,
		id = 31801,
		icon = "hp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {},
		effect = {
			{
				durability = 60
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[31802] = {
		use_gold = 300,
		name = "機動強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 5,
		star_limit = 2,
		id = 31802,
		icon = "dd_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			31801
		},
		effect = {
			{
				dodge = 5
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					2
				}
			}
		},
		gear_score = {
			10
		}
	},
	[31803] = {
		use_gold = 400,
		name = "主炮改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 20,
		star_limit = 3,
		id = 31803,
		icon = "mgup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			31801
		},
		effect = {
			{
				equipment_proficiency_1 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[31804] = {
		use_gold = 500,
		name = "炮擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 25,
		star_limit = 3,
		id = 31804,
		icon = "cn_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			31803
		},
		effect = {
			{
				cannon = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					3
				}
			}
		},
		gear_score = {
			15
		}
	},
	[31805] = {
		use_gold = 600,
		name = "魚雷改良I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 35,
		star_limit = 4,
		id = 31805,
		icon = "tpup_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			31803
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					4
				}
			}
		},
		gear_score = {
			20
		}
	},
	[31806] = {
		use_gold = 800,
		name = "雷擊強化I",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 40,
		star_limit = 4,
		id = 31806,
		icon = "tp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			31805
		},
		effect = {
			{
				torpedo = 10
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18001,
					5
				}
			}
		},
		gear_score = {
			20
		}
	},
	[31807] = {
		use_gold = 1000,
		name = "動力強化",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 50,
		star_limit = 4,
		id = 31807,
		icon = "sp_1",
		skill_id = 0,
		descrip = "",
		condition_id = {
			31805
		},
		effect = {
			{
				speed = 3
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			25
		}
	},
	[31808] = {
		use_gold = 1200,
		name = "戰術啟發",
		max_level = 1,
		skin_id = 0,
		use_ship = 0,
		level_limit = 55,
		star_limit = 4,
		id = 31808,
		icon = "skill_blue",
		skill_id = 4071,
		descrip = "",
		condition_id = {
			31807
		},
		effect = {
			{
				skill_id = 4071
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					3
				}
			}
		},
		gear_score = {
			25
		}
	},
	[31809] = {
		use_gold = 1400,
		name = "魚雷改良II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 70,
		star_limit = 5,
		id = 31809,
		icon = "tpup_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			31807
		},
		effect = {
			{
				equipment_proficiency_2 = 0.05
			},
			{
				equipment_proficiency_2 = 0.05
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					1
				}
			},
			{
				{
					18002,
					2
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[31810] = {
		use_gold = 1600,
		name = "雷擊強化II",
		max_level = 2,
		skin_id = 0,
		use_ship = 0,
		level_limit = 75,
		star_limit = 5,
		id = 31810,
		icon = "tp_2",
		skill_id = 0,
		descrip = "",
		condition_id = {
			31806,
			31809
		},
		effect = {
			{
				torpedo = 5
			},
			{
				torpedo = 15
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18002,
					2
				},
				{
					17023,
					5
				}
			},
			{
				{
					18002,
					2
				},
				{
					17023,
					15
				}
			}
		},
		gear_score = {
			10,
			20
		}
	},
	[31811] = {
		use_gold = 2000,
		name = "近代化改造",
		max_level = 1,
		skin_id = 301619,
		use_ship = 1,
		level_limit = 85,
		star_limit = 5,
		id = 31811,
		icon = "mt_blue",
		skill_id = 0,
		descrip = "",
		condition_id = {
			31809,
			31810
		},
		effect = {
			{
				dodge = 15,
				torpedo = 30
			}
		},
		ship_id = {},
		use_item = {
			{
				{
					18003,
					1
				}
			}
		},
		gear_score = {
			50
		}
	},
	all = {
		1901,
		1902,
		1903,
		1904,
		1905,
		1906,
		1907,
		1908,
		1909,
		1910,
		1911,
		1912,
		2701,
		2702,
		2703,
		2704,
		2705,
		2706,
		2707,
		2708,
		2709,
		2710,
		2711,
		4401,
		4402,
		4403,
		4404,
		4405,
		4406,
		4407,
		4408,
		4409,
		4410,
		4411,
		7001,
		7002,
		7003,
		7004,
		7005,
		7006,
		7007,
		7008,
		7009,
		7010,
		7011,
		7101,
		7102,
		7103,
		7104,
		7105,
		7106,
		7107,
		7108,
		7109,
		7110,
		7111,
		7201,
		7202,
		7203,
		7204,
		7205,
		7206,
		7207,
		7208,
		7209,
		7210,
		7211,
		7501,
		7502,
		7503,
		7504,
		7505,
		7506,
		7507,
		7508,
		7509,
		7510,
		7511,
		9001,
		9002,
		9003,
		9004,
		9005,
		9006,
		9007,
		9008,
		9009,
		9010,
		9011,
		9201,
		9202,
		9203,
		9204,
		9205,
		9206,
		9207,
		9208,
		9209,
		9210,
		9211,
		10101,
		10102,
		10103,
		10104,
		10105,
		10106,
		10107,
		10108,
		10109,
		10110,
		10111,
		10112,
		10401,
		10402,
		10403,
		10404,
		10405,
		10406,
		10407,
		10408,
		10409,
		10410,
		10411,
		10601,
		10602,
		10603,
		10604,
		10605,
		10606,
		10607,
		10608,
		10609,
		10610,
		10611,
		12201,
		12202,
		12203,
		12204,
		12205,
		12206,
		12207,
		12208,
		12209,
		12210,
		12211,
		15501,
		15502,
		15503,
		15504,
		15505,
		15506,
		15507,
		15508,
		15509,
		15510,
		15511,
		15512,
		20801,
		20802,
		20803,
		20804,
		20805,
		20806,
		20807,
		20808,
		20809,
		20810,
		20811,
		20901,
		20902,
		20903,
		20904,
		20905,
		20906,
		20907,
		20908,
		20909,
		20910,
		20911,
		22201,
		22202,
		22203,
		22204,
		22205,
		22206,
		22207,
		22208,
		22209,
		22210,
		22211,
		23601,
		23602,
		23603,
		23604,
		23605,
		23606,
		23607,
		23608,
		23609,
		23610,
		23611,
		23612,
		26901,
		26902,
		26903,
		26904,
		26905,
		26906,
		26907,
		26908,
		26909,
		26910,
		26911,
		27001,
		27002,
		27003,
		27004,
		27005,
		27006,
		27007,
		27008,
		27009,
		27010,
		27011,
		31801,
		31802,
		31803,
		31804,
		31805,
		31806,
		31807,
		31808,
		31809,
		31810,
		31811
	}
}

return
