slot0 = class("TrainingCampScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "TrainingCampUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
end

function slot0.init(slot0)
	slot0.togglesTF = slot0:findTF("bg/frame/toggles")
	slot0.uilist = UIItemList.New(slot0:findTF("bg/frame/main/scrollrect/content"), slot0:findTF("bg/frame/main/scrollrect/content/task"))
	slot0.phaseTF = slot0:findTF("bg/frame/main/progress")
	slot0.frameTF = slot0:findTF("bg/frame")
	slot0.awardMsg = slot0:findTF("bg/awards")

	slot0:closeMsgBox()
end

function slot0.didEnter(slot0)
	slot0:initToggles()
	onButton(slot0, slot0:findTF("top/left_top/back_button"), function ()
		uv0:emit(uv1.ON_BACK)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("top/help"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.newplayer_help_tip.tip
		})
	end, SFX_PANEL)
end

function slot0.initToggles(slot0)
	slot0.toggles = {
		slot0:findTF("phase1", slot0.togglesTF),
		slot0:findTF("phase2", slot0.togglesTF),
		slot0:findTF("phase3", slot0.togglesTF)
	}

	slot0:updatePhase()

	for slot4, slot5 in pairs(slot0.toggles) do
		onToggle(slot0, slot5, function (slot0)
			if slot0 then
				if uv0.phaseId < uv1 then
					pg.TipsMgr:GetInstance():ShowTips(i18n("newplayer_notice_7"))
					triggerToggle(uv0.toggles[uv0.contextData.pageId], true)
				else
					uv0:switchPage(uv1)
				end
			end
		end, SFX_PANEL)
	end

	triggerToggle(slot0.toggles[slot0.phaseId], true)
end

function slot0.updatePhase(slot0)
	slot1 = 1
	slot3 = getProxy(TaskProxy)

	for slot8 = #slot0.toggles, 1, -1 do
		if _.all(slot0.activity:getConfig("config_data")[3][slot8][1], function (slot0)
			return (uv0:getTaskById(slot0) or uv0:getFinishTaskById(slot0)) ~= nil
		end) or function (slot0)
			if slot0 > 1 then
				return uv1:getFinishTaskById(uv0[slot0 - 1][2]) ~= nil
			end
		end(slot8) then
			slot1 = slot8

			break
		end
	end

	slot0.phaseId = slot1 or 1

	for slot8, slot9 in ipairs(slot0.toggles) do
		setActive(slot9:Find("disable"), slot0.phaseId < slot8)
	end
end

function slot0.updateTask(slot0, slot1, slot2, slot3)
	slot5 = slot2:Find("got")
	slot6 = slot2:Find("go")
	slot7 = getProxy(TaskProxy)
	slot9 = setActive
	slot10 = slot2:Find("get")

	if slot0:getTask(slot3, slot1) and slot8:isFinish() then
		slot11 = not slot8:isReceive()
	end

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot5

	if slot8 then
		slot11 = slot8:isReceive()
	end

	slot9(slot10, slot11)

	slot9 = setActive
	slot10 = slot6

	if slot8 then
		if slot8 then
			slot11 = not slot8:isFinish()

			if not slot8.isFinish() then
				slot11 = false
			end
		end
	else
		slot11 = true
	end

	slot9(slot10, slot11)

	if slot8 and slot8:isClientTrigger() and not slot8:isFinish() then
		slot0:emit(TrainingCampMediator.ON_UPDATE, slot8)
	end

	setText(slot2:Find("title"), slot8 or Task.New({
		id = slot1
	}):getConfig("desc"))
	updateDrop(slot2:Find("item"), {
		type = slot8 or Task.New():getConfig("award_display")[1][1],
		id = slot8 or Task.New().getConfig("award_display")[1][2],
		count = slot8 or Task.New().getConfig("award_display")[1][3]
	})
	setText(slot2:Find("progress"), math.min(slot8.progress, slot8:getConfig("target_num")) .. "/" .. slot8:getConfig("target_num"))
	onButton(slot0, slot4, function ()
		uv0:emit(TrainingCampMediator.ON_GET, uv1)
	end, SFX_PANEL)
	onButton(slot0, slot6, function ()
		uv0:emit(TrainingCampMediator.ON_GO, uv1)
	end, SFX_PANEL)
end

function slot0.switchPage(slot0, slot1)
	slot0.contextData.pageId = slot1
	slot2 = getProxy(TaskProxy)

	function slot6(slot0)
		if slot0:isReceive() then
			return 0
		elseif slot0:isFinish() then
			return 2
		elseif not slot0:isFinish() then
			return 1
		end

		return -1
	end

	table.sort(slot4, function (slot0, slot1)
		if not uv0:getTaskById(slot0) and not uv0:getFinishTaskById(slot0) then
			slot2 = Task.New({
				id = slot0
			})
		end

		if not uv0:getTaskById(slot1) and not uv0:getFinishTaskById(slot1) then
			slot3 = Task.New({
				id = slot1
			})
		end

		if uv1(slot2) == uv1(slot3) then
			if slot2.id >= slot3.id then
				slot6 = false
			else
				slot6 = true
			end

			return slot6
		else
			if slot5 >= slot4 then
				slot6 = false
			else
				slot6 = true
			end

			return slot6
		end
	end)
	slot0.uilist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			uv0:updateTask(uv1[slot1 + 1], slot2, uv2)
		end
	end)
	slot0.uilist:align(#slot0.activity:getConfig("config_data")[3][slot1][1])

	function slot7()
		return _.all(uv0, function (slot0)
			if uv0:getFinishTaskById(slot0) == nil then
				slot1 = false
			else
				slot1 = true
			end

			return slot1
		end)
	end

	function slot8()
		return _.any(uv0, function (slot0)
			if not uv0:getFinishTaskById(slot0) then
				slot1 = uv0:getTaskById(slot0)
			end

			if slot1 ~= nil then
				slot2 = false
			else
				slot2 = true
			end

			return slot2
		end)
	end

	slot10 = setActive
	slot11 = slot0.phaseTF:Find("get")

	if slot0:getTask(slot1, slot5) and slot9:isFinish() then
		slot12 = not slot9:isReceive()
	end

	slot10(slot11, slot12)
	setActive(slot0.phaseTF:Find("lock"), not slot9)

	slot10 = setActive
	slot11 = slot0.phaseTF:Find("go")

	if slot9 then
		slot12 = not slot9:isFinish()
	end

	slot10(slot11, slot12)

	slot10 = setActive
	slot11 = slot0.phaseTF:Find("pass")

	if slot9 then
		slot12 = slot9:isReceive()
	end

	slot10(slot11, slot12)

	if slot1 == slot0.phaseId and slot8() then
		slot0:emit(TrainingCampMediator.ON_TRIGGER, {
			cmd = 1,
			activity_id = slot0.activity.id
		})
	end

	if slot9 and slot9:isClientTrigger() and not slot9:isFinish() then
		slot0:emit(TrainingCampMediator.ON_UPDATE, slot9)
	end

	if not slot9 then
		slot9 = Task.New({
			id = slot5
		})

		if slot7() then
			slot0:emit(TrainingCampMediator.ON_TRIGGER, {
				cmd = 2,
				activity_id = slot0.activity.id
			})
		end

		setText(slot0.phaseTF:Find("slider/label"), i18n("newplayer_notice_" .. slot1))
		_.each(slot4, function (slot0)
			if uv0:getFinishTaskById(slot0) ~= nil then
				uv1 = uv1 + 1
			end
		end)
		setText(slot0.phaseTF:Find("slider/Text"), slot10 .. "/" .. #slot4)
	else
		setText(slot0.phaseTF:Find("slider/label"), slot9:getConfig("desc"))
		setText(slot0.phaseTF:Find("slider/Text"), math.min(slot9.progress, slot9:getConfig("target_num")) .. "/" .. slot9:getConfig("target_num"))
	end

	slot0.phaseTF:Find("slider"):GetComponent(typeof(Slider)).value = slot9.progress / slot9:getConfig("target_num")
	slot0.phaseTF:Find("icon"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("ui/trainingcampui_atlas", "icon_" .. slot1)

	setText(slot0.phaseTF:Find("tip"), i18n("newplayer_notice_" .. 3 + slot1))
	onButton(slot0, slot0.phaseTF:Find("get"), function ()
		if uv0:isSelectable() then
			uv1:openMsgbox(function (slot0)
				uv0:emit(TrainingCampMediator.ON_SELECTABLE_GET, uv1, slot0)
			end)
		else
			uv1:emit(TrainingCampMediator.ON_GET, uv0)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.phaseTF:Find("go"), function ()
		uv0:emit(TrainingCampMediator.ON_GO, uv1)
	end, SFX_PANEL)
end

function slot0.getTask(slot0, slot1, slot2)
	slot3 = getProxy(TaskProxy)
	slot4 = nil

	if slot0.phaseId <= slot1 then
		if not slot3:getTaskById(slot2) then
			slot4 = slot3:getFinishTaskById(slot2)
		end
	else
		Task.New({
			id = slot2
		}).progress = Task.New():getConfig("target_num")
		Task.New().submitTime = 1
	end

	return slot4
end

function slot0.openMsgbox(slot0, slot1)
	setActive(slot0.awardMsg, true)
	setActive(slot0.frameTF, false)

	slot2 = nil

	for slot7 = 1, slot0.awardMsg:Find("photos").childCount, 1 do
		onToggle(slot0, slot3:GetChild(slot7 - 1), function (slot0)
			if slot0 then
				uv0 = uv1
			end
		end, SFX_PANEL)
	end

	onButton(slot0, slot0.awardMsg:Find("confirm_btn"), function ()
		if uv0 then
			if uv1 then
				uv1(uv0)
			end

			uv2:closeMsgBox()
		end
	end, SFX_PANEL)
end

function slot0.closeMsgBox(slot0)
	setActive(slot0.awardMsg, false)
	setActive(slot0.frameTF, true)
end

function slot0.willExit(slot0)
end

return slot0
