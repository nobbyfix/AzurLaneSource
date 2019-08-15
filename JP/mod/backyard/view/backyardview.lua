slot0 = class("BackYardView")
slot1 = require("Mod/BackYard/view/BackYardTool")
slot2 = require("Framework.notify.event")

slot0.emit = function (slot0, ...)
	if slot0.event then
		slot0.event:emit(...)
	end
end

slot0.findTF = function (slot0, slot1, slot2)
	return findTF(slot2 or slot0._tf, slot1)
end

slot0.Ctor = function (slot0, slot1, slot2, slot3, slot4)
	slot0.event = slot0.New()
	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.mode = slot2
	slot0.bgm = slot4

	pg.DelegateInfo.New(slot0)

	slot0.backyardPoolMgr = slot3
end

slot0.setHouse = function (slot0, slot1)
	slot0.houseVO = slot1
	slot0.furnitureVOs = slot0.houseVO.furnitures
	slot0.boatVOs = slot0.houseVO.ships
	slot0.wallPaperVO = slot0.houseVO.wallPaper
	slot0.floorPaperVO = slot0.houseVO.floorPaper
end

slot0.updateExtendItemVO = function (slot0, slot1)
	slot0.itemVO = slot1:getItemById(ITEM_BACKYARD_AREA_EXTEND) or Item.New({
		count = 0,
		id = ITEM_BACKYARD_AREA_EXTEND
	})
end

slot0.init = function (slot0)
	slot0.furnitureModals = {}
	slot0.furnItem = {}
	slot0.shipModels = {}
	slot0.furnBottomGrids = {}
	slot0._attachmentList = {}
	slot0.effectContains = slot0:findTF("effects")
	slot0.floorContain = slot0:findTF("bg/furContain/floor")
	slot0.floorGrid = slot0:findTF("bg/floorGrid")
	slot0.furnitureTpl = slot0:findTF("resources/furnituretpl")
	slot0.furContain = slot0:findTF("bg/furContain")
	slot0.wallContain = slot0:findTF("bg/furContain/wall")
	slot0.carpetContain = slot0:findTF("bg/furContain/carpet")
	slot0.decorationBtn = slot0:findTF("decorateBtn")
	slot0.warn = slot0:findTF("bg/warn")
	slot0.backBtn = findTF(slot0._tf, "back")
	slot0.mainTFCG = findTF(slot0._tf.parent, "main"):GetComponent(typeof(CanvasGroup))
	slot0.eyeBtn = findTF(slot0._tf.parent, "main/eye_btn")
	slot0.msgBoxPanel = slot0:findTF("msg_box")
	slot0.warnCG = slot0.warn:GetComponent("CanvasGroup")
	slot0.zoom = slot0:findTF("bg"):GetComponent("Zoom")
	slot0.road = slot0:findTF("bg/road"):GetComponent(typeof(Image))
	slot0.loadingCount = 0
	slot0.loadingTotal = 0
	slot0.wallPaperModel = BackYardPaperModel.New(slot0:findTF("bg/wall"), BackYardPaperModel.PAPER_TYPE_WALL)
	slot0.baseWallPaperModel = BackYardPaperModel.New(slot0:findTF("bg/wall_base"), BackYardPaperModel.PAPER_TYPE_BASEWALL)
	slot0.floorPaperModel = BackYardPaperModel.New(slot0:findTF("bg/floor"), BackYardPaperModel.PAPER_TYPE_FLOOR)

	slot0:didEnter()
	slot0:setMode()
end

slot0.enableZoom = function (slot0, slot1)
	slot0.zoom.enabled = slot1
end

slot0.setMode = function (slot0)
	setActive(slot0.decorationBtn, not (slot0.mode == BackYardConst.MODE_VISIT))

	slot0:findTF("bg"):GetComponent(typeof(CanvasGroup)).blocksRaycasts = not (slot0.mode == BackYardConst.MODE_VISIT)
end

slot0.getProgress = function (slot0)
	if not slot0.loadingCount or not slot0.loadingTotal then
		return 0
	else
		return (slot0.loadingCount == slot0.loadingTotal and 1) or slot0.loadingCount / slot0.loadingTotal
	end
end

slot0.stopAllBoatMove = function (slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOn()

	slot2 = {}

	table.sort(slot3, function (slot0, slot1)
		return ((slot0.boatVO:hasSpineInterAction() and 1) or 0) > ((slot1.boatVO:hasSpineInterAction() and 1) or 0)
	end)

	for slot7, slot8 in pairs(slot3) do
		table.insert(slot2, function (slot0)
			if not slot0.boatVO:hasSpineInterAction() then
				slot1:emit(BackyardMainMediator.CANCEL_SHIP_MOVE, slot0.boatVO.id)
				slot0:removeItem()
				slot0:updateShadowTF(false)

				if not slot0.boatVO:hasInterActionFurnitrue() then
					slot0.tf:SetAsLastSibling()
				end

				slot0()
			elseif slot1.furnitureVOs[slot0.boatVO:getSpineId()]:isTransPort() or slot3:isLoopSpineInterAction() then
				slot0()
			else
				slot0:breakSpineAnim(slot0)
			end
		end)
	end

	seriesAsync(slot2, function ()
		pg.UIMgr.GetInstance():LoadingOff()

		if pg.UIMgr.GetInstance().LoadingOff then
			slot0()
		end
	end)
end

slot0.enableDecorateMode = function (slot0, slot1)
	if defaultValue(slot0.decorateMode, false) == slot1 then
		return
	end

	slot0.decorateMode = slot1

	setActive(slot0.backBtn, slot1)
	SetActive(slot0.floorGrid, slot1)
	setActive(slot0.eyeBtn, not slot1)

	slot2 = pairs
	slot3 = slot0.shipModels or {}

	for slot5, slot6 in slot2(slot3) do
		if not IsNil(slot6.go) then
			slot6.canvasGroup.alpha = (not slot1 and 1) or 0
			slot6.canvasGroup.blocksRaycasts = not slot1

			slot6:updateShadowTF(not slot1)
		end
	end

	slot0.warnCG.blocksRaycasts = not slot1
	slot0.mainTFCG.blocksRaycasts = not slot1
	Input.multiTouchEnabled = not slot1
	slot2 = pairs
	slot3 = slot0.furnitureModals or {}

	for slot5, slot6 in slot2(slot3) do
		if not slot0.furnitureVOs[slot5]:canBeTouch() then
			slot6:Find("icon"):GetComponent(typeof(Image)).raycastTarget = slot1
		end
	end

	if not slot1 then
		slot0:closePreFurnSelected()
		slot0:emit(BackyardMainMediator.BOAT_POSITION_RESET)
		slot0:emit(BackyardMainMediator.CLOSE_GARNITURE)
		slot0.map.afterSortFunc(slot0.map.sortedItems)
	end
end

slot0.anyShipInTransPort = function (slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		if slot5:inTransport() then
			return true
		end
	end

	return false
end

slot0.didEnter = function (slot0)
	slot0:initHouse()
	onButton(slot0, slot0.floorGrid, function ()
		if slot0.isDraging then
			return
		end

		slot0:closePreFurnSelected()
	end, SFX_PANEL)
	onButton(slot0, slot0.decorationBtn, function ()
		if slot0.inInitFurnitrues then
			pg.TipsMgr.GetInstance():ShowTips(i18n("backyard_is_loading"))

			return
		end

		if slot0:anyShipInTransPort() then
			return
		end

		if slot0.blockEvent then
			return
		end

		slot0:stopAllBoatMove(function ()
			slot0:emit(BackyardMainMediator.OPEN_DECORATION)
		end)
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		if slot0.isDraging then
			return
		end

		if slot0.houseVO:hasChangeFurnitures() then
			slot0:closePreFurnSelected()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("backyard_backyardScene_quest_saveFurniture"),
				onYes = function ()
					slot0:save()
				end,
				yesSound = SFX_FURNITRUE_SAVE,
				onNo = function ()
					slot0:emit(BackyardMainMediator.RESTORE_FURNITURES)
				end
			})
		else
			slot0:enableDecorateMode(false)
		end
	end, SFX_CANCEL)
end

slot0.save = function (slot0)
	if slot0.houseVO:hasChangeFurnitures() then
		slot0:emit(BackyardMainMediator.SAVE_FURNITURE)
	else
		slot0:enableDecorateMode(false)
	end
end

slot0.exitBoat = function (slot0, slot1)
	slot0.shipModels[slot1.id].dispose(slot2)

	slot0.shipModels[slot1.id] = nil
	slot0.boatVOs[slot1.id] = nil
end

slot0.initHouse = function (slot0)
	slot0.maps = {}
	slot0.map = slot0:createMap(slot0.houseVO.endX + 1, slot0.houseVO.endY + 1)

	slot0:updateHouseArea(slot0.houseVO.level)
	slot0:initFurnitures()
end

slot0.updateHouseArea = function (slot0, slot1)
	if not slot0.roadPositions then
		slot0.roadPositions = {
			-920,
			-1080,
			-1230,
			-1230
		}
	end

	slot0.road.sprite = GetSpriteFromAtlas("furniture/base/road_" .. slot1, "")

	slot0.road:SetNativeSize()
	setActive(slot0.road, true)

	tf(go(slot0.road)).anchoredPosition = Vector3(0, slot0.roadPositions[slot1], 0)
	slot0:findTF("bg").sizeDelta = Vector2(slot0.findTF("bg").sizeDelta.x, slot3)

	scrollTo(slot0._tf, 0.5, 0.5)

	if slot1 <= 0 or slot1 > 3 then
		SetActive(slot0.warn, false)
	else
		slot0.warn.localPosition = BackYardConst.level2WarnPos(slot1)
	end

	onButton(slot0, slot0.warn, function ()
		triggerButton(go(slot0.road))
	end, SFX_PANEL)
	onButton(slot0, go(slot0.road), function ()
		if slot0 > 3 then
			return
		end

		slot3 = pg.item_data_statistics[id2ItemId(pg.shop_template[slot1.houseVO:getExpandId()].resource_type)].name

		function slot4()
			if slot0.itemVO.count <= 0 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("backyard_buyExtendItem_question", slot1.resource_num .. ),
					onYes = function ()
						slot0:emit(BackyardMainMediator.BUY_EXTEND_BACKYARD_ITEM, slot0, 1)
						slot0.emit:closeMsgBox()
					end
				})
			else
				slot0:emit(BackyardMainMediator.EXTEND_BACKYARD_AREA)
				slot0.emit:closeMsgBox()
			end
		end

		slot6 = {}

		for slot10, slot11 in ipairs(string.split(slot5, "||")) do
			slot6["text" .. slot10] = slot11
		end

		slot1:showMsgBox(slot4, slot6)
	end, SFX_PANEL)
	slot0:loadWallPaper(slot0.wallPaperVO, Furniture.TYPE_WALLPAPER)
	slot0:loadWallPaper(slot0.floorPaperVO, Furniture.TYPE_FLOORPAPER)
	slot0:emit(BackyardMainMediator.ON_CHECK_EFFECT)
end

slot0.updateItemCount = function (slot0, slot1)
	setText(slot0:findTF("frame/tip_2/value_bg/Text", slot0.msgBoxPanel), (tonumber(slot1) <= 0 and setColorStr(slot1, COLOR_RED)) or setColorStr(slot1, COLOR_GREEN))
end

slot0.showMsgBox = function (slot0, slot1, slot2)
	slot0.isOpenMsgBox = true

	setActive(slot0.msgBoxPanel, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.msgBoxPanel)
	setText(slot0:findTF("frame/tip_1/text_1", slot0.msgBoxPanel), slot2.text1)
	setText(slot0:findTF("frame/tip_1/value_bg/Text", slot0.msgBoxPanel), setColorStr(slot2.text2, COLOR_GREEN))
	setText(slot0:findTF("frame/tip_1/text_2", slot0.msgBoxPanel), slot2.text3)
	setText(slot0:findTF("frame/tip_2/text_1", slot0.msgBoxPanel), slot2.text4)
	slot0:updateItemCount(slot2.text5)
	setText(slot0:findTF("frame/tip_2/text_2", slot0.msgBoxPanel), slot2.text6)
	updateDrop(findTF(slot0.msgBoxPanel, "frame"), slot3)
	onButton(slot0, slot0:findTF("frame/ok_btn", slot0.msgBoxPanel), function ()
		if slot0 then
			slot0()
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0:findTF("frame/cancel_btn", slot0.msgBoxPanel), function ()
		slot0:closeMsgBox()
	end, SFX_CANCEL)
	onButton(slot0, slot0.msgBoxPanel, function ()
		slot0:closeMsgBox()
	end, SFX_CANCEL)
end

slot0.closeMsgBox = function (slot0)
	if slot0.isOpenMsgBox then
		slot0.isOpenMsgBox = nil

		setActive(slot0.msgBoxPanel, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.msgBoxPanel, slot0._tf)
	end
end

slot0.createMap = function (slot0, slot1, slot2)
	slot3 = pg.IsometricMap.New(slot1, slot2)

	slot3:SetAfterFunc(function (slot0)
		slot1 = 0

		for slot5, slot6 in ipairs(slot0) do
			if not slot6.ob.isBoat then
				slot0.furnitureModals[slot6.ob.id]:SetSiblingIndex(slot1)
			end

			slot1 = slot1 + 1
		end

		slot0:sortBoat()
	end)

	return slot3
end

slot0.sortBoat = function (slot0)
	for slot4, slot5 in pairs(slot0.shipModels) do
		if slot0.boatVOs[slot4]:getPosition() and not slot0.boatVOs[slot4]:hasInterActionFurnitrue() and not slot0.boatVOs[slot4]:hasSpineInterAction() then
			slot5:removeItem()
			slot5:createItem(slot6)
		end
	end
end

slot0.getMap = function (slot0, slot1)
	if slot1.parent ~= 0 and slot0.maps[slot1.parent] then
		return slot0.maps[slot1.parent]
	elseif slot1.parent ~= 0 and not slot0.maps[slot1.parent] then
		slot8, slot9 = slot0.furnitureVOs[slot1.parent]:getMapSize()
		slot0.maps[slot1.parent] = slot0:createMap(slot2, slot3)

		return slot0.maps[slot1.parent]
	else
		return slot0.map
	end
end

slot0.createItem = function (slot0, slot1, slot2, slot3)
	if not slot1:isMapItem() then
		return
	end

	slot4 = slot0:getMap(slot1)
	slot9, slot10 = slot1:getSize()

	slot4:PlaceItem(slot2 + 1, slot3 + 1, slot4:CreateItem(slot5, slot6, {
		isBoat = false,
		id = slot1.id
	}))

	slot0.furnItem[slot1.id] = slot4.CreateItem(slot5, slot6, )
end

slot0.removeItem = function (slot0, slot1)
	if not slot1:isMapItem() then
		return
	end

	if not slot0.furnItem[slot1.id] then
		return
	end

	if not slot1:hasParent() then
		if slot0.map then
			slot0.map:RemoveItem(slot2)
		end
	elseif slot0.maps[slot1.parent] then
		slot0.maps[slot1.parent]:RemoveItem(slot2)
	end

	slot0.furnItem[slot1.id] = nil
end

slot0.initFurnitures = function (slot0)
	function slot1(slot0, slot1)
		if slot0.isExist then
			slot1()

			return
		end

		slot0:loadFurnitureModel(slot0, function (slot0)
			if not slot0 then
				slot0()

				return
			end

			LeanTween.scale(rtf(slot0), Vector3(slot0.localScale.x + 0.2, slot0.localScale.y + 0.2, 1), 0.2):setFrom(0):setOnComplete(System.Action(function ()
				LeanTween.scale(rtf(slot0), Vector3(slot1, Vector3, 1), 0.1):setOnComplete(System.Action(0.1))
			end))
		end)
	end

	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot5 = {}
	slot6 = {}
	slot7 = {}
	slot8 = {}
	slot9 = {}

	for slot13, slot14 in pairs(slot0.furnitureVOs) do
		if slot14:hasParent() and slot14:hasChild() then
			table.insert(slot4, slot14)
		elseif slot14:hasParent() then
			table.insert(slot5, slot14)
		elseif slot14:isStageFurniture() then
			table.insert(slot2, slot14)
		else
			table.insert(slot3, slot14)
		end
	end

	for slot13, slot14 in ipairs(slot2) do
		table.insert(slot6, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	for slot13, slot14 in ipairs(slot3) do
		table.insert(slot7, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	for slot13, slot14 in ipairs(slot4) do
		table.insert(slot8, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	for slot13, slot14 in ipairs(slot5) do
		table.insert(slot9, function (slot0)
			slot0(slot0, slot0)
		end)
	end

	slot10 = {}
	slot11 = {}

	for slot15, slot16 in pairs(slot0.boatVOs) do
		table.insert(slot10, function (slot0)
			onNextTick(function ()
				if slot0.isExist then
					slot1()

					return
				end

				slot0:loadBoatModal(slot2, slot0)
			end)
		end)

		if not slot16:hasInterActionFurnitrue() then
			table.insert(slot11, function (slot0)
				slot0:emit(BackyardMainMediator.ADD_BOAT_MOVE, slot1.id)
				slot0()
			end)
		end
	end

	slot0.inInitFurnitrues = true

	seriesAsync({
		function (slot0)
			seriesAsync(slot0, slot0)
		end,
		function (slot0)
			limitedParallelAsync(slot0, 5, slot0)
		end,
		function (slot0)
			limitedParallelAsync(slot0, 5, slot0)
		end,
		function (slot0)
			limitedParallelAsync(slot0, 5, slot0)
		end,
		function (slot0)
			seriesAsync(slot0, slot0)
		end,
		function (slot0)
			seriesAsync(slot0, slot0)
		end
	}, function ()
		slot0.inInitFurnitrues = nil

		slot0:sortWallFurns()
		slot0.sortWallFurns:sortAllMat()
	end)
end

slot0.loadWallPaper = function (slot0, slot1, slot2)
	if slot2 == Furniture.TYPE_WALLPAPER then
		slot0.wallPaperModel:update(slot1, slot0.houseVO.level)
		slot0.baseWallPaperModel:update(slot1, slot0.houseVO.level)
	elseif slot2 == Furniture.TYPE_FLOORPAPER then
		slot0.floorPaperModel:update(slot1, slot0.houseVO.level)
	end
end

slot0.loadFurnitureModel = function (slot0, slot1, slot2)
	if not slot0.backyardPoolMgr then
		if slot2 then
			slot2()
		end

		return
	end

	slot4 = slot0.backyardPoolMgr:Dequeue(slot0.backyardPoolMgr.POOL_NAME.FURNITURE)

	SetParent(slot4, slot0.furContain)

	slot4.gameObject.name = slot1.id

	setActive(slot5, false)
	SetActive(slot0:findTF("rotation", slot4:Find("drag")), slot1:isFloor() and slot1:canRotate())

	slot0.furnitureModals[slot1.id] = slot4
	slot6 = slot1:getPosition()

	function slot7(slot0)
		if slot0.isExist then
			if slot1 then
				slot1()
			end

			return
		end

		if not slot0 or IsNil(slot2) then
			if slot1 then
				slot1()
			end

			return
		end

		slot2.sizeDelta = Vector2(slot0.rect.width, slot0.rect.height)

		SetParent(slot1, SetParent)

		slot3 = slot4.dir == 2
		slot3.getSign.localScale = Vector3(slot3.getSign, 1, 1)

		slot0:setWallModalDir(slot0, )
		slot0:updateFurnitruePos(slot0, true)

		true.anchoredPosition3D = Vector3(0, 0, 0)

		slot0:registerFurnitureEvent(slot0)

		if slot0.decorateMode then
			if not IsNil(slot0.curFurnModal) then
				slot0:closePreFurnSelected()
			end

			triggerButton(slot1)
		end

		setActive(slot2, true)

		if slot1 then
			slot1(slot2)
		end
	end

	if not slot1:isSpine() then
		slot0:loadImageFurniture(slot1, slot7)
	else
		slot0:loadSpineFurnitureModel(slot1, slot7)
	end
end

slot0.loadImageFurniture = function (slot0, slot1, slot2)
	slot3 = slot0.furnitureModals[slot1.id]

	GetSpriteFromAtlasAsync("furniture/" .. slot1:getConfig("picture"), "", function (slot0)
		if slot0.isExist then
			if slot1 then
				slot1()
			end

			return
		end

		if IsNil(slot0._tf) then
			if slot1 then
				slot1()
			end

			return
		end

		slot2.pivot = getSpritePivot(slot0)
		slot1 = slot3.createImage("icon", true, , 1)

		slot1:AddComponent(typeof(AlphaCheck))
		setImageSprite(slot1, slot0, true)

		if slot4:hasInterActionMask() then
			slot0:loadFurnituresMasks(slot4, function ()
				slot0(slot1)
			end)
		elseif slot4:isArch() then
			slot0:loadArchMask(slot4, function ()
				slot0(slot1)
			end)
		else
			slot1(slot0)
		end
	end)
end

slot0.loadArchMask = function (slot0, slot1, slot2)
	slot3 = slot0.furnitureModals[slot1.id]

	ResourceMgr.Inst:getAssetAsync("furniture/" .. slot4, "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
		if slot0.isExist then
			if slot1 then
				slot1()
			end

			return
		end

		if IsNil(slot0._tf) and slot1 then
			slot1()

			return
		end

		slot1 = slot2.createImage(BackYardConst.ARCH_MASK_NAME, false, , 2, true)

		setActive(slot1, false)
		setImageSprite(slot1, slot0, true)

		if slot1 then
			slot1()
		end
	end), true, true)
end

slot0.loadFurnituresMasks = function (slot0, slot1, slot2)
	slot3 = slot0.furnitureModals[slot1.id]
	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		table.insert(slot5, function (slot0)
			ResourceMgr.Inst:getAssetAsync("furniture/" .. slot0, "", typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
				if slot0.isExist then
					if slot1 then
						slot1()
					end

					return
				end

				if IsNil(slot0._tf) then
					if slot1 then
						slot1()
					end

					return
				end

				setActive(slot1, false)
				setImageSprite(slot2.createImage(BackYardConst.FURNITRUE_MASK_ORDER_NAME .. slot3, false, slot4, 2, true), slot0, 
				-- Decompilation error in this vicinity:
				true)

				-- Decompilation error in this vicinity:
				true()
			end), true, true)
		end)
	end

	seriesAsync(slot5, function ()
		if slot0 then
			slot0()
		end
	end)
end

slot0.loadSpineFurnitureModel = function (slot0, slot1, slot2)
	slot3 = slot0.furnitureModals[slot1.id]
	slot8, slot5 = slot1:getSpineName()

	LoadAndInstantiateAsync("sfurniture", slot4, function (slot0)
		if slot0.isExist then
			if slot1 then
				slot1()
			end

			return
		end

		if IsNil(slot0._tf) then
			if slot1 then
				slot1()
			end

			return
		end

		slot2.pivot = rtf(slot0).pivot

		local function slot3(slot0, slot1, slot2, slot3)
			slot0.gameObject.name = slot1
			slot0.anchorMax = Vector2(slot0.x, slot0.y)
			slot0.anchorMin = Vector2(slot0.x, slot0.y)

			SetParent(slot0.gameObject, slot1)

			slot0.localPosition = Vector3(0, 0, 0)

			slot0:SetSiblingIndex(slot2)

			if slot3 then
				GetOrAddComponent(slot4, "SpineAnimUI"):SetAction(slot3, 0)
			end
		end

		slot3(slot1, "icon", 1, slot3)

		if slot3:hasSpineMask() then
			slot8, slot5 = slot4:getSpineMaskName()

			LoadAndInstantiateAsync("sfurniture", slot4, function (slot0)
				if slot0.isExist then
					if slot1 then
						slot1()
					end

					return
				end

				if IsNil(slot0._tf) then
					if slot1 then
						slot1()
					end

					return
				end

				setActive(slot0, false)
				slot0(rtf(slot0), BackYardConst.FURNITRUE_MASK_NAME, 2)
				slot0:loadSpineAnimator(BackYardConst.FURNITRUE_MASK_NAME, function ()
					slot0(slot1)
				end)
			end, true, true)
		else
			slot0:loadSpineAnimator(slot0.loadSpineAnimator, function ()
				slot0(slot1)
			end)
		end
	end, true, true)
end

slot0.loadSpineAnimator = function (slot0, slot1, slot2)
	if slot1:hasAnimator() then
		slot3 = {}
		slot5 = slot0.furnitureModals[slot1.id]

		for slot9 = 1, slot1:getSpineMaxCnt(), 1 do
			for slot14, slot15 in ipairs(slot10) do
				table.insert(slot3, function (slot0)
					LoadAndInstantiateAsync("sfurniture", slot0, function (slot0)
						if slot0.isExist then
							if slot1 then
								slot1()
							end

							return
						end

						if IsNil(slot0._tf) then
							if slot1 then
								slot1()
							end

							return
						end

						go(slot0).name = slot2:getAnimtorControlGoName(slot3 - 1, slot4)

						setActive(slot0, false)
						SetParent(slot0, slot5)
						slot6()
					end)
				end)
			end
		end

		parallelAsync(slot3, function ()
			if slot0 then
				slot0()
			end
		end)

		return
	end

	if slot2 then
		slot2()
	end
end

slot0.registerFurnitureEvent = function (slot0, slot1)
	slot3 = slot0.furnitureModals[slot1.id].Find(slot2, "drag")
	slot4 = slot0.furnitureModals[slot1.id].Find(slot2, "icon")
	slot5 = slot0:findTF("grids", slot0.furnitureModals[slot1.id])
	slot4:GetComponent(typeof(Image)).raycastTarget = slot1:canBeTouch() or slot0.decorateMode
	slot7 = {
		false
	}

	onButton(slot0, slot4, function ()
		if slot0.decorateMode then
			if slot0.isDraging then
				return
			end

			if not LeanTween.isTweening(go(go)) then
				LeanTween.scale(LeanTween.scale, Vector3(slot1.localScale.x - 0.05, slot1.localScale.y - 0.05, slot1.localScale.z - 0.05), 0.01):setOnComplete(System.Action(function ()
					LeanTween.scale(LeanTween.scale, , 0.1)
				end))
			end

			slot0:closePreFurnSelected()

			slot0.closePreFurnSelected.preFurnSelected = slot2
			slot0.closePreFurnSelected.curFurnModal = slot2

			SetActive(slot2, true)
			SetActive(slot3, true)
			SetActive:setPreSelectedParent(slot0.furContain)

			SetActive.setPreSelectedParent.preFurnSelected.localScale = Vector3(1, 1, 1)
		elseif slot4:isShowDesc() then
			slot0:showFurnitrueDesc(slot4)
		elseif slot4:isTouchSpine() then
			slot0:playTouchSpineAnim(slot4, slot5)
		end
	end, SFX_PANEL)

	slot8 = GetOrAddComponent(slot3, "EventTriggerListener")
	slot0.dragTrigger = slot8

	slot8:AddBeginDragFunc(function ()
		slot0:furnitureBeginDrag(slot0)
		slot0.furnitureBeginDrag:enableZoom(false)
	end)
	slot8:AddDragFunc(function (slot0, slot1)
		slot1:furnitureDrag(slot0.change2ScrPos(slot1.floorGrid, slot1.position), )
	end)
	slot8:AddDragEndFunc(function (slot0, slot1)
		slot0:enableZoom(true)
		slot0:furnitureEndDrag(slot1.getMapPos(slot2), slot1.change2ScrPos(slot0.floorGrid, slot1.position))
	end)
	onButton(slot0, slot0:findTF("ok", slot3), function ()
		if slot0.isDraging then
			return
		end

		slot0:closePreFurnSelected()
	end, SFX_CONFIRM)
	onButton(slot0, slot0:findTF("cancel", slot3), function ()
		if slot0.isDraging then
			return
		end

		slot0:closePreFurnSelected()
		slot0.closePreFurnSelected:emit(BackyardMainMediator.REMOVE_FURNITURE, slot1.id)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("rotation", slot3), function ()
		if slot0.isDraging then
			return
		end

		slot0:UpdateFurnitrueDir(slot1.id)
	end, SFX_PANEL)
end

slot0.UpdateFurnitrueDir = function (slot0, slot1)
	slot0.rotateId = slot1

	slot0:emit(BackyardMainMediator.FURNITURE_DIR_CHANGE, slot1)
end

slot0.playTouchSpineAnim = function (slot0, slot1, slot2)
	slot4 = GetOrAddComponent(slot0.furnitureModals[slot1.id].Find(slot3, "icon/spine"), typeof(SpineAnimUI))
	slot5, slot6 = slot1:getTouchSpineConfig()

	if not slot6 and slot2[1] then
		return
	end

	if slot2[1] and slot6 then
		slot4:SetAction("normal", 0)

		if slot1:isMoveable() then
			slot0:emit(BackyardMainMediator.ON_REMOVE_MOVE_FURNITURE, slot1.id)
		end

		slot2[1] = false

		return
	end

	slot4:SetActionCallBack(function (slot0)
		if slot0 == "finish" and not slot0 then
			slot1:SetAction("normal", 0)

			if slot1:isMoveable() then
				slot3:emit(BackyardMainMediator.ON_REMOVE_MOVE_FURNITURE, slot2.id)
			end

			slot1:SetActionCallBack(nil)

			slot4[1] = false
		end
	end)

	if slot5 then
		slot4:SetAction(slot5, 0)

		slot2[1] = true

		if slot1:isMoveable() then
			slot0:emit(BackyardMainMediator.ON_ADD_MOVE_FURNITURE, slot1.id)
		end
	end
end

slot0.createbottomGrid = function (slot0, slot1, slot2)
	slot4 = slot0.furnitureModals[slot1.id].Find(slot3, "grids")
	slot5 = {}
	slot6 = slot1:isFloor()

	for slot11, slot12 in ipairs(slot7) do
		slot13 = slot0:getGridTpl(slot6)

		SetParent(slot13, slot0.furContain)

		slot5[slot11] = slot13
		slot13.localPosition = slot0.getLocalPos(slot12)

		if not slot6 and BackyardFurnitureVO.isRightWall(slot2) then
			slot13.localScale = Vector3(1, 1, 1)
		end

		slot13:SetParent(slot4, true)
	end

	slot0.furnBottomGrids[slot1.id] = slot5
end

slot0.showFurnitrueDesc = function (slot0, slot1)
	if slot0.isOpenDesc then
		return
	end

	slot0.isOpenDesc = true

	if not slot0.isInitOpenDesc then
		slot0.isInitOpenDesc = true
		slot0.descPanel = findTF(slot0._tf, "desc_panel")
		slot0.miniPanel = findTF(slot0.descPanel, "mini")
		slot0.maxFrame = findTF(slot0.descPanel, "max_panel")
		slot0.maxPanel = findTF(slot0.maxFrame, "max")
		slot0.maxIcon = findTF(slot0.maxPanel, "desc/iconframe/icon"):GetComponent(typeof(Image))
		slot0.maxName = findTF(slot0.maxPanel, "desc/Text"):GetComponent(typeof(Text))
		slot0.maxType = findTF(slot0.maxPanel, "desc/container/frame/type"):GetComponent(typeof(Text))
		slot0.maxContent = findTF(slot0.maxPanel, "desc/container/frame/content"):GetComponent(typeof(Text))
		slot0.maxComfortable = findTF(slot0.maxPanel, "desc/container/frame/comfortable_container/Text"):GetComponent(typeof(Text))
		slot0.maxApproach = findTF(slot0.maxPanel, "desc/container/frame/approach_container/Text"):GetComponent(typeof(Text))
		slot0.maxdate = findTF(slot0.maxPanel, "desc/container/frame/date_container/Text"):GetComponent(typeof(Text))
		slot0.miniIcon = findTF(slot0.miniPanel, "bg1/frame/icon"):GetComponent(typeof(Image))
		slot0.miniName = findTF(slot0.miniPanel, "name_container/Text"):GetComponent(typeof(Text))
		slot0.descPanelParent = slot0.descPanel.parent
		slot0.descPanelVoiceBtn = findTF(slot0.maxPanel, "desc/container/frame/voice")

		onButton(slot0, slot0.descPanel, function ()
			slot0:closeFurnitrueDesc()
		end, SFX_PANEL)
		onButton(slot0, slot0.maxFrame, function ()
			slot0:closeFurnitrueDesc()
		end, SFX_PANEL)
		onButton(slot0, slot0.maxPanel:Find("ok_btn"), function ()
			slot0:closeFurnitrueDesc()
		end, SFX_PANEL)
	end

	setActive(slot0.descPanelVoiceBtn, slot1:existVoice())
	setActive(slot0.descPanel, true)
	setActive(slot0.miniPanel, false)
	SetActive(slot0.maxFrame, false)

	if slot1:existVoice() then
		onButton(slot0, slot0.descPanelVoiceBtn, function ()
			slot0:playFurnitureVoice(slot0)
		end, SFX_PANEL)
	end

	slot3 = nil

	LoadSpriteAsync("FurnitureIcon/" .. slot1:getConfig("icon"), function (slot0)
		if not IsNil(slot0._tf) then
			slot0.miniIcon.sprite = slot0
		end
	end)

	slot0.miniName.text = shortenString(slot1:getConfig("name"), 6)
	slot0.miniPanel.position = slot0.furnitureModals[slot1.id].Find(slot4, "icon").position


	-- Decompilation error in this vicinity:
	function ()
		setActive(slot0.miniPanel, false)
		setActive(slot0.maxFrame, true)

		if slot0.maxFrame then
			slot0.maxIcon.sprite = slot1
		else
			LoadSpriteAsync("FurnitureIcon/" .. slot2:getConfig("icon"), function (slot0)
				if not IsNil(slot0._tf) then
					slot0.maxIcon.sprite = slot0
				end
			end)
		end

		slot0.maxName.text = shortenString(slot2:getConfig("name"), 6)
		slot0.maxName.maxdate.text = slot2.getConfig("name"):getDate()
		slot0.maxName.maxdate.maxComfortable.text = "+" .. slot2.getConfig("name"):getConfig("comfortable")
		slot0.maxName.maxdate.maxComfortable.maxContent.text = slot2.getConfig("name").getConfig("comfortable"):getConfig("describe")
		slot0.maxName.maxdate.maxComfortable.maxContent.maxApproach.text = slot2.getConfig("name").getConfig("comfortable"):getGainby()
		slot0.maxName.maxdate.maxComfortable.maxContent.maxApproach.maxType.text = slot2.getConfig("name").getConfig("comfortable"):getChineseType()

		pg.UIMgr.GetInstance():BlurPanel(slot0.maxFrame)
	end()
end

slot0.playFurnitureVoice = function (slot0, slot1)
	slot2 = slot1:getVoice()

	function slot3()
		slot0:stopCV()

		slot0.stopCV.currVoice = playSoundEffect(playSoundEffect)
	end

	if slot0.loadedBank then
		slot3()
	else
		pg.CriMgr.GetInstance():LoadCV("furniture", function ()
			slot0 = pg.CriMgr.GetCVBankName(pg.CriMgr.GetCVBankName)

			if pg.CriMgr.GetCVBankName.exited then
				pg.CriMgr.UnloadCVBank(slot0)
			else
				slot2()

				if slot2.currVoice then
					slot1.loadedBank = slot0
				end
			end
		end)
	end
end

slot0.stopCV = function (slot0)
	if slot0.currVoice then
		slot0.currVoice:Stop(true)
	end

	slot0.currVoice = nil
end

slot0.closeFurnitrueDesc = function (slot0)
	if slot0.isOpenDesc then
		slot0:stopCV()

		slot0.isOpenDesc = nil

		setActive(slot0.descPanel, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.maxFrame, slot0.descPanel)
	end
end

slot0.updateFurnitruePos = function (slot0, slot1, slot2)
	slot0:setFurnitureParent(slot1)

	slot0.furnitureModals[slot1.id].localPosition = slot0.getLocalPos(slot1:getPosition())

	if slot2 then
		slot0:createbottomGrid(slot1, slot3)
	end

	if slot1.parent ~= 0 then
		slot4.localPosition = Vector2(slot4.localPosition.x + (slot0.furnitureVOs[slot1.parent].getConfig(slot6, "offset")[1] or 0), slot7.y + (slot8[2] or 0))

		slot4:SetParent(slot0.furnitureModals[slot5]:Find("childs"), true)

		if slot0.maps[slot5] then
			slot0.maps[slot5].afterSortFunc(slot0.maps[slot5].sortedItems)
		end
	end

	slot0:createItem(slot1, slot3.x, slot3.y)
end

slot0.updateFurnitureWithAnim = function (slot0, slot1, slot2, slot3)
	if slot2 == 0 then
		slot0:updateFurnitruePos(slot1)
	else
		function slot4(slot0, slot1)
			return slot0 - slot1.normalized * Vector2.Distance(slot1, slot0) * 0.5 + slot1
		end

		if LeanTween.isTweening(go(slot0.furnitureModals[slot1.id])) then
			LeanTween.cancel(go(slot5))
		end

		LeanTween.moveLocal(go(slot5), slot8, slot2 / 2):setOnComplete(System.Action(function ()
			slot0:removeItem(slot0)
			slot0.removeItem:createItem(slot0.removeItem, slot2.x, slot2.y)
			LeanTween.moveLocal(go(slot3), slot2.y, slot5 / 2)
		end))
	end
end

slot0.removeFurn = function (slot0, slot1)
	slot2 = slot0.furnitureModals[slot1.id]

	function slot3(slot0)
		SetParent(slot0.shipModels[slot0].tf, slot0.floorContain)
		slot0.shipModels[slot0]:setAction("stand2")
	end

	if slot1:hasInterActionShipId() then
		for slot8, slot9 in ipairs(slot4) do
			slot3(slot9)
			slot0.shipModels[slot9]:closeBodyMask()
		end
	end

	if slot1:getSpineId() then
		slot3(slot4)
		slot0.shipModels[slot1:getSpineId()]:clearSpine()
	end

	if slot1:hasStageShip() then
		slot5 = pairs
		slot6 = slot1:getStageShip() or {}

		for slot8, slot9 in slot5(slot6) do
			slot3(slot9)
			slot0.shipModels[slot9]:clearStageInterAction()
		end
	end

	if slot1:hasSpineExtra() then
		for slot7, slot8 in pairs(slot1:getShipExtra()) do
			slot3(slot8)
		end
	end

	slot5 = (slot1:isFloor() and slot0.backyardPoolMgr.POOL_NAME.GRID) or slot0.backyardPoolMgr.POOL_NAME.WALL
	slot6 = pairs
	slot7 = slot0.furnBottomGrids[slot1.id] or {}

	for slot9, slot10 in slot6(slot7) do
		slot0.backyardPoolMgr:Enqueue(slot5, slot10)
	end

	slot0.furnBottomGrids[slot1.id] = nil

	slot0:clearFunriture(slot1)

	slot0.curFurnModal = nil
	slot0.furnitureModals[slot1.id] = nil
	slot0.furnitureVOs[slot1.id] = nil

	if slot0.maps[slot1.id] then
		slot0.maps[slot1.id] = nil
	end
end

slot0.furnitureBeginDrag = function (slot0, slot1)
	if slot0.isDraging then
		return
	end

	slot0.isDraging = true

	if IsNil(slot0.decoratePanelCG) then
		slot0.decoratePanelCG = GetOrAddComponent(GameObject.Find("/UICamera/Canvas/UIMain/BackYardGarnitureUI(Clone)/decoratePanel"), typeof(CanvasGroup))
	end

	slot0.decoratePanelCG.blocksRaycasts = false

	slot0:setPreSelectedParent(slot0.furnitureModals[slot1.id])
	slot0.furnitureModals[slot1.id].SetAsLastSibling(slot2)

	if not slot1:isMapItem() then
		return
	end

	slot2:SetParent(slot0.floorContain, true)
end

slot0.furnitureDrag = function (slot0, slot1, slot2)
	if not slot0.isDraging then
		return
	end

	slot4 = slot0.houseVO:limitWallFurnWidth(slot3, slot2)

	if not slot2:isFloor() and not slot0.houseVO:isLimitWallBound(slot2, slot4) then
		return
	end

	slot5, slot10 = slot0.houseVO:isLegalPos(slot2, slot4)

	slot0:changeConflictGridColor(slot6, slot2, slot0.houseVO:isLocaledAndPutOn(slot2, slot4))
	slot0:setWallModalDir(slot2, slot3)

	slot8 = slot0.getLocalPos(slot4)
	slot9 = slot0.furnitureModals[slot2.id]

	if slot0.houseVO.isLocaledAndPutOn(slot2, slot4) then
		slot9.localPosition = Vector2(slot8.x + slot7:getConfig("offset")[1], slot8.y + slot7.getConfig("offset")[2])
	else
		slot9.localPosition = slot8
	end
end

slot0.furnitureEndDrag = function (slot0, slot1, slot2)
	if not slot0.isDraging then
		return
	end

	slot3 = slot0.furnitureModals[slot2.id]
	slot4 = slot0.houseVO:limitWallFurnWidth(slot1, slot2)

	slot0:changeConflictGridColor({}, slot2)

	if not slot2:isFloor() and not slot0.houseVO:isLimitWallBound(slot2, slot4) then
		slot4 = slot0.houseVO:getWallBound(slot1, slot2)
	end

	if not slot0.houseVO:isLegalPos(slot2, slot4) then
		slot0:setWallModalDir(slot2, slot5)
		LeanTween.moveLocal(go(slot3), Vector3(slot0.getLocalPos(slot5).x, slot0.getLocalPos(slot5).y, 0), 0.1):setOnComplete(System.Action(function ()
			if slot0:hasParent() then
				slot1 = slot1.furnitureVOs[slot0.parent].getConfig(slot0, "offset")
				slot2.localPosition = Vector2(slot0.localPosition.x + slot1[1], slot0.localPosition.y + slot1[2])

				slot2:SetParent(slot1.furnitureModals[slot0.parent].Find(slot3, "childs"), true)
				slot1.maps[slot0.parent].afterSortFunc(slot1.maps[slot0.parent].sortedItems)
			end

			slot1.map.afterSortFunc(slot1.map.sortedItems)
			slot1.map.sortedItems:setPreSelectedParent(slot1.furContain)

			if not slot1.map.sortedItems.setPreSelectedParent:isFloor() then
				slot1:sortWallFurns()
			end

			slot1.decoratePanelCG.blocksRaycasts = true
			true.isDraging = nil
		end))

		return
	end

	slot0:emit(BackyardMainMediator.FURNITURE_POS_CHNAGE, slot2.id, slot4, (slot0.houseVO:isLocaledAndPutOn() and slot5.id) or slot5)
	slot0:setPreSelectedParent(slot0.furContain)

	if not slot2:isFloor() then
		slot0:sortWallFurns()
	end

	if slot2:isMat() then
		slot0:sortAllMat()
	end

	slot0.decoratePanelCG.blocksRaycasts = true
	slot0.isDraging = nil
end

slot0.sortAllMat = function (slot0)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		if slot7:isMat() then
			table.insert(slot2, slot7)
		end
	end

	table.sort(slot2, function (slot0, slot1)
		return slot1:getOccupyGridCount() < slot0:getOccupyGridCount()
	end)
	_.each(slot2, function (slot0)
		if slot0.furnitureModals[slot0.id] then
			slot1:SetAsLastSibling()
		end
	end)
end

slot0.sortWallFurns = function (slot0)
	slot1, slot5, slot3 = slot0.houseVO:sortWallFurns()

	for slot7, slot8 in ipairs(slot2) do
		if not IsNil(slot0.furnitureModals[slot8.id]) then
			slot9:SetAsLastSibling()
		end
	end

	for slot7, slot8 in ipairs(slot1) do
		if not IsNil(slot0.furnitureModals[slot8.id]) then
			slot9:SetAsLastSibling()
		end
	end

	for slot7, slot8 in ipairs(slot3) do
		if not IsNil(slot0.furnitureModals[slot8.id]) then
			slot9:SetAsFirstSibling()
		end
	end
end

slot0.rotateFurn = function (slot0, slot1)
	slot2 = slot0.furnitureModals[slot1.id]

	for slot6, slot7 in pairs(slot1.child) do
		slot0:setFurnitureParent(slot0.furnitureVOs[slot6])
	end

	slot2.localScale = Vector3(-slot2.localScale.x, 1, 1)

	if slot0.rotateId == slot1.id then
		slot0:createItem(slot1, slot1:getPosition().x, slot1.getPosition().y)

		if slot0.preFurnSelected then
			slot0:setPreSelectedParent(slot2)

			slot0.preFurnSelected.anchoredPosition3D = Vector3(0, 0, 0)

			slot0:setPreSelectedParent(slot0.furContain)
		end

		slot0.rotateId = nil
	end
end

slot0.closePreFurnSelected = function (slot0)
	if not IsNil(slot0.preFurnSelected) and not IsNil(slot0.curFurnModal) then
		slot0:setPreSelectedParent(slot0.curFurnModal)

		slot0.preFurnSelected.anchoredPosition3D = Vector3(0, 0, 0)

		SetActive(slot0.preFurnSelected, false)
		SetActive(slot0.curFurnModal:Find("grids"), false)

		slot0.preFurnSelected = nil
		slot0.curFurnModal = nil
	end
end

slot0.setPreSelectedParent = function (slot0, slot1)
	if not IsNil(slot0.preFurnSelected) and not IsNil(slot1) then
		slot0.preFurnSelected:SetParent(slot1, true)
	end
end

slot0.setWallModalDir = function (slot0, slot1, slot2)
	if slot1:isFloor() then
		return
	end

	slot3 = slot0.furnitureModals[slot1.id]
	slot4 = slot0.getSign(BackyardFurnitureVO.isRightWall(slot2))

	if not IsNil(slot0.preFurnSelected) then
		slot0:setPreSelectedParent(slot0.furContain)
	end

	slot3.localScale = Vector3(slot4, 1, 1)

	if not IsNil(slot0.preFurnSelected) then
		slot0:setPreSelectedParent(slot3)

		slot0.preFurnSelected.anchoredPosition3D = Vector3(0, 0, 0)
	end
end

slot0.setFurnitureParent = function (slot0, slot1)
	slot0.furnitureModals[slot1.id]:SetParent((slot1:isFloor() and ((slot1:isMat() and slot0.carpetContain) or slot0.floorContain)) or slot0.wallContain, true)
end

slot0.changeConflictGridColor = function (slot0, slot1, slot2, slot3)
	for slot8, slot9 in pairs(slot4) do
		slot0.changeGridColor(slot9, BackYardConst.BACKYARD_GREEN)
	end

	if slot3 then
		for slot8, slot9 in ipairs(slot4) do
			slot0.changeGridColor(slot9, BackYardConst.BACKYARD_BLUE)
		end
	end

	for slot8, slot9 in pairs(slot1) do
		slot0.changeGridColor(slot4[slot9], BackYardConst.BACKYARD_RED)
	end
end

slot0.getGridTpl = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot2 = (slot1 and slot0.backyardPoolMgr.POOL_NAME.GRID) or slot0.backyardPoolMgr.POOL_NAME.WALL

	SetParent(slot0.backyardPoolMgr:Dequeue((slot1 and slot0.backyardPoolMgr.POOL_NAME.GRID) or slot0.backyardPoolMgr.POOL_NAME.WALL), slot0.furContain)

	return slot0.backyardPoolMgr.Dequeue((slot1 and slot0.backyardPoolMgr.POOL_NAME.GRID) or slot0.backyardPoolMgr.POOL_NAME.WALL)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-7, warpins: 1 ---
	if not slot0.backyardPoolMgr.POOL_NAME.GRID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 2 ---
		slot2 = slot0.backyardPoolMgr.POOL_NAME.WALL
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-20, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

slot0.loadBoatModal = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	PoolMgr.GetInstance():GetSpineChar(slot1:getPrefab(), true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if not IsNil(slot0._tf) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-55, warpins: 1 ---
			slot0.name = "model"
			rtf(slot0).sizeDelta = Vector2.New(200, 500)
			slot1 = GameObject("char_" .. slot1.id)

			slot1:AddComponent(typeof(RectTransform))
			SetParent(slot0, slot1)

			slot2 = BackYardShipModel.New(slot1, slot1)
			slot0.shipModels[slot1.id] = slot2

			slot2:onLoadSlotModel(slot0)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 56-79, warpins: 0 ---
			for slot7, slot8 in pairs(slot3) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-59, warpins: 1 ---
				if slot8.attachment_cusual[1] ~= "" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 60-76, warpins: 1 ---
					ResourceMgr.Inst:getAssetAsync("Effect/" .. slot9, slot9, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-6, warpins: 1 ---
						if not IsNil(slot0._tf) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 7-35, warpins: 1 ---
							slot1 = Object.Instantiate(slot0)
							slot0._attachmentList[#slot0._attachmentList + 1] = slot1

							tf(slot1):SetParent(tf(slot1))

							tf(slot1).localPosition = BuildVector3(slot2.attachment_cusual[2])
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 36-36, warpins: 2 ---
						return
						--- END OF BLOCK #1 ---



					end), true, true)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 77-77, warpins: 2 ---
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 78-79, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 80-80, warpins: 1 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 81-83, warpins: 2 ---
		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 84-85, warpins: 1 ---
			slot2()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 86-86, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.InterActionTransport = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.shipModels[slot1]:InterActionTransport(slot2)

	return
	--- END OF BLOCK #0 ---



end

slot0.InterActionTransportAgain = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.shipModels[slot1]:InterActionTransportAgain(slot2)

	return
	--- END OF BLOCK #0 ---



end

slot0.InterActionTransportEnd = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.shipModels[slot1]:InterActionTransportEnd(furnId)

	return
	--- END OF BLOCK #0 ---



end

slot0.setInterAction = function (slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.shipModels[slot2] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-13, warpins: 1 ---
		slot5:updateBoatVO(slot0.boatVOs[slot2])

		slot6 = slot0.furnitureVOs[slot3]

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-18, warpins: 1 ---
			slot5:updateSpineInterAction(slot6)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-27, warpins: 1 ---
			slot5:updateInterActionPos(slot6, slot4)
			slot5:InterActionSortSibling(slot3)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 28-28, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.setStageInterAction = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.shipModels[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		slot3:updateStageInterAction(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-9, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.clearStageInterAction = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.shipModels[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot2:clearStageInterAction()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateArchInteraction = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.shipModels[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		slot3:updateArchInterAction(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-9, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.clearArchInteration = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.shipModels[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot2:clearArchInterAction()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.clearSpineInteraction = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.shipModels[slot2] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		slot4:clearSpineInteraction(slot3)
		slot4:removeAllActionCB()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.addSpineExtra = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.shipModels[slot2] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		if slot0.furnitureVOs[slot1]:hasTailAction() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-35, warpins: 1 ---
			slot4:endSpineAnimator(slot5, slot3)
			slot4:startSpineAnimator(slot5, slot3)
			slot4:setAction(slot6, 0)
			slot4:addSpineExtra(slot1, slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-51, warpins: 1 ---
			slot6 = slot0.furnitureModals[slot1]

			slot0.shipModels[slot5:getSpineId()].pauseAnim(slot8)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 52-75, warpins: 0 ---
			for slot12, slot13 in ipairs(slot5:getShipExtra()) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 52-55, warpins: 1 ---
				slot14 = slot0.shipModels[slot13]

				if slot13 ~= slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 56-60, warpins: 1 ---
					slot14:pauseAnim(slot12)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 61-71, warpins: 1 ---
					slot14:addSpineExtra(slot1, slot12)
					slot8:registerActionCB(slot13, function (slot0)

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-7, warpins: 1 ---
						slot0:setAction(slot0, 0)

						return
						--- END OF BLOCK #0 ---



					end, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-13, warpins: 1 ---
						slot0:endSpineAnimator(slot0, )
						slot0.endSpineAnimator:startSpineAnimator(slot0.endSpineAnimator, )

						return
						--- END OF BLOCK #0 ---



					end)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 72-73, warpins: 2 ---
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 74-75, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 76-78, warpins: 1 ---
			slot8:resumeAnim()
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 79-79, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 80-80, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.clearSpineExtra = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.shipModels[slot2] and slot0.furnitureVOs[slot1]:getSpineId() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-22, warpins: 1 ---
		slot4:clearSpineExtra(slot1, slot3)
		slot0.shipModels[slot6]:removeActionCB(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-23, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.boatMove = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0.shipModels[slot1]:move(slot2, slot3)

	return
	--- END OF BLOCK #0 ---



end

slot0.boatMoveOnFurniture = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0.shipModels[slot1]:moveOnFurniture(slot2, slot3)

	return
	--- END OF BLOCK #0 ---



end

slot0.cancelShipMove = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.shipModels[slot1]:cancelMove()

	return
	--- END OF BLOCK #0 ---



end

slot0.updateShipPos = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.boatVOs[slot1.id]:setPosition(slot1:getPosition())

	if slot0.shipModels[slot1.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-25, warpins: 1 ---
		slot3:updateBoatVO(slot0.boatVOs[slot1.id])
		slot3:updatePosition(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-26, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.acquireEffect = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.shipModels[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		slot4:acquireEffect(slot2, slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.addBoatInimacyAndMoney = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0.shipModels[slot1.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-18, warpins: 1 ---
		slot2:updateInimacy(slot1:hasInimacy())
		slot2:updateMoney(slot1:hasMoney())
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-29, warpins: 1 ---
		slot0.boatVOs[slot1.id].setInimacy(slot3, slot1.inimacy)
		slot0.boatVOs[slot1.id]:setMoney(slot1.money)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-30, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.applyEffect = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	PoolMgr.GetInstance():GetPrefab("ui/" .. slot2, slot1:getEffectName(), true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		slot0.name = slot0

		setParent(slot0, slot1.effectContains)
		setActive(slot0, true)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.disableEffect = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	if slot0:findTF(slot1:getEffectName(), slot0.effectContains) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-21, warpins: 1 ---
		PoolMgr.GetInstance():ReturnPrefab("ui/" .. slot2, slot2, slot3.gameObject)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-22, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	eachChild(slot0.effectContains, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		PoolMgr.GetInstance():ReturnPrefab("ui/" .. slot1, slot0.gameObject.name, slot0.gameObject)

		return
		--- END OF BLOCK #0 ---



	end)

	if slot0.dragTrigger then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		ClearEventTrigger(slot0.dragTrigger)

		slot0.dragTrigger = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-33, warpins: 2 ---
	pg.DelegateInfo.Dispose(slot0)
	slot0.event:clear()
	slot0:clearUI()
	slot0:closeMsgBox()
	slot0:closeFurnitrueDesc()

	slot0.backyardPoolMgr = nil

	return
	--- END OF BLOCK #1 ---



end

slot0.clearFunriture = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = {
		{
			"grids",
			"childs",
			"mask"
		},
		{
			"drag"
		}
	}

	if slot0.furnitureModals[slot1.id] and slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-21, warpins: 1 ---
		slot4 = _.flatten(slot3)

		eachChild(slot2, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if not table.contains(slot0, go(slot0).name) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-13, warpins: 1 ---
				Destroy(slot0)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-24, warpins: 2 ---
			if table.contains(slot1[1], go(slot0).name) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-27, warpins: 1 ---
				removeAllChildren(slot0)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 28-28, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-31, warpins: 3 ---
	slot0.backyardPoolMgr:Enqueue(slot0.backyardPoolMgr.POOL_NAME.FURNITURE, slot2)

	return
	--- END OF BLOCK #1 ---



end

slot0.clearUI = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.shipModels) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:dispose()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-13, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 14-47, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.furnBottomGrids) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-17, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-45, warpins: 0 ---
		for slot9, slot10 in pairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-22, warpins: 1 ---
			if not IsNil(slot10) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-29, warpins: 1 ---
				if not slot0.furnitureVOs[slot4]:isFloor() or not slot0.backyardPoolMgr.POOL_NAME.GRID then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 35-37, warpins: 2 ---
					slot11 = slot0.backyardPoolMgr.POOL_NAME.WALL
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 38-43, warpins: 2 ---
				slot0.backyardPoolMgr:Enqueue(slot11, slot10)
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 44-45, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 46-47, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 48-54, warpins: 1 ---
	slot1 = {}
	slot2 = {}
	slot3 = {}

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 55-96, warpins: 0 ---
	for slot7, slot8 in pairs(slot0.furnitureModals) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-61, warpins: 1 ---
		if slot0.furnitureVOs[slot7]:hasParent() and not slot9:hasChild() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 67-72, warpins: 1 ---
			table.insert(slot1, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:clearFunriture(slot0.clearFunriture)
				slot0()

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 73-77, warpins: 2 ---
			if slot9:hasParent() and slot9:hasChild() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 83-88, warpins: 1 ---
				table.insert(slot2, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-8, warpins: 1 ---
					slot0:clearFunriture(slot0.clearFunriture)
					slot0()

					return
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 89-93, warpins: 2 ---
				table.insert(slot3, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-8, warpins: 1 ---
					slot0:clearFunriture(slot0.clearFunriture)
					slot0()

					return
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 94-94, warpins: 3 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 95-96, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 97-110, warpins: 1 ---
	seriesAsync({
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			parallelAsync(slot0, slot0)

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			parallelAsync(slot0, slot0)

			return
			--- END OF BLOCK #0 ---



		end,
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			parallelAsync(slot0, slot0)

			return
			--- END OF BLOCK #0 ---



		end
	})

	if not IsNil(slot0.furContain) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 111-125, warpins: 1 ---
		removeAllChildren(slot0.furContain:Find("shadow"))
		setActive(slot0.furContain:Find("ship_grid"), false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 126-130, warpins: 2 ---
	if not IsNil(slot0.carpetContain) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 131-133, warpins: 1 ---
		removeAllChildren(slot0.carpetContain)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 134-138, warpins: 2 ---
	if not IsNil(slot0.wallContain) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 139-141, warpins: 1 ---
		removeAllChildren(slot0.wallContain)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 142-146, warpins: 2 ---
	if not IsNil(slot0.floorContain) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 147-149, warpins: 1 ---
		removeAllChildren(slot0.floorContain)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 150-162, warpins: 2 ---
	slot0.wallPaperModel:dispose()
	slot0.floorPaperModel:dispose()

	if not IsNil(slot0.floorGrid) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 163-166, warpins: 1 ---
		setActive(slot0.floorGrid, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 167-170, warpins: 2 ---
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 171-176, warpins: 0 ---
	for slot7, slot8 in ipairs(slot0._attachmentList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 171-174, warpins: 1 ---
		Object.Destroy(slot8)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 175-176, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 177-182, warpins: 1 ---
	slot0._attachmentList = nil
	slot0.isExist = true

	return
	--- END OF BLOCK #13 ---



end

return slot0
