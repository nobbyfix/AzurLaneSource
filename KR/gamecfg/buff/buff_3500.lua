return {
	time = 0,
	name = "日常关卡技能无效",
	init_effect = "",
	id = 3500,
	picture = "",
	desc = "",
	stack = 1,
	color = "yellow",
	icon = 3500,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddAttr",
			trigger = {
				"onAttach"
			},
			arg_list = {
				number = 14,
				attr = "velocity"
			}
		}
	}
}
