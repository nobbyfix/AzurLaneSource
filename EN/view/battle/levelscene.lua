slot0 = class("LevelScene", import("..base.BaseUI"))
slot1 = require("Mgr/Pool/PoolUtil")
slot2 = import("view.level.MapBuilder.MapBuilder")
slot0.correspondingClass = {
	[slot2.TYPENORMAL] = "MapBuilderNormal",
	[slot2.TYPEESCORT] = "MapBuilderEscort",
	[slot2.TYPESKIRMISH] = "MapBuilderSkirmish"
}
slot3 = 0.5

slot0.getUIName = function (slot0)
	return "LevelMainScene"
end

slot0.preload = function (slot0, slot1)
	slot0.maps = getProxy(ChapterProxy):getMaps()
	slot6 = {
		loadAmount = 0,
		loadCount = 0
	}
	slot7 = nil

	function slot7()
		slot0.loadCount = slot0.loadCount + 1

		if slot0.loadAmount <= slot0.loadCount then
			slot1()
		end
	end

	if slot0.maps[slot0:selectMap(slot2)].getConfig(slot4, "bg") and #slot5 > 0 then
		GetSpriteFromAtlasAsync("levelmap/" .. slot5, "", slot7)

		slot6.loadAmount = slot6.loadAmount + 1
	elseif slot4:getConfig("animtor") == 1 then
		slot6.loadAmount = slot6.loadAmount + 1

		LoadAndInstantiateAsync("ui", slot4:getConfig("ani_name"), function (slot0)
			slot0:SetActive(false)

			slot0.tornadoTF = slot0
			slot0.aniName = slot0

			slot0()
		end, true)
	end

	slot0.loadedTpls = {}
	slot6.loadAmount = slot6.loadAmount + #{
		{
			"zulanwangheng",
			"chapter",
			"barrierTpl"
		},
		{
			"Tpl_Dockyard",
			"leveluiview",
			"dockTpl"
		},
		{
			"Tpl_Destination_Mark",
			"leveluiview",
			"destinationMarkTpl"
		},
		{
			"Tpl_AntiAirGun",
			"leveluiview",
			"antiairgunTpl"
		},
		{
			"Tpl_AntiAirGunArea",
			"leveluiview",
			"antiairgunareaTpl"
		}
	}

	for slot12, slot13 in pairs(slot8) do
		LoadAndInstantiateAsync(slot13[2], slot13[1], function (slot0)
			slot0:SetActive(false)

			slot0.name = slot0[3]
			slot0[3][slot0[3]] = slot0

			table.insert(slot1.loadedTpls, slot0)
			slot1.loadedTpls()
		end, true)
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
	slot0.currentBG = nil
	slot0.mbDict = {}

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
	slot0.chapterName = slot0:findTF("title_chapter/name", slot0.topChapter)
	slot0.chapterNoTitle = slot0:findTF("title_chapter/chapter", slot0.topChapter)
	slot0.resChapter = slot0:findTF("resources", slot0.topChapter)
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel:setParent(slot0.resChapter, false)
	setActive(slot0.topChapter, true)

	slot0._voteBookBtn = slot0.topChapter:Find("vote_book")
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

	slot0.skirmishBar = slot0:findTF("left_times", slot0.leftChapter)
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

	slot0.curtain = slot0:findTF("curtain")

	setActive(slot0.curtain, false)

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

	setActive(slot0.clouds, true)

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

	slot0.bubbleMsgBoxes = {}
end

slot0.addbubbleMsgBox = function (slot0, slot1, slot2)
	if #slot0.bubbleMsgBoxes > 0 then
		table.insert(slot0.bubbleMsgBoxes, slot1)
	else
		slot3 = nil

		table.insert(slot0.bubbleMsgBoxes, slot1)

		-- Decompilation error in this vicinity:
		function ()
			if slot0.bubbleMsgBoxes[1] then
				slot0(function ()
					table.remove(slot0.bubbleMsgBoxes, 1)
					slot0.bubbleMsgBoxes()
				end)
			elseif slot2 then
				slot2()
			end
		end()
	end
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
		if slot0.levelStageView then
			slot0.levelStageView:Destroy()
		end
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
	slot0:bind(LevelUIConst.DO_PLAY_ANIM, function (slot0, slot1)
		slot0:doPlayAnim(slot1.name, slot1.callback, slot1.onStart)
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
	slot0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "CommandRoomMediator")

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
		if slot0:isfrozen() then
			return
		end

		slot2, slot3 = pg.SystemOpenMgr.GetInstance():isOpenSystem(getProxy(PlayerProxy):getData().level, "ChallengeMainMediator")

		if slot2 == false then
			pg.TipsMgr.GetInstance():ShowTips(slot3)
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

		slot0, slot1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator")

		if slot0 then
			slot0:emit(LevelMediator2.ON_OPEN_SHAM)
		else
			pg.TipsMgr.GetInstance():ShowTips(slot1)
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
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))

			if getProxy(ChapterProxy):getUseableMaxEliteMap() then
				slot0:setMap(slot1.configId)
				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif slot0.contextData.map:isEliteEnabled() then
			slot0:setMap(slot0.contextData.map:getBindMap())
		else
			pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
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
	onButton(slot0, slot0.signalBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:displaySignalPanel()
	end, SFX_PANEL)
	setActive(slot0:findTF("lock", slot0.btnSpecial), not pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "EventMediator"))
	setGray(slot0.btnSpecial, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "EventMediator"), true)
	setActive(slot0:findTF("lock", slot0.dailyBtn), not pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "DailyLevelMediator"))
	setGray(slot0.dailyBtn, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "DailyLevelMediator"), true)
	setActive(slot0:findTF("lock", slot0.militaryExerciseBtn), not pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "MilitaryExerciseMediator"))
	setGray(slot0.militaryExerciseBtn, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "MilitaryExerciseMediator"), true)
	setActive(slot0.shamBtn, not ChapterConst.ActivateMirror and getProxy(ChapterProxy).getShamChapter(slot6):isOpen())

	if slot8 then
		setText(slot0:findTF("day", slot0.shamBtn), slot7:getRestDays())
	end

	setActive(slot0:findTF("lock", slot0.shamBtn), not pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator"))
	setGray(slot0.shamBtn, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "ShamPreCombatMediator"), true)
	slot0:emit(LevelMediator2.ON_EVENT_LIST_UPDATE)

	if slot0.contextData.editEliteChapter then
		slot0:displayFleetEdit(slot0.contextData.editEliteChapter)

		slot0.contextData.editEliteChapter = nil
	end

	for slot15, slot16 in ipairs(getProxy(ContextProxy).getContextByMediator(slot10, LevelMediator2).children) do
		slot0.levelCamIndices = slot0.levelCamIndices + 1

		slot16.onRemoved = function ()
			slot0:onSubLayerClose()
		end
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
	pg.SystemGuideMgr.GetInstance():Play(slot0)
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
		slot6 = false

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyFleet) > 0 then
			slot0.levelStageView:updateStageFleet()
			slot0.levelStageView:updateAmbushRate(slot1.fleet.line, true)

			slot6 = true

			if slot0.grid then
				slot0.grid:RefreshFleetCells()

				slot4 = true
			end
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyChampion) > 0 then
			slot6 = true

			if slot0.grid then
				slot0.grid:updateFleets()
				slot0.grid:clearChampions()
				slot0.grid:initChampions()

				slot5 = true
			end
		elseif bit.band(slot2, ChapterConst.DirtyChampionPosition) > 0 then
			slot6 = true

			if slot0.grid then
				slot0.grid:updateFleets()
				slot0.grid:updateChampions()

				slot5 = true
			end
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
					slot0.grid:updateFleet(slot1.fleets[slot1.findex].id)
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

			slot6 = true

			slot0.levelStageView:updateStageBarrier()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAutoAction) > 0 then
			slot0.levelStageView:tryAutoAction()
		elseif slot4 then
			slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
		elseif slot5 then
			slot0.grid:updateQuadCells(ChapterConst.QuadStateFrozen)
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyCellFlag) > 0 then
			slot0.grid:updateCellFlagList()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyBase) > 0 then
			slot0.levelStageView:UpdateDefenseStatus()
		end

		if slot6 then
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
	--- BLOCK #0 1-24, warpins: 1 ---
	slot1 = slot0.contextData.map:isActivity()
	slot2 = slot0.contextData.map:isRemaster()
	slot3 = slot0.contextData.map:isSkirmish()
	slot4 = slot0.contextData.map:getConfig("type")

	if slot0.battleActivity then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-29, warpins: 1 ---
		slot5 = not slot0.battleActivity:isEnd()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-33, warpins: 2 ---
	slot6 = setActive
	slot7 = slot0.activityBtn

	if not slot1 and not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-37, warpins: 1 ---
		slot8 = slot5
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-39, warpins: 2 ---
		slot8 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-40, warpins: 0 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-48, warpins: 3 ---
	slot6(slot7, slot8)

	if slot0.contextData.map:isEscort() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-52, warpins: 1 ---
		setActive(slot0.activityBtn, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 53-63, warpins: 2 ---
	slot8 = setActive
	slot9 = slot0.signalBtn

	if getProxy(ChapterProxy).getChapterById(slot6, 304) and slot7:isClear() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 69-72, warpins: 1 ---
		if slot4 ~= Map.SCENARIO and slot4 ~= Map.ELITE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 77-78, warpins: 1 ---
			slot10 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 79-79, warpins: 2 ---
			slot10 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 80-88, warpins: 4 ---
	slot8(slot9, slot10)

	slot8 = false
	slot10 = nil

	if ActivityLevelConst.hasExtraMap(slot0.maps) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 89-93, warpins: 1 ---
		slot11 = _.any

		if not slot0.battleActivitys then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 94-94, warpins: 1 ---
			slot12 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 95-97, warpins: 2 ---
		slot8 = slot11(slot12, function (slot0)

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
	--- BLOCK #5 98-99, warpins: 2 ---
	if slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 100-103, warpins: 1 ---
		if slot4 ~= Map.ACT_EXTRA then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 104-105, warpins: 1 ---
			slot11 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 106-106, warpins: 1 ---
			slot11 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 107-133, warpins: 3 ---
	slot12 = slot0.contextData.map:existHardMap()
	slot14 = ActivityLevelConst.isClearMaps(slot13, Map.ACTIVITY_EASY)
	slot15 = ActivityLevelConst.isClearMaps(slot13, Map.ACTIVITY_HARD)
	slot16 = setActive
	slot17 = slot0.actExtraBtn.parent

	if slot8 and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 136-137, warpins: 1 ---
		if not slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 138-139, warpins: 1 ---
			slot18 = not slot2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 140-141, warpins: 1 ---
			slot18 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 142-142, warpins: 0 ---
				slot18 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 143-148, warpins: 5 ---
	slot16(slot17, slot18)

	slot16 = setActive
	slot17 = slot0.actEliteBtn.parent

	if slot12 and (slot4 ~= Map.ACTIVITY_EASY or (not slot5 and not slot2)) and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 159-159, warpins: 1 ---
		slot18 = slot11
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 160-167, warpins: 5 ---
	slot16(slot17, slot18)

	slot16 = setActive
	slot17 = slot0.actNormalBtn.parent

	if (slot4 ~= Map.ACTIVITY_HARD or (not slot5 and not slot2)) and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 174-174, warpins: 1 ---
		slot18 = slot11
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 175-179, warpins: 4 ---
	slot16(slot17, slot18)

	slot16 = setActive
	slot17 = slot0.actExtraRank

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 180-180, warpins: 1 ---
		slot18 = slot11
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 181-186, warpins: 2 ---
	slot16(slot17, slot18)

	slot16 = setActive
	slot17 = slot0.remasterBtn

	if OPEN_REMASTER then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 187-190, warpins: 1 ---
		if slot4 ~= Map.SCENARIO and slot4 ~= Map.ELITE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 195-196, warpins: 1 ---
			slot18 = slot2

			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 197-198, warpins: 0 ---
				slot18 = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 199-199, warpins: 2 ---
			slot18 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 200-207, warpins: 4 ---
	slot16(slot17, slot18)
	setActive(slot0.ticketTxt.parent, slot2)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 208-217, warpins: 1 ---
		setText(slot0.ticketTxt, slot6.remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 218-219, warpins: 2 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 220-226, warpins: 1 ---
		setActive(slot0.eliteQuota, false)
		slot0:updateActivityRes()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 227-233, warpins: 2 ---
	if slot0.contextData.map:getMapTitleNumber() ~= "EX" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 234-235, warpins: 1 ---
		slot16 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 236-236, warpins: 1 ---
		slot16 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 237-240, warpins: 2 ---
	slot17 = setActive
	slot18 = slot0.ptTotal

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 241-242, warpins: 1 ---
		if not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 243-244, warpins: 1 ---
			if slot16 and not ActivityConst.HIDE_PT_PANELS and slot0.ptActivity then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 252-257, warpins: 1 ---
				slot19 = not slot0.ptActivity:isEnd()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 258-259, warpins: 2 ---
			slot19 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 260-260, warpins: 0 ---
				slot19 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 261-265, warpins: 6 ---
	slot17(slot18, slot19)

	slot17 = setActive
	slot18 = slot0.actExchangeShopBtn

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 266-267, warpins: 1 ---
		if not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 268-269, warpins: 1 ---
			if slot16 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 270-273, warpins: 1 ---
				if not ActivityConst.HIDE_PT_PANELS then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 274-275, warpins: 1 ---
					slot19 = slot5
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 276-277, warpins: 2 ---
			slot19 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 278-278, warpins: 0 ---
				slot19 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 279-283, warpins: 5 ---
	slot17(slot18, slot19)

	slot17 = setActive
	slot18 = slot0.eventContainer

	if not slot1 or not slot16 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 286-287, warpins: 2 ---
		slot19 = not slot3
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 288-289, warpins: 1 ---
		slot19 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 290-290, warpins: 0 ---
			slot19 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #17 291-297, warpins: 3 ---
	slot17(slot18, slot19)
	setActive(slot0.mirrorBtn, false)

	if not slot12 or not slot15 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 300-301, warpins: 2 ---
		if not slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 302-303, warpins: 1 ---
			slot17 = slot14
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 304-305, warpins: 1 ---
			slot17 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 306-306, warpins: 0 ---
				slot17 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 307-308, warpins: 4 ---
	if slot8 and slot1 and not slot11 and slot17 then

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

	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 324-331, warpins: 2 ---
	slot0:updateCountDown()
	slot0:registerActBtn()

	if slot1 and not slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 334-337, warpins: 1 ---
		Map.lastMapForActivity = slot0.contextData.mapIdx
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #19 ---

	FLOW; TARGET BLOCK #20



	-- Decompilation error in this vicinity:
	--- BLOCK #20 338-339, warpins: 3 ---
	return
	--- END OF BLOCK #20 ---



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
		--- BLOCK #1 8-20, warpins: 2 ---
		slot0, slot1 = pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator")

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-27, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_OPEN_SHAM)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-35, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 36-36, warpins: 2 ---
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
				--- BLOCK #0 30-40, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-48, warpins: 3 ---
			slot0:setMap(slot0:getBindMap())

			return
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 49-52, warpins: 2 ---
		if slot1() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 53-53, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 54-62, warpins: 2 ---
		if not slot2(Map.ACTIVITY_HARD, slot0.battleActivity.id) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-73, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 74-85, warpins: 2 ---
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
			--- BLOCK #0 38-48, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 49-60, warpins: 2 ---
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
				--- BLOCK #0 30-46, warpins: 1 ---
				slot0 = slot0.maps[slot1:getBindMap()].id

				pg.TipsMgr.GetInstance():ShowTips(i18n("elite_disable_unusable"))
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 47-50, warpins: 3 ---
			if slot2 == Map.ACTIVITY_EASY or slot2 == Map.ACTIVITY_HARD then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 55-60, warpins: 2 ---
				if slot0.maps[slot0 - 1] and not slot3:isClearForActivity() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 66-77, warpins: 1 ---
					pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_map_lock"))

					return
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 78-82, warpins: 2 ---
					if not slot1:isUnlock() then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 83-93, warpins: 1 ---
						pg.TipsMgr.GetInstance():ShowTips(i18n("battle_levelScene_lock_1"))

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
			--- BLOCK #2 94-98, warpins: 4 ---
			if not slot1:isUnlock() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 99-107, warpins: 1 ---
				slot3 = i18n("levelScene_map_lock")

				if slot0.maps[slot0 - 1] and slot4:isClear() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 113-120, warpins: 1 ---
					slot3 = i18n("levelScene_chapter_unlock_tip", slot1:getConfig("level_limit"))
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 121-129, warpins: 3 ---
				pg.TipsMgr.GetInstance():ShowTips(slot3)

				return
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 130-134, warpins: 2 ---
			slot0:setMap(slot0)
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 135-135, warpins: 2 ---
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

slot0.GetMapBuilder = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.mapBuilder and slot0.mapBuilder:GetType() ~= slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		slot0.mapBuilder:Hide()

		slot0.mapBuilder = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-22, warpins: 3 ---
	slot0:GetMapBuilderInBuffer(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot0(slot0)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #1 ---



end

slot0.GetMapBuilderInBuffer = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0.mbDict[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-23, warpins: 1 ---
		slot0.mbDict[slot1] = import("view.level.MapBuilder." .. slot0.correspondingClass[slot1]).New(slot0._tf, slot0)

		slot0.mbDict[slot1]:Load(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0(slot1.mbDict[slot2])

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-27, warpins: 1 ---
		slot2(slot0.mbDict[slot1])
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-29, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateMap = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	playBGM(slot0.contextData.map.getConfig(slot1, "bgm"))
	seriesAsync({
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot1 = nil

			if slot0:isNormalMap() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-10, warpins: 1 ---
				slot1 = slot1.TYPENORMAL
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-16, warpins: 1 ---
				if slot0:isSkirmish() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-19, warpins: 1 ---
					slot1 = slot1.TYPESKIRMISH
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-25, warpins: 1 ---
					if slot0:isEscort() then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 26-27, warpins: 1 ---
						slot1 = slot1.TYPEESCORT
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-35, warpins: 4 ---
			slot2:GetMapBuilder(slot1, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				slot0(slot0)

				return
				--- END OF BLOCK #0 ---



			end)

			return
			--- END OF BLOCK #1 ---



		end,
		function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0.mapBuilder = slot1

			slot1:Update(slot1)
			slot0()

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if slot0:getConfig("bg") and #slot1 > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-28, warpins: 1 ---
				slot1.currentBG = slot1

				GetSpriteFromAtlasAsync("levelmap/" .. slot1, "", function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-6, warpins: 1 ---
					if not IsNil(slot0.map) and slot1 == slot0.currentBG then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 12-17, warpins: 1 ---
						setImageSprite(slot0.map, slot0, true)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 18-18, warpins: 3 ---
					return
					--- END OF BLOCK #1 ---



				end)

				GetComponent(slot1.map, "Image").enabled = true
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 29-37, warpins: 2 ---
				setImageSprite(slot1.map, nil)
				slot1:updateCouldAnimator()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 38-71, warpins: 2 ---
			setActive(slot1.btnPrev, slot2)
			setActive(slot1.btnNext, slot3)

			slot4 = Color.New(0.5, 0.5, 0.5, 1)
			slot5 = setImageColor
			slot6 = slot1.btnPrevCol

			if not slot1.maps[slot0.id - 1] or not slot2:isUnlock() or not Color.white then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 81-81, warpins: 3 ---
				slot7 = slot4
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 82-87, warpins: 2 ---
			slot5(slot6, slot7)

			slot5 = setImageColor
			slot6 = slot1.btnNextCol

			if not slot3 or not slot3:isUnlock() or not Color.white then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 97-97, warpins: 3 ---
				slot7 = slot4
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 98-132, warpins: 2 ---
			slot5(slot6, slot7)
			setActive(slot1:findTF("title_chapter", slot1.topChapter), not slot0:isSkirmish())
			setText(slot1.chapterName, string.split(slot0:getConfig("name"), "||")[1])

			if slot0:isEscort() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 133-142, warpins: 1 ---
				setImageSprite(slot1.chapterNoTitle, GetSpriteFromAtlas("chapterno", "chapterex"), true)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 143-157, warpins: 1 ---
				setImageSprite(slot1.chapterNoTitle, GetSpriteFromAtlas("chapterno", "chapter" .. slot0:getMapTitleNumber()), true)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 158-198, warpins: 2 ---
			setActive(slot1.topChapter:Find("type_chapter"), slot0:isNormalMap())
			setActive(slot1.topChapter:Find("type_escort"), slot0:isEscort())
			setActive(slot1.topChapter:Find("type_skirmish"), slot0:isSkirmish())

			if not slot1.contextData.chapterVO or not slot6.active then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 202-217, warpins: 2 ---
				slot1:updateMapItems()
				slot1:switchDifficulty()
				slot1:updateActivityBtns()
				slot1:updateCouldAnimator()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 218-222, warpins: 2 ---
			if slot1.contextData.openChapterId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 223-234, warpins: 1 ---
				slot1.mapBuilder:TryOpenChapter(slot1.contextData.openChapterId)

				slot1.contextData.openChapterId = nil
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #5 ---

			FLOW; TARGET BLOCK #6



			-- Decompilation error in this vicinity:
			--- BLOCK #6 235-236, warpins: 2 ---
			return
			--- END OF BLOCK #6 ---



		end
	})

	return
	--- END OF BLOCK #0 ---



end

slot0.updateMapItems = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-15, warpins: 0 ---
	for slot4 = 1, slot0.UIFXList.childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-15, warpins: 2 ---
		setActive(slot0.UIFXList:GetChild(slot4 - 1), false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-23, warpins: 1 ---
	if slot0.contextData.map:getConfig("cloud_suffix") == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-28, warpins: 1 ---
		setActive(slot0.clouds, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-39, warpins: 1 ---
		setActive(slot0.clouds, true)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 40-62, warpins: 0 ---
		for slot6, slot7 in ipairs(slot1:getConfig("clouds_pos")) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-60, warpins: 1 ---
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
			--- BLOCK #1 61-62, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 63-69, warpins: 2 ---
	slot0.mapBuilder:UpdateMapItems(slot1)

	return
	--- END OF BLOCK #3 ---



end

slot0.TrySwitchChapter = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if getProxy(ChapterProxy):getActiveChapter() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 1 ---
		if slot3.id == slot1.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-17, warpins: 1 ---
			slot0:switchToChapter(slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-33, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_strategying", slot3:getConfig("chapter_name")))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-37, warpins: 1 ---
		slot0:displayChapterPanel(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-38, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateChapterTF = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.mapBuilder:UpdateChapterTF(slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.tryPlayMapStory = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if slot0.contextData.map:getConfig("enter_story") and slot1 ~= "" and not pg.SystemOpenMgr.GetInstance().active then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-27, warpins: 1 ---
		pg.StoryMgr.GetInstance():Play(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if not slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-11, warpins: 1 ---
				if slot0.contextData.map:getConfig("guide_id") and slot1 ~= "" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 14-22, warpins: 1 ---
					pg.SystemGuideMgr.GetInstance():PlayByGuideId(slot1)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 23-33, warpins: 2 ---
					pg.SystemOpenMgr.GetInstance():notification(slot0.player.level)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-43, warpins: 1 ---
				pg.SystemOpenMgr.GetInstance():notification(slot0.player.level)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 44-44, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-36, warpins: 3 ---
		pg.SystemOpenMgr.GetInstance():notification(slot0.player.level)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 37-38, warpins: 2 ---
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
	--- BLOCK #0 1-14, warpins: 1 ---
	function slot3(slot0)

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
			--- BLOCK #0 44-55, warpins: 1 ---
			slot6 = slot0
			slot5 = slot0.displayFleetSelect
			slot7 = slot3

			if #slot3:getNpcShipByType(1) <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-57, warpins: 1 ---
				slot8 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 58-58, warpins: 1 ---
				slot8 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 59-59, warpins: 2 ---
			slot5(slot6, slot7, slot8)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 60-60, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end

	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideChapterPanel()

		return
		--- END OF BLOCK #0 ---



	end

	if Map.IsType(slot1:getConfig("map"), Map.SKIRMISH) and #slot1:getNpcShipByType(1) > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-27, warpins: 1 ---
		slot3(false)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-54, warpins: 3 ---
	slot0.levelInfoView = LevelInfoView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelInfoView:Load()
	slot0.levelInfoView:ActionInvoke("set", slot1, slot2)
	slot0.levelInfoView:ActionInvoke("setCBFunc", slot3, slot4)

	return
	--- END OF BLOCK #1 ---



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

slot0.displayFleetSelect = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-7, warpins: 1 ---
		if slot1:isValid() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-12, warpins: 1 ---
			slot0:trackChapter(slot1, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-12, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_TRACKING, slot1.id, {}, slot1.loopFlag)

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-20, warpins: 2 ---
		slot0.contextData.selectedChapterVO = nil
		slot0.contextData.selectedFleetIDs = nil

		return
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-25, warpins: 2 ---
	slot3 = nil

	if slot0.contextData.selectedFleetIDs then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-28, warpins: 1 ---
		slot3 = slot0.contextData.selectedFleetIDs
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-34, warpins: 1 ---
		slot3 = slot1:selectFleets(slot0.lastFleetIndex, slot0.fleets)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-70, warpins: 2 ---
	slot0.levelFleetView = LevelFleetView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelFleetView:Load()
	slot0.levelFleetView:ActionInvoke("setOpenCommanderTag", slot0.openedCommanerSystem)
	slot0.levelFleetView:ActionInvoke("set", slot1, slot0.fleets, slot3)
	slot0.levelFleetView:ActionInvoke("setCBFunc", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0:isTriesLimit() and not slot0:enoughTimes2Start() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-23, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_elite_no_quota"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 24-32, warpins: 2 ---
		if #slot0:getNpcShipByType(2) > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-73, warpins: 1 ---
			slot2 = {
				[TeamType.Vanguard] = #slot1.fleets[slot0[1]]:getTeamByName(Fleet.VANGUARD),
				[TeamType.Main] = #slot1.fleets[slot0[1]]:getTeamByName(Fleet.MAIN)
			}
			slot3 = {
				[TeamType.Vanguard] = 0,
				[TeamType.Main] = 0
			}
			slot4 = nil

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 74-89, warpins: 0 ---
			for slot8, slot9 in ipairs(slot1) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 74-86, warpins: 1 ---
				slot4 = slot9
				slot10 = slot9:getTeamType()
				slot3[slot10] = slot3[slot10] + 1

				if slot2[slot10] + slot3[slot10] > 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 87-87, warpins: 1 ---
					break
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 88-89, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 90-93, warpins: 2 ---
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 94-111, warpins: 0 ---
			for slot8, slot9 in pairs(slot2) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 94-98, warpins: 1 ---
				if slot9 + slot3[slot8] > 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 99-109, warpins: 1 ---
					slot1:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("chapter_tip_with_npc", slot4.name)
					})

					return
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 110-111, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 112-117, warpins: 2 ---
		slot2 = false
		slot3 = ""

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 118-130, warpins: 0 ---
		for slot7, slot8 in ipairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 118-127, warpins: 1 ---
			slot2, slot3 = slot1.fleets[slot8]:GetEnergyStatus()

			if slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 128-128, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 129-130, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 131-133, warpins: 2 ---
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
			--- BLOCK #0 134-141, warpins: 1 ---
			slot1:HandleShowMsgBox({
				content = slot3,
				onYes = slot4
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 142-143, warpins: 1 ---
			slot4()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 144-153, warpins: 2 ---
		slot1.contextData.selectedChapterVO = nil
		slot1.contextData.selectedFleetIDs = nil

		return
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 154-154, warpins: 2 ---
		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 155-155, warpins: 2 ---
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
	--- END OF BLOCK #2 ---



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
		--- BLOCK #0 10-13, warpins: 1 ---
		slot3 = slot0.contextData.map

		if slot1 and slot0.levelFleetView.chapter.id == slot1.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-25, warpins: 1 ---
			slot0.levelFleetView:ActionInvoke("setOnHard", slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-27, warpins: 3 ---
		if slot1 and slot0.levelCMDFormationView and slot0.levelCMDFormationView:GetLoaded() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 37-46, warpins: 1 ---
			slot0.levelCMDFormationView:ActionInvoke("updateFleet", slot1:wrapEliteFleet(slot2))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 47-47, warpins: 6 ---
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
	--- BLOCK #2 86-90, warpins: 2 ---
	slot0.mapBuilder:RefreshMapItems()

	return
	--- END OF BLOCK #2 ---



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
	--- BLOCK #0 1-13, warpins: 1 ---
	slot4 = slot0.contextData.map:getConfig("type")

	if (slot1:getDataType() == ChapterConst.TypeSham and slot4 ~= Map.SHAM) or (slot3 == ChapterConst.TypeGuild and slot4 ~= Map.GUILD_BOSS) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-29, warpins: 2 ---
		slot0.contextData.chapterMapIdx = slot0.contextData.mapIdx
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-37, warpins: 3 ---
	if slot0.contextData.mapIdx ~= slot1:getConfig("map") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-44, warpins: 1 ---
		slot0:setMap(slot1:getConfig("map"))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 45-101, warpins: 2 ---
	slot0:setChapter(slot1)
	setActive(slot0.clouds, false)
	slot0.mapBuilder:Hide()

	slot0.leftCanvasGroup.blocksRaycasts = false
	slot0.rightCanvasGroup.blocksRaycasts = false

	slot0:onSubLayerContextChange()

	slot0.levelStageView = LevelStageView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelStageView:Load()
	slot0:frozen(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0.levelStageView:tryAutoAction(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0.levelStageView:DoSafeCheckOnBegin()

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end)
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

	if slot1:getMapType() == Map.ESCORT and OPEN_ESCORT and (#slot3.escortMaps == 0 or _.any(slot4, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		return slot0:shouldFetch()
		--- END OF BLOCK #0 ---



	end)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-41, warpins: 2 ---
		slot0:emit(LevelMediator2.ON_FETCH_ESCORT)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 42-51, warpins: 4 ---
	if slot3.subNextReqTime < pg.TimeMgr.GetInstance():GetServerTime() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-58, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_FETCH_SUB_CHAPTER)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 59-103, warpins: 2 ---
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
		if not slot0.contextData.chapterVO and slot0.levelStageView then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-14, warpins: 1 ---
			slot0.levelStageView:Destroy()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-19, warpins: 3 ---
		slot0:unfrozen()

		return
		--- END OF BLOCK #1 ---



	end)):setEase(LeanTweenType.easeOutSine).uniqueId)

	if not slot0.lastRecordPivot then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 104-105, warpins: 1 ---
		slot5 = Vector2.zero
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 106-186, warpins: 2 ---
	slot6 = LeanTween.value(go(slot0.map), slot0.map.pivot, slot5, slot0)

	slot6:setOnUpdateVector2(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0.map.pivot = slot0
		slot0.float.pivot = slot0

		return
		--- END OF BLOCK #0 ---



	end):setEase(LeanTweenType.easeOutSine)
	slot0:RecordTween("mapPivot", slot6.uniqueId)
	setActive(slot0.topChapter, true)
	setActive(slot0.leftChapter, true)
	setActive(slot0.rightChapter, true)
	shiftPanel(slot0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	slot0.levelStageView:ShiftStagePanelOut()

	if slot0.contextData.map:getConfig("bg") and #slot7 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 191-205, warpins: 1 ---
		slot0.currentBG = slot7

		GetSpriteFromAtlasAsync("levelmap/" .. slot7, "", function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			if not IsNil(slot0.map) and slot1 == slot0.currentBG then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-17, warpins: 1 ---
				setImageSprite(slot0.map, slot0, true)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 18-18, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)

		GetComponent(slot0.map, "Image").enabled = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 206-212, warpins: 2 ---
		setImageSprite(slot0.map, nil)
		slot0:updateCouldAnimator()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 213-232, warpins: 2 ---
	playBGM(slot0.contextData.map:getConfig("bgm"))
	pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)

	if slot0.ambushWarning and slot0.ambushWarning.activeSelf then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 237-244, warpins: 1 ---
		slot0.ambushWarning:SetActive(false)
		slot0:unfrozen()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 245-255, warpins: 3 ---
	slot0:onSubLayerContextChange()
	slot0:setChapter(nil)

	if slot2 == ChapterConst.TypeSham then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 256-270, warpins: 1 ---
		slot0.contextData.mapIdx = slot0.contextData.chapterMapIdx
		slot0.contextData.chapterMapIdx = nil

		slot0:setMap(slot0:selectMap(slot0.maps))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 271-274, warpins: 1 ---
		if slot2 == ChapterConst.TypeNone then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 275-286, warpins: 1 ---
			slot0:updateMapItems()
			slot0:switchDifficulty()
			slot0:updateActivityBtns()
			slot0:updateCouldAnimator()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 287-288, warpins: 3 ---
	return
	--- END OF BLOCK #7 ---



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
		--- BLOCK #0 1-49, warpins: 1 ---
		slot0.ambushWarning:SetActive(true)

		slot0 = tf(slot0.ambushWarning)

		slot0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
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
			--- BLOCK #0 18-28, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_rmb"))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-50, warpins: 3 ---
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
	--- BLOCK #0 1-83, warpins: 1 ---
	setActive(slot0.uiMain, true)

	slot0.levelGrid.localEulerAngles = Vector3(slot0.contextData.chapterVO.theme.angle, 0, 0)
	slot0.grid = LevelGrid.New(slot0.dragLayer)

	slot0.grid:attach(slot0)
	slot0.grid:setItems(slot0.shipTpl, slot0.subTpl, slot0.transportTpl, slot0.transportTargetTpl, slot0.enemyTpl, slot0.deadTpl, slot0.boxTpl, slot0.supplyTpl, slot0.rivalTpl, slot0.championTpl, slot0.spineTpl, slot0.oniTpl, slot0.oniTargetTpl, slot0.bombEnemyTpl, slot0.arrowTarget)
	slot0.grid:ExtendItem("barrierTpl", slot0.barrierTpl)
	slot0.grid:ExtendItem("dockTpl", slot0.dockTpl)
	slot0.grid:ExtendItem("destinationMarkTpl", slot0.destinationMarkTpl)
	slot0.grid:ExtendItem("antiairgunTpl", slot0.antiairgunTpl)
	slot0.grid:ExtendItem("antiairgunareaTpl", slot0.antiairgunareaTpl)

	slot0.grid.onCellClick = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:clickGridCell(slot0)

		return
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.chapterVO.getDataType(slot1) == ChapterConst.TypeNone then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 84-86, warpins: 1 ---
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
	--- BLOCK #1 87-101, warpins: 2 ---
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
	--- BLOCK #0 1-9, warpins: 1 ---
	if pg.GuideMgr.GetInstance():isRuning() and slot0.contextData.chapterVO:findChapterCell(ChapterConst.AttachBoss) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-23, warpins: 1 ---
		slot0.grid:focusOnCell(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-24, warpins: 3 ---
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
		--- BLOCK #0 1-40, warpins: 1 ---
		slot0.playing = true

		slot0:frozen()
		slot0.frozen.airStrike:SetActive(true)

		slot0 = tf(slot0.airStrike)

		slot0:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		slot0:SetAsLastSibling()

		slot2 = slot0:Find("words/be_striked")

		if setActive ~= ChapterConst.SubjectChampion then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-42, warpins: 1 ---
			slot3 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-43, warpins: 1 ---
			slot3 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 44-54, warpins: 2 ---
		slot1(slot2, slot3)

		slot2 = slot0:Find("words/strike_enemy")

		if setActive ~= ChapterConst.SubjectPlayer then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 55-56, warpins: 1 ---
			slot3 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-57, warpins: 1 ---
			slot3 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 58-70, warpins: 2 ---
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
			--- BLOCK #0 71-77, warpins: 1 ---
			onButton(slot0, slot0, slot1, SFX_PANEL)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 78-80, warpins: 1 ---
			removeOnButton(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 81-84, warpins: 2 ---
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
		--- BLOCK #0 1-27, warpins: 1 ---
		slot0.playing = true

		slot0:frozen()
		slot0:SetActive(true)

		slot0 = tf(slot0)

		slot0:SetParent(slot0.topPanel, false)
		slot0:SetAsLastSibling()

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-30, warpins: 1 ---
			slot2(slot2)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 31-42, warpins: 2 ---
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0.playing = false

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-9, warpins: 1 ---
				slot1(slot2)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-14, warpins: 2 ---
			slot0:unfrozen()

			return
			--- END OF BLOCK #1 ---



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
		--- BLOCK #0 1-132, warpins: 1 ---
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
		slot1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		slot1:SetAsLastSibling()

		slot5 = slot1:GetComponent("DftAniEvent")
		slot6 = slot3:GetComponent("SpineAnimUI")

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

		slot6:GetComponent("SkeletonGraphic").freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(slot5:getPrefab(), slot3)
		setActive(slot0, false)

		slot0.playing = false

		slot0:unfrozen()

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 133-134, warpins: 1 ---
			slot6()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 135-136, warpins: 2 ---
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
		--- BLOCK #0 1-12, warpins: 1 ---
		Ship.SetExpression(slot0, slot1:getPainting())
		slot0()

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

slot0.doPlayEnemyAnim = function (slot0, slot1, slot2, slot3)

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
	--- BLOCK #1 5-28, warpins: 2 ---
	slot0.strikeAnims = slot4
	slot4, slot5 = nil

	function slot6()

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

	slot5 = coroutine.create(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-113, warpins: 1 ---
		slot0.playing = true

		slot0:frozen()
		setActive(slot0, true)

		slot1 = tf(slot0)
		slot2 = findTF(slot1, "torpedo")
		slot3 = findTF(slot1, "ship")

		setParent(slot2, slot3, false)
		setActive(slot3, false)
		setActive(slot2, false)
		slot1:SetParent(pg.UIMgr.GetInstance().OverlayMain.transform, false)
		slot1:SetAsLastSibling()

		slot4 = slot1:GetComponent("DftAniEvent")
		slot5 = slot2:GetComponent("SpineAnimUI")

		slot4:SetStartEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			slot0:SetAction("attack", 0)

			slot0.SetAction.freeze = true

			return
			--- END OF BLOCK #0 ---



		end)
		slot4:SetTriggerEvent(function (slot0)

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
		slot4:SetEndEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0.freeze = false

			slot0()

			return
			--- END OF BLOCK #0 ---



		end)
		onButton(slot0, slot1, slot3, SFX_CANCEL)
		coroutine.yield()

		slot5:GetComponent("SkeletonGraphic").freeze = false

		PoolMgr.GetInstance():ReturnSpineChar(slot4:getPrefab(), slot2)
		setActive(slot0, false)

		slot0.playing = false

		slot0:unfrozen()

		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 114-115, warpins: 1 ---
			slot5()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 116-117, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0.strikeAnims[slot1] and slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-11, warpins: 1 ---
			slot3()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end

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
		--- BLOCK #0 29-37, warpins: 1 ---
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
	--- BLOCK #2 38-39, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



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

slot0.ShowCurtains = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0.curtain, slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.ClearLoadedTemplates = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-16, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.loadedTpls) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		if not IsNil(slot5) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-14, warpins: 1 ---
			slot0.Destroy(slot5, true)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-19, warpins: 1 ---
	slot0.loadedTpls = nil

	return
	--- END OF BLOCK #2 ---



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
	--- BLOCK #1 5-7, warpins: 2 ---
	if (count ~= -1 or not slot0.frozenCount) and not count then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		slot1 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-21, warpins: 3 ---
	slot0.frozenCount = slot0.frozenCount - slot1
	slot2 = slot0.canvasGroup

	if slot0.frozenCount ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-23, warpins: 1 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-24, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 25-28, warpins: 2 ---
	slot2.blocksRaycasts = slot3

	if slot0.frozenCount == 0 and slot0.fcall then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-36, warpins: 1 ---
		slot0.fcall = nil

		slot0.fcall()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 37-37, warpins: 3 ---
	return
	--- END OF BLOCK #4 ---



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
		--- BLOCK #0 11-20, warpins: 1 ---
		slot0.levelCam.enabled = true

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-21, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.disableLevelCamera = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.levelCamIndices = slot0.levelCamIndices + 1

	if slot0.levelCamIndices > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-17, warpins: 1 ---
		slot0.levelCam.enabled = false

		pg.LayerWeightMgr.GetInstance():switchOriginParent()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-18, warpins: 2 ---
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
	--- BLOCK #0 1-4, warpins: 1 ---
	slot4 = nil
	slot5 = slot2.id

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
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

				slot0:emit(LevelMediator2.ON_SELECT_COMMANDER, slot0.pos, slot2.id, )
				slot0:closeCommanderPanel()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-46, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_SELECT,
					data = slot0,
					fleetId = slot2.id,
					chapterId = slot1
				}, )
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 47-47, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
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

				slot0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, slot0.emit, slot0.pos, )
				slot0:closeCommanderPanel()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-45, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_COMMANDER_OP, {
					FleetType = LevelUIConst.FLEET_TYPE_EDIT,
					data = slot0,
					index = slot1,
					chapterId = slot2
				}, )
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



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-33, warpins: 2 ---
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

slot0.updateVoteBookBtn = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-6, warpins: 1 ---
		slot2 = not slot1:IsExpired()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-15, warpins: 2 ---
	setActive(slot0._voteBookBtn, slot2)
	slot0:RemoveVoteBookTimer()

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-47, warpins: 1 ---
		onButton(slot0, slot0._voteBookBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_VOTE_BOOK)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		slot3 = slot0._voteBookBtn:Find("tip/Text"):GetComponent(typeof(Text))
		slot0.voteBookTimer = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0.text = slot1:GetCDTime()

			return
			--- END OF BLOCK #0 ---



		end, 1, -1)

		slot0.voteBookTimer:Start()
		slot0.voteBookTimer.func()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 48-49, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.RemoveVoteBookTimer = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.voteBookTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.voteBookTimer:Stop()

		slot0.voteBookTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:RemoveVoteBookTimer()

	if slot0.contextData.chapterVO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-16, warpins: 1 ---
		pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-22, warpins: 2 ---
	slot0:ClearLoadedTemplates()

	if slot0.levelFleetView and slot0.levelFleetView.selectIds then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-34, warpins: 1 ---
		slot0.contextData.selectedFleetIDs = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 35-49, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.levelFleetView.selectIds) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-38, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 39-47, warpins: 0 ---
			for slot9, slot10 in pairs(slot5) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-45, warpins: 1 ---
				slot0.contextData.selectedFleetIDs[#slot0.contextData.selectedFleetIDs + 1] = slot10
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 46-47, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 48-49, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-52, warpins: 3 ---
	if slot0.levelStageView then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-56, warpins: 1 ---
		slot0.levelStageView:Destroy()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 57-136, warpins: 2 ---
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
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "cell_quad")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "cell")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad_mark", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell_quad", "")
	PoolMgr.GetInstance():DestroyPrefab("chapter/cell", "")

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 137-141, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.mbDict) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 137-139, warpins: 1 ---
		slot5:Destroy()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 140-141, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 142-147, warpins: 1 ---
	slot0.mbDict = nil

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 148-154, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.mapItemTimer) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 148-149, warpins: 1 ---
		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 150-152, warpins: 1 ---
			slot5:Stop()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 153-154, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 155-160, warpins: 1 ---
	slot0.mapItemTimer = nil

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 161-166, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.tweens) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 161-164, warpins: 1 ---
		LeanTween.cancel(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 165-166, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 167-171, warpins: 1 ---
	slot0.tweens = nil

	if slot0.cloudTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 172-178, warpins: 1 ---
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

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 179-181, warpins: 2 ---
	if slot0.newChapterCDTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 182-187, warpins: 1 ---
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 188-190, warpins: 2 ---
	if slot0.resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 191-196, warpins: 1 ---
		slot0.resPanel:exit()

		slot0.resPanel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 197-199, warpins: 2 ---
	if slot0.activityBossBattlePanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 200-203, warpins: 1 ---
		slot0.activityBossBattlePanel:clear()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 204-248, warpins: 2 ---
	LeanTween.cancel(go(slot0.damageText))

	slot0.map.localScale = Vector3.one
	slot0.map.pivot = Vector2(0.5, 0.5)
	slot0.float.localScale = Vector3.one
	slot0.float.pivot = Vector2(0.5, 0.5)

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
		--- BLOCK #0 249-255, warpins: 1 ---
		if slot0.contextData.map:NeedRecordMap() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 256-261, warpins: 1 ---
			slot1:recordLastMap(ChapterProxy.LAST_MAP, slot2.id)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 262-265, warpins: 2 ---
		if Map.lastMapForActivity then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 266-272, warpins: 1 ---
			slot1:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, Map.lastMapForActivity)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 273-273, warpins: 3 ---
	return
	--- END OF BLOCK #14 ---



end

return slot0
