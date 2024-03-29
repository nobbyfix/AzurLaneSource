return {
	id = "B002",
	events = {
		{
			alpha = 0.34,
			code = {
				"ShowSkill3"
			},
			hideui = {
				{
					ishide = false,
					path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3"
				}
			},
			style = {
				text = "주력함대의 <color=#ff7d36>공중 지원</color> 준비 OK야!",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.34,
			code = {
				"ShowSkill3"
			},
			style = {
				text = "적을 쓸어버리자고! <color=#ff7d36>공중 지원</color> 버튼을 눌러봐!",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				path = "UICamera/Canvas/UIMain/CombatUI(Clone)/Skill_3/ActCtl",
				triggerType = {
					3
				}
			}
		},
		{
			alpha = 0.34,
			code = {
				"ReleaseAfter"
			},
			style = {
				text = "공중 지원의 힘을 봤지! 긴급 상황에서 사용하면 <color=#ff7d36>적의 탄막</color>을 없애는 효과도 있어!",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			}
		}
	}
}
