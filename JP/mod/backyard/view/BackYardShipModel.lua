slot0 = class("BackYardShipModel")
slot1 = 0.5
slot2 = 15
slot3 = require("Mod/BackYard/view/BackYardTool")
slot4 = {
	{
		"tuozhuai2",
		1.4,
		39126
	},
	{
		"walk",
		1.5,
		100005
	},
	{
		"dance",
		10,
		100005
	},
	{
		"walk",
		2,
		100006
	},
	{
		"stand2",
		2,
		100006
	},
	{
		"dance",
		2,
		100006
	}
}

slot0.Ctor = function (slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0.go = slot1
	slot0.tf = tf(slot1)

	slot0:updateBoatVO(slot2)

	slot0.cfg = pg.ship_data_statistics[slot0.boatVO.configId]
	slot0.speed = slot0.cfg.backyard_speed

	LoadAndInstantiateAsync("sfurniture", "modelmask", function (slot0)
		if not slot0.tf then
			return
		end

		SetParent(slot0, slot0.tf)

		slot0.bodyMask = tf(slot0)

		slot0.bodyMask:SetSiblingIndex(0)
		SetActive(slot0, false)
	end, true, true)
end

slot0.updateBoatVO = function (slot0, slot1)
	slot0.boatVO = slot1
end

slot0.onLoadSlotModel = function (slot0, slot1)
	slot0.viewComponent = slot1
	slot2 = slot1:findTF("resources")

	pg.ViewUtils.SetLayer(slot0.tf, Layer.UI)

	slot0.tf.localScale = Vector3(slot0, slot0, 1)
	slot0.model = slot0.tf:Find("model")
	slot0.model.localScale = Vector3(1, 1, 1)
	slot0.floorGrid = slot1.floorContain
	slot0.shipGridContainer = slot1.floorContain.parent:Find("ship_grid")
	slot0.shipGrid = slot0.shipGridContainer:Find("grid")
	slot0.shipGridImg = slot0.shipGrid:GetComponent(typeof(Image))
	slot0.spineAnimUI = slot0.model:GetComponent("SpineAnimUI")

	slot0.spineAnimUI:SetAction("stand2", 0)

	slot0.canvasGroup = GetOrAddComponent(slot0.go, "CanvasGroup")

	slot0:loadChat(findTF(slot2, "chat"))
	slot0:loadClick(findTF(slot2, "click"))
	slot0:loadExp(findTF(slot2, "addition"))
	slot0:loadInimacy(findTF(slot2, "intimacy"))
	slot0:loadMoeny(findTF(slot2, "money"))
	slot0:loadShadow(findTF(slot2, "shadow"), slot3)
	slot0.tf:SetParent(slot1.floorContain, false)
	slot0:updateShadowTF(true)
	slot0:updatePosition(slot0.boatVO:getPosition())
	slot0:updateShadowPos()
	slot0:addBoatDragListenter()

	slot0.actionCallback = {}
end

slot0.showChat = function (slot0, slot1, slot2, slot3, slot4)
	LeanTween.scale(tf(slot1), slot2, 0.5):setEase(LeanTweenType.easeOutBack):setDelay(slot3):setOnComplete(System.Action(function ()
		slot0()
	end))
end

slot0.loadChat = function (slot0, slot1)
	slot0.chatTF = cloneTplTo(slot1, slot0.go)
	slot2 = findTF(slot0.chatTF, "Text")
	slot0.chatTF.localPosition = Vector2(145, 290)
	slot0.chatTF.localScale = Vector3(0, 0, 0)
end

slot0.loadClick = function (slot0, slot1)
	slot0.clickTF = cloneTplTo(slot1, slot0.go)
	slot0.clickTF.localPosition = Vector2(0, 130)
	slot0.clickTF.localScale = Vector2(1, 1, 1)

	onButton(slot0, slot0.clickTF, function ()
		if slot0.boatVO:hasInterActionFurnitrue() then
			return
		end

		if slot0.boatVO:hasSpineInterAction() then
			return
		end

		if slot0.stageId or slot0.archId then
			return
		end

		if slot0.boatVO:hasSpineExtra() then
			return
		end

		playSoundEffect(SFX_BOAT_CLICK)
		playSoundEffect:switchAnimation("touch")

		if playSoundEffect.switchAnimation.inimacyTF.gameObject.activeSelf == true or slot0.moneyTF.gameObject.activeSelf == true then
			return
		end

		setButtonEnabled(slot0.clickTF, false)
		setButtonEnabled:showChat(slot0.chatTF, Vector3(1 / slot1, 1 / slot1), 0, function ()
			slot0:showChat(slot0.chatTF, Vector3(0, 0, 0), 2, function ()
				setButtonEnabled(slot0.clickTF, true)
			end)
		end)
	end)
end

slot0.loadExp = function (slot0, slot1)
	slot0.expTF = cloneTplTo(slot1, slot0.go)
	slot0.moneyAdditionTF = findTF(slot0.expTF, "money")
	slot0.inimacyAdditionTF = findTF(slot0.expTF, "intimacy")
	slot0.expAdditionTF = findTF(slot0.expTF, "exp")
	slot0.expTF.localPosition = Vector2(0, 250)

	slot0:changeInnerDir(1)
end

slot0.updateModelDir = function (slot0)
	if slot0.spineFurniture then
		slot2 = slot0.spineFurniture:hasSpineShipBodyMask()

		if slot0.spineFurniture:getSpineAniScale() then
			slot0.model.localScale = Vector3((slot2 and slot0.spineFurniture.dir == 2 and slot1 * -1) or slot1, 1, 1)
		end

		if slot2 then
			slot0:showBodyMask(slot0.spineFurniture:getSpineShipBodyMask(), slot0.spineFurniture.dir)
		end
	end
end

slot0.updateExpTFScale = function (slot0, slot1)
	slot0.expTF.localScale = Vector3(1 / slot0 * slot1, 1 / slot0, 1)
end

slot0.changeInnerDir = function (slot0, slot1)
	slot0:updateExpTFScale(slot1)

	if slot0.bodyMask and go(slot0.bodyMask).activeSelf then
		tf(slot0.bodyMask).localScale = Vector3(slot1, 1, 1)
	end
end

slot0.loadInimacy = function (slot0, slot1)
	slot0.inimacyTF = cloneTplTo(slot1, slot0.go)
	slot0.inimacyTF.localPosition = Vector2(145, 290)
	slot0.inimacyTF.localScale = Vector2(1 / slot0, 1 / slot0)

	floatAni(slot0.inimacyTF, 20, 1)
	slot0:updateInimacy(slot0.boatVO:hasInimacy())
end

slot0.loadMoeny = function (slot0, slot1)
	slot0.moneyTF = cloneTplTo(slot1, slot0.go)
	slot0.moneyTF.localPosition = Vector2(145, 290)
	slot0.moneyTF.localScale = Vector2(1 / slot0, 1 / slot0)

	floatAni(slot0.moneyTF, 20, 1)
	slot0:updateMoney(slot0.boatVO:hasMoney())
end

slot0.loadShadow = function (slot0, slot1, slot2)
	slot0.shadowTF = cloneTplTo(slot1, slot2)
	slot0.shadowTF.localPosition = slot0.tf.localPosition
	slot0.shadowTF.localScale = Vector2(1, 1)
end

slot0.updateShadowPos = function (slot0)
	if IsNil(slot0.shadowTF) then
		return
	end

	if slot0.archId then
		slot0.shadowTF.localPosition = slot0.turnTransformLocalPos(slot0.tf.localPosition, slot0.viewComponent.furnitureModals[slot0.archId].Find(slot1, "childs"), slot0.floorGrid)
	else
		slot0.shadowTF.localPosition = slot0.tf.localPosition
	end
end

slot0.updateShadowTF = function (slot0, slot1)
	if IsNil(slot0.shadowTF) then
		return
	end

	if slot0.boatVO:hasInterActionFurnitrue() or slot0.boatVO:hasSpineInterAction() or slot0.boatVO:inStageFurniture() then
		setActive(slot0.shadowTF, false)
	else
		setActive(slot0.shadowTF, slot1)
	end
end

slot0.updateBottomGridPos = function (slot0, slot1)
	if slot1 then
		SetActive(slot0.shipGridContainer, true)

		slot0.shipGrid.localPosition = slot0.getLocalPos(slot1)
	end
end

slot0.addBoatDragListenter = function (slot0)
	slot1 = GetOrAddComponent(slot0.go, "EventTriggerListener")
	slot0.dragTrigger = slot1
	slot2 = nil

	slot1:AddBeginDragFunc(function (slot0, slot1)
		if not isAiriJP() and slot0.viewComponent.zoom.pinching then
			return
		end

		if Input.touchCount > 1 then
			return
		end

		slot0.viewComponent.dragShip = slot0

		slot0.viewComponent:enableZoom(false)
		playSoundEffect(SFX_BOAT_DRAG)

		slot1 = slot0.boatVO:getPosition()
		slot0.isMove = nil

		if slot0.boatVO:hasSpineInterAction() then
			slot0:breakSpineAnim()
		end

		if slot0.boatVO:hasSpineExtra() then
			slot0.viewComponent:emit(BackyardMainMediator.ON_CLEAR_SPINR_EXTRA, slot0.boatVO.id, slot0.boatVO.spineExtra)
		end

		if slot0.boatVO:hasInterActionFurnitrue() then
			slot0:clearInterAction()
		end

		slot0.spineAnimUI:SetAction("tuozhuai2", 0)
		slot0:closeBodyMask()
		slot0.viewComponent:emit(BackyardMainMediator.CANCEL_SHIP_MOVE, slot0.boatVO.id)
		slot0:removeItem()
		SetParent(slot0.tf, slot0.floorGrid)
		tf(slot0.go):SetAsLastSibling()
		slot0:changeInnerDir(Mathf.Sign(slot0.tf.localScale.x))
		slot0:changeGridColor(BackYardConst.BACKYARD_GREEN)
		slot0:updateBottomGridPos(slot0.boatVO:getPosition())
		slot0:updateShadowPos()
	end)
	slot1:AddDragFunc(function (slot0, slot1)
		if slot0.viewComponent.dragShip == slot0 then
			tf(slot0.go).localPosition = Vector3(slot1.getLocalPos(slot3).x, slot1.getLocalPos(slot3).y + slot2, 0)

			slot0:updateShadowPos()

			slot5, slot6 = slot0.viewComponent.houseVO:canMoveBoat(slot0.boatVO.id, slot1.getMapPos(slot2))

			slot0:changeGridColor(((slot5 or (slot0.viewComponent.furnitureVOs[slot6] and slot0.viewComponent.furnitureVOs[slot6]:canTriggerInteraction())) and BackYardConst.BACKYARD_GREEN) or BackYardConst.BACKYARD_RED)
			slot0:updateBottomGridPos(slot3)
		end
	end)
	slot1:AddDragEndFunc(function (slot0, slot1)
		if slot0.viewComponent.dragShip == slot0 then
			slot0.viewComponent.dragShip = nil

			slot0.viewComponent:enableZoom(true)
			slot0:endDrag(slot1.change2ScrPos(slot0.floorGrid, slot1.position), slot1.getMapPos(slot2))
			slot0:updateShadowPos()
			playSoundEffect(SFX_BOAT_DRAG)

			if slot0.save then
				slot0.save = nil

				slot0.viewComponent:emit(BackyardMainMediator.SAVE_FURNITURE, false)
			end
		end
	end)
end

slot0.endDrag = function (slot0, slot1, slot2)
	slot4, slot5 = slot0.viewComponent.houseVO.canPutShip(slot3, slot0.boatVO.id, slot2)

	if slot0.viewComponent.houseVO:getArchByPos(slot2) and (slot6:canInterAction() or slot6:canInterActionSpine()) and slot6:canInterActionShipGroup(slot0.boatVO.gruopId) then
		slot0:triggerInterAction(slot1, slot6.id)
	elseif not slot4 then
		slot0:triggerInterAction(slot1, slot5)
	else
		slot0:clearStage()

		tf(slot0.go).localPosition = Vector3(slot0.getLocalPos(slot2).x, slot0.getLocalPos(slot2).y + slot1, 0)
		slot0.isMove = nil

		SetActive(slot0.shipGridContainer, false)
		slot0.spineAnimUI:SetAction("stand2", 0)
		slot0:changeInnerDir(Mathf.Sign(slot0.tf.localScale.x))
		slot0.viewComponent:emit(BackyardMainMediator.END_DRAG_SHIP, slot0.boatVO.id, slot2)
		slot0:updateShadowTF(true)
	end
end

slot0.triggerInterAction = function (slot0, slot1, slot2)
	slot4 = slot0.boatVO
	slot5 = slot0.viewComponent.furnitureVOs[slot2]

	if slot2 and slot5:canInterActionShipGroup(slot4.gruopId) and slot5:isInterActionSpine() and slot5:canInterActionSpine() then
		slot0:clearStage()
		slot0.viewComponent:emit(BackyardMainMediator.INTERACTION_SPINE, slot0.boatVO.id, slot5.id)
	elseif slot2 and slot5:canInterActionShipGroup(slot4.gruopId) and slot5:isInterActionSpine() and slot5:canInterActionSpineExtra() then
		slot0:clearStage()
		slot0.viewComponent:emit(BackyardMainMediator.ON_SPINE_EXTRA, slot4.id, slot2)
	elseif slot2 and slot5:canInterActionShipGroup(slot4.gruopId) and slot5:canInterAction() then
		slot0:clearStage()

		if slot4:hasInterActionFurnitrue() and slot2 == slot4:getInterActionFurnitrueId() then
			slot0:updateInterActionPos(slot5, slot5:getOrderByShipId(slot4.id))
			slot0:InterActionSortSibling(slot2)
		else
			slot0.viewComponent:emit(BackyardMainMediator.INTERACTION, slot4.id, slot2)
		end
	elseif slot2 and slot5:canInterActionShipGroup(slot4.gruopId) and slot5:isStageFurniture() then
		slot0:clearStage()
		slot0.spineAnimUI:SetAction("stand2", 0)
		slot0.viewComponent:emit(BackyardMainMediator.INTERACTION_STAGE, slot0.boatVO.id, slot5.id)
		SetActive(slot0.shipGridContainer, false)
	elseif slot4:hasInterActionFurnitrue() then
		slot0:clearStage()

		slot6 = slot4:getInterActionFurnitrueId()

		slot0:updateInterActionPos(slot3[slot6], slot3[slot6]:getOrderByShipId(slot4.id))
		slot0:InterActionSortSibling(slot6)
	elseif slot4:inStageFurniture() then
		slot0:updateStageInterAction(slot4:getPosition())
		SetActive(slot0.shipGridContainer, false)
	else
		slot6 = nil

		for slot10, slot11 in pairs(slot3) do
			for slot16, slot17 in pairs(slot12) do
				if slot17.x == slot1.x and slot17.y == slot1.y then
					slot6 = slot11

					break
				end
			end

			if slot6 then
				break
			end
		end

		if slot6 and slot6:canInterActionShipGroup(slot4.gruopId) and slot6:isInterActionSpine() and slot6:canInterActionSpine() then
			slot0.viewComponent:emit(BackyardMainMediator.INTERACTION_SPINE, slot0.boatVO.id, slot6.id)
		else
			LeanTween.moveLocal(slot0.go, Vector3(slot0.getLocalPos(slot1).x, slot0.getLocalPos(slot1).y + slot1, 0), 0):setOnComplete(System.Action(function ()
				slot0.isMove = nil

				SetActive(slot0.shipGridContainer, false)
				SetActive:changeGridColor(BackYardConst.BACKYARD_GREEN)
				SetActive.changeGridColor.spineAnimUI:SetAction("stand2", 0)
				SetActive.changeGridColor.spineAnimUI.SetAction.viewComponent:emit(BackyardMainMediator.END_DRAG_SHIP, slot1.id, )
			end))
		end
	end
end

slot0.InterActionSortSibling = function (slot0, slot1)
	slot2 = slot0.viewComponent.furnitureModals[slot1]
	slot5 = slot0.viewComponent.furnitureVOs[slot1].getConfig(slot3, "interAction")
	slot6 = {}
	slot7 = false

	for slot11, slot12 in pairs(slot4) do
		slot13 = nil

		if slot5[slot11][5] and slot5[slot11][5] == BackyardBoatVO.INTERACTION_TYPE_AFTER then
			slot13 = slot2:Find("icon/char_" .. slot12)
			slot7 = true
		else
			slot13 = slot2:Find("char_" .. slot12)
		end

		if slot13 then
			table.insert(slot6, {
				go = slot13,
				order = slot3:getOrderByShipId(slot12) or "",
				x = slot11
			})
		end
	end

	table.sort(slot6, function (slot0, slot1)
		return slot0.x < slot1.x
	end)

	for slot11, slot12 in pairs(slot6) do
		slot12.go:SetAsLastSibling()

		if slot2:Find(BackYardConst.FURNITRUE_MASK_ORDER_NAME .. slot12.order) then
			if slot7 then
				slot13:SetSiblingIndex(2)
			else
				slot13:SetAsLastSibling()
			end
		end
	end
end

slot0.changeGridColor = function (slot0, slot1)
	slot0.shipGridImg.color = slot1
end

slot0.createItem = function (slot0, slot1)
	if not IsNil(slot0.tf) then
		slot2 = nil
		slot3 = (not slot0.archId or slot0.viewComponent:getMap({
			parent = slot0.archId
		})) and (not slot0.stageId or slot0.viewComponent:getMap({
			parent = slot0.stageId
		})) and slot0.viewComponent.map:CreateItem(1, 1, {
			isBoat = true,
			id = slot0.boatVO.id
		})

		slot3:SetPos(slot1.x + 1, slot1.y + 1)
		slot0.tf:SetSiblingIndex((not slot0.archId or slot0.viewComponent.getMap()) and (not slot0.stageId or slot0.viewComponent.getMap()) and slot0.viewComponent.map:InsertChar(slot3))

		slot0.item = slot3
	end
end

slot0.removeItem = function (slot0)
	if slot0.item then
		slot1 = nil

		(not slot0.archId or slot0.viewComponent:getMap({
			parent = slot0.archId
		})) and (not slot0.stageId or slot0.viewComponent:getMap({
			parent = slot0.stageId
		})) and slot0.viewComponent.map:RemoveChar(slot0.item)

		slot0.item = nil
	end
end

slot0.updatePosition = function (slot0, slot1)
	slot0:removeItem()
	slot0:createItem(slot0.boatVO:getPosition())

	slot2 = nil
	slot0.tf.localPosition = Vector3((not slot0.archId or slot0:calcOnFurnitureLPos(slot1, slot0.archId)) and (not slot0.stageId or slot0:calcOnFurnitureLPos(slot1, slot0.stageId)) and slot0.getLocalPos(slot1).x, (not slot0.archId or slot0.calcOnFurnitureLPos(slot1, slot0.archId)) and (not slot0.stageId or slot0.calcOnFurnitureLPos(slot1, slot0.stageId)) and slot0.getLocalPos(slot1).y + slot1, 0)

	slot0:updateShadowTF(true)
	slot0:updateShadowPos()
end

slot0.setAction = function (slot0, slot1)
	slot0.spineAnimUI:SetAction(slot1, 0)
end

slot0.updateInterActionPos = function (slot0, slot1, slot2)
	slot0.print("start interaction..................")
	slot0:removeItem()

	slot3 = slot0.viewComponent.furnitureModals[slot1.id]
	slot4, slot5, slot6, slot7, slot8, slot9 = slot1:getInterActionData(slot2)

	if slot9 then
		slot0:showBodyMask(slot9, slot1.dir)
	end

	SetParent(slot0.tf, (slot8 and slot8 == BackyardBoatVO.INTERACTION_TYPE_AFTER and slot3:Find("icon")) or slot3)

	if slot6 or {
		1,
		1
	}[3] then
		slot0.tf.localScale = Vector3(slot3.localScale.x * -1 * slot1, slot1, 1)

		slot0:updateExpTFScale(-1)
	elseif slot1:getConfig("dir") == 1 and slot3.localScale.x < 0 then
		slot0.tf.localScale = Vector3(1 * slot1, slot1 * slot11[2], 1)
	else
		slot0.tf.localScale = Vector3(slot1 * slot11[1], slot1 * slot11[2], 1)

		slot0:updateExpTFScale(slot3.localScale.x * slot11[1])
	end

	if slot7 then
		slot12 = slot3:Find(BackYardConst.FURNITRUE_MASK_ORDER_NAME .. slot2)

		setActive(slot12, true)
		slot12:SetAsLastSibling()
	end

	slot0.tf.anchoredPosition = Vector3(slot5[1], slot5[2], 0)

	slot0.spineAnimUI:SetAction(slot4, 0)
	slot0:updateShadowTF(false)
	slot0:updateShadowPos()

	slot0.isMove = nil

	SetActive(slot0.shipGridContainer, false)
end

slot0.clearInterAction = function (slot0)
	slot0.print("clear interaction.............")

	if slot0.viewComponent.furnitureModals[slot0.boatVO:getInterActionFurnitrueId()]:Find(BackYardConst.FURNITRUE_MASK_ORDER_NAME .. slot0.viewComponent.furnitureVOs[slot0.boatVO.getInterActionFurnitrueId()].getOrderByShipId(slot3, slot0.boatVO.id)) then
		setActive(slot5, false)
	end
end

slot0.updateSpineInterAction = function (slot0, slot1)
	SetActive(slot0.shipGridContainer, false)
	slot0.print(" start spine interaciton...............")
	slot0:removeItem()

	slot0.spineFurniture = slot1
	slot2 = slot0.viewComponent.furnitureModals[slot1.id]

	if slot1:hasSpineShipBodyMask() then
		slot0:showBodyMask(slot1:getSpineShipBodyMask(), slot1.dir)
	end

	slot0:changeInnerDir(slot2.localScale.x)
	slot0:updateModelDir()
	slot0:updateShadowTF(false)
	SetParent(slot0.tf, slot2, true)

	slot0.tf.localScale = Vector3(slot1, slot1, 1)

	if slot1:getSpineAniPos() then
		slot0.tf.anchoredPosition = slot3
	end

	slot4 = slot1:getSpineAnims()
	slot5 = slot2:Find(BackYardConst.FURNITRUE_MASK_NAME)
	slot7 = 0
	slot0.roles = {}
	slot0.breakActionName = slot1:getBreakAnim()

	table.insert(slot0.roles, slot0.spineAnimUI)
	table.insert(slot0.roles, GetOrAddComponent(slot2:Find("icon/spine"), typeof(SpineAnimUI)))

	if slot1:hasSpineMask() then
		slot7 = slot5:GetSiblingIndex()

		SetActive(slot5, true)
		slot5:SetAsLastSibling()
		table.insert(slot0.roles, GetOrAddComponent(slot5:Find("spine"), typeof(SpineAnimUI)))
	end

	if slot1:hasTailAction() then
		slot0.viewComponent.blockEvent = true
	end

	function slot9()
		if slot0:hasAnimator() then
			slot1:startSpineAnimator(slot1.startSpineAnimator)
		end

		if slot0:isFollowFurnitrueAnim() then
			slot1:playAnimsFollowFurniture(slot1.playAnimsFollowFurniture)
		else
			slot1:playAnims(slot1.playAnims)
		end
	end

	if slot1:getPreheatAnim() then
		slot0:playPreHeatAnim(slot1, slot10, slot9)
	else
		slot9()
	end
end

slot0.playPreHeatAnim = function (slot0, slot1, slot2, slot3)
	setActive(slot0.tf, false)
	slot0.roles[2].SetActionCallBack(slot4, function (slot0)
		if slot0 == "finish" then
			slot0:SetActionCallBack(nil)
			slot0.SetActionCallBack()
			setActive(slot0.tf, true)
		end
	end)
	slot0.roles[2]:SetAction(slot2, 0)
end

slot0.playAnimsFollowFurniture = function (slot0, slot1)
	slot2 = slot1:getSpineAnims()
	slot3 = slot0.roles[2]
	slot4 = nil

	function slot5(slot0)
		if slot0 > #slot0 then
			slot1:SetActionCallBack(nil)

			slot1, slot2 = slot1:isLoopSpineInterAction()

			if slot1 then
				if slot2 == BackyardFurnitureVO.INTERACTION_LOOP_TYPE_ALL then
					slot3()
				elseif slot2 == BackyardFurnitureVO.INTERACTION_LOOP_TYPE_LAST_ONE and slot2:hasAnimator() then
					slot4:endSpineAnimator(slot2)
					slot4:setSpineAnimtorParent(slot2)
				end
			elseif slot2:hasTailAction() then
				slot4.viewComponent.blockEvent = nil

				nil:playTailActions(slot2)
			else
				slot4:clearSpine()
				slot4:updateShadowTF(true)
				slot4:updateShadowPos()
				slot4.viewComponent:emit(BackyardMainMediator.ADD_BOAT_MOVE, slot4.boatVO.id, true)
			end
		else
			if type(slot0[slot0][1]) == "table" then
				slot1 = slot1[math.random(1, #slot1)]
			end

			slot1:SetAction(slot1, 0)

			if slot4.roles[1] then
				slot4.roles[1]:SetAction(slot1, 0)
			end

			if slot4.roles[3] then
				slot4.roles[3]:SetAction(slot1, 0)
			end

			if slot4.bodyMask then
				slot4.bodyMask:GetComponent(typeof(Image)).enabled = not slot0[slot0][2]
			end

			slot4:callActionCB("update", slot1)
		end
	end


	-- Decompilation error in this vicinity:
	function ()
		if slot0:hasAnimator() then
			slot1:endSpineAnimator(slot1.endSpineAnimator)
			slot1:startSpineAnimator(slot1.startSpineAnimator)
		end

		slot1:callActionCB("end")

		slot0 = 1

		local function slot3(slot0)
			if slot0 == "finish" then

				-- Decompilation error in this vicinity:
				slot0 + 1(
				-- Decompilation error in this vicinity:
				slot0 + 1)
			end
		end

		"end":SetActionCallBack(slot3)
		slot3(1)
	end()
end

slot0.pauseAnim = function (slot0)
	for slot4, slot5 in pairs(slot0.roles) do
		slot5:SetActionCallBack(nil)
		slot5:SetAction(slot0:getSpineNormalAction(slot5), 0)
	end

	slot0:endSpineAnimator(slot0.spineFurniture)
end

slot0.registerActionCB = function (slot0, slot1, slot2, slot3)
	slot0.actionCallback[slot1] = {
		updateCb = slot2,
		endCb = slot3
	}
end

slot0.removeAllActionCB = function (slot0)
	slot0.actionCallback = {}
end

slot0.removeActionCB = function (slot0, slot1)
	slot0.actionCallback[slot1] = nil
end

slot0.callActionCB = function (slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.actionCallback) do
		if slot1 == "update" then
			slot7.updateCb(slot2)
		elseif slot1 == "end" then
			slot7.endCb(slot2)
		end
	end
end

slot0.resumeAnim = function (slot0)
	if slot0.spineFurniture:isFollowFurnitrueAnim() then
		slot0:playAnimsFollowFurniture(slot1)
	else
		slot0:playAnims(slot1)
	end
end

slot0.playAnims = function (slot0, slot1)
	slot2 = slot1:getSpineAnims()
	slot3 = 0
	slot4, slot5, slot6, slot7 = nil

	function slot7(slot0)
		slot0:SetActionCallBack(nil)

		slot1, slot2 = slot0:isLoopSpineInterAction()

		if not slot1 then
			slot0:SetAction(slot1:getSpineNormalAction(slot0), 0)
		end

		if slot2 == #slot1.roles then
			if slot1 then
				slot1:callActionCB("end")

				if slot2 == BackyardFurnitureVO.INTERACTION_LOOP_TYPE_ALL then
					slot3()
				elseif slot2 == BackyardFurnitureVO.INTERACTION_LOOP_TYPE_LAST_ONE and slot0:hasAnimator() then
					slot1:endSpineAnimator(slot0)
					slot1:setSpineAnimtorParent(slot0)
				end
			elseif slot0:hasTailAction() then
				slot1.viewComponent.blockEvent = nil

				slot1:playTailActions(slot0)
			else
				slot1:clearSpine()
				slot1:updateShadowTF(true)
				slot1:updateShadowPos()
				slot1.viewComponent:emit(BackyardMainMediator.ADD_BOAT_MOVE, slot1.boatVO.id, true)
			end
		end
	end

	function slot6(slot0, slot1)
		if slot1 > #slot0 then
			slot1 = 
			-- Decompilation error in this vicinity:
			slot1 + 1


			-- Decompilation error in this vicinity:
			slot1 + 1(slot0)
		else
			slot3(slot0, slot1, function ()
				slot0 = slot0 + 1

				slot1(slot2, slot1)
			end)
		end
	end

	function slot5(slot0, slot1, slot2)
		if type(slot0[slot1][1]) == "table" then
			slot3 = slot3[math.random(1, #slot3)]
		end

		slot1:callActionCB("update", slot3)

		if slot0 == slot1.roles[1] and slot0[slot1][3] then
			slot3 = slot0[slot1][3]
		end

		if slot0 == slot1.roles[1] and slot2:getUniqueShipAction(slot3, slot1.boatVO.skinId) then
			slot3 = slot4
		end

		slot0:SetAction(slot3, 0)

		if _.detect(slot3, function (slot0)
			return slot0[1] == slot0 and slot1.id == slot0[3]
		end) then
			slot5 = slot4[2]

			if slot1.timer[slot0] then
				slot1.timer[slot0]:Stop()

				slot1.timer[slot0] = nil
			end

			slot1.timer[slot0] = Timer.New(function ()
				slot0.timer[slot1]:Stop()

				slot0.timer[slot1].Stop.timer[slot0.timer[slot1]] = 
				-- Decompilation error in this vicinity:
				nil


				-- Decompilation error in this vicinity:
				nil()
			end, slot5, 1)

			slot1.timer[slot0]:Start()
		else
			slot0:SetActionCallBack(function (slot0)
				if slot0 == "finish" then
					slot0:SetActionCallBack(nil)
					slot0.SetActionCallBack()
				end
			end)
		end
	end

	slot0.timer = {}


	-- Decompilation error in this vicinity:
	function ()
		if slot0:hasAnimator() then
			slot1:endSpineAnimator(slot1.endSpineAnimator)
			slot1:startSpineAnimator(slot1.startSpineAnimator)
		end

		slot2 = 0

		for slot3, slot4 in pairs(slot1.roles) do
			slot3(slot4, 1, function ()
				slot0 = slot0 + 1

				slot1(slot2, slot1)
			end)
		end
	end()
end

slot0.playTailActions = function (slot0, slot1)
	slot2 = slot1:getTailAction()

	for slot6, slot7 in pairs(slot0.roles) do
		slot7:SetAction(slot2, 0)
	end
end

slot0.startSpineAnimator = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot2 = slot2 or 0
	slot0.animtorNameIndex = slot0.animtorNameIndex or math.random(1, #slot1:getAnimtorControlName(slot2 or 0))
	slot6 = slot0.viewComponent.furnitureModals[slot1.id]:Find(slot0.animtorNameIndex or math.random(1, #slot1.getAnimtorControlName(slot2 or 0)))
	slot7 = slot6:GetComponent(typeof(Animator))

	SetParent(slot0.tf, slot6)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	slot2 = 0
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-14, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 15-19, warpins: 1 ---
	slot5 = math.random(1, #slot1.getAnimtorControlName(slot2 or 0))

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 20-44, warpins: 2 ---
	if slot1:hasAnimatorMask() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-74, warpins: 1 ---
		slot8 = slot1:getAnimatorMaskConfig()
		slot9 = slot3:Find("mask")
		slot9.sizeDelta = Vector2(slot8[1][1], slot8[1][2])
		slot9.anchoredPosition = Vector3(slot8[2][1], slot8[2][2], 0)

		setActive(slot9, true)
		SetParent(slot6, slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 75-82, warpins: 2 ---
	if slot6:GetComponent(typeof(DftAniEvent)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 83-92, warpins: 1 ---
		slot9 = 1

		slot8:SetTriggerEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			if slot0.localScale.x < 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-12, warpins: 1 ---
				slot1 = -1

				slot2:changeInnerDir(1)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-13, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot8:SetEndEvent(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 == -1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-9, warpins: 1 ---
				slot1:changeInnerDir(-1)

				slot0 = 1
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-10, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 93-98, warpins: 2 ---
	setActive(slot6, true)

	return
	--- END OF BLOCK #6 ---



end

slot0.endSpineAnimator = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.animtorNameIndex then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-6, warpins: 2 ---
	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		slot2 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-9, warpins: 2 ---
	if slot1 and slot1:hasAnimator() and slot0.viewComponent.furnitureModals[slot1.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-31, warpins: 1 ---
		slot4 = nil
		slot5 = slot1:getAnimtorControlGoName(slot2, slot0.animtorNameIndex)

		if slot1:hasAnimatorMask() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-51, warpins: 1 ---
			setActive(slot6, false)
			SetParent(slot3:Find("mask/" .. slot5), slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-56, warpins: 1 ---
			slot4 = slot3:Find(slot5)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 57-64, warpins: 2 ---
		if slot4:GetComponent(typeof(DftAniEvent)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 65-72, warpins: 1 ---
			slot6:SetTriggerEvent(nil)
			slot6:SetTriggerEvent(nil)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 73-76, warpins: 2 ---
		setActive(slot4, false)
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 77-79, warpins: 4 ---
	slot0.animtorNameIndex = nil

	return
	--- END OF BLOCK #3 ---



end

slot0.setSpineAnimtorParent = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 and slot1:hasAnimator() and slot0.viewComponent.furnitureModals[slot1.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		SetParent(slot0.tf, slot2, true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.breakSpineAnim = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.roles and #slot0.roles > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-14, warpins: 1 ---
		slot2 = 0

		function slot3(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-23, warpins: 1 ---
			slot0 + 1.SetAction(slot0, slot1, 0)
			slot0 + 1.SetActionCallBack(slot0, nil)

			if slot0 + 1 == #slot1.roles then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-30, warpins: 1 ---
				slot1:clearSpine()

				if slot1.clearSpine then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 31-32, warpins: 1 ---
					slot2()
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 33-33, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-37, warpins: 0 ---
		for slot7, slot8 in pairs(slot0.roles) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-21, warpins: 1 ---
			slot8:SetActionCallBack(nil)

			if slot0.breakActionName then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-31, warpins: 1 ---
				slot8:SetAction(slot0.breakActionName, 0)
				slot8:SetActionCallBack(function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-2, warpins: 1 ---
					if slot0 == "finish" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 3-5, warpins: 1 ---
						slot0(slot0)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 6-6, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 32-34, warpins: 1 ---
				slot3(slot8)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 35-35, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 36-37, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 38-38, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 39-40, warpins: 2 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-42, warpins: 1 ---
		slot1()
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 43-44, warpins: 3 ---
	--- END OF BLOCK #2 ---



end

slot0.getSpineNormalAction = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot1 == slot0.spineAnimUI then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		return "stand2"
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-9, warpins: 1 ---
		if slot0.spineFurniture then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-15, warpins: 1 ---
			slot2, slot3 = slot0.spineFurniture:getSpineName()

			if not slot3 or not slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-18, warpins: 2 ---
				slot4 = "normal"
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 19-19, warpins: 2 ---
			return slot4
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-21, warpins: 3 ---
	return "stand2"
	--- END OF BLOCK #1 ---



end

slot0.clearSpine = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0.viewComponent:emit(BackyardMainMediator.CLEAR_SPINE, slot0.boatVO.id)

	return
	--- END OF BLOCK #0 ---



end

slot0.clearSpineInteraction = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0.print("clear spine interaction.............")

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-49, warpins: 0 ---
	for slot5, slot6 in pairs(slot0.roles) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-23, warpins: 1 ---
		slot6:SetActionCallBack(nil)
		slot6:SetAction(slot0:getSpineNormalAction(slot6), 0)

		if slot5 == 3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-32, warpins: 1 ---
			setActive(tf(go(slot6)).parent, false)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-35, warpins: 2 ---
		if slot0.timer and slot0.timer[slot6] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-47, warpins: 1 ---
			slot0.timer[slot6]:Stop()

			slot0.timer[slot6] = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 48-49, warpins: 4 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 50-71, warpins: 1 ---
	slot0.roles = {}
	slot0.model.localScale = Vector3(1, 1, 1)

	slot0:endSpineAnimator(slot0.spineFurniture)
	SetParent(slot0.tf, slot0.viewComponent.floorContain, true)

	if slot0.spineFurniture and slot0.spineFurniture:getSpineAniPos() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 78-87, warpins: 1 ---
		slot0.tf.localPosition = slot0.getLocalPos(slot0.spineFurniture:getSpineAinTriggerPos())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 88-110, warpins: 3 ---
	slot0:closeBodyMask()

	slot0.spineFurniture = nil
	slot0.breakActionName = nil
	slot0.tf.localScale = Vector3(slot1, slot1, 1)
	slot0.tf.eulerAngles = Vector3(0, 0, 0)
	slot0.save = slot1

	return
	--- END OF BLOCK #3 ---



end

slot0.updateStageInterAction = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = slot0.boatVO:getStageId()

	if slot1 and slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-51, warpins: 1 ---
		slot0.isMove = false

		slot0:removeItem()

		slot0.stageId = slot2

		SetParent(slot0.tf, slot5)
		slot0:createItem(slot0.boatVO:getPosition())

		slot0.tf.localPosition = slot0:calcOnFurnitureLPos(slot1, slot0.stageId)

		slot0.spineAnimUI:SetAction("stand2", 0)

		if slot0.viewComponent.maps[slot2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-60, warpins: 1 ---
			slot0.viewComponent.maps[slot3].afterSortFunc(slot0.viewComponent.maps[slot3].sortedItems)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 61-73, warpins: 2 ---
		slot0.viewComponent:emit(BackyardMainMediator.ADD_MOVE_FURNITURE, slot0.boatVO.id, slot3)
		slot0:updateShadowTF(false)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 74-74, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.clearStageInterAction = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.stageId = nil

	SetParent(slot0.tf, slot0.floorGrid)

	return
	--- END OF BLOCK #0 ---



end

slot0.clearStage = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.stageId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-11, warpins: 1 ---
		slot0.viewComponent:emit(BackyardMainMediator.CLEAR_STAGE_INTERACTION, slot0.boatVO.id)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateArchInterAction = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:removeItem()

	if slot0.nextPosition then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-12, warpins: 1 ---
		slot0.targetLPosition = slot0:calcOnFurnitureLPos(slot0.nextPosition, slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-31, warpins: 2 ---
	slot0.archId = slot1

	SetParent(slot0.tf, slot0.viewComponent.furnitureModals[slot1].Find(slot2, "childs"), true)

	if slot0.viewComponent.furnitureModals[slot1]:Find(BackYardConst.ARCH_MASK_NAME) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-38, warpins: 1 ---
		slot3:SetAsLastSibling()
		setActive(slot3, true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 39-46, warpins: 2 ---
	slot0:createItem(slot0.boatVO:getPosition())

	return
	--- END OF BLOCK #2 ---



end

slot0.clearArchInterAction = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:removeItem()

	if slot0.nextPosition then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-9, warpins: 1 ---
		if slot0.stageId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-16, warpins: 1 ---
			slot0.targetLPosition = slot0:calcOnFurnitureLPos(slot0.nextPosition, slot0.stageId)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-21, warpins: 1 ---
			slot0.targetLPosition = slot0.getLocalPos(slot0.nextPosition)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 22-24, warpins: 3 ---
	if slot0.stageId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-37, warpins: 1 ---
		SetParent(slot0.tf, slot0.viewComponent.furnitureModals[slot0.stageId].Find(slot1, "childs"), true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-42, warpins: 1 ---
		SetParent(slot0.tf, slot0.floorGrid, true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 43-53, warpins: 2 ---
	if slot0.viewComponent.furnitureModals[slot0.archId]:Find(BackYardConst.ARCH_MASK_NAME) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-57, warpins: 1 ---
		setActive(slot2, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 58-67, warpins: 2 ---
	slot0.archId = nil

	slot0:createItem(slot0.boatVO:getPosition())

	return
	--- END OF BLOCK #3 ---



end

slot0.calcOnFurnitureLPos = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	return slot0.turnTransformLocalPos(slot0.getLocalPos(slot1), slot0.floorGrid, slot0.viewComponent.furnitureModals[slot2].Find(slot3, "childs"))
	--- END OF BLOCK #0 ---



end

slot0.moveOnFurniture = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot4 = slot0.stageId
	slot5 = nil

	if slot0.archId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-12, warpins: 1 ---
		slot5 = slot0:calcOnFurnitureLPos(slot1, slot0.archId)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-18, warpins: 1 ---
		slot5 = slot0:calcOnFurnitureLPos(slot1, slot0.stageId)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-26, warpins: 2 ---
	slot0:startMove(slot5, slot1, slot2, slot3)

	return
	--- END OF BLOCK #1 ---



end

slot0.move = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot4 = nil

	if slot0.archId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		slot4 = slot0:calcOnFurnitureLPos(slot1, slot0.archId)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 1 ---
		slot4 = slot0.getLocalPos(slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-24, warpins: 2 ---
	slot0:startMove(slot4, slot1, slot2, slot3)

	return
	--- END OF BLOCK #1 ---



end

slot0.startMove = function (slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot5 = math.floor(1 / slot0.speed)
	slot0.nextPosition = slot2
	slot0.targetLPosition = slot1

	if not slot0.isMove then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-18, warpins: 1 ---
		slot0.spineAnimUI:SetAction("walk", 0)

		slot0.isMove = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-28, warpins: 2 ---
	slot7 = slot0.getSign

	if (slot2.x >= slot0.boatVO:getPosition().x or slot2.y ~= slot6.y) and (slot2.x ~= slot6.x or slot6.y >= slot2.y) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-42, warpins: 2 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-43, warpins: 2 ---
		slot8 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 44-48, warpins: 2 ---
	slot7 = slot7(slot8)
	slot8 = 1

	if slot0.stageId then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-54, warpins: 1 ---
		slot8 = slot0.viewComponent.furnitureModals[slot0.stageId].localScale.x
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 55-90, warpins: 2 ---
	slot0.tf.localScale = Vector3(slot1 * slot7 * slot8, slot1, 1)

	slot0:changeInnerDir(slot7)

	slot0.moveNextTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.moveNextTimer then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-12, warpins: 1 ---
			slot0.moveNextTimer:Stop()

			slot0.moveNextTimer.Stop.moveNextTimer = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-28, warpins: 2 ---
		slot0.viewComponent:emit(BackyardMainMediator.ON_HALF_MOVE, slot0.boatVO.id, slot0.viewComponent)

		if slot0.viewComponent.emit.targetLPosition ~= BackyardMainMediator.ON_HALF_MOVE then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-37, warpins: 1 ---
			LeanTween.cancel(slot0.go)
			slot3(slot0.targetLPosition)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 38-47, warpins: 2 ---
		slot0:removeItem()
		slot0.removeItem:createItem(slot0.removeItem)

		return
		--- END OF BLOCK #2 ---



	end, slot5 / 2, 1)

	slot0.moveNextTimer:Start()

	slot0.shadowTF.localScale = Vector2(slot7, 1)


	-- Decompilation error in this vicinity:
	function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-35, warpins: 1 ---
		slot0.shadowTF.localScale = Vector2(slot0.shadowTF, 1)

		LeanTween.moveLocal(slot0.go, Vector3(slot0.x, slot0.y + slot2, 0), ):setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			slot0:updateShadowPos()

			return
			--- END OF BLOCK #0 ---



		end)):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-13, warpins: 1 ---
				slot1.spineAnimUI:SetAction("stand2", 0)

				slot1.spineAnimUI.isMove = nil
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-16, warpins: 2 ---
			if slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-18, warpins: 1 ---
				slot2()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 19-19, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end(slot1)

	return
	--- END OF BLOCK #3 ---



end

slot0.cancelMove = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.moveNextTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.moveNextTimer:Stop()

		slot0.moveNextTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-15, warpins: 2 ---
	if LeanTween.isTweening(slot0.go) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-19, warpins: 1 ---
		LeanTween.cancel(slot0.go)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-22, warpins: 2 ---
	if slot0.isMove then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-30, warpins: 1 ---
		slot0.spineAnimUI:SetAction("stand2", 0)

		slot0.isMove = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-34, warpins: 2 ---
	slot0:updateShadowPos()

	return
	--- END OF BLOCK #3 ---



end

slot0.acquireEffect = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-8, warpins: 1 ---
	if IsNil(slot0.expTF) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-14, warpins: 1 ---
	slot3 = nil

	if slot2 == BackYardConst.ADDITION_TYPE_MONEY then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		slot3 = slot0.moneyAdditionTF
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-20, warpins: 1 ---
		if slot2 == BackYardConst.ADDITION_TYPE_INTIMACY then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-26, warpins: 1 ---
			slot3 = slot0.inimacyAdditionTF
			slot1 = ""

			slot0:playIntimacyEffect()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-30, warpins: 1 ---
			if slot2 == BackYardConst.ADDITION_TYPE_EXP then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-32, warpins: 1 ---
				slot3 = slot0.expAdditionTF
				slot1 = ""
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 33-38, warpins: 4 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 39-47, warpins: 0 ---
	for slot7 = 0, slot0.expTF.childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-47, warpins: 2 ---
		SetActive(slot0.expTF:GetChild(slot7), false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 48-83, warpins: 1 ---
	setActive(slot3, true)
	setText(findTF(slot3, "Text"), slot1)
	LeanTween.cancel(slot0.expTF.gameObject)
	LeanTween.moveY(rtf(slot0.expTF), slot0.expTF.localPosition.y + 110, 1.2):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		setActive(setActive, false)

		slot1.expTF.localPosition = false

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 84-84, warpins: 2 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 85-85, warpins: 2 ---
	--- END OF BLOCK #7 ---



end

slot0.playIntimacyEffect = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.hasEffect then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-22, warpins: 1 ---
	slot0.hasEffect = true

	ResourceMgr.Inst:getAssetAsync("Effect/Heart", "", UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-54, warpins: 1 ---
		slot1 = Instantiate(slot0)

		pg.ViewUtils.SetLayer(tf(slot1), Layer.UI)
		tf(slot1):SetParent(slot0.tf, false)

		tf(slot1).localPosition = Vector3(0, 200, -100)
		tf(slot1).localScale = Vector3(100, 100, 100)
		slot0.removeEffectTimer = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			Destroy(Destroy)

			slot0 = nil

			slot1.removeEffectTimer:Stop()

			slot1.removeEffectTimer.removeEffectTimer = nil
			nil.hasEffect = nil

			return
			--- END OF BLOCK #0 ---



		end, 2, 1)

		slot0.removeEffectTimer:Start()

		return
		--- END OF BLOCK #0 ---



	end), true, true)

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-23, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

slot0.updateInimacy = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	SetActive(slot0.inimacyTF, slot1)
	onButton(slot0, slot0.inimacyTF, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if not slot0.boatVO:hasInterActionFurnitrue() and not slot0.boatVO:hasSpineInterAction() and not slot0.boatVO:hasSpineExtra() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-26, warpins: 1 ---
			slot0:switchAnimation("motou")
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-37, warpins: 4 ---
		slot0.viewComponent:emit(BackyardMainMediator.ADD_INTIMACY, slot0.boatVO.id)

		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateMoney = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	SetActive(slot0.moneyTF, slot1)
	onButton(slot0, slot0.moneyTF, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if not slot0.boatVO:hasInterActionFurnitrue() and not slot0.boatVO:hasSpineInterAction() and not slot0.boatVO:hasSpineExtra() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-26, warpins: 1 ---
			slot0:switchAnimation("motou")
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-37, warpins: 4 ---
		slot0.viewComponent:emit(BackyardMainMediator.ADD_MONEY, slot0.boatVO.id)

		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

slot0.switchAnimation = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.isAnim then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-32, warpins: 1 ---
	slot0.isAnim = true
	slot0.canvasGroup.blocksRaycasts = false

	slot0.viewComponent:emit(BackyardMainMediator.CANCEL_SHIP_MOVE, slot0.boatVO.id)
	slot0.spineAnimUI:SetAction(slot1, 0)

	slot0.isMove = nil

	slot0.spineAnimUI:SetActionCallBack(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 == "finish" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-32, warpins: 1 ---
			slot0.spineAnimUI:SetAction("stand2", 0)
			slot0.viewComponent:emit(BackyardMainMediator.ADD_BOAT_MOVE, slot0.boatVO.id)

			slot0.isAnim = false
			slot0.canvasGroup.blocksRaycasts = true

			slot0.spineAnimUI:SetActionCallBack(nil)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-33, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 33-33, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

slot0.addSpineExtra = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-53, warpins: 1 ---
	SetActive(slot0.shipGridContainer, false)
	slot0:removeItem()
	slot0:updateShadowTF(false)

	slot5 = slot0.viewComponent.furnitureVOs[slot1].getSpineExtraConfig(slot4, slot2)

	SetParent(slot0.tf, slot3, true)

	slot0.tf.localScale = Vector3(slot0 * slot5[3][1], slot0 * slot5[3][2], 1)
	slot0.tf.anchoredPosition = Vector3(slot5[2][1], slot5[2][2], 0)

	if slot0.viewComponent.furnitureVOs[slot1]:hasAnimator() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-58, warpins: 1 ---
		slot0:startSpineAnimator(slot4, slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 59-64, warpins: 2 ---
	if slot4:getSpineExtraBodyMask(slot2) ~= nil and #slot6 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 69-72, warpins: 1 ---
		slot0:showBodyMask(slot6)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 73-73, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.clearSpineExtra = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	SetParent(slot0.tf, slot0.viewComponent.floorContain, true)

	slot3 = slot0.viewComponent.furnitureModals[slot1]

	slot0:endSpineAnimator(slot4, slot2)

	if slot0.viewComponent.furnitureVOs[slot1]:getSpineExtraBodyMask(slot2) ~= nil and #slot5 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-30, warpins: 1 ---
		slot0:closeBodyMask()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-38, warpins: 3 ---
	slot0.tf.eulerAngles = Vector3(0, 0, 0)

	return
	--- END OF BLOCK #1 ---



end

slot0.showBodyMask = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot3 = slot1[1]
	slot4 = slot1[2][1]
	slot5 = slot1[2][2]

	if slot1[3] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-22, warpins: 1 ---
		slot0.bodyMask:GetComponent(typeof(Image)).sprite = LoadSprite("furniture/" .. slot1[3])
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-31, warpins: 1 ---
		slot0.bodyMask:GetComponent(typeof(Image)).sprite = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 32-34, warpins: 2 ---
	if not slot1[4] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-35, warpins: 1 ---
		slot6 = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 36-37, warpins: 2 ---
	if slot2 ~= 1 or not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-40, warpins: 2 ---
		slot7 = slot6
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 41-61, warpins: 2 ---
	slot0.isShowBodyMask = true

	setActive(slot0.bodyMask, true)

	tf(slot0.bodyMask).localPosition = Vector3(slot7[1], slot7[2], 0)
	slot8 = tf(slot0.model)
	slot9 = Vector3

	if slot2 ~= 1 or not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-64, warpins: 2 ---
		slot10 = -1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 65-84, warpins: 2 ---
	slot8.localPosition = slot9(-1 * slot10 * slot7[1], -1 * slot7[2], 0)
	rtf(slot0.bodyMask).sizeDelta = Vector2(slot4, slot5)
	slot9 = slot0
	slot8 = slot0.changeInnerDir

	if slot2 ~= 1 or not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 87-87, warpins: 2 ---
		slot10 = -1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 88-93, warpins: 2 ---
	slot8(slot9, slot10)
	SetParent(slot0.model, slot0.bodyMask)

	return
	--- END OF BLOCK #5 ---



end

slot0.closeBodyMask = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.bodyMask or not slot0.isShowBodyMask then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-40, warpins: 2 ---
	setActive(slot0.bodyMask, false)
	SetParent(slot0.model, slot0.tf)
	slot0.model:SetSiblingIndex(1)

	tf(slot0.model).localPosition = Vector3(0, 0, 0)
	tf(slot0.bodyMask).localScale = Vector3(1, 1, 1)

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-43, warpins: 1 ---
		Destroy(slot0.bodyMask)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 44-53, warpins: 2 ---
	if slot0.bodyMask:GetComponent(typeof(Image)).enabled == false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-55, warpins: 1 ---
		slot2.enabled = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 56-58, warpins: 2 ---
	slot0.isShowBodyMask = nil

	return
	--- END OF BLOCK #3 ---



end

slot0.dispose = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.timer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-12, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.timer) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-10, warpins: 1 ---
			slot5:Stop()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-12, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 13-14, warpins: 1 ---
		slot0.timer = nil
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-17, warpins: 2 ---
	if slot0.dragTrigger then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-22, warpins: 1 ---
		ClearEventTrigger(slot0.dragTrigger)

		slot0.dragTrigger = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-30, warpins: 2 ---
	pg.DelegateInfo.Dispose(slot0)

	if slot0.moveNextTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-36, warpins: 1 ---
		slot0.moveNextTimer:Stop()

		slot0.moveNextTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 37-39, warpins: 2 ---
	if slot0.removeEffectTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-45, warpins: 1 ---
		slot0.removeEffectTimer:Stop()

		slot0.removeEffectTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 46-51, warpins: 2 ---
	if LeanTween.isTweening(slot0.go) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-55, warpins: 1 ---
		LeanTween.cancel(slot0.go)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 56-61, warpins: 2 ---
	slot0.canvasGroup.blocksRaycasts = true

	if slot0.spineAnimUI then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-66, warpins: 1 ---
		slot0.spineAnimUI:SetActionCallBack(nil)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 67-69, warpins: 2 ---
	if slot0.shadowTF then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-72, warpins: 1 ---
		Destroy(slot0.shadowTF)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 73-93, warpins: 2 ---
	slot0:closeBodyMask(true)
	PoolMgr.GetInstance():ReturnSpineChar(slot0.boatVO:getPrefab(), go(slot0.model))
	Destroy(slot0.go)

	return
	--- END OF BLOCK #7 ---



end

return slot0
