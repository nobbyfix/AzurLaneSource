slot0 = class("LevelScene", import("..base.BaseUI"))
slot1 = 0.5

slot0.getUIName = function (slot0)
	return "LevelMainScene"
end

slot0.preload = function (slot0, slot1)
	slot0.maps = getProxy(ChapterProxy):getMaps()

	if slot0.maps[slot0:selectMap(slot2)]:getConfig("bg") and #slot5 > 0 then
		GetSpriteFromAtlasAsync("levelmap/" .. slot4:getConfig("bg"), "", slot1)
	elseif slot4:getConfig("animtor") == 1 then
		LoadAndInstantiateAsync("ui", slot4:getConfig("ani_name"), function (slot0)
			slot0:SetActive(false)

			slot0.tornadoTF = slot0
			slot0.aniName = slot0

			slot0()
		end)
	end
end

slot0.init = function (slot0)
	slot0:initData()
	slot0:initUI()
	slot0:initEvents()
	slot0:updateClouds()
end

slot0.initData = function (slot0)
	slot0.tweens = {}
	slot0.mapItemTimer = {}
	slot0.mapWidth = 1920
	slot0.mapHeight = 1440
	slot0.levelCamIndices = 1
	slot0.frozenCount = 0

	if not slot0.contextData.huntingRangeVisibility then
		slot0.contextData.huntingRangeVisibility = 2
	end
end

slot0.initUI = function (slot0)
	slot0.topPanel = slot0:findTF("top")
	slot0.canvasGroup = slot0.topPanel:GetComponent("CanvasGroup")
	slot0.canvasGroup.blocksRaycasts = not slot0.canvasGroup.blocksRaycasts
	slot0.canvasGroup.blocksRaycasts = not slot0.canvasGroup.blocksRaycasts
	slot0.topChapter = slot0:findTF("top_chapter", slot0.topPanel)
	slot0.topChapterLine = slot0:findTF("main/title_chapter_lines")
	slot0.chapterName = slot0:findTF("title_chapter/name", slot0.topChapter)
	slot0.chapterNoTitle = slot0:findTF("title_chapter/chapter", slot0.topChapter)
	slot0.resChapter = slot0:findTF("resources", slot0.topChapter)
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel:setParent(slot0.resChapter, false)
	setActive(slot0.topChapter, true)
	setActive(slot0.topChapterLine, true)

	slot0.leftChapter = slot0:findTF("main/left_chapter")
	slot0.leftCanvasGroup = slot0.leftChapter:GetComponent(typeof(CanvasGroup))
	slot0.btnPrev = slot0:findTF("btn_prev", slot0.leftChapter)
	slot0.btnPrevCol = slot0:findTF("btn_prev/prev_image", slot0.leftChapter)
	slot0.eliteBtn = slot0:findTF("buttons/btn_elite", slot0.leftChapter)
	slot0.normalBtn = slot0:findTF("buttons/btn_normal", slot0.leftChapter)
	slot0.actNormalBtn = slot0:findTF("buttons/btn_act_normal/bg", slot0.leftChapter)
	slot0.actEliteBtn = slot0:findTF("buttons/btn_act_elite/bg", slot0.leftChapter)
	slot0.actExtraBtn = slot0:findTF("buttons/btn_act_extra/bg", slot0.leftChapter)
	slot0.actExtraBtnAnim = slot0:findTF("usm", slot0.actExtraBtn)
	slot0.remasterBtn = slot0:findTF("buttons/btn_remaster", slot0.leftChapter)
	slot0.remasterTipTF = slot0:findTF("tip", slot0.remasterBtn)

	setActive(slot0.actNormalBtn.parent, false)
	setActive(slot0.actEliteBtn.parent, false)

	slot0.escortBar = slot0:findTF("escort_bar", slot0.leftChapter)
	slot0.eliteQuota = slot0:findTF("elite_quota", slot0.leftChapter)

	setActive(slot0.eliteQuota, false)
	setActive(slot0.leftChapter, true)

	slot0.rightChapter = slot0:findTF("main/right_chapter")
	slot0.rightCanvasGroup = slot0.rightChapter:GetComponent(typeof(CanvasGroup))
	slot0.eventContainer = slot0:findTF("event_btns/event_container", slot0.rightChapter)
	slot0.btnSpecial = slot0:findTF("btn_special", slot0.eventContainer)

	setActive(slot0.btnSpecial, true)

	slot0.challengeBtn = slot0:findTF("event_btns/event_container/ChallengeBtn", slot0.rightChapter)
	slot0.dailyBtn = slot0:findTF("daily_button", slot0.eventContainer)
	slot0.militaryExerciseBtn = slot0:findTF("btn_pvp", slot0.eventContainer)
	slot0.shamBtn = slot0:findTF("sham_button", slot0.eventContainer)
	slot0.mirrorBtn = slot0:findTF("btn_mirror", slot0.eventContainer)
	slot0.escortBtn = slot0:findTF("btn_escort", slot0.eventContainer)
	slot0.activityBtn = slot0:findTF("event_btns/activity_btn", slot0.rightChapter)
	slot0.ptTotal = slot0:findTF("event_btns/pt_text", slot0.rightChapter)
	slot0.ticketTxt = slot0:findTF("event_btns/tickets/Text", slot0.rightChapter)
	slot0.actExchangeShopBtn = slot0:findTF("event_btns/btn_exchange", slot0.rightChapter)
	slot0.signalBtn = slot0:findTF("btn_signal", slot0.rightChapter)

	setActive(slot0.signalBtn, false)

	slot0.btnNext = slot0:findTF("btn_next", slot0.rightChapter)
	slot0.btnNextCol = slot0:findTF("btn_next/next_image", slot0.rightChapter)
	slot0.countDown = slot0:findTF("event_btns/count_down", slot0.rightChapter)
	slot0.actExtraRank = slot0:findTF("event_btns/act_extra_rank", slot0.rightChapter)

	setActive(slot0.rightChapter, true)

	slot0.damageText = slot0:findTF("damage", slot0.topPanel)

	setActive(slot0.damageText, false)

	slot0.mapHelpBtn = slot0:findTF("help_button", slot0.topPanel)

	setActive(slot0.mapHelpBtn, false)

	slot0.avoidText = slot0:findTF("text_avoid", slot0.topPanel)
	slot0.commanderTinkle = slot0:findTF("neko_tinkle", slot0.topPanel)

	setActive(slot0.commanderTinkle, false)

	slot0.spResult = slot0:findTF("sp_result", slot0.topPanel)

	setActive(slot0.spResult, false)

	slot0.helpPage = slot0:findTF("help_page", slot0.topPanel)
	slot0.helpImage = slot0:findTF("icon", slot0.helpPage)
	slot0.helpBtn = slot0:findTF("help_button", slot0.bottomStage)

	setActive(slot0.helpPage, false)

	slot0.map = slot0:findTF("map")
	slot0.UIFXList = slot0:findTF("map/UI_FX_list")

	for slot5 = 0, slot0.UIFXList:GetComponentsInChildren(typeof(Renderer)).Length - 1, 1 do
		slot1[slot5].sortingOrder = -1
	end

	slot0.levelCam = GameObject.Find("LevelCamera").transform.GetComponent(slot2, typeof(Camera))
	slot0.uiMain = GameObject.Find("LevelCamera").transform.Find(slot2, "Canvas/UIMain")

	setActive(slot0.uiMain, false)

	GetOrAddComponent(slot0.uiMain, typeof(Image)).color = Color.New(0, 0, 0, 0.5)
	slot0.uiCam = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	slot0.levelGrid = slot0.uiMain:Find("LevelGrid")

	setActive(slot0.levelGrid, true)

	slot0.dragLayer = slot0.levelGrid:Find("DragLayer") or cloneTplTo(slot0.levelGrid, slot0.levelGrid, "DragLayer")
	slot0.dragLayer.localEulerAngles = Vector3.zero

	RemoveComponent(slot0.levelGrid, typeof(Image))

	slot0.float = slot0:findTF("float")
	slot0.clouds = slot0:findTF("clouds", slot0.float)
	slot0.chapters = slot0:findTF("levels", slot0.float)
	slot0.chapterTpl = slot0:findTF("level_tpl", slot0.float)
	slot0.escortChapters = slot0:findTF("escort_levels", slot0.float)
	slot0.escortChapterTpl = slot0:findTF("escort_level_tpl", slot0.float)

	setActive(slot0.clouds, true)
	setActive(slot0.chapterTpl, false)
	setActive(slot0.escortChapters, true)
	setActive(slot0.escortChapterTpl, false)

	slot0.resources = slot0:findTF("resources"):GetComponent("ItemList")
	slot0.arrowTarget = slot0.resources.prefabItem[0]
	slot0.bombEnemyTpl = slot0.resources.prefabItem[1]
	slot0.boxTpl = slot0.resources.prefabItem[2]
	slot0.championTpl = slot0.resources.prefabItem[3]
	slot0.deadTpl = slot0.resources.prefabItem[4]
	slot0.enemyTpl = slot0.resources.prefabItem[5]
	slot0.oniTpl = slot0.resources.prefabItem[6]
	slot0.rivalTpl = slot0.resources.prefabItem[7]
	slot0.shipTpl = slot0.resources.prefabItem[8]
	slot0.subTpl = slot0.resources.prefabItem[9]
	slot0.supplyTpl = slot0.resources.prefabItem[10]
	slot0.transportTpl = slot0.resources.prefabItem[11]
	slot0.transportTargetTpl = slot0.resources.prefabItem[12]

	setText(slot0:findTF("fighting/Text", slot0.enemyTpl), i18n("ui_word_levelui2_inevent"))
	setActive(slot0.arrowTarget, false)
	setActive(slot0.resources, false)
	setAnchoredPosition(slot0.topChapter, {
		y = 0
	})
	setAnchoredPosition(slot0.leftChapter, {
		x = 0
	})
	setAnchoredPosition(slot0.rightChapter, {
		x = 0
	})
end

slot0.initEvents = function (slot0)
	slot0:bind(LevelUIConst.OPEN_COMMANDER_PANEL, function (slot0, slot1, slot2, slot3)
		slot0:openCommanderPanel(slot1, slot2, slot3)
	end)
	slot0:bind(LevelUIConst.TRACK_CHAPTER, function (slot0, slot1, slot2)
		slot0:trackChapter(slot1, slot2)
	end)
	slot0:bind(LevelUIConst.HANDLE_SHOW_MSG_BOX, function (slot0, slot1)
		slot0:HandleShowMsgBox(slot1)
	end)
	slot0:bind(LevelUIConst.DO_AMBUSH_WARNING, function (slot0, slot1)
		slot0:doAmbushWarning(slot1)
	end)
	slot0:bind(LevelUIConst.DISPLAY_AMBUSH_INFO, function (slot0, slot1)
		slot0:displayAmbushInfo(slot1)
	end)
	slot0:bind(LevelUIConst.DISPLAY_STRATEGY_INFO, function (slot0, slot1)
		slot0:displayStrategyInfo(slot1)
	end)
	slot0:bind(LevelUIConst.FROZEN, function (slot0, slot1)
		slot0:frozen(slot1)
	end)
	slot0:bind(LevelUIConst.UN_FROZEN, function (slot0)
		slot0:unfrozen()
	end)
	slot0:bind(LevelUIConst.IS_FROZEN, function (slot0)
		slot0.levelStageView.isFrozen = slot0:isfrozen()
	end)
	slot0:bind(LevelUIConst.DESTROY_LEVEL_STAGE_VIEW, function (slot0)
		slot0.levelStageView:Destroy()
	end)
	slot0:bind(LevelUIConst.DO_TRACKING, function (slot0, slot1)
		slot0:doTracking(slot1)
	end)
	slot0:bind(LevelUIConst.SWITCH_TO_MAP, function ()
		slot0:switchToMap()
	end)
	slot0:bind(LevelUIConst.DISPLAY_REPAIR_WINDOW, function (slot0, slot1)
		slot0:displayRepairWindow(slot1)
	end)
end

slot0.updateBattleActivitys = function (slot0, slot1)
	slot0.battleActivitys = slot1
end

slot0.updateBattleActivity = function (slot0, slot1)
	slot2 = Map.New({
		id = slot1
	})
	slot0.battleActivity = slot0.battleActivitys[1]
	slot3 = slot2:getConfig("on_activity")

	if slot2:getConfig("on_activity") ~= 0 then
		for slot7, slot8 in ipairs(slot0.battleActivitys) do
			if slot8.id == slot3 then
				slot0.battleActivity = slot8

				break
			end
		end
	end
end

slot0.updatePtActivity = function (slot0, slot1)
	slot0.ptActivity = slot1

	slot0:updateActivityRes()
end

slot0.updateActivityRes = function (slot0)
	slot2 = findTF(slot0.ptTotal, "icon/Image")

	if findTF(slot0.ptTotal, "Text") and slot2 and slot0.ptActivity then
		setText(slot1, "x" .. slot0.ptActivity.data1)
		GetImageSpriteFromAtlasAsync(pg.item_data_statistics[id2ItemId(tonumber(slot0.ptActivity:getConfig("config_id")))].icon, "", slot2, true)
	end
end

slot0.updateBossBattleAct = function (slot0, slot1)
	slot0.bossBattleActivity = slot1

	if slot0.activityBossBattlePanel then
		slot0.activityBossBattlePanel:update(slot0.bossBattleActivity)
	end
end

slot0.setCommanderPrefabs = function (slot0, slot1)
	slot0.commanderPrefabs = slot1
end

slot0.didEnter = function (slot0)
	slot0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "CommandRoomMediator")

	onButton(slot0, slot0:findTF("back_button", slot0.topChapter), function ()
		if slot0.contextData.map and (slot0:isActivity() or slot0:isEscort()) then
			slot0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		else
			slot0:emit(slot1.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnSpecial, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(slot0, slot0.dailyBtn, function ()
		if slot0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		DailyLevelProxy:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(slot0, slot0.challengeBtn, function ()
		slot2, slot3 = pg.SystemOpenMgr:GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "ChallengeMainMediator")

		if slot2 == false then
			pg.TipsMgr:GetInstance():ShowTips(slot3)
		else
			slot0:emit(LevelMediator2.CLICK_CHALLENGE_BTN)
		end
	end, SFX_PANEL)

	if not getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) or slot2:isEnd() then
		setActive(slot0.challengeBtn, false)
	end

	onButton(slot0, slot0.militaryExerciseBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(slot0, slot0.shamBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator")

		if slot0 then
			slot0:emit(LevelMediator2.ON_OPEN_SHAM)
		else
			pg.TipsMgr:GetInstance():ShowTips(slot1)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.normalBtn:Find("bg"), function ()
		if slot0:isfrozen() then
			return
		end

		slot0:setMap(slot0.contextData.map:getBindMap())
	end, SFX_PANEL)
	onButton(slot0, slot0.eliteBtn:Find("bg"), function ()
		if slot0:isfrozen() then
			return
		end

		if slot0.contextData.map:getBindMap() == 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unusable"))

			if getProxy(ChapterProxy):getUseableMaxEliteMap() then
				slot0:setMap(slot1.configId)
				pg.TipsMgr:GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif slot0.contextData.map:isEliteEnabled() then
			slot0:setMap(slot0.contextData.map:getBindMap())
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(slot0, slot0.remasterBtn:Find("bg"), function ()
		if slot0:isfrozen() then
			return
		end

		slot0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		SetActive(slot0.remasterTipTF, false)
	end, SFX_PANEL)
	onButton(slot0, slot0.escortBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "Escort")

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		if not slot0.contextData.map:isEscort() then
			if #getProxy(ChapterProxy).escortMaps == 0 or _.any(slot4, function (slot0)
				return slot0:shouldFetch()
			end) then
				slot0:emit(LevelMediator2.ON_FETCH_ESCORT)
			else
				slot0:setMap(slot4[1].id)
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.signalBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:displaySignalPanel()
	end, SFX_PANEL)
	setActive(slot0:findTF("lock", slot0.btnSpecial), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "EventMediator"))
	setGray(slot0.btnSpecial, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "EventMediator"), true)
	setActive(slot0:findTF("lock", slot0.dailyBtn), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "DailyLevelMediator"))
	setGray(slot0.dailyBtn, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "DailyLevelMediator"), true)
	setActive(slot0:findTF("lock", slot0.militaryExerciseBtn), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "MilitaryExerciseMediator"))
	setGray(slot0.militaryExerciseBtn, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "MilitaryExerciseMediator"), true)

	if OPEN_ESCORT then
		setActive(slot0:findTF("lock", slot0.escortBtn), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "Escort"))
		setGray(slot0.escortBtn, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "Escort"), true)
		setActive(slot0.escortBtn, true)
	else
		setActive(slot0.escortBtn, false)
	end

	setActive(slot0.shamBtn, not ChapterConst.ActivateMirror and getProxy(ChapterProxy).getShamChapter(slot6):isOpen())

	if slot8 then
		setText(slot0:findTF("day", slot0.shamBtn), slot7:getRestDays())
	end

	setActive(slot0:findTF("lock", slot0.shamBtn), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator"))
	setGray(slot0.shamBtn, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "ShamPreCombatMediator"), true)
	slot0:emit(LevelMediator2.ON_EVENT_LIST_UPDATE)

	if slot0.contextData.editEliteChapter then
		slot0:displayFleetEdit(slot0.contextData.editEliteChapter)

		slot0.contextData.editEliteChapter = nil
	end

	for slot15, slot16 in ipairs(getProxy(ContextProxy).getContextByMediator(slot10, LevelMediator2).children) do
		slot16.onRemoved = function ()
			slot0:onSubLayerClose()
		end
	end

	if #slot11.children > 0 then
		slot0:onSubLayerOpen()
	else
		slot0:onSubLayerClose()
	end

	if not slot0.contextData.isSwitchToChapter then
		slot0:tryPlaySubGuide()
	end

	if slot0.contextData.selectedChapterVO then
		slot0:displayFleetSelect(slot0.contextData.selectedChapterVO)
	end

	if slot6:ifShowRemasterTip() then
		SetActive(slot0.remasterTipTF, true)
	else
		SetActive(slot0.remasterTipTF, false)
	end

	if slot0.contextData.open_remaster then
		slot0:displayRemasterPanel(slot0.contextData.open_remaster)

		slot0.contextData.open_remaster = nil
	end
end

slot0.tryPlaySubGuide = function (slot0)
	slot1 = false

	if slot0.subRefreshCount > 0 and slot0.player.level >= 20 then
		slot3 = getProxy(ChapterProxy).getChapterById(slot2, 304)

		if not pg.StoryMgr:GetInstance():IsPlayed("NG001") and slot3:isClear() then
			if slot2:getActiveChapter() then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})
			end

			if slot0.contextData.map:isActivity() then
				slot0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)
			end

			slot1 = true

			pg.StoryMgr:GetInstance():PlayGuide("NG001")
		end
	end

	if not slot1 and not pg.StoryMgr:GetInstance():IsPlayed("NG002") then
		slot3 = getProxy(FleetProxy):getFleetById(11)

		if getProxy(TaskProxy):getTaskById(10302) and slot2:isFinish() and not slot2:isReceive() and slot3:isEmpty() then
			if getProxy(ChapterProxy):getActiveChapter() then
				slot0:switchToMap()
			end

			pg.StoryMgr:GetInstance():PlayGuide("NG002", (_.any(getProxy(BayProxy):getShips(), function (slot0)
				return slot0 and slot0.configId == 308031
			end) and {
				2
			}) or {
				2,
				1
			})

			slot1 = true
		end
	end
end

slot0.onBackPressed = function (slot0)
	if slot0:isfrozen() or (slot0.levelAmbushView and slot0.levelAmbushView:CheckState(BaseSubView.STATES.INITED)) then
		return
	end

	playSoundEffect(SFX_CANCEL)

	if slot0.levelInfoView and slot0.levelInfoView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideChapterPanel()

		return
	end

	if slot0.levelFleetView and slot0.levelFleetView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideFleetEdit()

		return
	end

	if slot0.levelSignalView and slot0.levelSignalView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideSignalPanel()

		return
	end

	if slot0.levelStrategyView and slot0.levelStrategyView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideStrategyInfo()

		return
	end

	if slot0.levelRepairView and slot0.levelRepairView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideRepairWindow()

		return
	end

	if slot0.levelRemasterView and slot0.levelRemasterView:CheckState(BaseSubView.STATES.INITED) then
		slot0:hideRemasterPanel()

		return
	end

	if isActive(slot0.helpPage) then
		setActive(slot0.helpPage, false)

		return
	end

	if slot0.contextData.chapterVO and slot1:getDataType() ~= ChapterConst.TypeGuild then
		slot0:switchToMap()

		return
	end

	triggerButton(slot0:findTF("back_button", slot0.topChapter))
end

slot0.selectMap = function (slot0, slot1)
	if not slot0.contextData.mapIdx then
		if Map.lastMap and slot1[Map.lastMap] then
			slot2 = Map.lastMap
		else
			for slot6, slot7 in pairs(slot1) do
				if slot7:isUnlock() and slot7:getMapType() == Map.SCENARIO then
					slot2 = slot7.id
				end
			end
		end
	end

	return slot2
end

slot0.setMaps = function (slot0, slot1)
	slot0.maps = slot1

	slot0:initMapBtn(slot0.btnPrev, -1)
	slot0:initMapBtn(slot0.btnNext, 1)
	slot0:setMap(slot0:selectMap(slot1))
end

slot0.setShipGroups = function (slot0, slot1)
	slot0.shipGroups = slot1
end

slot0.setShips = function (slot0, slot1)
	slot0.shipVOs = slot1
end

slot0.updateRes = function (slot0, slot1)
	slot0.resPanel:setResources(slot1)

	if slot0.levelStageView and slot0.levelStageView:CheckState(BaseSubView.STATES.INITED) then
		slot0.levelStageView:SetPlayer(slot1)
	end

	slot0.player = slot1
end

slot0.setEliteQuota = function (slot0, slot1, slot2)
	slot3 = slot2 - slot1
	slot5 = slot0:findTF("bg/Text", slot0.eliteQuota):GetComponent(typeof(Text))

	if slot1 == slot2 then
		slot5.color = Color.red
	else
		slot5.color = Color.New(0.47, 0.89, 0.27)
	end

	slot5.text = slot3 .. "/" .. slot2
end

slot0.updateSubInfo = function (slot0, slot1, slot2)
	slot0.subRefreshCount = slot1
	slot0.subProgress = slot2

	setText(slot0.signalBtn:Find("nums"), slot0.subRefreshCount)
end

slot0.updateLastFleet = function (slot0, slot1)
	slot0.lastFleetIndex = slot1
end

slot0.updateEvent = function (slot0, slot1)
	setActive(slot0:findTF("tip", slot0.btnSpecial), slot1:hasFinishState())
end

slot0.updateFleet = function (slot0, slot1)
	slot0.fleets = slot1
end

slot0.updateChapterVO = function (slot0, slot1, slot2)
	if slot1:getDataType() == ChapterConst.TypeNone then
		slot0.maps[slot1:getConfig("map")].updateChapter(slot5, slot1)
		slot0.maps[slot1.getConfig("map")]:updateChapters(slot0.maps[slot1.getConfig("map") - 1])

		if not slot0.contextData.chapterVO then
			if slot0.contextData.mapIdx == slot4 then
				slot0:updateMapItems()
			end

			if slot0.levelSignalView and slot0.levelSignalView:CheckState(BaseSubView.STATES.INITED) then
				slot0.levelSignalView:ActionInvoke("flush")
			end
		end
	end

	if slot0.contextData.chapterVO and slot0.contextData.chapterVO:getDataType() == slot3 and slot0.contextData.chapterVO.id == slot1.id and slot1.active then
		slot0:setChapter(slot1)

		slot4 = false
		slot5 = false

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyFleet) > 0 then
			slot0.levelStageView:updateStageFleet()
			slot0.levelStageView:updateAmbushRate(slot1.fleet.line, true)

			slot5 = true

			if slot0.grid then
				slot0.grid:clearFleets()
				slot0.grid:initFleets()

				slot4 = true
			end
		end

		if (slot2 < 0 or bit.band(slot2, ChapterConst.DirtyChampion) > 0) and slot0.grid then
			slot0.grid:updateFleets()
			slot0.grid:clearChampions()
			slot0.grid:initChampions()

			slot4 = true
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAchieve) > 0 then
			slot0.levelStageView:updateStageAchieve()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAttachment) > 0 then
			slot0.levelStageView:updateAmbushRate(slot1.fleet.line, true)

			if slot3 == ChapterConst.TypeSham then
				slot0.levelStageView:updateShamProgress()
			end

			if slot0.grid then
				if slot2 >= 0 and bit.band(slot2, ChapterConst.DirtyFleet) <= 0 then
					slot0.grid:updateFleet(slot1.findex)
				end

				slot0.grid:updateAttachments()

				if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAutoAction) > 0 then
					slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
				else
					slot4 = true
				end
			end
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyStrategy) > 0 then
			slot0.levelStageView:updateStageStrategy()

			slot5 = true

			slot0.levelStageView:updateStageBarrier()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAutoAction) > 0 then
			slot0.levelStageView:tryAutoAction()
		elseif slot4 then
			slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		end

		if slot5 then
			slot0.levelStageView:updateFleetBuff()
		end
	end
end

slot0.updateClouds = function (slot0)
	slot0.cloudRTFs = {}
	slot0.cloudRects = {}
	slot0.cloudTimer = {}

	for slot4 = 1, 6, 1 do
		table.insert(slot0.cloudRTFs, slot6)
		table.insert(slot0.cloudRects, rtf(slot5).rect.width)
	end

	slot0:initCloudsPos()

	for slot4, slot5 in ipairs(slot0.cloudRTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-45, warpins: 1 ---
		slot6 = slot0.cloudRects[slot4]
		slot7 = slot0.initPositions[slot4] or Vector2(0, 0)
		slot10 = nil
		LeanTween.moveX(slot5, slot0.mapWidth, slot9):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-29, warpins: 1 ---
			slot0 = slot1.cloudRects[slot2]
			slot3.anchoredPosition = Vector2(-slot1.cloudRects[slot2], slot4.y)

			slot5:setFrom(-slot1.cloudRects[slot2]):setTime((slot1.mapWidth + slot1.cloudRects[slot2]) / slot6)

			return
			--- END OF BLOCK #0 ---



		end)).passed = math.random() * (slot0.mapWidth + slot6) / (30 - slot7.y / 20)
		slot0.cloudTimer[slot4] = LeanTween.moveX(slot5, slot0.mapWidth, slot9).setRepeat(-1).setOnCompleteOnRepeat(true).setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-29, warpins: 1 ---
			slot0 = slot1.cloudRects[slot2]
			slot3.anchoredPosition = Vector2(-slot1.cloudRects[slot2], slot4.y)

			slot5.setFrom(-slot1.cloudRects[slot2]).setTime((slot1.mapWidth + slot1.cloudRects[slot2]) / slot6)

			return
			--- END OF BLOCK #0 ---



		end)).uniqueId
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 46-49, warpins: 1 ---
		slot7 = Vector2(0, 0)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 50-88, warpins: 2 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 89-90, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end
end

slot0.updateCouldAnimator = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if slot0.contextData.map:getConfig("animtor") == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-17, warpins: 1 ---
		slot1 = slot0.contextData.map:getConfig("ani_name")

		if slot0.tornadoTF and slot0.aniName ~= slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-23, warpins: 1 ---
			slot0:destroyCloudAnimator()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-29, warpins: 3 ---
		function slot2()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-32, warpins: 1 ---
			slot0.tornadoTF.transform.localScale = Vector3(slot0.tornadoTF.transform.parent.rect.width / slot0.tornadoTF.transform.rect.width, slot0.tornadoTF.transform.parent.rect.height / slot0.tornadoTF.transform.rect.height, 1)

			return
			--- END OF BLOCK #0 ---



		end

		if IsNil(slot0.tornadoTF) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-32, warpins: 1 ---
			if slot0.animtorLoading then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-34, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 35-45, warpins: 2 ---
			slot0.animtorLoading = slot1

			PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if not slot0.contextData then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-5, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 6-16, warpins: 2 ---
				if slot0.animtorLoading ~= slot0.contextData.map:getConfig("ani_name") then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-20, warpins: 1 ---
					slot0.animtorLoading = nil

					return
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 21-34, warpins: 2 ---
				slot0.animtorLoading = nil
				slot3 = slot0
				slot2 = slot0.SetActive

				if slot0.contextData.map:getConfig("animtor") == 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 35-38, warpins: 1 ---
					slot4 = not slot0.isSubLayerOpen
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-40, warpins: 1 ---
					slot4 = false

					if false then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 41-41, warpins: 0 ---
						slot4 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 42-66, warpins: 3 ---
				slot2(slot3, slot4)

				slot0.tornadoTF = slot0

				setParent(slot0, slot0:findTF("map"))
				tf(slot0.tornadoTF):SetSiblingIndex(1)

				slot0.aniName = slot1

				slot0()

				return
				--- END OF BLOCK #3 ---



			end)
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-65, warpins: 1 ---
			setParent(slot0.tornadoTF, slot0:findTF("map"))
			tf(slot0.tornadoTF):SetSiblingIndex(1)
			setActive(slot0.tornadoTF, true)
			slot2()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 66-66, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 67-71, warpins: 1 ---
	if not IsNil(slot0.tornadoTF) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-75, warpins: 1 ---
		setActive(slot0.tornadoTF, false)
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 76-77, warpins: 3 ---
	--- END OF BLOCK #2 ---



end

slot0.updateActivityBtns = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot1 = slot0.contextData.map:isActivity()
	slot2 = slot0.contextData.map:isRemaster()
	slot3 = slot0.contextData.map:getConfig("type")

	if slot0.battleActivity then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-24, warpins: 1 ---
		slot4 = not slot0.battleActivity:isEnd()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 25-28, warpins: 2 ---
	slot5 = setActive
	slot6 = slot0.activityBtn

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-30, warpins: 1 ---
		slot7 = slot4
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-32, warpins: 1 ---
		slot7 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-33, warpins: 0 ---
			slot7 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 34-41, warpins: 3 ---
	slot5(slot6, slot7)

	if slot0.contextData.map:isEscort() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-45, warpins: 1 ---
		setActive(slot0.activityBtn, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 46-56, warpins: 2 ---
	slot7 = setActive
	slot8 = slot0.signalBtn

	if getProxy(ChapterProxy).getChapterById(slot5, 304) and slot6:isClear() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-65, warpins: 1 ---
		if slot3 ~= Map.SCENARIO and slot3 ~= Map.ELITE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 70-71, warpins: 1 ---
			slot9 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-72, warpins: 2 ---
			slot9 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 73-81, warpins: 4 ---
	slot7(slot8, slot9)

	slot7 = false
	slot9 = nil

	if ActivityLevelConst.hasExtraMap(slot0.maps) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 82-86, warpins: 1 ---
		slot10 = _.any

		if not slot0.battleActivitys then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 87-87, warpins: 1 ---
			slot11 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 88-90, warpins: 2 ---
		slot7 = slot10(slot11, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			if slot0.id == slot0:getConfig("on_activity") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-13, warpins: 1 ---
				slot1 = slot0:getConfig("type")
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-21, warpins: 2 ---
			if slot0.id ~= slot0:getConfig("on_activity") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-23, warpins: 1 ---
				slot1 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-24, warpins: 1 ---
				slot1 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 25-25, warpins: 2 ---
			return slot1
			--- END OF BLOCK #2 ---



		end)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 91-92, warpins: 2 ---
	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 93-96, warpins: 1 ---
		if slot3 ~= Map.ACT_EXTRA then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 97-98, warpins: 1 ---
			slot10 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 99-99, warpins: 1 ---
			slot10 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 100-126, warpins: 3 ---
	slot11 = slot0.contextData.map:existHardMap()
	slot13 = ActivityLevelConst.isClearMaps(slot12, Map.ACTIVITY_EASY)
	slot14 = ActivityLevelConst.isClearMaps(slot12, Map.ACTIVITY_HARD)
	slot15 = setActive
	slot16 = slot0.actExtraBtn.parent

	if slot7 and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 129-130, warpins: 1 ---
		if not slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 131-132, warpins: 1 ---
			slot17 = not slot2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 133-134, warpins: 1 ---
			slot17 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 135-135, warpins: 0 ---
				slot17 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 136-141, warpins: 5 ---
	slot15(slot16, slot17)

	slot15 = setActive
	slot16 = slot0.actEliteBtn.parent

	if slot11 and (slot3 ~= Map.ACTIVITY_EASY or (not slot4 and not slot2)) and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 152-152, warpins: 1 ---
		slot17 = slot10
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 153-160, warpins: 5 ---
	slot15(slot16, slot17)

	slot15 = setActive
	slot16 = slot0.actNormalBtn.parent

	if (slot3 ~= Map.ACTIVITY_HARD or (not slot4 and not slot2)) and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 167-167, warpins: 1 ---
		slot17 = slot10
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 168-172, warpins: 4 ---
	slot15(slot16, slot17)

	slot15 = setActive
	slot16 = slot0.actExtraRank

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 173-173, warpins: 1 ---
		slot17 = slot10
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 174-179, warpins: 2 ---
	slot15(slot16, slot17)

	slot15 = setActive
	slot16 = slot0.remasterBtn

	if OPEN_REMASTER then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 180-183, warpins: 1 ---
		if slot3 ~= Map.SCENARIO and slot3 ~= Map.ELITE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 188-189, warpins: 1 ---
			slot17 = slot2

			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 190-191, warpins: 0 ---
				slot17 = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 192-192, warpins: 2 ---
			slot17 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 193-200, warpins: 4 ---
	slot15(slot16, slot17)
	setActive(slot0.ticketTxt.parent, slot2)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 201-210, warpins: 1 ---
		setText(slot0.ticketTxt, slot5.remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 211-212, warpins: 2 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 213-219, warpins: 1 ---
		setActive(slot0.eliteQuota, false)
		slot0:updateActivityRes()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 220-225, warpins: 2 ---
	if ActivityConst.BATTLE_MAP_TYPE == Map.SINGLE_MAP then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 226-242, warpins: 1 ---
		setActive(slot0.ptTotal, false)
		setActive(slot0.actExchangeShopBtn, false)
		setActive(slot0.mirrorBtn, false)
		setActive(slot0.eventContainer, true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 243-248, warpins: 1 ---
		if ActivityConst.BATTLE_MAP_TYPE == Map.MUTIL_MAP then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 249-254, warpins: 1 ---
			slot15 = setActive
			slot16 = slot0.ptTotal

			if not ActivityConst.HIDE_PT_PANELS then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 255-257, warpins: 1 ---
				if slot0.ptActivity and not slot0.ptActivity:isEnd() and slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 266-267, warpins: 1 ---
					slot17 = not slot2
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 268-269, warpins: 2 ---
				slot17 = false

				if false then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 270-270, warpins: 0 ---
					slot17 = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 271-275, warpins: 5 ---
			slot15(slot16, slot17)

			slot15 = setActive
			slot16 = slot0.actExchangeShopBtn

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 276-279, warpins: 1 ---
				if not ActivityConst.HIDE_PT_PANELS then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 280-281, warpins: 1 ---
					if slot4 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 282-283, warpins: 1 ---
						slot17 = not slot2
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 284-285, warpins: 1 ---
					slot17 = false

					if false then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 286-286, warpins: 0 ---
						slot17 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 287-295, warpins: 5 ---
			slot15(slot16, slot17)
			setActive(slot0.mirrorBtn, false)
			setActive(slot0.eventContainer, not slot1)
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 296-297, warpins: 3 ---
	if not slot11 or not slot14 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 300-301, warpins: 2 ---
		if not slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 302-303, warpins: 1 ---
			slot15 = slot13
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 304-305, warpins: 1 ---
			slot15 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 306-306, warpins: 0 ---
				slot15 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 307-308, warpins: 4 ---
	if slot7 and slot1 and not slot10 and slot15 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 315-319, warpins: 1 ---
		setActive(slot0.actExtraBtnAnim, true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 320-323, warpins: 4 ---
		setActive(slot0.actExtraBtnAnim, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 324-331, warpins: 2 ---
	slot0:updateCountDown()
	slot0:registerActBtn()

	if slot1 and not slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 334-337, warpins: 1 ---
		Map.lastMapForActivity = slot0.contextData.mapIdx
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #17 338-339, warpins: 3 ---
	return
	--- END OF BLOCK #17 ---



end

slot0.updateBossBattleMsg = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.activityBossBattlePanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		slot0.activityBossBattlePanel:updateMsg(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-9, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateCountDown = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.newChapterCDTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-17, warpins: 2 ---
	slot1 = 0

	if slot0.contextData.map:isRemaster() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-28, warpins: 1 ---
		if slot0.contextData.map.remasterId == getProxy(ChapterProxy):getActiveRemaster() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-43, warpins: 1 ---
			slot1 = math.max(slot2.remasterTime - pg.TimeMgr.GetInstance():GetServerTime(), 0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 44-57, warpins: 2 ---
		setActive(slot0.countDown, true)

		slot3 = setText
		slot4 = slot0.countDown:Find("title")
		slot5 = i18n

		if slot1 > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-59, warpins: 1 ---
			slot6 = "levelScene_chapter_open_count_down"
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 60-60, warpins: 1 ---
			slot6 = "levelScene_chapter_not_open"
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 61-63, warpins: 2 ---
		slot3(slot4, slot5(slot6))
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-70, warpins: 1 ---
		if slot0.contextData.map:isActivity() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 71-89, warpins: 1 ---
			slot2 = getProxy(ActivityProxy)
			slot3 = pg.TimeMgr.GetInstance()

			_.each(pg.chapter_template.all, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-12, warpins: 1 ---
				if (pg.expedition_data_by_map[pg.chapter_template[slot0].map].type == Map.ACTIVITY_HARD or slot2.type == Map.ACTIVITY_HARD) and pg.activity_template[slot1.act_id] and slot3.time and #slot3.time == 3 and slot0:parseTimeFromConfig(slot3.time[2]) - slot0:GetServerTime() > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 45-47, warpins: 1 ---
					if slot1 == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 48-49, warpins: 1 ---
						slot1 = slot4
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 50-55, warpins: 1 ---
						slot1 = math.min(slot1, slot4)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 56-56, warpins: 7 ---
				return
				--- END OF BLOCK #1 ---



			end)

			slot4 = setActive
			slot5 = slot0.countDown

			if slot1 <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 90-91, warpins: 1 ---
				slot6 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 92-92, warpins: 1 ---
				slot6 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 93-104, warpins: 2 ---
			slot4(slot5, slot6)
			setText(slot0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 105-108, warpins: 1 ---
			setActive(slot0.countDown, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 109-111, warpins: 3 ---
	if slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 112-138, warpins: 1 ---
		setText(slot0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(slot1))

		slot0.newChapterCDTimer = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if slot0 - 1 <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-16, warpins: 1 ---
				slot1:updateCountDown()

				if not slot1.contextData.chapterVO then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-35, warpins: 1 ---
					slot1 = getProxy(ChapterProxy).getMaps(slot0)

					slot1:setMaps(slot1)
					slot1:setMap(slot1.contextData.mapIdx)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-51, warpins: 1 ---
				setText(slot1.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(setText))
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 52-52, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end, 1, -1)

		slot0.newChapterCDTimer:Start()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 139-146, warpins: 1 ---
		setText(slot0.countDown:Find("time"), "")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 147-148, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.updateEscortInfo = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	setActive(slot0.escortBar, slot0.contextData.map.isEscort(slot1))
	setActive(slot0.mapHelpBtn, slot0.contextData.map:isEscort())

	if slot0.contextData.map:isEscort() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-43, warpins: 1 ---
		slot2 = getProxy(ChapterProxy)

		setText(slot0.escortBar:Find("times/text"), slot2:getMaxEscortChallengeTimes() - slot2.escortChallengeTimes .. "/" .. slot3)
		onButton(slot0, slot0.mapHelpBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-12, warpins: 1 ---
			slot0:HandleShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("levelScene_escort_help_tip")
			})

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 44-45, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.registerActBtn = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.isRegisterBtn then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-52, warpins: 1 ---
	slot0.isRegisterBtn = true

	onButton(slot0, slot0.actExtraRank, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-14, warpins: 2 ---
		slot0:emit(LevelMediator2.ON_EXTRA_RANK)

		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.actExtraBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-14, warpins: 2 ---
		slot0:emit(LevelMediator2.ON_ENTER_EXTRA_CHAPTER)

		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.activityBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-14, warpins: 2 ---
		slot0:emit(LevelMediator2.ON_ACTIVITY_MAP)

		return
		--- END OF BLOCK #1 ---



	end, SFX_UI_CLICK)
	onButton(slot0, slot0.actExchangeShopBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-14, warpins: 2 ---
		slot0:emit(LevelMediator2.GO_ACT_SHOP)

		return
		--- END OF BLOCK #1 ---



	end, SFX_UI_CLICK)
	onButton(slot0, slot0.mirrorBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-21, warpins: 2 ---
		slot0, slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator")

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-28, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_OPEN_SHAM)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-37, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 38-38, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end, SFX_UI_CLICK)

	function slot1()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-19, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.maps) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-11, warpins: 1 ---
			if slot5:getActiveChapter() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-17, warpins: 1 ---
				slot0 = slot6:getConfig("name")

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-18, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 18-19, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 20-21, warpins: 2 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-38, warpins: 1 ---
			slot0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("activity_level_inwarime_tip", string.split(slot0, "|")[1])
			})

			return true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 39-40, warpins: 2 ---
		return false
		--- END OF BLOCK #3 ---



	end

	function slot2(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		if ActivityLevelConst.getMapsByType(slot0.maps, slot0, slot1)[1] and slot0.maps[slot3.id - 1] and not slot4:isClearForActivity() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-24, warpins: 1 ---
			return false
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 4 ---
		return true
		--- END OF BLOCK #1 ---



	end

	onButton(slot0, slot0.actEliteBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-15, warpins: 2 ---
		if slot0.contextData.map:isRemaster() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-24, warpins: 1 ---
			if slot0.maps[slot0:getBindMap() - 1] and not slot2:isClearForActivity() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-41, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock"))

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 42-49, warpins: 3 ---
			slot0:setMap(slot0:getBindMap())

			return
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 50-53, warpins: 2 ---
		if slot1() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 54-54, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 55-63, warpins: 2 ---
		if not slot2(Map.ACTIVITY_HARD, slot0.battleActivity.id) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 64-75, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 76-87, warpins: 2 ---
		slot0:emit(LevelMediator2.ON_SWITCH_ACT_MAP, slot0.battleActivity.id, Map.ACTIVITY_HARD)

		return
		--- END OF BLOCK #4 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.actNormalBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-15, warpins: 2 ---
		if slot0.contextData.map:isRemaster() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-23, warpins: 1 ---
			slot0:setMap(slot0:getBindMap())

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 24-27, warpins: 2 ---
		if slot1() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-28, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 29-37, warpins: 2 ---
		if not slot2(Map.ACTIVITY_EASY, slot0.battleActivity.id) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-49, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 50-61, warpins: 2 ---
		slot0:emit(LevelMediator2.ON_SWITCH_ACT_MAP, slot0.battleActivity.id, Map.ACTIVITY_EASY)

		return
		--- END OF BLOCK #4 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 53-53, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

slot0.destroyCloudAnimator = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not IsNil(slot0.tornadoTF) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-20, warpins: 1 ---
		slot0.tornadoTF.transform.localScale = Vector3.one

		PoolMgr.GetInstance():ReturnUI(slot0.aniName, slot0.tornadoTF)

		slot0.tornadoTF = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-21, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.initCloudsPos = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0.initPositions = {}

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot2 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-13, warpins: 2 ---
	slot3 = pg.expedition_data_by_map[slot2].clouds_pos

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-33, warpins: 0 ---
	for slot7, slot8 in ipairs(slot0.cloudRTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-16, warpins: 1 ---
		if slot3[slot7] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-27, warpins: 1 ---
			slot8.anchoredPosition = Vector2(slot9[1], slot9[2])

			table.insert(slot0.initPositions, slot8.anchoredPosition)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-31, warpins: 1 ---
			setActive(slot8, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-33, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-34, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.initMapBtn = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	onButton(slot0, slot1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-17, warpins: 2 ---
		if slot0.maps[slot0.contextData.mapIdx + slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-24, warpins: 1 ---
			if slot1:getMapType() == Map.ELITE and not slot1:isEliteEnabled() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-47, warpins: 1 ---
				slot0 = slot0.maps[slot1:getBindMap()].id

				pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unusable"))
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 48-51, warpins: 3 ---
			if slot2 == Map.ACTIVITY_EASY or slot2 == Map.ACTIVITY_HARD then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-61, warpins: 2 ---
				if slot0.maps[slot0 - 1] and not slot3:isClearForActivity() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 67-79, warpins: 1 ---
					pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_map_lock"))

					return
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 80-84, warpins: 2 ---
					if not slot1:isUnlock() then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 85-96, warpins: 1 ---
						pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock_1"))

						return
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 97-101, warpins: 4 ---
			if not slot1:isUnlock() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 102-110, warpins: 1 ---
				slot3 = i18n("levelScene_map_lock")

				if slot0.maps[slot0 - 1] and slot4:isClear() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 116-123, warpins: 1 ---
					slot3 = i18n("levelScene_chapter_unlock_tip", slot1:getConfig("level_limit"))
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 124-133, warpins: 3 ---
				pg.TipsMgr:GetInstance():ShowTips(slot3)

				return
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 134-138, warpins: 2 ---
			slot0:setMap(slot0)
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 139-139, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

slot0.setMap = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.contextData.mapIdx = slot1
	slot0.contextData.map = slot0.maps[slot1]

	if slot0.contextData.map:getMapType() == Map.ACT_EXTRA then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-25, warpins: 1 ---
		PlayerPrefs.SetInt("ex_mapId", slot0.contextData.map.id)
		PlayerPrefs.Save()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-36, warpins: 2 ---
	slot0:updateBattleActivity(slot1)
	slot0:updateMap()
	slot0:tryPlayMapStory()

	return
	--- END OF BLOCK #1 ---



end

slot0.updateMap = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	playBGM(slot0.contextData.map.getConfig(slot1, "bgm"))

	if slot0.contextData.map:getConfig("bg") and #slot2 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-32, warpins: 1 ---
		GetSpriteFromAtlasAsync("levelmap/" .. slot2, "", function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			if not IsNil(slot0.map) and slot1 == slot0.contextData.map then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-30, warpins: 1 ---
				setImageSprite(slot0.map, slot0, true)

				slot0.float.sizeDelta = slot0.map.sizeDelta
				slot0.float.localPosition = slot0.map.localPosition
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 31-31, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)

		GetComponent(slot0.map, "Image").enabled = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-39, warpins: 2 ---
		setImageSprite(slot0.map, nil)
		slot0:updateCouldAnimator()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 40-66, warpins: 2 ---
	setActive(slot0.btnPrev, slot3)
	setActive(slot0.btnNext, slot4)

	slot5 = Color.New(0.5, 0.5, 0.5, 1)
	slot6 = setImageColor
	slot7 = slot0.btnPrevCol

	if not slot0.maps[slot1.id - 1] or not slot3:isUnlock() or not Color.white then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 76-76, warpins: 3 ---
		slot8 = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 77-81, warpins: 2 ---
	slot6(slot7, slot8)

	slot6 = setImageColor
	slot7 = slot0.btnNextCol

	if not slot4 or not slot4:isUnlock() or not Color.white then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-91, warpins: 3 ---
		slot8 = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 92-109, warpins: 2 ---
	slot6(slot7, slot8)
	setText(slot0.chapterName, string.split(slot1:getConfig("name"), "||")[1])

	if slot1:isEscort() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 110-114, warpins: 1 ---
		clearImageSprite(slot0.chapterNoTitle, nil)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 115-127, warpins: 1 ---
		setImageSprite(slot0.chapterNoTitle, GetSpriteFromAtlas("chapterno", "chapter" .. slot1:getMapTitleNumber()), true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 128-155, warpins: 2 ---
	setActive(slot0.topChapter:Find("type_chapter"), not slot1:isEscort())
	setActive(slot0.topChapter:Find("type_escort"), slot1:isEscort())
	slot0:updateEscortInfo()

	if not slot0.contextData.chapterVO or not slot7.active then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 159-170, warpins: 2 ---
		slot0:updateMapItems()
		slot0:switchDifficulty()
		slot0:updateActivityBtns()
		slot0:updateCouldAnimator()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 171-174, warpins: 2 ---
	if slot0.contextData.openChapterId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 175-180, warpins: 1 ---
		if slot0.chapterTFsById[slot0.contextData.openChapterId] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 181-194, warpins: 1 ---
			slot10 = slot8:Find("sub")
			slot11 = triggerButton

			if not isActive(slot8:Find("main")) or not slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 197-197, warpins: 2 ---
				slot12 = slot10
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 198-198, warpins: 2 ---
			slot11(slot12)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 199-201, warpins: 2 ---
		slot0.contextData.openChapterId = nil
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 202-203, warpins: 2 ---
	return
	--- END OF BLOCK #6 ---



end

slot0.updateMapItems = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-17, warpins: 0 ---
	for slot4 = 1, slot0.UIFXList.childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-12, warpins: 2 ---
		if slot0.UIFXList:GetChild(slot4 - 1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-16, warpins: 1 ---
			setActive(slot5, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-17, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-25, warpins: 1 ---
	if slot0.contextData.map:getConfig("cloud_suffix") == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-30, warpins: 1 ---
		setActive(slot0.clouds, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-41, warpins: 1 ---
		setActive(slot0.clouds, true)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 42-64, warpins: 0 ---
		for slot6, slot7 in ipairs(slot1:getConfig("clouds_pos")) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-62, warpins: 1 ---
			slot0.cloudRTFs[slot6].GetComponent(slot8, typeof(Image)).enabled = false

			GetSpriteFromAtlasAsync("clouds/cloud_" .. slot6 .. "_" .. slot2, "", function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if not slot0.exited and not IsNil(IsNil) and slot2 == slot0.contextData.map then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 16-31, warpins: 1 ---
					slot1.enabled = true
					slot1.sprite = slot0

					slot1:SetNativeSize()

					slot0.cloudRects[slot3] = slot4.rect.width
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 32-32, warpins: 4 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 63-64, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 65-77, warpins: 2 ---
	setActive(slot0.chapters, false)
	setActive(slot0.escortChapters, false)

	if slot1:isEscort() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 78-104, warpins: 1 ---
		setActive(slot0.escortChapters, true)

		slot6 = UIItemList.New(slot0.escortChapters, slot0.escortChapterTpl)

		slot6:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-14, warpins: 1 ---
				slot1:updateEscortItem(slot2, slot0[slot1 + 1].escortId, slot0[slot1 + 1].chapter)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot6:align(#_.detect(getProxy(ChapterProxy).escortMaps, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			if slot0.id ~= slot0.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-7, warpins: 1 ---
				slot1 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-8, warpins: 1 ---
				slot1 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 9-9, warpins: 2 ---
			return slot1
			--- END OF BLOCK #1 ---



		end).chapters)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 105-133, warpins: 1 ---
	setActive(slot0.chapters, true)

	slot0.chapterTFsById = {}

	_.each(Chapter.bindConfigTable().all, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0:getChapter(slot0) and slot1:getConfig("map") == slot0.id and slot1:isValid() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-25, warpins: 1 ---
			table.insert(slot1, slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-26, warpins: 4 ---
		return
		--- END OF BLOCK #1 ---



	end)

	slot5 = UIItemList.New(slot0.chapters, slot0.chapterTpl)

	slot5:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-22, warpins: 1 ---
			slot1:updateMapItem(slot2, slot0[slot1 + 1])

			slot2.name = "Chapter_" .. slot0[slot1 + 1].id
			slot1.chapterTFsById[slot0[slot1 + 1].id] = slot2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-26, warpins: 1 ---
			if slot0 == UIItemList.EventExcess and slot1.mapItemTimer[slot2] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 32-41, warpins: 1 ---
				slot1.mapItemTimer[slot2]:Stop()

				slot1.mapItemTimer[slot2] = nil
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 42-42, warpins: 4 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot5:align(#{})
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 134-135, warpins: 2 ---
	--- END OF BLOCK #5 ---



end

slot0.updateEscortItem = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-36, warpins: 1 ---
	slot1.name = "chapter_" .. slot3.id
	slot1.anchoredPosition = Vector2(slot0.escortChapters.rect.width * tonumber(pg.escort_template[slot2].pos_x), slot0.escortChapters.rect.height * tonumber(pg.escort_template[slot2].pos_y))
	slot7 = slot1:Find("fighting")

	if getProxy(ChapterProxy).getActiveChapter(slot5) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-40, warpins: 1 ---
		if slot6.id ~= slot3.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-42, warpins: 1 ---
			slot8 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-43, warpins: 1 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 44-55, warpins: 3 ---
	setActive(slot7, slot8)
	slot0:DeleteTween("fighting" .. slot3.id)

	if slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-80, warpins: 1 ---
		setImageAlpha(slot7, 1)
		slot0:RecordTween("fighting" .. slot3.id, LeanTween.alpha(slot7, 0, 0.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 81-113, warpins: 2 ---
	GetImageSpriteFromAtlasAsync("levelmap/mapquad/" .. slot4.pic, "", slot1, true)

	slot9 = slot1:Find("anim")
	slot11 = {
		Color.green,
		Color.yellow,
		Color.red
	}

	if not table.indexof(pg.gameset.gardroad_count.description[1], slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 114-114, warpins: 1 ---
		slot12 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 115-126, warpins: 2 ---
	slot12 = slot11[slot12]

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 127-129, warpins: 0 ---
	for slot17 = 0, slot9:GetComponentsInChildren(typeof(Image)).Length - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 127-129, warpins: 2 ---
		slot13[slot17].color = slot12
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 130-141, warpins: 1 ---
	setImageColor(slot1, slot12)
	onButton(slot0, slot1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-9, warpins: 1 ---
			if slot0.id == slot1.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-15, warpins: 1 ---
				slot2:switchToChapter(slot2.switchToChapter)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-33, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_strategying", slot0:getConfig("chapter_name")))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-45, warpins: 1 ---
			slot2:displayChapterPanel(slot2.displayChapterPanel, Vector3(slot3.transform.localPosition.x, slot3.transform.localPosition.y))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 46-46, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #5 ---



end

slot0.updateChapterTF = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = slot0.contextData.map:getChapter(slot1)

	if slot0.chapterTFsById[slot1] and slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-17, warpins: 1 ---
		slot0:updateMapItem(slot2, slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-18, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateMapItem = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	setAnchoredPosition(slot1, {
		x = slot0.mapWidth * slot2:getConfigTable().pos_x,
		y = slot0.mapHeight * slot2.getConfigTable().pos_y
	})

	if slot0.mapItemTimer[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-27, warpins: 1 ---
		slot0.mapItemTimer[slot1]:Stop()

		slot0.mapItemTimer[slot1] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-42, warpins: 2 ---
	slot5 = findTF(slot1, "main")
	slot6 = findTF(slot1, "sub")

	if slot2:getPlayType() == ChapterConst.TypeMainSub then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-133, warpins: 1 ---
		setActive(slot5, false)
		setActive(slot6, true)

		slot7 = findTF(slot6, "mask/count_down")

		local function slot8()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-20, warpins: 1 ---
				if math.max(slot1.expireTime - pg.TimeMgr.GetInstance():GetServerTime(), 0) > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-28, warpins: 1 ---
					setText(slot0, slot0:DescCDTime(slot1))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 29-32, warpins: 1 ---
					if not slot1.active then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 33-43, warpins: 1 ---
						slot1:clearSubChapter()
						getProxy(ChapterProxy):updateChapter(slot1)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 44-44, warpins: 4 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot0.mapItemTimer[slot1] = Timer.New(slot8, 1, -1)

		slot0.mapItemTimer[slot1]:Start()
		slot8()

		slot9 = findTF(slot6, "fighting")
		slot10 = GetOrAddComponent(slot9, "CanvasGroup")

		setText(findTF(slot9, "Text"), i18n("tag_level_fighting"))

		slot12 = GetOrAddComponent(slot9, "CanvasGroup")

		setText(findTF(slot11, "Text"), i18n("tag_level_oni"))
		setActive(slot9, false)
		setActive(slot11, false)
		slot0:DeleteTween("fighting" .. slot2.id)

		slot6:GetComponent("Animator").enabled = true

		slot6:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0.enabled = false

			if slot0.active then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-13, warpins: 1 ---
				if slot1:existOni() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 14-17, warpins: 1 ---
					slot2 = slot3
					slot4 = slot5
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-51, warpins: 2 ---
				setActive(slot2, true)

				slot4.alpha = 1

				slot6:RecordTween("fighting" .. slot1.id, LeanTween.alphaCanvas(LeanTween.alphaCanvas, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 52-52, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 134-220, warpins: 1 ---
		setActive(slot5, true)
		setActive(slot6, false)

		slot7 = findTF(slot5, "circle/clear_flag")
		slot9 = GetOrAddComponent(slot8, "CanvasGroup")

		setText(findTF(slot8, "Text"), i18n("tag_level_fighting"))

		slot11 = GetOrAddComponent(slot10, "CanvasGroup")

		setText(findTF(slot10, "Text"), i18n("tag_level_oni"))

		slot12 = findTF(slot5, "circle/progress")
		slot13 = findTF(slot5, "circle/progress_text")
		slot14 = findTF(slot5, "circle/stars")

		setText(findTF(slot5, "info/bk/title_form/title_index"), slot4.chapter_name .. "  ")
		setText(findTF(slot5, "info/bk/title_form/title"), string.split(slot4.name, "|")[1])

		slot16 = setText
		slot17 = findTF(slot5, "info/bk/title_form/title_en")

		if not string.split(slot4.name, "|")[2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 221-221, warpins: 1 ---
			slot18 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 222-246, warpins: 2 ---
		slot16(slot17, slot18)
		setFillAmount(slot12, slot2.progress / 100)
		setText(slot13, string.format("%d%%", slot2.progress))
		setActive(slot14, slot2:existAchieve())

		if slot2:existAchieve() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 247-250, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 251-267, warpins: 0 ---
			for slot19, slot20 in ipairs(slot2.achieves) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 251-265, warpins: 1 ---
				setActive(slot14:Find("star" .. slot19 .. "/light"), ChapterConst.IsAchieved(slot20))
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 266-267, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 268-294, warpins: 2 ---
		slot0:DeleteTween("fighting" .. slot2.id)
		setActive(slot8, false)
		setActive(slot10, false)
		setActive(slot7, false)
		setActive(slot13, true)

		if not slot2:isUnlock() and not slot2:activeAlways() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 300-304, warpins: 1 ---
			setActive(slot5, false)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 305-311, warpins: 2 ---
			setActive(slot5, true)

			if slot2.active then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 312-316, warpins: 1 ---
				if slot2:existOni() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 317-318, warpins: 1 ---
					slot8 = slot10
					slot9 = slot11
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 319-350, warpins: 2 ---
				setActive(slot8, true)

				slot9.alpha = 1

				slot0:RecordTween("fighting" .. slot2.id, LeanTween.alphaCanvas(slot9, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 351-355, warpins: 1 ---
				if slot2:isClear() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 356-363, warpins: 1 ---
					setActive(slot7, true)
					setActive(slot13, false)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 364-430, warpins: 4 ---
		setActive(slot16, false)

		slot19 = findTF(slot5, "circle")

		LeanTween.cancel(go(slot19))

		slot19.localScale = Vector3.zero

		LeanTween.scale(slot19, Vector3(1, 1, 1), 0.2):setDelay(0.3)
		setAnchoredPosition(slot20, {
			x = -1 * slot5:Find("info").rect.width
		})
		shiftPanel(findTF(slot5, "info/bk"), 0, nil, 0.4, 0.4, true, true, nil, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-7, warpins: 1 ---
				setActive(slot1, true)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 8-10, warpins: 2 ---
			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 1 ---
				slot2()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 13-13, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end)

		if slot2:isTriesLimit() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 431-462, warpins: 1 ---
			slot21 = slot2:getConfig("count")

			setText(slot16:Find("label"), i18n("levelScene_chapter_count_tip"))

			slot23 = setText
			slot24 = slot16:Find("Text")
			slot25 = setColorStr
			slot26 = slot21 - slot2:getTodayDefeatCount() .. "/" .. slot21

			if slot21 > slot2:getTodayDefeatCount() or not COLOR_RED then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 466-466, warpins: 2 ---
				slot27 = COLOR_GREEN
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 467-468, warpins: 2 ---
			slot23(slot24, slot25(slot26, slot27))
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 469-477, warpins: 2 ---
		slot22 = 0

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 478-484, warpins: 0 ---
		for slot26, slot27 in ipairs(slot21) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 478-482, warpins: 1 ---
			slot22 = slot22 + pg.expedition_data_template[slot27].bonus_time
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 483-484, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 485-491, warpins: 1 ---
		slot23 = findTF(slot5, "mark")

		if not slot0.markRawPos then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 492-493, warpins: 1 ---
			slot0.markRawPos = slot23.anchoredPosition
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 494-508, warpins: 2 ---
		slot23.anchoredPosition = slot0.markRawPos
		slot24 = math.max(slot22 - slot2.todayDefeatCount, 0)

		if slot0.contextData.map:isRemaster() or slot22 <= 0 or slot24 <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 515-516, warpins: 3 ---
			slot25 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 517-517, warpins: 1 ---
			slot25 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #8 518-533, warpins: 2 ---
		slot26 = slot2:getOniChapterInfo()

		setActive(slot23:Find("bonus"), slot25)
		setActive(slot23, slot25)

		if slot25 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 534-575, warpins: 1 ---
			slot28 = slot23.anchoredPosition.y
			slot23:GetComponent(typeof(CanvasGroup)).alpha = 0

			LeanTween.cancel(go(slot23))
			LeanTween.value(go(slot23), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				slot0.alpha = slot0
				slot0.anchoredPosition.y = slot2 * slot0
				slot0.anchoredPosition.anchoredPosition = slot0.anchoredPosition

				return
				--- END OF BLOCK #0 ---



			end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 576-576, warpins: 2 ---
		--- END OF BLOCK #9 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 577-583, warpins: 2 ---
	slot7 = onButton
	slot8 = slot0

	if not isActive(slot5) or not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 586-586, warpins: 2 ---
		slot9 = slot6
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 587-591, warpins: 2 ---
	slot7(slot8, slot9, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-13, warpins: 2 ---
		if not slot1:isUnlock() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-30, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_tracking_error_pre", slot1:getPrevChapterName()))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-40, warpins: 2 ---
		if slot0.player.level < slot1:getConfig("unlocklevel") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-53, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_level_limit", slot0))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 54-59, warpins: 2 ---
		slot1 = nil

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 60-68, warpins: 0 ---
		for slot5, slot6 in pairs(slot0.maps) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 60-65, warpins: 1 ---
			if slot6:getActiveChapter() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 66-66, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 67-68, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 69-70, warpins: 2 ---
		if slot1 and slot1 ~= slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 74-80, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_STRATEGYING_CHAPTER)

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 81-84, warpins: 3 ---
		if slot1.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-90, warpins: 1 ---
			slot0:switchToChapter(slot1)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 91-103, warpins: 1 ---
			slot0:displayChapterPanel(slot1, Vector3(slot2.localPosition.x - 10, slot2.localPosition.y + 150))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 104-104, warpins: 2 ---
		return
		--- END OF BLOCK #7 ---



	end, SFX_UI_WEIGHANCHOR_SELECT)

	return
	--- END OF BLOCK #3 ---



end

slot0.tryPlayMapStory = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if slot0.contextData.map:getConfig("enter_story") and slot1 ~= "" and not pg.SystemOpenMgr:GetInstance().active then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-28, warpins: 1 ---
		pg.StoryMgr.GetInstance():Play(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if not slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-11, warpins: 1 ---
				if slot0.contextData.map:getConfig("guide_id") and slot1 ~= "" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 14-22, warpins: 1 ---
					pg.StoryMgr.GetInstance():PlayGuide(slot1)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 23-34, warpins: 2 ---
					pg.SystemOpenMgr:GetInstance():notification(slot0.player.level)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-45, warpins: 1 ---
				pg.SystemOpenMgr:GetInstance():notification(slot0.player.level)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 46-46, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-38, warpins: 3 ---
		pg.SystemOpenMgr:GetInstance():notification(slot0.player.level)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 39-40, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.displaySignalPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot0.levelSignalView = LevelSignalView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelSignalView:Load()
	slot0.levelSignalView:ActionInvoke("set", slot0.maps, slot0.subRefreshCount, slot0.subProgress)
	slot0.levelSignalView:ActionInvoke("setCBFunc", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot0:hideSignalPanel()
		slot0.hideSignalPanel:emit(LevelMediator2.ON_REFRESH_SUB_CHAPTER)

		return
		--- END OF BLOCK #0 ---



	end, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:hideSignalPanel()

		if slot0.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-13, warpins: 1 ---
			slot0:switchToChapter(slot0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-22, warpins: 1 ---
			if slot0.contextData.mapIdx ~= slot0:getConfig("map") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-30, warpins: 1 ---
				slot0:setMap(slot0:getConfig("map"))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 31-31, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideSignalPanel()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.hideSignalPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelSignalView:Destroy()

	return
	--- END OF BLOCK #0 ---



end

slot0.displaySpResult = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	setActive(slot0.spResult, true)

	slot4 = slot0
	slot3 = slot0.doPlayAnim

	if slot1 == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 1 ---
		slot5 = "SpUnitWin"
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 1 ---
		slot5 = "SpUnitLose"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-15, warpins: 2 ---
	slot3(slot4, slot5, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		onButton(slot0, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			removeOnButton(removeOnButton)
			setActive(setActive, 
			-- Decompilation error in this vicinity:
			false)
			setActive:hideSpResult()

			-- Decompilation error in this vicinity:
			false()

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #1 ---



end

slot0.hideSpResult = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0.spResult, false)

	return
	--- END OF BLOCK #0 ---



end

slot0.displayBombResult = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	setActive(slot0.spResult, true)
	slot0:doPlayAnim("SpBombRet", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		onButton(slot0, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			removeOnButton(removeOnButton)
			setActive(setActive, 
			-- Decompilation error in this vicinity:
			false)
			setActive:hideBombResult()

			-- Decompilation error in this vicinity:
			false()

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		return
		--- END OF BLOCK #0 ---



	end, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		setText(slot0.transform:Find("right/name_bg/en"), slot0.contextData.chapterVO.modelCount)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.hideBombResult = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0.spResult, false)

	return
	--- END OF BLOCK #0 ---



end

slot0.displayChapterPanel = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	slot0.levelInfoView = LevelInfoView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelInfoView:Load()
	slot0.levelInfoView:ActionInvoke("set", slot1, slot2)
	slot0.levelInfoView:ActionInvoke("setCBFunc", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		if slot0.player.ship_bag_max <= getProxy(BayProxy).getShipCount(slot1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-20, warpins: 1 ---
			NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-37, warpins: 2 ---
		slot0:hideChapterPanel()

		slot3 = slot1:clone()
		slot3.loopFlag = slot0

		if slot3:getConfig("type") == Chapter.CustomFleet then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-43, warpins: 1 ---
			slot0:displayFleetEdit(slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-48, warpins: 1 ---
			slot0:displayFleetSelect(slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 49-49, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideChapterPanel()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.hideChapterPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.levelInfoView and slot0.levelInfoView:CheckState(BaseSubView.STATES.INITED) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-16, warpins: 1 ---
		slot0.levelInfoView:Destroy()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.displayFleetSelect = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = nil

	if slot0.contextData.selectedFleetIDs then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		slot2 = slot0.contextData.selectedFleetIDs
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-14, warpins: 1 ---
		slot2 = slot1:selectFleets(slot0.lastFleetIndex, slot0.fleets)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-50, warpins: 2 ---
	slot0.levelFleetView = LevelFleetView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelFleetView:Load()
	slot0.levelFleetView:ActionInvoke("setOpenCommanderTag", slot0.openedCommanerSystem)
	slot0.levelFleetView:ActionInvoke("set", slot1, slot0.fleets, slot2)
	slot0.levelFleetView:ActionInvoke("setCBFunc", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isTriesLimit() and not slot0:enoughTimes2Start() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-24, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_elite_no_quota"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-31, warpins: 2 ---
		if slot0:getConfig("npc_data") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-41, warpins: 1 ---
			slot4 = getProxy(TaskProxy):getTaskById(slot1[3])

			if slot1[3] == 0 or (slot4 and not slot4:isFinish()) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 49-67, warpins: 2 ---
				slot8 = slot1.fleets[slot0[1]]
				slot7 = slot1.fleets[slot0[1]].getTeamByName

				if pg.ship_data_by_type[pg.ship_data_statistics[slot1[1]].type].team_type ~= TeamType.Vanguard or not Fleet.VANGUARD then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 72-73, warpins: 2 ---
					slot9 = Fleet.MAIN
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 74-77, warpins: 2 ---
				if #slot7(slot8, slot9) == 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 78-88, warpins: 1 ---
					slot1:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("chapter_tip_with_npc", slot5.name)
					})

					return
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 89-94, warpins: 4 ---
		slot2 = false
		slot3 = ""

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 95-107, warpins: 0 ---
		for slot7, slot8 in ipairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-104, warpins: 1 ---
			slot2, slot3 = slot1.fleets[slot8]:GetEnergyStatus()

			if slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 105-105, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 106-107, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 108-110, warpins: 2 ---
		function slot4()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			slot0:hideFleetSelect()

			if not slot0:isValid() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-11, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-18, warpins: 1 ---
			slot0:trackChapter(slot0, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-12, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_TRACKING, slot1.id, , slot1.loopFlag)

				return
				--- END OF BLOCK #0 ---



			end)

			return
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 19-19, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 111-118, warpins: 1 ---
			slot1:HandleShowMsgBox({
				content = slot3,
				onYes = slot4
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 119-120, warpins: 1 ---
			slot4()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 121-130, warpins: 2 ---
		slot1.contextData.selectedChapterVO = nil
		slot1.contextData.selectedFleetIDs = nil

		return
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 131-131, warpins: 2 ---
		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 132-132, warpins: 2 ---
		--- END OF BLOCK #7 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0.contextData.selectedChapterVO = nil
		slot0.contextData.contextData.selectedFleetIDs = nil

		slot0.contextData.contextData:hideFleetSelect()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #1 ---



end

slot0.updateFleetSelect = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.levelFleetView and slot0.levelFleetView:GetLoaded() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-22, warpins: 1 ---
		slot0.levelFleetView:ActionInvoke("set", slot0.levelFleetView.chapter, slot0.fleets, slot0.levelFleetView.selects)

		if slot0.levelCMDFormationView and slot0.levelCMDFormationView:GetLoaded() and slot0.fleets[slot0.levelCMDFormationView.fleet.id] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-41, warpins: 1 ---
			slot0.levelCMDFormationView:ActionInvoke("updateFleet", slot2)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 42-42, warpins: 6 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.hideFleetSelect = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.levelCMDFormationView and slot0.levelCMDFormationView._state ~= 5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		slot0.levelCMDFormationView:Destroy()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-16, warpins: 3 ---
	slot0.levelFleetView:Destroy()

	return
	--- END OF BLOCK #1 ---



end

slot0.displayFleetEdit = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-38, warpins: 1 ---
	slot0.levelFleetView = LevelFleetView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelFleetView:Load()
	slot0.levelFleetView:ActionInvoke("setOpenCommanderTag", slot0.openedCommanerSystem)
	slot0.levelFleetView:ActionInvoke("setHardShipVOs", slot0.shipVOs)
	slot0.levelFleetView:ActionInvoke("setCBFuncOnHard", slot2)
	slot0.levelFleetView:ActionInvoke("setOnHard", slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateFleetEdit = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.levelFleetView and slot0.levelFleetView:GetLoaded() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-17, warpins: 1 ---
		if slot0.contextData.map:getChapter(slot1) and slot0.levelFleetView.chapter.id == slot4.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-29, warpins: 1 ---
			slot0.levelFleetView:ActionInvoke("setOnHard", slot4)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-31, warpins: 3 ---
		if slot4 and slot0.levelCMDFormationView and slot0.levelCMDFormationView:GetLoaded() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-50, warpins: 1 ---
			slot0.levelCMDFormationView:ActionInvoke("updateFleet", slot4:wrapEliteFleet(slot2))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 51-51, warpins: 6 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.hideFleetEdit = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-8, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_UPDATE_CUSTOM_FLEET, slot1.id)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-11, warpins: 2 ---
	if slot0.levelCMDFormationView and slot0.levelCMDFormationView._state ~= 5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-19, warpins: 1 ---
		slot0.levelCMDFormationView:Destroy()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-22, warpins: 3 ---
	if slot0.levelFleetView and slot0.levelFleetView._state ~= 5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-30, warpins: 1 ---
		slot0.levelFleetView:Destroy()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-31, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.isCrossStoryLimit = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = true

	if slot1 ~= "" and #slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot2 = _.all(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0[1] == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-12, warpins: 1 ---
				if getProxy(TaskProxy):getTaskById(slot0[2]) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-16, warpins: 1 ---
					slot3 = not slot2:isFinish()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 17-17, warpins: 2 ---
				return slot3
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 18-19, warpins: 2 ---
			return false
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-15, warpins: 3 ---
	return slot2
	--- END OF BLOCK #1 ---



end

slot0.switchDifficulty = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot2 = slot0.contextData.map.getConfig(slot1, "type")

	if slot0.contextData.map:getConfig("uifx") ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-21, warpins: 1 ---
		setActive(slot0:findTF(slot3, slot0.UIFXList), true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-25, warpins: 2 ---
	if Map.EVENT == slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-34, warpins: 1 ---
		setActive(slot0.normalBtn, false)
		setActive(slot0.eliteBtn, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-40, warpins: 1 ---
		slot4 = setActive
		slot5 = slot0.normalBtn

		if slot2 ~= Map.ELITE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-42, warpins: 1 ---
			slot6 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-43, warpins: 1 ---
			slot6 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 44-50, warpins: 2 ---
		slot4(slot5, slot6)

		slot4 = setActive
		slot5 = slot0.eliteQuota

		if slot2 ~= Map.ELITE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-52, warpins: 1 ---
			slot6 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 53-53, warpins: 1 ---
			slot6 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 54-60, warpins: 2 ---
		slot4(slot5, slot6)

		slot4 = setActive
		slot5 = slot0.eliteBtn

		if slot2 ~= Map.SCENARIO then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-62, warpins: 1 ---
			slot6 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-63, warpins: 1 ---
			slot6 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 64-80, warpins: 2 ---
		slot4(slot5, slot6)

		slot6 = setActive
		slot7 = slot0.eliteBtn:Find("bg/pic_activity")

		if getProxy(ActivityProxy).getActivityById(slot4, ActivityConst.ELITE_AWARD_ACTIVITY_ID) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 81-84, warpins: 1 ---
			slot8 = not slot5:isEnd()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 85-85, warpins: 2 ---
		slot6(slot7, slot8)
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 86-89, warpins: 2 ---
	slot4 = pairs

	if not slot0.chapterTFsById then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-90, warpins: 1 ---
		slot5 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 91-92, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 93-119, warpins: 0 ---
	for slot7, slot8 in slot4(slot5) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 93-98, warpins: 1 ---
		if slot1:getChapter(slot7) and (slot9:isUnlock() or slot9:activeAlways()) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 109-113, warpins: 2 ---
			setActive(slot8, true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 114-117, warpins: 2 ---
			setActive(slot8, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 118-119, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 120-120, warpins: 1 ---
	return
	--- END OF BLOCK #5 ---



end

slot0.trackChapter = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = nil


	-- Decompilation error in this vicinity:
	coroutine.wrap(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot1 = getProxy(ChapterProxy)

		if slot0.contextData.map:isRemaster() and slot0.remasterId ~= slot1:getActiveRemaster() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-35, warpins: 1 ---
			slot0:HandleShowMsgBox({
				content = i18n("levelScene_activate_remaster"),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-4, warpins: 1 ---
					onNextTick(onNextTick)

					return
					--- END OF BLOCK #0 ---



				end
			})
			coroutine.yield()

			if slot1.remasterTickets <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-47, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_tickets_not_enough"))

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 48-58, warpins: 2 ---
			slot0:emit(LevelMediator2.ON_ACTIVATE_REMASTER, slot0.remasterId, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				onNextTick(onNextTick)

				return
				--- END OF BLOCK #0 ---



			end)
			coroutine.yield()
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 59-70, warpins: 3 ---
		slot3 = slot2:getConfig("enter_story_limit")

		if slot2:getConfig("enter_story") and slot2 ~= "" and slot0:isCrossStoryLimit(slot3) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 80-91, warpins: 1 ---
			pg.StoryMgr.GetInstance():Play(slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				onNextTick(onNextTick)

				return
				--- END OF BLOCK #0 ---



			end)
			coroutine.yield()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 92-94, warpins: 4 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-96, warpins: 1 ---
			slot3()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 97-97, warpins: 2 ---
		return
		--- END OF BLOCK #3 ---



	end)()

	return
	--- END OF BLOCK #0 ---



end

slot0.setChapter = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = nil

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-11, warpins: 1 ---
		slot2 = slot1.id

		if slot1:getDataType() == ChapterConst.TypeNone then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-20, warpins: 1 ---
			slot1 = slot0.maps[slot0.contextData.mapIdx]:getChapter(slot2)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-25, warpins: 3 ---
	slot0.contextData.chapterId = slot2
	slot0.contextData.chapterVO = slot1

	return
	--- END OF BLOCK #1 ---



end

slot0.switchToChapter = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0:frozen(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0.levelStageView:tryAutoAction()

		return
		--- END OF BLOCK #0 ---



	end)

	slot4 = slot0.contextData.map:getConfig("type")

	if (slot1:getDataType() == ChapterConst.TypeSham and slot4 ~= Map.SHAM) or (slot3 == ChapterConst.TypeGuild and slot4 ~= Map.GUILD_BOSS) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-33, warpins: 2 ---
		slot0.contextData.chapterMapIdx = slot0.contextData.mapIdx
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 34-41, warpins: 3 ---
	if slot0.contextData.mapIdx ~= slot1:getConfig("map") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-48, warpins: 1 ---
		slot0:setMap(slot1:getConfig("map"))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 49-105, warpins: 2 ---
	slot0:setChapter(slot1)
	setActive(slot0.clouds, false)
	setActive(slot0.chapters, false)
	setActive(slot0.escortChapters, false)

	slot0.leftCanvasGroup.blocksRaycasts = false
	slot0.rightCanvasGroup.blocksRaycasts = false

	slot0:onSubLayerContextChange()

	slot0.levelStageView = LevelStageView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelStageView:Load()
	slot0.levelStageView:ActionInvoke("SetSeriesOperation", slot5)
	slot0.levelStageView:ActionInvoke("SetPlayer", slot0.player)
	slot0.levelStageView:ActionInvoke("SwitchToChapter", slot1)

	return
	--- END OF BLOCK #2 ---



end

slot0.switchToMap = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = ChapterConst.TypeNone

	if slot0.contextData.chapterVO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		slot2 = slot1:getDataType()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-20, warpins: 2 ---
	slot3 = getProxy(ChapterProxy)

	if slot1:getMapType() == Map.ESCORT and (#slot3.escortMaps == 0 or _.any(slot4, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		return slot0:shouldFetch()
		--- END OF BLOCK #0 ---



	end)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-38, warpins: 2 ---
		slot0:emit(LevelMediator2.ON_FETCH_ESCORT)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-48, warpins: 3 ---
	if slot3.subNextReqTime < pg.TimeMgr.GetInstance():GetServerTime() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-55, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_FETCH_SUB_CHAPTER)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 56-188, warpins: 2 ---
	slot0:frozen()
	slot0:destroyGrid()
	slot0:RecordTween("mapScale", LeanTween.value(go(slot0.map), slot0.map.localScale, Vector3.New(1, 1, 1), slot0):setOnUpdateVector3(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0.map.localScale = slot0
		slot0.float.localScale = slot0

		return
		--- END OF BLOCK #0 ---



	end):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if not slot0.contextData.chapterVO and slot0.levelStageView and slot0.levelStageView:CheckState(BaseSubView.STATES.INITED) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-24, warpins: 1 ---
			slot0.levelStageView:Destroy()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-29, warpins: 4 ---
		slot0:unfrozen()

		return
		--- END OF BLOCK #1 ---



	end)):setEase(LeanTweenType.easeOutSine).uniqueId)

	slot5 = LeanTween.value(go(slot0.map), slot0.map.pivot, Vector2.zero, slot0)

	slot5:setOnUpdateVector2(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0.map.pivot = slot0
		slot0.float.pivot = slot0

		return
		--- END OF BLOCK #0 ---



	end):setEase(LeanTweenType.easeOutSine)
	slot0:RecordTween("mapPivot", slot5.uniqueId)
	setActive(slot0.topChapter, true)
	setActive(slot0.topChapterLine, true)
	setActive(slot0.leftChapter, true)
	setActive(slot0.rightChapter, true)
	shiftPanel(slot0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	slot0.levelStageView:ShiftPanelToChapter(0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)

	if slot0.ambushWarning and slot0.ambushWarning.activeSelf then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 193-200, warpins: 1 ---
		slot0.ambushWarning:SetActive(false)
		slot0:unfrozen()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 201-214, warpins: 3 ---
	slot0:onSubLayerContextChange()
	slot0:setChapter(nil)
	slot0:updateEscortInfo()

	if slot2 == ChapterConst.TypeSham then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 215-229, warpins: 1 ---
		slot0.contextData.mapIdx = slot0.contextData.chapterMapIdx
		slot0.contextData.chapterMapIdx = nil

		slot0:setMap(slot0:selectMap(slot0.maps))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 230-233, warpins: 1 ---
		if slot2 == ChapterConst.TypeNone then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 234-245, warpins: 1 ---
			slot0:updateMapItems()
			slot0:switchDifficulty()
			slot0:updateActivityBtns()
			slot0:updateCouldAnimator()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 246-247, warpins: 3 ---
	return
	--- END OF BLOCK #5 ---



end

slot0.displayAmbushInfo = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	slot0.levelAmbushView = LevelAmbushView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelAmbushView:Load()
	slot0.levelAmbushView:ActionInvoke("SetFuncOnComplete", slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.hideAmbushInfo = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.levelAmbushView and slot0.levelAmbushView:CheckState(BaseSubView.STATES.INITED) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-16, warpins: 1 ---
		slot0.levelAmbushView:Destroy()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.doAmbushWarning = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:frozen()

	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-50, warpins: 1 ---
		slot0.ambushWarning:SetActive(true)

		slot0 = tf(slot0.ambushWarning)

		slot0:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)
		slot0:SetSiblingIndex(1)

		slot1 = slot0:GetComponent("DftAniEvent")

		slot1:SetTriggerEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0()

			return
			--- END OF BLOCK #0 ---



		end)
		slot1:SetEndEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			slot0.ambushWarning:SetActive(false)
			slot0:unfrozen()

			return
			--- END OF BLOCK #0 ---



		end)
		playSoundEffect(SFX_UI_WARNING)
		Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			playSoundEffect(SFX_UI_WARNING)

			return
			--- END OF BLOCK #0 ---



		end, 1, 1):Start()

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.ambushWarning then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-17, warpins: 1 ---
		PoolMgr.GetInstance():GetUI("ambushwarnui", true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0:SetActive(true)

			slot0.ambushWarning = slot0

			slot0()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-19, warpins: 1 ---
		slot2()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-21, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.destroyAmbushWarn = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.ambushWarning then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", slot0.ambushWarning)

		slot0.ambushWarning = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.displayStrategyInfo = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot0.levelStrategyView = LevelStrategyView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelStrategyView:Load()
	slot0.levelStrategyView:ActionInvoke("set", slot1)
	slot0.levelStrategyView:ActionInvoke("setCBFunc", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		slot3 = pg.strategy_data_template[slot1.id]

		if not slot0.contextData.chapterVO.fleet:canUseStrategy(slot0.contextData.chapterVO.getDataType(slot0)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-19, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-29, warpins: 2 ---
		slot4 = slot2:getNextStgUser(slot1.id)

		if slot3.type == ChapterConst.StgTypeForm then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-44, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = slot4,
				arg1 = slot1.id
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-49, warpins: 1 ---
			if slot3.type == ChapterConst.StgTypeConsume then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 50-63, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpStrategy,
					id = slot4,
					arg1 = slot1.id
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 64-68, warpins: 3 ---
		slot0:hideStrategyInfo()

		return
		--- END OF BLOCK #2 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideStrategyInfo()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.selectStrategyTarget = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot5 = slot0.contextData.chapterVO.fleet.line
	slot6 = {}

	if slot1.id == ChapterConst.StrategyAirStrike then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-21, warpins: 1 ---
		slot6 = slot3:calcAreaCells(slot5.row, slot5.column, slot1.arg[2], slot1.arg[3])
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-26, warpins: 1 ---
		if slot1.id == ChapterConst.StrategyCannon then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-35, warpins: 1 ---
			slot6 = slot3:calcAreaCells(slot5.row, slot5.column, 0, slot1.arg[2])
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 36-56, warpins: 3 ---
	_.each(slot6, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0.grid:shiningTarget(slot0.row, slot0.column, true)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.grid:updateQuadCells(ChapterConst.QuadStateStrategy, _.filter(slot6, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		return not slot0:existFleet(nil, slot0.row, slot0.column)
		--- END OF BLOCK #0 ---



	end), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		_.each(slot0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0.grid:shiningTarget(slot0.row, slot0.column, false)

			return
			--- END OF BLOCK #0 ---



		end)

		if slot0 and _.any(slot0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			if slot0.row ~= slot0.row or slot0.column ~= slot0.column then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 2 ---
				slot1 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-13, warpins: 1 ---
				slot1 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-14, warpins: 2 ---
			return slot1
			--- END OF BLOCK #1 ---



		end) and slot2:existEnemy(ChapterConst.SubjectPlayer, slot0.row, slot0.column) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-29, warpins: 1 ---
			slot3(slot0.row, slot0.column)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-36, warpins: 3 ---
			slot1.grid:updateQuadCells(ChapterConst.QuadStateNormal)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-38, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #1 ---



end

slot0.selectSquareBarrieredCell = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot0.grid:updateQuadCells(ChapterConst.QuadStateStrategy, slot0.contextData.chapterVO.calcSquareBarrierCells(slot3, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column, slot1), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 and _.any(slot0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			if slot0.row ~= slot0.row or slot0.column ~= slot0.column then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 2 ---
				slot1 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-13, warpins: 1 ---
				slot1 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-14, warpins: 2 ---
			return slot1
			--- END OF BLOCK #1 ---



		end) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-14, warpins: 1 ---
			slot1(slot0.row, slot0.column)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-21, warpins: 2 ---
			slot2.grid:updateQuadCells(ChapterConst.QuadStateNormal)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-23, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.hideStrategyInfo = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelStrategyView:Destroy()

	return
	--- END OF BLOCK #0 ---



end

slot0.displayRepairWindow = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot4 = getProxy(ChapterProxy)
	slot5, slot6, slot7, slot8 = nil

	if slot0.contextData.chapterVO.getDataType(slot2) == ChapterConst.TypeSham then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-21, warpins: 1 ---
		slot5 = slot2.repairTimes
		slot6, slot7, slot8 = ChapterConst.GetShamRepairParams()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-25, warpins: 1 ---
		if slot3 == ChapterConst.TypeNone then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-32, warpins: 1 ---
			slot5 = slot4.repairTimes
			slot6, slot7, slot8 = ChapterConst.GetRepairParams()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-63, warpins: 3 ---
	slot0.levelRepairView = LevelRepairView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelRepairView:Load()
	slot0.levelRepairView:ActionInvoke("set", slot5, slot6, slot7, slot8)
	slot0.levelRepairView:ActionInvoke("setCBFunc", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if slot0 - math.min(math.min, slot0) == 0 and slot2.player:getTotalGem() < slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-29, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_rmb"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-51, warpins: 3 ---
		slot2:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = slot4.fleet.id,
			arg1 = slot4.fleet.id.id
		})
		slot2:hideRepairWindow()

		return
		--- END OF BLOCK #1 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideRepairWindow()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #1 ---



end

slot0.hideRepairWindow = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelRepairView:Destroy()

	return
	--- END OF BLOCK #0 ---



end

slot0.displayRemasterPanel = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot2 = getProxy(ChapterProxy)
	slot3 = {}
	slot4 = pg.TimeMgr.GetInstance()

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-24, warpins: 0 ---
	for slot8, slot9 in ipairs(pg.re_map_template.all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-22, warpins: 1 ---
		table.insert(slot3, pg.re_map_template[slot9])
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-24, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-43, warpins: 1 ---
	slot0.levelRemasterView = LevelRemasterView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelRemasterView:Load()

	slot6 = slot0.levelRemasterView
	slot5 = slot0.levelRemasterView.ActionInvoke
	slot7 = "set"
	slot8 = slot3
	slot9 = slot2.remasterTickets

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-44, warpins: 1 ---
		slot10 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 45-56, warpins: 2 ---
	slot5(slot6, slot7, slot8, slot9, slot10)
	slot0.levelRemasterView:ActionInvoke("setCBFunc", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		slot0:setMap(pg.chapter_template[slot0.config_data[1]].map)
		slot0:hideRemasterPanel()

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideRemasterPanel()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #3 ---



end

slot0.hideRemasterPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelRemasterView:Destroy()

	return
	--- END OF BLOCK #0 ---



end

slot0.initGrid = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-53, warpins: 1 ---
	setActive(slot0.uiMain, true)

	slot0.levelGrid.localEulerAngles = Vector3(slot0.contextData.chapterVO.theme.angle, 0, 0)
	slot0.grid = LevelGrid.New(slot0.dragLayer)

	slot0.grid:attach(slot0)
	slot0.grid:setItems(slot0.shipTpl, slot0.subTpl, slot0.transportTpl, slot0.transportTargetTpl, slot0.enemyTpl, slot0.deadTpl, slot0.boxTpl, slot0.supplyTpl, slot0.rivalTpl, slot0.championTpl, slot0.spineTpl, slot0.oniTpl, slot0.oniTargetTpl, slot0.bombEnemyTpl, slot0.arrowTarget)

	slot0.grid.onCellClick = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:clickGridCell(slot0)

		return
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.chapterVO.getDataType(slot1) == ChapterConst.TypeNone then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-56, warpins: 1 ---
		slot0.grid.onShipStepChange = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0.levelStageView:updateAmbushRate(slot0)

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 57-71, warpins: 2 ---
	slot0.grid.onShipArrived = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		slot0:overrideChapter()
		slot0.levelStageView:updateAmbushRate(slot0.overrideChapter.contextData.chapterVO.fleet.line, true)
		slot0.levelStageView:updateStageStrategy()

		return
		--- END OF BLOCK #0 ---



	end

	slot0.grid:initAll()
	slot0:tryFocusForGuide()
	slot0:enableLevelCamera()

	return
	--- END OF BLOCK #1 ---



end

slot0.tryFocusForGuide = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	if pg.GuideMgr:GetInstance():isRuning() and slot0.contextData.chapterVO:findChapterCell(ChapterConst.AttachBoss) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-24, warpins: 1 ---
		slot0.grid:focusOnCell(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 25-25, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.destroyGrid = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.grid then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-20, warpins: 1 ---
		slot0.grid:detach()

		slot0.grid = nil

		slot0:disableLevelCamera()
		setActive(slot0.dragLayer, true)
		setActive(slot0.uiMain, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-21, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.clickGridCell = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not slot0:isfrozen() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		slot0.levelStageView:clickGridCell(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.doTracking = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:frozen()

	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-32, warpins: 1 ---
		slot0.radar:SetActive(true)

		slot0 = tf(slot0.radar)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetSiblingIndex(1)
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			slot0.radar:SetActive(false)
			slot0:unfrozen()
			slot0.unfrozen()

			return
			--- END OF BLOCK #0 ---



		end)
		playSoundEffect(SFX_UI_WEIGHANCHOR_SEARCH)

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.radar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-17, warpins: 1 ---
		PoolMgr.GetInstance():GetUI("RadarEffectUI", true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0:SetActive(true)

			slot0.radar = slot0

			slot0()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-19, warpins: 1 ---
		slot2()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-21, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.destroyTracking = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.radar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", slot0.radar)

		slot0.radar = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.doPlayAirStrike = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-41, warpins: 1 ---
		slot0.playing = true

		slot0:frozen()
		slot0.frozen.airStrike:SetActive(true)

		slot0 = tf(slot0.airStrike)

		slot0:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)
		slot0:SetAsLastSibling()

		slot2 = slot0:Find("words/be_striked")

		if setActive ~= ChapterConst.SubjectChampion then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-43, warpins: 1 ---
			slot3 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-44, warpins: 1 ---
			slot3 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-55, warpins: 2 ---
		slot1(slot2, slot3)

		slot2 = slot0:Find("words/strike_enemy")

		if setActive ~= ChapterConst.SubjectPlayer then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 56-57, warpins: 1 ---
			slot3 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-58, warpins: 1 ---
			slot3 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 59-71, warpins: 2 ---
		slot1(slot2, slot3)
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			slot0.playing = false

			SetActive(slot0.airStrike, false)

			if slot0.airStrike then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-13, warpins: 1 ---
				slot1()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-18, warpins: 2 ---
			slot0:unfrozen()

			return
			--- END OF BLOCK #1 ---



		end)

		if slot0.GetComponent("DftAniEvent").SetEndEvent then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-78, warpins: 1 ---
			onButton(slot0, slot0, slot1, SFX_PANEL)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 79-81, warpins: 1 ---
			removeOnButton(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 82-85, warpins: 2 ---
		playSoundEffect(SFX_UI_WARNING)

		return
		--- END OF BLOCK #3 ---



	end

	if not slot0.airStrike then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-14, warpins: 1 ---
		PoolMgr.GetInstance():GetUI("AirStrike", true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0:SetActive(true)

			slot0.airStrike = slot0

			slot0()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		slot4()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-18, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.destroyAirStrike = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.airStrike then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-22, warpins: 1 ---
		slot0.airStrike:GetComponent("DftAniEvent").SetEndEvent(slot1, nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", slot0.airStrike)

		slot0.airStrike = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-23, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.doPlayAnim = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.uiAnims then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot4 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-10, warpins: 2 ---
	slot0.uiAnims = slot4

	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		slot0.playing = true

		slot0:frozen()
		slot0:SetActive(true)

		if true then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-18, warpins: 1 ---
			slot2(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-42, warpins: 2 ---
		slot0 = tf(slot1)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			slot0.playing = false

			slot0(false)
			slot0:unfrozen()

			return
			--- END OF BLOCK #0 ---



		end)
		playSoundEffect(SFX_UI_WARNING)

		return
		--- END OF BLOCK #1 ---



	end

	if not slot0.uiAnims[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-20, warpins: 1 ---
		PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			slot0:SetActive(
			-- Decompilation error in this vicinity:
			true)

			slot0.uiAnims[] = slot0
			slot2 = slot0.uiAnims[]


			-- Decompilation error in this vicinity:
			true()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-22, warpins: 1 ---
		slot5()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-24, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.destroyUIAnims = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.uiAnims then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-25, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.uiAnims) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-23, warpins: 1 ---
			slot5:GetComponent("DftAniEvent").SetEndEvent(slot6, nil)
			PoolMgr.GetInstance():ReturnUI(slot4, slot5)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 24-25, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 26-27, warpins: 1 ---
		slot0.uiAnims = nil
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-28, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.doPlayTorpedo = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-38, warpins: 1 ---
		slot0.playing = true

		slot0:frozen()
		slot0.frozen.torpetoAni:SetActive(true)

		slot0 = tf(slot0.torpetoAni)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			slot0.playing = false

			SetActive(slot0.torpetoAni, false)

			if SetActive then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-13, warpins: 1 ---
				slot1()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-18, warpins: 2 ---
			slot0:unfrozen()

			return
			--- END OF BLOCK #1 ---



		end)
		playSoundEffect(SFX_UI_WARNING)

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.torpetoAni then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-14, warpins: 1 ---
		PoolMgr.GetInstance():GetUI("Torpeto", true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0:SetActive(true)

			slot0.torpetoAni = slot0

			slot0()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		slot2()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-18, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.destroyTorpedo = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.torpetoAni then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-22, warpins: 1 ---
		slot0.torpetoAni:GetComponent("DftAniEvent").SetEndEvent(slot1, nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", slot0.torpetoAni)

		slot0.torpetoAni = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-23, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.doPlayStrikeAnim = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.strikeAnims then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot4 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-39, warpins: 2 ---
	slot0.strikeAnims = slot4
	slot4, slot5, slot6 = nil

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if coroutine.status(coroutine.status) == "suspended" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-10, warpins: 1 ---
			slot0, slot1 = coroutine.resume(coroutine.resume)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot6 = coroutine.create(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-131, warpins: 1 ---
		slot0.playing = true

		slot0:frozen()
		setActive(slot0, true)

		slot1 = tf(slot0)
		slot3 = findTF(slot1, "mask/painting")
		slot4 = findTF(slot1, "ship")

		setParent(slot2, slot3:Find("fitter"), false)
		setParent(slot3, slot4, false)
		setActive(slot4, false)
		setActive(slot2, false)
		slot1:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)
		slot1:SetAsLastSibling()

		slot5 = slot1:GetComponent("DftAniEvent")
		slot6 = slot3:GetComponent("SpineAnimUI")
		slot7 = slot6:GetComponent("SkeletonGraphic")

		slot5:SetStartEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			slot0:SetAction("attack", 0)

			slot0.SetAction.freeze = true

			return
			--- END OF BLOCK #0 ---



		end)
		slot5:SetTriggerEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0.freeze = false

			slot0:SetActionCallBack(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-2, warpins: 1 ---
				if slot0 == "action" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 3-3, warpins: 1 ---
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 4-5, warpins: 1 ---
					if slot0 == "finish" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 6-8, warpins: 1 ---
						slot0.freeze = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 9-9, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end)

			return
			--- END OF BLOCK #0 ---



		end)
		slot5:SetEndEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0.freeze = false

			slot0()

			return
			--- END OF BLOCK #0 ---



		end)
		onButton(slot0, slot1, slot4, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(slot3, slot5:getPainting())
		PoolMgr.GetInstance():ReturnSpineChar(slot5:getPrefab(), slot3)
		setActive(slot0, false)

		slot0.playing = false

		slot0:unfrozen()

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 132-133, warpins: 1 ---
			slot6()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 134-135, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	function slot8()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0.strikeAnims[slot1] and slot2 and slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot4()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 4 ---
		return
		--- END OF BLOCK #1 ---



	end

	PoolMgr.GetInstance():GetPainting(slot1:getPainting(), true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0 = slot0

		slot1()

		return
		--- END OF BLOCK #0 ---



	end)
	PoolMgr.GetInstance():GetSpineChar(slot1:getPrefab(), true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0.transform.localScale = Vector3.one

		slot0.transform()

		return
		--- END OF BLOCK #0 ---



	end)

	if not slot0.strikeAnims[slot2] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-48, warpins: 1 ---
		PoolMgr.GetInstance():GetUI(slot2, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0.strikeAnims[] = slot0

			slot0.strikeAnims()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 49-50, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.destroyStrikeAnim = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.strikeAnims then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-25, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.strikeAnims) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-23, warpins: 1 ---
			slot5:GetComponent("DftAniEvent").SetEndEvent(slot6, nil)
			PoolMgr.GetInstance():ReturnUI(slot4, slot5)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 24-25, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 26-27, warpins: 1 ---
		slot0.strikeAnims = nil
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-28, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.doSignalSearch = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:frozen()

	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-34, warpins: 1 ---
		slot0.playing = true

		slot0.signalAni:SetActive(true)

		slot0 = tf(slot0.signalAni)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			slot0.playing = false

			SetActive(slot0.signalAni, false)

			if SetActive then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-13, warpins: 1 ---
				slot1()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-18, warpins: 2 ---
			slot0:unfrozen()

			return
			--- END OF BLOCK #1 ---



		end)
		playSoundEffect(SFX_UI_WARNING)

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.signalAni then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-17, warpins: 1 ---
		PoolMgr.GetInstance():GetUI("SignalUI", true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0:SetActive(true)

			slot0.signalAni = slot0

			slot0()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-19, warpins: 1 ---
		slot2()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-21, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.destroySignalSearch = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.signalAni then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-22, warpins: 1 ---
		slot0.signalAni:GetComponent("DftAniEvent").SetEndEvent(slot1, nil)
		PoolMgr.GetInstance():ReturnUI("SignalUI", slot0.signalAni)

		slot0.signalAni = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-23, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.doPlayCommander = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot0:frozen()
	setActive(slot0.commanderTinkle, true)

	slot4 = setText
	slot5 = slot0.commanderTinkle:Find("name")

	if #slot1:getSkills() <= 0 or not slot3[1]:getConfig("name") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-28, warpins: 2 ---
		slot6 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 29-108, warpins: 2 ---
	slot4(slot5, slot6)
	setImageSprite(slot0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. slot1:getConfig("painting"), ""))

	slot0.commanderTinkle:GetComponent(typeof(CanvasGroup)).alpha = 0
	slot5 = Vector2(248, 237)

	LeanTween.value(go(slot0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		slot0.commanderTinkle.localPosition.x = slot1.x + -100 * (1 - slot0)
		slot0.commanderTinkle.localPosition = slot0.commanderTinkle.localPosition
		slot0.commanderTinkle.alpha = slot0

		return
		--- END OF BLOCK #0 ---



	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(slot0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		slot0.commanderTinkle.localPosition.x = slot1.x + 100 * slot0
		slot0.commanderTinkle.localPosition = slot0.commanderTinkle.localPosition
		slot0.commanderTinkle.alpha = 1 - slot0

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(function ()

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
		--- BLOCK #1 6-10, warpins: 2 ---
		slot1:unfrozen()

		return
		--- END OF BLOCK #1 ---



	end))

	return
	--- END OF BLOCK #1 ---



end

slot0.strikeEnemy = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	slot0:frozen()

	slot0.damageText.position = slot0.uiCam:ScreenToWorldPoint(slot5)
	slot0.damageText.localPosition.y = slot0.damageText.localPosition.y + 40
	slot0.damageText.localPosition.z = 0

	slot0:easeDamage(slot0.damageText.localPosition, slot2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0:unfrozen()
		slot0()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.easeDamage = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-38, warpins: 1 ---
	slot0:frozen()
	setText(slot0.damageText, slot2)
	setActive(slot0.damageText, true)

	slot0.damageText.localPosition = slot1

	LeanTween.value(go(slot0.damageText), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		slot0.damageText.localPosition.y = slot1.y + 60 * slot0
		slot0.damageText.localPosition = slot0.damageText.localPosition

		setTextAlpha(slot0.damageText, 1 - slot0)

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		setActive(slot0.damageText, false)
		setActive:unfrozen()

		if setActive then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

slot0.easeAvoid = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-55, warpins: 1 ---
	slot0:frozen()

	slot0.avoidText.position = slot0.uiCam:ScreenToWorldPoint(slot3)
	slot0.avoidText.localPosition.z = 0
	slot0.avoidText.localPosition = slot0.avoidText.localPosition

	setActive(slot0.avoidText, true)

	slot5 = slot0.avoidText:Find("avoid")

	LeanTween.value(go(slot0.avoidText), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		slot0.avoidText.localPosition.y = slot1.y + 100 * slot0
		slot0.avoidText.localPosition = slot0.avoidText.localPosition

		setImageAlpha(slot0.avoidText, 1 - slot0)
		setImageAlpha(setImageAlpha, 1 - slot0)

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		setActive(slot0.avoidText, false)
		setActive:unfrozen()

		if setActive then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

slot0.overrideChapter = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)

	return
	--- END OF BLOCK #0 ---



end

slot0.onSubLayerOpen = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	setActive(slot0.topPanel, false)
	slot0:disableLevelCamera()

	slot0.visibilityForPreCombat = {
		leftChapter = isActive(slot0.leftChapter),
		rightChapter = isActive(slot0.rightChapter),
		clouds = isActive(slot0.clouds),
		chapters = isActive(slot0.chapters)
	}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-35, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.visibilityForPreCombat) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-33, warpins: 1 ---
		setActive(slot0[slot4], false)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 34-35, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 36-44, warpins: 1 ---
	slot2 = slot0.contextData.map.getConfig(slot1, "bg")

	if slot0.tornadoTF and slot2 and #slot2 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-54, warpins: 1 ---
		setActive(slot0.tornadoTF, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 55-57, warpins: 4 ---
	slot0.isSubLayerOpen = true

	return
	--- END OF BLOCK #3 ---



end

slot0.onSubLayerClose = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.exited then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-17, warpins: 1 ---
		slot0:enableLevelCamera()

		if #getProxy(ContextProxy).getContextByMediator(slot1, LevelMediator2).children == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-24, warpins: 1 ---
			setActive(slot0.topPanel, true)

			if slot0.visibilityForPreCombat then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-28, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 29-34, warpins: 0 ---
				for slot6, slot7 in pairs(slot0.visibilityForPreCombat) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 29-32, warpins: 1 ---
					setActive(slot0[slot6], slot7)
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 33-34, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 35-36, warpins: 1 ---
				slot0.visibilityForPreCombat = nil
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 37-39, warpins: 4 ---
	if slot0.tornadoTF and slot0.contextData.map:getConfig("animtor") == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-51, warpins: 1 ---
		setActive(slot0.tornadoTF, true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 52-54, warpins: 3 ---
	slot0.isSubLayerOpen = nil

	return
	--- END OF BLOCK #2 ---



end

slot0.onSubLayerContextChange = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0.visibilityForPreCombat = nil

	return
	--- END OF BLOCK #0 ---



end

slot0.popStageStrategy = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	if slot0:findTF("event/collapse", slot0.levelStageView.rightStage).anchoredPosition.x <= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		triggerButton(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-15, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.resetLevelGrid = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.dragLayer.localPosition = Vector3.zero

	return
	--- END OF BLOCK #0 ---



end

slot0.frozen = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot0.fcall = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-10, warpins: 2 ---
	slot0.frozenCount = slot0.frozenCount + 1
	slot2 = slot0.canvasGroup

	if slot0.frozenCount ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-15, warpins: 2 ---
	slot2.blocksRaycasts = slot3

	return
	--- END OF BLOCK #2 ---



end

slot0.unfrozen = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.exited then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-11, warpins: 2 ---
	slot0.frozenCount = slot0.frozenCount - 1
	slot1 = slot0.canvasGroup

	if slot0.frozenCount ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-13, warpins: 1 ---
		slot2 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		slot2 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-18, warpins: 2 ---
	slot1.blocksRaycasts = slot2

	if slot0.frozenCount == 0 and slot0.fcall then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-26, warpins: 1 ---
		slot0.fcall = nil

		slot0.fcall()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 27-27, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.isfrozen = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.frozenCount <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		slot1 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		slot1 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end

slot0.enableLevelCamera = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0.levelCamIndices = math.max(slot0.levelCamIndices - 1, 0)

	if slot0.levelCamIndices == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		slot0.levelCam.enabled = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.disableLevelCamera = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.levelCamIndices = slot0.levelCamIndices + 1

	if slot0.levelCamIndices > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		slot0.levelCam.enabled = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-11, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.RecordTween = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0.tweens[slot1] = slot2

	return
	--- END OF BLOCK #0 ---



end

slot0.DeleteTween = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.tweens[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		LeanTween.cancel(slot2)

		slot0.tweens[slot1] = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.openCommanderPanel = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot4 = nil

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		function slot4(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			if slot0.type == LevelUIConst.COMMANDER_OP_ADD then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-29, warpins: 1 ---
				slot0.contextData.commanderSelected = {
					chapterId = slot1,
					fleetId = slot2.id
				}

				slot0:emit(LevelMediator2.ON_SELECT_COMMANDER, slot0.pos, slot2.id, slot0.emit)
				slot0:closeCommanderPanel()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-45, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = slot0,
					fleetId = slot2.id,
					chapterId = slot0.emit
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 46-46, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		function slot4(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			if slot0.type == LevelUIConst.COMMANDER_OP_ADD then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-29, warpins: 1 ---
				slot0.contextData.eliteCommanderSelected = {
					index = slot1,
					pos = slot0.pos,
					chapterId = 
				}

				slot0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, slot0.emit, slot0.pos, slot0)
				slot0:closeCommanderPanel()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-44, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_EDIT,
					data = slot0,
					index = slot1,
					chapterId = slot0
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 45-45, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-32, warpins: 2 ---
	slot0.levelCMDFormationView = LevelCMDFormationView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelCMDFormationView:Load()
	slot0.levelCMDFormationView:ActionInvoke("update", slot1, slot0.commanderPrefabs, slot4)
	slot0.levelCMDFormationView:ActionInvoke("open")

	return
	--- END OF BLOCK #1 ---



end

slot0.updateCommanderPrefab = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.levelCMDFormationView and slot0.levelCMDFormationView:GetLoaded() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		slot0.levelCMDFormationView:ActionInvoke("updatePrefabs", slot0.commanderPrefabs)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.closeCommanderPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelCMDFormationView:close()

	return
	--- END OF BLOCK #0 ---



end

slot0.HandleShowMsgBox = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1.blurLevelCamera = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.updatePoisonAreaTip = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot1 = slot0.contextData.chapterVO

	function getTypeEvent(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot1 = {}

		if not pg.map_event_list[slot0.id] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-9, warpins: 1 ---
			slot2 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-16, warpins: 2 ---
		slot3 = nil

		if slot0:isLoop() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-19, warpins: 1 ---
			if not slot2.event_list_loop then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-20, warpins: 1 ---
				slot3 = {}
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-21, warpins: 2 ---
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-24, warpins: 1 ---
			if not slot2.event_list then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-25, warpins: 1 ---
				slot3 = {}
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 26-29, warpins: 3 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 30-42, warpins: 0 ---
		for slot7, slot8 in ipairs(slot3) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-35, warpins: 1 ---
			if pg.map_event_template[slot8].c_type == slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-40, warpins: 1 ---
				table.insert(slot1, slot9)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-42, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 43-43, warpins: 1 ---
		return slot1
		--- END OF BLOCK #4 ---



	end

	if getTypeEvent(ChapterConst.EvtType_Poison) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-14, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-37, warpins: 0 ---
		for slot6, slot7 in ipairs(slot2) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			if slot7.round_gametip ~= nil and slot8 ~= "" and slot1:getRoundNum() == slot8[1] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 26-35, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n(slot8[2]))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 36-37, warpins: 5 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-39, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.contextData.chapterVO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-13, warpins: 1 ---
		pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-16, warpins: 2 ---
	if slot0.levelFleetView and slot0.levelFleetView.selectIds then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-28, warpins: 1 ---
		slot0.contextData.selectedFleetIDs = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-43, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.levelFleetView.selectIds) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-32, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 33-41, warpins: 0 ---
			for slot9, slot10 in pairs(slot5) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-39, warpins: 1 ---
				slot0.contextData.selectedFleetIDs[#slot0.contextData.selectedFleetIDs + 1] = slot10
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 40-41, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 42-43, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 44-46, warpins: 3 ---
	if slot0.levelStageView and slot0.levelStageView:CheckState(BaseSubView.STATES.INITED) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-59, warpins: 1 ---
		slot0.levelStageView:Destroy()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 60-99, warpins: 3 ---
	slot0:hideChapterPanel()
	slot0:hideFleetEdit()
	slot0:hideSpResult()
	slot0:hideBombResult()
	slot0:destroyGrid()
	slot0:destroyAmbushWarn()
	slot0:destroyAirStrike()
	slot0:destroyTorpedo()
	slot0:destroyStrikeAnim()
	slot0:destroyTracking()
	slot0:destroyCloudAnimator()
	slot0:destroyUIAnims()

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 100-106, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.mapItemTimer) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 100-101, warpins: 1 ---
		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 102-104, warpins: 1 ---
			slot5:Stop()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 105-106, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 107-112, warpins: 1 ---
	slot0.mapItemTimer = nil

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 113-118, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.tweens) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 113-116, warpins: 1 ---
		LeanTween.cancel(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 117-118, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 119-123, warpins: 1 ---
	slot0.tweens = nil

	if slot0.cloudTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 124-130, warpins: 1 ---
		_.each(slot0.cloudTimer, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			LeanTween.cancel(slot0)

			return
			--- END OF BLOCK #0 ---



		end)

		slot0.cloudTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 131-133, warpins: 2 ---
	if slot0.newChapterCDTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 134-139, warpins: 1 ---
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 140-142, warpins: 2 ---
	if slot0.resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 143-148, warpins: 1 ---
		slot0.resPanel:exit()

		slot0.resPanel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 149-151, warpins: 2 ---
	if slot0.activityBossBattlePanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 152-155, warpins: 1 ---
		slot0.activityBossBattlePanel:clear()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 156-196, warpins: 2 ---
	LeanTween.cancel(go(slot0.damageText))

	slot0.map.localScale = Vector3.one
	slot0.map.pivot = Vector2.zero
	slot0.float.localScale = Vector3.one
	slot0.float.pivot = Vector2.zero

	clearImageSprite(slot0.map)
	_.each(slot0.cloudRTFs, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		clearImageSprite(slot0)

		return
		--- END OF BLOCK #0 ---



	end)
	PoolMgr.GetInstance():DestroyAllSprite()

	if getProxy(ChapterProxy) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 197-203, warpins: 1 ---
		if not slot0.contextData.map:isActivity() and not slot2:isSham() and not slot2:isGuildBoss() and not slot2:isEscort() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 219-224, warpins: 1 ---
			slot1:recordLastMap(ChapterProxy.LAST_MAP, slot2.id)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 225-228, warpins: 5 ---
		if Map.lastMapForActivity then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 229-235, warpins: 1 ---
			slot1:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, Map.lastMapForActivity)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 236-236, warpins: 3 ---
	return
	--- END OF BLOCK #12 ---



end

return slot0
