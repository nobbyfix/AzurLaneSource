return {
	{
		desc = "主炮每进行15次攻击，触发全弹发射-鞍山级I"
	},
	time = 0,
	name = "全弹发射",
	init_effect = "",
	id = 24011,
	picture = "",
	desc = "主炮每进行15次攻击，触发全弹发射-鞍山级I",
	stack = 1,
	color = "red",
	icon = 20000,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffCount",
			trigger = {
				"onFire"
			},
			arg_list = {
				countTarget = 15,
				countType = 24010,
				index = {
					1
				}
			}
		},
		{
			type = "BattleBuffCastSkill",
			trigger = {
				"onBattleBuffCount"
			},
			arg_list = {
				skill_id = 24011,
				target = "TargetSelf",
				countType = 24010
			}
		}
	}
}
