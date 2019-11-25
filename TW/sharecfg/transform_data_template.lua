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
