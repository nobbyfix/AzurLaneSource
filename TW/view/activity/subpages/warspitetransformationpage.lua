slot0 = class("WarspiteTransformationPage", import("view.base.BaseActivityPage"))

slot0.OnInit = function (slot0)
	slot0.bg = slot0:findTF("AD", slot0._tf)
	slot0.btn = slot0:findTF("battle_btn", slot0.bg)
	slot0.tip = slot0:findTF("help", slot0.bg)
	slot0.mainAward = slot0:findTF("award", slot0.bg)
	slot0.subAwards = slot0:Clone2Full(slot0:findTF("list", slot0.bg), 7)
	slot0.step = slot0:findTF("receivetimes", slot0.bg)
	slot0.score = slot0:findTF("highscore", slot0.bg)
end

slot0.OnDataSetting = function (slot0)
	if slot0.activity.data4 == 0 and slot1.data2 >= 7 then
		slot0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 3,
			activity_id = slot1.id
		})

		return true
	elseif defaultValue(slot1.data2_list[1], 0) > 0 or defaultValue(slot1.data2_list[2], 0) > 0 then
		slot0:emit(ActivityMediator.EVENT_OPERATION, {
			cmd = 2,
			activity_id = slot1.id
		})

		return true
	end
end

slot0.OnFirstFlush = function (slot0)
	slot3 = {
		type = slot0.activity.getConfig(slot1, "config_client")[2][1],
		id = slot0.activity.getConfig(slot1, "config_client")[2][2],
		count = slot0.activity.getConfig(slot1, "config_client")[2][3]
	}

	onButton(slot0, slot0.mainAward, function ()
		slot0:emit(BaseUI.ON_DROP, slot0)
	end, SFX_PANEL)

	for slot7 = 1, 7, 1 do
		slot10 = {
			type = slot1:getConfig("config_client")[1][1],
			id = slot1.getConfig("config_client")[1][2],
			count = slot1.getConfig("config_client")[1][3]
		}

		onButton(slot0, slot0.subAwards[slot7], function ()
			slot0:emit(BaseUI.ON_DROP, slot0)
		end, SFX_PANEL)
	end

	onButton(slot0, slot0.tip, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.goldship_help_tip.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.btn, function ()
		slot0:emit(ActivityMediator.GO_DODGEM)
	end, SFX_PANEL)
end

slot0.OnUpdateFlush = function (slot0)
	slot2 = pg.TimeMgr.GetInstance()
	slot3 = slot2:DiffDay(slot0.activity.data1, slot2:GetServerTime()) + 1

	setActive(findTF(slot0.mainAward, "get"), slot0.activity.data4 > 0)

	for slot7 = 1, 7, 1 do
		setActive(findTF(slot8, "get"), slot7 <= slot1.data2)
		setActive(findTF(slot8, "lock"), slot3 < slot7)
	end

	setText(slot0.step, slot1.data2)
	setText(slot0.score, slot1.data1_list[1])
end

slot0.Clone2Full = function (slot0, slot1, slot2)
	slot3 = {}
	slot4 = slot1:GetChild(0)

	for slot9 = 0, slot1.childCount - 1, 1 do
		table.insert(slot3, slot1:GetChild(slot9))
	end

	for slot9 = slot5, slot2 - 1, 1 do
		table.insert(slot3, tf(cloneTplTo(slot4, slot1)))
	end

	return slot3
end

return slot0
