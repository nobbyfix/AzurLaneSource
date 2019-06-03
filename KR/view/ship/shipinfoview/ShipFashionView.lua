slot0 = class("ShipFashionView", import("...base.BaseSubView"))

function slot0.getUIName(slot0)
	return "ShipFashionView"
end

function slot0.OnInit(slot0)
	slot0:InitFashion()
end

function slot0.InitFashion(slot0)
	slot0.mainPanel = slot0._parentTf.parent
	slot0.stylePanel = slot0._tf
	slot0.styleScroll = slot0:findTF("style_scroll", slot0.stylePanel)
	slot0.styleContainer = slot0:findTF("view_port", slot0.styleScroll)
	slot0.styleCard = slot0._tf:GetComponent(typeof(ItemList)).prefabItem[0]

	setActive(slot0.stylePanel, true)
	setActive(slot0.styleCard, false)

	slot0.fashionSkins = {}
	slot0.fashionCellMap = {}
	slot0.fashionGroup = 0
	slot0.fashionSkinId = 0
	slot0.onSelected = false
end

function slot0.SetShareData(slot0, slot1)
	slot0.shareData = slot1
end

function slot0.GetShipVO(slot0)
	if slot0.shareData and slot0.shareData.shipVO then
		return slot0.shareData.shipVO
	end

	return nil
end

function slot0.SetSkinList(slot0, slot1)
	slot0.skinList = slot1
end

function slot0.UpdateUI(slot0)
	slot0:UpdateFashion()
end

function slot0.OnSelected(slot0, slot1)
	if slot1 then
		pg.UIMgr.GetInstance():OverlayPanelPB(slot0._parentTf, {
			pbList = {
				slot0.stylePanel:Find("style_desc"),
				slot0.stylePanel:Find("frame")
			},
			groupName = LayerWeightConst.GROUP_SHIPINFOUI,
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
	else
		slot2:UnOverlayPanel(slot0._parentTf, slot0.mainPanel)
	end

	slot0.onSelected = slot1
end

function slot0.UpdateFashion(slot0)
	if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION or #slot0.shareData:GetGroupSkinList(slot1) <= 1 then
		return
	end

	if true or slot0.fashionGroup ~= slot1 then
		slot0.fashionGroup = slot1
		slot0.fashionSkins = slot2

		for slot6 = slot0.styleContainer.childCount, #slot0.fashionSkins - 1, 1 do
			cloneTplTo(slot0.styleCard, slot0.styleContainer)
		end

		for slot6 = #slot0.fashionSkins, slot0.styleContainer.childCount - 1, 1 do
			setActive(slot0.styleContainer:GetChild(slot6), false)
		end

		for slot6, slot7 in ipairs(slot0.fashionSkins) do
			slot8 = slot0.fashionSkins[slot6]

			if not slot0.fashionCellMap[slot0.styleContainer:GetChild(slot6 - 1)] then
				slot0.fashionCellMap[slot9] = ShipSkinCard.New(slot9.gameObject)
			end

			slot10:updateData(slot0:GetShipVO(), slot8, slot0:GetShipVO():proposeSkinOwned(slot8) or table.contains(slot0.skinList, slot8.id) or slot0:GetShipVO():getRemouldSkinId() == slot8.id and slot0:GetShipVO():isRemoulded() or slot8.skin_type == 3)
			slot10:updateUsing(slot0:GetShipVO().skinId == slot8.id)
			onButton(slot0, slot9, function ()
				if ShipViewConst.currentPage ~= ShipViewConst.PAGE.FASHION then
					return
				end

				uv0.fashionSkinId = uv1.id

				uv0:UpdateFashionDetail(uv1)

				slot0 = uv1.painting

				if HXSet.isHx() then
					if uv1.isSwimsuit ~= 1 then
						uv0:emit(ShipViewConst.LOAD_PAINTING, uv1.painting_hx ~= "" and uv1.painting_hx or uv1.painting)
					end
				else
					uv0:emit(ShipViewConst.LOAD_PAINTING, slot0)
				end

				uv0:emit(ShipViewConst.LOAD_PAINTING_BG, uv0:GetShipVO():rarity2bgPrintForGet(), uv0:GetShipVO():isBluePrintShip())

				for slot4, slot5 in ipairs(uv0.fashionSkins) do
					uv0.fashionCellMap[uv0.styleContainer:GetChild(slot4 - 1)]:updateSelected(slot5.id == uv0.fashionSkinId)
					slot7:updateUsing(uv0:GetShipVO().skinId == slot5.id)
				end
			end)
			setActive(slot9, true)
		end
	end

	if slot0.fashionSkinId == 0 then
		slot0.fashionSkinId = slot0:GetShipVO().skinId
	end

	slot3 = slot0.styleContainer:GetChild(0)

	for slot7, slot8 in ipairs(slot0.fashionSkins) do
		if slot8.id == slot0.fashionSkinId then
			slot3 = slot0.styleContainer:GetChild(slot7 - 1)

			break
		end
	end

	triggerButton(slot3)
end

function slot0.ResetFashion(slot0)
	slot0.fashionSkinId = 0
end

function slot0.UpdateFashionDetail(slot0, slot1)
	if not slot0.fashionDetailWrapper then
		slot0.fashionDetailWrapper = {
			name = findTF(slot0.stylePanel, "style_desc/name_bg/name"),
			descTxt = findTF(slot0.stylePanel, "style_desc/desc_frame/desc/Text"),
			character = findTF(slot0.stylePanel, "style_desc/character"),
			confirm = findTF(slot0.stylePanel, "confirm_button"),
			cancel = findTF(slot0.stylePanel, "cancel_button"),
			diamond = findTF(()["confirm"], "diamond"),
			using = findTF(()["confirm"], "using"),
			experience = findTF(()["confirm"], "experience"),
			change = findTF(()["confirm"], "change"),
			buy = findTF(()["confirm"], "buy"),
			activity = findTF(()["confirm"], "activity"),
			cantbuy = findTF(()["confirm"], "cantbuy"),
			prefab = "unknown"
		}
	end

	setText(slot2.name, HXSet.hxLan(slot1.name))
	setText(slot2.descTxt, HXSet.hxLan(slot1.desc))

	if #slot2.descTxt:GetComponent(typeof(Text)).text > 50 then
		slot3.alignment = TextAnchor.MiddleLeft
	else
		slot3.alignment = TextAnchor.MiddleCenter
	end

	if slot2.prefab ~= slot1.prefab then
		if not IsNil(slot2.character:Find(slot2.prefab)) then
			PoolMgr.GetInstance():ReturnSpineChar(slot2.prefab, slot4.gameObject)
		end

		slot2.prefab = slot1.prefab

		PoolMgr.GetInstance():GetSpineChar(slot2.prefab, true, function (slot0)
			if uv0.prefab ~= uv1 then
				PoolMgr.GetInstance():ReturnSpineChar(uv1, slot0)
			else
				slot0.name = uv1
				slot0.transform.localPosition = Vector3.zero
				slot0.transform.localScale = Vector3(0.5, 0.5, 1)

				slot0.transform:SetParent(uv0.character, false)
				slot0:GetComponent(typeof(SpineAnimUI)):SetAction(uv2.show_skin or "stand", true)
			end
		end)
	end

	slot5 = (slot0:GetShipVO():proposeSkinOwned(slot1) or table.contains(slot0.skinList, slot1.id) or slot0:GetShipVO():getRemouldSkinId() == slot1.id and slot0:GetShipVO():isRemoulded()) and 1 or 0
	slot7 = false

	if HXSet.isHx() and (slot1.shop_id > 0 and pg.shop_template[slot1.shop_id] or nil) then
		slot7 = pg.shop_template[slot1.shop_id > 0 and pg.shop_template[slot1.shop_id] or nil.id].isHX == 1
	end

	slot8 = slot6 and not pg.TimeMgr.GetInstance():inTime(slot6.time)
	slot10 = slot1.id == slot0:GetShipVO():getConfig("skin_id") or slot5 >= 1 or slot1.skin_type == 3
	slot11 = getProxy(ShipSkinProxy):getSkinById(slot1.id)

	setGray(slot2.confirm, false)
	setActive(slot2.using, false)
	setActive(slot2.change, false)
	setActive(slot2.buy, false)
	setActive(slot2.experience, false)

	if slot1.id == slot0:GetShipVO().skinId and slot11 and slot11:isExpireType() then
		setActive(slot2.experience, true)
	elseif slot9 then
		setActive(slot2.using, true)
	elseif slot10 then
		setActive(slot2.change, true)
	elseif slot6 then
		setActive(slot2.buy, true)
		setGray(slot2.confirm, slot8)
	else
		setActive(slot2.change, true)
		setGray(slot2.confirm, true)
	end

	onButton(slot0, slot2.confirm, function ()
		if uv0 then
			-- Nothing
		elseif uv1 then
			uv2:emit(ShipMainMediator.CHANGE_SKIN, uv2:GetShipVO().id, uv3.id == uv2:GetShipVO():getConfig("skin_id") and 0 or uv3.id)
		elseif uv4 then
			if uv5 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
			else
				slot0 = true

				if HXSet.isHx() then
					slot0 = pg.shop_template[uv4.id].isHX ~= 1
				end

				if slot0 then
					slot1 = Goods.New({
						shop_id = uv4.id
					}, Goods.TYPE_SKIN)

					if slot1:isDisCount() then
						slot2 = slot1:getConfig("resource_num") * (100 - slot1:getConfig("discount")) / 100
					end

					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("text_buy_fashion_tip", slot2, HXSet.hxLan(uv3.name)),
						onYes = function ()
							uv0:emit(ShipMainMediator.BUY_ITEM, uv1.id, 1)
						end
					})
				end
			end
		end
	end)
	onButton(slot0, slot2.cancel, function ()
		uv0:emit(ShipViewConst.SWITCH_TO_PAGE, ShipViewConst.PAGE.DETAIL)
	end)
end

function slot0.OnDestroy(slot0)
	if slot0.fashionDetailWrapper and not IsNil(slot0.fashionDetailWrapper.character:Find(slot0.fashionDetailWrapper.prefab)) then
		PoolMgr.GetInstance():ReturnSpineChar(slot1.prefab, slot2.gameObject)
	end

	slot0.fashionDetailWrapper = nil

	for slot4, slot5 in pairs(slot0.fashionCellMap) do
		slot5:clear()
	end

	slot0.fashionCellMap = {}
	slot0.fashionSkins = {}
	slot0.fashionGroup = 0
	slot0.fashionSkinId = 0
	slot0.shareData = nil
end

return slot0
