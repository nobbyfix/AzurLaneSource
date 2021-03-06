slot0 = class("LevelScene2", import("..base.BaseUI"))
slot1 = 0.5

if Application.isEditor then
	chapter_skip_battle = PlayerPrefs.GetInt("chapter_skip_battle") or 0

	function switch_chapter_skip_battle()
		chapter_skip_battle = 1 - chapter_skip_battle

		PlayerPrefs.SetInt("chapter_skip_battle", chapter_skip_battle)
		PlayerPrefs.Save()
		pg.TipsMgr:GetInstance():ShowTips((chapter_skip_battle == 1 and "已开启战斗跳略") or "已关闭战斗跳略")
	end
end

slot2 = {
	vanguard = 1,
	submarine = 3,
	main = 2
}

slot0.getUIName = function (slot0)
	return "LevelUI2"
end

slot0.preload = function (slot0, slot1)
	slot0.maps = getProxy(ChapterProxy):getMaps()

	if slot0.maps[slot0:selectMap(slot2)]:getConfig("bg") and #slot5 > 0 then
		GetSpriteFromAtlasAsync("levelmap/" .. slot4:getConfig("bg"), "", slot1)
	elseif slot4:getConfig("animtor") == 1 then
		PoolMgr.GetInstance():GetUI(slot4:getConfig("ani_name"), true, function (slot0)
			slot0:SetActive(false)

			slot0.tornadoTF = slot0
			slot0.aniName = slot0

			slot0()
		end)
	end
end

slot0.init = function (slot0)
	slot0.tweens = {}
	slot0.topPanel = slot0:findTF("top")
	slot0.topChapter = slot0:findTF("top_chapter", slot0.topPanel)
	slot0.leftChapter = slot0:findTF("main/left_chapter")
	slot0.leftCanvasGroup = slot0.leftChapter:GetComponent(typeof(CanvasGroup))
	slot0.rightChapter = slot0:findTF("main/right_chapter")
	slot0.rightCanvasGroup = slot0.rightChapter:GetComponent(typeof(CanvasGroup))
	slot0.topStage = slot0:findTF("top_stage", slot0.topPanel)
	slot0.bottomStage = slot0:findTF("bottom_stage", slot0.topPanel)
	slot0.leftStage = slot0:findTF("left_stage", slot0.topPanel)
	slot0.rightStage = slot0:findTF("right_stage", slot0.topPanel)
	slot0.chapterPanel = slot0:findTF("stage_info", slot0.topPanel)
	slot0.rescueSelect = slot0:findTF("rescue_select", slot0.topPanel)
	slot0.funcBtn = slot0:findTF("func_button", slot0.bottomStage)
	slot0.retreatBtn = slot0:findTF("retreat_button", slot0.bottomStage)
	slot0.resetBtn = slot0:findTF("reset_button", slot0.bottomStage)
	slot0.strategyInfo = slot0:findTF("strategy_info", slot0.topPanel)
	slot0.ambushInfo = slot0:findTF("ambush_info", slot0.topPanel)
	slot0.fleetSelect = slot0:findTF("fleet_select", slot0.topPanel)
	slot0.fleetEdit = slot0:findTF("fleet_select", slot0.topPanel)
	slot0.switchBtn = slot0:findTF("switch_button", slot0.bottomStage)
	slot0.repairWindow = slot0:findTF("repair_window", slot0.topPanel)
	slot0.shamShopBtn = slot0:findTF("btn_sham_shop", slot0.rightStage)
	slot0.damageText = slot0:findTF("damage", slot0.topPanel)
	slot0.mapHelpBtn = slot0:findTF("help_button", slot0.topPanel)
	slot0.avoidText = slot0:findTF("text_avoid", slot0.topPanel)
	slot0.moveDownText = slot0:findTF("text_move_down", slot0.topPanel)
	slot0.commanderTinkle = slot0:findTF("neko_tinkle", slot0.topPanel)
	slot0.remasterWindow = slot0:findTF("remaster_window", slot0.topPanel)
	slot0.panelBarrier = slot0:findTF("panel_barrier", slot0.rightStage)
	slot0.spResult = slot0:findTF("sp_result", slot0.topPanel)
	slot0.chapterName = slot0:findTF("title_chapter/name", slot0.topChapter)
	slot0.chapterNoTitle = slot0:findTF("title_chapter/chapter", slot0.topChapter)

	setActive(slot0.topChapter, true)
	setActive(slot0.leftChapter, true)
	setActive(slot0.rightChapter, true)
	setActive(slot0.topStage, true)
	setActive(slot0.leftStage, true)
	setActive(slot0.bottomStage, true)
	setActive(slot0.rightStage, true)
	setActive(slot0.chapterPanel, false)
	setActive(slot0.rescueSelect, false)
	setActive(slot0.strategyInfo, false)
	setActive(slot0.ambushInfo, false)
	setActive(slot0.fleetSelect, false)
	setActive(slot0.fleetEdit, false)
	setActive(slot0.repairWindow, false)
	setActive(slot0.damageText, false)
	setActive(slot0.mapHelpBtn, false)
	setActive(slot0.commanderTinkle, false)
	setActive(slot0.remasterWindow, false)
	setActive(slot0.panelBarrier, false)
	setActive(slot0.spResult, false)
	setAnchoredPosition(slot0.leftChapter, {
		x = 0
	})
	setAnchoredPosition(slot0.rightChapter, {
		x = 0
	})
	setAnchoredPosition(slot0.topChapter, {
		y = 0
	})
	setAnchoredPosition(slot0.topStage, {
		y = slot0.topStage.rect.height
	})
	setAnchoredPosition(slot0.bottomStage, {
		y = -slot0.bottomStage.rect.height
	})
	setAnchoredPosition(slot0.rightStage, {
		x = slot0.rightStage.rect.width + 200
	})
	setAnchoredPosition(slot0.leftStage, {
		x = -slot0.leftStage.rect.width - 200
	})

	slot0.map = slot0:findTF("map")
	slot0.mapWidth = 1920
	slot0.mapHeight = 1440
	slot0.UIFXList = slot0:findTF("map/UI_FX_list")

	for slot5 = 0, slot0.UIFXList:GetComponentsInChildren(typeof(Renderer)).Length - 1, 1 do
		slot1[slot5].sortingOrder = -1
	end

	slot0.float = slot0:findTF("float")
	slot0.clouds = slot0:findTF("clouds", slot0.float)
	slot0.chapters = slot0:findTF("levels", slot0.float)
	slot0.chapterTpl = slot0:findTF("level_tpl", slot0.float)
	slot0.escortChapters = slot0:findTF("escort_levels", slot0.float)
	slot0.escortChapterTpl = slot0:findTF("escort_level_tpl", slot0.float)
	slot0.resources = slot0:findTF("resources")
	slot0.shipTpl = slot0:findTF("ship_tpl", slot0.resources)
	slot0.subTpl = slot0:findTF("sub_tpl", slot0.resources)
	slot0.transportTpl = slot0:findTF("transport_tpl", slot0.resources)
	slot0.transportTargetTpl = slot0:findTF("transport_target_tpl", slot0.resources)
	slot0.enemyTpl = slot0:findTF("enemy_tpl", slot0.resources)

	setText(slot0:findTF("fighting/Text", slot0.enemyTpl), i18n("ui_word_levelui2_inevent"))

	slot0.deadTpl = slot0:findTF("dead_tpl", slot0.resources)
	slot0.boxTpl = slot0:findTF("box_tpl", slot0.resources)
	slot0.supplyTpl = slot0:findTF("supply_tpl", slot0.resources)
	slot0.rivalTpl = slot0:findTF("rival_tpl", slot0.resources)
	slot0.championTpl = slot0:findTF("champion_tpl", slot0.resources)
	slot0.oniTpl = slot0:findTF("oni_tpl", slot0.resources)
	slot0.spineTpl = slot0:findTF("spine_tpl", slot0.resources)
	slot0.oniTargetTpl = slot0:findTF("oni_target_tpl", slot0.resources)
	slot0.bombEnemyTpl = slot0:findTF("bomb_enemy_tpl", slot0.resources)
	slot0.arrowTarget = slot0:findTF("arrow_target", slot0.resources)

	setActive(slot0.arrowTarget, false)

	slot0.btnSpecial = slot0:findTF("event_btns/event_container/btn_special", slot0.rightChapter)
	slot0.dailyBtn = slot0:findTF("event_btns/event_container/daily_button", slot0.rightChapter)
	slot0.activityBtn = slot0:findTF("event_btns/activity_btn", slot0.rightChapter)
	slot0.shamBtn = slot0:findTF("event_btns/event_container/sham_button", slot0.rightChapter)
	slot0.ptTotal = slot0:findTF("event_btns/pt_text", slot0.rightChapter)
	slot0.ticketTxt = slot0:findTF("event_btns/tickets/Text", slot0.rightChapter)
	slot0.actExchangeShopBtn = slot0:findTF("event_btns/btn_exchange", slot0.rightChapter)
	slot0.mirrorBtn = slot0:findTF("event_btns/event_container/btn_mirror", slot0.rightChapter)
	slot0.countDown = slot0:findTF("event_btns/count_down", slot0.rightChapter)
	slot0.eventContainer = slot0:findTF("event_btns/event_container", slot0.rightChapter)
	slot0.actExtraRank = slot0:findTF("event_btns/act_extra_rank", slot0.rightChapter)
	slot0.btnPrev = slot0:findTF("btn_prev", slot0.leftChapter)
	slot0.btnPrevCol = slot0:findTF("btn_prev/prev_image", slot0.leftChapter)
	slot0.militaryExerciseBtn = slot0:findTF("event_btns/event_container/btn_pvp", slot0.rightChapter)
	slot0.escortBtn = slot0:findTF("event_btns/event_container/btn_escort", slot0.rightChapter)
	slot0.signalBtn = slot0:findTF("btn_signal", slot0.rightChapter)
	slot0.scenario = slot0:findTF("btn_scenario", slot0.leftChapter)
	slot0.eliteBtn = slot0:findTF("buttons/btn_elite", slot0.leftChapter)
	slot0.normalBtn = slot0:findTF("buttons/btn_normal", slot0.leftChapter)
	slot0.remasterBtn = slot0:findTF("buttons/btn_remaster", slot0.leftChapter)
	slot0.btnNext = slot0:findTF("btn_next", slot0.rightChapter)
	slot0.btnNextCol = slot0:findTF("btn_next/next_image", slot0.rightChapter)
	slot0.escortBar = slot0:findTF("escort_bar", slot0.leftChapter)
	slot0.eliteQuota = slot0:findTF("elite_quota", slot0.leftChapter)
	slot0.remasterTipTF = slot0:findTF("tip", slot0.remasterBtn)
	slot0.actNormalBtn = slot0:findTF("buttons/btn_act_normal/bg", slot0.leftChapter)

	setActive(slot0.actNormalBtn.parent, false)

	slot0.actEliteBtn = slot0:findTF("buttons/btn_act_elite/bg", slot0.leftChapter)

	setActive(slot0.actEliteBtn.parent, false)

	slot0.actExtraBtn = slot0:findTF("buttons/btn_act_extra/bg", slot0.leftChapter)
	slot0.actExtraBtnAnim = slot0:findTF("usm", slot0.actExtraBtn)

	setActive(slot0.chapters, true)
	setActive(slot0.chapterTpl, false)
	setActive(slot0.escortChapters, true)
	setActive(slot0.escortChapterTpl, false)
	setActive(slot0.clouds, true)
	setActive(slot0.resources, false)
	setActive(slot0.btnSpecial, true)
	setActive(slot0.scenario, false)
	setActive(slot0.eliteQuota, false)
	setActive(slot0.signalBtn, false)

	slot0.resChapter = slot0:findTF("resources", slot0.topChapter)
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel:setParent(slot0.resChapter, false)

	slot0.resStage = slot0:findTF("resources", slot0.topStage)
	slot0.resPanel1 = PlayerResource.New()

	slot0.resPanel1:setParent(slot0.resStage, false)

	slot0.levelCamIndices = 1
	slot0.levelCam = GameObject.Find("LevelCamera").transform.GetComponent(slot2, typeof(Camera))
	slot0.uiMain = GameObject.Find("LevelCamera").transform.Find(slot2, "Canvas/UIMain")

	setActive(slot0.uiMain, false)

	GetOrAddComponent(slot0.uiMain, typeof(Image)).color = Color.New(0, 0, 0, 0.5)
	slot0.levelGrid = slot0.uiMain:Find("LevelGrid")

	setActive(slot0.levelGrid, true)
	RemoveComponent(slot0.levelGrid, typeof(Image))

	slot0.dragLayer = slot0.levelGrid:Find("DragLayer") or cloneTplTo(slot0.levelGrid, slot0.levelGrid, "DragLayer")
	slot0.dragLayer.localEulerAngles = Vector3.zero
	slot0.uiCam = GameObject.Find("UICamera"):GetComponent(typeof(Camera))
	slot0.frozenCount = 0
	slot0.canvasGroup = slot0.topPanel:GetComponent("CanvasGroup")
	slot0.canvasGroup.blocksRaycasts = not slot0.canvasGroup.blocksRaycasts
	slot0.canvasGroup.blocksRaycasts = not slot0.canvasGroup.blocksRaycasts

	slot0:updateClouds()

	slot0.helpPage = slot0:findTF("help_page", slot0.topPanel)
	slot0.helpImage = slot0:findTF("icon", slot0.helpPage)
	slot0.helpBtn = slot0:findTF("help_button", slot0.bottomStage)

	setActive(slot0.helpPage, false)

	slot0.contextData.huntingRangeVisibility = 2
	slot0.mapItemTimer = {}
	slot0.commanderFormationPanel = CmdLevelFormationPanel.New(slot0:findTF("top/commander_panel"))

	slot0.commanderFormationPanel:attach(slot0)

	slot0.bombPanel = slot0.rightStage:Find("bomb_panel")
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

slot0.didEnter = function (slot0)
	slot0.openedCommanerSystem = not LOCK_COMMANDER and pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0.player.level, "CommandRoomMediator")

	onButton(slot0, slot0:findTF("back_button", slot0.topStage), function ()
		if slot0.contextData.chapterVO and slot0:getDataType() == ChapterConst.TypeGuild then
			slot0:emit(slot1.ON_BACK)

			return
		end

		slot0:switchToMap()
	end, SFX_CANCEL)
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
	onButton(slot0, slot0.helpBtn, function ()
		if slot0.contextData.chapterVO then
			if slot0:getDataType() == ChapterConst.TypeSham then
				slot0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("sham_battle_help_tip")
				})
			elseif slot1 == ChapterConst.TypeGuild then
				slot0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("guild_battle_help_tip")
				})
			elseif slot1 == ChapterConst.TypeNone then
				if slot0:existCoastalGunNoMatterLiveOrDead() then
					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = i18n("levelScene_coastalgun_help_tip")
					})
				elseif slot0:existOni() then
					pg.MsgboxMgr.GetInstance():ShowHelpWindow({
						helps = i18n("levelScene_sphunt_help_tip")
					})
				elseif slot0:isPlayingWithBombEnemy() then
					pg.MsgboxMgr.GetInstance():ShowHelpWindow({
						helps = i18n("levelScene_bomb_help_tip")
					})
				elseif pg.map_event_list[slot0.id] and pg.map_event_list[slot0.id].help_pictures and next(pg.map_event_list[slot0.id].help_pictures) ~= nil then
					slot2 = {
						disableScroll = true,
						pageMode = true,
						defaultpage = 1,
						ImageMode = true,
						windowSize = {
							x = 836,
							y = 740
						},
						windowPos = {
							y = 15
						},
						helpSize = {
							x = 836,
							y = 660
						}
					}

					for slot6, slot7 in pairs(pg.map_event_list[slot0.id].help_pictures) do
						table.insert(slot2, {
							icon = {
								path = "",
								atlas = slot7
							}
						})
					end

					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = slot2
					})
				else
					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = pg.gametip.help_level_ui.tip
					})
				end
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.scenario, function ()
		for slot4, slot5 in pairs(slot0.maps) do
			if slot5:isUnlock() and slot5:getMapType() == Map.SCENARIO then
				slot0 = slot5.id
			end
		end

		slot0:setMap(slot0)
	end)
	onButton(slot0, slot0.dailyBtn, function ()
		if slot0:isfrozen() then
			return
		end

		DailyLevelProxy.dailyLevelId = nil

		DailyLevelProxy:emit(LevelMediator2.ON_DAILY_LEVEL)
	end, SFX_PANEL)
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
	onButton(slot0, slot0.retreatBtn, function ()
		slot1 = "levelScene_whether_to_retreat"

		if slot0.contextData.chapterVO:existOni() then
			slot1 = "levelScene_oni_retreat"
		elseif slot0:isPlayingWithBombEnemy() then
			slot1 = "levelScene_bomb_retreat"
		elseif slot0:getPlayType() == ChapterConst.TypeTransport then
			slot1 = "levelScene_escort_retreat"
		end

		slot0:HandleShowMsgBox({
			content = i18n(slot1),
			onYes = function ()
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})
			end
		})
	end, SFX_UI_WEIGHANCHOR_WITHDRAW)
	onButton(slot0, slot0.switchBtn, function ()
		if slot0.contextData.chapterVO.getDataType(slot0) == ChapterConst.TypeSham then
			slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
		elseif slot1 == ChapterConst.TypeNone then
			if slot0:getNextValidIndex() > 0 then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSwitch,
					id = slot0.fleets[slot2].id
				})
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("formation_switch_failed"))
			end
		elseif slot1 == ChapterConst.TypeGuild then
			slot0:emit(LevelMediator2.ON_OPEN_GUILD_PRE_COMABT)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.funcBtn, function ()
		slot1 = slot0.contextData.chapterVO.getDataType(slot0)

		if not slot0.contextData.chapterVO:inWartime() then
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_time_out"))

			return
		end

		slot4 = slot0:getChapterCell(slot0.fleet.line.row, slot0.fleet.line.column)
		slot5 = false

		if slot0:existChampion(slot0.fleet.line.row, slot0.fleet.line.column) then
			slot5 = true

			if chapter_skip_battle == 1 then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSkipBattle,
					id = slot2.id
				})
			else
				slot0:emit(LevelMediator2.ON_STAGE)
			end
		elseif slot4.attachment == ChapterConst.AttachAmbush and slot4.flag == 2 then
			slot6 = nil


			-- Decompilation error in this vicinity:
			coroutine.wrap(function ()
				slot0:doAmbushWarning(slot0)
				coroutine.yield()
				coroutine.yield:displayAmbushInfo(coroutine.yield)
				coroutine.yield()
			end)()

			slot5 = true
		elseif Application.isEditor and (slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachRival or slot4.attachment == ChapterConst.AttachBoss) and chapter_skip_battle == 1 then
			if slot4.flag == 0 then
				slot5 = true

				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSkipBattle,
					id = slot2.id
				})
			end
		elseif slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachBoss then
			if slot4.flag == 0 then
				slot5 = true

				slot0:emit(LevelMediator2.ON_STAGE)
			end
		elseif slot4.attachment == ChapterConst.AttachBox then
			if slot4.flag == 0 then
				slot5 = true

				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpBox,
					id = slot2.id
				})
			end
		elseif slot4.attachment == ChapterConst.AttachSupply and slot4.attachmentId > 0 then
			slot5 = true
			slot6, slot7 = slot0:getFleetAmmo(slot0.fleet)

			if slot7 < slot6 then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSupply,
					id = slot2.id
				})
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("level_ammo_enough"))
			end
		elseif slot4.attachment == ChapterConst.AttachStory then
			slot5 = true
			slot6 = pg.StoryMgr:GetInstance():GetStoryByName("index")
			slot8 = pg.map_event_template[slot4.attachmentId].gametip

			if pg.map_event_template[slot4.attachmentId].memory == 0 then
				return
			end

			pg.ConnectionMgr.GetInstance():Send(11017, {
				story_id = slot7
			}, 11018, function (slot0)
				return
			end)
			pg.StoryMgr:GetInstance():Play(slot6[slot7], function ()
				slot1 = (pg.StoryMgr:GetInstance():getSelectedOptions() and (slot0[1] or 1)) or 1

				if slot0.flag == 0 then
					slot1:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpStory,
						id = slot2.id,
						arg1 = slot1
					})
				end

				if slot3 ~= "" then
					slot2 = nil

					for slot6, slot7 in pairs(pg.memory_template) do
						if slot7.story == slot4 then
							slot2 = slot7.title
						end
					end

					pg.TipsMgr:GetInstance():ShowTips(i18n(pg.TipsMgr.GetInstance().ShowTips, slot2))
				end
			end)
		elseif slot4.attachment == ChapterConst.AttachRival then
			if slot4.flag == 0 then
				slot5 = true

				if slot2:isValid() then
					slot0:emit(LevelMediator2.ON_PVP, slot4.rival)
				else
					slot0:HandleShowMsgBox({
						modal = true,
						content = i18n("formation_reform_tip"),
						onYes = function ()
							slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
						end
					})
				end
			end
		elseif slot4.attachment == ChapterConst.AttachAreaBoss and slot4.flag == 0 then
			slot5 = true

			slot0:emit(LevelMediator2.ON_OPEN_GUILD_PRE_COMABT)
		end

		if not slot5 then
			if slot0:getRound() == ChapterConst.RoundEnemy then
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("level_click_to_move"))
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.resetBtn, function ()
		if slot0.contextData.chapterVO:getDataType() == ChapterConst.TypeSham then
			if ChapterConst.ShamResetCountLimit <= slot0.contextData.chapterVO.shamResetCount then
				pg.TipsMgr.GetInstance():ShowTips(i18n("sham_reset_err_limit"))

				return
			end

			if slot0.contextData.chapterVO.active then
				slot0:HandleShowMsgBox({
					modal = true,
					content = i18n("sham_reset_confirm"),
					onYes = function ()
						slot0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpRetreat
						})
					end
				})
			else
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})
			end
		elseif slot0 == ChapterConst.TypeGuild and slot0.contextData.chapterVO.active then
			slot0:HandleShowMsgBox({
				modal = true,
				content = i18n("sham_reset_confirm"),
				onYes = function ()
					slot0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpRetreat
					})
				end
			})
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
	onButton(slot0, slot0.shamShopBtn, function ()
		if slot0:isfrozen() then
			return
		end

		slot0:emit(LevelMediator2.ON_OPEN_SHAM_SHOP)
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

	setActive(slot0.shamBtn, not ChapterConst.ActivateMirror and getProxy(ChapterProxy).getShamChapter(slot4):isOpen())

	if slot6 then
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
		slot14.onRemoved = function ()
			slot0:onSubLayerClose()
		end
	end

	if #slot9.children > 0 then
		slot0:onSubLayerOpen()
	else
		slot0:onSubLayerClose()
	end

	if not LOCK_SUBMARINE and not slot0.contextData.isSwitchToChapter then
		slot0:tryPlaySubGuide()
	end

	slot0:triggerCommanderPanel()

	if slot0.contextData.selectedChapterVO then
		slot0:displayFleetSelect(slot0.contextData.selectedChapterVO)
	end

	if slot4:ifShowRemasterTip() then
		SetActive(slot0.remasterTipTF, true)
	else
		SetActive(slot0.remasterTipTF, false)
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
	if slot0:isfrozen() or isActive(slot0.ambushInfo) then
		return
	end

	playSoundEffect(SFX_CANCEL)

	for slot5, slot6 in pairs(slot1) do
		if slot0[slot5] and slot0[slot5]._go and isActive(slot0[slot5]._go) then
			slot0[slot6](slot0)

			return
		end
	end

	if isActive(slot0.fleetEdit) then
		slot0:hideFleetEdit()

		return
	end

	if isActive(slot0.helpPage) then
		setActive(slot0.helpPage, false)

		return
	end

	if slot0.contextData.chapterVO and slot2:getDataType() ~= ChapterConst.TypeGuild then
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
	slot0.resPanel1:setResources(slot1)

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

			if slot0.signalPanel and isActive(slot0.signalPanel._tf) then
				slot0.signalPanel:flush()
			end
		end
	end

	if slot0.contextData.chapterVO and slot0.contextData.chapterVO:getDataType() == slot3 and slot0.contextData.chapterVO.id == slot1.id and slot1.active then
		slot0:setChapter(slot1)

		slot4 = false

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyFleet) > 0 then
			slot0:updateStageFleet()
			slot0:updateAmbushRate(slot1.fleet.line, true)
			slot0:updateFleetBuff()

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
			slot0:updateStageAchieve()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAttachment) > 0 then
			slot0:updateAmbushRate(slot1.fleet.line, true)

			if slot3 == ChapterConst.TypeSham then
				slot0:updateShamProgress()
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
			slot0:updateStageStrategy()
			slot0:updateFleetBuff()
			slot0:updateStageBarrier()
		end

		if slot2 < 0 or bit.band(slot2, ChapterConst.DirtyAutoAction) > 0 then
			slot0:tryAutoAction()
		elseif slot4 then
			slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
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
	--- BLOCK #3 46-55, warpins: 2 ---
	slot6 = getProxy(ChapterProxy).getChapterById(slot5, 304)

	if LOCK_SOS then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-60, warpins: 1 ---
		setActive(slot0.signalBtn, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-64, warpins: 1 ---
		slot7 = setActive
		slot8 = slot0.signalBtn

		if slot6 and slot6:isClear() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 70-73, warpins: 1 ---
			if slot3 ~= Map.SCENARIO and slot3 ~= Map.ELITE then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-79, warpins: 1 ---
				slot9 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 80-80, warpins: 2 ---
				slot9 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 81-81, warpins: 4 ---
		slot7(slot8, slot9)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 82-89, warpins: 2 ---
	slot7 = false
	slot9 = nil

	if ActivityLevelConst.hasExtraMap(slot0.maps) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-94, warpins: 1 ---
		slot10 = _.any

		if not slot0.battleActivitys then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-95, warpins: 1 ---
			slot11 = {}
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 96-98, warpins: 2 ---
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
	--- BLOCK #5 99-100, warpins: 2 ---
	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 101-104, warpins: 1 ---
		if slot3 ~= Map.ACT_EXTRA then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 105-106, warpins: 1 ---
			slot10 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 107-107, warpins: 1 ---
			slot10 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 108-134, warpins: 3 ---
	slot11 = slot0.contextData.map:existHardMap()
	slot13 = ActivityLevelConst.isClearMaps(slot12, Map.ACTIVITY_EASY)
	slot14 = ActivityLevelConst.isClearMaps(slot12, Map.ACTIVITY_HARD)
	slot15 = setActive
	slot16 = slot0.actExtraBtn.parent

	if slot7 and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 137-138, warpins: 1 ---
		if not slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 139-140, warpins: 1 ---
			slot17 = not slot2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 141-142, warpins: 1 ---
			slot17 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 143-143, warpins: 0 ---
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
	--- BLOCK #7 144-149, warpins: 5 ---
	slot15(slot16, slot17)

	slot15 = setActive
	slot16 = slot0.actEliteBtn.parent

	if slot11 and (slot3 ~= Map.ACTIVITY_EASY or (not slot4 and not slot2)) and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 160-160, warpins: 1 ---
		slot17 = slot10
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 161-168, warpins: 5 ---
	slot15(slot16, slot17)

	slot15 = setActive
	slot16 = slot0.actNormalBtn.parent

	if (slot3 ~= Map.ACTIVITY_HARD or (not slot4 and not slot2)) and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 175-175, warpins: 1 ---
		slot17 = slot10
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 176-180, warpins: 4 ---
	slot15(slot16, slot17)

	slot15 = setActive
	slot16 = slot0.actExtraRank

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 181-181, warpins: 1 ---
		slot17 = slot10
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 182-189, warpins: 2 ---
	slot15(slot16, slot17)
	setActive(slot0.ticketTxt.parent, slot2)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 190-199, warpins: 1 ---
		setText(slot0.ticketTxt, slot5.remasterTickets .. " / " .. pg.gameset.reactivity_ticket_max.key_value)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 200-201, warpins: 2 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 202-208, warpins: 1 ---
		setActive(slot0.eliteQuota, false)
		slot0:updateActivityRes()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 209-217, warpins: 2 ---
	slot15 = setActive
	slot16 = tf(slot0.ptTotalTxt.gameObject).parent

	if not LOCK_PT_VALUE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 218-220, warpins: 1 ---
		if slot0.ptActivity then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 221-226, warpins: 1 ---
			if not slot0.ptActivity:isEnd() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 227-228, warpins: 1 ---
				slot17 = isActivityMap
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 229-230, warpins: 2 ---
		slot17 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 231-231, warpins: 0 ---
			slot17 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 232-238, warpins: 4 ---
	slot15(slot16, slot17)

	if ActivityConst.BATTLE_MAP_TYPE == Map.SINGLE_MAP then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 239-255, warpins: 1 ---
		setActive(slot0.ptTotal, false)
		setActive(slot0.actExchangeShopBtn, false)
		setActive(slot0.mirrorBtn, false)
		setActive(slot0.eventContainer, true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 256-261, warpins: 1 ---
		if ActivityConst.BATTLE_MAP_TYPE == Map.MUTIL_MAP then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 262-267, warpins: 1 ---
			slot15 = setActive
			slot16 = slot0.ptTotal

			if not ActivityConst.HIDE_PT_PANELS then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 268-270, warpins: 1 ---
				if slot0.ptActivity and not slot0.ptActivity:isEnd() and slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 279-280, warpins: 1 ---
					slot17 = not slot2
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 281-282, warpins: 2 ---
				slot17 = false

				if false then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 283-283, warpins: 0 ---
					slot17 = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 284-288, warpins: 5 ---
			slot15(slot16, slot17)

			slot15 = setActive
			slot16 = slot0.actExchangeShopBtn

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 289-292, warpins: 1 ---
				if not ActivityConst.HIDE_PT_PANELS then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 293-294, warpins: 1 ---
					slot17 = slot4
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 295-296, warpins: 1 ---
					slot17 = false

					if false then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 297-297, warpins: 0 ---
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
			--- BLOCK #2 298-306, warpins: 4 ---
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
	--- BLOCK #14 307-309, warpins: 3 ---
	if LOCK_PT_VALUE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 310-317, warpins: 1 ---
		setActive(tf(slot0.ptTotalTxt.gameObject).parent, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 318-319, warpins: 2 ---
	if not slot11 or not slot14 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 322-323, warpins: 2 ---
		if not slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 324-325, warpins: 1 ---
			slot15 = slot13
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 326-327, warpins: 1 ---
			slot15 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 328-328, warpins: 0 ---
				slot15 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 329-330, warpins: 4 ---
	if slot7 and slot1 and not slot10 and slot15 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 337-341, warpins: 1 ---
		setActive(slot0.actExtraBtnAnim, true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 342-345, warpins: 4 ---
		setActive(slot0.actExtraBtnAnim, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #17 346-353, warpins: 2 ---
	slot0:updateCountDown()
	slot0:registerActBtn()

	if slot1 and not slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 356-359, warpins: 1 ---
		Map.lastMapForActivity = slot0.contextData.mapIdx
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 360-361, warpins: 3 ---
	return
	--- END OF BLOCK #18 ---



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
			--- BLOCK #0 22-33, warpins: 1 ---
			slot0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("activity_level_inwarime_tip", slot0)
			})

			return true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 34-35, warpins: 2 ---
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
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0.contextData.mapIdx = slot1
	slot0.contextData.map = slot0.maps[slot1]

	slot0:updateBattleActivity(slot1)
	slot0:updateMap()
	slot0:tryPlayMapStory()

	return
	--- END OF BLOCK #0 ---



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
		--- BLOCK #3 364-431, warpins: 4 ---
		slot17 = findTF(slot5, "circle")

		LeanTween.cancel(go(slot17))

		slot17.localScale = Vector3.zero

		LeanTween.scale(slot17, Vector3(1, 1, 1), 0.2):setDelay(0.3)
		setAnchoredPosition(slot18, {
			x = -1 * slot5:Find("info").rect.width
		})
		shiftPanel(slot18, 0, nil, 0.4, 0.4, true, true, nil, slot3)

		slot20 = pg.expedition_data_template[slot2:getConfig("boss_expedition_id")]
		slot21 = findTF(slot5, "mark")

		if not slot0.markRawPos then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 432-433, warpins: 1 ---
			slot0.markRawPos = slot21.anchoredPosition
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 434-449, warpins: 2 ---
		slot21.anchoredPosition = slot0.markRawPos
		slot22 = math.max(slot20.bonus_time - slot2.todayDefeatCount, 0)

		if slot0.contextData.map:isRemaster() or slot20.bonus_time <= 0 or slot22 <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 457-458, warpins: 3 ---
			slot23 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 459-459, warpins: 1 ---
			slot23 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 460-475, warpins: 2 ---
		slot24 = slot2:getOniChapterInfo()

		setActive(slot21:Find("bonus"), slot23)
		setActive(slot21, slot23)

		if slot23 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 476-517, warpins: 1 ---
			slot26 = slot21.anchoredPosition.y
			slot21:GetComponent(typeof(CanvasGroup)).alpha = 0

			LeanTween.cancel(go(slot21))
			LeanTween.value(go(slot21), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)

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
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 518-518, warpins: 2 ---
		--- END OF BLOCK #6 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 519-525, warpins: 2 ---
	slot7 = onButton
	slot8 = slot0

	if not isActive(slot5) or not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 528-528, warpins: 2 ---
		slot9 = slot6
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 529-533, warpins: 2 ---
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
			--- BLOCK #0 91-108, warpins: 1 ---
			slot0:displayChapterPanel(slot1, Vector3(slot2.localPosition.x - 10, slot2.localPosition.y + 150))
			slot0:tryPlayChapterInfoGuide(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 109-109, warpins: 2 ---
		return
		--- END OF BLOCK #7 ---



	end, SFX_UI_WEIGHANCHOR_SELECT)

	return
	--- END OF BLOCK #3 ---



end

slot0.tryPlayChapterInfoGuide = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot1:existLoop() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-15, warpins: 1 ---
		pg.GuideMgr:GetInstance():play("NG0013", {})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



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
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.signalPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot1 = SignalPanel.New(slot0.rescueSelect)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-40, warpins: 2 ---
	slot0.signalPanel = slot1

	slot0.signalPanel:attach(slot0)
	slot0.signalPanel:set(slot0.maps, slot0.subRefreshCount, slot0.subProgress)

	slot0.signalPanel.onGo = function (slot0)

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



	end

	slot0.signalPanel.onSearch = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot0:hideSignalPanel()
		slot0.hideSignalPanel:emit(LevelMediator2.ON_REFRESH_SUB_CHAPTER)

		return
		--- END OF BLOCK #0 ---



	end

	slot0.signalPanel.onCancel = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideSignalPanel()

		return
		--- END OF BLOCK #0 ---



	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.signalPanel._tf)

	return
	--- END OF BLOCK #1 ---



end

slot0.hideSignalPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.signalPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-23, warpins: 1 ---
		slot0.signalPanel:detach()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.signalPanel._tf, slot0._tf)
		setParent(slot0.signalPanel._tf, slot0.topPanel, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-24, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



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
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.levelInfoPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot3 = LevelInfoPanel.New(slot0.chapterPanel)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-36, warpins: 2 ---
	slot0.levelInfoPanel = slot3

	slot0.levelInfoPanel:attach(slot0)
	slot0.levelInfoPanel:set(slot1, slot2)

	slot0.levelInfoPanel.onConfirm = function (slot0)

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



	end

	slot0.levelInfoPanel.onCancel = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideChapterPanel()

		return
		--- END OF BLOCK #0 ---



	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.levelInfoPanel._tf)

	return
	--- END OF BLOCK #1 ---



end

slot0.hideChapterPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.levelInfoPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-23, warpins: 1 ---
		slot0.levelInfoPanel:detach()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.levelInfoPanel._tf, slot0._tf)
		setParent(slot0.levelInfoPanel._tf, slot0.topPanel, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-24, warpins: 2 ---
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
	--- BLOCK #1 15-17, warpins: 2 ---
	if not slot0.levelFleetPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-22, warpins: 1 ---
		slot3 = LevelFleetPanel.New(slot0.fleetSelect.gameObject)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-52, warpins: 2 ---
	slot0.levelFleetPanel = slot3

	slot0.levelFleetPanel:attach(slot0)
	slot0.levelFleetPanel:set(slot1, slot0.fleets, slot2)

	slot0.levelFleetPanel.onConfirm = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0:getConfig("npc_data") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-17, warpins: 1 ---
			slot4 = getProxy(TaskProxy):getTaskById(slot1[3])

			if slot1[3] == 0 or (slot4 and not slot4:isFinish()) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-43, warpins: 2 ---
				slot8 = slot1.fleets[slot0[1]]
				slot7 = slot1.fleets[slot0[1]].getTeamByName

				if pg.ship_data_by_type[pg.ship_data_statistics[slot1[1]].type].team_type ~= TeamType.Vanguard or not Fleet.VANGUARD then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 48-49, warpins: 2 ---
					slot9 = Fleet.MAIN
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 50-53, warpins: 2 ---
				if #slot7(slot8, slot9) == 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 54-64, warpins: 1 ---
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

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 65-70, warpins: 4 ---
		slot2 = false
		slot3 = ""

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 71-83, warpins: 0 ---
		for slot7, slot8 in ipairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 71-80, warpins: 1 ---
			slot2, slot3 = slot1.fleets[slot8]:GetEnergyStatus()

			if slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 81-81, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 82-83, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 84-86, warpins: 2 ---
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
			--- BLOCK #0 87-94, warpins: 1 ---
			slot1:HandleShowMsgBox({
				content = slot3,
				onYes = slot4
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-96, warpins: 1 ---
			slot4()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 97-106, warpins: 2 ---
		slot1.contextData.selectedChapterVO = nil
		slot1.contextData.selectedFleetIDs = nil

		return
		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 107-107, warpins: 2 ---
		--- END OF BLOCK #5 ---



	end

	slot0.levelFleetPanel.onCancel = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0.contextData.selectedChapterVO = nil
		slot0.contextData.contextData.selectedFleetIDs = nil

		slot0.contextData.contextData:hideFleetSelect()

		return
		--- END OF BLOCK #0 ---



	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.levelFleetPanel._tf)

	return
	--- END OF BLOCK #2 ---



end

slot0.hideFleetSelect = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.levelFleetPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-23, warpins: 1 ---
		slot0.levelFleetPanel:detach()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.levelFleetPanel._tf, slot0._tf)
		setParent(slot0.levelFleetPanel._tf, slot0.topPanel, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-24, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



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
	--- BLOCK #1 22-29, warpins: 2 ---
	setActive(slot0.scenario, false)

	if Map.EVENT == slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-38, warpins: 1 ---
		setActive(slot0.normalBtn, false)
		setActive(slot0.eliteBtn, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-44, warpins: 1 ---
		slot4 = setActive
		slot5 = slot0.normalBtn

		if slot2 ~= Map.ELITE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-46, warpins: 1 ---
			slot6 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-47, warpins: 1 ---
			slot6 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 48-54, warpins: 2 ---
		slot4(slot5, slot6)

		slot4 = setActive
		slot5 = slot0.eliteQuota

		if slot2 ~= Map.ELITE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 55-56, warpins: 1 ---
			slot6 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-57, warpins: 1 ---
			slot6 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 58-64, warpins: 2 ---
		slot4(slot5, slot6)

		slot4 = setActive
		slot5 = slot0.eliteBtn

		if slot2 ~= Map.SCENARIO then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 65-66, warpins: 1 ---
			slot6 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 67-67, warpins: 1 ---
			slot6 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 68-84, warpins: 2 ---
		slot4(slot5, slot6)

		slot6 = setActive
		slot7 = slot0.eliteBtn:Find("bg/pic_activity")

		if getProxy(ActivityProxy).getActivityById(slot4, ActivityConst.ELITE_AWARD_ACTIVITY_ID) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-88, warpins: 1 ---
			slot8 = not slot5:isEnd()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 89-89, warpins: 2 ---
		slot6(slot7, slot8)
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 90-93, warpins: 2 ---
	slot4 = pairs

	if not slot0.chapterTFsById then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 94-94, warpins: 1 ---
		slot5 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 95-96, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 97-123, warpins: 0 ---
	for slot7, slot8 in slot4(slot5) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 97-102, warpins: 1 ---
		if slot1:getChapter(slot7) and (slot9:isUnlock() or slot9:activeAlways()) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 113-117, warpins: 2 ---
			setActive(slot8, true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 118-121, warpins: 2 ---
			setActive(slot8, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 122-123, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 124-124, warpins: 1 ---
	return
	--- END OF BLOCK #5 ---



end

slot0.flushFleetEditButton = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-51, warpins: 1 ---
	slot2 = findTF(slot0.fleetEdit, "panel/fleet")
	slot3 = findTF(slot0.fleetEdit, "panel/sub")
	slot4 = findTF(slot0.fleetEdit, "panel/shiptpl")
	slot5 = findTF(slot0.fleetEdit, "panel/emptytpl")

	setActive(findTF(slot0.fleetEdit, "mask"), false)
	setActive(findTF(slot0.fleetEdit, "panel/limit"), false)

	slot7 = findTF(slot0.fleetEdit, "panel/limit_elite")
	slot9 = findTF(slot0.fleetEdit, "panel/limit_elite/limit_list")
	slot10 = setActive
	slot11 = findTF(slot0.fleetEdit, "panel/limit_tip")

	if #slot1:getConfig("property_limitation") ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-53, warpins: 1 ---
		slot12 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-54, warpins: 1 ---
		slot12 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 55-60, warpins: 2 ---
	slot10(slot11, slot12)

	slot10 = setActive
	slot11 = slot7

	if #slot8 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-62, warpins: 1 ---
		slot12 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-63, warpins: 1 ---
		slot12 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 64-69, warpins: 2 ---
	slot10(slot11, slot12)
	removeAllChildren(slot9)

	if slot8 ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-84, warpins: 1 ---
		slot10, slot11 = slot1:IsPropertyLimitationSatisfy()

		setActive(slot12, false)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 85-133, warpins: 0 ---
		for slot16, slot17 in ipairs(slot8) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-112, warpins: 1 ---
			setActive(slot21, true)

			slot22 = AttributeType.EliteCondition2Name(slot18) .. AttributeType.eliteConditionCompare[slot17[2]] .. slot20 .. "（" .. slot11[slot17[1]] .. "）"

			if slot10[slot16] == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 113-118, warpins: 1 ---
				slot22 = setColorStr(slot22, COLOR_YELLOW)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 119-123, warpins: 1 ---
				slot22 = setColorStr(slot22, COLOR_RED)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 124-131, warpins: 2 ---
			setText(slot0:findTF("Text", slot21), slot22)
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 132-133, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 134-145, warpins: 1 ---
		slot13 = setActive
		slot14 = slot7:Find("sub")

		if slot1:getConfig("submarine_num") <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 146-147, warpins: 1 ---
			slot15 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 148-148, warpins: 1 ---
			slot15 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 149-149, warpins: 2 ---
		slot13(slot14, slot15)
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 150-162, warpins: 2 ---
	slot10 = slot1:getEliteFleetList()

	function slot11(slot0, slot1, slot2, slot3)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot5 = {}
		slot6 = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-28, warpins: 0 ---
		for slot10, slot11 in ipairs(slot4) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-21, warpins: 1 ---
			slot5[slot1.shipVOs[slot11]] = true

			if slot1 == slot1.shipVOs[slot11]:getTeamType() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-26, warpins: 1 ---
				table.insert(slot6, slot11)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 27-28, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 29-53, warpins: 1 ---
		removeAllChildren(slot7)

		slot8 = 0
		slot9 = false
		slot10 = 0

		table.sort(slot2, function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			if type(slot0) == type(slot1) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-10, warpins: 1 ---
				if slot3 >= slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 11-12, warpins: 1 ---
					slot4 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-13, warpins: 1 ---
					slot4 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 14-15, warpins: 2 ---
				return slot4
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-17, warpins: 1 ---
				if slot1 == 0 or (slot3 == "string" and slot0 ~= 0) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 22-24, warpins: 2 ---
					return true
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 25-26, warpins: 2 ---
					return false
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 27-27, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)

		slot11 = {}
		slot12 = {}

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 54-304, warpins: 0 ---
		for slot16 = 1, 3, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 54-57, warpins: 2 ---
			slot17, slot18, slot19 = nil

			if not slot6[slot16] or not slot1.shipVOs[slot6[slot16]] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 64-64, warpins: 2 ---
				slot20 = nil
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 65-66, warpins: 2 ---
			if slot20 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 67-70, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 71-141, warpins: 0 ---
				for slot24, slot25 in ipairs(slot2) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 71-75, warpins: 1 ---
					if type(slot25) == "number" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 76-77, warpins: 1 ---
						if slot25 == 0 or slot20:getShipType() == slot25 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 83-96, warpins: 2 ---
							slot18 = slot20
							slot19 = slot25

							table.remove(slot2, slot24)
							table.insert(slot11, slot24)

							if not slot9 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 97-101, warpins: 1 ---
								if slot20:getShipType() ~= slot25 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 102-103, warpins: 1 ---
									slot9 = false
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 104-104, warpins: 1 ---
									slot9 = true
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 105-105, warpins: 3 ---
							--- END OF BLOCK #1 ---

							FLOW; TARGET BLOCK #2



							-- Decompilation error in this vicinity:
							--- BLOCK #2 106-106, warpins: 3 ---
							break
							--- END OF BLOCK #2 ---

							FLOW; TARGET BLOCK #3



							-- Decompilation error in this vicinity:
							--- BLOCK #3 106-106, warpins: 0 ---
							--- END OF BLOCK #3 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 107-111, warpins: 1 ---
						if type(slot25) == "string" and table.contains(Clone(ShipType.BundleList[slot25]), slot20:getShipType()) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 126-139, warpins: 1 ---
							slot18 = slot20
							slot19 = slot25

							table.remove(slot2, slot24)
							table.insert(slot11, slot24)

							slot9 = true

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 140-140, warpins: 1 ---
							break
							--- END OF BLOCK #1 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 140-141, warpins: 5 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 142-142, warpins: 1 ---
				--- END OF BLOCK #2 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 143-153, warpins: 1 ---
				slot19 = slot2[1]

				table.remove(slot2, 1)
				table.insert(slot11, 1)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 154-155, warpins: 4 ---
			if slot19 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 156-156, warpins: 1 ---
				slot10 = slot10 + 1
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 157-158, warpins: 2 ---
			if not slot18 or not cloneTplTo(slot2, slot7) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 165-168, warpins: 2 ---
				slot21 = cloneTplTo(slot3, slot7)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 169-179, warpins: 2 ---
			table.insert(slot12, slot21)
			setActive(slot21, true)

			if slot18 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 180-195, warpins: 1 ---
				updateShip(slot21, slot18)
				setActive(slot1:findTF("event_block", slot21), slot18.inEvent)

				slot5[slot18] = true
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 196-196, warpins: 1 ---
				slot8 = slot8 + 1
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 197-215, warpins: 2 ---
			slot17 = findTF(slot21, "icon_bg")

			setActive(slot1:findTF("ship_type", slot21), true)

			if type(slot19) == "number" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 216-217, warpins: 1 ---
				if slot19 ~= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 218-235, warpins: 1 ---
					setImageSprite(slot1:findTF("ship_type", slot21), GetSpriteFromAtlas("shiptype", ShipType.Type2CNLabel(slot19)), true)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 236-245, warpins: 1 ---
					setActive(slot1:findTF("ship_type", slot21), false)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 246-250, warpins: 1 ---
				if type(slot19) == "string" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 251-267, warpins: 1 ---
					setImageSprite(slot1:findTF("ship_type", slot21), GetSpriteFromAtlas("shiptype", ShipType.BundleType2CNLabel(slot19)), true)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #5 ---

			FLOW; TARGET BLOCK #6



			-- Decompilation error in this vicinity:
			--- BLOCK #6 268-304, warpins: 4 ---
			table.sort(slot22, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-12, warpins: 1 ---
				if slot0[slot0:getTeamType()] >= slot0[slot1:getTeamType()] and (slot0[slot0:getTeamType()] ~= slot0[slot1:getTeamType()] or table.indexof(slot1, slot0.id) >= table.indexof(slot1, slot1.id)) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-38, warpins: 2 ---
					slot2 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-39, warpins: 2 ---
					slot2 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 40-40, warpins: 2 ---
				return slot2
				--- END OF BLOCK #1 ---



			end)

			slot23 = GetOrAddComponent(slot17, typeof(UILongPressTrigger))

			function slot24()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-24, warpins: 1 ---
				slot0:hideFleetEdit()
				slot0.hideFleetEdit:emit(LevelMediator2.ON_ELITE_OEPN_DECK, {
					shipType = slot1,
					fleet = slot2,
					chapter = slot3,
					shipVO = slot3,
					fleetIndex = slot5,
					teamType = slot6
				})

				return
				--- END OF BLOCK #0 ---



			end

			slot23.onReleased:RemoveAllListeners()
			slot23.onLongPressed:RemoveAllListeners()
			slot23.onReleased:AddListener(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-3, warpins: 1 ---
				slot0()

				return
				--- END OF BLOCK #0 ---



			end)
			slot23.onLongPressed:AddListener(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-3, warpins: 1 ---
				if not slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 4-6, warpins: 1 ---
					slot1()
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 7-24, warpins: 1 ---
					slot2:hideFleetEdit()
					slot2:emit(LevelMediator2.ON_FLEET_SHIPINFO, {
						shipId = slot0.id,
						shipVOs = slot3,
						chapter = slot3
					})
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 25-25, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #6 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 305-306, warpins: 1 ---
		if (slot9 == true or slot10 == 3) and slot8 ~= 3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 311-314, warpins: 1 ---
			return true
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 315-317, warpins: 2 ---
			return false
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 318-319, warpins: 2 ---
		return
		--- END OF BLOCK #5 ---



	end

	function slot12(slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot4 = slot2:getEliteFleetCommanders()[slot0]

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-92, warpins: 0 ---
		for slot8 = 1, 2, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-12, warpins: 2 ---
			slot10 = nil

			if slot4[slot8] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-20, warpins: 1 ---
				slot10 = getProxy(CommanderProxy):getCommanderById(slot9)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-44, warpins: 2 ---
			slot11 = slot1:Find("pos" .. slot8)

			setActive(slot12, not slot10)
			setActive(slot11:Find("info"), slot10)

			if slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 45-74, warpins: 1 ---
				setImageSprite(slot13:Find("frame"), GetSpriteFromAtlas("weaponframes", "commander_" .. slot14))
				GetImageSpriteFromAtlasAsync("CommanderHrz/" .. slot10:getPainting(), "", slot13:Find("mask/icon"))
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 75-92, warpins: 2 ---
			slot14 = slot2:wrapEliteFleet(slot0)

			onButton(slot0, slot12, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot0:openCommanderPanel(slot0, slot2.id, )

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			onButton(slot0, slot13, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot0:openCommanderPanel(slot0, slot2.id, )

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 93-94, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	slot13 = slot1:getConfig("limitation")

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 163-318, warpins: 0 ---
	for slot17 = 1, 2, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 163-208, warpins: 2 ---
		slot18 = slot2:GetChild(slot17 - 1)
		slot19 = slot0:findTF("btn_clear", slot18)
		slot20 = slot0:findTF("btn_recom", slot18)
		slot22 = slot0:findTF("blank", slot18)
		slot23 = slot0:findTF("commander", slot18)

		setActive(slot21, false)
		setActive(findTF(slot18, "selected"), false)

		if slot17 > slot1:getConfig("group_num") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 209-210, warpins: 1 ---
			slot24 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 211-211, warpins: 1 ---
			slot24 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 212-231, warpins: 2 ---
		setActive(findTF(slot18, TeamType.Main), slot24)
		setActive(findTF(slot18, TeamType.Vanguard), slot24)

		slot25 = setActive
		slot26 = slot19

		if slot24 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 232-234, warpins: 1 ---
			slot27 = not slot0.contextData.EditingCommander
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 235-239, warpins: 2 ---
		slot25(slot26, slot27)

		slot25 = setActive
		slot26 = slot20

		if slot24 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 240-242, warpins: 1 ---
			slot27 = not slot0.contextData.EditingCommander
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 243-253, warpins: 2 ---
		slot25(slot26, slot27)
		setActive(slot22, not slot24)

		slot25 = setActive
		slot26 = slot23

		if slot0.contextData.EditingCommander then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 254-254, warpins: 1 ---
			slot27 = slot24
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 255-263, warpins: 2 ---
		slot25(slot26, slot27)

		slot25 = setText
		slot26 = slot0:findTF("bg/name", slot18)

		if not slot24 or not Fleet.DEFAULT_NAME[slot17] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 269-269, warpins: 2 ---
			slot27 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 270-272, warpins: 2 ---
		slot25(slot26, slot27)

		if slot24 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 273-296, warpins: 1 ---
			slot29 = slot11(slot18, TeamType.Vanguard, slot27, slot17)

			slot12(slot17, slot23, slot1)

			if slot11(slot18, TeamType.Main, slot26, slot17) and slot29 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 299-306, warpins: 1 ---
				setActive(slot0:findTF("selected", slot18), true)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 307-316, warpins: 3 ---
			onButton(slot0, slot19, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				if #slot0[slot1] ~= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 7-17, warpins: 1 ---
					slot2:HandleShowMsgBox({
						content = i18n("battle_preCombatLayer_clear_confirm"),
						onYes = function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-12, warpins: 1 ---
							slot0:emit(LevelMediator2.ON_ELITE_CLEAR, {
								index = slot1,
								chapterVO = LevelMediator2.ON_ELITE_CLEAR
							})

							return
							--- END OF BLOCK #0 ---



						end
					})
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-18, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)
			onButton(slot0, slot20, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				if #slot0[slot1] ~= 6 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 7-8, warpins: 1 ---
					if slot0 ~= 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 9-20, warpins: 1 ---
						slot2:HandleShowMsgBox({
							content = i18n("battle_preCombatLayer_auto_confirm"),
							onYes = function ()

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-12, warpins: 1 ---
								slot0:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
									index = slot1,
									chapterVO = LevelMediator2.ON_ELITE_RECOMMEND
								})

								return
								--- END OF BLOCK #0 ---



							end
						})
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 21-31, warpins: 1 ---
						slot2:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
							index = slot1,
							chapterVO = LevelMediator2.ON_ELITE_RECOMMEND
						})
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 32-32, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 317-318, warpins: 2 ---
		--- END OF BLOCK #6 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 319-322, warpins: 1 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 323-501, warpins: 0 ---
	for slot17 = 1, 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 323-375, warpins: 2 ---
		slot18 = slot17 + 2
		slot19 = slot3:GetChild(slot17 - 1)
		slot20 = slot0:findTF("btn_clear", slot19)
		slot21 = slot0:findTF("btn_recom", slot19)
		slot23 = slot0:findTF("blank", slot19)
		slot24 = slot0:findTF("commander", slot19)

		setActive(slot22, false)
		setActive(findTF(slot19, "selected"), false)

		slot25 = setActive
		slot26 = findTF(slot19, TeamType.Submarine)

		if slot17 > slot1:getConfig("submarine_num") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 376-377, warpins: 1 ---
			slot27 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 378-378, warpins: 1 ---
			slot27 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 379-387, warpins: 2 ---
		slot25(slot26, slot27)

		slot25 = setActive
		slot26 = slot20

		if slot17 <= slot1:getConfig("submarine_num") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 388-391, warpins: 1 ---
			slot27 = not slot0.contextData.EditingCommander
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 392-393, warpins: 1 ---
			slot27 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 394-394, warpins: 0 ---
				slot27 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 395-403, warpins: 3 ---
		slot25(slot26, slot27)

		slot25 = setActive
		slot26 = slot21

		if slot17 <= slot1:getConfig("submarine_num") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 404-407, warpins: 1 ---
			slot27 = not slot0.contextData.EditingCommander
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 408-409, warpins: 1 ---
			slot27 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 410-410, warpins: 0 ---
				slot27 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 411-419, warpins: 3 ---
		slot25(slot26, slot27)

		slot25 = setActive
		slot26 = slot23

		if slot1:getConfig("submarine_num") >= slot17 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 420-421, warpins: 1 ---
			slot27 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 422-422, warpins: 1 ---
			slot27 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 423-431, warpins: 2 ---
		slot25(slot26, slot27)

		slot25 = setActive
		slot26 = slot24

		if slot17 <= slot1:getConfig("submarine_num") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 432-434, warpins: 1 ---
			slot27 = slot0.contextData.EditingCommander
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 435-436, warpins: 1 ---
			slot27 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 437-437, warpins: 0 ---
				slot27 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 438-450, warpins: 3 ---
		slot25(slot26, slot27)

		slot25 = setText
		slot26 = slot0:findTF("bg/name", slot19)

		if slot17 > slot1:getConfig("submarine_num") or not Fleet.DEFAULT_NAME[(Fleet.SUBMARINE_FLEET_ID + slot17) - 1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 460-460, warpins: 2 ---
			slot27 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 461-472, warpins: 2 ---
		slot25(slot26, slot27)
		slot12(slot18, slot24, slot1)

		if slot17 <= slot1:getConfig("submarine_num") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 473-481, warpins: 1 ---
			if slot11(slot19, TeamType.Submarine, {
				0,
				0,
				0
			}, slot18) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 482-489, warpins: 1 ---
				setActive(slot0:findTF("selected", slot19), true)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 490-499, warpins: 2 ---
			onButton(slot0, slot20, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				if #slot0[slot1] ~= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 7-17, warpins: 1 ---
					slot2:HandleShowMsgBox({
						content = i18n("battle_preCombatLayer_clear_confirm"),
						onYes = function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-12, warpins: 1 ---
							slot0:emit(LevelMediator2.ON_ELITE_CLEAR, {
								index = slot1,
								chapterVO = LevelMediator2.ON_ELITE_CLEAR
							})

							return
							--- END OF BLOCK #0 ---



						end
					})
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-18, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)
			onButton(slot0, slot21, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				if #slot0[slot1] ~= 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 7-8, warpins: 1 ---
					if slot0 ~= 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 9-20, warpins: 1 ---
						slot2:HandleShowMsgBox({
							content = i18n("battle_preCombatLayer_auto_confirm"),
							onYes = function ()

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-12, warpins: 1 ---
								slot0:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
									index = slot1,
									chapterVO = LevelMediator2.ON_ELITE_RECOMMEND
								})

								return
								--- END OF BLOCK #0 ---



							end
						})
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 21-31, warpins: 1 ---
						slot2:emit(LevelMediator2.ON_ELITE_RECOMMEND, {
							index = slot1,
							chapterVO = LevelMediator2.ON_ELITE_RECOMMEND
						})
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 32-32, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 500-501, warpins: 2 ---
		--- END OF BLOCK #7 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 502-503, warpins: 1 ---
	return
	--- END OF BLOCK #7 ---



end

slot0.displayFleetEdit = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-73, warpins: 1 ---
	setActive(slot0.fleetEdit, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.fleetEdit)

	slot3 = findTF(slot0.fleetEdit, "panel/start_button")
	slot7 = findTF(slot0.fleetEdit, "mask_sp")

	setActive(slot6, false)
	slot0:flushFleetEditButton(slot1)
	onButton(slot0, slot2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:hideFleetEdit(slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, slot0.fleetEdit, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0:hideFleetEdit(slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onToggle(slot0, slot4, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-10, warpins: 1 ---
			slot0.contextData.EditingCommander = slot0

			slot0:flushFleetEditButton(slot0.flushFleetEditButton)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)
	onToggle(slot0, findTF(slot0.fleetEdit, "panel/formation_btn"), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-11, warpins: 1 ---
			slot0.contextData.EditingCommander = not slot0

			slot0:flushFleetEditButton(slot0.flushFleetEditButton)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 12-12, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	slot8 = triggerToggle

	if not slot0.contextData.EditingCommander or not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 76-76, warpins: 2 ---
		slot9 = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 77-96, warpins: 2 ---
	slot8(slot9, true)
	setActive(slot4, slot0.openedCommanerSystem)
	onButton(slot0, slot3, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0, slot1 = slot0:IsEliteFleetLegal()

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-9, warpins: 1 ---
			function slot2()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-14, warpins: 1 ---
				slot0:hideFleetEdit()
				slot0.hideFleetEdit:trackChapter(slot0.hideFleetEdit, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-11, warpins: 1 ---
					slot0:emit(LevelMediator2.ON_ELITE_TRACKING, slot1.id, slot1.loopFlag)

					return
					--- END OF BLOCK #0 ---



				end)
				playSoundEffect(SFX_UI_WEIGHANCHOR_BATTLE)

				return
				--- END OF BLOCK #0 ---



			end

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-23, warpins: 1 ---
				slot1:HandleShowMsgBox({
					modal = true,
					content = i18n("elite_fleet_confirm", Fleet.DEFAULT_NAME[slot1]),
					onYes = slot2
				})
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-26, warpins: 1 ---
				slot2()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-35, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-36, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_UI_WEIGHANCHOR_GO)
	onButton(slot0, slot6, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		setActive(setActive, true)
		onButton(setActive, onButton, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #1 ---



end

slot0.hideFleetEdit = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-9, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_UPDATE_CUSTOM_FLEET, slot1.id, slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-28, warpins: 2 ---
	setActive(slot0.fleetEdit, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.fleetEdit, slot0._tf)
	setParent(slot0.fleetEdit, slot0.topPanel, false)

	return
	--- END OF BLOCK #1 ---



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

slot0.updateStageBarrier = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	setActive(slot0.panelBarrier, slot0.contextData.chapterVO:existOni())

	if slot0.contextData.chapterVO:existOni() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-31, warpins: 1 ---
		slot2 = slot0.panelBarrier:Find("btn_barrier")

		setText(slot2:Find("nums"), slot1.modelCount)
		onButton(slot0, slot2, function ()

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
			--- BLOCK #1 8-14, warpins: 1 ---
			if slot0.grid.quadState == ChapterConst.QuadStateStrategy then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-22, warpins: 1 ---
				slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 23-33, warpins: 1 ---
			slot0:selectSquareBarrieredCell(1, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				if not slot0:existBarrier(slot0, slot1) and slot0.modelCount <= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 14-14, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 15-31, warpins: 3 ---
				slot1:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpBarrier,
					id = slot0.fleet.id,
					arg1 = slot0,
					arg2 = slot1
				})

				return
				--- END OF BLOCK #1 ---



			end)

			return
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 34-34, warpins: 2 ---
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 35-35, warpins: 2 ---
			--- END OF BLOCK #4 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 32-33, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.switchToChapter = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0:frozen(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:tryAutoAction()

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
	--- BLOCK #2 49-121, warpins: 2 ---
	slot0:setChapter(slot1)
	slot0:hideFleetSelect()
	setActive(slot0.clouds, false)
	setActive(slot0.chapters, false)
	setActive(slot0.escortChapters, false)
	setActive(slot0.topStage, true)
	setActive(slot0.bottomStage, true)
	setActive(slot0.leftStage, true)
	setActive(slot0.rightStage, true)

	slot0.leftCanvasGroup.blocksRaycasts = false
	slot0.rightCanvasGroup.blocksRaycasts = false
	slot7 = findTF(slot0.rightStage, "target")
	slot8 = findTF(slot0.rightStage, "skip_events")
	slot9 = findTF(slot0.rightStage, "btn_sham_shop")

	setActive(slot5, slot1:existAmbush())

	slot10 = setActive
	slot11 = findTF(slot0.topStage, "sham_progress")

	if slot3 ~= ChapterConst.TypeSham then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 122-123, warpins: 1 ---
		slot12 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 124-124, warpins: 1 ---
		slot12 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 125-131, warpins: 2 ---
	slot10(slot11, slot12)

	slot10 = setActive
	slot11 = slot9

	if slot3 ~= ChapterConst.TypeSham then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 132-133, warpins: 1 ---
		slot12 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 134-134, warpins: 1 ---
		slot12 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 135-139, warpins: 2 ---
	slot10(slot11, slot12)

	if slot3 == ChapterConst.TypeSham then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 140-149, warpins: 1 ---
		slot11 = setActive
		slot12 = slot9

		if getProxy(ChapterProxy):getShamShop() == nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 150-151, warpins: 1 ---
			slot13 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 152-152, warpins: 1 ---
			slot13 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 153-153, warpins: 2 ---
		slot11(slot12, slot13)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 154-159, warpins: 2 ---
	slot10 = setActive
	slot11 = slot0.resetBtn

	if slot3 ~= ChapterConst.TypeSham and slot3 ~= ChapterConst.TypeGuild then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 164-165, warpins: 1 ---
		slot12 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 166-166, warpins: 2 ---
		slot12 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 167-173, warpins: 2 ---
	slot10(slot11, slot12)

	slot10 = setImageColor
	slot11 = slot0.resetBtn

	if slot3 ~= ChapterConst.TypeSham or ChapterConst.ShamResetCountLimit > slot1.shamResetCount or not Color(1, 1, 10, 0.5882352941176471) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 187-192, warpins: 3 ---
		slot12 = Color(1, 1, 1, 1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 193-210, warpins: 2 ---
	slot10(slot11, slot12)

	slot0.achieveOriginalY = -240

	setText(slot8:Find("Label"), i18n("map_event_skip"))

	if slot1:getConfig("event_skip") == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 211-214, warpins: 1 ---
		if slot1.progress > 0 or slot1.defeatCount > 0 or slot1.passCount > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 223-250, warpins: 3 ---
			setActive(slot8, true)

			slot7.anchoredPosition = Vector2.New(slot7.anchoredPosition.x, slot0.achieveOriginalY - 40)
			slot11 = GetComponent(slot8, typeof(Toggle))

			if PlayerPrefs.GetInt("skip_events_on_" .. slot1.id, 1) ~= 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 251-252, warpins: 1 ---
				slot12 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 253-253, warpins: 1 ---
				slot12 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 254-260, warpins: 2 ---
			slot11.isOn = slot12

			onToggle(slot0, slot8, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				slot1 = PlayerPrefs.SetInt
				slot2 = slot0

				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 6-7, warpins: 1 ---
					slot3 = 1
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 8-8, warpins: 1 ---
					slot3 = 0
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 9-10, warpins: 2 ---
				slot1(slot2, slot3)

				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 261-270, warpins: 1 ---
			setActive(slot8, false)

			if not PlayerPrefs.HasKey(key) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 271-276, warpins: 1 ---
				PlayerPrefs.SetInt(key, 0)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 277-287, warpins: 1 ---
		setActive(slot8, false)

		slot7.anchoredPosition = Vector2.New(slot7.anchoredPosition.x, slot0.achieveOriginalY)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 288-299, warpins: 4 ---
	setActive(slot7, slot1:existAchieve())

	slot10 = setActive
	slot11 = slot0.retreatBtn

	if slot3 ~= ChapterConst.TypeNone then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 300-301, warpins: 1 ---
		slot12 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 302-302, warpins: 1 ---
		slot12 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 303-322, warpins: 2 ---
	slot10(slot11, slot12)
	slot0:onSubLayerContextChange()
	seriesAsync({
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			pg.UIMgr.GetInstance():BlurPanel(slot0.topPanel, false)
			onNextTick(slot0)

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-29, warpins: 1 ---
			slot0:updateStageInfo()
			slot0:updateAmbushRate(slot1.fleet.line, true)
			slot0:updateStageAchieve()
			slot0:updateStageBarrier()
			slot0:updateBombPanel()

			if slot0 == ChapterConst.TypeSham then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-33, warpins: 1 ---
				slot0:updateShamProgress()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 34-37, warpins: 2 ---
			onNextTick(slot0)

			return
			--- END OF BLOCK #1 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot0:updateStageStrategy()
			onNextTick(slot0)

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-12, warpins: 1 ---
			slot0:updateStageFleet()
			slot0:updateFleetBuff()
			onNextTick(slot0)

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-184, warpins: 1 ---
			slot1 = slot0:getConfig("scale")

			slot1:RecordTween("mapScale", LeanTween.value(go(slot1.map), slot1.map.localScale, Vector3.New(slot1[3], slot1[3], 1), LeanTween.value):setOnUpdateVector3(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0.map.localScale = slot0
				slot0.float.localScale = slot0

				return
				--- END OF BLOCK #0 ---



			end):setOnComplete(System.Action(slot0)):setEase(LeanTweenType.easeOutSine).uniqueId)

			slot3 = LeanTween.value(go(slot1.map), slot1.map.pivot, Vector2.New(math.clamp(slot1[1] - 0.5, 0, 1), math.clamp(slot1[2] - 0.5, 0, 1)), slot2)

			slot3:setOnUpdateVector2(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0.map.pivot = slot0
				slot0.float.pivot = slot0

				return
				--- END OF BLOCK #0 ---



			end):setEase(LeanTweenType.easeOutSine)
			slot1:RecordTween("mapPivot", slot3.uniqueId)
			shiftPanel(slot1.leftChapter, -slot1.leftChapter.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.rightChapter, slot1.rightChapter.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.bottomStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.topChapter, 0, slot1.topChapter.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.topStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.rightStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
			shiftPanel(slot1.leftStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

			return
			--- END OF BLOCK #0 ---



		end
	}, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-46, warpins: 1 ---
		setActive(slot0.topChapter, false)
		setActive(slot0.leftChapter, false)
		setActive(slot0.rightChapter, false)

		setActive.leftCanvasGroup.blocksRaycasts = true
		setActive.leftCanvasGroup.rightCanvasGroup.blocksRaycasts = true

		setActive.leftCanvasGroup.rightCanvasGroup:initGrid()

		setActive.leftCanvasGroup.rightCanvasGroup.initGrid.contextData.huntingRangeVisibility = slot0.contextData.huntingRangeVisibility - 1

		setActive.leftCanvasGroup.rightCanvasGroup.initGrid.contextData.grid:toggleHuntingRange()
		setActive.leftCanvasGroup.rightCanvasGroup.initGrid.contextData.grid.toggleHuntingRange:unfrozen()

		if setActive.leftCanvasGroup.rightCanvasGroup.initGrid.contextData.grid.toggleHuntingRange then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-48, warpins: 1 ---
			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 49-49, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #9 ---



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
	--- BLOCK #1 11-16, warpins: 2 ---
	slot3 = getProxy(ChapterProxy)

	if not LOCK_SOS then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-23, warpins: 1 ---
		if slot1:getMapType() == Map.ESCORT and (#slot3.escortMaps == 0 or _.any(slot4, function (slot0)

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

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 42-51, warpins: 3 ---
		if slot3.subNextReqTime < pg.TimeMgr.GetInstance():GetServerTime() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-58, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_FETCH_SUB_CHAPTER)

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 59-229, warpins: 3 ---
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
		if not slot0.contextData.chapterVO then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-25, warpins: 1 ---
			setActive(slot0.topStage, false)
			setActive(slot0.bottomStage, false)
			setActive(slot0.leftStage, false)
			setActive(slot0.rightStage, false)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-30, warpins: 2 ---
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
	setActive(slot0.leftChapter, true)
	setActive(slot0.rightChapter, true)
	shiftPanel(slot0.leftChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.bottomStage, 0, -slot0.bottomStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topChapter, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topStage, 0, slot0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, -slot0.leftStage.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, slot0.rightStage.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	if slot0.stageTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 230-235, warpins: 1 ---
		slot0.stageTimer:Stop()

		slot0.stageTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 236-254, warpins: 2 ---
	pg.UIMgr.GetInstance():UnblurPanel(slot0.topPanel, slot0._tf)
	slot0:hideAmbushInfo()
	setActive(slot0.strategyInfo, false)

	if slot0.ambushWarning and slot0.ambushWarning.activeSelf then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 259-266, warpins: 1 ---
		slot0.ambushWarning:SetActive(false)
		slot0:unfrozen()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 267-280, warpins: 3 ---
	slot0:onSubLayerContextChange()
	slot0:setChapter(nil)
	slot0:updateEscortInfo()

	if slot2 == ChapterConst.TypeSham then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 281-295, warpins: 1 ---
		slot0.contextData.mapIdx = slot0.contextData.chapterMapIdx
		slot0.contextData.chapterMapIdx = nil

		slot0:setMap(slot0:selectMap(slot0.maps))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 296-299, warpins: 1 ---
		if slot2 == ChapterConst.TypeNone then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 300-311, warpins: 1 ---
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
	--- BLOCK #5 312-313, warpins: 3 ---
	return
	--- END OF BLOCK #5 ---



end

slot0.updateStageInfo = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot2 = slot0.contextData.chapterVO.getDataType(slot1)
	slot4 = findTF(slot0.topStage, "unlimit")

	setWidgetText(findTF(slot0.topStage, "timer"), "--:--:--")

	if slot0.stageTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-24, warpins: 1 ---
		slot0.stageTimer:Stop()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 25-33, warpins: 2 ---
	if slot1:getConfig("time") < slot1:getRemainTime() or slot1:getConfig("time") >= 8640000 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-49, warpins: 2 ---
		setActive(slot3, false)
		setActive(slot4, true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-71, warpins: 1 ---
		setActive(slot3, true)
		setActive(slot4, false)

		slot0.stageTimer = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-17, warpins: 1 ---
			setWidgetText(setWidgetText, pg.TimeMgr:GetInstance():DescCDTime(slot0:getRemainTime()))

			return
			--- END OF BLOCK #0 ---



		end, 1, -1)

		slot0.stageTimer:Start()
		slot0.stageTimer.func()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 72-73, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.updateFleetBuff = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-49, warpins: 1 ---
	setActive(slot6, false)

	slot7 = UIItemList.New(slot5, slot6)

	slot7:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		setActive(findTF(slot2, "frame"), false)
		setActive(findTF(slot2, "Text"), false)

		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-23, warpins: 1 ---
			if slot1 + 1 <= #slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-43, warpins: 1 ---
				GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[slot0[slot1 + 1]].icon, "", slot2)
				onButton(slot1, slot2, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-17, warpins: 1 ---
					slot0:HandleShowMsgBox({
						yesText = "text_confirm",
						hideNo = true,
						content = "",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = slot1.id,
							cfg = slot0
						}
					})

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 44-92, warpins: 1 ---
			GetImageSpriteFromAtlasAsync("commanderskillicon/" .. slot2[(slot1 + 1) - #slot0].getConfig(slot3, "icon"), "", slot2)
			setText(findTF(slot2, "Text"), "Lv." .. slot2[(slot1 + 1) - #slot0].getConfig(slot3, "lv"))
			setActive(findTF(slot2, "Text"), true)
			setActive(findTF(slot2, "frame"), true)
			onButton(slot1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_COMMANDER_SKILL, slot0)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 93-93, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end)
	slot7:align(#slot0.contextData.chapterVO.getFleetStgIds(slot1, slot2) + #_.map(_.values(slot0.contextData.chapterVO.fleet.getCommanders(slot2)), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0:getSkills()[1]
		--- END OF BLOCK #0 ---



	end))
	slot0:updateChapterBuff()

	return
	--- END OF BLOCK #0 ---



end

slot0.updateChapterBuff = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	SetActive(findTF(slot0.topStage, "chapter_buff"), slot0.contextData.chapterVO.hasMitigation(slot1))

	if slot0.contextData.chapterVO.hasMitigation(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-36, warpins: 1 ---
		setImageSprite(slot2, slot5, false)
		onButton(slot0, slot2, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			if not slot0:hasMitigation() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-7, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 8-34, warpins: 2 ---
			slot1:HandleShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_DROP_ITEM,
				name = slot0:getChapterState(),
				sprite = slot2,
				content = i18n("level_risk_level_mitigation_rate", slot0:getRemainPassCount(), slot0:getMitigationRate())
			})

			return
			--- END OF BLOCK #1 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 37-38, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateShamProgress = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	setText(findTF(slot0.topStage, "sham_progress/value"), slot0.contextData.chapterVO.progress .. " / " .. ChapterConst.ShamEnemyLimit)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateAmbushRate = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if not slot0.contextData.chapterVO:existAmbush() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-38, warpins: 2 ---
	slot7, slot8 = ChapterConst.GetAmbushDisplay(slot6)
	slot10 = findTF(slot0.topStage, "ambush/value2")

	setText(findTF(slot0.topStage, "ambush/value1"), math.floor(slot3.fleet.getInvestSums(slot4)))

	if slot2 and slot3:existEnemy(ChapterConst.SubjectPlayer, slot1.row, slot1.column) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-62, warpins: 1 ---
		setText(slot10, ChapterConst.EnemyAttackDisplay)
		setTextColor(slot10, Color.New(0.9607843137254902, 0.3764705882352941, 0.2823529411764706))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-70, warpins: 2 ---
		setText(slot10, slot7)
		setTextColor(slot10, slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 71-71, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.displayAmbushInfo = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-99, warpins: 1 ---
	GetImageSpriteFromAtlasAsync("enemies/" .. pg.expedition_data_template[slot0.contextData.chapterVO.getChapterCell(slot2, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column).attachmentId].icon, "", slot8)
	setText(slot7, pg.expedition_data_template[slot0.contextData.chapterVO.getChapterCell(slot2, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column).attachmentId].level)
	setText(slot9, math.floor(slot0.contextData.chapterVO.getAmbushDodge(slot2, slot0.contextData.chapterVO.fleet) * 100) .. "%")
	onButton(slot0, slot10, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_OP, {
			arg1 = 0,
			type = ChapterConst.OpAmbush,
			id = slot1.id
		})
		slot0.emit:hideAmbushInfo()

		return
		--- END OF BLOCK #0 ---



	end, SFX_UI_WEIGHANCHOR_ATTACK)
	onButton(slot0, slot11, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_OP, {
			arg1 = 1,
			type = ChapterConst.OpAmbush,
			id = slot1.id
		})
		slot0.emit:hideAmbushInfo()

		return
		--- END OF BLOCK #0 ---



	end, SFX_UI_WEIGHANCHOR_AVOID)
	setActive(slot0.ambushInfo, true)

	findTF(slot0.ambushInfo, "window").localScale = Vector3(1, 0, 1)

	LeanTween.scaleY(findTF(slot0.ambushInfo, "window").gameObject, 1, 0.3):setOnComplete(System.Action(slot1))

	return
	--- END OF BLOCK #0 ---



end

slot0.hideAmbushInfo = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.ambushInfo and isActive(slot0.ambushInfo) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 1 ---
		setActive(slot0.ambushInfo, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateStageAchieve = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if not slot0.contextData.chapterVO:existAchieve() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-63, warpins: 1 ---
	slot3 = findTF(slot0.rightStage, "target")

	setActive(slot3, true)

	slot4 = findTF(slot3, "detail")
	slot7 = findTF(slot4, "click")

	setActive(slot5, false)
	setActive(slot9, false)
	removeAllChildren(slot6)
	removeAllChildren(slot10)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 64-114, warpins: 0 ---
	for slot14, slot15 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-94, warpins: 1 ---
		setActive(findTF(slot16, "star"), slot17)
		setText(slot18, ChapterConst.GetAchieveDesc(slot15.type, slot1))

		slot19 = setTextColor
		slot20 = findTF(slot16, "desc")

		if not ChapterConst.IsAchieved(slot15) or not Color.yellow then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 99-100, warpins: 2 ---
			slot21 = Color.white
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 101-112, warpins: 2 ---
		slot19(slot20, slot21)

		cloneTplTo(slot9, slot10):GetComponent(typeof(Image)).enabled = slot17
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 113-114, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 115-129, warpins: 1 ---
	onButton(slot0, slot7, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		shiftPanel(shiftPanel, slot0.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(shiftPanel, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot8, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		shiftPanel(shiftPanel, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(shiftPanel, slot1.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	if not slot0.isAchieveFirstInit then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 130-134, warpins: 1 ---
		slot0.isAchieveFirstInit = true

		triggerButton(slot7)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 135-136, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 137-137, warpins: 2 ---
	--- END OF BLOCK #5 ---



end

slot0.updateStageStrategy = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-49, warpins: 1 ---
	slot5 = findTF(slot4, "click")
	slot8 = findTF(slot3, "collapse")

	setActive(slot7, false)

	slot10 = {}
	slot11 = {}

	_.each(slot9, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if pg.strategy_data_template[slot0.id].type == ChapterConst.StgTypeForm then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-15, warpins: 1 ---
			table.insert(slot0, slot0.id)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			table.insert(slot1, slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-21, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	if _.any(slot0.contextData.chapterVO.fleets, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0:getFleetType() ~= FleetType.Submarine then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-9, warpins: 1 ---
			slot1 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-10, warpins: 1 ---
			slot1 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-11, warpins: 2 ---
		return slot1
		--- END OF BLOCK #1 ---



	end) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-67, warpins: 1 ---
		table.insert(slot11, 2, {
			id = ChapterConst.StrategySubAutoAttack
		})
		table.insert(slot11, 2, {
			id = ChapterConst.StrategyHuntingRange
		})
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 68-104, warpins: 2 ---
	table.insert(slot11, 1, {
		id = slot2:getFormationStg()
	})

	slot13 = UIItemList.New(slot6, slot7)

	slot13:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-13, warpins: 1 ---
			slot4, slot5 = nil

			if slot0[slot1 + 1].id == ChapterConst.StrategyHuntingRange then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-20, warpins: 1 ---
				slot4 = 1

				if slot1.contextData.huntingRangeVisibility % 2 == 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-22, warpins: 1 ---
					slot5 = "range_invisible"
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 23-23, warpins: 1 ---
					slot5 = "range_visible"
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 24-24, warpins: 2 ---
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-29, warpins: 1 ---
				if slot3.id == ChapterConst.StrategySubAutoAttack then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 30-34, warpins: 1 ---
					slot4 = 1

					if slot2.subAutoAttack == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 35-36, warpins: 1 ---
						slot5 = "sub_dont_auto_attack"
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 37-37, warpins: 1 ---
						slot5 = "sub_auto_attack"
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 38-38, warpins: 2 ---
					--- END OF BLOCK #1 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-44, warpins: 1 ---
					slot4 = pg.strategy_data_template[slot3.id].type
					slot5 = pg.strategy_data_template[slot3.id].icon
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 45-62, warpins: 3 ---
			GetImageSpriteFromAtlasAsync("strategyicon/" .. slot5, "", slot2:Find("icon"))
			onButton(slot1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				if slot0.grid.quadState == ChapterConst.QuadStateStrategy and slot0.grid.quadClickProxy then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-17, warpins: 1 ---
					slot0.grid.quadClickProxy()

					return
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-23, warpins: 2 ---
				if slot1.id == ChapterConst.StrategyHuntingRange then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-35, warpins: 1 ---
					slot0.grid:toggleHuntingRange()
					slot2.callback(slot3, slot4, slot5)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 36-41, warpins: 1 ---
					if slot1.id == ChapterConst.StrategySubAutoAttack then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 42-71, warpins: 1 ---
						pg.TipsMgr.GetInstance():ShowTips(i18n("ai_change_" .. 1 - slot6.subAutoAttack + 1))
						pg.TipsMgr.GetInstance().ShowTips:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpSubState,
							arg1 = 1 - slot6.subAutoAttack
						})
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 72-77, warpins: 1 ---
						if slot1.id == ChapterConst.StrategyExchange then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 78-86, warpins: 1 ---
							if slot6:getNextValidIndex(slot6.findex) > 0 and slot1.count > 0 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 92-102, warpins: 1 ---
								slot0:HandleShowMsgBox({
									content = i18n("levelScene_who_to_exchange"),
									onYes = function ()

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-23, warpins: 1 ---
										slot0:emit(LevelMediator2.ON_OP, {
											type = ChapterConst.OpStrategy,
											id = slot1.id,
											arg1 = ChapterConst.StrategyExchange,
											arg2 = slot2.fleets[].id
										})

										return
										--- END OF BLOCK #0 ---



									end
								})
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 103-103, warpins: 3 ---
							return
							--- END OF BLOCK #1 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 104-108, warpins: 1 ---
						if slot8 == ChapterConst.StgTypeForm then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 109-139, warpins: 1 ---
							slot0:emit(LevelMediator2.ON_OP, {
								type = ChapterConst.OpStrategy,
								id = slot7:getNextStgUser(slot1.id),
								arg1 = slot9[table.indexof(slot9, slot1.id) % #slot9 + 1]
							})
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 140-144, warpins: 1 ---
							slot0:displayStrategyInfo(slot0)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 145-145, warpins: 5 ---
				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 146-146, warpins: 2 ---
				--- END OF BLOCK #3 ---



			end, SFX_PANEL)

			if slot4 == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-85, warpins: 1 ---
				setText(slot2:Find("nums"), "")
				setActive(slot2:Find("mask"), false)

				slot7 = slot2:Find("selected")

				if setActive ~= slot3.id then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 86-87, warpins: 1 ---
					slot8 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 88-88, warpins: 1 ---
					slot8 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 89-90, warpins: 2 ---
				slot6(slot7, slot8)
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 91-105, warpins: 1 ---
				setText(slot2:Find("nums"), slot3.count)

				slot6 = setActive
				slot7 = slot2:Find("mask")

				if slot3.count ~= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 106-107, warpins: 1 ---
					slot8 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 108-108, warpins: 1 ---
					slot8 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 109-116, warpins: 2 ---
				slot6(slot7, slot8)
				setActive(slot2:Find("selected"), false)
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 117-117, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 118-119, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot13:align(#slot11)
	onButton(slot0, slot5, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		shiftPanel(shiftPanel, slot0.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(shiftPanel, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot8, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		shiftPanel(shiftPanel, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(shiftPanel, slot1.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #1 ---



end

slot0.displayStrategyInfo = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.strategyPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot2 = StrategyPanel.New(slot0.strategyInfo)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-26, warpins: 2 ---
	slot0.strategyPanel = slot2

	slot0.strategyPanel:attach(slot0)
	slot0.strategyPanel:set(slot1)

	slot0.strategyPanel.onConfirm = function ()

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



	end

	slot0.strategyPanel.onCancel = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideStrategyInfo()

		return
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #1 ---



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
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.strategyPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0.strategyPanel:detach()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateStageFleet = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-57, warpins: 1 ---
	slot2 = findTF(slot0.leftStage, "fleet")

	setActive(slot3, false)
	setText(slot4, slot0.contextData.chapterVO.fleet.id)

	local function slot5(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		slot2 = UIItemList.New(slot0, slot0)

		slot2:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-20, warpins: 1 ---
				updateShip(slot2, slot3)

				slot4 = slot0[slot1 + 1].hpRant
				slot5 = slot0[slot1 + 1].getShipProperties(slot3)
				slot6 = math.floor

				if not slot0[slot1 + 1].hpChange then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-21, warpins: 1 ---
					slot7 = 0
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 22-53, warpins: 2 ---
				slot7 = findTF(slot2, "HP_POP")

				setActive(slot7, true)
				setActive(findTF(slot7, "heal"), false)
				setActive(findTF(slot7, "normal"), false)

				function slot8(slot0, slot1)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-55, warpins: 1 ---
					setActive(slot0, true)
					setText(findTF(slot0, "text"), slot1)
					setTextAlpha(findTF(slot0, "text"), 0)
					LeanTween.moveY(slot0, 60, 1)
					LeanTween.textAlpha(findTF(slot0, "text"), 1, 0.3)
					LeanTween.textAlpha(findTF(slot0, "text"), 0, 0.5):setDelay(0.7):setOnComplete(System.Action(function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-8, warpins: 1 ---
						slot0.localPosition = Vector3(0, 0, 0)

						return
						--- END OF BLOCK #0 ---



					end))

					return
					--- END OF BLOCK #0 ---



				end

				if slot6(slot7 / 10000 * slot5[AttributeType.Durability]) > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 54-61, warpins: 1 ---
					slot8(findTF(slot7, "heal"), slot6)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 62-64, warpins: 1 ---
					if slot6 < 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 65-72, warpins: 1 ---
						LeanTween.delayedCall(0.6, System.Action(function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-49, warpins: 1 ---
							LeanTween.moveX(slot0, slot0, 0.05):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(4)
							LeanTween.alpha(findTF(slot0, "red"), 0.5, 0.4)
							LeanTween.alpha(findTF(slot0, "red"), 0, 0.4):setDelay(0.4)
							LeanTween.alpha(findTF(slot0, "red"), 0, 0.4).setDelay(findTF(findTF, "normal"), findTF)

							return
							--- END OF BLOCK #0 ---



						end))
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 73-88, warpins: 3 ---
				slot9 = findTF(slot2, "blood")
				slot10 = findTF(slot2, "blood/fillarea/green")
				slot11 = findTF(slot2, "blood/fillarea/red")

				if slot4 >= ChapterConst.HpGreen then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 89-90, warpins: 1 ---
					slot12 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 91-91, warpins: 1 ---
					slot12 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 92-107, warpins: 2 ---
				setActive(slot10, not slot12)
				setActive(slot11, slot12)

				slot13 = slot9:GetComponent(typeof(Slider))

				if not slot12 or not slot11 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 110-110, warpins: 2 ---
					slot14 = slot10
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 111-131, warpins: 2 ---
				slot13.fillRect = slot14

				setSlider(slot9, 0, 10000, slot4)
				setActive(findTF(slot2, "repairmask"), slot12)

				slot13 = findTF(slot2, "repairmask/icon").gameObject

				if not slot12 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 132-139, warpins: 1 ---
					LeanTween.cancel(slot13)
					setImageAlpha(slot13, 1)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #4 ---

				FLOW; TARGET BLOCK #5



				-- Decompilation error in this vicinity:
				--- BLOCK #5 140-141, warpins: 2 ---
				if slot12 and not LeanTween.isTweening(slot13) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 148-158, warpins: 1 ---
					LeanTween.alpha(rtf(slot13), 0, 2):setLoopPingPong()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #5 ---

				FLOW; TARGET BLOCK #6



				-- Decompilation error in this vicinity:
				--- BLOCK #6 159-165, warpins: 3 ---
				onButton(slot1, slot2, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-3, warpins: 1 ---
					if slot0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 4-8, warpins: 1 ---
						slot1:displayRepairWindow(slot2)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 9-9, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end, SFX_PANEL)
				--- END OF BLOCK #6 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 166-167, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot2:align(#slot1)

		return
		--- END OF BLOCK #0 ---



	end

	slot5(slot2:Find("main"), slot0.contextData.chapterVO.fleet:getShipsByTeam(TeamType.Main, true))
	slot5(slot2:Find("vanguard"), slot0.contextData.chapterVO.fleet:getShipsByTeam(TeamType.Vanguard, true))
	slot0.contextData.chapterVO.fleet:clearShipHpChange()

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
	--- BLOCK #1 33-35, warpins: 3 ---
	if not slot0.repairPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-39, warpins: 1 ---
		slot9 = RepairPanel.New(slot0.repairWindow)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 40-61, warpins: 2 ---
	slot0.repairPanel = slot9

	slot0.repairPanel:attach(slot0)
	slot0.repairPanel:set(slot5, slot6, slot7, slot8)

	slot0.repairPanel.onConfirm = function ()

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



	end

	slot0.repairPanel.onCancel = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideRepairWindow()

		return
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #2 ---



end

slot0.hideRepairWindow = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.repairPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0.repairPanel:detach()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.displayRemasterPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = getProxy(ChapterProxy)

	if not slot0.remasterPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		slot2 = RemasterPanel.New(slot0.remasterWindow)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-27, warpins: 2 ---
	slot0.remasterPanel = slot2

	slot0.remasterPanel:attach(slot0)

	slot2 = {}
	slot3 = pg.TimeMgr.GetInstance()

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-37, warpins: 0 ---
	for slot7, slot8 in ipairs(pg.re_map_template.all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-35, warpins: 1 ---
		table.insert(slot2, pg.re_map_template[slot8])
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-37, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 38-60, warpins: 1 ---
	slot0.remasterPanel:set(slot2, slot1.remasterTickets)

	slot0.remasterPanel.onItem = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		slot0:setMap(pg.chapter_template[slot0.config_data[1]].map)
		slot0:hideRemasterPanel()

		return
		--- END OF BLOCK #0 ---



	end

	slot0.remasterPanel.onCancel = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:hideRemasterPanel()

		return
		--- END OF BLOCK #0 ---



	end

	pg.UIMgr.GetInstance():BlurPanel(slot0.remasterPanel._tf)

	return
	--- END OF BLOCK #3 ---



end

slot0.hideRemasterPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.remasterPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-23, warpins: 1 ---
		slot0.remasterPanel:detach()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.remasterPanel._tf, slot0._tf)
		setParent(slot0.remasterPanel._tf, slot0.topPanel, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-24, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



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
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0:updateAmbushRate(slot0)

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 57-68, warpins: 2 ---
	slot0.grid.onShipArrived = function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		slot0:overrideChapter()
		slot0:updateAmbushRate(slot0.overrideChapter.contextData.chapterVO.fleet.line, true)
		slot0:updateStageStrategy()

		return
		--- END OF BLOCK #0 ---



	end

	slot0.grid:initAll()
	slot0:enableLevelCamera()

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
		--- BLOCK #0 6-25, warpins: 1 ---
		slot3 = slot0.contextData.chapterVO.getDataType(slot2)
		slot5 = slot0.contextData.chapterVO.getChapterCell(slot2, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column)

		if _.detect(slot0.contextData.chapterVO.fleets, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if slot0:getFleetType() ~= FleetType.Normal or slot0.line.row ~= slot0.row or slot0.line.column ~= slot0.column then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-21, warpins: 3 ---
				slot1 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-22, warpins: 1 ---
				slot1 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 23-23, warpins: 2 ---
			return slot1
			--- END OF BLOCK #1 ---



		end) and slot3 == ChapterConst.TypeNone and slot6:isValid() and slot6.id ~= slot4.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-51, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpSwitch,
				id = slot6.id
			})

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 52-56, warpins: 5 ---
		if slot2:checkAnyInteractive() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-60, warpins: 1 ---
			triggerButton(slot0.funcBtn)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-67, warpins: 1 ---
			if slot2:getRound() == ChapterConst.RoundEnemy then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 68-77, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-79, warpins: 1 ---
				if slot6 and slot3 == ChapterConst.TypeSham then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 84-89, warpins: 1 ---
					slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 90-94, warpins: 2 ---
					if slot1.row ~= slot4.line.row or slot1.column ~= slot4.line.column then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 100-109, warpins: 2 ---
						if slot2:getChapterCell(slot1.row, slot1.column).attachment == ChapterConst.AttachStory and slot8.data == ChapterConst.StoryObstacle and slot8.flag == 3 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 118-131, warpins: 1 ---
							pg.TipsMgr:GetInstance():ShowTips(i18n("map_event_stop_tip"))

							return
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 132-140, warpins: 3 ---
							if not slot2:considerAsStayPoint(ChapterConst.SubjectPlayer, slot1.row, slot1.column) then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 141-143, warpins: 1 ---
								return
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 144-148, warpins: 1 ---
								if slot2:existMoveLimit() and not _.any(slot2:calcWalkableCells(ChapterConst.SubjectPlayer, slot4.line.row, slot4.line.column, slot4:getSpeed()), function (slot0)

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
									--- BLOCK #0 168-179, warpins: 1 ---
									pg.TipsMgr.GetInstance():ShowTips(i18n("destination_not_in_range"))

									return
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 180-194, warpins: 5 ---
						if slot2:findPath(ChapterConst.SubjectPlayer, slot4.line, {
							row = slot1.row,
							column = slot1.column
						}) < PathFinding.PrioObstacle then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 195-210, warpins: 1 ---
							slot0:emit(LevelMediator2.ON_OP, {
								type = ChapterConst.OpMove,
								id = slot4.id,
								arg1 = slot1.row,
								arg2 = slot1.column
							})
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 211-214, warpins: 1 ---
							if slot9 < PathFinding.PrioForbidden then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 215-226, warpins: 1 ---
								pg.TipsMgr:GetInstance():ShowTips(i18n("destination_can_not_reach"))
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 227-237, warpins: 1 ---
								pg.TipsMgr:GetInstance():ShowTips(i18n("destination_can_not_reach"))
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 238-239, warpins: 8 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.tryAutoTrigger = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not slot0:doSafeCheck() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-12, warpins: 1 ---
		if slot0.contextData.chapterVO:checkAnyInteractive() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-16, warpins: 1 ---
			triggerButton(slot0.funcBtn)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-23, warpins: 1 ---
			if slot2:getRound() == ChapterConst.RoundEnemy then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-33, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-38, warpins: 1 ---
				if slot2:existMoveLimit() and slot2:getRound() == ChapterConst.RoundPlayer then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 46-51, warpins: 1 ---
					slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 52-52, warpins: 6 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.tryAutoAction = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot1 = slot0.contextData.chapterVO
	slot2 = nil


	-- Decompilation error in this vicinity:
	coroutine.wrap(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot1 = false

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-16, warpins: 0 ---
		for slot5, slot6 in pairs(slot0.cells) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-12, warpins: 1 ---
			if slot6.trait == ChapterConst.TraitLurk then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-14, warpins: 1 ---
				slot0 = true

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 15-15, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-16, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 17-21, warpins: 2 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 22-36, warpins: 0 ---
		for slot5, slot6 in ipairs(slot0.champions) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-26, warpins: 1 ---
			if slot6.trait == ChapterConst.TraitLurk then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 27-32, warpins: 1 ---
				slot0 = true

				if slot6.attachment == ChapterConst.AttachOni then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 33-34, warpins: 1 ---
					slot1 = slot6

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 35-35, warpins: 1 ---
					break
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 35-36, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 37-48, warpins: 2 ---
		slot2 = slot0:isPlayingWithBombEnemy()

		if (slot0:findChapterCell(ChapterConst.AttachBoss) and slot3.flag == 1) or slot0:existOni() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-66, warpins: 2 ---
			if slot0:getDefeatStory(slot0.defeatCount) and type(slot5) == "number" and not pg.StoryMgr.GetInstance():IsPlayed(slot5) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 82-97, warpins: 1 ---
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = slot5
				})
				slot1:emit(LevelMediator2.ON_PERFORM_COMBAT, slot5)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 98-99, warpins: 4 ---
			if slot5 and type(slot5) == "string" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 105-112, warpins: 1 ---
				pg.StoryMgr.GetInstance():Play(slot5)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 113-114, warpins: 4 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 115-120, warpins: 1 ---
			slot1:frozen()

			if slot1 or slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 123-125, warpins: 2 ---
				slot4 = nil

				if slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 126-126, warpins: 1 ---
					slot4 = "SpUnit"
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 127-128, warpins: 2 ---
				if slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 129-129, warpins: 1 ---
					slot4 = "SpBomb"
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 130-131, warpins: 2 ---
				if slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 132-140, warpins: 1 ---
					slot1:doPlayAnim(slot4, function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-7, warpins: 1 ---
						setActive(slot0, false)
						slot0()

						return
						--- END OF BLOCK #0 ---



					end)
					coroutine.yield()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 141-146, warpins: 2 ---
				if slot0:getSpAppearStory() and #slot5 > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 151-163, warpins: 1 ---
					pg.StoryMgr.GetInstance():Play(slot5, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-6, warpins: 1 ---
						if slot0:getSpAppearGuide() and #slot0 > 0 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 11-24, warpins: 1 ---
							pg.GuideMgr:GetInstance():play(slot0, nil, onNextTick(pg.GuideMgr.GetInstance().play))
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 25-27, warpins: 2 ---
							onNextTick(onNextTick)
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 28-28, warpins: 2 ---
						return
						--- END OF BLOCK #1 ---



					end)
					coroutine.yield()
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #3 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 164-171, warpins: 1 ---
				slot1:doTracking(slot2)
				coroutine.yield()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 172-176, warpins: 4 ---
			if not slot1.contextData.chapterVO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 177-178, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 179-190, warpins: 2 ---
			slot1:tryPlayChapterStory()

			if slot0:findChapterCell(ChapterConst.AttachBoss) and slot4.trait == ChapterConst.TraitLurk then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 196-205, warpins: 1 ---
				slot1.grid:focusOnCell(slot4, slot2)
				coroutine.yield()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 206-247, warpins: 3 ---
			slot1:updateTrait(ChapterConst.TraitVirgin)
			slot1.grid:updateAttachments()
			slot1.grid:updateChampions()
			slot1:updateTrait(ChapterConst.TraitNone)
			slot1:overrideChapter()
			Timer.New(slot2, 0.5, 1):Start()
			coroutine.yield()
			slot1:unfrozen()
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 248-253, warpins: 2 ---
		if not slot1:doSafeCheck() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 254-260, warpins: 1 ---
			slot1.grid:updateQuadCells(ChapterConst.QuadStateNormal)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 261-261, warpins: 2 ---
		return
		--- END OF BLOCK #7 ---



	end)()

	return
	--- END OF BLOCK #0 ---



end

slot0.doSafeCheck = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot2 = slot0.contextData.chapterVO.getDataType(slot1)
	slot4 = slot0.contextData.chapterVO.fleet.line

	_.each(slot0.contextData.chapterVO.fleets, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0:getFleetType() == FleetType.Submarine and not slot0:isValid() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-24, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpRetreat,
				id = slot0.id
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-25, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)

	if slot0.contextData.chapterVO.getPlayType(slot1) == ChapterConst.TypeTransport then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-34, warpins: 1 ---
		slot6 = slot1:findChapterCell(ChapterConst.AttachTransport_Target)

		if not _.detect(slot1.fleets, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if slot0:getFleetType() ~= FleetType.Transport then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-9, warpins: 1 ---
				slot1 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-10, warpins: 1 ---
				slot1 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-11, warpins: 2 ---
			return slot1
			--- END OF BLOCK #1 ---



		end):isValid() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-57, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_escort_lose"))
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpRetreat
			})

			return true
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-62, warpins: 1 ---
			if slot5.line.row == slot6.row and slot5.line.column == slot6.column and not slot1:existEnemy(ChapterConst.SubjectPlayer, slot6.row, slot6.column) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 77-98, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_escort_win"))
				slot0:emit(LevelMediator2.ON_OP, {
					win = true,
					type = ChapterConst.OpRetreat
				})

				return true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 99-103, warpins: 6 ---
	if slot1:existOni() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 104-108, warpins: 1 ---
		if slot1:checkOniState() == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 109-121, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_OP, {
				win = true,
				type = ChapterConst.OpRetreat
			})

			return true
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 122-123, warpins: 1 ---
			if slot5 == 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 124-136, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})

				return true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 137-141, warpins: 1 ---
		if slot1:isPlayingWithBombEnemy() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 142-149, warpins: 1 ---
			if slot1:getBombChapterInfo().action_times * 2 <= slot1.roundIndex then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 150-162, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})

				return true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 163-169, warpins: 1 ---
			if slot1:findChapterCell(ChapterConst.AttachBoss) and slot5.flag == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 173-193, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OP, {
					win = true,
					type = ChapterConst.OpRetreat
				})

				slot6 = pg.TimeMgr.GetInstance()

				if slot1:getConfig("type") == Chapter.CustomFleet and not slot1:isActivity() and slot6:IsSameDay(slot1:getStartTime(), slot6:GetServerTime()) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 210-215, warpins: 1 ---
					getProxy(DailyLevelProxy):EliteCountPlus()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 216-235, warpins: 4 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_win"))

				slot7 = getProxy(PlayerProxy):getData()

				if slot1.id == 103 and not slot7:GetCommonFlag(BATTLE_AUTO_ENABLED) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 242-255, warpins: 1 ---
					slot0:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("battle_autobot_unlock")
					})
					slot0:emit(LevelMediator2.NOTICE_AUTOBOT_ENABLED, {})
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 256-258, warpins: 3 ---
				return true
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 259-262, warpins: 8 ---
	if slot2 == ChapterConst.TypeSham and ChapterConst.ShamEnemyLimit <= slot1.progress then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 268-272, warpins: 1 ---
		if slot1.shamResetCount < ChapterConst.ShamResetCountLimit then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 273-285, warpins: 1 ---
			slot0:HandleShowMsgBox({
				modal = true,
				content = i18n("sham_count_reset"),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-11, warpins: 1 ---
					slot0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpRetreat
					})

					return
					--- END OF BLOCK #0 ---



				end,
				onNo = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0:switchToMap()

					return
					--- END OF BLOCK #0 ---



				end
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 286-297, warpins: 1 ---
			slot0:HandleShowMsgBox({
				modal = true,
				hideNo = true,
				content = i18n("sham_count_limit"),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0:switchToMap()

					return
					--- END OF BLOCK #0 ---



				end,
				onNo = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0:switchToMap()

					return
					--- END OF BLOCK #0 ---



				end
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 298-300, warpins: 2 ---
		return true
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 301-305, warpins: 3 ---
	if not slot1:inWartime() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 306-313, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_TIME_UP)

		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 314-318, warpins: 2 ---
	if not slot3:isValid() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 319-322, warpins: 1 ---
		if slot2 == ChapterConst.TypeSham then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 323-331, warpins: 1 ---
			if getProxy(ContextProxy):getContextByMediator(LevelMediator2) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 332-335, warpins: 1 ---
				slot7 = slot6:getContextByMediator(ShamPreCombatMediator)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 336-337, warpins: 2 ---
			if not slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 338-347, warpins: 1 ---
				slot0:HandleShowMsgBox({
					modal = true,
					content = i18n("formation_reform_tip"),
					onYes = function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-7, warpins: 1 ---
						slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)

						return
						--- END OF BLOCK #0 ---



					end
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 348-351, warpins: 2 ---
			return true
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 352-355, warpins: 1 ---
			if slot2 == ChapterConst.TypeNone then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 356-361, warpins: 1 ---
				if slot1:getNextValidIndex() > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 362-376, warpins: 1 ---
					local function slot7()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-14, warpins: 1 ---
						slot0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpSwitch,
							id = slot1.id
						})

						return
						--- END OF BLOCK #0 ---



					end

					slot0:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("formation_switch_tip", slot1.fleets[slot5].name),
						onYes = slot7,
						onNo = slot7
					})
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 377-387, warpins: 1 ---
					local function slot6()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-11, warpins: 1 ---
						slot0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpRetreat
						})

						return
						--- END OF BLOCK #0 ---



					end

					slot0:HandleShowMsgBox({
						modal = true,
						hideNo = true,
						content = i18n("formation_invalide"),
						onYes = slot6,
						onNo = slot6
					})
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 388-390, warpins: 2 ---
				return true
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 391-401, warpins: 4 ---
	slot5 = slot1:getConfig("act_id")

	if not slot0.contextData.map:isRemaster() and slot5 ~= 0 and (not getProxy(ActivityProxy):getActivityById(slot5) or slot7:isEnd()) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 418-429, warpins: 2 ---
		slot0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRetreat
		})

		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 430-439, warpins: 4 ---
	if slot1:getChapterCell(slot4.row, slot4.column).attachment == ChapterConst.AttachBox and slot6.flag ~= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 443-448, warpins: 1 ---
		triggerButton(slot0.funcBtn)

		return true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 449-451, warpins: 3 ---
	return false
	--- END OF BLOCK #7 ---



end

slot0.tryPlayChapterStory = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	if slot0.contextData.chapterVO.getDataType(slot1) == ChapterConst.TypeNone then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-18, warpins: 1 ---
		slot4 = slot1:getWaveCount()

		if slot1:getConfig("story_refresh") and slot3[slot4] and slot3[slot4] ~= "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-26, warpins: 1 ---
			if slot4 == 1 and pg.map_event_list[slot1.id] and pg.map_event_list[slot1.id].help_open == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 40-49, warpins: 1 ---
				pg.StoryMgr.GetInstance():Play(slot3[slot4], function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-10, warpins: 1 ---
					if PlayerPrefs.GetInt("help_displayed_on_" .. slot0.id, 0) == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 11-24, warpins: 1 ---
						triggerButton(GameObject.Find("OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"))
						PlayerPrefs.SetInt("help_displayed_on_" .. slot0.id, 1)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 25-25, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 50-58, warpins: 3 ---
				pg.StoryMgr.GetInstance():Play(slot3[slot4])
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 59-60, warpins: 3 ---
			if slot4 == 1 and pg.map_event_list[slot1.id] and pg.map_event_list[slot1.id].help_open == 1 and PlayerPrefs.GetInt("help_displayed_on_" .. slot1.id, 0) == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 83-95, warpins: 1 ---
				triggerButton(GameObject.Find("OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"))
				PlayerPrefs.SetInt("help_displayed_on_" .. slot1.id, 1)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 96-101, warpins: 7 ---
		if slot1:getConfig("story_refresh_boss") and slot5 ~= "" and slot1:bossRefreshed() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 109-116, warpins: 1 ---
			pg.StoryMgr.GetInstance():Play(slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 117-123, warpins: 5 ---
	if slot1:getPlayType() == ChapterConst.TypeMainSub then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 124-133, warpins: 1 ---
		pg.StoryMgr:GetInstance():PlayGuide("NG003")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 134-136, warpins: 1 ---
		if slot1.id == 1160002 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 137-146, warpins: 1 ---
			pg.StoryMgr:GetInstance():PlayGuide("NG0011")
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 147-149, warpins: 1 ---
			if slot1.id == 1200001 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 150-158, warpins: 1 ---
				pg.GuideMgr:GetInstance():play("NG0014")
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 159-160, warpins: 4 ---
	return
	--- END OF BLOCK #2 ---



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

slot0.doAmbushWarning = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:frozen()

	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-45, warpins: 1 ---
		slot0.ambushWarning:SetActive(true)

		slot0 = tf(slot0.ambushWarning)

		slot0:SetParent(slot0.topPanel, false)
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
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:frozen()

	if not slot0.uiAnims then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		slot4 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-13, warpins: 2 ---
	slot0.uiAnims = slot4

	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot0.playing = true

		true:SetActive(true)

		if true then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-14, warpins: 1 ---
			slot2(slot1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-38, warpins: 2 ---
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
		--- BLOCK #0 14-23, warpins: 1 ---
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
		--- BLOCK #0 24-25, warpins: 1 ---
		slot5()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 26-27, warpins: 2 ---
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
		--- BLOCK #0 1-133, warpins: 1 ---
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

		slot6:GetComponent("SkeletonGraphic").freeze = false

		retPaintingPrefab(slot3, slot5:getPainting())
		PoolMgr.GetInstance():ReturnSpineChar(slot5:getPrefab(), slot3)
		setActive(slot0, false)

		slot0.playing = false

		slot0:unfrozen()

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 134-135, warpins: 1 ---
			slot6()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 136-137, warpins: 2 ---
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

slot0.easeMoveDown = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-53, warpins: 1 ---
	slot0:frozen()

	slot0.moveDownText.position = slot0.uiCam:ScreenToWorldPoint(slot3)
	slot0.moveDownText.localPosition.y = slot0.moveDownText.localPosition.y + 100
	slot0.moveDownText.localPosition.z = 0
	slot0.moveDownText.localPosition = slot0.moveDownText.localPosition

	setActive(slot0.moveDownText, true)
	LeanTween.value(go(slot0.moveDownText), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		slot0.moveDownText.localPosition.y = slot1.y - 100 * slot0
		slot0.moveDownText.localPosition = slot0.moveDownText.localPosition

		setImageAlpha(slot0.moveDownText, 1 - slot0)

		return
		--- END OF BLOCK #0 ---



	end)):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		setActive(slot0.moveDownText, false)
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

slot0.updateTrait = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-14, warpins: 0 ---
	for slot6, slot7 in pairs(slot0.contextData.chapterVO.cells) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-11, warpins: 1 ---
		if slot7.trait ~= ChapterConst.TraitNone then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-12, warpins: 1 ---
			slot7.trait = slot1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-14, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-18, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-26, warpins: 0 ---
	for slot6, slot7 in ipairs(slot2.champions) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-23, warpins: 1 ---
		if slot7.trait ~= ChapterConst.TraitNone then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-24, warpins: 1 ---
			slot7.trait = slot1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 27-27, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



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
	--- BLOCK #0 1-10, warpins: 1 ---
	if slot0:findTF("event/collapse", slot0.rightStage).anchoredPosition.x <= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		triggerButton(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-14, warpins: 2 ---
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

slot0.triggerCommanderPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.contextData.commanderSelected then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-31, warpins: 1 ---
		slot0:displayFleetSelect(slot3)
		slot0:openCommanderPanel(slot0.fleets[slot0.contextData.commanderSelected.fleetId], slot0.contextData.commanderSelected.chapterId)

		slot0.contextData.commanderSelected = nil
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-35, warpins: 1 ---
		if slot0.contextData.eliteCommanderSelected then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-60, warpins: 1 ---
			slot0:openCommanderPanel(slot0.contextData.map:getChapter(slot2).wrapEliteFleet(slot3, slot1), slot0.contextData.eliteCommanderSelected.chapterId, slot0.contextData.eliteCommanderSelected.index)

			slot0.contextData.eliteCommanderSelected = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 61-61, warpins: 3 ---
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
			--- BLOCK #0 1-19, warpins: 1 ---
			slot0.contextData.commanderSelected = {
				chapterId = slot1,
				fleetId = slot2.id
			}

			slot0:emit(LevelMediator2.ON_SELECT_COMMANDER, slot0, slot2.id)

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		function slot4(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-19, warpins: 1 ---
			slot0.contextData.eliteCommanderSelected = {
				index = slot1,
				pos = slot0,
				chapterId = 
			}

			slot0:emit(LevelMediator2.ON_SELECT_ELITE_COMMANDER, slot0.emit, slot0, slot0)

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-18, warpins: 2 ---
	slot0.commanderFormationPanel:update(slot1, slot4)
	slot0.commanderFormationPanel:open()

	return
	--- END OF BLOCK #1 ---



end

slot0.closeCommanderPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.commanderFormationPanel:close()

	return
	--- END OF BLOCK #0 ---



end

slot0.updateBombPanel = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	setActive(slot0.bombPanel, slot0.contextData.chapterVO:isPlayingWithBombEnemy())

	if slot0.contextData.chapterVO:isPlayingWithBombEnemy() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-49, warpins: 1 ---
		setText(slot0.bombPanel:Find("tx_step"), slot2:getBombChapterInfo().action_times - math.floor(slot2.roundIndex / 2))

		slot4 = tonumber(getText(slot3))
		slot5 = slot2.modelCount

		LeanTween.cancel(go(slot0.bombPanel:Find("tx_score")))

		if slot1 and slot4 ~= slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-111, warpins: 1 ---
			LeanTween.scale(go(slot3), Vector3(1.5, 1.5, 1), 0.2)
			LeanTween.value(go(slot3), slot4, slot5, (slot5 - slot4) * 0.1):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				setText(slot0, math.floor(slot0))

				return
				--- END OF BLOCK #0 ---



			end)):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				setText(setText, )

				return
				--- END OF BLOCK #0 ---



			end)):setEase(LeanTweenType.easeInOutSine):setDelay(0.2)
			LeanTween.scale(go(slot3), Vector3.one, 0.3):setDelay(1 + (slot5 - slot4) * 0.1)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 112-118, warpins: 2 ---
			slot3.localScale = Vector3.one

			setText(slot3, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 119-119, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 120-120, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.HandleShowMsgBox = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1.blurLevelCamera = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1)

	return
	--- END OF BLOCK #0 ---



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
	if slot0.commanderFormationPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-20, warpins: 1 ---
		slot0.commanderFormationPanel:detach()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-23, warpins: 2 ---
	if slot0.levelFleetPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-31, warpins: 1 ---
		slot0.contextData.selectedFleetIDs = {}

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-46, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.levelFleetPanel.selectIds) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-35, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 36-44, warpins: 0 ---
			for slot9, slot10 in pairs(slot5) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-42, warpins: 1 ---
				slot0.contextData.selectedFleetIDs[#slot0.contextData.selectedFleetIDs + 1] = slot10
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 43-44, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 45-46, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 47-101, warpins: 2 ---
	slot0:hideChapterPanel()
	slot0:hideFleetSelect()
	slot0:hideFleetEdit()
	slot0:hideRepairWindow()
	slot0:hideStrategyInfo()
	slot0:hideSignalPanel()
	slot0:hideRemasterPanel()
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
	--- BLOCK #4 102-108, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.mapItemTimer) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 102-103, warpins: 1 ---
		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 104-106, warpins: 1 ---
			slot5:Stop()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 107-108, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 109-114, warpins: 1 ---
	slot0.mapItemTimer = nil

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 115-120, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.tweens) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 115-118, warpins: 1 ---
		LeanTween.cancel(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 119-120, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 121-125, warpins: 1 ---
	slot0.tweens = nil

	if slot0.stageTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 126-131, warpins: 1 ---
		slot0.stageTimer:Stop()

		slot0.stageTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 132-134, warpins: 2 ---
	if slot0.cloudTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 135-141, warpins: 1 ---
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

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 142-144, warpins: 2 ---
	if slot0.newChapterCDTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 145-150, warpins: 1 ---
		slot0.newChapterCDTimer:Stop()

		slot0.newChapterCDTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 151-153, warpins: 2 ---
	if slot0.resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 154-159, warpins: 1 ---
		slot0.resPanel:exit()

		slot0.resPanel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 160-162, warpins: 2 ---
	if slot0.resPanel1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 163-168, warpins: 1 ---
		slot0.resPanel1:exit()

		slot0.resPanel1 = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 169-171, warpins: 2 ---
	if slot0.activityBossBattlePanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 172-175, warpins: 1 ---
		slot0.activityBossBattlePanel:clear()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 176-215, warpins: 2 ---
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

	slot1 = getProxy(ChapterProxy)

	if not slot0.contextData.map:isActivity() and not slot2:isSham() and not slot2:isGuildBoss() and not slot2:isEscort() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 231-236, warpins: 1 ---
		slot1:recordLastMap(ChapterProxy.LAST_MAP, slot2.id)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 237-240, warpins: 5 ---
	if Map.lastMapForActivity then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 241-247, warpins: 1 ---
		slot1:recordLastMap(ChapterProxy.LAST_MAP_FOR_ACTIVITY, Map.lastMapForActivity)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 248-248, warpins: 2 ---
	return
	--- END OF BLOCK #15 ---



end

return slot0
