return {
	id = "SYG003",
	events = {
		{
			alpha = 0.284,
			style = {
				text = "<color=#ff7d36>군사 의뢰</color>는 이쪽이야.",
				mode = 2,
				dir = 1,
				posY = 89.6,
				posX = 186.59
			},
			ui = {
				pathIndex = -1,
				path = "/OverlayCamera/Overlay/UIMain/toTop/frame/rightPanel/eventPanel/combatBtn",
				triggerType = {
					1
				},
				fingerPos = {
					posY = -4.24,
					posX = 28.95
				}
			}
		},
		{
			alpha = 0.485,
			style = {
				text = "<color=#ff7d36>의뢰</color>를 확인하자.",
				mode = 2,
				dir = 1,
				posY = 0,
				posX = 0
			},
			ui = {
				pathIndex = -1,
				path = "/UICamera/Canvas/UIMain/LevelMainScene(Clone)/main/right_chapter/event_btns/event_container/btn_special",
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 65.6
				}
			}
		},
		{
			alpha = 0.563,
			style = {
				text = "지금 받을 수 있는 의뢰가 전부 표시되어 있어. <color=#ff7d36>의뢰에 따라 소요시간과 보상이 달라져.</color>",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		},
		{
			alpha = 0.636,
			style = {
				text = "눌러서 상세정보를 확인해봐.",
				mode = 2,
				dir = 1,
				posY = -69.9,
				posX = -271.7
			},
			ui = {
				pathIndex = 0,
				delay = 1,
				eventIndex = 1,
				path = "/UICamera/Canvas/UIMain/EventUI(Clone)/scrollRect$/content",
				triggerType = {
					1
				},
				fingerPos = {
					posY = 0,
					posX = 65.6
				}
			}
		},
		{
			alpha = 0.419,
			style = {
				text = "<color=#ff7d36>제한시간이 존재하는 긴급 의뢰</color>는 여기에 표시돼.</color>",
				mode = 2,
				dir = -1,
				posY = 175.56,
				posX = -231.6
			},
			ui = {
				pathIndex = -1,
				path = "/UICamera/Canvas/UIMain/EventUI(Clone)/blur_panel/adapt/left_length/frame/scroll_rect/tagRoot/urgency_btn",
				triggerType = {
					2
				},
				fingerPos = {
					posY = -28.49,
					posX = 58.24
				}
			}
		},
		{
			alpha = 0.351,
			style = {
				text = "<color=#ff7d36>긴급 의뢰는 전투 중 가끔씩 발생</color>하니까, 제한 시간에 주의하도록 해.",
				mode = 2,
				dir = -1,
				posY = 0,
				posX = 0
			}
		}
	}
}
