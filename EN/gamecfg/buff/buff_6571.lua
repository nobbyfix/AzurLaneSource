return {
	init_effect = "",
	name = "",
	time = 0,
	color = "red",
	picture = "",
	desc = "",
	stack = 1,
	id = 6571,
	icon = 6570,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffShiftBullet",
			trigger = {
				"onAttach",
				"onRemove"
			},
			arg_list = {
				bullet_id = 1803,
				index = {
					2
				}
			}
		},
		{
			type = "BattleBuffAddBulletAttr",
			trigger = {
				"onBulletCreate"
			},
			arg_list = {
				attr = "damageRatioBullet",
				number = 0.05,
				index = {
					2
				}
			}
		},
		{
			type = "BattleBuffCancelBuff",
			trigger = {
				"onTorpedoWeaponFire"
			},
			arg_list = {
				count = 1
			}
		}
	}
}
