slot0 = class("DailyLevelScene", import("..base.BaseUI"))
slot1 = 3
slot2 = 4

slot0.getUIName = function (slot0)
	return "dailylevelui"
end

slot0.getBGM = function (slot0)
	return "level"
end

slot3 = 501

slot0.init = function (slot0)
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
		slot0:closeChallengeSettingView()
	end)

	slot0.fleetEditView = slot0:findTF("fleet_edit")
	slot0.resource = slot0:findTF("resource")

	slot0:initItems()
end

slot0.getWeek = function (slot0)
	return pg.TimeMgr.GetInstance():GetServerWeek()
end

slot0.setDailyCounts = function (slot0, slot1)
	slot0.dailyCounts = slot1
end

slot0.setShips = function (slot0, slot1)
	slot0.shipVOs = slot1
end

slot0.setChallengeInfo = function (slot0, slot1)
	slot0.challengeInfo = slot1
end

slot0.updateRes = function (slot0, slot1)
	slot0.resPanel:setResources(slot1)

	slot0.player = slot1
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0:findTF("help_btn"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_daily_task.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.descMode then
			slot0:enableDescMode(false)
		else
			slot0:emit(slot1.ON_BACK, nil, 0.1)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("rank_btn", slot0.challengeSetting), function ()
		slot0:emit(DailyLevelMediator.ON_CHALLENGE_OPEN_RANK)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("rank_btn", slot0.challengeBrief), function ()
		slot0:emit(DailyLevelMediator.ON_CHALLENGE_OPEN_RANK)
	end)
	slot0:displayDailyLevels()

	if slot0.contextData.dailyLevelId then
		slot0:tryOpenDesc(slot0.contextData.dailyLevelId)
	else
		slot0:enableDescMode(false)
	end
end

slot0.initItems = function (slot0)
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

slot0.displayDailyLevels = function (slot0)
	for slot4, slot5 in pairs(slot0.dailyLevelTFs) do
		slot0:initDailyLevel(slot4)
	end

	slot0.content:GetComponent(typeof(EnhancelScrollView)).onCenterClick = function (slot0)
		slot0:tryOpenDesc(tonumber(slot0.name))
	end

	slot0.centerAniItem = nil
	slot0.checkAniTimer = Timer.New(function ()
		for slot3, slot4 in pairs(slot0.dailyLevelTFs) do
			slot6 = slot4.localScale.x >= 0.98

			if slot0.centerAniItem == slot4 then
				return
			else
				slot0.centerAniItem = slot4

				if slot0:findTF("icon/card", slot4) then
					setActive(slot0:findTF("effect", slot7), slot6)

					if slot0:findTF("mask/char", slot7):GetComponent(typeof(Animator)) then
						slot8.speed = (slot6 and 1) or 0
					end
				end
			end
		end
	end, 0.2, -1)

	slot0.checkAniTimer:Start()
end

slot0.tryOpenDesc = function (slot0, slot1)
	slot2 = slot0.dailyLevelTFs[slot1]

	if table.contains(pg.expedition_daily_template[slot1].weekday, tonumber(slot0:getWeek())) then
		slot0:openDailyDesc(slot1)
	else
		pg.TipsMgr:GetInstance():ShowTips(slot3.tips)
	end
end

slot0.initDailyLevel = function (slot0, slot1)
	slot3 = slot0.dailyLevelTFs[slot1]

	if table.contains(pg.expedition_daily_template[slot1].weekday, tonumber(slot0:getWeek())) then
		slot0.index = slot1
	end

	setActive(findTF(slot3, "lock"), not slot4 and not table.isEmpty(slot2.weekday))
	setText(findTF(slot3, "name"), slot2.title)
	setActive(findTF(slot3, "time"), false)

	slot5 = findTF(slot3, "icon")

	PoolMgr.GetInstance():GetPrefab("dailyui/" .. slot2.pic, "", true, function (slot0)
		tf(slot0):SetParent(tf(slot0), false)

		tf(slot0).localPosition = Vector3.zero
		tf(slot0).name = "card"
	end)

	if slot0 == slot1 then
		slot6 = 0

		if slot0.challengeInfo then
			setText(findTF(slot3, "Text"), slot0.challengeInfo.maxScore or 0)
		end
	else
		setText(findTF(slot3, "Text"), "")
	end

	slot6 = findTF(slot3, "count")
	slot7 = slot0.dailyCounts[slot1] or 0

	if slot2.limit_time == 0 then
		setText(slot6, "N/A")
	else
		setText(slot6, string.format("%d/%d", slot2.limit_time - slot7, slot2.limit_time))
	end

	setActive(slot6, slot2.limit_time > 0)
end

slot0.openDailyDesc = function (slot0, slot1)
	slot0.curId = slot1

	slot0:enableDescMode(true)
	slot0:displayStageList(slot1)
end

slot0.displayStageList = function (slot0, slot1)
	slot0.dailyLevelId = slot1
	slot0.contextData.dailyLevelId = slot0.dailyLevelId
	slot2 = pg.expedition_daily_template[slot1]
	slot3 = slot0.dailyCounts[slot1] or 0

	if slot2.limit_time == 0 then
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

		if slot1 == slot0 then
			slot0:updateChallenge(slot12)
		else
			slot0:updateStage(slot12)
		end
	end
end

slot0.updateChallenge = function (slot0, slot1)
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
		if slot1.player.level < slot0.level then
			pg.TipsMgr:GetInstance():ShowTips(i18n("dailyLevel_unopened"))

			return
		end

		slot1:emit(DailyLevelMediator.ON_CHALLENGE, slot1.emit)
	end, SFX_PANEL)
end

slot0.openChallengeView = function (slot0)
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

slot0.openChallengeBriefingView = function (slot0)
	setActive(slot0.challengeStageView, true)
	setActive(slot0.challengeBrief, true)
	setActive(slot0.challengeSetting, false)
	setText(slot1, i18n("challenge_current_progress", slot0.challengeInfo.challengeLevel))
	setText(slot0:findTF("score/level", slot0.challengeBrief), slot0.challengeInfo.currentScore)
	onButton(slot0, slot0:findTF("reset_button", slot0.challengeBrief), function ()
		slot0:emit(DailyLevelMediator.ON_RESET_CHALLENGE)
	end)
	onButton(slot0, slot0:findTF("continue_button", slot0.challengeBrief), function ()
		slot0:emit(DailyLevelMediator.ON_CONTINUE_CHALLENGE)
	end)
end

slot0.openChallengeSettingView = function (slot0)
	setActive(slot0.challengeStageView, true)
	setActive(slot0.challengeBrief, false)
	setActive(slot0.challengeSetting, true)

	local function slot1(slot0, slot1, slot2, slot3, slot4)
		slot5 = slot0:GetComponent(typeof(Slider))
		slot6 = findTF(slot0, "Fill Area/Fill"):GetComponent(typeof(Image))
		slot7 = #slot3

		onSlider(slot0, slot0, function (slot0)
			slot0.fillAmount = (slot0 - 1) / (slot1 - 1)

			setText(slot1 - 1, "X " .. slot2[slot0].rate)
			setText("X " .. slot2[slot0].rate, slot2[slot0].content)
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
		slot4:emit(DailyLevelMediator.ON_CHALLENGE_EDIT_FLEET, {
			damageRateID = slot0[slot1:GetComponent(typeof(Slider)).value].id,
			levelRateID = slot1[typeof:GetComponent(typeof(Slider)).value].id
		})
	end)
	pg.UIMgr.GetInstance():BlurPanel(slot0.challengeStageView)
end

slot0.closeChallengeSettingView = function (slot0)
	setActive(slot0.challengeStageView, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.challengeStageView, slot0._tf)
end

slot0.openChallengeFleetEditView = function (slot0)
	slot0:closeChallengeSettingView()
	setActive(slot0.fleetEditView, true)

	slot1 = findTF(slot0.fleetEditView, "panel/fleet")

	slot0:flushFleetEditButton()
	onButton(slot0, findTF(slot0.fleetEditView, "panel/bg/btnBack"), function ()
		slot0:closeChallengeFleetEditView()
		slot0.closeChallengeFleetEditView:openChallengeView()

		slot0.closeChallengeFleetEditView.openChallengeView.contextData.challenge = nil
	end)
	pg.UIMgr.GetInstance():BlurPanel(slot0.fleetEditView)
end

slot0.closeChallengeFleetEditView = function (slot0)
	setActive(slot0.fleetEditView, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.fleetEditView, slot0._tf)
end

slot0.flushFleetEditButton = function (slot0)
	slot2 = findTF(slot0.fleetEditView, "panel/fleet")
	slot3 = slot0.challengeInfo.getShips(slot1)

	local function slot4(slot0, slot1, slot2)
		slot3 = {}

		removeAllChildren(slot4)

		for slot8, slot9 in ipairs(slot0) do
			slot3[slot1.shipVOs[slot9.id]] = true
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

				setActive(slot1:findTF("ship_type_icon", slot15), false)
			end

			onButton(slot1, slot12, function ()
				slot0:closeChallengeFleetEditView()

				slot0.closeChallengeFleetEditView.contextData.challenge = nil

				slot0.closeChallengeFleetEditView.contextData:emit(DailyLevelMediator.ON_CHALLENGE_OPEN_DOCK, {
					shipType = slot1,
					fleet = slot2,
					shipVO = slot3,
					teamType = slot3
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
		if slot0 and slot1 then
			slot2.contextData.challenge = nil

			slot2:emit(DailyLevelMediator.ON_REQUEST_CHALLENGE, {})
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end)
	onButton(slot0, slot5, function ()
		slot0:emit(DailyLevelMediator.ON_CHALLENGE_FLEET_CLEAR, {})
	end)
	onButton(slot0, slot0:findTF("recommendation", slot2), function ()
		slot0:emit(DailyLevelMediator.ON_CHALLENGE_FLEET_RECOMMEND, {})
	end)
end

slot0.updateStage = function (slot0, slot1)
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
		if slot0.limit_time <= (slot0.dailyCounts[slot0.dailyLevelId] or 0) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("dailyLevel_restCount_notEnough"))

			return
		end

		slot0:emit(DailyLevelMediator.ON_STAGE, slot0.emit)
	end, SFX_PANEL)
	onButton(slot0, slot4, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("dailyLevel_unopened"))
	end, SFX_PANEL)
end

slot0.enableDescMode = function (slot0, slot1)
	slot0.descMode = slot1

	setActive(slot0:findTF("help_btn"), not slot1)

	function slot2(slot0, slot1, slot2, slot3)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-22, warpins: 2 ---
		if LeanTween.isTweening(go(slot0)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-14, warpins: 1 ---
			LeanTween.cancel(go(slot0))
			--- END OF BLOCK #0 ---



		end

		slot4 = LeanTween.moveX
		slot5 = rtf(slot0)
		slot6 = slot1
		slot7 = slot3 or 0.3

		LeanTween.moveX(slot5, slot6, slot7):setEase(LeanTweenType.linear):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-5, warpins: 1 ---
				slot0()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-6, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end))

		return

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 23-23, warpins: 1 ---
		slot7 = 0.3
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 24-38, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	function slot3()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-73, warpins: 0 ---
		for slot3, slot4 in pairs(slot0.dailyLevelTFs) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-14, warpins: 1 ---
			setButtonEnabled(slot4, not slot1)

			if slot3 ~= slot0.curId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-22, warpins: 1 ---
				if LeanTween.isTweening(go(slot4)) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 23-28, warpins: 1 ---
					LeanTween.cancel(go(slot4))
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 29-37, warpins: 2 ---
				slot5 = GetComponent(slot4, typeof(CanvasGroup))

				if slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 38-54, warpins: 1 ---
					LeanTween.value(go(slot4), 1, 0, 0.3):setOnUpdate(System.Action_float(function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-3, warpins: 1 ---
						slot0.alpha = slot0

						return
						--- END OF BLOCK #0 ---



					end))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 55-70, warpins: 1 ---
					LeanTween.value(go(slot4), 0, 1, 0.3):setOnUpdate(System.Action_float(function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-3, warpins: 1 ---
						slot0.alpha = slot0

						return
						--- END OF BLOCK #0 ---



					end))
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 71-71, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 72-73, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 74-74, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-22, warpins: 1 ---
		setActive(slot0.listPanel, true)
		setActive(slot0.content, true)
		setActive(slot0.descPanel, )
		setActive(slot0.arrows, not slot1)

		return
		--- END OF BLOCK #0 ---



	end

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-23, warpins: 1 ---
		slot4()
		slot3()
		slot2(slot0.listPanel, -622, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0(slot1.descMain, 0)

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-35, warpins: 1 ---
		slot4()
		slot3()
		slot2(slot0.listPanel, 0)
		slot2(slot0.descMain, -1342)
		--- END OF BLOCK #0 ---



	end
end

slot0.clearTween = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		cancelTweens(slot0.tweens)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-11, warpins: 2 ---
	function slot1(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		if LeanTween.isTweening(go(slot0)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-14, warpins: 1 ---
			LeanTween.cancel(go(slot0))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-16, warpins: 0 ---
	for slot5, slot6 in pairs(slot0.dailyLevelTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		slot1(slot6)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 17-26, warpins: 1 ---
	slot1(slot0.listPanel)
	slot1(slot0.descMain)
	slot1(slot0.descChallengeNum)

	return
	--- END OF BLOCK #3 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot0:closeChallengeSettingView()
	slot0:closeChallengeFleetEditView()
	slot0:clearTween()

	if slot0.checkAniTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-18, warpins: 1 ---
		slot0.checkAniTimer:Stop()

		slot0.checkAniTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-21, warpins: 2 ---
	if slot0.resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-27, warpins: 1 ---
		slot0.resPanel:exit()

		slot0.resPanel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-28, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

return slot0
