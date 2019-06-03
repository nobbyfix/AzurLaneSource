return {
	{
		desc = "每20秒，有10.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"10.0%(+3.0%)"
		}
	},
	{
		desc = "每20秒，有13.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"13.0%(+3.0%)"
		}
	},
	{
		desc = "每20秒，有16.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"16.0%(+4.0%)"
		}
	},
	{
		desc = "每20秒，有20.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"20.0%(+3.0%)"
		}
	},
	{
		desc = "每20秒，有23.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"23.0%(+3.0%)"
		}
	},
	{
		desc = "每20秒，有26.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"26.0%(+4.0%)"
		}
	},
	{
		desc = "每20秒，有30.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"30.0%(+3.0%)"
		}
	},
	{
		desc = "每20秒，有33.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"33.0%(+3.0%)"
		}
	},
	{
		desc = "每20秒，有36.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"36.0%(+4.0%)"
		}
	},
	{
		desc = "每20秒，有40.0%的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
		addition = {
			"40.0%"
		}
	},
	desc_get = "每20秒，有10.0%(满级40.0%)的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
	name = "吸引火力",
	init_effect = "",
	id = 4041,
	time = 0,
	picture = "",
	desc = "每20秒，有$1的概率发动，承受先锋队伍受到的50%伤害，持续8秒，同技能效果不叠加",
	stack = 1,
	color = "blue",
	icon = 4040,
	last_effect = "",
	effect_list = {
		{
			type = "BattleBuffAddBuff",
			trigger = {
				"onUpdate"
			},
			arg_list = {
				buff_id = 4042,
				time = 20,
				target = "TargetSelf"
			}
		}
	}
}
