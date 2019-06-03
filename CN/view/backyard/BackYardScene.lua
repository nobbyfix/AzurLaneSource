slot0 = class("BackYardScene", import("..base.BaseUI"))
slot0.comfortableBG = {
	"resources/express_1",
	"resources/express_2",
	"resources/express_3",
	"resources/express_4"
}

function slot0.getUIName(slot0)
	return "BackYardUI"
end

function slot0.getBGM(slot0)
	return "backyard"
end

function slot0.setBlackyardView(slot0, slot1)
	slot0.view = slot1
end

function slot0.setShipIds(slot0, slot1, slot2)
	slot0.trainShipCount = table.getCount(slot1)
	slot0.restShipCount = table.getCount(slot2)
end

function slot0.setDormVO(slot0, slot1)
	slot0.dormVO = slot1

	slot0:updateDrom(slot1)
	slot0:updateFloorBtn()
end

function slot0.setPlayerVO(slot0, slot1)
	slot0.playerVO = slot1

	slot0:updateRes()
end

function slot0.isFirstFloor(slot0)
	return slot0.contextData.floor == 1
end

function slot0.init(slot0)
	slot0.mainPanel = slot0:findTF("main")
	slot0.clickTF = slot0:findTF("click")
	slot0.topPanel = slot0:findTF("main/topPanel")
	slot0.rightPanel = slot0:findTF("main/rightPanel")
	slot0.leftPanel = slot0:findTF("main/leftPanel")
	slot0.bottomPanel = slot0:findTF("main/bottomPanel")
	slot0.comforBtn = slot0:findTF("comfortable", slot0.topPanel)
	slot0.comfortable = slot0:findTF("comfortable/Text", slot0.topPanel)
	slot0.playerName = slot0:findTF("name_container/frame/name", slot0.topPanel)
	slot0.comforExpress = slot0:findTF("comfortable/express", slot0.topPanel)
	slot0.comforTableChat = slot0:findTF("comfortable/chat", slot0.topPanel)
	slot0.floorText = slot0:findTF("floor_label/Text", slot0.rightPanel):GetComponent(typeof(Text))
	slot0.floorBtn = slot0:findTF("floor_btn", slot0.rightPanel)
	slot0.stock = slot0:findTF("stock_bg", slot0.bottomPanel)
	slot0.stockBar = slot0:findTF("stock_bar/bar", slot0.stock):GetComponent(typeof(Image))
	slot0.leftTimeTF = slot0:findTF("leftTime", slot0.stock)
	slot0.trainBtn = slot0:findTF("train_btn", slot0.leftPanel)
	slot0.curTrainCount = slot0:findTF("Text", slot0.trainBtn):GetComponent(typeof(Text))
	slot0.restBtn = slot0:findTF("rest_btn", slot0.leftPanel)
	slot0.curRestCount = slot0:findTF("Text", slot0.restBtn):GetComponent(typeof(Text))
	slot0.buffContain = slot0:findTF("buffListPanel/buffs", slot0.rightPanel)
	slot0.buffTpl = slot0:getTpl("bufftpl", slot0.buffContain)
	slot0.buffTip = slot0:findTF("main/rightPanel/buffListPanel/tip")
	slot0.UIMain = pg.UIMgr:GetInstance().OverlayMain
	slot0.shopBtn = slot0:findTF("shop_btn", slot0.bottomPanel)
	slot0.shareBtn = slot0:findTF("share_btn", slot0.bottomPanel)
	slot0.renameBox = slot0:findTF("rename_box")
	slot0.renameBtn = slot0:findTF("frame/ok_btn", slot0.renameBox)
	slot0.renameCancelBtn = slot0:findTF("frame/cancel_btn", slot0.renameBox)
	slot0.nameInput = slot0:findTF("frame/bound/input", slot0.renameBox)
	slot0.nofoodBox = slot0:findTF("nofood_help")
	slot0.nofoodBtn = slot0:findTF("frame/ok_btn", slot0.nofoodBox)
	slot0.nofoodCancelBtn = slot0:findTF("frame/cancel_btn", slot0.nofoodBox)

	setButtonText(slot0.nofoodBtn, i18n("text_nofood_yes"))
	setButtonText(slot0.nofoodCancelBtn, i18n("text_nofood_no"))

	slot0.msgBox = slot0:findTF("msg_box")
	slot0.msgFloorPanel = slot0:findTF("floor_panel", slot0.msgBox)
	slot0.floorContainer = slot0:findTF("frame/container", slot0.msgFloorPanel)
	slot0.floorTF = slot0:findTF("frame/itemtpl", slot0.msgFloorPanel)
	slot0.loading = slot0:findTF("loading")
	slot0.loadingHelp = slot0:findTF("loading/help")
	slot0.loadingHelpTx = slot0:findTF("loading/loading/tipsText")
	slot0.loadingProgress = slot0:findTF("loading/loading/loading_bar/progress")
	slot0.loadingProgressTx = slot0:findTF("loading/loading/loading_label/percent")
	slot0.helpBtn = slot0:findTF("help_btn", slot0.leftPanel)

	setActive(slot0.helpBtn, false)

	slot0.stampBtn = slot0:findTF("stamp", slot0.bottomPanel)

	if LOCK_CLICK_MINGSHI then
		setActive(slot0:findTF("stamp", slot0.bottomPanel), false)
	end

	slot0.eyeBtn = slot0:findTF("main/eye_btn")
	slot0.isVisitMode = slot0.contextData.mode == BackYardConst.MODE_VISIT
	slot0.leaveCount = 0
end

function slot0.updateFloorBtn(slot0)
	if not IsNil(slot0.floorBtn) then
		setActive(slot0.floorBtn:Find("mask"), slot0.dormVO.level ~= Dorm.MAX_LEVEL)
	end
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0:findTF("return", slot0.topPanel), function ()
		if uv0.view and uv0.view.inInitFurnitrues then
			return
		end

		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)
	onToggle(slot0, slot0.eyeBtn, function (slot0)
		uv0:switch2View(slot0)
	end, SFX_PANEL)
	slot0:setMode()
	slot0:displayBuff()
end

slot1 = 0.5

function slot0.switch2View(slot0, slot1)
	if not slot0.moveY or not slot0.moveX then
		slot0.moveY = {
			{
				slot0.topPanel,
				1
			},
			{
				slot0.bottomPanel,
				-1
			},
			{
				slot0:findTF("backyardmainui/back"),
				1
			},
			{
				slot0:findTF("backyardmainui/decorateBtn"),
				-1
			}
		}
		slot0.moveX = {
			{
				slot0.rightPanel,
				1
			},
			{
				slot0.leftPanel,
				-1
			}
		}
	elseif _.any(slot0.moveY, function (slot0)
		return LeanTween.isTweening(go(slot0[1]))
	end) or _.any(slot0.moveX, function (slot0)
		return LeanTween.isTweening(go(slot0[1]))
	end) or not slot0.isLoadedMainUI then
		return
	end

	function slot2(slot0, slot1, slot2)
		LeanTween[slot0](slot1, slot2, uv0):setOnComplete(System.Action(function ()
			if uv0 then
				setActive(uv1, false)
			end
		end)):setOnStart(System.Action(function ()
			if not uv0 then
				setActive(uv1, true)
			end
		end))
	end

	_.each(slot0.moveX, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		slot1 = 0

		if uv0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-13, warpins: 1 ---
			slot1 = slot0[1].anchoredPosition3D.x + slot0[1].rect.width * slot0[2]
			--- END OF BLOCK #0 ---



		end

		uv1("moveX", slot0[1], slot1)

		return
		--- END OF BLOCK #0 ---



	end)
	_.each(slot0.moveY, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		slot1 = 0

		if uv0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-13, warpins: 1 ---
			slot1 = slot0[1].anchoredPosition3D.y + slot0[1].rect.height * slot0[2]
			--- END OF BLOCK #0 ---



		end

		uv1("moveY", slot0[1], slot1)

		return
		--- END OF BLOCK #0 ---



	end)
end

function slot0.setMode(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-169, warpins: 1 ---
	setActive(slot0.shopBtn, not slot0.isVisitMode)
	setActive(slot0.shareBtn, not slot0.isVisitMode)
	setActive(slot0.helpBtn, false)
	setActive(slot0.floorBtn, true)
	setActive(slot0.stampBtn, not slot0.isVisitMode)
	setActive(slot0:findTF("name_container/Image", slot0.topPanel), not slot0.isVisitMode)
	setActive(slot0:findTF("name_container/Image", slot0.topPanel), not isVisitMode)
	setActive(slot0.floorBtn, not slot0.isVisitMode)
	setActive(slot0.eyeBtn, not slot0.isVisitMode)
	setActive(slot0.clickTF, not slot0.isVisitMode)

	if LOCK_SEC_FLOOR then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 60-63, warpins: 1 ---
		setActive(slot0.floorBtn, false)
		--- END OF BLOCK #0 ---



	end

	if not slot0.isVisitMode then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 67-167, warpins: 1 ---
		onButton(slot0, slot0.helpBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = pg.gametip.help_backyard.tip
			})

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		slot0:updateFloorBtn()
		onButton(slot0, slot0.floorBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-24, warpins: 1 ---
			if uv0.dormVO.level ~= Dorm.MAX_LEVEL then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-19, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("sec_floor_limit_tip"))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-23, warpins: 1 ---
				uv0:showFloorSel()
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		setActive(slot0.stampBtn, getProxy(TaskProxy):mingshiTouchFlagEnabled())

		if LOCK_CLICK_MINGSHI then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 94-101, warpins: 1 ---
			setActive(slot0:findTF("stamp", slot0.bottomPanel), false)
			--- END OF BLOCK #0 ---



		end

		onButton(slot0, slot0.stampBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			getProxy(TaskProxy):dealMingshiTouchFlag(7)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CONFIRM)
		onButton(slot0, slot0.trainBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			uv0:emit(BackYardMediator.GO_SHIPINFO, BackYardShipInfoLayer.SHIP_TRAIN_TYPE)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onButton(slot0, slot0.restBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			uv0:emit(BackYardMediator.GO_SHIPINFO, BackYardShipInfoLayer.SHIP_REST_TYPE)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onButton(slot0, slot0.stock, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			uv0:emit(BackYardMediator.GO_GRANARY)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onButton(slot0, slot0.shopBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			uv0:emit(BackYardMediator.GO_SHOP)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onButton(slot0, slot0.shareBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeBackyard, pg.ShareMgr.PANEL_TYPE_PINK)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		function slot1()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-28, warpins: 1 ---
			return LeanTween.scale(rtf(uv0.comforTableChat), Vector3(0, 0, 0), 0.2):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-17, warpins: 1 ---
				if not IsNil(uv0.comforBtn) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 7-16, warpins: 1 ---
					setButtonEnabled(uv0.comforBtn, true)
					setActive(uv0.comforTableChat, false)
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end)):setOnStart(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				setActive(uv0.clickTF, false)

				uv0.isShowConfortableMsg = nil

				return
				--- END OF BLOCK #0 ---



			end))
			--- END OF BLOCK #0 ---



		end

		onButton(slot0, slot0.comforBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-36, warpins: 1 ---
			setActive(uv0.clickTF, true)
			setActive(uv0.comforTableChat, true)
			setButtonEnabled(uv0.comforBtn, false)
			LeanTween.scale(rtf(uv0.comforTableChat), Vector3(1, 1, 1), 0.3):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				uv0():setDelay(9)

				return
				--- END OF BLOCK #0 ---



			end))

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		setActive(slot0.clickTF, false)
		onButton(slot0, slot0.clickTF, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			LeanTween.cancel(go(uv0.comforTableChat))
			uv1()

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		slot0:registerNoFoodBoxEvent()
		slot0:registerRenameEvent()
		slot0:emit(BackYardMediator.OPEN_ADD_EXP, 1)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.showFloorSel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-76, warpins: 1 ---
	slot0.isShowFloorSel = true

	setActive(slot0.msgBox, true)
	setActive(slot0.msgFloorPanel, true)
	removeAllChildren(slot0.floorContainer)

	for slot4 = 1, Dorm.MAX_FLOOR, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-58, warpins: 2 ---
		slot5 = cloneTplTo(slot0.floorTF, slot0.floorContainer)

		setText(slot5:Find("name"), slot4 .. "F")
		setActive(slot6, not slot0.dormVO:isUnlockFloor(slot4))
		onButton(slot0, slot5, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-28, warpins: 1 ---
			if uv0.view and uv0.view.inInitFurnitrues then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-10, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			if uv0.contextData.floor ~= uv1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-23, warpins: 1 ---
				uv0:emit(BackYardMediator.ON_SWITCH_FLOOR, uv1)
				--- END OF BLOCK #0 ---



			end

			uv0:closeFloorSel()

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onButton(slot0, slot5:Find("mask"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-24, warpins: 1 ---
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("backyard_open_2floor", pg.shop_template[ShopArgs.DORM_FLOOR_ID].resource_num),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-13, warpins: 1 ---
					uv0:emit(BackYardMediator.ON_SHOPPING, uv1, 1)
					uv0:closeFloorSel()

					return
					--- END OF BLOCK #0 ---



				end
			})

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot0.msgBox, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:closeFloorSel()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.msgBox:Find("floor_panel/cancel_btn"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:closeFloorSel()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeFloorSel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0.isShowFloorSel = nil

	setActive(slot0.msgBox, false)
	setActive(slot0.msgFloorPanel, false)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateFloor(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 52-53, warpins: 3 ---
	slot0.floorText.text = slot0.contextData.floor .. "F"

	setActive(slot0.buffContain, slot0:isFirstFloor())
	setActive(slot0.stock, not slot0.isVisitMode and slot0:isFirstFloor())
	setActive(slot0.restBtn, not slot0.isVisitMode and not slot0:isFirstFloor())
	setActive(slot0.trainBtn, not slot0.isVisitMode and slot0:isFirstFloor())

	return
	--- END OF BLOCK #0 ---



end

function slot0.registerNoFoodBoxEvent(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	onButton(slot0, slot0.nofoodBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		uv0:closeNofoodBox()
		triggerButton(uv0.stock)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.nofoodCancelBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:closeNofoodBox()

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.nofoodBox, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:closeNofoodBox()

		return
		--- END OF BLOCK #0 ---



	end)
	onNextTick(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-33, warpins: 1 ---
		if not uv0.closeNofoodFlag and uv0.dormVO.food == 0 and uv0.trainShipCount > 0 and (not uv0.contextData.fromMediatorName or uv0.contextData.fromMediatorName ~= "DockyardMediator") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-32, warpins: 2 ---
			uv0:openNofoodBox()

			uv0.contextData.fromMain = nil
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.registerRenameEvent(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	onButton(slot0, slot0:findTF("name_container/frame", slot0.topPanel), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:openRenameBox()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.renameBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-37, warpins: 1 ---
		if not getInputText(uv0.nameInput) or slot0 == "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-20, warpins: 2 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("word_should_input"))

			return
			--- END OF BLOCK #0 ---



		end

		if not nameValidityCheck(slot0, 0, 20, {
			"spece_illegal_tip",
			"login_newPlayerScene_name_tooShort",
			"login_newPlayerScene_name_tooLong",
			"playerinfo_mask_word"
		}) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-29, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0:emit(BackYardMediator.RENAME, slot0)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.renameCancelBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:closeRenameBox()

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.renameBox, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:closeRenameBox()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.initLoading(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-66, warpins: 1 ---
	setActive(slot0.loading, true)
	setParent(slot0.loading, GameObject.Find("Overlay/UIOverlay"), false)
	setSlider(slot0.loadingProgress, 0, 1, 0)
	setText(slot0.loadingProgressTx, "0.00%")
	LoadImageSpriteAsync("helpbg/" .. ({
		"battle_maincanon",
		"battle_plane",
		"break",
		"bullet",
		"energy",
		"equip",
		"strength",
		"tactics"
	})[math.clamp(math.random(#) + 1, 1, #)], slot0.loadingHelp)
	setText(slot0.loadingHelpTx, pg.server_language[math.random(#pg.server_language)].content)

	slot3 = 0
	slot0.loadingTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-36, warpins: 1 ---
		setSlider(uv2.loadingProgress, 0, 1, slot1)
		setText(uv2.loadingProgressTx, string.format("%.2f", math.lerp(uv1, slot0, 0.5) * 100) .. "%")

		uv1 = uv0()

		if uv1 >= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-35, warpins: 1 ---
			uv2:hideLoading()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, 0.0334, -1)

	slot0.loadingTimer:Start()

	return
	--- END OF BLOCK #0 ---



end

function slot0.hideLoading(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	if slot0.loadingTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.loadingTimer:Stop()

		slot0.loadingTimer = nil
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.loading, false)
	setParent(slot0.loading, slot0._tf, false)

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayBuff(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-52, warpins: 1 ---
	removeAllChildren(slot0.buffContain)

	slot0.buffTFs = {}

	if slot0.buffTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-17, warpins: 1 ---
		for slot4, slot5 in pairs(slot0.buffTimer) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-17, warpins: 1 ---
			slot5:Stop()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0.buffTimer = {}

	for slot5, slot6 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-51, warpins: 1 ---
		if not slot0:createBuff(slot6):isExpired() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-49, warpins: 1 ---
			slot0.buffTFs[slot6.id] = cloneTplTo(slot0.buffTpl, slot0.buffContain)

			slot0:updateBuff(slot7)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.createBuff(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	return {
		id = slot1.id,
		timestamp = slot1.timestamp,
		getConfig = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			return pg.benefit_buff_template[slot0.id][slot1]
			--- END OF BLOCK #0 ---



		end,
		isExpired = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-15, warpins: 2 ---
			return slot0.timestamp < pg.TimeMgr:GetInstance():GetServerTime()
			--- END OF BLOCK #0 ---



		end,
		getLeftTime = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			return slot0.timestamp - pg.TimeMgr:GetInstance():GetServerTime()
			--- END OF BLOCK #0 ---



		end,
		isRedTime = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			if slot0:getLeftTime() <= 600 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-8, warpins: 1 ---
				return true
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end
	}
	--- END OF BLOCK #0 ---



end

function slot0.updateBuff(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-60, warpins: 1 ---
	function slot3()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-18, warpins: 1 ---
		Destroy(uv0)
		uv1.buffTimer[uv2.id]:Stop()

		uv1.buffTimer[uv2.id] = nil

		return
		--- END OF BLOCK #0 ---



	end

	if not slot1:isExpired() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-48, warpins: 1 ---
		slot4 = slot0:findTF("Text", slot0.buffTFs[slot1.id])
		slot0.buffTFs[slot1.id]:GetComponent(typeof(Image)).sprite = LoadSprite(slot1:getConfig("icon"))
		slot0.buffTimer[slot1.id] = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-42, warpins: 1 ---
			slot2 = nil

			if uv0:getLeftTime() > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-39, warpins: 2 ---
				setText(uv1, (uv0:isRedTime() or setColorStr(pg.TimeMgr:GetInstance():DescCDTime(slot0), "#FFFFFFFF")) and setColorStr(pg.TimeMgr.GetInstance().DescCDTime(slot0), COLOR_RED))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 40-41, warpins: 1 ---
				uv2()
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, 1, -1)

		slot0.buffTimer[slot1.id]:Start()
		slot0.buffTimer[slot1.id].func()
		--- END OF BLOCK #0 ---



	end

	slot4 = pg.benefit_buff_template[slot1.id]

	onButton(slot0, slot2, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-47, warpins: 1 ---
		LeanTween.cancel(uv0.buffTip.gameObject)

		rtf(uv0.buffTip).anchoredPosition = rtf(uv1).anchoredPosition

		setText(uv0:findTF("Text", uv0.buffTip), uv2.desc)
		LeanTween.scale(rtf(uv0.buffTip), Vector3(1, 1, 1), 0.3):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-24, warpins: 1 ---
			if not IsNil(uv0.buffTip) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-23, warpins: 1 ---
				LeanTween.scale(rtf(uv0.buffTip), Vector3(0, 0, 0), 0.3):setDelay(2)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateRes(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0:displayBuff()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateDromName(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 6-18, warpins: 2 ---
	if (slot0.dormVO.name or "") == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot1 = i18n("backyard_backyardScene_name", slot0.playerVO.name)
		--- END OF BLOCK #0 ---



	end

	setText(slot0.playerName, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateDrom(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-92, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.stockBar.fillAmount = slot1.food / (pg.dorm_data_template[slot1.id].capacity + slot1.dorm_food_max)

	setText(slot0.comfortable, slot1:getComfortable())
	setText(slot0:findTF("stock_bar/Text", slot0.stock), math.ceil(slot1.food) .. "/" .. pg.dorm_data_template[slot1.id].capacity + slot1.dorm_food_max)

	slot3 = slot0.dormVO:getComBGIndex()

	slot0:setSpriteTo(slot0.comfortableBG[slot3], slot0.comforExpress)
	setText(slot0:findTF("Text", slot0.comforTableChat), slot0.dormVO:comforChatContent(slot3))
	setText(slot0:findTF("state", slot0.comforTableChat), slot0.dormVO.comforChatState[slot3])

	if slot0.isVisitMode then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-76, warpins: 1 ---
		setActive(slot0.leftTimeTF, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 77-79, warpins: 1 ---
		slot0:calFoodLeftTime()
		--- END OF BLOCK #0 ---



	end

	if not slot0.isVisitMode then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 83-88, warpins: 1 ---
		slot0:setCurTrainCount()
		slot0:setCurRestCount()
		--- END OF BLOCK #0 ---



	end

	slot0:updateDromName()

	return
	--- END OF BLOCK #0 ---



end

function slot0.calFoodLeftTime(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-63, warpins: 1 ---
	if slot0.calFoodTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-14, warpins: 1 ---
		pg.TimeMgr:GetInstance():RemoveTimer(slot0.calFoodTimer)

		slot0.calFoodTimer = nil
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.leftTimeTF, slot0.dormVO.next_timestamp ~= 0)

	if slot0.trainShipCount <= 0 or slot0.dormVO.food <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-38, warpins: 2 ---
		setActive(slot0.leftTimeTF, false)

		return
		--- END OF BLOCK #0 ---



	end

	slot1 = slot0.dormVO:getFoodLeftTime()

	function slot2()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		pg.TimeMgr:GetInstance():RemoveTimer(uv0.calFoodTimer)

		uv0.calFoodTimer = nil

		setActive(uv0.leftTimeTF, false)

		return
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.leftTimeTF, true)

	slot0.calFoodTimer = pg.TimeMgr:GetInstance():AddTimer("calFoodTimer", 0, 1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-37, warpins: 1 ---
		setText(uv1.leftTimeTF, i18n("backyard_backyardScene_timeRest", " " .. pg.TimeMgr:GetInstance():DescCDTime(math.floor(uv0) - pg.TimeMgr:GetInstance():GetServerTime())))

		if math.floor(uv0) - pg.TimeMgr.GetInstance().GetServerTime() <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-36, warpins: 1 ---
			uv2()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.setCurTrainCount(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0.curTrainCount.text = slot0.trainShipCount .. "/" .. slot0.dormVO.exp_pos

	return
	--- END OF BLOCK #0 ---



end

function slot0.setCurRestCount(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0.curRestCount.text = slot0.restShipCount .. "/" .. slot0.dormVO.rest_pos

	return
	--- END OF BLOCK #0 ---



end

function slot0.openRenameBox(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	if IsNil(slot0.renameBox) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.isOpenRenameBox = true

	setActive(slot0.renameBox, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.renameBox)

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeRenameBox(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	if slot0.isOpenRenameBox then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-18, warpins: 1 ---
		setActive(slot0.renameBox, false)

		slot0.isOpenRenameBox = nil

		pg.UIMgr.GetInstance():UnblurPanel(slot0.renameBox, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.openNofoodBox(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-46, warpins: 1 ---
	if slot0.isOpenNofoodBox then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.isOpenNofoodBox = true
	slot0.closeNofoodFlag = nil
	findTF(slot0.nofoodBox, "frame").localScale = Vector3(0, 0, 0)

	LeanTween.scale(slot1, Vector3(1, 1, 1), 0.3):setEase(LeanTweenType.easeOutBack)
	setActive(slot0.nofoodBox, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.nofoodBox)

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeNofoodBox(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	if slot0.isOpenNofoodBox then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-18, warpins: 1 ---
		setActive(slot0.nofoodBox, false)

		slot0.isOpenNofoodBox = nil

		pg.UIMgr.GetInstance():UnblurPanel(slot0.nofoodBox, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	slot0.closeNofoodFlag = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	if slot0.isOpenNofoodBox then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0:closeNofoodBox()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		if slot0.isOpenRenameBox then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-14, warpins: 1 ---
			slot0:closeRenameBox()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			if slot0.isShowFloorSel then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-21, warpins: 1 ---
				slot0:closeFloorSel()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-29, warpins: 1 ---
				playSoundEffect(SFX_CANCEL)
				slot0:emit(uv0.ON_BACK)
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
	--- BLOCK #0 1-72, warpins: 1 ---
	pg.TimeMgr:GetInstance():RemoveTimer(slot0.calFoodTimer)

	for slot4, slot5 in pairs(slot0.buffTimer) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---



	end

	if slot0.isOpenNofoodBox then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-24, warpins: 1 ---
		slot0:closeNofoodBox()
		--- END OF BLOCK #0 ---



	end

	if slot0.comforTableChat and LeanTween.isTweening(go(slot0.comforTableChat)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-41, warpins: 1 ---
		LeanTween.cancel(go(slot0.comforTableChat))
		--- END OF BLOCK #0 ---



	end

	if slot0.buffTip and LeanTween.isTweening(go(slot0.buffTip)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-58, warpins: 1 ---
		LeanTween.cancel(go(slot0.buffTip))
		--- END OF BLOCK #0 ---



	end

	slot0:hideLoading()
	slot0:closeRenameBox()
	slot0:closeFloorSel()

	slot0.calFoodTimer = nil
	slot0.buffTimer = nil

	return
	--- END OF BLOCK #0 ---



end

return slot0
