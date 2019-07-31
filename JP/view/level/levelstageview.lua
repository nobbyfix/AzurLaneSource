slot0 = class("LevelStageView", import("..base.BaseSubView"))

slot0.getUIName = function (slot0)
	return "LevelStageView"
end

slot0.OnInit = function (slot0)
	slot0:InitUI()
	slot0:AddListener()

	chapter_skip_battle = PlayerPrefs.GetInt("chapter_skip_battle") or 0

	if Application.isEditor then
		function switch_chapter_skip_battle()
			chapter_skip_battle = 1 - chapter_skip_battle

			PlayerPrefs.SetInt("chapter_skip_battle", chapter_skip_battle)
			PlayerPrefs.Save()
			pg.TipsMgr:GetInstance():ShowTips((chapter_skip_battle == 1 and "已开启战斗跳略") or "已关闭战斗跳略")
		end
	end

	slot0.isFrozen = nil

	setActive(slot0._tf, true)
end

slot0.OnDestroy = function (slot0)
	if slot0.stageTimer then
		slot0.stageTimer:Stop()

		slot0.stageTimer = nil
	end

	if slot0.resPanel1 then
		slot0.resPanel1:exit()

		slot0.resPanel1 = nil
	end

	if not IsNil(slot0.winCondPanel) then
		slot0.winCondPanel:Destroy()

		slot0.winCondPanel = nil
	end
end

slot1 = -300

slot0.InitUI = function (slot0)
	slot0.topStage = slot0:findTF("top_stage", slot0._tf)
	slot0.resStage = slot0:findTF("resources", slot0.topStage)
	slot0.resPanel1 = PlayerResource.New()

	slot0.resPanel1:setParent(slot0.resStage, false)
	setActive(slot0.topStage, true)

	slot0.bottomStage = slot0:findTF("bottom_stage", slot0._tf)
	slot0.normalRole = findTF(slot0.bottomStage, "normal")
	slot0.funcBtn = slot0:findTF("func_button", slot0.normalRole)
	slot0.retreatBtn = slot0:findTF("retreat_button", slot0.normalRole)
	slot0.switchBtn = slot0:findTF("switch_button", slot0.normalRole)
	slot0.resetBtn = slot0:findTF("reset_button", slot0.normalRole)
	slot0.helpBtn = slot0:findTF("help_button", slot0.normalRole)
	slot0.shengfuBtn = slot0:findTF("shengfu/shengfu_button", slot0.normalRole)
	slot0.teleportSubRole = findTF(slot0.bottomStage, "teleportSub")
	slot0.deployBtn = slot0:findTF("confirm_button", slot0.teleportSubRole)
	slot0.undeployBtn = slot0:findTF("cancel_button", slot0.teleportSubRole)

	setActive(slot0.bottomStage, true)
	setAnchoredPosition(slot0.normalRole, {
		x = 0,
		y = 0
	})
	setAnchoredPosition(slot0.teleportSubRole, {
		x = 0,
		y = slot0
	})

	slot0.leftStage = slot0:findTF("left_stage", slot0._tf)

	setActive(slot0.leftStage, true)

	slot0.rightStage = slot0:findTF("right_stage", slot0._tf)
	slot0.bombPanel = slot0.rightStage:Find("bomb_panel")
	slot0.panelBarrier = slot0:findTF("panel_barrier", slot0.rightStage)
	slot0.shamShopBtn = slot0:findTF("btn_sham_shop", slot0.rightStage)

	setActive(slot0.panelBarrier, false)
	setActive(slot0.rightStage, true)

	slot0.airSupremacy = slot0:findTF("msg_panel/air_supremacy", slot0.topStage)

	setAnchoredPosition(slot0.topStage, {
		y = slot0.topStage.rect.height
	})
	setAnchoredPosition(slot0.leftStage, {
		x = -slot0.leftStage.rect.width - 200
	})
	setAnchoredPosition(slot0.rightStage, {
		x = slot0.rightStage.rect.width + 200
	})
	setAnchoredPosition(slot0.bottomStage, {
		y = -slot0.bottomStage.rect.height
	})
end

slot0.AddListener = function (slot0)
	onButton(slot0, slot0:findTF("option", slot0.topStage), function ()
		slot0:emit(BaseUI.ON_HOME)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("back_button", slot0.topStage), function ()
		if slot0.contextData.chapterVO and slot0:getDataType() == ChapterConst.TypeGuild then
			slot0:emit(slot1.ON_BACK)

			return
		end

		slot0:emit(LevelUIConst.SWITCH_TO_MAP)
	end, SFX_CANCEL)
	onButton(slot0, slot0.retreatBtn, function ()
		slot1 = slot0.contextData.map
		slot2 = "levelScene_whether_to_retreat"

		if slot0.contextData.chapterVO:existOni() then
			slot2 = "levelScene_oni_retreat"
		elseif slot0:isPlayingWithBombEnemy() then
			slot2 = "levelScene_bomb_retreat"
		elseif slot0:getPlayType() == ChapterConst.TypeTransport and not slot1:isSkirmish() then
			slot2 = "levelScene_escort_retreat"
		end

		slot0:HandleShowMsgBox({
			content = i18n(slot2),
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
	onButton(slot0, slot0.shamShopBtn, function ()
		slot0:emit(LevelUIConst.IS_Frozen)

		if slot0.emit.isFrozen then
			return
		end

		slot0:emit(LevelMediator2.ON_OPEN_SHAM_SHOP)
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
				slot0:emit(LevelUIConst.DO_AMBUSH_WARNING, slot0)
				coroutine.yield()
				coroutine.yield:emit(LevelUIConst.DISPLAY_AMBUSH_INFO, coroutine.yield)
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
				if slot0:existOni() then
					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = i18n("levelScene_sphunt_help_tip")
					})
				elseif slot0:isTypeDefence() then
					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = i18n("help_battle_defense")
					})
				elseif slot0:isPlayingWithBombEnemy() then
					slot0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
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
	onButton(slot0, slot0.airSupremacy, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("help_battle_ac")
		})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.deployBtn, function ()
		slot1, slot2 = slot0.contextData.chapterVO.GetSubmarineFleet(slot0)
		slot3 = slot1.startPos

		if not slot0.grid.subTeleportTargetLine then
			return
		end

		slot5, slot6 = slot0:findPath(nil, slot3, slot4)

		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			content = i18n("tips_confirm_teleport_sub", slot0.grid:TransformLine2PlanePos(slot3), slot0.grid:TransformLine2PlanePos(slot4), slot5, math.ceil(pg.strategy_data_template[ChapterConst.StrategySubTeleport].arg[2] * #slot1:getShips(false) * slot5 - 1e-05)),
			onYes = function ()
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSubTeleport,
					id = slot1.id,
					arg1 = slot2.row,
					arg2 = slot2.column
				})
			end
		})
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.undeployBtn, function ()
		slot0:SwitchBottomStage(false)
		slot0.SwitchBottomStage.grid:TurnOffSubTeleport()
		slot0.SwitchBottomStage.grid.TurnOffSubTeleport.grid:updateQuadCells(ChapterConst.QuadStateNormal)
	end, SFX_UI_CLICK)
	onButton(slot0, slot0.shengfuBtn, function ()
		slot0:DisplayWinConditionPanel()
	end)
end

slot0.SetSeriesOperation = function (slot0, slot1)
	slot0.seriesOperation = slot1
end

slot0.SetGrid = function (slot0, slot1)
	slot0.grid = slot1
end

slot0.SetPlayer = function (slot0, slot1)
	slot0.resPanel1:setResources(slot1)
end

slot0.SwitchToChapter = function (slot0, slot1)
	slot5 = findTF(slot0.rightStage, "target")
	slot6 = findTF(slot0.rightStage, "skip_events")

	setActive(slot3, slot1:existAmbush())
	setActive(slot0.airSupremacy, OPEN_AIR_DOMINANCE and slot1:getConfig("air_dominance") > 0)
	setActive(findTF(slot0.topStage, "msg_panel/sham_progress"), slot1:getDataType() == ChapterConst.TypeSham)
	setActive(findTF(slot0.rightStage, "btn_sham_shop"), slot1.getDataType() == ChapterConst.TypeSham)

	if slot2 == ChapterConst.TypeSham then
		setActive(slot7, getProxy(ChapterProxy):getShamShop() ~= nil)
	end

	setActive(slot0.resetBtn, slot2 == ChapterConst.TypeSham or slot2 == ChapterConst.TypeGuild)
	setImageColor(slot0.resetBtn, (slot2 == ChapterConst.TypeSham and ChapterConst.ShamResetCountLimit <= slot1.shamResetCount and Color(1, 1, 10, 0.5882352941176471)) or Color(1, 1, 1, 1))

	slot0.achieveOriginalY = -240

	setText(slot6:Find("Label"), i18n("map_event_skip"))

	if slot1:getConfig("event_skip") == 1 then
		if slot1.progress > 0 or slot1.defeatCount > 0 or slot1.passCount > 0 then
			setActive(slot6, true)

			slot5.anchoredPosition = Vector2.New(slot5.anchoredPosition.x, slot0.achieveOriginalY - 40)
			GetComponent(slot6, typeof(Toggle)).isOn = PlayerPrefs.GetInt("skip_events_on_" .. slot1.id, 1) == 1

			onToggle(slot0, slot6, function (slot0)
				PlayerPrefs.SetInt(slot0, (slot0 and 1) or 0)
			end)
		else
			setActive(slot6, false)

			if not PlayerPrefs.HasKey(key) then
				PlayerPrefs.SetInt(key, 0)
			end
		end
	else
		setActive(slot6, false)

		slot5.anchoredPosition = Vector2.New(slot5.anchoredPosition.x, slot0.achieveOriginalY)
	end

	setActive(slot5, slot1:existAchieve())
	setActive(slot0.retreatBtn, slot2 == ChapterConst.TypeNone)
	slot0.seriesOperation()
end

slot0.SwitchToMap = function (slot0)
	shiftPanel(slot0.topStage, 0, slot0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

slot0.updateStageInfo = function (slot0)
	slot2 = slot0.contextData.chapterVO.getDataType(slot1)
	slot4 = findTF(slot0.topStage, "unlimit")

	setWidgetText(findTF(slot0.topStage, "timer"), "--:--:--")

	if slot0.stageTimer then
		slot0.stageTimer:Stop()
	end

	if slot1:getConfig("time") < slot1:getRemainTime() or slot1:getConfig("time") >= 8640000 then
		setActive(slot3, false)
		setActive(slot4, true)
	else
		setActive(slot3, true)
		setActive(slot4, false)

		slot0.stageTimer = Timer.New(function ()
			if IsNil(IsNil) then
				return
			end

			setWidgetText(slot1:getRemainTime(), pg.TimeMgr:GetInstance():DescCDTime(slot1.getRemainTime()))
		end, 1, -1)

		slot0.stageTimer:Start()
		slot0.stageTimer.func()
	end
end

slot0.updateAmbushRate = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-21, warpins: 2 ---
	if not slot0.contextData.chapterVO:existAmbush() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot5 = slot3.fleet.getInvestSums(slot4)
	slot6 = slot3:getAmbushRate(slot3.fleet, slot1)
	slot7 = ChapterConst.GetAmbushDisplay
	slot8 = (not slot2 or not slot3:existEnemy(ChapterConst.SubjectPlayer, slot1.row, slot1.column)) and slot6
	slot15, slot15 = slot7(slot8)

	setText(slot9, i18n("level_scene_title_word_1"))
	setText(slot10, i18n("level_scene_title_word_2"))
	setText(slot11, math.floor(slot5))
	setText(slot12, slot7)
	setTextColor(findTF(slot0.topStage, "msg_panel/ambush/value2"), slot8)

	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-30, warpins: 1 ---
	if not slot3.existEnemy(ChapterConst.SubjectPlayer, slot1.row, slot1.column) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-32, warpins: 2 ---
		slot8 = slot6
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-34, warpins: 1 ---
		slot8 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-35, warpins: 0 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 36-80, warpins: 3 ---
	--- END OF BLOCK #3 ---



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
			--- BLOCK #0 1-10, warpins: 1 ---
			slot0:emit(LevelUIConst.IS_Frozen)

			if slot0.emit.isFrozen then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-11, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-18, warpins: 1 ---
			if slot0.grid.quadState == ChapterConst.QuadStateStrategy then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 19-26, warpins: 1 ---
				slot0.grid:updateQuadCells(ChapterConst.QuadStateNormal)

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 27-37, warpins: 1 ---
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
			--- BLOCK #3 38-38, warpins: 2 ---
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 39-39, warpins: 2 ---
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

slot0.updateFleetBuff = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot3 = slot0.contextData.chapterVO.getFleetStgIds(slot1, slot2)
	slot4 = {}

	if slot0.contextData.chapterVO:GetSubmarineFleet() and _.filter(slot5:getStrategies(), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if pg.strategy_data_template[slot0.id].type ~= ChapterConst.StgTypePassive or slot0.count <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-15, warpins: 2 ---
			slot2 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-16, warpins: 1 ---
			slot2 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-17, warpins: 2 ---
		return slot2
		--- END OF BLOCK #1 ---



	end) and #slot6 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-31, warpins: 1 ---
		_.each(slot6, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			table.insert(slot0, {
				id = slot0.id,
				count = slot0.count
			})

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 32-38, warpins: 4 ---
	slot6 = nil
	slot7 = 0

	if slot1:ExistDivingChampion() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-40, warpins: 1 ---
		slot6 = {
			icon = "submarine_approach"
		}
		slot7 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-83, warpins: 2 ---
	setActive(slot10, false)

	slot11 = UIItemList.New(slot9, slot10)

	slot11:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		setActive(findTF(slot2, "frame"), false)
		setActive(findTF(slot2, "Text"), false)
		setActive(findTF(slot2, "times"), false)

		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-30, warpins: 1 ---
			if slot1 + 1 <= #slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-50, warpins: 1 ---
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
			--- BLOCK #1 51-58, warpins: 1 ---
			if slot1 + 1 <= #slot0 + #slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 59-96, warpins: 1 ---
				GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[slot2[(slot1 + 1) - #slot0].id].icon, "", slot2)
				setActive(findTF(slot2, "times"), true)
				setText(findTF(slot2, "times"), slot2[(slot1 + 1) - #slot0].count)
				onButton(slot1, slot2, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-26, warpins: 1 ---
					slot0:HandleShowMsgBox({
						yesText = "text_confirm",
						hideNo = true,
						content = "",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = slot1.id,
							cfg = slot1
						},
						extendDesc = string.format(i18n("word_rest_times"), slot2.count)
					})

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 97-106, warpins: 1 ---
				if slot1 + 1 <= #slot0 + #slot2 + slot1 + 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 107-127, warpins: 1 ---
					GetImageSpriteFromAtlasAsync("strategyicon/" .. slot4.icon, "", slot2)

					slot3 = slot2:GetComponent(typeof(Image))

					onButton(slot1, slot2, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-19, warpins: 1 ---
						slot0:HandleShowMsgBox({
							yesText = "text_confirm",
							hideNo = true,
							type = MSGBOX_TYPE_DROP_ITEM,
							name = i18n("submarine_approach"),
							content = i18n("submarine_approach_desc"),
							sprite = slot1.sprite
						})

						return
						--- END OF BLOCK #0 ---



					end, SFX_PANEL)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 128-181, warpins: 1 ---
					GetImageSpriteFromAtlasAsync("commanderskillicon/" .. slot5[(slot1 + 1) - #slot0 - #slot2 - slot5].getConfig(slot3, "icon"), "", slot2)
					setText(findTF(slot2, "Text"), "Lv." .. slot5[(slot1 + 1) - #slot0 - #slot2 - slot5].getConfig(slot3, "lv"))
					setActive(findTF(slot2, "Text"), true)
					setActive(findTF(slot2, "frame"), true)
					onButton(slot1, slot2, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-8, warpins: 1 ---
						slot0:emit(LevelMediator2.ON_COMMANDER_SKILL, slot0)

						return
						--- END OF BLOCK #0 ---



					end, SFX_PANEL)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 182-182, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end)
	slot11:align(#slot3 + #slot4 + slot7 + #_.map(_.values(slot2:getCommanders()), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		return slot0:getSkills()[1]
		--- END OF BLOCK #0 ---



	end))

	if OPEN_AIR_DOMINANCE and slot1:getConfig("air_dominance") > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-93, warpins: 1 ---
		slot0:updateAirDominance()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 94-98, warpins: 3 ---
	slot0:updateChapterBuff()

	return
	--- END OF BLOCK #3 ---



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

slot0.updateAirDominance = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1, slot2, slot3 = slot0.contextData.chapterVO:getAirDominanceValue()

	if not slot3 or slot3 ~= slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-23, warpins: 2 ---
		slot0.contextData.chapterVO:setAirDominanceStatus(slot2)
		getProxy(ChapterProxy):updateChapter(slot0.contextData.chapterVO)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-25, warpins: 2 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-27, warpins: 1 ---
		if slot2 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-29, warpins: 1 ---
			slot4 = 3
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-30, warpins: 1 ---
			slot4 = slot2
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 31-32, warpins: 2 ---
		if slot3 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-34, warpins: 1 ---
			slot5 = 3
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-35, warpins: 1 ---
			slot5 = slot3
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 36-36, warpins: 2 ---
		slot4 = slot4 - slot5
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 37-44, warpins: 2 ---
	slot0.isChange = slot4
	slot5 = slot0
	slot4 = slot0.updateAirDominanceTitle
	slot6 = slot1
	slot7 = slot2

	if not slot0.isChange then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-45, warpins: 1 ---
		slot8 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 46-47, warpins: 2 ---
	slot4(slot5, slot6, slot7, slot8)

	return
	--- END OF BLOCK #3 ---



end

slot0.updateAirDominanceTitle = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-53, warpins: 1 ---
	slot7 = findTF(slot0.airSupremacy, "value2")

	setText(slot4, i18n("level_scene_title_word_3"))
	setText(slot5, i18n("level_scene_title_word_4"))
	setText(slot6, math.floor(slot1))
	setActive(slot8, false)
	setActive(findTF(slot0.airSupremacy, "down"), false)

	if slot3 ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-61, warpins: 1 ---
		if LeanTween.isTweening(go(slot7)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-67, warpins: 1 ---
			LeanTween.cancel(go(slot7))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 68-116, warpins: 2 ---
		LeanTween.value(go(slot7), 1, 0, 0.5):setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setTextAlpha(slot0, slot0)

			return
			--- END OF BLOCK #0 ---



		end)):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-33, warpins: 1 ---
			setText(setText, ChapterConst.AirDominance[setText].name)
			setTextColor(setTextColor, ChapterConst.AirDominance[setTextColor].color)
			LeanTween.value(go(slot0), 0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				setTextAlpha(slot0, slot0)

				return
				--- END OF BLOCK #0 ---



			end))

			return
			--- END OF BLOCK #0 ---



		end))

		local function slot10(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(slot0, false)

			return
			--- END OF BLOCK #0 ---



		end

		slot8:GetComponent(typeof(DftAniEvent)):SetEndEvent(slot10)
		slot9:GetComponent(typeof(DftAniEvent)):SetEndEvent(slot10)

		slot11 = setActive
		slot12 = slot8

		if slot3 <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 117-118, warpins: 1 ---
			slot13 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 119-119, warpins: 1 ---
			slot13 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 120-125, warpins: 2 ---
		slot11(slot12, slot13)

		slot11 = setActive
		slot12 = slot9

		if slot3 >= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 126-127, warpins: 1 ---
			slot13 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 128-128, warpins: 1 ---
			slot13 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 129-130, warpins: 2 ---
		slot11(slot12, slot13)
		--- END OF BLOCK #3 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 131-144, warpins: 1 ---
		setText(slot7, ChapterConst.AirDominance[slot2].name)
		setTextColor(slot7, ChapterConst.AirDominance[slot2].color)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 145-146, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateShamProgress = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	setText(findTF(slot0.topStage, "msg_panel/sham_progress/value"), slot0.contextData.chapterVO.progress .. " / " .. ChapterConst.ShamEnemyLimit)

	return
	--- END OF BLOCK #0 ---



end

slot0.UpdateDefenseStatus = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	if slot0.contextData.chapterVO.getPlayType(slot1) ~= ChapterConst.TypeDefence then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-11, warpins: 1 ---
		slot2 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-12, warpins: 1 ---
		slot2 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-22, warpins: 2 ---
	setActive(findTF(slot0.bottomStage, "normal/shengfu"), slot2)

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-23, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-49, warpins: 2 ---
	findTF(slot3, "hp"):GetComponent(typeof(Text)).text = i18n("desc_base_hp", "<color=#92FC63>" .. tostring(slot1.BaseHP) .. "</color>", pg.chapter_defense[slot1.id].port_hp)

	return
	--- END OF BLOCK #2 ---



end

slot0.DisplayWinConditionPanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if IsNil(slot0.winCondPanel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-19, warpins: 1 ---
		slot0.winCondPanel = WinConditionDisplayPanel.New(slot0._tf.parent, slot0._event, slot0.contextData)
		slot0.winCondPanel.ParentView = slot0

		slot0.winCondPanel:Load()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-27, warpins: 2 ---
	slot0.winCondPanel:ActionInvoke("Enter", slot0.contextData.chapterVO)

	return
	--- END OF BLOCK #1 ---



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
		--- BLOCK #0 50-76, warpins: 1 ---
		table.insert(slot11, 2, {
			id = ChapterConst.StrategySubTeleport
		})
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
	--- BLOCK #1 77-81, warpins: 2 ---
	if #slot1.strategies > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 82-85, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 86-94, warpins: 0 ---
		for slot15, slot16 in pairs(slot1.strategies) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 86-92, warpins: 1 ---
			table.insert(slot11, {
				id = slot15,
				count = slot16
			})
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 93-94, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 95-131, warpins: 2 ---
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
			--- BLOCK #1 45-60, warpins: 3 ---
			LoadSpriteAsync("strategyicon/" .. slot5, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				if not IsNil(slot0) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 6-14, warpins: 1 ---
					setImageSprite(slot0:Find("icon"), slot0)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 15-15, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)
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
						--- BLOCK #1 104-109, warpins: 1 ---
						if slot1.id == ChapterConst.StrategySubTeleport then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 110-136, warpins: 1 ---
							slot0:SwitchBottomStage(true)
							slot0.SwitchBottomStage.grid:ShowStaticHuntingRange()
							slot0.SwitchBottomStage.grid.ShowStaticHuntingRange:updateStageStrategy()
							slot0.SwitchBottomStage.grid.ShowStaticHuntingRange.updateStageStrategy.grid:PrepareSubTeleport()
							slot0.SwitchBottomStage.grid.ShowStaticHuntingRange.updateStageStrategy.grid.PrepareSubTeleport.grid:updateQuadCells(ChapterConst.QuadStateTeleportSub)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 137-142, warpins: 1 ---
							if slot1.id == ChapterConst.StrategySonarDetect then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 143-143, warpins: 1 ---
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 144-148, warpins: 1 ---
								if slot8 == ChapterConst.StgTypeForm then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 149-179, warpins: 1 ---
									slot0:emit(LevelMediator2.ON_OP, {
										type = ChapterConst.OpStrategy,
										id = slot7:getNextStgUser(slot1.id),
										arg1 = slot9[table.indexof(slot9, slot1.id) % #slot9 + 1]
									})
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 180-186, warpins: 1 ---
									slot0:emit(LevelUIConst.DISPLAY_STRATEGY_INFO, slot0)
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 187-187, warpins: 7 ---
				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 188-188, warpins: 2 ---
				--- END OF BLOCK #3 ---



			end, SFX_PANEL)

			if slot4 == ChapterConst.StgTypeForm or slot4 == ChapterConst.StgTypeConst then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-87, warpins: 2 ---
				setText(slot2:Find("nums"), "")
				setActive(slot2:Find("mask"), false)

				slot7 = slot2:Find("selected")

				if setActive ~= slot3.id then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 88-89, warpins: 1 ---
					slot8 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 90-90, warpins: 1 ---
					slot8 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 91-92, warpins: 2 ---
				slot6(slot7, slot8)
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 93-107, warpins: 1 ---
				setText(slot2:Find("nums"), slot3.count)

				slot6 = setActive
				slot7 = slot2:Find("mask")

				if slot3.count ~= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 108-109, warpins: 1 ---
					slot8 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 110-110, warpins: 1 ---
					slot8 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 111-118, warpins: 2 ---
				slot6(slot7, slot8)
				setActive(slot2:Find("selected"), false)
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 119-119, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 120-121, warpins: 2 ---
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
	--- END OF BLOCK #2 ---



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
						--- BLOCK #0 4-10, warpins: 1 ---
						slot1:emit(LevelUIConst.DISPLAY_REPAIR_WINDOW, )
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 11-11, warpins: 2 ---
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

slot0.ShiftStagePanelIn = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-45, warpins: 1 ---
	shiftPanel(slot0.topStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.bottomStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	return
	--- END OF BLOCK #0 ---



end

slot0.ShiftStagePanelOut = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-57, warpins: 1 ---
	shiftPanel(slot0.topStage, 0, slot0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.bottomStage, 0, -slot0.bottomStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, -slot0.leftStage.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, slot0.rightStage.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	return
	--- END OF BLOCK #0 ---



end

slot0.SwitchBottomStage = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = shiftPanel
	slot3 = slot0.teleportSubRole
	slot4 = 0

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot5 = 0
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		slot5 = slot0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-18, warpins: 2 ---
	slot2(slot3, slot4, slot5, 0.3, 0, true, true)

	slot2 = shiftPanel
	slot3 = slot0.normalRole
	slot4 = 0

	if not slot1 or not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-22, warpins: 2 ---
		slot5 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-31, warpins: 2 ---
	slot2(slot3, slot4, slot5, 0.3, 0, true, true)

	slot2 = shiftPanel
	slot3 = slot0.leftStage

	if not slot1 or not (-slot0.leftStage.rect.width - 200) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-39, warpins: 2 ---
		slot4 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 40-48, warpins: 2 ---
	slot2(slot3, slot4, 0, 0.3, 0, true)

	slot2 = shiftPanel
	slot3 = slot0.rightStage

	if not slot1 or not (slot0.rightStage.rect.width + 200) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-55, warpins: 2 ---
		slot4 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 56-61, warpins: 2 ---
	slot2(slot3, slot4, 0, 0.3, 0, true)

	return
	--- END OF BLOCK #4 ---



end

slot0.clickGridCell = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
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
		--- BLOCK #0 34-46, warpins: 1 ---
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
	--- BLOCK #1 47-51, warpins: 5 ---
	if slot2:checkAnyInteractive() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-55, warpins: 1 ---
		triggerButton(slot0.funcBtn)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-62, warpins: 1 ---
		if slot2:getRound() == ChapterConst.RoundEnemy then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-72, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpEnemyRound
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 73-74, warpins: 1 ---
			if slot6 and slot3 == ChapterConst.TypeSham then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 79-84, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-89, warpins: 2 ---
				if slot1.row ~= slot4.line.row or slot1.column ~= slot4.line.column then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 95-104, warpins: 2 ---
					if slot2:getChapterCell(slot1.row, slot1.column).attachment == ChapterConst.AttachStory and slot8.data == ChapterConst.StoryObstacle and slot8.flag == 3 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 113-119, warpins: 1 ---
						if slot2:getPlayType() ~= ChapterConst.TypeDefence then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 120-130, warpins: 1 ---
							pg.TipsMgr:GetInstance():ShowTips(i18n("map_event_stop_tip"))
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 131-133, warpins: 2 ---
						return
						--- END OF BLOCK #1 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 134-142, warpins: 3 ---
						if not slot2:considerAsStayPoint(ChapterConst.SubjectPlayer, slot1.row, slot1.column) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 143-145, warpins: 1 ---
							return
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 146-150, warpins: 1 ---
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
								--- BLOCK #0 170-181, warpins: 1 ---
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
					--- BLOCK #1 182-196, warpins: 5 ---
					if slot2:findPath(ChapterConst.SubjectPlayer, slot4.line, {
						row = slot1.row,
						column = slot1.column
					}) < PathFinding.PrioObstacle then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 197-212, warpins: 1 ---
						slot0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpMove,
							id = slot4.id,
							arg1 = slot1.row,
							arg2 = slot1.column
						})
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 213-216, warpins: 1 ---
						if slot9 < PathFinding.PrioForbidden then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 217-228, warpins: 1 ---
							pg.TipsMgr:GetInstance():ShowTips(i18n("destination_can_not_reach"))
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 229-239, warpins: 1 ---
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

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 240-241, warpins: 7 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.doSafeCheck = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot3 = slot0.contextData.chapterVO.getDataType(slot2)
	slot5 = slot0.contextData.chapterVO.fleet.line
	slot6 = slot0:CheckTransportState(slot2)

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot0:emit(LevelMediator2.ON_OP, {
			type = ChapterConst.OpRetreat
		})

		return
		--- END OF BLOCK #0 ---



	end

	slot9 = false

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-110, warpins: 0 ---
	for slot13, slot14 in pairs(slot8) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-23, warpins: 1 ---
		if slot14.type == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-36, warpins: 1 ---
			slot16 = 0

			_.each(slot2:findChapterCells(ChapterConst.AttachBoss), function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-2, warpins: 1 ---
				if slot0 and slot0.flag == 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 6-8, warpins: 1 ---
					slot0 = slot0 + 1
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 9-9, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end)

			if not slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 37-39, warpins: 1 ---
				if slot14.param > slot16 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 40-41, warpins: 1 ---
					slot9 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 42-42, warpins: 1 ---
					slot9 = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 43-43, warpins: 3 ---
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-46, warpins: 1 ---
			if slot14.type == 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 47-48, warpins: 1 ---
				if not slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 49-54, warpins: 1 ---
					if slot14.param > slot2:GetDefeatCount() then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 55-56, warpins: 1 ---
						slot9 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 57-57, warpins: 1 ---
						slot9 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 58-58, warpins: 3 ---
				--- END OF BLOCK #1 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 59-61, warpins: 1 ---
				if slot14.type == 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 62-63, warpins: 1 ---
					if not slot9 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 64-65, warpins: 1 ---
						if slot6 ~= 1 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 66-67, warpins: 1 ---
							slot9 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 68-68, warpins: 1 ---
							slot9 = true
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 69-69, warpins: 3 ---
					--- END OF BLOCK #1 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 70-72, warpins: 1 ---
					if slot14.type == 4 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 73-74, warpins: 1 ---
						if not slot9 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 75-80, warpins: 1 ---
							if slot14.param >= slot2:getRoundNum() then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 81-82, warpins: 1 ---
								slot9 = false
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 83-83, warpins: 1 ---
								slot9 = true
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 84-84, warpins: 3 ---
						--- END OF BLOCK #1 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 85-87, warpins: 1 ---
						if slot14.type == 5 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 88-95, warpins: 1 ---
							slot15 = slot14.param

							if not _.any(slot2.champions, function (slot0)

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-4, warpins: 1 ---
								if slot0.attachmentId ~= slot0 then

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
								--- BLOCK #1 8-11, warpins: 2 ---
								--- END OF BLOCK #1 ---

								FLOW; TARGET BLOCK #2



								-- Decompilation error in this vicinity:
								--- BLOCK #2 12-21, warpins: 0 ---
								for slot5, slot6 in pairs(slot0.idList) do

									-- Decompilation error in this vicinity:
									--- BLOCK #0 12-13, warpins: 1 ---
									if not slot1 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 14-16, warpins: 1 ---
										if slot6 ~= slot0 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 17-18, warpins: 1 ---
											slot1 = false
											--- END OF BLOCK #0 ---



										else

											-- Decompilation error in this vicinity:
											--- BLOCK #0 19-19, warpins: 1 ---
											slot1 = true
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---

									FLOW; TARGET BLOCK #1



									-- Decompilation error in this vicinity:
									--- BLOCK #1 20-21, warpins: 4 ---
									--- END OF BLOCK #1 ---



								end

								--- END OF BLOCK #2 ---

								FLOW; TARGET BLOCK #3



								-- Decompilation error in this vicinity:
								--- BLOCK #3 22-23, warpins: 1 ---
								if slot1 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 24-26, warpins: 1 ---
									if slot0.flag == 1 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 27-28, warpins: 1 ---
										slot2 = false
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 29-29, warpins: 1 ---
										slot2 = true
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end

								--- END OF BLOCK #3 ---

								FLOW; TARGET BLOCK #4



								-- Decompilation error in this vicinity:
								--- BLOCK #4 30-30, warpins: 3 ---
								return slot2
								--- END OF BLOCK #4 ---



							end) then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 96-101, warpins: 1 ---
								slot16 = _.any(slot2.cells, function (slot0)

									-- Decompilation error in this vicinity:
									--- BLOCK #0 1-4, warpins: 1 ---
									if slot0.attachmentId ~= slot0 then

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
									--- BLOCK #1 8-11, warpins: 2 ---
									--- END OF BLOCK #1 ---

									FLOW; TARGET BLOCK #2



									-- Decompilation error in this vicinity:
									--- BLOCK #2 12-21, warpins: 0 ---
									for slot5, slot6 in pairs(slot0.idList) do

										-- Decompilation error in this vicinity:
										--- BLOCK #0 12-13, warpins: 1 ---
										if not slot1 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 14-16, warpins: 1 ---
											if slot6 ~= slot0 then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 17-18, warpins: 1 ---
												slot1 = false
												--- END OF BLOCK #0 ---



											else

												-- Decompilation error in this vicinity:
												--- BLOCK #0 19-19, warpins: 1 ---
												slot1 = true
												--- END OF BLOCK #0 ---



											end
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---

										FLOW; TARGET BLOCK #1



										-- Decompilation error in this vicinity:
										--- BLOCK #1 20-21, warpins: 4 ---
										--- END OF BLOCK #1 ---



									end

									--- END OF BLOCK #2 ---

									FLOW; TARGET BLOCK #3



									-- Decompilation error in this vicinity:
									--- BLOCK #3 22-23, warpins: 1 ---
									if slot1 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 24-26, warpins: 1 ---
										if slot0.flag == 1 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 27-28, warpins: 1 ---
											slot2 = false
											--- END OF BLOCK #0 ---



										else

											-- Decompilation error in this vicinity:
											--- BLOCK #0 29-29, warpins: 1 ---
											slot2 = true
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #3 ---

									FLOW; TARGET BLOCK #4



									-- Decompilation error in this vicinity:
									--- BLOCK #4 30-30, warpins: 3 ---
									return slot2
									--- END OF BLOCK #4 ---



								end)
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 102-103, warpins: 2 ---
							if not slot9 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 104-104, warpins: 1 ---
								slot9 = not slot16
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #1 ---

							FLOW; TARGET BLOCK #2



							-- Decompilation error in this vicinity:
							--- BLOCK #2 105-105, warpins: 2 ---
							--- END OF BLOCK #2 ---



						end
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
		--- BLOCK #1 106-107, warpins: 6 ---
		if slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 108-108, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 109-110, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 111-112, warpins: 2 ---
	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 113-114, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 115-121, warpins: 1 ---
			if slot2:getPlayType() == ChapterConst.TypeTransport then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 122-132, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_escort_win"))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 133-143, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_chapter_win"))
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 144-152, warpins: 2 ---
			slot0:emit(LevelMediator2.ON_OP, {
				win = true,
				type = ChapterConst.OpRetreat
			})
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 153-155, warpins: 2 ---
		return true
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 156-164, warpins: 2 ---
	slot11 = false
	slot12 = nil

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 165-199, warpins: 0 ---
	for slot16, slot17 in pairs(slot10) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 165-167, warpins: 1 ---
		if slot17.type == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 168-174, warpins: 1 ---
			slot18 = _.any(slot2.fleets, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				if slot0:getFleetType() == FleetType.Normal then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 8-11, warpins: 1 ---
					slot1 = slot0:isValid()
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 12-13, warpins: 1 ---
					slot1 = false

					if false then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 14-14, warpins: 0 ---
						slot1 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 15-15, warpins: 3 ---
				return slot1
				--- END OF BLOCK #1 ---



			end)

			if not slot11 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 175-175, warpins: 1 ---
				slot11 = not slot18
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 176-177, warpins: 2 ---
			if slot11 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 178-178, warpins: 1 ---
				slot12 = "formation_invalide"
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 179-179, warpins: 2 ---
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 180-182, warpins: 1 ---
			if slot17.type == 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 183-184, warpins: 1 ---
				if not slot11 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 185-188, warpins: 1 ---
					if slot2.BaseHP > 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 189-190, warpins: 1 ---
						slot11 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 191-191, warpins: 1 ---
						slot11 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 192-193, warpins: 3 ---
				if slot11 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 194-194, warpins: 1 ---
					slot12 = "harbour_bomb_tip"
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 195-196, warpins: 4 ---
		if slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 197-197, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 198-199, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 200-206, warpins: 2 ---
	if slot2:getPlayType() == ChapterConst.TypeTransport and not slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 209-210, warpins: 1 ---
		if slot6 ~= -1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 211-212, warpins: 1 ---
			slot11 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 213-213, warpins: 1 ---
			slot11 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 214-215, warpins: 4 ---
	if slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 216-217, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 218-224, warpins: 1 ---
			if slot2:getPlayType() == ChapterConst.TypeTransport then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 225-237, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_escort_lose"))
				slot7()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 238-247, warpins: 1 ---
				slot0:HandleShowMsgBox({
					modal = true,
					hideNo = true,
					content = i18n(slot12),
					onYes = slot7,
					onClose = slot7
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 248-250, warpins: 3 ---
		return true
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 251-260, warpins: 2 ---
	_.each(slot2.fleets, function (slot0)

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

	if slot2:existOni() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 261-265, warpins: 1 ---
		if slot2:checkOniState() == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 266-267, warpins: 1 ---
			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 268-276, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OP, {
					win = true,
					type = ChapterConst.OpRetreat
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 277-280, warpins: 2 ---
			return true
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 281-282, warpins: 1 ---
			if slot13 == 2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 283-284, warpins: 1 ---
				if slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 285-293, warpins: 1 ---
					slot0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpRetreat
					})
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 294-297, warpins: 2 ---
				return true
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 298-302, warpins: 1 ---
		if slot2:isPlayingWithBombEnemy() and slot2:getBombChapterInfo().action_times * 2 <= slot2.roundIndex then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 311-312, warpins: 1 ---
			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 313-321, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 322-324, warpins: 2 ---
			return true
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 325-328, warpins: 6 ---
	if slot3 == ChapterConst.TypeSham and ChapterConst.ShamEnemyLimit <= slot2.progress then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 334-335, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 336-340, warpins: 1 ---
			if slot2.shamResetCount < ChapterConst.ShamResetCountLimit then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 341-353, warpins: 1 ---
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
				--- BLOCK #0 354-365, warpins: 1 ---
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



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 366-368, warpins: 3 ---
		return true
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 369-373, warpins: 3 ---
	if not slot2:inWartime() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 374-375, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 376-380, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_TIME_UP)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 381-383, warpins: 2 ---
		return true
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 384-388, warpins: 2 ---
	if not slot4:isValid() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 389-392, warpins: 1 ---
		if slot3 == ChapterConst.TypeSham then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 393-394, warpins: 1 ---
			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 395-403, warpins: 1 ---
				if getProxy(ContextProxy):getContextByMediator(LevelMediator2) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 404-407, warpins: 1 ---
					slot15 = slot14:getContextByMediator(ShamPreCombatMediator)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 408-409, warpins: 2 ---
				if not slot15 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 410-419, warpins: 1 ---
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



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 420-423, warpins: 3 ---
			return true
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 424-427, warpins: 1 ---
			if slot3 == ChapterConst.TypeNone then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 428-429, warpins: 1 ---
				if slot1 and slot2:getNextValidIndex() > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 436-450, warpins: 1 ---
					local function slot15()

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
						content = i18n("formation_switch_tip", slot2.fleets[slot13].name),
						onYes = slot15,
						onNo = slot15
					})
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 451-453, warpins: 3 ---
				return true
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 454-464, warpins: 4 ---
	slot13 = slot2:getConfig("act_id")

	if not slot0.contextData.map:isRemaster() and slot13 ~= 0 and (not getProxy(ActivityProxy):getActivityById(slot13) or slot15:isEnd()) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 481-482, warpins: 2 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 483-491, warpins: 1 ---
			slot0:emit(LevelMediator2.ON_OP, {
				type = ChapterConst.OpRetreat
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 492-494, warpins: 2 ---
		return true
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 495-504, warpins: 4 ---
	if slot2:getChapterCell(slot5.row, slot5.column).attachment == ChapterConst.AttachBox and slot14.flag ~= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 508-509, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 510-512, warpins: 1 ---
			triggerButton(slot0.funcBtn)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 513-515, warpins: 2 ---
		return true
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 516-518, warpins: 3 ---
	return false
	--- END OF BLOCK #13 ---



end

slot0.CheckTransportState = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
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



	end) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		return 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-20, warpins: 2 ---
	slot3 = slot1:findChapterCell(ChapterConst.AttachTransport_Target)

	if not slot2:isValid() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-24, warpins: 1 ---
		return -1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-29, warpins: 1 ---
		if slot2.line.row == slot3.row and slot2.line.column == slot3.column and not slot1:existEnemy(ChapterConst.SubjectPlayer, slot3.row, slot3.column) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-47, warpins: 1 ---
			return 1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 48-50, warpins: 3 ---
			return 0
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 51-51, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.tryAutoTrigger = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if not slot0:doSafeCheck(true) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		if slot0.contextData.chapterVO:checkAnyInteractive() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			triggerButton(slot0.funcBtn)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-24, warpins: 1 ---
			if slot2:getRound() == ChapterConst.RoundEnemy then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-34, warpins: 1 ---
				slot0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-41, warpins: 1 ---
				if slot2:getRound() == ChapterConst.RoundPlayer then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 42-47, warpins: 1 ---
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
	--- BLOCK #1 48-48, warpins: 5 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.tryAutoAction = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot2 = slot0.contextData.chapterVO

	if slot0:doSafeCheck(false) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-10, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-12, warpins: 1 ---
			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-23, warpins: 1 ---
	slot4 = nil


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
		--- BLOCK #4 37-42, warpins: 2 ---
		slot2 = slot0:isPlayingWithBombEnemy()

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-63, warpins: 1 ---
			slot1:emit(LevelUIConst.FROZEN)
			slot1:emit(LevelUIConst.DO_TRACKING, slot2)
			coroutine.yield()

			if not slot1.contextData.chapterVO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 64-64, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 65-76, warpins: 2 ---
			slot1:tryPlayChapterStory()

			if slot0:findChapterCell(ChapterConst.AttachBoss) and slot3.trait == ChapterConst.TraitLurk then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 82-91, warpins: 1 ---
				slot1.grid:focusOnCell(slot3, slot2)
				coroutine.yield()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 92-137, warpins: 3 ---
			slot1:updateTrait(ChapterConst.TraitVirgin)
			slot1.grid:updateAttachments()
			slot1.grid:updateChampions()
			slot1:updateTrait(ChapterConst.TraitNone)
			slot1:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)
			Timer.New(slot2, 0.5, 1):Start()
			coroutine.yield()
			slot1:emit(LevelUIConst.UN_FROZEN)
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 138-140, warpins: 2 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 141-142, warpins: 1 ---
			slot3()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 143-143, warpins: 2 ---
		return
		--- END OF BLOCK #6 ---



	end)()

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-24, warpins: 2 ---
	--- END OF BLOCK #2 ---



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
						--- BLOCK #0 11-22, warpins: 1 ---
						triggerButton(slot1.helpBtn)
						PlayerPrefs.SetInt("help_displayed_on_" .. slot0.id, 1)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 23-23, warpins: 2 ---
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
				--- BLOCK #0 83-92, warpins: 1 ---
				triggerButton(slot0.helpBtn)
				PlayerPrefs.SetInt("help_displayed_on_" .. slot1.id, 1)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 93-98, warpins: 7 ---
		if slot1:getConfig("story_refresh_boss") and slot5 ~= "" and slot1:bossRefreshed() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 106-113, warpins: 1 ---
			pg.StoryMgr.GetInstance():Play(slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 114-120, warpins: 5 ---
	if slot1:getPlayType() == ChapterConst.TypeMainSub then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 121-130, warpins: 1 ---
		pg.StoryMgr:GetInstance():PlayGuide("NG003")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 131-133, warpins: 1 ---
		if slot1.id == 1160002 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 134-143, warpins: 1 ---
			pg.StoryMgr:GetInstance():PlayGuide("NG0011")
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 144-148, warpins: 1 ---
			if slot1:isTypeDefence() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 149-157, warpins: 1 ---
				pg.StoryMgr:GetInstance():PlayGuide("NG0016")
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 158-159, warpins: 4 ---
	return
	--- END OF BLOCK #2 ---



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

slot0.HandleShowMsgBox = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1.blurLevelCamera = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1)

	return
	--- END OF BLOCK #0 ---



end

return slot0
