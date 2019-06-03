slot0 = class("CommandRoomScene", import("..base.BaseUI"))
slot0.MODE_VIEW = 1
slot0.MODE_SELECT = 2
slot0.SELECT_MODE_SINGLE = 1
slot0.SELECT_MODE_MULTI = 2

function slot0.getUIName(slot0)
	return "CommandRoomUI"
end

function slot0.getBGM(slot0)
	return "backyard"
end

function slot0.setBoxes(slot0, slot1)
	slot0.boxes = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1
	slot0.commanderBagMax = slot0.playerVO.commanderBagMax

	slot0:updateCapcity()
	slot0:updateGold()
end

function slot0.setCommanders(slot0, slot1)
	slot0.commanderVOs = slot1

	slot0:updateCapcity()
end

function slot0.setReserveBoxCnt(slot0, slot1)
	slot0.reserveBoxCnt = slot1

	if slot0.updateReserveBtn then
		slot0:updateReserveBtn()
	end
end

function slot0.setPools(slot0, slot1)
	slot0.pools = slot1

	slot0:updateRes()
end

function slot0.init(slot0)
	slot0.bgTF = slot0:findTF("background"):GetComponent(typeof(Image))
	slot0.topPanel = slot0:findTF("blur_panel/top")
	slot0.mainTF = slot0:findTF("blur_panel/main")
	slot0.rightPanel = slot0:findTF("blur_panel/main/right_panel")
	slot0.leftPanel = slot0:findTF("blur_panel/main/left_panel")

	setActive(slot0.leftPanel, false)

	slot0.leftPanelCG = slot0.leftPanel:GetComponent(typeof(CanvasGroup))

	setActive(slot0:findTF("box_panel"), false)

	slot0.backBtn = slot0:findTF("blur_panel/top/back_btn")
	slot0.commanderInfo = slot0:findTF("info", slot0.leftPanel)
	slot0.commanderLevelTxt = slot0:findTF("exp/level", slot0.commanderInfo):GetComponent(typeof(Text))
	slot0.commanderExpImg = slot0:findTF("exp/Image", slot0.commanderInfo):GetComponent(typeof(Image))
	slot0.commanderNameTxt = slot0:findTF("name_bg/content/Text", slot0.commanderInfo):GetComponent(typeof(Text))
	slot0.modifyNameBtn = slot0:findTF("name_bg/content/modify", slot0.commanderInfo)

	setActive(slot0.modifyNameBtn, pg.gameset.commander_rename_open.key_value == 1)

	slot0.paintingTF = slot0:findTF("blur_panel/main/left_panel/paint")
	slot0.fleetTF = slot0:findTF("info/line/fleet", slot0.leftPanel)
	slot0.leisureTF = slot0:findTF("info/line/leisure", slot0.leftPanel)
	slot0.labelInBattleTF = slot0:findTF("info/line/inbattle", slot0.leftPanel)
	slot0.rarityImg = slot0:findTF("info/rarity", slot0.leftPanel):GetComponent(typeof(Image))
	slot0.detailBtn = slot0:findTF("info_btn", slot0.commanderInfo)
	slot0.commandersPanel = slot0:findTF("commanders", slot0.rightPanel)
	slot0.selctedPanel = slot0:findTF("commanders/bottom", slot0.rightPanel)
	slot0.selectedNumTxt = slot0:findTF("commanders/bottom/value/Text", slot0.rightPanel):GetComponent(typeof(Text))
	slot0.selectedBtn = slot0:findTF("commanders/bottom/select_btn", slot0.rightPanel)
	slot0.cancelBtn = slot0:findTF("commanders/bottom/cancel_btn", slot0.rightPanel)
	slot0.ascBtn = slot0:findTF("commanders/top/asc_btn", slot0.rightPanel)
	slot0.sortBtn = slot0:findTF("commanders/top/sort_btn", slot0.rightPanel)
	slot0.boxTF = slot0:findTF("commanders/box", slot0.rightPanel)
	slot0.boxClickTF = slot0:findTF("click", slot0.boxTF)
	slot0.capcity = slot0.boxTF:Find("capcity/Text")
	slot0.msgbox = CommaderMsgBox.New(slot0:findTF("box_msg_panel"))
	slot0.resPanel = slot0:findTF("blur_panel/top/res/bg")
	slot0.goldTxt = slot0:findTF("blur_panel/top/res/bg/gold/Text")
	slot0.mode = slot0.contextData.mode or uv0.MODE_VIEW
	slot0.sortData = slot0.contextData.sortData or CommandRoomScene.sortData or {
		asc = true,
		sortData = "id",
		nationData = {},
		rarityData = {}
	}
	slot0.onCommander = slot0.contextData.onCommander or function (slot0)
		return true
	end
	slot0.onSelected = slot0.contextData.onSelected or function (slot0, slot1)
		slot1()
	end
	slot0.onQuit = slot0.contextData.onQuit or function ()
	end

	setActive(slot0.selctedPanel, slot0.mode == uv0.MODE_SELECT)

	slot0.indexPanel = CommanderIndexPanel.New(slot0:findTF("index_panel"))

	slot0.indexPanel:attach(slot0)
	slot0.indexPanel:hide()
	eachChild(slot0.sortBtn, function (slot0)
		setActive(slot0, go(slot0).name == uv0.sortData.sortData)
	end)
	setActive(slot0.boxTF, slot0.mode == uv0.MODE_VIEW)

	slot0.isMultSelectMode = slot0.mode == uv0.MODE_SELECT and slot0.contextData.maxCount > 1

	if slot0.isMultSelectMode then
		setActive(slot0.topPanel, false)
		onButton(slot0, go(slot0.bgTF), function ()
			uv0:emit(uv1.ON_BACK)
		end, SOUND_BACK)
	end

	slot0:enterAnim(function ()
		if uv0.isMultSelectMode then
			setParent(uv0.rightPanel, pg.UIMgr.GetInstance().OverlayMain, true)

			uv0.rightPanel.localPosition = Vector3(uv0.rightPanel.localPosition.x, uv0.rightPanel.localPosition.y, 0)
			pg.UIMgr.GetInstance()._cameraBlur.enabled = true

			uv0.indexPanel:setOverlay()
		end

		uv0:tryPlayStroy()
	end)

	slot0.renamePanel = ComanderRenamePanel.New(slot0, slot0:findTF("rename_panel"))
end

function slot0.finishStroy(slot0, slot1)
	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = slot1
	})
end

function slot0.tryPlayStroy(slot0)
	seriesAsync({
		function (slot0)
			if pg.StoryMgr:GetInstance():IsPlayed("ZHIHUIMIAO2") then
				slot0()
			else
				pg.StoryMgr:GetInstance():Play("ZHIHUIMIAO2", slot0, true, true)
			end
		end,
		function (slot0)
			if not pg.GuideMgr:GetInstance():isPlayed("NG006") and table.getCount(getProxy(CommanderProxy):getData()) >= 1 then
				uv0:finishStroy("NG006")
				slot0()
			else
				pg.StoryMgr:GetInstance():PlayGuide("NG006", {}, slot0)
			end
		end,
		function (slot0)
			if not pg.GuideMgr:GetInstance():isPlayed("NG007") and getProxy(BagProxy):getItemCountById(20012) ~= 1 then
				uv0:finishStroy("NG007")
				slot0()
			else
				pg.StoryMgr:GetInstance():PlayGuide("NG007", {}, slot0)
			end
		end,
		function (slot0)
			if pg.StoryMgr:GetInstance():IsPlayed("ZHIHUIMIAO3") then
				slot0()
			else
				pg.StoryMgr:GetInstance():Play("ZHIHUIMIAO3", slot0, true, true)
			end
		end,
		function (slot0)
			if not pg.GuideMgr:GetInstance():isPlayed("NG008") and uv0.boxes[1]:getState() ~= CommanderBox.STATE_FINISHED then
				uv0:finishStroy("NG008")
				slot0()
			else
				pg.StoryMgr:GetInstance():PlayGuide("NG008", {}, slot0)
			end
		end,
		function (slot0)
			if pg.StoryMgr:GetInstance():IsPlayed("ZHIHUIMIAO4") then
				slot0()
			else
				pg.StoryMgr:GetInstance():Play("ZHIHUIMIAO4", slot0, true, true)
			end
		end,
		function (slot0)
			if not pg.GuideMgr:GetInstance():isPlayed("NG009") and table.getCount(getProxy(CommanderProxy):getData()) ~= 1 then
				uv0:finishStroy("NG009")
				slot0()
			else
				pg.StoryMgr:GetInstance():PlayGuide("NG009", {}, slot0)
			end
		end
	})
end

function slot0.updateRes(slot0)
	for slot4, slot5 in pairs(slot0.pools) do
		setText(slot0.resPanel:Find(slot5.id).Find(slot6, "Text"), slot5:getItemCount())
	end
end

function slot0.initBoxes(slot0)
	function slot0.updateBoxes(slot0)
		if slot0.boxesPanel:isShow() and slot0.boxes then
			slot0.boxesPanel:update(slot0.boxes)
		end

		if slot0.updateBoxesBtn then
			slot0:updateBoxesBtn()
		end
	end

	function slot0.openBoxPanel(slot0)
		slot0.boxesPanel:update(slot0.boxes)
		slot0.boxesPanel:show()
	end

	function slot0.hideBoxPanel(slot0)
		slot0.boxesPanel:hide()
	end

	slot0:updateCapcity()

	slot0.boxesPanel = CommanderBoxesPanel.New(slot0, slot0:findTF("box_panel"), slot0.pools)

	slot0:hideBoxPanel()

	slot0.reservePanel = CommanderReservePanel.New(slot0, slot0:findTF("buy_panel"))

	slot0.reservePanel:hide()
	onButton(slot0, slot0.boxesPanel._go, function ()
		uv0:hideBoxPanel()
	end, SFX_PANEL)

	function slot0.updateReserveBtn(slot0)
		if not IsNil(slot0:findTF("reserve_btn/Text", slot0.boxTF)) then
			setText(slot1, CommanderConst.MAX_GETBOX_CNT - slot0.reserveBoxCnt .. "/" .. CommanderConst.MAX_GETBOX_CNT)
			setActive(slot0:findTF("reserve_btn/free", slot0.boxTF), slot0.reserveBoxCnt == 0)
		end
	end

	slot0:updateReserveBtn()

	function slot0.updateBoxesBtn(slot0)
		if not IsNil(slot0:findTF("boxes_btn/Text", slot0.boxTF)) then
			setText(slot1, #_.select(slot0.boxes, function (slot0)
				return CommanderBox.STATE_WAITING < slot0:getState()
			end) .. "/" .. #slot0.boxes)
			setActive(slot0:findTF("boxes_btn/tip", slot0.boxTF), _.any(slot0.boxes, function (slot0)
				return slot0:getState() == CommanderBox.STATE_FINISHED
			end))
		end
	end

	slot0:updateBoxesBtn()

	function slot0.playReserveAnim(slot0, slot1, slot2)
		if slot0.reservePanel then
			slot0.reservePanel:playAnim(slot1, slot2)
		else
			slot2()
		end
	end

	onButton(slot0, slot0:findTF("reserve_btn", slot0.boxTF), function ()
		uv0.reservePanel:show()
		uv0.reservePanel:update(uv0.reserveBoxCnt)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("boxes_btn", slot0.boxTF), function ()
		uv0:openBoxPanel()
	end, SFX_PANEL)
end

function slot0.updateCapcity(slot0)
	if slot0.commanderBagMax and slot0.commanderVOs and slot0.capcity then
		setText(slot0.capcity, table.getCount(slot0.commanderVOs) .. "/" .. slot0.commanderBagMax)
	end
end

function slot0.updateGold(slot0)
	if slot0.goldTxt then
		setText(slot0.goldTxt, slot0.playerVO.gold)
	end
end

slot1 = 0.3

function slot0.enterAnim(slot0, slot1)
	slot0.leftPanelCG.alpha = 0

	LeanTween.value(go(slot0.leftPanel), 0, 1, uv0):setOnUpdate(System.Action_float(function (slot0)
		if uv0.leftPanelCG then
			uv0.leftPanelCG.alpha = slot0
		end
	end)):setOnComplete(System.Action(function ()
		if uv0 then
			uv0()
		end
	end))
end

function slot0.exitAnim(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	LeanTween.moveLocalX(go(slot0.rightPanel), 2110, uv0):setFrom(960):setOnComplete(System.Action(slot1))

	return
	--- END OF BLOCK #0 ---



end

function slot0.didEnter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 28-132, warpins: 2 ---
	slot0.helpBtn = slot0:findTF("help_btn")

	onButton(slot0, slot0.modifyNameBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-30, warpins: 1 ---
		if not uv0.commanderVOs[uv0.conmmanderId]:canModifyName() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-24, warpins: 1 ---
			uv0:openMsgBox({
				content = i18n("commander_rename_coldtime_tip", slot0:getRenameTimeDesc())
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-29, warpins: 1 ---
			uv0:opeRenamePanel(slot0)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_command_room.tip
		})

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	setActive(slot0.helpBtn, uv0.MODE_VIEW == slot0.mode)

	if uv0.MODE_VIEW == slot0.mode then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-36, warpins: 1 ---
		slot0:initBoxes()
		--- END OF BLOCK #0 ---



	end

	slot0.selecteds = slot0.contextData.selectedIds or {}

	onButton(slot0, slot0.ascBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-35, warpins: 1 ---
		uv0.sortData.asc = not uv0.sortData.asc

		setActive(uv0.ascBtn:Find("asc"), uv0.sortData.asc)
		setActive(uv0.ascBtn:Find("desc"), not uv0.sortData.asc)
		uv0:updateCommanders()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.sortBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		uv0.indexPanel:show(uv0.sortData)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel.cancelBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0.indexPanel:hide()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel.confirmBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-30, warpins: 1 ---
		uv0.sortData = uv0.indexPanel.data
		uv0.sortData.asc = uv0.sortData.asc

		uv0:clearAllSelected()
		uv0:updateCommanders()
		uv0.indexPanel:hide()
		eachChild(uv0.sortBtn, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 2 ---
			setActive(slot0, go(slot0).name == uv0.sortData.sortData)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel.closeBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0.indexPanel:hide()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel._tf, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0.indexPanel:hide()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.detailBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		if not uv0.conmmanderId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0:exitAnim(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			uv0:emit(CommandRoomMediator.ON_DETAIL, uv0.conmmanderId)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0:exitAnim(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			uv0:emit(uv1.ON_BACK)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, slot0.selectedBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-32, warpins: 2 ---
		if (uv0.contextData.minCount or 1) > #uv0.selecteds then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-24, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("commander_select_min_cnt", slot0))

			return
			--- END OF BLOCK #0 ---



		end

		uv0.onSelected(uv0.selecteds, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			triggerButton(uv0.backBtn)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.cancelBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		triggerButton(uv0.backBtn)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	slot0.conmmanderId = CommandRoomScene.commanderId or slot0.contextData.conmmanderId or slot0.contextData.activeCommanderId
	CommandRoomScene.commanderId = nil

	slot0:initCommandersPanel()
	triggerButton(slot0.ascBtn, true)
	slot0:updateGold()

	return
	--- END OF BLOCK #0 ---



end

function slot0.opeRenamePanel(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.renamePanel:open(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeRenamePanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.renamePanel:close()

	return
	--- END OF BLOCK #0 ---



end

function slot0.initCommandersPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot0.commanderRect = slot0.commandersPanel:Find("frame/frame"):GetComponent("LScrollRect")
	slot0.cards = {}

	function slot0.commanderRect.onInitItem(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		slot1 = CommamderCard.New(slot0)

		onButton(uv0, slot1.infoTF, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-64, warpins: 1 ---
			if not uv0.commanderVO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			if uv1.contextData.mode == uv2.MODE_SELECT then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-19, warpins: 1 ---
				uv1:checkCommander(uv0.commanderVO)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-63, warpins: 1 ---
				uv0:selectedAnim()
				setActive(uv0.mark2, true)

				if uv1.conmmanderId == uv0.commanderVO.id then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 36-36, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end

				uv1.conmmanderId = uv0.commanderVO.id
				uv1.contextData.conmmanderId = uv1.conmmanderId

				uv1:updateCommanderInfo()

				if uv1.card then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 55-60, warpins: 1 ---
					setActive(uv1.card.mark2, false)
					--- END OF BLOCK #0 ---



				end

				uv1.card = uv0
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onButton(uv0, slot1.quitTF, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			if not uv0.commanderVO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			if uv0.commanderVO.id == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				uv1.onQuit(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-7, warpins: 1 ---
					uv0:emit(uv1.ON_BACK)

					return
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		uv0.cards[slot0] = slot1

		return
		--- END OF BLOCK #0 ---



	end

	function slot0.commanderRect.onUpdateItem(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-200, warpins: 1 ---
		if not uv0.cards[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-13, warpins: 1 ---
			uv0.cards[slot1] = CommamderCard.New(slot1)
			--- END OF BLOCK #0 ---



		end

		slot2:update(uv0.disPlayCommanderVOs[slot0 + 1])
		slot2:clearSelected()

		if uv0.mode == uv1.MODE_VIEW and uv0.conmmanderId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-36, warpins: 1 ---
			if slot3 and slot3.id == uv0.conmmanderId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-61, warpins: 1 ---
				if uv0.card then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 46-51, warpins: 1 ---
					setActive(uv0.card.mark2, false)
					--- END OF BLOCK #0 ---



				end

				triggerButton(slot2.infoTF)
				uv0:updateCommanderInfo()

				uv0.card = slot2
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-67, warpins: 2 ---
			if uv0.mode == uv1.MODE_VIEW and not uv0.conmmanderId and slot0 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 74-77, warpins: 1 ---
				triggerButton(slot2.infoTF)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 78-83, warpins: 3 ---
				if uv0.mode == uv1.MODE_SELECT and uv0.conmmanderId and uv0.contextData.maxCount == 1 and slot2.commanderVO and slot2.commanderVO.id == uv0.conmmanderId then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 102-106, warpins: 1 ---
					uv0:checkCommander(slot2.commanderVO)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		if uv0.mode == uv1.MODE_SELECT and uv0.contextData.activeGroupId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 118-128, warpins: 1 ---
			setActive(slot2.expUp, slot2.commanderVO:isSameGroup(uv0.contextData.activeGroupId))
			--- END OF BLOCK #0 ---



		end

		setActive(slot2.formationTF, slot3 and slot3.inFleet and not slot3.inBattle)
		setActive(slot2.inbattleTF, slot3 and slot3.inBattle)
		setActive(slot2.mark2, slot2.commanderVO and uv0.conmmanderId == slot2.commanderVO.id)
		setActive(slot2.mark1, slot2.commanderVO and table.contains(uv0.selecteds, slot2.commanderVO.id) and not uv0.mode == uv1.MODE_SELECT or uv0.isMultSelectMode and slot2.commanderVO and table.contains(uv0.selecteds, slot2.commanderVO.id))

		return
		--- END OF BLOCK #0 ---



	end

	if slot0.mode == uv0.MODE_SELECT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-26, warpins: 1 ---
		function slot0.commanderRect.onStart()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			if uv0.isMultSelectMode then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-8, warpins: 1 ---
				uv0:updateSelecteds()
				--- END OF BLOCK #0 ---



			end

			uv0:updateSelectCntTxt()

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.checkCommander(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 10-109, warpins: 2 ---
	if table.contains(slot0.selecteds, slot1.id) and (slot0.contextData.maxCount or table.getCount(slot0.commanderVOs)) == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-23, warpins: 1 ---
		slot0:updateSelecteds()

		return
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-30, warpins: 2 ---
		if table.contains(slot0.selecteds, slot2.id) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-44, warpins: 1 ---
			table.remove(slot0.selecteds, table.indexof(slot0.selecteds, slot2.id))
			slot0:updateSelecteds()

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot4, slot5 = slot0.onCommander(slot2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-23, warpins: 1 ---
		for slot3, slot4 in ipairs(uv0.selecteds) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-18, warpins: 1 ---
			if slot4 == uv1.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-17, warpins: 1 ---
				table.remove(uv0.selecteds, slot3)

				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		uv0:updateSelecteds()

		return
		--- END OF BLOCK #0 ---



	end, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		uv0:emit(CommandRoomMediator.ON_REMARK)
		uv0:updateCommanders()
		uv0:updateSelecteds()

		return
		--- END OF BLOCK #0 ---



	end, slot0)

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-63, warpins: 1 ---
		pg.TipsMgr:GetInstance():ShowTips(slot5)

		return
		--- END OF BLOCK #0 ---



	end

	if slot3 == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 66-80, warpins: 1 ---
		slot0.conmmanderId = slot1.id
		slot0.contextData.conmmanderId = slot1.id

		slot0:updateCommanderInfo()
		table.remove(slot0.selecteds, #slot0.selecteds)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 81-84, warpins: 1 ---
		if slot3 <= #slot0.selecteds then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-97, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("commander_select_max"))

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	table.insert(slot0.selecteds, slot1.id)
	slot0:updateSelecteds()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateSelecteds(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 9-37, warpins: 2 ---
	for slot5, slot6 in pairs(slot0.cards) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-33, warpins: 1 ---
		if slot6.commanderVO then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-31, warpins: 2 ---
			setActive((slot0.contextData.maxCount or table.getCount(slot0.commanderVOs)) == 1 and slot6.mark2 or slot6.mark1, table.contains(slot0.selecteds, slot6.commanderVO.id))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0:updateSelectCntTxt()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateSelectCntTxt(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 9-16, warpins: 2 ---
	slot0.selectedNumTxt.text = #slot0.selecteds .. "/" .. (slot0.contextData.maxCount or table.getCount(slot0.commanderVOs))

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateBg(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	if slot0.bg ~= slot1:getConfig("bg") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-15, warpins: 1 ---
		slot0.bg = slot2
		slot0.bgTF.sprite = LoadSprite("bg/commander_bg_" .. slot2)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateCommanderInfo(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-106, warpins: 1 ---
	if not slot0.conmmanderId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0:updateBg(slot2)

	slot0.commanderLevelTxt.text = "LV." .. slot0.commanderVOs[slot0.conmmanderId].level

	if slot0.commanderVOs[slot0.conmmanderId]:isMaxLevel() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-25, warpins: 1 ---
		slot0.commanderExpImg.fillAmount = 1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-32, warpins: 1 ---
		slot0.commanderExpImg.fillAmount = slot2.exp / slot2:getNextLevelExp()
		--- END OF BLOCK #0 ---



	end

	slot0.commanderNameTxt.text = slot2:getName()

	setActive(slot0.leftPanel, true)

	if slot0.painting then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-51, warpins: 1 ---
		retPaintingPrefab(slot0.paintingTF, slot0.painting:getPainting())
		--- END OF BLOCK #0 ---



	end

	setPaintingPrefab(slot0.paintingTF, slot2:getPainting(), "info")

	slot0.painting = slot2

	LoadImageSpriteAsync("CommanderRarity/" .. slot3, slot0.rarityImg, true)

	if slot2.fleetId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 76-79, warpins: 1 ---
		eachChild(slot0.fleetTF, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-17, warpins: 2 ---
			setActive(slot0, go(slot0).name == tostring(uv0.fleetId))

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.fleetTF, slot2.fleetId and not slot2.inBattle)
	setActive(slot0.leisureTF, not slot2.inFleet and not slot2.inBattle)
	setActive(slot0.labelInBattleTF, slot2.inBattle)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateCommanders(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-147, warpins: 1 ---
	slot0.disPlayCommanderVOs = {}
	slot1 = slot0.sortData

	for slot7, slot8 in pairs(slot0.commanderVOs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-37, warpins: 2 ---
		if not table.contains(slot0.contextData.ignoredIds or {}, slot8.id) and function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-17, warpins: 1 ---
			if #uv0.nationData > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-15, warpins: 1 ---
				return table.contains(uv0.nationData, slot0:getConfig("nationality"))
				--- END OF BLOCK #0 ---



			end

			return true
			--- END OF BLOCK #0 ---



		end(slot8) and function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			if #uv0.rarityData > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-14, warpins: 1 ---
				return table.contains(uv0.rarityData, slot0:getRarity())
				--- END OF BLOCK #0 ---



			end

			return true
			--- END OF BLOCK #0 ---



		end(slot8) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-35, warpins: 1 ---
			table.insert(slot0.disPlayCommanderVOs, slot8)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	table.sort(slot0.disPlayCommanderVOs, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-145, warpins: 2 ---
		if (slot0.inFleet and 1 or 0) == (slot1.inFleet and 1 or 0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-34, warpins: 2 ---
			if (uv0.contextData.activeCommanderId == slot0.id and 1 or 0) == (uv0.contextData.activeCommanderId == slot1.id and 1 or 0) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-38, warpins: 1 ---
				if uv1.sortData == "id" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-65, warpins: 1 ---
					if not uv1.asc or not {
						slot0.configId < slot1.configId
					} then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 62-62, warpins: 2 ---
						slot6 = {
							slot1.configId < slot0.configId
						}
						--- END OF BLOCK #0 ---



					end

					return slot6[1]
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 66-81, warpins: 1 ---
					if slot0["get" .. uv1.sortData](slot0) == slot1["get" .. uv1.sortData](slot1) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 82-108, warpins: 1 ---
						if not uv1.asc or not {
							slot0.configId < slot1.configId
						} then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 105-105, warpins: 2 ---
							slot8 = {
								slot1.configId < slot0.configId
							}
							--- END OF BLOCK #0 ---



						end

						return slot8[1]
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 109-131, warpins: 1 ---
						if not uv1.asc or not {
							slot6 < slot7
						} then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 128-128, warpins: 2 ---
							slot8 = {
								slot7 < slot6
							}
							--- END OF BLOCK #0 ---



						end

						return slot8[1]
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 137-138, warpins: 2 ---
				return slot5 < slot4
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 144-144, warpins: 2 ---
			return slot3 < slot2
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	if slot0.contextData.activeCommanderId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-52, warpins: 1 ---
		table.insert(slot0.disPlayCommanderVOs, 1, {
			id = 0
		})
		--- END OF BLOCK #0 ---



	end

	if slot0.mode == uv0.MODE_VIEW then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-76, warpins: 2 ---
		slot5 = #slot0.disPlayCommanderVOs + (#slot0.disPlayCommanderVOs % 4 > 0 and 4 - #slot0.disPlayCommanderVOs % 4 or 0)

		if slot0.conmmanderId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 77-114, warpins: 1 ---
			slot6 = 0

			for slot10, slot11 in ipairs(slot0.disPlayCommanderVOs) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 82-89, warpins: 1 ---
				if slot11.id == slot0.conmmanderId then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 86-88, warpins: 1 ---
					slot6 = slot10

					break
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			slot0.commanderRect:SetTotalCount(math.max(12, slot5), math.floor(slot6 / 4) / (#slot0.disPlayCommanderVOs / 4) or slot0.contextData.scrollValue or 0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 128-129, warpins: 2 ---
			slot0.commanderRect:SetTotalCount(math.max(12, slot5), slot0.contextData.scrollValue or 0)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 130-134, warpins: 1 ---
		if slot0.mode == uv0.MODE_SELECT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 145-145, warpins: 2 ---
			slot0.commanderRect:SetTotalCount(#slot0.disPlayCommanderVOs, slot0.contextData.scrollValue or 0)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.clearAllSelected(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	for slot4, slot5 in pairs(slot0.cards) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		slot5:clearSelected()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-42, warpins: 1 ---
	if slot0.isShowMsgBox then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0:closeMsgBox()

		return
		--- END OF BLOCK #0 ---



	end

	if slot0.boxesPanel and go(slot0.boxesPanel.buildPoolPanel).activeSelf then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-22, warpins: 1 ---
		slot0.boxesPanel:hideBuildPoolPanel()

		return
		--- END OF BLOCK #0 ---



	end

	if slot0.boxesPanel and slot0.boxesPanel:isShow() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-36, warpins: 1 ---
		slot0.boxesPanel:hide()

		return
		--- END OF BLOCK #0 ---



	end

	slot0:emit(uv0.ON_BACK_PRESSED)

	return
	--- END OF BLOCK #0 ---



end

function slot0.openMsgBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	slot0.isShowMsgBox = true

	slot0.msgbox:openMsgBox(slot1)
	setParent(slot0.msgbox._tf, pg.UIMgr.GetInstance().OverlayMain, true)

	slot0.msgbox._tf.localPosition = Vector3(slot0.msgbox._tf.localPosition.x, slot0.msgbox._tf.localPosition.y, 0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeMsgBox(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot0.isShowMsgBox = nil

	slot0.msgbox:closeMsgBox()
	setParent(slot0.msgbox._tf, pg.UIMgr.GetInstance().UIMain, true)

	slot0.msgbox._tf.localPosition = Vector3(slot0.msgbox._tf.localPosition.x, slot0.msgbox._tf.localPosition.y, 0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-105, warpins: 1 ---
	if slot0.boxesPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0.boxesPanel:clear()
		--- END OF BLOCK #0 ---



	end

	if slot0.reservePanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-14, warpins: 1 ---
		slot0.reservePanel:clear()
		--- END OF BLOCK #0 ---



	end

	for slot4, slot5 in ipairs(slot0.cards) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-23, warpins: 1 ---
		slot5:clear()
		--- END OF BLOCK #0 ---



	end

	if slot0.painting then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-33, warpins: 1 ---
		retPaintingPrefab(slot0.paintingTF, slot0.painting:getPainting())
		--- END OF BLOCK #0 ---



	end

	if slot0.mode == uv0.MODE_SELECT and slot0.contextData.maxCount > 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-63, warpins: 1 ---
		setParent(slot0.rightPanel, slot0._tf, true)

		pg.UIMgr.GetInstance()._cameraBlur.enabled = false

		setActive(slot0.leftPanel, true)
		slot0.indexPanel:setMainLay()
		--- END OF BLOCK #0 ---



	end

	slot0.indexPanel:detach()

	if slot0.modelTf and slot0.prefabName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 74-82, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefabName, slot0.modelTf.gameObject)
		--- END OF BLOCK #0 ---



	end

	slot0.contextData.sortData = slot0.sortData
	slot0.contextData.sortData.asc = not slot0.contextData.sortData.asc
	slot0.contextData.scrollValue = math.min(slot0.commanderRect.value, 1)
	CommandRoomScene.sortData = slot0.contextData.sortData

	return
	--- END OF BLOCK #0 ---



end

return slot0
