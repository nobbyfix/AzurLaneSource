slot0 = class("DailyLevelScene", import("..base.BaseUI"))
slot1 = 3
slot2 = 4

function slot0.getUIName(slot0)
	return "dailylevelui"
end

function slot0.getBGM(slot0)
	return "level"
end

slot3 = 501

function slot0.init(slot0)
	slot0.topPanel = slot0:findTF("blur_panel/adapt/top")
	slot0.backBtn = slot0:findTF("back_button", slot0.topPanel)
	slot0.resPanel = PlayerResource.New()

	SetParent(slot0.resPanel._go, slot0:findTF("res", slot0.topPanel), false)

	slot0.listPanel = slot0:findTF("list_panel")
	slot0.content = slot0:findTF("list", slot0.listPanel)

	setActive(slot0.content, true)

	slot0.dailylevelTpl = slot0:getTpl("list_panel/list/captertpl")
	slot0.descPanel = slot0:findTF("desc_panel")
	slot0.descMain = slot0:findTF("main_mask/main", slot0.descPanel)
	slot0.descChallengeNum = slot0:findTF("challenge_count", slot0.descMain)
	slot0.descChallengeText = slot0:findTF("Text", slot0.descChallengeNum)
	slot0.stageTpl = slot0:getTpl("scrollview/content/stagetpl", slot0.descMain)
	slot0.stageContain = slot0:findTF("scrollview/content", slot0.descMain)
	slot0.arrows = slot0:findTF("arrows")
	slot0.itemTpl = slot0:getTpl("item_tpl")
	slot0.challengeStageView = slot0:findTF("stage_info")
	slot0.challengeSetting = slot0:findTF("panel/setting", slot0.challengeStageView)
	slot0.challengeBrief = slot0:findTF("panel/progress", slot0.challengeStageView)

	onButton(slot0, slot0:findTF("panel/btnBack", slot0.challengeStageView), function ()
		uv0:closeChallengeSettingView()
	end)

	slot0.fleetEditView = slot0:findTF("fleet_edit")
	slot0.resource = slot0:findTF("resource")

	slot0:initItems()
end

function slot0.getWeek(slot0)
	return pg.TimeMgr.GetInstance():GetServerWeek()
end

function slot0.setDailyCounts(slot0, slot1)
	slot0.dailyCounts = slot1
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.setChallengeInfo(slot0, slot1)
	slot0.challengeInfo = slot1
end

function slot0.updateRes(slot0, slot1)
	slot0.resPanel:setResources(slot1)

	slot0.player = slot1
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0:findTF("help_btn"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_daily_task.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if uv0.descMode then
			uv0:enableDescMode(false)
		else
			uv0:emit(uv1.ON_BACK, nil, 0.1)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("rank_btn", slot0.challengeSetting), function ()
		uv0:emit(DailyLevelMediator.ON_CHALLENGE_OPEN_RANK)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("rank_btn", slot0.challengeBrief), function ()
		uv0:emit(DailyLevelMediator.ON_CHALLENGE_OPEN_RANK)
	end)
	slot0:displayDailyLevels()

	if slot0.challengeInfo.battleScore > 0 and slot0.challengeInfo:isActive() then
		slot0:tryOpenDesc(uv1)
		slot0:openChallengeView()
	elseif slot0.contextData.challenge and not slot0.challengeInfo:isActive() then
		slot0:tryOpenDesc(uv1)
		slot0:openChallengeFleetEditView()
	elseif slot0.contextData.dailyLevelId then
		slot0:tryOpenDesc(slot0.contextData.dailyLevelId)
	else
		slot0:enableDescMode(false)
	end
end

function slot0.initItems(slot0)
	slot0.dailyLevelTFs = {}

	for slot6, slot7 in pairs(slot2) do
		if table.contains(pg.expedition_daily_template[slot7].weekday, tonumber(slot0:getWeek())) then
			table.remove(slot2, slot6)
			table.insert(slot2, math.ceil(#slot1.all / 2), slot7)

			break
		end
	end

	if slot0.contextData.dailyLevelId then
		table.removebyvalue(slot2, slot3)
		table.insert(slot2, math.ceil(#slot1.all / 2), slot0.contextData.dailyLevelId)
	end

	for slot6, slot7 in pairs(slot2) do
		slot0.dailyLevelTFs[slot7] = cloneTplTo(slot0.dailylevelTpl, slot0.content, slot7)
	end
end

function slot0.displayDailyLevels(slot0)
	for slot4, slot5 in pairs(slot0.dailyLevelTFs) do
		slot0:initDailyLevel(slot4)
	end

	slot0.content:GetComponent(typeof(EnhancelScrollView)).onCenterClick = function (slot0)
		uv0:tryOpenDesc(tonumber(slot0.name))
	end

	slot0.centerAniItem = nil
	slot0.checkAniTimer = Timer.New(function ()
		for slot3, slot4 in pairs(uv0.dailyLevelTFs) do
			slot6 = slot4.localScale.x >= 0.98

			if uv0.centerAniItem == slot4 then
				return
			else
				uv0.centerAniItem = slot4

				if uv0:findTF("icon/card", slot4) then
					setActive(uv0:findTF("effect", slot7), slot6)

					if uv0:findTF("mask/char", slot7):GetComponent(typeof(Animator)) then
						slot8.speed = slot6 and 1 or 0
					end
				end
			end
		end
	end, 0.2, -1)

	slot0.checkAniTimer:Start()
end

function slot0.tryOpenDesc(slot0, slot1)
	slot2 = slot0.dailyLevelTFs[slot1]

	if table.contains(pg.expedition_daily_template[slot1].weekday, tonumber(slot0:getWeek())) then
		slot0:openDailyDesc(slot1)
	else
		pg.TipsMgr:GetInstance():ShowTips(slot3.tips)
	end
end

function slot0.initDailyLevel(slot0, slot1)
	slot3 = slot0.dailyLevelTFs[slot1]

	if table.contains(pg.expedition_daily_template[slot1].weekday, tonumber(slot0:getWeek())) then
		slot0.index = slot1
	end

	setActive(findTF(slot3, "lock"), not slot4 and not table.isEmpty(slot2.weekday))
	setText(findTF(slot3, "name"), slot2.title)
	setActive(findTF(slot3, "time"), false)

	slot5 = findTF(slot3, "icon")

	PoolMgr.GetInstance():GetPrefab("dailyui/" .. slot2.pic, "", true, function (slot0)
		tf(slot0):SetParent(uv0, false)

		tf(slot0).localPosition = Vector3.zero
		tf(slot0).name = "card"
	end)

	if uv0 == slot1 then
		slot6 = 0

		if slot0.challengeInfo then
			slot6 = slot0.challengeInfo.maxScore or 0
		end

		setText(findTF(slot3, "Text"), slot6)
	else
		setText(findTF(slot3, "Text"), "")
	end

	slot6 = findTF(slot3, "count")
	slot7 = slot0.dailyCounts[slot1] or 0

	if slot2.limit_time == 0 then
		setText(findTF(slot3, "count"), "N/A")
	else
		setText(slot6, string.format("%d/%d", slot2.limit_time - slot7, slot2.limit_time))
	end

	setActive(slot6, slot2.limit_time > 0)
end

function slot0.openDailyDesc(slot0, slot1)
	slot0.curId = slot1

	slot0:enableDescMode(true)
	slot0:displayStageList(slot1)
end

function slot0.displayStageList(slot0, slot1)
	slot0.dailyLevelId = slot1
	slot0.contextData.dailyLevelId = slot0.dailyLevelId
	slot3 = slot0.dailyCounts[slot1] or 0

	if pg.expedition_daily_template[slot1].limit_time == 0 then
		setText(slot0.descChallengeText, i18n("challenge_count_unlimit"))
	else
		setText(slot0.descChallengeText, string.format("%d/%d", slot2.limit_time - slot3, slot2.limit_time))
	end

	removeAllChildren(slot0.stageContain)

	slot0.stageTFs = {}

	for slot8, slot9 in ipairs(slot4) do
		slot0.stageTFs[slot9[1]] = cloneTplTo(slot0.stageTpl, slot0.stageContain)
		slot12 = {
			id = slot9[1],
			level = slot9[2]
		}

		if slot1 == uv0 then
			slot0:updateChallenge()
		else
			slot0:updateStage(slot12)
		end
	end
end

function slot0.updateChallenge(slot0, slot1)
	slot2 = getProxy(ChallengeProxy):getChallenge(slot1.id)

	setText(findTF(slot3, "left_panel/name"), "挑战模式")
	setText(findTF(slot3, "left_panel/lv/Text"), "Lv." .. slot1.level)
	setActive(findTF(slot3, "left_panel/class"), false)
	setImageSprite(slot3, getImageSprite(findTF(slot0.resource, "challenge_bg")))
	setActive(findTF(slot3, "score"), true)
	setActive(slot0:findTF("mask", slot3), slot0.player.level < slot1.level)

	if slot0.player.level < slot1.level then
		setText(slot0:findTF("msg/msg_contain/Text", slot4), "Lv." .. slot1.level .. " ")
		setText(findTF(slot3, "score"), "- - -")
	else
		setText(findTF(slot3, "score"), comma_value(getProxy(ChallengeProxy):getCurrentChallengeInfo().maxScore))
	end

	onButton(slot0, slot3, function ()
		if uv1.player.level < uv0.level then
			pg.TipsMgr:GetInstance():ShowTips(i18n("dailyLevel_unopened"))

			return
		end

		uv1:emit(DailyLevelMediator.ON_CHALLENGE, uv0)
	end, SFX_PANEL)
end

function slot0.openChallengeView(slot0)
	if slot0.challengeInfo:isActive() then
		slot0:openChallengeBriefingView()
	else
		slot0:openChallengeSettingView()
	end

	onButton(slot0, slot0:findTF("panel/right/rule_btn", slot0.challengeStageView), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("challenge_rule")
		})
	end, SFX_PANEL)

	slot1 = slot0.challengeInfo:getCurrentChallengeTemplate()

	setImageSprite(slot0:findTF("panel/head/Image", slot0.challengeStageView), LoadSprite("qicon/" .. slot1.char_icon[1]))
	setText(slot2, slot1.chapter_name[1])
	setText(slot3, slot1.chapter_name[2])
	setText(slot4, slot1.chapter_name[3])
	setText(slot0:findTF("panel/intro", slot0.challengeStageView), slot1.chapter_description)
end

function slot0.openChallengeBriefingView(slot0)
	setActive(slot0.challengeStageView, true)
	setActive(slot0.challengeBrief, true)
	setActive(slot0.challengeSetting, false)
	setText(slot1, i18n("challenge_current_progress", slot0.challengeInfo.challengeLevel))
	setText(slot0:findTF("score/level", slot0.challengeBrief), slot0.challengeInfo.currentScore)
	onButton(slot0, slot0:findTF("reset_button", slot0.challengeBrief), function ()
		uv0:emit(DailyLevelMediator.ON_RESET_CHALLENGE)
	end)
	onButton(slot0, slot0:findTF("continue_button", slot0.challengeBrief), function ()
		uv0:emit(DailyLevelMediator.ON_CONTINUE_CHALLENGE)
	end)
end

function slot0.openChallengeSettingView(slot0)
	setActive(slot0.challengeStageView, true)
	setActive(slot0.challengeBrief, false)
	setActive(slot0.challengeSetting, true)

	local function slot1(slot0, slot1, slot2, slot3, slot4)
		slot5 = slot0:GetComponent(typeof(Slider))
		slot6 = findTF(slot0, "Fill Area/Fill"):GetComponent(typeof(Image))
		slot7 = #slot3

		onSlider(uv0, slot0, function (slot0)
			uv0.fillAmount = (slot0 - 1) / (uv1 - 1)

			setText(uv3, "X " .. uv2[slot0].rate)
			setText(uv4, uv2[slot0].content)
		end)

		slot8 = 1

		for slot12, slot13 in ipairs(slot3) do
			if slot13.rate == slot4 then
				slot8 = slot12
			end
		end

		setSlider(slot5, 1, slot7, slot8)
		slot5.onValueChanged:Invoke(slot8)
	end

	slot1(slot0:findTF("meters/damage_slider/Slider", slot0.challengeSetting), slot0:findTF("meters/damage_slider/rate", slot0.challengeSetting), slot0:findTF("meters/damage_slider/value", slot0.challengeSetting), ChallengeProxy.rateConfigData[ChallengeProxy.RATE_FACTOR_DAMAGE], slot0.challengeInfo:getDamageRate() or ChallengeProxy.rateConfigData[ChallengeProxy.RATE_FACTOR_DAMAGE][1])
	slot1(slot0:findTF("meters/level_slider/Slider", slot0.challengeSetting), slot0:findTF("meters/level_slider/rate", slot0.challengeSetting), slot0:findTF("meters/level_slider/value", slot0.challengeSetting), ChallengeProxy.rateConfigData[ChallengeProxy.RATE_FACTOR_LEVEL], slot0.challengeInfo:getLevelRate() or ChallengeProxy.rateConfigData[ChallengeProxy.RATE_FACTOR_LEVEL][1])
	onButton(slot0, slot0:findTF("start_button", slot0.challengeSetting), function ()
		uv4:emit(DailyLevelMediator.ON_CHALLENGE_EDIT_FLEET, {
			damageRateID = uv0[uv1:GetComponent(typeof(Slider)).value].id,
			levelRateID = uv2[uv3:GetComponent(typeof(Slider)).value].id
		})
	end)
	pg.UIMgr.GetInstance():BlurPanel(slot0.challengeStageView)
end

function slot0.closeChallengeSettingView(slot0)
	setActive(slot0.challengeStageView, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.challengeStageView, slot0._tf)
end

function slot0.openChallengeFleetEditView(slot0)
	slot0:closeChallengeSettingView()
	setActive(slot0.fleetEditView, true)

	slot1 = findTF(slot0.fleetEditView, "panel/fleet")

	slot0:flushFleetEditButton()
	onButton(slot0, findTF(slot0.fleetEditView, "panel/bg/btnBack"), function ()
		uv0:closeChallengeFleetEditView()
		uv0:openChallengeView()

		uv0.contextData.challenge = nil
	end)
	pg.UIMgr.GetInstance():BlurPanel(slot0.fleetEditView)
end

function slot0.closeChallengeFleetEditView(slot0)
	setActive(slot0.fleetEditView, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.fleetEditView, slot0._tf)
end

function slot0.flushFleetEditButton(slot0)
	slot2 = findTF(slot0.fleetEditView, "panel/fleet")
	slot3 = slot0.challengeInfo.getShips(slot1)

	local function slot4(slot0, slot1, slot2)
		slot3 = {}

		removeAllChildren(slot4)

		for slot8, slot9 in ipairs(uv0) do
			slot3[uv1.shipVOs[slot9.id]] = true
		end

		slot5 = findTF(slot0, "shiptpl")
		slot6 = findTF(slot0, "emptytpl")

		for slot10, slot11 in ipairs(slot2) do
			if slot11 == -1 then
				break
			end

			slot12, slot13 = nil
			slot14 = true

			if slot11 == 0 then
				for slot18, slot19 in pairs(slot3) do
					if slot19 and slot1 == slot18:getTeamType() then
						slot13 = slot18

						break
					end
				end
			end

			if slot13 then
				slot15 = cloneTplTo(slot5, slot4)

				setActive(slot15, true)
				updateShip(slot15, slot13)

				slot12 = findTF(slot15, "icon_bg")
				slot3[slot13] = false
				slot14 = false
			end

			if slot14 then
				slot15 = cloneTplTo(slot6, slot4)

				setActive(slot15, true)

				slot12 = findTF(slot15, "icon_bg")

				setActive(uv1:findTF("ship_type_icon", slot15), false)
			end

			onButton(uv1, slot12, function ()
				uv0:closeChallengeFleetEditView()

				uv0.contextData.challenge = nil

				uv0:emit(DailyLevelMediator.ON_CHALLENGE_OPEN_DOCK, {
					shipType = uv1,
					fleet = uv2,
					shipVO = uv3,
					teamType = uv4
				})
			end)
		end

		return true
	end

	slot9 = slot4(slot2, "main", slot7)
	slot10 = slot4(slot2, "vanguard", slot8)

	setText(findTF(slot0.fleetEditView, "panel/gear_score/text"), math.floor(slot0.challengeInfo.getFleetGS(slot1)))
	setText(findTF(slot0.fleetEditView, "panel/rateList/difficulty/text"), "x " .. slot0.challengeInfo.getDifficultyRate(slot1))

	slot11, slot12 = slot0.challengeInfo.getGSRateID(slot1)

	setActive(findTF(slot0.fleetEditView, "panel/rateList/gs"), false)
	onButton(slot0, findTF(slot0.fleetEditView, "panel/start_button"), function ()
		if uv0 and uv1 then
			uv2.contextData.challenge = nil

			uv2:emit(DailyLevelMediator.ON_REQUEST_CHALLENGE, {})
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end)
	onButton(slot0, slot5, function ()
		uv0:emit(DailyLevelMediator.ON_CHALLENGE_FLEET_CLEAR, {})
	end)
	onButton(slot0, slot0:findTF("recommendation", slot2), function ()
		uv0:emit(DailyLevelMediator.ON_CHALLENGE_FLEET_RECOMMEND, {})
	end)
end

function slot0.updateStage(slot0, slot1)
	setText(findTF(slot3, "left_panel/name"), pg.expedition_data_template[slot1.id].name)
	setText(findTF(slot3, "left_panel/lv/Text"), "Lv." .. slot1.level)
	setActive(slot0:findTF("mask", slot3), slot0.player.level < slot1.level)

	if slot0.player.level < slot1.level then
		setText(slot0:findTF("msg/msg_contain/Text", slot4), "Lv." .. slot1.level .. " ")
	end

	slot5 = slot0:findTF("scrollView/right_panel", slot3)

	for slot9, slot10 in ipairs(slot2.award_display) do
		updateDrop(cloneTplTo(slot0.itemTpl, slot5), {
			type = slot10[1],
			id = slot10[2],
			count = slot10[3]
		})
	end

	setImageSprite(slot3, getImageSprite(findTF(slot0.resource, "normal_bg")))
	setActive(findTF(slot3, "score"), false)
	onButton(slot0, slot3, function ()
		if pg.expedition_daily_template[uv0.dailyLevelId].limit_time <= (uv0.dailyCounts[uv0.dailyLevelId] or 0) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("dailyLevel_restCount_notEnough"))

			return
		end

		uv0:emit(DailyLevelMediator.ON_STAGE, uv1)
	end, SFX_PANEL)
	onButton(slot0, slot4, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("dailyLevel_unopened"))
	end, SFX_PANEL)
end

function slot0.enableDescMode(slot0, slot1)
	slot0.descMode = slot1

	setActive(slot0:findTF("help_btn"), not slot1)

	function slot2(slot0, slot1, slot2, slot3)
		if LeanTween.isTweening(go(slot0)) then
			LeanTween.cancel(go(slot0))
		end

		slot5 = rtf(slot0)
		slot6 = slot1
		slot7 = slot3 or 0.3

		LeanTween.moveX(slot5, slot1, slot7):setEase(LeanTweenType.linear):setOnComplete(System.Action(function ()
			if uv0 then
				uv0()
			end
		end))
	end

	function slot3()
		for slot3, slot4 in pairs(uv0.dailyLevelTFs) do
			setButtonEnabled(slot4, not uv1)

			if slot3 ~= uv0.curId then
				if LeanTween.isTweening(go(slot4)) then
					LeanTween.cancel(go(slot4))
				end

				slot5 = GetComponent(slot4, typeof(CanvasGroup))

				if uv1 then
					LeanTween.value(go(slot4), 1, 0, 0.3):setOnUpdate(System.Action_float(function (slot0)
						uv0.alpha = slot0
					end))
				else
					LeanTween.value(go(slot4), 0, 1, 0.3):setOnUpdate(System.Action_float(function (slot0)
						uv0.alpha = slot0
					end))
				end
			end
		end
	end

	function slot4()
		setActive(uv0.listPanel, true)
		setActive(uv0.content, true)
		setActive(uv0.descPanel, uv1)
		setActive(uv0.arrows, not uv1)
	end

	if slot1 then
		slot4()
		slot3()
		slot2(slot0.listPanel, -622, function ()
			uv0(uv1.descMain, 0)
		end)
	else
		slot4()
		slot3()
		slot2(slot0.listPanel, 0)
		slot2(slot0.descMain, -1342)
	end
end

function slot0.clearTween(slot0)
	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	function slot1(slot0)
		if LeanTween.isTweening(go(slot0)) then
			LeanTween.cancel(go(slot0))
		end
	end

	for slot5, slot6 in pairs(slot0.dailyLevelTFs) do
		slot1(slot6)
	end

	slot1(slot0.listPanel)
	slot1(slot0.descMain)
	slot1(slot0.descChallengeNum)
end

function slot0.willExit(slot0)
	slot0:closeChallengeSettingView()
	slot0:closeChallengeFleetEditView()
	slot0:clearTween()

	if slot0.checkAniTimer then
		slot0.checkAniTimer:Stop()

		slot0.checkAniTimer = nil
	end

	if slot0.resPanel then
		slot0.resPanel:exit()

		slot0.resPanel = nil
	end
end

return slot0
