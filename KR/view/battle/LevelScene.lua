slot0 = class("LevelScene", import("..base.BaseUI"))
slot1 = 0.5

function slot0.getUIName(slot0)
	return "LevelMainScene"
end

function slot0.preload(slot0, slot1)
	slot0.maps = getProxy(ChapterProxy):getMaps()

	if slot0.maps[slot0:selectMap(slot2)]:getConfig("bg") and #slot5 > 0 then
		GetSpriteFromAtlasAsync("levelmap/" .. slot4:getConfig("bg"), "", slot1)
	elseif slot4:getConfig("animtor") == 1 then
		LoadAndInstantiateAsync("ui", slot4:getConfig("ani_name"), function (slot0)
			slot0:SetActive(false)

			uv0.tornadoTF = slot0
			uv0.aniName = uv1

			uv2()
		end)
	end
end

function slot0.init(slot0)
	slot0:initData()
	slot0:initUI()
	slot0:initEvents()
	slot0:updateClouds()
end

function slot0.initData(slot0)
	slot0.tweens = {}
	slot0.mapItemTimer = {}
	slot0.mapWidth = 1920
	slot0.mapHeight = 1440
	slot0.levelCamIndices = 1
	slot0.frozenCount = 0
	slot0.contextData.huntingRangeVisibility = 2
end

function slot0.initUI(slot0)
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

function slot0.initEvents(slot0)
	slot0:bind(LevelUIConst.OPEN_COMMANDER_PANEL, function (slot0, slot1, slot2, slot3)
		uv0:openCommanderPanel(slot1, slot2, slot3)
	end)
	slot0:bind(LevelUIConst.TRACK_CHAPTER, function (slot0, slot1, slot2)
		uv0:trackChapter(slot1, slot2)
	end)
	slot0:bind(LevelUIConst.HANDLE_SHOW_MSG_BOX, function (slot0, slot1)
		uv0:HandleShowMsgBox(slot1)
	end)
	slot0:bind(LevelUIConst.DO_AMBUSH_WARNING, function (slot0, slot1)
		uv0:doAmbushWarning(slot1)
	end)
	slot0:bind(LevelUIConst.DISPLAY_AMBUSH_INFO, function (slot0, slot1)
		uv0:displayAmbushInfo(slot1)
	end)
	slot0:bind(LevelUIConst.DISPLAY_STRATEGY_INFO, function (slot0, slot1)
		uv0:displayStrategyInfo(slot1)
	end)
	slot0:bind(LevelUIConst.FROZEN, function (slot0, slot1)
		uv0:frozen(slot1)
	end)
	slot0:bind(LevelUIConst.UN_FROZEN, function (slot0)
		uv0:unfrozen()
	end)
	slot0:bind(LevelUIConst.IS_FROZEN, function (slot0)
		uv0.levelStageView.isFrozen = uv0:isfrozen()
	end)
	slot0:bind(LevelUIConst.DESTROY_LEVEL_STAGE_VIEW, function (slot0)
		uv0.levelStageView:Destroy()
	end)
	slot0:bind(LevelUIConst.DO_TRACKING, function (slot0, slot1)
		uv0:doTracking(slot1)
	end)
	slot0:bind(LevelUIConst.SWITCH_TO_MAP, function ()
		uv0:switchToMap()
	end)
	slot0:bind(LevelUIConst.DISPLAY_REPAIR_WINDOW, function (slot0, slot1)
		uv0:displayRepairWindow(slot1)
	end)
end

function slot0.updateBattleActivitys(slot0, slot1)
	slot0.battleActivitys = slot1
end

function slot0.updateBattleActivity(slot0, slot1)
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

function slot0.updatePtActivity(slot0, slot1)
	slot0.ptActivity = slot1

	slot0:updateActivityRes()
end

function slot0.updateActivityRes(slot0)
	if findTF(slot0.ptTotal, "Text") and findTF(slot0.ptTotal, "icon/Image") and slot0.ptActivity then
		setText(slot1, "x" .. slot0.ptActivity.data1)
		GetImageSpriteFromAtlasAsync(pg.item_data_statistics[id2ItemId(tonumber(slot0.ptActivity:getConfig("config_id")))].icon, "", findTF(slot0.ptTotal, "icon/Image"), true)
	end
end

function slot0.updateBossBattleAct(slot0, slot1)
	slot0.bossBattleActivity = slot1

	if slot0.activityBossBattlePanel then
		slot0.activityBossBattlePanel:update(slot0.bossBattleActivity)
	end
end

function slot0.didEnter(slot0)
	slot0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "CommandRoomMediator")

	onButton(slot0, slot0:findTF("back_button", slot0.topChapter), function ()
		if uv0.contextData.map and (slot0:isActivity() or slot0:isEscort()) then
			uv0:emit(LevelMediator2.ON_SWITCH_NORMAL_MAP)

			return
		else
			uv0:emit(uv1.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnSpecial, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
	end, SFX_PANEL)
	onButton(slot0, slot0.dailyBtn, function ()
		if uv0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		uv0:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
	onButton(slot0, slot0.militaryExerciseBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:emit(LevelMediator2.ON_OPEN_MILITARYEXERCISE)
	end, SFX_PANEL)
	onButton(slot0, slot0.shamBtn, function ()
		if uv0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(uv0.player.level, "ShamPreCombatMediator")

		if slot0 then
			uv0:emit(LevelMediator2.ON_OPEN_SHAM)
		else
			pg.TipsMgr:GetInstance():ShowTips(slot1)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.normalBtn:Find("bg"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:setMap(uv0.contextData.map:getBindMap())
	end, SFX_PANEL)
	onButton(slot0, slot0.eliteBtn:Find("bg"), function ()
		if uv0:isfrozen() then
			return
		end

		if uv0.contextData.map:getBindMap() == 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unusable"))

			if getProxy(ChapterProxy):getUseableMaxEliteMap() then
				uv0:setMap(slot1.configId)
				pg.TipsMgr:GetInstance():ShowTips(i18n("elite_warp_to_latest_map"))
			end
		elseif uv0.contextData.map:isEliteEnabled() then
			uv0:setMap(uv0.contextData.map:getBindMap())
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unsatisfied"))
		end
	end, SFX_UI_WEIGHANCHOR_HARD)
	onButton(slot0, slot0.remasterBtn:Find("bg"), function ()
		if uv0:isfrozen() then
			return
		end

		uv0:displayRemasterPanel()
		getProxy(ChapterProxy):setRemasterTip(false)
		SetActive(uv0.remasterTipTF, false)
	end, SFX_PANEL)
	onButton(slot0, slot0.escortBtn, function ()
		if uv0:isfrozen() then
			return
		end

		slot0, slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(uv0.player.level, "Escort")

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		if not uv0.contextData.map:isEscort() then
			if #getProxy(ChapterProxy).escortMaps == 0 or _.any(slot4, function (slot0)
				return slot0:shouldFetch()
			end) then
				uv0:emit(LevelMediator2.ON_FETCH_ESCORT)
			else
				uv0:setMap(slot4[1].id)
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.signalBtn, function ()
		if uv0:isfrozen() then
			return
		end

		uv0:displaySignalPanel()
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

	setActive(slot0.shamBtn, not ChapterConst.ActivateMirror and getProxy(ChapterProxy).getShamChapter(slot4):isOpen())

	if not ChapterConst.ActivateMirror and getProxy(ChapterProxy).getShamChapter(slot4).isOpen() then
		setText(slot0:findTF("day", slot0.shamBtn), slot5:getRestDays())
	end

	setActive(slot0:findTF("lock", slot0.shamBtn), not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "ShamPreCombatMediator"))
	setGray(slot0.shamBtn, not pg.SystemOpenMgr.GetInstance().isOpenSystem(slot0.player.level, "ShamPreCombatMediator"), true)
	slot0:emit(LevelMediator2.ON_EVENT_LIST_UPDATE)

	if slot0.contextData.editEliteChapter then
		slot0:displayFleetEdit(slot0.contextData.editEliteChapter)

		slot0.contextData.editEliteChapter = nil
	end

	for slot13, slot14 in ipairs(getProxy(ContextProxy).getContextByMediator(slot8, LevelMediator2).children) do
		function slot14.onRemoved()
			uv0:onSubLayerClose()
		end
	end

	if #slot9.children > 0 then
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

	if slot4:ifShowRemasterTip() then
		SetActive(slot0.remasterTipTF, true)
	else
		SetActive(slot0.remasterTipTF, false)
	end

	if slot0.contextData.open_remaster then
		slot0:displayRemasterPanel(slot0.contextData.open_remaster)

		slot0.contextData.open_remaster = nil
	end
end

function slot0.tryPlaySubGuide(slot0)
	slot1 = false

	if slot0.subRefreshCount > 0 and slot0.player.level >= 20 then
		if not pg.StoryMgr:GetInstance():IsPlayed("NG001") and getProxy(ChapterProxy).getChapterById(slot2, 304):isClear() then
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
		if getProxy(TaskProxy):getTaskById(10302) and slot2:isFinish() and not slot2:isReceive() and getProxy(FleetProxy):getFleetById(11):isEmpty() then
			if getProxy(ChapterProxy):getActiveChapter() then
				slot0:switchToMap()
			end

			pg.StoryMgr:GetInstance():PlayGuide("NG002", _.any(getProxy(BayProxy):getShips(), function (slot0)
				return slot0 and slot0.configId == 308031
			end) and {
				2
			} or {
				2,
				1
			})

			slot1 = true
		end
	end
end

function slot0.onBackPressed(slot0)
	if slot0:isfrozen() or slot0.levelAmbushView and slot0.levelAmbushView:CheckState(BaseSubView.STATES.INITED) then
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

function slot0.selectMap(slot0, slot1)
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

function slot0.setMaps(slot0, slot1)
	slot0.maps = slot1

	slot0:initMapBtn(slot0.btnPrev, -1)
	slot0:initMapBtn(slot0.btnNext, 1)
	slot0:setMap(slot0:selectMap(slot1))
end

function slot0.setShipGroups(slot0, slot1)
	slot0.shipGroups = slot1
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.updateRes(slot0, slot1)
	slot0.resPanel:setResources(slot1)

	if slot0.levelStageView and slot0.levelStageView:CheckState(BaseSubView.STATES.INITED) then
		slot0.levelStageView:SetPlayer(slot1)
	end

	slot0.player = slot1
end

function slot0.setEliteQuota(slot0, slot1, slot2)
	slot3 = slot2 - slot1

	if slot1 == slot2 then
		slot0:findTF("bg/Text", slot0.eliteQuota):GetComponent(typeof(Text)).color = Color.red
	else
		slot5.color = Color.New(0.47, 0.89, 0.27)
	end

	slot5.text = slot3 .. "/" .. slot2
end

function slot0.updateSubInfo(slot0, slot1, slot2)
	slot0.subRefreshCount = slot1
	slot0.subProgress = slot2

	setText(slot0.signalBtn:Find("nums"), slot0.subRefreshCount)
end

function slot0.updateLastFleet(slot0, slot1)
	slot0.lastFleetIndex = slot1
end

function slot0.updateEvent(slot0, slot1)
	setActive(slot0:findTF("tip", slot0.btnSpecial), slot1:hasFinishState())
end

function slot0.updateFleet(slot0, slot1)
	slot0.fleets = slot1
end

function slot0.updateChapterVO(slot0, slot1, slot2)
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

function slot0.updateClouds(slot0)
	slot0.cloudRTFs = {}
	slot0.cloudRects = {}
	slot0.cloudTimer = {}

	for slot4 = 1, 6, 1 do
		table.insert(slot0.cloudRTFs, slot6)
		table.insert(slot0.cloudRects, rtf(slot5).rect.width)
	end

	slot0:initCloudsPos()

	for slot4, slot5 in ipairs(slot0.cloudRTFs) do
		slot10 = nil
		LeanTween.moveX(slot5, slot0.mapWidth, slot9):setRepeat(-1):setOnCompleteOnRepeat(true):setOnComplete(System.Action(function ()
			uv0 = uv1.cloudRects[uv2]
			uv3.anchoredPosition = Vector2(-uv0, uv4.y)

			uv5:setFrom(-uv0):setTime((uv1.mapWidth + uv0) / uv6)
		end)).passed = math.random() * (slot0.mapWidth + slot0.cloudRects[slot4]) / (30 - slot0.initPositions[slot4] or Vector2(0, 0).y / 20)
		slot0.cloudTimer[slot4] = LeanTween.moveX(slot5, slot0.mapWidth, slot9).setRepeat(-1).setOnCompleteOnRepeat(true).setOnComplete(System.Action(function ()
			uv0 = uv1.cloudRects[uv2]
			uv3.anchoredPosition = Vector2(-uv0, uv4.y)

			uv5.setFrom(-uv0).setTime((uv1.mapWidth + uv0) / uv6)
		end)).uniqueId
	end
end

function slot0.updateCouldAnimator(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-77, warpins: 1 ---
	if slot0.contextData.map:getConfig("animtor") == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-66, warpins: 1 ---
		if slot0.tornadoTF and slot0.aniName ~= slot0.contextData.map:getConfig("ani_name") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-23, warpins: 1 ---
			slot0:destroyCloudAnimator()
			--- END OF BLOCK #0 ---



		end

		function slot2()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-32, warpins: 1 ---
			uv0.tornadoTF.transform.localScale = Vector3(uv0.tornadoTF.transform.parent.rect.width / uv0.tornadoTF.transform.rect.width, uv0.tornadoTF.transform.parent.rect.height / uv0.tornadoTF.transform.rect.height, 1)

			return
			--- END OF BLOCK #0 ---



		end

		if IsNil(slot0.tornadoTF) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-45, warpins: 1 ---
			if slot0.animtorLoading then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-34, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			slot0.animtorLoading = slot1

			PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-66, warpins: 1 ---
				if not uv0.contextData then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-5, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end

				if uv0.animtorLoading ~= uv0.contextData.map:getConfig("ani_name") then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-20, warpins: 1 ---
					uv0.animtorLoading = nil

					return
					--- END OF BLOCK #0 ---



				end

				uv0.animtorLoading = nil

				slot0:SetActive(uv0.contextData.map:getConfig("animtor") == 1 and not uv0.isSubLayerOpen)

				uv0.tornadoTF = slot0

				setParent(slot0, uv0:findTF("map"))
				tf(uv0.tornadoTF):SetSiblingIndex(1)

				uv0.aniName = uv1

				uv2()

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-65, warpins: 1 ---
			setParent(slot0.tornadoTF, slot0:findTF("map"))
			tf(slot0.tornadoTF):SetSiblingIndex(1)
			setActive(slot0.tornadoTF, true)
			slot2()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end

	if not IsNil(slot0.tornadoTF) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-75, warpins: 1 ---
		setActive(slot0.tornadoTF, false)
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #0 ---



end

function slot0.updateActivityBtns(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 34-339, warpins: 3 ---
	slot2 = slot0.contextData.map:isRemaster()
	slot3 = slot0.contextData.map:getConfig("type")

	setActive(slot0.activityBtn, not slot0.contextData.map:isActivity() and (slot0.battleActivity and not slot0.battleActivity:isEnd()))

	if slot0.contextData.map:isEscort() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-45, warpins: 1 ---
		setActive(slot0.activityBtn, false)
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.signalBtn, getProxy(ChapterProxy).getChapterById(slot5, 304) and slot6:isClear() and (slot3 == Map.SCENARIO or slot3 == Map.ELITE))

	slot7 = false
	slot9 = nil

	if ActivityLevelConst.hasExtraMap(slot0.maps) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 88-90, warpins: 2 ---
		slot7 = _.any(slot0.battleActivitys or {}, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-25, warpins: 1 ---
			if slot0.id == uv0:getConfig("on_activity") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-13, warpins: 1 ---
				uv1 = slot0:getConfig("type")
				--- END OF BLOCK #0 ---



			end

			return slot0.id == uv0:getConfig("on_activity")
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	slot13 = ActivityLevelConst.isClearMaps(slot12, Map.ACTIVITY_EASY)
	slot14 = ActivityLevelConst.isClearMaps(slot12, Map.ACTIVITY_HARD)

	setActive(slot0.actExtraBtn.parent, slot7 and slot1 and not (slot7 and slot3 == Map.ACT_EXTRA) and not slot2)
	setActive(slot0.actEliteBtn.parent, slot0.contextData.map:existHardMap() and (slot3 == Map.ACTIVITY_EASY and (slot4 or slot2) or slot1 and (slot7 and slot3 == Map.ACT_EXTRA)))
	setActive(slot0.actNormalBtn.parent, slot3 == Map.ACTIVITY_HARD and (slot4 or slot2) or slot1 and (slot7 and slot3 == Map.ACT_EXTRA))
	setActive(slot0.actExtraRank, slot1 and (slot7 and slot3 == Map.ACT_EXTRA))
	setActive(slot0.remasterBtn, OPEN_REMASTER and (slot3 == Map.SCENARIO or slot3 == Map.ELITE or slot2))
	setActive(slot0.ticketTxt.parent, slot2)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 201-210, warpins: 1 ---
		setText(slot0.ticketTxt, slot5.remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
		--- END OF BLOCK #0 ---



	end

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 213-219, warpins: 1 ---
		setActive(slot0.eliteQuota, false)
		slot0:updateActivityRes()
		--- END OF BLOCK #0 ---



	end

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
			--- BLOCK #0 287-295, warpins: 5 ---
			setActive(slot0.ptTotal, not ActivityConst.HIDE_PT_PANELS and slot0.ptActivity and not slot0.ptActivity:isEnd() and slot1 and not slot2)
			setActive(slot0.actExchangeShopBtn, slot1 and not ActivityConst.HIDE_PT_PANELS and slot4 and not slot2)
			setActive(slot0.mirrorBtn, false)
			setActive(slot0.eventContainer, not slot1)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot7 and slot1 and not slot10 and (slot11 and slot14 or not slot11 and slot13) then

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

	slot0:updateCountDown()
	slot0:registerActBtn()

	if slot1 and not slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 334-337, warpins: 1 ---
		Map.lastMapForActivity = slot0.contextData.mapIdx
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateBossBattleMsg(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	if slot0.activityBossBattlePanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		slot0.activityBossBattlePanel:updateMsg(slot1)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateCountDown(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-148, warpins: 1 ---
	if slot0.newChapterCDTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
		--- END OF BLOCK #0 ---



	end

	slot1 = 0

	if slot0.contextData.map:isRemaster() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-63, warpins: 1 ---
		if slot0.contextData.map.remasterId == getProxy(ChapterProxy):getActiveRemaster() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-43, warpins: 1 ---
			slot1 = math.max(slot2.remasterTime - pg.TimeMgr.GetInstance():GetServerTime(), 0)
			--- END OF BLOCK #0 ---



		end

		setActive(slot0.countDown, true)
		setText(slot0.countDown:Find("title"), i18n(slot1 > 0 and "levelScene_chapter_open_count_down" or "levelScene_chapter_not_open"))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-70, warpins: 1 ---
		if slot0.contextData.map:isActivity() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 93-104, warpins: 2 ---
			slot2 = getProxy(ActivityProxy)
			slot3 = pg.TimeMgr.GetInstance()

			_.each(pg.chapter_template.all, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-56, warpins: 1 ---
				if (pg.expedition_data_by_map[pg.chapter_template[slot0].map].type == Map.ACTIVITY_HARD or slot2.type == Map.ACTIVITY_HARD) and pg.activity_template[slot1.act_id] and slot3.time and #slot3.time == 3 and uv0:parseTimeFromConfig(slot3.time[2]) - uv0:GetServerTime() > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 45-47, warpins: 1 ---
					if uv1 == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 48-49, warpins: 1 ---
						uv1 = slot4
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 50-55, warpins: 1 ---
						uv1 = math.min(uv1, slot4)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end)
			setActive(slot0.countDown, slot1 > 0)
			setText(slot0.countDown:Find("title"), i18n("levelScene_new_chapter_coming"))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 105-108, warpins: 1 ---
			setActive(slot0.countDown, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 112-138, warpins: 1 ---
		setText(slot0.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(slot1))

		slot0.newChapterCDTimer = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-52, warpins: 1 ---
			uv0 = uv0 - 1

			if uv0 <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-16, warpins: 1 ---
				uv1:updateCountDown()

				if not uv1.contextData.chapterVO then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-35, warpins: 1 ---
					uv1:setMaps(slot1)
					uv1:setMap(uv1.contextData.mapIdx)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-51, warpins: 1 ---
				setText(uv1.countDown:Find("time"), pg.TimeMgr.GetInstance():DescCDTime(uv0))
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, 1, -1)

		slot0.newChapterCDTimer:Start()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 139-146, warpins: 1 ---
		setText(slot0.countDown:Find("time"), "")
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateEscortInfo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-45, warpins: 1 ---
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
			uv0:HandleShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("levelScene_escort_help_tip")
			})

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.registerActBtn(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-53, warpins: 1 ---
	if slot0.isRegisterBtn then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.isRegisterBtn = true

	onButton(slot0, slot0.actExtraRank, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		if uv0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0:emit(LevelMediator2.ON_EXTRA_RANK)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.actExtraBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		if uv0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0:emit(LevelMediator2.ON_ENTER_EXTRA_CHAPTER)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.activityBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		if uv0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0:emit(LevelMediator2.ON_ACTIVITY_MAP)

		return
		--- END OF BLOCK #0 ---



	end, SFX_UI_CLICK)
	onButton(slot0, slot0.actExchangeShopBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		if uv0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0:emit(LevelMediator2.GO_ACT_SHOP)

		return
		--- END OF BLOCK #0 ---



	end, SFX_UI_CLICK)
	onButton(slot0, slot0.mirrorBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-38, warpins: 1 ---
		if uv0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		slot0, slot1 = pg.SystemOpenMgr:GetInstance():isOpenSystem(uv0.player.level, "ShamPreCombatMediator")

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-28, warpins: 1 ---
			uv0:emit(LevelMediator2.ON_OPEN_SHAM)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-37, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(slot1)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_UI_CLICK)

	function slot1()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-40, warpins: 1 ---
		slot0 = nil

		for slot4, slot5 in pairs(uv0.maps) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-19, warpins: 1 ---
			if slot5:getActiveChapter() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-18, warpins: 1 ---
				slot0 = slot6:getConfig("name")

				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-38, warpins: 1 ---
			uv0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("activity_level_inwarime_tip", string.split(slot0, "|")[1])
			})

			return true
			--- END OF BLOCK #0 ---



		end

		return false
		--- END OF BLOCK #0 ---



	end

	function slot2(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		if ActivityLevelConst.getMapsByType(uv0.maps, slot0, slot1)[1] and uv0.maps[slot3.id - 1] and not slot4:isClearForActivity() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-24, warpins: 1 ---
			return false
			--- END OF BLOCK #0 ---



		end

		return true
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot0.actEliteBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-87, warpins: 1 ---
		if uv0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		if uv0.contextData.map:isRemaster() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-49, warpins: 1 ---
			if uv0.maps[slot0:getBindMap() - 1] and not slot2:isClearForActivity() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-41, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock"))

				return
				--- END OF BLOCK #0 ---



			end

			uv0:setMap(slot0:getBindMap())

			return
			--- END OF BLOCK #0 ---



		end

		if uv1() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 54-54, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		if not uv2(Map.ACTIVITY_HARD, uv0.battleActivity.id) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 64-75, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
			--- END OF BLOCK #0 ---



		end

		uv0:emit(LevelMediator2.ON_SWITCH_ACT_MAP, uv0.battleActivity.id, Map.ACTIVITY_HARD)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.actNormalBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-61, warpins: 1 ---
		if uv0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		if uv0.contextData.map:isRemaster() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-23, warpins: 1 ---
			uv0:setMap(slot0:getBindMap())

			return
			--- END OF BLOCK #0 ---



		end

		if uv1() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-28, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		if not uv2(Map.ACTIVITY_EASY, uv0.battleActivity.id) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-49, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelScene_lock"))

			return
			--- END OF BLOCK #0 ---



		end

		uv0:emit(LevelMediator2.ON_SWITCH_ACT_MAP, uv0.battleActivity.id, Map.ACTIVITY_EASY)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.destroyCloudAnimator(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	if not IsNil(slot0.tornadoTF) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-20, warpins: 1 ---
		slot0.tornadoTF.transform.localScale = Vector3.one

		PoolMgr.GetInstance():ReturnUI(slot0.aniName, slot0.tornadoTF)

		slot0.tornadoTF = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.initCloudsPos(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 6-34, warpins: 2 ---
	slot0.initPositions = {}

	for slot7, slot8 in ipairs(slot0.cloudRTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-33, warpins: 1 ---
		if pg.expedition_data_by_map[slot1 or 1].clouds_pos[slot7] then

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



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.initMapBtn(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	onButton(slot0, slot1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-139, warpins: 1 ---
		if uv0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		if uv0.maps[uv0.contextData.mapIdx + uv1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-138, warpins: 1 ---
			if slot1:getMapType() == Map.ELITE and not slot1:isEliteEnabled() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-47, warpins: 1 ---
				slot0 = uv0.maps[slot1:getBindMap()].id

				pg.TipsMgr:GetInstance():ShowTips(i18n("elite_disable_unusable"))
				--- END OF BLOCK #0 ---



			end

			if slot2 == Map.ACTIVITY_EASY or slot2 == Map.ACTIVITY_HARD then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-61, warpins: 2 ---
				if uv0.maps[slot0 - 1] and not slot3:isClearForActivity() then

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

			if not slot1:isUnlock() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 102-133, warpins: 1 ---
				slot3 = i18n("levelScene_map_lock")

				if uv0.maps[slot0 - 1] and slot4:isClear() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 116-123, warpins: 1 ---
					slot3 = i18n("levelScene_chapter_unlock_tip", slot1:getConfig("level_limit"))
					--- END OF BLOCK #0 ---



				end

				pg.TipsMgr:GetInstance():ShowTips(slot3)

				return
				--- END OF BLOCK #0 ---



			end

			uv0:setMap(slot0)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.setMap(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-36, warpins: 1 ---
	slot0.contextData.mapIdx = slot1
	slot0.contextData.map = slot0.maps[slot1]

	if slot0.contextData.map:getMapType() == Map.ACT_EXTRA then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-25, warpins: 1 ---
		PlayerPrefs.SetInt("ex_mapId", slot0.contextData.map.id)
		PlayerPrefs.Save()
		--- END OF BLOCK #0 ---



	end

	slot0:updateBattleActivity(slot1)
	slot0:updateMap()
	slot0:tryPlayMapStory()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateMap(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-203, warpins: 1 ---
	playBGM(slot0.contextData.map.getConfig(slot1, "bgm"))

	if slot0.contextData.map:getConfig("bg") and #slot2 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-32, warpins: 1 ---
		GetSpriteFromAtlasAsync("levelmap/" .. slot2, "", function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-31, warpins: 1 ---
			if not IsNil(uv0.map) and uv1 == uv0.contextData.map then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-30, warpins: 1 ---
				setImageSprite(uv0.map, slot0, true)

				uv0.float.sizeDelta = uv0.map.sizeDelta
				uv0.float.localPosition = uv0.map.localPosition
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



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

	setActive(slot0.btnPrev, slot3)
	setActive(slot0.btnNext, slot4)
	setImageColor(slot0.btnPrevCol, slot0.maps[slot1.id - 1] and slot3:isUnlock() and Color.white or Color.New(0.5, 0.5, 0.5, 1))
	setImageColor(slot0.btnNextCol, slot4 and slot4:isUnlock() and Color.white or Color.New(0.5, 0.5, 0.5, 1))
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

	if slot0.contextData.openChapterId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 175-201, warpins: 1 ---
		if slot0.chapterTFsById[slot0.contextData.openChapterId] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 198-198, warpins: 2 ---
			triggerButton(isActive(slot8:Find("main")) and slot9 or slot8:Find("sub"))
			--- END OF BLOCK #0 ---



		end

		slot0.contextData.openChapterId = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateMapItems(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-135, warpins: 1 ---
	for slot4 = 1, slot0.UIFXList.childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-17, warpins: 2 ---
		if slot0.UIFXList:GetChild(slot4 - 1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-16, warpins: 1 ---
			setActive(slot5, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.map:getConfig("cloud_suffix") == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-30, warpins: 1 ---
		setActive(slot0.clouds, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-64, warpins: 1 ---
		setActive(slot0.clouds, true)

		for slot6, slot7 in ipairs(slot1:getConfig("clouds_pos")) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-64, warpins: 1 ---
			slot0.cloudRTFs[slot6].GetComponent(slot8, typeof(Image)).enabled = false

			GetSpriteFromAtlasAsync("clouds/cloud_" .. slot6 .. "_" .. slot2, "", function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-32, warpins: 1 ---
				if not uv0.exited and not IsNil(uv1) and uv2 == uv0.contextData.map then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 16-31, warpins: 1 ---
					uv1.enabled = true
					uv1.sprite = slot0

					uv1:SetNativeSize()

					uv0.cloudRects[uv3] = uv4.rect.width
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.chapters, false)
	setActive(slot0.escortChapters, false)

	if slot1:isEscort() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 78-104, warpins: 1 ---
		setActive(slot0.escortChapters, true)

		slot6 = UIItemList.New(slot0.escortChapters, slot0.escortChapterTpl)

		slot6:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-15, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-14, warpins: 1 ---
				uv1:updateEscortItem(slot2, uv0[slot1 + 1].escortId, uv0[slot1 + 1].chapter)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		slot6:align(#_.detect(getProxy(ChapterProxy).escortMaps, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-9, warpins: 2 ---
			return slot0.id == uv0.id
			--- END OF BLOCK #0 ---



		end).chapters)

		return
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.chapters, true)

	slot0.chapterTFsById = {}

	_.each(Chapter.bindConfigTable().all, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		if uv0:getChapter(slot0) and slot1:getConfig("map") == uv0.id and slot1:isValid() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-25, warpins: 1 ---
			table.insert(uv1, slot1)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	slot5 = UIItemList.New(slot0.chapters, slot0.chapterTpl)

	slot5:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-42, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-22, warpins: 1 ---
			uv1:updateMapItem(slot2, uv0[slot1 + 1])

			slot2.name = "Chapter_" .. uv0[slot1 + 1].id
			uv1.chapterTFsById[uv0[slot1 + 1].id] = slot2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-26, warpins: 1 ---
			if slot0 == UIItemList.EventExcess and uv1.mapItemTimer[slot2] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 32-41, warpins: 1 ---
				uv1.mapItemTimer[slot2]:Stop()

				uv1.mapItemTimer[slot2] = nil
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot5:align(#{})
	--- END OF BLOCK #0 ---



end

function slot0.updateEscortItem(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 44-141, warpins: 3 ---
	slot1.name = "chapter_" .. slot3.id
	slot1.anchoredPosition = Vector2(slot0.escortChapters.rect.width * tonumber(pg.escort_template[slot2].pos_x), slot0.escortChapters.rect.height * tonumber(pg.escort_template[slot2].pos_y))

	setActive(slot1:Find("fighting"), getProxy(ChapterProxy).getActiveChapter(slot5) and slot6.id == slot3.id)
	slot0:DeleteTween("fighting" .. slot3.id)

	if getProxy(ChapterProxy).getActiveChapter(slot5) and slot6.id == slot3.id then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-80, warpins: 1 ---
		setImageAlpha(slot7, 1)
		slot0:RecordTween("fighting" .. slot3.id, LeanTween.alpha(slot7, 0, 0.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
		--- END OF BLOCK #0 ---



	end

	GetImageSpriteFromAtlasAsync("levelmap/mapquad/" .. slot4.pic, "", slot1, true)

	for slot17 = 0, slot1:Find("anim"):GetComponentsInChildren(typeof(Image)).Length - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 127-129, warpins: 2 ---
		slot13[slot17].color = ({
			Color.green,
			Color.yellow,
			Color.red
		})[table.indexof(pg.gameset.gardroad_count.description[1], slot2) or 1]
		--- END OF BLOCK #0 ---



	end

	setImageColor(slot1, slot12)
	onButton(slot0, slot1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-46, warpins: 1 ---
		if uv0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-9, warpins: 1 ---
			if uv0.id == uv1.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-15, warpins: 1 ---
				uv2:switchToChapter(uv0)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-33, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_strategying", uv0:getConfig("chapter_name")))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-45, warpins: 1 ---
			uv2:displayChapterPanel(uv1, Vector3(uv3.transform.localPosition.x, uv3.transform.localPosition.y))
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateChapterTF(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	if slot0.chapterTFsById[slot1] and slot0.contextData.map:getChapter(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-17, warpins: 1 ---
		slot0:updateMapItem(slot2, slot0.contextData.map.getChapter(slot1))
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateMapItem(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-591, warpins: 1 ---
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

	slot6 = findTF(slot1, "sub")

	if slot2:getPlayType() == ChapterConst.TypeMainSub then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-133, warpins: 1 ---
		setActive(findTF(slot1, "main"), false)
		setActive(slot6, true)

		slot7 = findTF(slot6, "mask/count_down")

		local function slot8()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-44, warpins: 1 ---
			if uv0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-20, warpins: 1 ---
				if math.max(uv1.expireTime - pg.TimeMgr.GetInstance():GetServerTime(), 0) > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-28, warpins: 1 ---
					setText(uv0, slot0:DescCDTime(slot1))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 29-32, warpins: 1 ---
					if not uv1.active then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 33-43, warpins: 1 ---
						uv1:clearSubChapter()
						getProxy(ChapterProxy):updateChapter(uv1)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



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
			--- BLOCK #0 1-52, warpins: 1 ---
			uv0.enabled = false

			if uv1.active then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-51, warpins: 1 ---
				if uv1:existOni() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 14-17, warpins: 1 ---
					uv2 = uv3
					uv4 = uv5
					--- END OF BLOCK #0 ---



				end

				setActive(uv2, true)

				uv4.alpha = 1

				uv6:RecordTween("fighting" .. uv1.id, LeanTween.alphaCanvas(uv4, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 222-576, warpins: 2 ---
		setActive(slot5, true)
		setActive(slot6, false)

		slot7 = findTF(slot5, "circle/clear_flag")
		slot9 = GetOrAddComponent(slot8, "CanvasGroup")

		setText(findTF(slot8, "Text"), i18n("tag_level_fighting"))

		slot11 = GetOrAddComponent(slot10, "CanvasGroup")

		setText(findTF(slot10, "Text"), i18n("tag_level_oni"))
		setText(findTF(slot5, "info/bk/title_form/title_index"), slot4.chapter_name .. "  ")
		setText(findTF(slot5, "info/bk/title_form/title"), string.split(slot4.name, "|")[1])
		setText(findTF(slot5, "info/bk/title_form/title_en"), string.split(slot4.name, "|")[2] or "")
		setFillAmount(findTF(slot5, "circle/progress"), slot2.progress / 100)
		setText(findTF(slot5, "circle/progress_text"), string.format("%d%%", slot2.progress))
		setActive(findTF(slot5, "circle/stars"), slot2:existAchieve())

		if slot2:existAchieve() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 247-267, warpins: 1 ---
			for slot19, slot20 in ipairs(slot2.achieves) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 251-267, warpins: 1 ---
				setActive(slot14:Find("star" .. slot19 .. "/light"), ChapterConst.IsAchieved(slot20))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

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
				--- BLOCK #0 312-350, warpins: 1 ---
				if slot2:existOni() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 317-318, warpins: 1 ---
					slot8 = slot10
					slot9 = slot11
					--- END OF BLOCK #0 ---



				end

				setActive(slot8, true)

				slot9.alpha = 1

				slot0:RecordTween("fighting" .. slot2.id, LeanTween.alphaCanvas(slot9, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
				--- END OF BLOCK #0 ---



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
			--- BLOCK #0 1-13, warpins: 1 ---
			if uv0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-7, warpins: 1 ---
				setActive(uv1, true)
				--- END OF BLOCK #0 ---



			end

			if uv2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 1 ---
				uv2()
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)

		if slot2:isTriesLimit() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 467-468, warpins: 2 ---
			slot21 = slot2:getConfig("count")

			setText(slot16:Find("label"), i18n("levelScene_chapter_count_tip"))
			setText(slot16:Find("Text"), setColorStr(slot21 - slot2:getTodayDefeatCount() .. "/" .. slot21, slot21 <= slot2:getTodayDefeatCount() and COLOR_RED or COLOR_GREEN))
			--- END OF BLOCK #0 ---



		end

		for slot26, slot27 in ipairs(slot21) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 478-484, warpins: 1 ---
			slot22 = 0 + pg.expedition_data_template[slot27].bonus_time
			--- END OF BLOCK #0 ---



		end

		if not slot0.markRawPos then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 492-493, warpins: 1 ---
			slot0.markRawPos = findTF(slot5, "mark").anchoredPosition
			--- END OF BLOCK #0 ---



		end

		slot23.anchoredPosition = slot0.markRawPos
		slot26 = slot2:getOniChapterInfo()

		setActive(slot23:Find("bonus"), not slot0.contextData.map:isRemaster() and slot22 > 0 and math.max(slot22 - slot2.todayDefeatCount, 0) > 0)
		setActive(slot23, not slot0.contextData.map.isRemaster() and slot22 > 0 and math.max(slot22 - slot2.todayDefeatCount, 0) > 0)

		if not slot0.contextData.map.isRemaster() and slot22 > 0 and math.max(slot22 - slot2.todayDefeatCount, 0) > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 534-575, warpins: 1 ---
			slot28 = slot23.anchoredPosition.y
			slot23:GetComponent(typeof(CanvasGroup)).alpha = 0

			LeanTween.cancel(go(slot23))
			LeanTween.value(go(slot23), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				uv0.alpha = slot0
				uv1.anchoredPosition.y = uv2 * slot0
				uv1.anchoredPosition = uv1.anchoredPosition

				return
				--- END OF BLOCK #0 ---



			end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, isActive(slot5) and slot5 or slot6, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-104, warpins: 1 ---
		if uv0:isfrozen() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		if not uv1:isUnlock() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-30, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_tracking_error_pre", uv1:getPrevChapterName()))

			return
			--- END OF BLOCK #0 ---



		end

		if uv0.player.level < uv1:getConfig("unlocklevel") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-53, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_level_limit", slot0))

			return
			--- END OF BLOCK #0 ---



		end

		slot1 = nil

		for slot5, slot6 in pairs(uv0.maps) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 60-68, warpins: 1 ---
			if slot6:getActiveChapter() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 66-66, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		if slot1 and slot1 ~= uv1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 74-80, warpins: 1 ---
			uv0:emit(LevelMediator2.ON_STRATEGYING_CHAPTER)

			return
			--- END OF BLOCK #0 ---



		end

		if uv1.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-90, warpins: 1 ---
			uv0:switchToChapter(uv1)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 91-103, warpins: 1 ---
			uv0:displayChapterPanel(uv1, Vector3(uv2.localPosition.x - 10, uv2.localPosition.y + 150))
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_UI_WEIGHANCHOR_SELECT)

	return
	--- END OF BLOCK #0 ---



end

function slot0.tryPlayMapStory(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-40, warpins: 1 ---
	if slot0.contextData.map:getConfig("enter_story") and slot1 ~= "" and not pg.SystemOpenMgr:GetInstance().active then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-28, warpins: 1 ---
		pg.StoryMgr.GetInstance():Play(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-46, warpins: 1 ---
			if not slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-11, warpins: 1 ---
				if uv0.contextData.map:getConfig("guide_id") and slot1 ~= "" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 14-22, warpins: 1 ---
					pg.StoryMgr.GetInstance():PlayGuide(slot1)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 23-34, warpins: 2 ---
					pg.SystemOpenMgr:GetInstance():notification(uv0.player.level)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-45, warpins: 1 ---
				pg.SystemOpenMgr:GetInstance():notification(uv0.player.level)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-38, warpins: 3 ---
		pg.SystemOpenMgr:GetInstance():notification(slot0.player.level)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.displaySignalPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot0.levelSignalView = LevelSignalView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelSignalView:Load()
	slot0.levelSignalView:ActionInvoke("set", slot0.maps, slot0.subRefreshCount, slot0.subProgress)
	slot0.levelSignalView:ActionInvoke("setCBFunc", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		uv0:hideSignalPanel()
		uv0:emit(LevelMediator2.ON_REFRESH_SUB_CHAPTER)

		return
		--- END OF BLOCK #0 ---



	end, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-31, warpins: 1 ---
		uv0:hideSignalPanel()

		if slot0.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-13, warpins: 1 ---
			uv0:switchToChapter(slot0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-22, warpins: 1 ---
			if uv0.contextData.mapIdx ~= slot0:getConfig("map") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-30, warpins: 1 ---
				uv0:setMap(slot0:getConfig("map"))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:hideSignalPanel()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideSignalPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelSignalView:Destroy()

	return
	--- END OF BLOCK #0 ---



end

function slot0.displaySpResult(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 12-15, warpins: 2 ---
	setActive(slot0.spResult, true)
	slot0:doPlayAnim(slot1 == 1 and "SpUnitWin" or "SpUnitLose", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		onButton(uv0, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			removeOnButton(uv0)
			setActive(uv0, false)
			uv1:hideSpResult()
			uv2()

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideSpResult(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0.spResult, false)

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayBombResult(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	setActive(slot0.spResult, true)
	slot0:doPlayAnim("SpBombRet", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		onButton(uv0, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			removeOnButton(uv0)
			setActive(uv0, false)
			uv1:hideBombResult()
			uv2()

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		return
		--- END OF BLOCK #0 ---



	end, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		setText(slot0.transform:Find("right/name_bg/en"), uv0.contextData.chapterVO.modelCount)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideBombResult(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0.spResult, false)

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayChapterPanel(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	slot0.levelInfoView = LevelInfoView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelInfoView:Load()
	slot0.levelInfoView:ActionInvoke("set", slot1, slot2)
	slot0.levelInfoView:ActionInvoke("setCBFunc", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-49, warpins: 1 ---
		if uv0.player.ship_bag_max <= getProxy(BayProxy).getShipCount(slot1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-20, warpins: 1 ---
			NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

			return
			--- END OF BLOCK #0 ---



		end

		uv0:hideChapterPanel()

		slot3 = uv1:clone()
		slot3.loopFlag = slot0

		if slot3:getConfig("type") == Chapter.CustomFleet then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-43, warpins: 1 ---
			uv0:displayFleetEdit(slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-48, warpins: 1 ---
			uv0:displayFleetSelect(slot3)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:hideChapterPanel()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideChapterPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	if slot0.levelInfoView and slot0.levelInfoView:CheckState(BaseSubView.STATES.INITED) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-16, warpins: 1 ---
		slot0.levelInfoView:Destroy()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayFleetSelect(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 15-50, warpins: 2 ---
	slot2 = nil
	slot0.levelFleetView = LevelFleetView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelFleetView:Load()
	slot0.levelFleetView:ActionInvoke("setOpenCommanderTag", slot0.openedCommanerSystem)
	slot0.levelFleetView:ActionInvoke("set", slot1, slot0.fleets, (not slot0.contextData.selectedFleetIDs or slot0.contextData.selectedFleetIDs) and slot1:selectFleets(slot0.lastFleetIndex, slot0.fleets))
	slot0.levelFleetView:ActionInvoke("setCBFunc", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-132, warpins: 1 ---
		if uv0:isTriesLimit() and not uv0:enoughTimes2Start() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-24, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_elite_no_quota"))

			return
			--- END OF BLOCK #0 ---



		end

		if uv0:getConfig("npc_data") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-41, warpins: 1 ---
			slot4 = getProxy(TaskProxy):getTaskById(slot1[3])

			if (slot1[3] == 0 or slot4 and not slot4:isFinish()) and #uv1.fleets[slot0[1]]:getTeamByName(pg.ship_data_by_type[pg.ship_data_statistics[slot1[1]].type].team_type == TeamType.Vanguard and Fleet.VANGUARD or Fleet.MAIN) == 3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-88, warpins: 1 ---
				uv1:HandleShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n("chapter_tip_with_npc", slot5.name)
				})

				return
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		slot2 = false
		slot3 = ""

		for slot7, slot8 in ipairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-107, warpins: 1 ---
			slot2, slot3 = uv1.fleets[slot8]:GetEnergyStatus()

			if slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 105-105, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 111-118, warpins: 1 ---
			uv1:HandleShowMsgBox({
				content = slot3,
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-19, warpins: 1 ---
					uv0:hideFleetSelect()

					if not uv1:isValid() then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 11-11, warpins: 1 ---
						return
						--- END OF BLOCK #0 ---



					end

					uv0:trackChapter(uv1, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-12, warpins: 1 ---
						uv0:emit(LevelMediator2.ON_TRACKING, uv1.id, uv2, uv1.loopFlag)

						return
						--- END OF BLOCK #0 ---



					end)

					return
					--- END OF BLOCK #0 ---



				end
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 119-120, warpins: 1 ---
			slot4()
			--- END OF BLOCK #0 ---



		end

		uv1.contextData.selectedChapterVO = nil
		uv1.contextData.selectedFleetIDs = nil

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		uv0.contextData.selectedChapterVO = nil
		uv0.contextData.selectedFleetIDs = nil

		uv0:hideFleetSelect()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideFleetSelect(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	if slot0.levelCMDFormationView and slot0.levelCMDFormationView._state ~= 5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		slot0.levelCMDFormationView:Destroy()
		--- END OF BLOCK #0 ---



	end

	slot0.levelFleetView:Destroy()

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayFleetEdit(slot0, slot1)

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

function slot0.hideFleetEdit(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-31, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-8, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_UPDATE_CUSTOM_FLEET, slot1.id)
		--- END OF BLOCK #0 ---



	end

	if slot0.levelCMDFormationView and slot0.levelCMDFormationView._state ~= 5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-19, warpins: 1 ---
		slot0.levelCMDFormationView:Destroy()
		--- END OF BLOCK #0 ---



	end

	if slot0.levelFleetView and slot0.levelFleetView._state ~= 5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-30, warpins: 1 ---
		slot0.levelFleetView:Destroy()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.isCrossStoryLimit(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot2 = true

	if slot1 ~= "" and #slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot2 = _.all(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-19, warpins: 1 ---
			if slot0[1] == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-17, warpins: 2 ---
				return getProxy(TaskProxy):getTaskById(slot0[2]) and not slot2:isFinish()
				--- END OF BLOCK #0 ---



			end

			return false
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	return slot2
	--- END OF BLOCK #0 ---



end

function slot0.switchDifficulty(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-120, warpins: 1 ---
	slot2 = slot0.contextData.map.getConfig(slot1, "type")

	if slot0.contextData.map:getConfig("uifx") ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-21, warpins: 1 ---
		setActive(slot0:findTF(slot3, slot0.UIFXList), true)
		--- END OF BLOCK #0 ---



	end

	if Map.EVENT == slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-34, warpins: 1 ---
		setActive(slot0.normalBtn, false)
		setActive(slot0.eliteBtn, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-85, warpins: 2 ---
		setActive(slot0.normalBtn, slot2 == Map.ELITE)
		setActive(slot0.eliteQuota, slot2 == Map.ELITE)
		setActive(slot0.eliteBtn, slot2 == Map.SCENARIO)
		setActive(slot0.eliteBtn:Find("bg/pic_activity"), getProxy(ActivityProxy).getActivityById(setActive, ActivityConst.ELITE_AWARD_ACTIVITY_ID) and not slot0.eliteBtn:isEnd())
		--- END OF BLOCK #0 ---



	end

	for slot7, slot8 in pairs(slot0.chapterTFsById or {}) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 93-119, warpins: 1 ---
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



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.trackChapter(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = nil

	coroutine.wrap(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-97, warpins: 1 ---
		slot1 = getProxy(ChapterProxy)

		if uv0.contextData.map:isRemaster() and slot0.remasterId ~= slot1:getActiveRemaster() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-58, warpins: 1 ---
			uv0:HandleShowMsgBox({
				content = i18n("levelScene_activate_remaster"),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-4, warpins: 1 ---
					onNextTick(uv0)

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

			uv0:emit(LevelMediator2.ON_ACTIVATE_REMASTER, slot0.remasterId, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				onNextTick(uv0)

				return
				--- END OF BLOCK #0 ---



			end)
			coroutine.yield()
			--- END OF BLOCK #0 ---



		end

		if uv2:getConfig("enter_story") and slot2 ~= "" and uv0:isCrossStoryLimit(uv2:getConfig("enter_story_limit")) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 80-91, warpins: 1 ---
			pg.StoryMgr.GetInstance():Play(slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				onNextTick(uv0)

				return
				--- END OF BLOCK #0 ---



			end)
			coroutine.yield()
			--- END OF BLOCK #0 ---



		end

		if uv3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-96, warpins: 1 ---
			uv3()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)()

	return
	--- END OF BLOCK #0 ---



end

function slot0.setChapter(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	slot2 = nil

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-11, warpins: 1 ---
		if slot1:getDataType() == ChapterConst.TypeNone then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-20, warpins: 1 ---
			slot1 = slot0.maps[slot0.contextData.mapIdx]:getChapter(slot1.id)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0.contextData.chapterId = slot2
	slot0.contextData.chapterVO = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.switchToChapter(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-105, warpins: 1 ---
	slot0:frozen(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0.levelStageView:tryAutoAction()

		return
		--- END OF BLOCK #0 ---



	end)

	if slot1:getDataType() == ChapterConst.TypeSham and slot0.contextData.map:getConfig("type") ~= Map.SHAM or slot3 == ChapterConst.TypeGuild and slot0.contextData.map.getConfig("type") ~= Map.GUILD_BOSS then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-33, warpins: 2 ---
		slot0.contextData.chapterMapIdx = slot0.contextData.mapIdx
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.mapIdx ~= slot1:getConfig("map") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-48, warpins: 1 ---
		slot0:setMap(slot1:getConfig("map"))
		--- END OF BLOCK #0 ---



	end

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
	--- END OF BLOCK #0 ---



end

function slot0.switchToMap(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-247, warpins: 1 ---
	slot2 = ChapterConst.TypeNone

	if slot0.contextData.chapterVO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		slot2 = slot1:getDataType()
		--- END OF BLOCK #0 ---



	end

	if slot1:getMapType() == Map.ESCORT and (#getProxy(ChapterProxy).escortMaps == 0 or _.any(slot4, function (slot0)

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

	if slot3.subNextReqTime < pg.TimeMgr.GetInstance():GetServerTime() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-55, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_FETCH_SUB_CHAPTER)

		return
		--- END OF BLOCK #0 ---



	end

	slot0:frozen()
	slot0:destroyGrid()
	slot0:RecordTween("mapScale", LeanTween.value(go(slot0.map), slot0.map.localScale, Vector3.New(1, 1, 1), uv0):setOnUpdateVector3(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		uv0.map.localScale = slot0
		uv0.float.localScale = slot0

		return
		--- END OF BLOCK #0 ---



	end):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-29, warpins: 1 ---
		if not uv0.contextData.chapterVO and uv0.levelStageView and uv0.levelStageView:CheckState(BaseSubView.STATES.INITED) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-24, warpins: 1 ---
			uv0.levelStageView:Destroy()
			--- END OF BLOCK #0 ---



		end

		uv0:unfrozen()

		return
		--- END OF BLOCK #0 ---



	end)):setEase(LeanTweenType.easeOutSine).uniqueId)

	slot5 = LeanTween.value(go(slot0.map), slot0.map.pivot, Vector2.zero, uv0)

	slot5:setOnUpdateVector2(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		uv0.map.pivot = slot0
		uv0.float.pivot = slot0

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

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayAmbushInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	slot0.levelAmbushView = LevelAmbushView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelAmbushView:Load()
	slot0.levelAmbushView:ActionInvoke("SetFuncOnComplete", slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideAmbushInfo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	if slot0.levelAmbushView and slot0.levelAmbushView:CheckState(BaseSubView.STATES.INITED) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-16, warpins: 1 ---
		slot0.levelAmbushView:Destroy()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.doAmbushWarning(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot0:frozen()

	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-50, warpins: 1 ---
		uv0.ambushWarning:SetActive(true)

		slot0 = tf(uv0.ambushWarning)

		slot0:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)
		slot0:SetSiblingIndex(1)

		slot1 = slot0:GetComponent("DftAniEvent")

		slot1:SetTriggerEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			uv0()

			return
			--- END OF BLOCK #0 ---



		end)
		slot1:SetEndEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			uv0.ambushWarning:SetActive(false)
			uv0:unfrozen()

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

			uv0.ambushWarning = slot0

			uv1()

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

	return
	--- END OF BLOCK #0 ---



end

function slot0.destroyAmbushWarn(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	if slot0.ambushWarning then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		PoolMgr.GetInstance():ReturnUI("ambushwarnui", slot0.ambushWarning)

		slot0.ambushWarning = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayStrategyInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot0.levelStrategyView = LevelStrategyView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelStrategyView:Load()
	slot0.levelStrategyView:ActionInvoke("set", slot1)
	slot0.levelStrategyView:ActionInvoke("setCBFunc", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-68, warpins: 1 ---
		slot1 = uv0.contextData.chapterVO.getDataType(slot0)
		slot3 = pg.strategy_data_template[uv1.id]

		if not uv0.contextData.chapterVO.fleet:canUseStrategy(uv1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-19, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		if slot3.type == ChapterConst.StgTypeForm then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-44, warpins: 1 ---
			uv0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpStrategy,
				id = slot2:getNextStgUser(uv1.id),
				arg1 = uv1.id
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-49, warpins: 1 ---
			if slot3.type == ChapterConst.StgTypeConsume then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 50-63, warpins: 1 ---
				uv0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpStrategy,
					id = slot4,
					arg1 = uv1.id
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		uv0:hideStrategyInfo()

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:hideStrategyInfo()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.selectStrategyTarget(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-56, warpins: 1 ---
	slot6 = {}

	if slot1.id == ChapterConst.StrategyAirStrike then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-21, warpins: 1 ---
		slot6 = slot3:calcAreaCells(slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column, slot1.arg[2], slot1.arg[3])
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

	_.each(slot6, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		uv0.grid:shiningTarget(slot0.row, slot0.column, true)

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.grid:updateQuadCells(ChapterConst.QuadStateStrategy, _.filter(slot6, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		return not uv0:existFleet(nil, slot0.row, slot0.column)
		--- END OF BLOCK #0 ---



	end), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-38, warpins: 1 ---
		_.each(uv0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			uv0.grid:shiningTarget(slot0.row, slot0.column, false)

			return
			--- END OF BLOCK #0 ---



		end)

		if slot0 and _.any(uv0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 2 ---
			return slot0.row == uv0.row and slot0.column == uv0.column
			--- END OF BLOCK #0 ---



		end) and uv2:existEnemy(ChapterConst.SubjectPlayer, slot0.row, slot0.column) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-29, warpins: 1 ---
			uv3(slot0.row, slot0.column)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-36, warpins: 3 ---
			uv1.grid:updateQuadCells(ChapterConst.QuadStateNormal)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.selectSquareBarrieredCell(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot0.grid:updateQuadCells(ChapterConst.QuadStateStrategy, slot0.contextData.chapterVO.calcSquareBarrierCells(slot3, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column, slot1), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-23, warpins: 1 ---
		if slot0 and _.any(uv0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 2 ---
			return slot0.row == uv0.row and slot0.column == uv0.column
			--- END OF BLOCK #0 ---



		end) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-14, warpins: 1 ---
			uv1(slot0.row, slot0.column)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-21, warpins: 2 ---
			uv2.grid:updateQuadCells(ChapterConst.QuadStateNormal)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideStrategyInfo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelStrategyView:Destroy()

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayRepairWindow(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-63, warpins: 1 ---
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

	slot0.levelRepairView = LevelRepairView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelRepairView:Load()
	slot0.levelRepairView:ActionInvoke("set", slot5, slot6, slot7, slot8)
	slot0.levelRepairView:ActionInvoke("setCBFunc", function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-51, warpins: 1 ---
		if uv0 - math.min(uv1, uv0) == 0 and uv2.player:getTotalGem() < uv3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-29, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_rmb"))

			return
			--- END OF BLOCK #0 ---



		end

		uv2:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRepair,
			id = uv4.fleet.id,
			arg1 = uv5.id
		})
		uv2:hideRepairWindow()

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:hideRepairWindow()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideRepairWindow(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelRepairView:Destroy()

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayRemasterPanel(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-56, warpins: 1 ---
	slot2 = getProxy(ChapterProxy)
	slot4 = pg.TimeMgr.GetInstance()

	for slot8, slot9 in ipairs(pg.re_map_template.all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-24, warpins: 1 ---
		table.insert({}, pg.re_map_template[slot9])
		--- END OF BLOCK #0 ---



	end

	slot0.levelRemasterView = LevelRemasterView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelRemasterView:Load()
	slot0.levelRemasterView:ActionInvoke("set", slot3, slot2.remasterTickets, slot1 or 1)
	slot0.levelRemasterView:ActionInvoke("setCBFunc", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		uv0:setMap(pg.chapter_template[slot0.config_data[1]].map)
		uv0:hideRemasterPanel()

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:hideRemasterPanel()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideRemasterPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelRemasterView:Destroy()

	return
	--- END OF BLOCK #0 ---



end

function slot0.initGrid(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-71, warpins: 1 ---
	setActive(slot0.uiMain, true)

	slot0.levelGrid.localEulerAngles = Vector3(slot0.contextData.chapterVO.theme.angle, 0, 0)
	slot0.grid = LevelGrid.New(slot0.dragLayer)

	slot0.grid:attach(slot0)
	slot0.grid:setItems(slot0.shipTpl, slot0.subTpl, slot0.transportTpl, slot0.transportTargetTpl, slot0.enemyTpl, slot0.deadTpl, slot0.boxTpl, slot0.supplyTpl, slot0.rivalTpl, slot0.championTpl, slot0.spineTpl, slot0.oniTpl, slot0.oniTargetTpl, slot0.bombEnemyTpl, slot0.arrowTarget)

	function slot0.grid.onCellClick(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0:clickGridCell(slot0)

		return
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.chapterVO.getDataType(slot1) == ChapterConst.TypeNone then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-56, warpins: 1 ---
		function slot0.grid.onShipStepChange(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			uv0.levelStageView:updateAmbushRate(slot0)

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	function slot0.grid.onShipArrived()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		uv0:overrideChapter()
		uv0.levelStageView:updateAmbushRate(uv0.contextData.chapterVO.fleet.line, true)
		uv0.levelStageView:updateStageStrategy()

		return
		--- END OF BLOCK #0 ---



	end

	slot0.grid:initAll()
	slot0:tryFocusForGuide()
	slot0:enableLevelCamera()

	return
	--- END OF BLOCK #0 ---



end

function slot0.tryFocusForGuide(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	if pg.GuideMgr:GetInstance():isRuning() and slot0.contextData.chapterVO:findChapterCell(ChapterConst.AttachBoss) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-24, warpins: 1 ---
		slot0.grid:focusOnCell(slot2)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.destroyGrid(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
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

	return
	--- END OF BLOCK #0 ---



end

function slot0.clickGridCell(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	if not slot0:isfrozen() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		slot0.levelStageView:clickGridCell(slot1)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.doTracking(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot0:frozen()

	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-32, warpins: 1 ---
		uv0.radar:SetActive(true)

		slot0 = tf(uv0.radar)

		slot0:SetParent(uv0.topPanel, false)
		slot0:SetSiblingIndex(1)
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			uv0.radar:SetActive(false)
			uv0:unfrozen()
			uv1()

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

			uv0.radar = slot0

			uv1()

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

	return
	--- END OF BLOCK #0 ---



end

function slot0.destroyTracking(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	if slot0.radar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		PoolMgr.GetInstance():ReturnUI("RadarEffectUI", slot0.radar)

		slot0.radar = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.doPlayAirStrike(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	function slot4()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 59-85, warpins: 2 ---
		uv0.playing = true

		uv0:frozen()
		uv0.airStrike:SetActive(true)

		slot0 = tf(uv0.airStrike)

		slot0:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)
		slot0:SetAsLastSibling()
		setActive(slot0:Find("words/be_striked"), uv1 == ChapterConst.SubjectChampion)
		setActive(slot0:Find("words/strike_enemy"), uv1 == ChapterConst.SubjectPlayer)
		slot0:GetComponent("DftAniEvent"):SetEndEvent(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-18, warpins: 1 ---
			uv0.playing = false

			SetActive(uv0.airStrike, false)

			if uv1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-13, warpins: 1 ---
				uv1()
				--- END OF BLOCK #0 ---



			end

			uv0:unfrozen()

			return
			--- END OF BLOCK #0 ---



		end)

		if uv3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-78, warpins: 1 ---
			onButton(uv0, slot0, slot1, SFX_PANEL)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 79-81, warpins: 1 ---
			removeOnButton(slot0)
			--- END OF BLOCK #0 ---



		end

		playSoundEffect(SFX_UI_WARNING)

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.airStrike then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-14, warpins: 1 ---
		PoolMgr.GetInstance():GetUI("AirStrike", true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot0:SetActive(true)

			uv0.airStrike = slot0

			uv1()

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

	return
	--- END OF BLOCK #0 ---



end

function slot0.destroyAirStrike(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	if slot0.airStrike then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-22, warpins: 1 ---
		slot0.airStrike:GetComponent("DftAniEvent").SetEndEvent(slot1, nil)
		PoolMgr.GetInstance():ReturnUI("AirStrike", slot0.airStrike)

		slot0.airStrike = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.doPlayAnim(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 5-24, warpins: 2 ---
	slot0.uiAnims = slot0.uiAnims or {}

	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-42, warpins: 1 ---
		uv0.playing = true

		uv0:frozen()
		uv1:SetActive(true)

		if uv2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-18, warpins: 1 ---
			uv2(uv1)
			--- END OF BLOCK #0 ---



		end

		slot0 = tf(uv1)

		slot0:SetParent(uv0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			uv0.playing = false

			uv1(uv2)
			uv0:unfrozen()

			return
			--- END OF BLOCK #0 ---



		end)
		playSoundEffect(SFX_UI_WARNING)

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.uiAnims[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-20, warpins: 1 ---
		PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			slot0:SetActive(true)

			uv0.uiAnims[uv1] = slot0
			uv2 = uv0.uiAnims[uv1]

			uv3()

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

	return
	--- END OF BLOCK #0 ---



end

function slot0.destroyUIAnims(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	if slot0.uiAnims then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-27, warpins: 1 ---
		for slot4, slot5 in pairs(slot0.uiAnims) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-25, warpins: 1 ---
			slot5:GetComponent("DftAniEvent").SetEndEvent(slot6, nil)
			PoolMgr.GetInstance():ReturnUI(slot4, slot5)
			--- END OF BLOCK #0 ---



		end

		slot0.uiAnims = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.doPlayTorpedo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-38, warpins: 1 ---
		uv0.playing = true

		uv0:frozen()
		uv0.torpetoAni:SetActive(true)

		slot0 = tf(uv0.torpetoAni)

		slot0:SetParent(uv0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-18, warpins: 1 ---
			uv0.playing = false

			SetActive(uv0.torpetoAni, false)

			if uv1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-13, warpins: 1 ---
				uv1()
				--- END OF BLOCK #0 ---



			end

			uv0:unfrozen()

			return
			--- END OF BLOCK #0 ---



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

			uv0.torpetoAni = slot0

			uv1()

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

	return
	--- END OF BLOCK #0 ---



end

function slot0.destroyTorpedo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	if slot0.torpetoAni then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-22, warpins: 1 ---
		slot0.torpetoAni:GetComponent("DftAniEvent").SetEndEvent(slot1, nil)
		PoolMgr.GetInstance():ReturnUI("Torpeto", slot0.torpetoAni)

		slot0.torpetoAni = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.doPlayStrikeAnim(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 5-50, warpins: 2 ---
	slot0.strikeAnims = slot0.strikeAnims or {}
	slot4, slot5, slot6 = nil

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		if coroutine.status(uv0) == "suspended" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-10, warpins: 1 ---
			slot0, slot1 = coroutine.resume(uv0)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end

	slot6 = coroutine.create(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-135, warpins: 1 ---
		uv0.playing = true

		uv0:frozen()
		setActive(slot0, true)

		slot1 = tf(slot0)
		slot3 = findTF(slot1, "mask/painting")

		setParent(uv2, slot3:Find("fitter"), false)
		setParent(uv3, slot4, false)
		setActive(slot4, false)
		setActive(slot2, false)
		slot1:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)
		slot1:SetAsLastSibling()

		slot5 = slot1:GetComponent("DftAniEvent")
		slot7 = uv3:GetComponent("SpineAnimUI").GetComponent(slot6, "SkeletonGraphic")

		slot5:SetStartEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			uv0:SetAction("attack", 0)

			uv1.freeze = true

			return
			--- END OF BLOCK #0 ---



		end)
		slot5:SetTriggerEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			uv0.freeze = false

			uv1:SetActionCallBack(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
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
						uv0.freeze = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end)

			return
			--- END OF BLOCK #0 ---



		end)
		slot5:SetEndEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			uv0.freeze = false

			uv1()

			return
			--- END OF BLOCK #0 ---



		end)
		onButton(uv0, slot1, uv4, SFX_CANCEL)
		coroutine.yield()
		retPaintingPrefab(slot3, uv5:getPainting())
		PoolMgr.GetInstance():ReturnSpineChar(uv5:getPrefab(), uv3)
		setActive(slot0, false)

		uv0.playing = false

		uv0:unfrozen()

		if uv6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 132-133, warpins: 1 ---
			uv6()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	function slot8()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		if uv0.strikeAnims[uv1] and uv2 and uv3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			uv4()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end

	PoolMgr.GetInstance():GetPainting(slot1:getPainting(), true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		uv0 = slot0

		uv1()

		return
		--- END OF BLOCK #0 ---



	end)
	PoolMgr.GetInstance():GetSpineChar(slot1:getPrefab(), true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		uv0 = slot0
		uv0.transform.localScale = Vector3.one

		uv1()

		return
		--- END OF BLOCK #0 ---



	end)

	if not slot0.strikeAnims[slot2] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-48, warpins: 1 ---
		PoolMgr.GetInstance():GetUI(slot2, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			uv0.strikeAnims[uv1] = slot0

			uv2()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.destroyStrikeAnim(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	if slot0.strikeAnims then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-27, warpins: 1 ---
		for slot4, slot5 in pairs(slot0.strikeAnims) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-25, warpins: 1 ---
			slot5:GetComponent("DftAniEvent").SetEndEvent(slot6, nil)
			PoolMgr.GetInstance():ReturnUI(slot4, slot5)
			--- END OF BLOCK #0 ---



		end

		slot0.strikeAnims = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.doSignalSearch(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot0:frozen()

	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-34, warpins: 1 ---
		uv0.playing = true

		uv0.signalAni:SetActive(true)

		slot0 = tf(uv0.signalAni)

		slot0:SetParent(uv0.topPanel, false)
		slot0:SetAsLastSibling()
		slot0:GetComponent("DftAniEvent").SetEndEvent(slot1, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-18, warpins: 1 ---
			uv0.playing = false

			SetActive(uv0.signalAni, false)

			if uv1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-13, warpins: 1 ---
				uv1()
				--- END OF BLOCK #0 ---



			end

			uv0:unfrozen()

			return
			--- END OF BLOCK #0 ---



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

			uv0.signalAni = slot0

			uv1()

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

	return
	--- END OF BLOCK #0 ---



end

function slot0.destroySignalSearch(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	if slot0.signalAni then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-22, warpins: 1 ---
		slot0.signalAni:GetComponent("DftAniEvent").SetEndEvent(slot1, nil)
		PoolMgr.GetInstance():ReturnUI("SignalUI", slot0.signalAni)

		slot0.signalAni = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.doPlayCommander(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 29-108, warpins: 2 ---
	slot0:frozen()
	setActive(slot0.commanderTinkle, true)
	setText(slot0.commanderTinkle:Find("name"), #slot1:getSkills() > 0 and slot3[1]:getConfig("name") or "")
	setImageSprite(slot0.commanderTinkle:Find("icon"), GetSpriteFromAtlas("commanderhrz/" .. slot1:getConfig("painting"), ""))

	slot0.commanderTinkle:GetComponent(typeof(CanvasGroup)).alpha = 0
	slot5 = Vector2(248, 237)

	LeanTween.value(go(slot0.commanderTinkle), 0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		uv0.commanderTinkle.localPosition.x = uv1.x + -100 * (1 - slot0)
		uv0.commanderTinkle.localPosition = uv0.commanderTinkle.localPosition
		uv2.alpha = slot0

		return
		--- END OF BLOCK #0 ---



	end)):setEase(LeanTweenType.easeOutSine)
	LeanTween.value(go(slot0.commanderTinkle), 0, 1, 0.3):setDelay(0.7):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		uv0.commanderTinkle.localPosition.x = uv1.x + 100 * slot0
		uv0.commanderTinkle.localPosition = uv0.commanderTinkle.localPosition
		uv2.alpha = 1 - slot0

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		if uv0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			uv0()
			--- END OF BLOCK #0 ---



		end

		uv1:unfrozen()

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

function slot0.strikeEnemy(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	slot0:frozen()

	slot0.damageText.position = slot0.uiCam:ScreenToWorldPoint(slot5)
	slot0.damageText.localPosition.y = slot0.damageText.localPosition.y + 40
	slot0.damageText.localPosition.z = 0

	slot0:easeDamage(slot0.damageText.localPosition, slot2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		uv0:unfrozen()
		uv1()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.easeDamage(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-38, warpins: 1 ---
	slot0:frozen()
	setText(slot0.damageText, slot2)
	setActive(slot0.damageText, true)

	slot0.damageText.localPosition = slot1

	LeanTween.value(go(slot0.damageText), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		uv0.damageText.localPosition.y = uv1.y + 60 * slot0
		uv0.damageText.localPosition = uv0.damageText.localPosition

		setTextAlpha(uv0.damageText, 1 - slot0)

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		setActive(uv0.damageText, false)
		uv0:unfrozen()

		if uv1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			uv1()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

function slot0.easeAvoid(slot0, slot1, slot2)

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
		uv0.avoidText.localPosition.y = uv1.y + 100 * slot0
		uv0.avoidText.localPosition = uv0.avoidText.localPosition

		setImageAlpha(uv0.avoidText, 1 - slot0)
		setImageAlpha(uv2, 1 - slot0)

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		setActive(uv0.avoidText, false)
		uv0:unfrozen()

		if uv1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			uv1()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

function slot0.overrideChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)

	return
	--- END OF BLOCK #0 ---



end

function slot0.onSubLayerOpen(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-57, warpins: 1 ---
	setActive(slot0.topPanel, false)
	slot0:disableLevelCamera()

	slot0.visibilityForPreCombat = {
		leftChapter = isActive(slot0.leftChapter),
		rightChapter = isActive(slot0.rightChapter),
		clouds = isActive(slot0.clouds),
		chapters = isActive(slot0.chapters)
	}

	for slot4, slot5 in pairs(slot0.visibilityForPreCombat) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-35, warpins: 1 ---
		setActive(slot0[slot4], false)
		--- END OF BLOCK #0 ---



	end

	if slot0.tornadoTF and slot0.contextData.map.getConfig(slot1, "bg") and #slot0.contextData.map.getConfig(slot1, "bg") > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-54, warpins: 1 ---
		setActive(slot0.tornadoTF, false)
		--- END OF BLOCK #0 ---



	end

	slot0.isSubLayerOpen = true

	return
	--- END OF BLOCK #0 ---



end

function slot0.onSubLayerClose(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-54, warpins: 1 ---
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
				--- BLOCK #0 25-36, warpins: 1 ---
				for slot6, slot7 in pairs(slot0.visibilityForPreCombat) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 29-34, warpins: 1 ---
					setActive(slot0[slot6], slot7)
					--- END OF BLOCK #0 ---



				end

				slot0.visibilityForPreCombat = nil
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot0.tornadoTF and slot0.contextData.map:getConfig("animtor") == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-51, warpins: 1 ---
		setActive(slot0.tornadoTF, true)
		--- END OF BLOCK #0 ---



	end

	slot0.isSubLayerOpen = nil

	return
	--- END OF BLOCK #0 ---



end

function slot0.onSubLayerContextChange(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0.visibilityForPreCombat = nil

	return
	--- END OF BLOCK #0 ---



end

function slot0.popStageStrategy(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	if slot0:findTF("event/collapse", slot0.levelStageView.rightStage).anchoredPosition.x <= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		triggerButton(slot1)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.resetLevelGrid(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.dragLayer.localPosition = Vector3.zero

	return
	--- END OF BLOCK #0 ---



end

function slot0.frozen(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot0.fcall = slot1
		--- END OF BLOCK #0 ---



	end

	slot0.frozenCount = slot0.frozenCount + 1
	slot0.canvasGroup.blocksRaycasts = slot0.frozenCount == 0

	return
	--- END OF BLOCK #0 ---



end

function slot0.unfrozen(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	if slot0.exited then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.frozenCount = slot0.frozenCount - 1
	slot0.canvasGroup.blocksRaycasts = slot0.frozenCount == 0

	if slot0.frozenCount == 0 and slot0.fcall then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-26, warpins: 1 ---
		slot0.fcall = nil

		slot0.fcall()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.isfrozen(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 8-8, warpins: 2 ---
	return slot0.frozenCount > 0
	--- END OF BLOCK #0 ---



end

function slot0.enableLevelCamera(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot0.levelCamIndices = math.max(slot0.levelCamIndices - 1, 0)

	if slot0.levelCamIndices == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		slot0.levelCam.enabled = true
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.disableLevelCamera(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0.levelCamIndices = slot0.levelCamIndices + 1

	if slot0.levelCamIndices > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		slot0.levelCam.enabled = false
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.RecordTween(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0.tweens[slot1] = slot2

	return
	--- END OF BLOCK #0 ---



end

function slot0.DeleteTween(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	if slot0.tweens[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		LeanTween.cancel(slot2)

		slot0.tweens[slot1] = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.openCommanderPanel(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 7-31, warpins: 2 ---
	slot4 = nil
	slot0.levelCMDFormationView = LevelCMDFormationView.New(slot0.topPanel, slot0.event, slot0.contextData)

	slot0.levelCMDFormationView:Load()
	slot0.levelCMDFormationView:ActionInvoke("update", slot1, (slot3 or function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-24, warpins: 1 ---
		uv0.contextData.commanderSelected = {
			chapterId = uv1,
			fleetId = uv2.id
		}

		uv0:emit(LevelMediator2.ON_SELECT_COMMANDER, slot0, uv2.id, uv1)
		uv0:closeCommanderPanel()

		return
		--- END OF BLOCK #0 ---



	end) and function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-23, warpins: 1 ---
		uv0.contextData.eliteCommanderSelected = {
			index = uv1,
			pos = slot0,
			chapterId = uv2
		}

		uv0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, uv1, slot0, uv2)
		uv0:closeCommanderPanel()

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.levelCMDFormationView:ActionInvoke("open")

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeCommanderPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.levelCMDFormationView:close()

	return
	--- END OF BLOCK #0 ---



end

function slot0.HandleShowMsgBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1.blurLevelCamera = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updatePoisonAreaTip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-39, warpins: 1 ---
	slot1 = slot0.contextData.chapterVO

	function getTypeEvent(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-43, warpins: 3 ---
		slot3 = nil

		for slot7, slot8 in ipairs(uv0:isLoop() and (pg.map_event_list[uv0.id] or {}.event_list_loop or {}) or pg.map_event_list[uv0.id] or .event_list or {}) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-42, warpins: 1 ---
			if pg.map_event_template[slot8].c_type == slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-40, warpins: 1 ---
				table.insert({}, slot9)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return slot1
		--- END OF BLOCK #0 ---



	end

	if getTypeEvent(ChapterConst.EvtType_Poison) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-37, warpins: 1 ---
		for slot6, slot7 in ipairs(slot2) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-37, warpins: 1 ---
			if slot7.round_gametip ~= nil and slot8 ~= "" and slot1:getRoundNum() == slot8[1] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 26-35, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n(slot8[2]))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-236, warpins: 1 ---
	if slot0.contextData.chapterVO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-13, warpins: 1 ---
		pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	if slot0.levelFleetView and slot0.levelFleetView.selectIds then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-43, warpins: 1 ---
		slot0.contextData.selectedFleetIDs = {}

		for slot4, slot5 in pairs(slot0.levelFleetView.selectIds) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-43, warpins: 1 ---
			for slot9, slot10 in pairs(slot5) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-41, warpins: 1 ---
				slot0.contextData.selectedFleetIDs[#slot0.contextData.selectedFleetIDs + 1] = slot10
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot0.levelStageView and slot0.levelStageView:CheckState(BaseSubView.STATES.INITED) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-59, warpins: 1 ---
		slot0.levelStageView:Destroy()
		--- END OF BLOCK #0 ---



	end

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

	for slot4, slot5 in pairs(slot0.mapItemTimer) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 100-106, warpins: 1 ---
		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 102-104, warpins: 1 ---
			slot5:Stop()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0.mapItemTimer = nil

	for slot4, slot5 in pairs(slot0.tweens) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 113-118, warpins: 1 ---
		LeanTween.cancel(slot5)
		--- END OF BLOCK #0 ---



	end

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

	if slot0.newChapterCDTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 134-139, warpins: 1 ---
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
		--- END OF BLOCK #0 ---



	end

	if slot0.resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 143-148, warpins: 1 ---
		slot0.resPanel:exit()

		slot0.resPanel = nil
		--- END OF BLOCK #0 ---



	end

	if slot0.activityBossBattlePanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 152-155, warpins: 1 ---
		slot0.activityBossBattlePanel:clear()
		--- END OF BLOCK #0 ---



	end

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
		--- BLOCK #0 197-228, warpins: 1 ---
		if not slot0.contextData.map:isActivity() and not slot2:isSham() and not slot2:isGuildBoss() and not slot2:isEscort() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 219-224, warpins: 1 ---
			slot1:recordLastMap(ChapterProxy.LAST_MAP, slot2.id)
			--- END OF BLOCK #0 ---



		end

		if Map.lastMapForActivity then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 229-235, warpins: 1 ---
			slot1:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, Map.lastMapForActivity)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

return slot0
