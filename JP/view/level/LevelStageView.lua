slot0 = class("LevelStageView", import("..base.BaseSubView"))

function slot0.getUIName(slot0)
	return "LevelStageView"
end

function slot0.OnInit(slot0)
	slot0:InitUI()
	slot0:AddListener()

	if Application.isEditor then
		chapter_skip_battle = PlayerPrefs.GetInt("chapter_skip_battle") or 0

		function switch_chapter_skip_battle()
			chapter_skip_battle = 1 - chapter_skip_battle

			PlayerPrefs.SetInt("chapter_skip_battle", chapter_skip_battle)
			PlayerPrefs.Save()
			pg.TipsMgr:GetInstance():ShowTips(chapter_skip_battle == 1 and "已开启战斗跳略" or "已关闭战斗跳略")
		end
	end

	slot0.isFrozen = nil

	setActive(slot0._tf, true)
end

function slot0.OnDestroy(slot0)
	if slot0.stageTimer then
		slot0.stageTimer:Stop()

		slot0.stageTimer = nil
	end

	if slot0.resPanel1 then
		slot0.resPanel1:exit()

		slot0.resPanel1 = nil
	end
end

function slot0.InitUI(slot0)
	slot0.topStage = slot0:findTF("top_stage", slot0._tf)
	slot0.resStage = slot0:findTF("resources", slot0.topStage)
	slot0.resPanel1 = PlayerResource.New()

	slot0.resPanel1:setParent(slot0.resStage, false)
	setActive(slot0.topStage, true)

	slot0.bottomStage = slot0:findTF("bottom_stage", slot0._tf)
	slot0.funcBtn = slot0:findTF("func_button", slot0.bottomStage)
	slot0.retreatBtn = slot0:findTF("retreat_button", slot0.bottomStage)
	slot0.switchBtn = slot0:findTF("switch_button", slot0.bottomStage)
	slot0.resetBtn = slot0:findTF("reset_button", slot0.bottomStage)

	setActive(slot0.bottomStage, true)

	slot0.helpBtn = slot0:findTF("help_button", slot0.bottomStage)
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

function slot0.AddListener(slot0)
	onButton(slot0, slot0:findTF("option", slot0.topStage), function ()
		uv0:emit(BaseUI.ON_HOME)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("back_button", slot0.topStage), function ()
		if uv0.contextData.chapterVO and slot0:getDataType() == ChapterConst.TypeGuild then
			uv0:emit(uv1.ON_BACK)

			return
		end

		uv0:emit(LevelUIConst.SWITCH_TO_MAP)
	end, SFX_CANCEL)
	onButton(slot0, slot0.retreatBtn, function ()
		slot1 = "levelScene_whether_to_retreat"

		if uv0.contextData.chapterVO:existOni() then
			slot1 = "levelScene_oni_retreat"
		elseif slot0:isPlayingWithBombEnemy() then
			slot1 = "levelScene_bomb_retreat"
		elseif slot0:getPlayType() == ChapterConst.TypeTransport then
			slot1 = "levelScene_escort_retreat"
		end

		uv0:HandleShowMsgBox({
			content = i18n(slot1),
			onYes = function ()
				uv0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})
			end
		})
	end, SFX_UI_WEIGHANCHOR_WITHDRAW)
	onButton(slot0, slot0.switchBtn, function ()
		if uv0.contextData.chapterVO.getDataType(slot0) == ChapterConst.TypeSham then
			uv0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
		elseif slot1 == ChapterConst.TypeNone then
			if slot0:getNextValidIndex() > 0 then
				uv0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSwitch,
					id = slot0.fleets[slot2].id
				})
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("formation_switch_failed"))
			end
		elseif slot1 == ChapterConst.TypeGuild then
			uv0:emit(LevelMediator2.ON_OPEN_GUILD_PRE_COMABT)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.resetBtn, function ()
		if uv0.contextData.chapterVO:getDataType() == ChapterConst.TypeSham then
			if ChapterConst.ShamResetCountLimit <= uv0.contextData.chapterVO.shamResetCount then
				pg.TipsMgr.GetInstance():ShowTips(i18n("sham_reset_err_limit"))

				return
			end

			if uv0.contextData.chapterVO.active then
				uv0:HandleShowMsgBox({
					modal = true,
					content = i18n("sham_reset_confirm"),
					onYes = function ()
						uv0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpRetreat
						})
					end
				})
			else
				uv0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpRetreat
				})
			end
		elseif slot0 == ChapterConst.TypeGuild and uv0.contextData.chapterVO.active then
			uv0:HandleShowMsgBox({
				modal = true,
				content = i18n("sham_reset_confirm"),
				onYes = function ()
					uv0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpRetreat
					})
				end
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.shamShopBtn, function ()
		uv0:emit(LevelUIConst.IS_Frozen)

		if uv0.isFrozen then
			return
		end

		uv0:emit(LevelMediator2.ON_OPEN_SHAM_SHOP)
	end, SFX_PANEL)
	onButton(slot0, slot0.funcBtn, function ()
		slot1 = uv0.contextData.chapterVO.getDataType(slot0)

		if not uv0.contextData.chapterVO:inWartime() then
			pg.TipsMgr:GetInstance():ShowTips(i18n("levelScene_time_out"))

			return
		end

		slot4 = slot0:getChapterCell(slot0.fleet.line.row, slot0.fleet.line.column)
		slot5 = false

		if slot0:existChampion(slot0.fleet.line.row, slot0.fleet.line.column) then
			slot5 = true

			if chapter_skip_battle == 1 then
				uv0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSkipBattle,
					id = slot2.id
				})
			else
				uv0:emit(LevelMediator2.ON_STAGE)
			end
		elseif slot4.attachment == ChapterConst.AttachAmbush and slot4.flag == 2 then
			slot6 = nil

			coroutine.wrap(function ()
				uv0:emit(LevelUIConst.DO_AMBUSH_WARNING, uv1)
				coroutine.yield()
				uv0:emit(LevelUIConst.DISPLAY_AMBUSH_INFO, uv1)
				coroutine.yield()
			end)()

			slot5 = true
		elseif Application.isEditor and (slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachRival or slot4.attachment == ChapterConst.AttachBoss) and chapter_skip_battle == 1 then
			if slot4.flag == 0 then
				slot5 = true

				uv0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpSkipBattle,
					id = slot2.id
				})
			end
		elseif slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachBoss then
			if slot4.flag == 0 then
				slot5 = true

				uv0:emit(LevelMediator2.ON_STAGE)
			end
		elseif slot4.attachment == ChapterConst.AttachBox then
			if slot4.flag == 0 then
				slot5 = true

				uv0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpBox,
					id = slot2.id
				})
			end
		elseif slot4.attachment == ChapterConst.AttachSupply and slot4.attachmentId > 0 then
			slot5 = true
			slot6, slot7 = slot0:getFleetAmmo(slot0.fleet)

			if slot7 < slot6 then
				uv0:emit(LevelMediator2.ON_OP, {
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
			end)
			pg.StoryMgr:GetInstance():Play(slot6[slot7], function ()
				slot1 = pg.StoryMgr:GetInstance():getSelectedOptions() and (slot0[1] or 1) or 1

				if uv0.flag == 0 then
					uv1:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpStory,
						id = uv2.id,
						arg1 = slot1
					})
				end

				if uv3 ~= "" then
					slot2 = nil

					for slot6, slot7 in pairs(pg.memory_template) do
						if slot7.story == uv4 then
							slot2 = slot7.title
						end
					end

					pg.TipsMgr:GetInstance():ShowTips(i18n(uv3, slot2))
				end
			end)
		elseif slot4.attachment == ChapterConst.AttachRival then
			if slot4.flag == 0 then
				slot5 = true

				if slot2:isValid() then
					uv0:emit(LevelMediator2.ON_PVP, slot4.rival)
				else
					uv0:HandleShowMsgBox({
						modal = true,
						content = i18n("formation_reform_tip"),
						onYes = function ()
							uv0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)
						end
					})
				end
			end
		elseif slot4.attachment == ChapterConst.AttachAreaBoss and slot4.flag == 0 then
			slot5 = true

			uv0:emit(LevelMediator2.ON_OPEN_GUILD_PRE_COMABT)
		end

		if not slot5 then
			if slot0:getRound() == ChapterConst.RoundEnemy then
				uv0:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpEnemyRound
				})
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("level_click_to_move"))
			end
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		if uv0.contextData.chapterVO then
			if slot0:getDataType() == ChapterConst.TypeSham then
				uv0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("sham_battle_help_tip")
				})
			elseif slot1 == ChapterConst.TypeGuild then
				uv0:HandleShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("guild_battle_help_tip")
				})
			elseif slot1 == ChapterConst.TypeNone then
				if slot0:existOni() then
					uv0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = i18n("levelScene_sphunt_help_tip")
					})
				elseif slot0:isPlayingWithBombEnemy() then
					uv0:HandleShowMsgBox({
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

					uv0:HandleShowMsgBox({
						type = MSGBOX_TYPE_HELP,
						helps = slot2
					})
				else
					uv0:HandleShowMsgBox({
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
end

function slot0.SetSeriesOperation(slot0, slot1)
	slot0.seriesOperation = slot1
end

function slot0.SetGrid(slot0, slot1)
	slot0.grid = slot1
end

function slot0.SetPlayer(slot0, slot1)
	slot0.resPanel1:setResources(slot1)
end

function slot0.SwitchToChapter(slot0, slot1)
	slot2 = slot1:getDataType()
	slot5 = findTF(slot0.rightStage, "target")
	slot6 = findTF(slot0.rightStage, "skip_events")

	setActive(slot3, slot1:existAmbush())
	setActive(slot0.airSupremacy, OPEN_AIR_DOMINANCE and slot1:getConfig("air_dominance") > 0)
	setActive(findTF(slot0.topStage, "msg_panel/sham_progress"), slot2 == ChapterConst.TypeSham)
	setActive(findTF(slot0.rightStage, "btn_sham_shop"), slot2 == ChapterConst.TypeSham)

	if slot2 == ChapterConst.TypeSham then
		setActive(slot7, getProxy(ChapterProxy):getShamShop() ~= nil)
	end

	setActive(slot0.resetBtn, slot2 == ChapterConst.TypeSham or slot2 == ChapterConst.TypeGuild)
	setImageColor(slot0.resetBtn, slot2 == ChapterConst.TypeSham and ChapterConst.ShamResetCountLimit <= slot1.shamResetCount and Color(1, 1, 10, 0.5882352941176471) or Color(1, 1, 1, 1))

	slot0.achieveOriginalY = -240

	setText(slot6:Find("Label"), i18n("map_event_skip"))

	if slot1:getConfig("event_skip") == 1 then
		if slot1.progress > 0 or slot1.defeatCount > 0 or slot1.passCount > 0 then
			setActive(slot6, true)

			slot5.anchoredPosition = Vector2.New(slot5.anchoredPosition.x, slot0.achieveOriginalY - 40)
			GetComponent(slot6, typeof(Toggle)).isOn = PlayerPrefs.GetInt("skip_events_on_" .. slot1.id, 1) == 1

			onToggle(slot0, slot6, function (slot0)
				PlayerPrefs.SetInt(uv0, slot0 and 1 or 0)
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

function slot0.SwitchToMap(slot0)
	shiftPanel(slot0.topStage, 0, slot0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
end

function slot0.updateStageInfo(slot0)
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
			setWidgetText(uv1, pg.TimeMgr:GetInstance():DescCDTime(uv0:getRemainTime()))
		end, 1, -1)

		slot0.stageTimer:Start()
		slot0.stageTimer.func()
	end
end

function slot0.updateAmbushRate(slot0, slot1, slot2)
	if not slot0.contextData.chapterVO:existAmbush() then
		return
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
end

function slot0.updateStageAchieve(slot0)
	if not slot0.contextData.chapterVO:existAchieve() then
		return
	end

	slot3 = findTF(slot0.rightStage, "target")

	setActive(slot3, true)

	slot4 = findTF(slot3, "detail")
	slot7 = findTF(slot4, "click")

	setActive(slot5, false)
	setActive(slot9, false)
	removeAllChildren(slot6)
	removeAllChildren(slot10)

	for slot14, slot15 in ipairs(slot2) do
		setActive(findTF(slot16, "star"), slot17)
		setText(slot18, ChapterConst.GetAchieveDesc(slot15.type, slot1))

		slot19 = setTextColor
		slot20 = findTF(slot16, "desc")

		if not ChapterConst.IsAchieved(slot15) or not Color.yellow then
			slot21 = Color.white
		end

		slot19(slot20, slot21)

		cloneTplTo(slot9, slot10):GetComponent(typeof(Image)).enabled = slot17
	end

	onButton(slot0, slot7, function ()
		shiftPanel(uv0, uv0.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(uv1, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)
	onButton(slot0, slot8, function ()
		shiftPanel(uv0, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(uv1, uv1.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	end, SFX_PANEL)

	if not slot0.isAchieveFirstInit then
		slot0.isAchieveFirstInit = true

		triggerButton(slot7)
	end
end

function slot0.updateStageBarrier(slot0)
	setActive(slot0.panelBarrier, slot0.contextData.chapterVO:existOni())

	if slot0.contextData.chapterVO:existOni() then
		slot2 = slot0.panelBarrier:Find("btn_barrier")

		setText(slot2:Find("nums"), slot1.modelCount)
		onButton(slot0, slot2, function ()
			uv0:emit(LevelUIConst.IS_Frozen)

			if uv0.isFrozen then
				return
			end

			if uv0.grid.quadState == ChapterConst.QuadStateStrategy then
				uv0.grid:updateQuadCells(ChapterConst.QuadStateNormal)

				return
			end

			slot0 = uv0.contextData.chapterVO

			uv0:selectSquareBarrieredCell(1, function (slot0, slot1)
				if not uv0:existBarrier(slot0, slot1) and uv0.modelCount <= 0 then
					return
				end

				uv1:emit(LevelMediator2.ON_OP, {
					type = ChapterConst.OpBarrier,
					id = uv0.fleet.id,
					arg1 = slot0,
					arg2 = slot1
				})
			end)
		end, SFX_PANEL)
	end
end

function slot0.updateBombPanel(slot0, slot1)
	setActive(slot0.bombPanel, slot0.contextData.chapterVO:isPlayingWithBombEnemy())

	if slot0.contextData.chapterVO:isPlayingWithBombEnemy() then
		setText(slot0.bombPanel:Find("tx_step"), slot2:getBombChapterInfo().action_times - math.floor(slot2.roundIndex / 2))

		slot4 = tonumber(getText(slot3))
		slot5 = slot2.modelCount

		LeanTween.cancel(go(slot0.bombPanel:Find("tx_score")))

		if slot1 and slot4 ~= slot5 then
			LeanTween.scale(go(slot3), Vector3(1.5, 1.5, 1), 0.2)
			LeanTween.value(go(slot3), slot4, slot5, (slot5 - slot4) * 0.1):setOnUpdate(System.Action_float(function (slot0)
				setText(uv0, math.floor(slot0))
			end)):setOnComplete(System.Action(function ()
				setText(uv0, uv1)
			end)):setEase(LeanTweenType.easeInOutSine):setDelay(0.2)
			LeanTween.scale(go(slot3), Vector3.one, 0.3):setDelay(1 + (slot5 - slot4) * 0.1)
		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 112-118, warpins: 2 ---
			slot3.localScale = Vector3.one

			setText(slot3, slot5)
			--- END OF BLOCK #0 ---



		end
	end
end

function slot0.updateFleetBuff(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-47, warpins: 1 ---
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
			if slot1 + 1 <= #uv0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-43, warpins: 1 ---
				GetImageSpriteFromAtlasAsync("strategyicon/" .. pg.strategy_data_template[uv0[slot1 + 1]].icon, "", slot2)
				onButton(uv1, slot2, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-17, warpins: 1 ---
					uv0:HandleShowMsgBox({
						yesText = "text_confirm",
						hideNo = true,
						content = "",
						type = MSGBOX_TYPE_SINGLE_ITEM,
						drop = {
							type = DROP_TYPE_STRATEGY,
							id = uv1.id,
							cfg = uv1
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
			GetImageSpriteFromAtlasAsync("commanderskillicon/" .. uv2[slot1 + 1 - #uv0].getConfig(slot3, "icon"), "", slot2)
			setText(findTF(slot2, "Text"), "Lv." .. uv2[slot1 + 1 - #uv0].getConfig(slot3, "lv"))
			setActive(findTF(slot2, "Text"), true)
			setActive(findTF(slot2, "frame"), true)
			onButton(uv1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				uv0:emit(LevelMediator2.ON_COMMANDER_SKILL, uv1)

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

	if OPEN_AIR_DOMINANCE and slot1:getConfig("air_dominance") > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-57, warpins: 1 ---
		slot0:updateAirDominance()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 58-62, warpins: 3 ---
	slot0:updateChapterBuff()

	return
	--- END OF BLOCK #1 ---



end

function slot0.updateChapterBuff(slot0)

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
			if not uv0:hasMitigation() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-7, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 8-34, warpins: 2 ---
			uv1:HandleShowMsgBox({
				hideNo = true,
				type = MSGBOX_TYPE_DROP_ITEM,
				name = uv0:getChapterState(),
				sprite = uv2,
				content = i18n("level_risk_level_mitigation_rate", uv0:getRemainPassCount(), uv0:getMitigationRate())
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

function slot0.updateAirDominance(slot0)

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

function slot0.updateAirDominanceTitle(slot0, slot1, slot2, slot3)

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
			setTextAlpha(uv0, slot0)

			return
			--- END OF BLOCK #0 ---



		end)):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-33, warpins: 1 ---
			setText(uv0, ChapterConst.AirDominance[uv1].name)
			setTextColor(uv0, ChapterConst.AirDominance[uv1].color)
			LeanTween.value(go(uv0), 0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				setTextAlpha(uv0, slot0)

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

function slot0.updateShamProgress(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	setText(findTF(slot0.topStage, "msg_panel/sham_progress/value"), slot0.contextData.chapterVO.progress .. " / " .. ChapterConst.ShamEnemyLimit)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateStageStrategy(slot0)

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
			table.insert(uv0, slot0.id)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			table.insert(uv1, slot0)
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

			if uv0[slot1 + 1].id == ChapterConst.StrategyHuntingRange then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-20, warpins: 1 ---
				slot4 = 1

				if uv1.contextData.huntingRangeVisibility % 2 == 1 then

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

					if uv2.subAutoAttack == 0 then

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
			onButton(uv1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				if uv0.grid.quadState == ChapterConst.QuadStateStrategy and uv0.grid.quadClickProxy then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-17, warpins: 1 ---
					uv0.grid.quadClickProxy()

					return
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 18-23, warpins: 2 ---
				if uv1.id == ChapterConst.StrategyHuntingRange then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-35, warpins: 1 ---
					uv0.grid:toggleHuntingRange()
					uv2.callback(uv3, uv4, uv5)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 36-41, warpins: 1 ---
					if uv1.id == ChapterConst.StrategySubAutoAttack then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 42-71, warpins: 1 ---
						pg.TipsMgr.GetInstance():ShowTips(i18n("ai_change_" .. 1 - uv6.subAutoAttack + 1))
						uv0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpSubState,
							arg1 = 1 - uv6.subAutoAttack
						})
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 72-77, warpins: 1 ---
						if uv1.id == ChapterConst.StrategyExchange then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 78-86, warpins: 1 ---
							if uv6:getNextValidIndex(uv6.findex) > 0 and uv1.count > 0 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 92-102, warpins: 1 ---
								uv0:HandleShowMsgBox({
									content = i18n("levelScene_who_to_exchange"),
									onYes = function ()

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-23, warpins: 1 ---
										uv0:emit(LevelMediator2.ON_OP, {
											type = ChapterConst.OpStrategy,
											id = uv1.id,
											arg1 = ChapterConst.StrategyExchange,
											arg2 = uv2.fleets[uv3].id
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
						if uv8 == ChapterConst.StgTypeForm then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 109-139, warpins: 1 ---
							uv0:emit(LevelMediator2.ON_OP, {
								type = ChapterConst.OpStrategy,
								id = uv7:getNextStgUser(uv1.id),
								arg1 = uv9[table.indexof(uv9, uv1.id) % #uv9 + 1]
							})
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 140-146, warpins: 1 ---
							uv0:emit(LevelUIConst.DISPLAY_STRATEGY_INFO, uv1)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 147-147, warpins: 5 ---
				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 148-148, warpins: 2 ---
				--- END OF BLOCK #3 ---



			end, SFX_PANEL)

			if slot4 == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-85, warpins: 1 ---
				setText(slot2:Find("nums"), "")
				setActive(slot2:Find("mask"), false)

				slot6 = setActive
				slot7 = slot2:Find("selected")

				if uv6 ~= slot3.id then

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
		shiftPanel(uv0, uv0.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(uv1, 0, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot8, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		shiftPanel(uv0, 30, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
		shiftPanel(uv1, uv1.rect.width + 200, nil, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #1 ---



end

function slot0.updateStageFleet(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-57, warpins: 1 ---
	slot2 = findTF(slot0.leftStage, "fleet")

	setActive(slot3, false)
	setText(slot4, slot0.contextData.chapterVO.fleet.id)

	local function slot5(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		slot2 = UIItemList.New(slot0, uv0)

		slot2:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-20, warpins: 1 ---
				updateShip(slot2, slot3)

				slot4 = uv0[slot1 + 1].hpRant
				slot5 = uv0[slot1 + 1].getShipProperties(slot3)
				slot6 = math.floor

				if not uv0[slot1 + 1].hpChange then

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
						uv0.localPosition = Vector3(0, 0, 0)

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
							LeanTween.moveX(uv0, slot0, 0.05):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(4)
							LeanTween.alpha(findTF(uv0, "red"), 0.5, 0.4)
							LeanTween.alpha(findTF(uv0, "red"), 0, 0.4):setDelay(0.4)
							uv1(findTF(uv2, "normal"), uv3)

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
				onButton(uv1, slot2, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-3, warpins: 1 ---
					if uv0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 4-10, warpins: 1 ---
						uv1:emit(LevelUIConst.DISPLAY_REPAIR_WINDOW, uv2)
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

function slot0.shiftStagePanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-45, warpins: 1 ---
	shiftPanel(slot0.bottomStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.topStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, 0, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	return
	--- END OF BLOCK #0 ---



end

function slot0.clickGridCell(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot3 = slot0.contextData.chapterVO.getDataType(slot2)
	slot5 = slot0.contextData.chapterVO.getChapterCell(slot2, slot0.contextData.chapterVO.fleet.line.row, slot0.contextData.chapterVO.fleet.line.column)

	if _.detect(slot0.contextData.chapterVO.fleets, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0:getFleetType() ~= FleetType.Normal or slot0.line.row ~= uv0.row or slot0.line.column ~= uv0.column then

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
						--- BLOCK #0 113-126, warpins: 1 ---
						pg.TipsMgr:GetInstance():ShowTips(i18n("map_event_stop_tip"))

						return
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 127-135, warpins: 3 ---
						if not slot2:considerAsStayPoint(ChapterConst.SubjectPlayer, slot1.row, slot1.column) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 136-138, warpins: 1 ---
							return
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 139-143, warpins: 1 ---
							if slot2:existMoveLimit() and not _.any(slot2:calcWalkableCells(ChapterConst.SubjectPlayer, slot4.line.row, slot4.line.column, slot4:getSpeed()), function (slot0)

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-5, warpins: 1 ---
								if slot0.row ~= uv0.row or slot0.column ~= uv0.column then

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
								--- BLOCK #0 163-174, warpins: 1 ---
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
					--- BLOCK #1 175-189, warpins: 5 ---
					if slot2:findPath(ChapterConst.SubjectPlayer, slot4.line, {
						row = slot1.row,
						column = slot1.column
					}) < PathFinding.PrioObstacle then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 190-205, warpins: 1 ---
						slot0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpMove,
							id = slot4.id,
							arg1 = slot1.row,
							arg2 = slot1.column
						})
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 206-209, warpins: 1 ---
						if slot9 < PathFinding.PrioForbidden then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 210-221, warpins: 1 ---
							pg.TipsMgr:GetInstance():ShowTips(i18n("destination_can_not_reach"))
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 222-232, warpins: 1 ---
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
	--- BLOCK #2 233-234, warpins: 7 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.doSafeCheck(slot0)

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
			uv0:emit(LevelMediator2.ON_OP, {
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
					uv0:emit(LevelMediator2.ON_OP, {
						type = ChapterConst.OpRetreat
					})

					return
					--- END OF BLOCK #0 ---



				end,
				onNo = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					uv0:switchToMap()

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
					uv0:switchToMap()

					return
					--- END OF BLOCK #0 ---



				end,
				onNo = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					uv0:switchToMap()

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
						uv0:emit(LevelMediator2.ON_OPEN_SHAM_PRE_COMABT)

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
						uv0:emit(LevelMediator2.ON_OP, {
							type = ChapterConst.OpSwitch,
							id = uv1.id
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
						uv0:emit(LevelMediator2.ON_OP, {
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

function slot0.tryAutoTrigger(slot0)

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

function slot0.tryAutoAction(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot1 = slot0.contextData.chapterVO
	slot2 = nil

	coroutine.wrap(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot0 = false
		slot1 = false

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-16, warpins: 0 ---
		for slot5, slot6 in pairs(uv0.cells) do

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
		for slot5, slot6 in ipairs(uv0.champions) do

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
		slot2 = uv0:isPlayingWithBombEnemy()

		if uv0:findChapterCell(ChapterConst.AttachBoss) and slot3.flag == 1 or uv0:existOni() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-66, warpins: 2 ---
			if uv0:getDefeatStory(uv0.defeatCount) and type(slot5) == "number" and not pg.StoryMgr.GetInstance():IsPlayed(slot5) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 82-97, warpins: 1 ---
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = slot5
				})
				uv1:emit(LevelMediator2.ON_PERFORM_COMBAT, slot5)
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
			--- BLOCK #0 115-122, warpins: 1 ---
			uv1:emit(LevelUIConst.FROZEN)

			if slot1 or slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 125-127, warpins: 2 ---
				slot4 = nil

				if slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 128-128, warpins: 1 ---
					slot4 = "SpUnit"
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 129-130, warpins: 2 ---
				if slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 131-131, warpins: 1 ---
					slot4 = "SpBomb"
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 132-133, warpins: 2 ---
				if slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 134-142, warpins: 1 ---
					uv1:doPlayAnim(slot4, function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-7, warpins: 1 ---
						setActive(slot0, false)
						uv0()

						return
						--- END OF BLOCK #0 ---



					end)
					coroutine.yield()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 143-148, warpins: 2 ---
				if uv0:getSpAppearStory() and #slot5 > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 153-165, warpins: 1 ---
					pg.StoryMgr.GetInstance():Play(slot5, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-6, warpins: 1 ---
						if uv0:getSpAppearGuide() and #slot0 > 0 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 11-24, warpins: 1 ---
							pg.GuideMgr:GetInstance():play(slot0, nil, onNextTick(uv1))
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 25-27, warpins: 2 ---
							onNextTick(uv1)
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
				--- BLOCK #0 166-175, warpins: 1 ---
				uv1:emit(LevelUIConst.DO_TRACKING, uv2)
				coroutine.yield()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 176-180, warpins: 4 ---
			if not uv1.contextData.chapterVO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 181-182, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 183-194, warpins: 2 ---
			uv1:tryPlayChapterStory()

			if uv0:findChapterCell(ChapterConst.AttachBoss) and slot4.trait == ChapterConst.TraitLurk then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 200-209, warpins: 1 ---
				uv1.grid:focusOnCell(slot4, uv2)
				coroutine.yield()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 210-255, warpins: 3 ---
			uv1:updateTrait(ChapterConst.TraitVirgin)
			uv1.grid:updateAttachments()
			uv1.grid:updateChampions()
			uv1:updateTrait(ChapterConst.TraitNone)
			uv1:emit(LevelMediator2.ON_OVERRIDE_CHAPTER)
			Timer.New(uv2, 0.5, 1):Start()
			coroutine.yield()
			uv1:emit(LevelUIConst.UN_FROZEN)
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 256-261, warpins: 2 ---
		if not uv1:doSafeCheck() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 262-268, warpins: 1 ---
			uv1.grid:updateQuadCells(ChapterConst.QuadStateNormal)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 269-269, warpins: 2 ---
		return
		--- END OF BLOCK #7 ---



	end)()

	return
	--- END OF BLOCK #0 ---



end

function slot0.tryPlayChapterStory(slot0)

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
					if PlayerPrefs.GetInt("help_displayed_on_" .. uv0.id, 0) == 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 11-24, warpins: 1 ---
						triggerButton(GameObject.Find("OverlayCamera/Overlay/UIMain/top/bottom_stage/help_button"))
						PlayerPrefs.SetInt("help_displayed_on_" .. uv0.id, 1)
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
			--- BLOCK #0 137-145, warpins: 1 ---
			pg.StoryMgr:GetInstance():PlayGuide("NG0011")
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 146-147, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.updateTrait(slot0, slot1)

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

function slot0.ShiftPanelToChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-57, warpins: 1 ---
	shiftPanel(slot0.topStage, 0, slot0.topStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.bottomStage, 0, -slot0.bottomStage.rect.height, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.leftStage, -slot0.leftStage.rect.width - 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)
	shiftPanel(slot0.rightStage, slot0.rightStage.rect.width + 200, 0, 0.3, 0, true, nil, LeanTweenType.easeOutSine)

	return
	--- END OF BLOCK #0 ---



end

function slot0.popStageStrategy(slot0)

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

function slot0.HandleShowMsgBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1.blurLevelCamera = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox(slot1)

	return
	--- END OF BLOCK #0 ---



end

return slot0
