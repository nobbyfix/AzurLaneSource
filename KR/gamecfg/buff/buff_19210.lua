return {
	{
		shipInfoScene = {
			equip = {
				{
					number = 4.5,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	{
		shipInfoScene = {
			equip = {
				{
					number = 5.2,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	{
		shipInfoScene = {
			equip = {
				{
					number = 6,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	{
		shipInfoScene = {
			equip = {
				{
					number = 7,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	{
		shipInfoScene = {
			equip = {
				{
					number = 7.7,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	{
		shipInfoScene = {
			equip = {
				{
					number = 8.5,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	{
		shipInfoScene = {
			equip = {
				{
					number = 9.5,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	{
		shipInfoScene = {
			equip = {
				{
					number = 10.2,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	{
		shipInfoScene = {
			equip = {
				{
					number = 11,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	{
		shipInfoScene = {
			equip = {
				{
					number = 12,
					type = {
						11
					},
					nationality = {
						3
					}
				}
			}
		}
	},
	desc_get = "占坑",
	name = "吾妻·特殊弹幕",
	init_effect = "",
	id = 19210,
	time = 0,
	picture = "",
	desc = "占坑",
	stack = 1,
	color = "red",
	icon = 19210,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minWeaponNumber = 1,
				skill_id = 19210,
				check_weapon = true,
				type = {
					3
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minWeaponNumber = 1,
				skill_id = 19210,
				check_weapon = true,
				weapon_group = {
					43100,
					43120,
					43140
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onStartGame"
			},
			arg_list = {
				minWeaponNumber = 1,
				skill_id = 19212,
				check_weapon = true,
				weapon_group = {
					33100
				}
			}
		}
	}
}
