slot0 = class("BackyardGranaryLayer", import("..base.BaseUI"))
slot1 = {
	50001,
	50002,
	50003,
	50004,
	50005,
	50006
}
slot2 = pg.item_data_template
slot3 = pg.shop_template

function slot4(slot0)

	-- Decompilation error in this vicinity:
	function (slot0)
		slot0._go = slot0
		slot0._tf = tf(slot0)
		slot0.mask = slot0._tf:Find("mask")
		slot0.count = slot0._tf:Find("count"):GetComponent(typeof(Text))
		slot0.name = slot0._tf:Find("name_bg/Text"):GetComponent(typeof(Text))
		slot0.addTF = slot0._tf:Find("add_btn")
		slot0.icon = slot0._tf:Find("icon_bg/icon")
	end({
		Update = function (slot0, slot1)
			slot0._go.name = "food_" .. slot1.id
			slot0.foodVO = slot1

			setActive(slot0.mask, slot1.count == 0)

			slot0.count.text = slot1.count
			slot0.name.text = (slot1.count == 0 and setColorStr(i18n("word_food") .. slot0[slot1.id].usage_arg[1], "#2f2d2b")) or setColorStr(i18n("word_food") .. slot0[slot1.id].usage_arg[1], "#4E3E42FF")

			if slot0.foodVOId ~= slot1.id then
				slot0.foodVOId = slot1.id

				updateItem(slot0._tf, slot1)
			end
		end,
		Dispose = function (slot0)
			return
		end
	})

	return 
end

function slot5(slot0, slot1)

	-- Decompilation error in this vicinity:
	function (slot0)
		slot0._go = slot0
		slot0._tf = tf(slot0)
		slot0.parent = slot0._tf.parent
		slot0.overlay = slot0._tf.parent
		slot0.foodItem = slot0._tf:Find("frame")
		slot0.foodName = slot0._tf:Find("frame/name"):GetComponent(typeof(Text))
		slot0.foodDesc = slot0._tf:Find("frame/desc"):GetComponent(typeof(Text))
		slot0.calPanel = slot0._tf:Find("frame/cal_panel")
		slot0.cancelBtn = slot0._tf:Find("frame/cancel_btn")
		slot0.countValue = slot0.calPanel:Find("value/Text"):GetComponent(typeof(Text))
		slot0.total = slot0.calPanel:Find("total/Text"):GetComponent(typeof(Text))
		slot0.totalIcon = slot0.calPanel:Find("total/icon"):GetComponent(typeof(Image))
		slot0.minusBtn = slot0.calPanel:Find("minus_btn")
		slot0.addBtn = slot0.calPanel:Find("add_btn")
		slot0.tenBtn = slot0.calPanel:Find("ten_btn")
		slot0.confirmBtn = slot0._tf:Find("frame/ok_btn")
		slot0.cancelBtn = slot0._tf:Find("frame/cancel_btn")

		onButton(nil, slot0._tf, function ()
			slot0:Hide()
		end, SFX_PANEL)
		onButton(nil, slot0.cancelBtn, function ()
			slot0:Hide()
		end, SFX_PANEL)
	end({
		Show = function (slot0, slot1, slot2)
			setParent(slot0._tf, slot0.overlay)
			setActive(slot0._tf, true)

			slot0.foodName.text = slot1:getConfig("name")
			slot0.foodDesc.text = slot1:getConfig("display")

			updateItem(slot0.foodItem, slot1)

			slot0.total.text = slot0[slot1:getConfig("shop_id")].resource_num * 1
			slot0.totalIcon.sprite = LoadSprite("props/" .. id2res(slot5))
			slot0.countValue.text = 1

			onButton(nil, slot0.minusBtn, function ()
				if slot0 <= 1 then
					return
				end

				slot0 = slot0 - 1
				slot1.countValue.text = slot1.countValue
				slot1.total.text = slot2 * slot1.total
			end, SFX_PANEL)
			onButton(nil, slot0.addBtn, function ()
				if slot0 == 999 then
					pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_buyCountLimit", pg.TipsMgr.GetInstance().ShowTips))

					return
				end

				slot0 = (slot0 > 999 and 999) or slot0 + 1
				slot0 = slot0
				slot1.countValue.text = slot1.countValue
				slot1.total.text = slot2 * slot1.total
			end, SFX_PANEL)
			onButton(nil, slot0.tenBtn, function ()
				if slot0 == 999 then
					pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_buyCountLimit", pg.TipsMgr.GetInstance().ShowTips))

					return
				end

				slot0 = (slot0 + 10 >= 999 and 999) or slot0 + 10
				slot0 = slot0
				slot1.countValue.text = slot1.countValue
				slot1.total.text = slot2 * slot1.total
			end, SFX_PANEL)
			onButton(nil, slot0.confirmBtn, function ()
				slot0({
					count = slot1,
					resourceType = slot1,
					resourceNum = slot3,
					shopId = slot4
				})
			end, SFX_CONFIRM)
		end,
		Hide = function (slot0)
			setActive(slot0._tf, false)
			setParent(slot0._tf, slot0.parent)
		end,
		Dispose = function (slot0)
			slot0:Hide()
			removeOnButton(slot0.minusBtn)
			removeOnButton(slot0.addBtn)
			removeOnButton(slot0.tenBtn)
			removeOnButton(slot0.confirmBtn)
		end
	})

	return 
end

function slot6(slot0, slot1)

	-- Decompilation error in this vicinity:
	function (slot0)
		slot0._go = slot0
		slot0._tf = tf(slot0)
		slot0.parent = slot0._tf.parent
		slot0.overlay = slot0._tf.parent
		slot0.icon = slot0._tf:Find("frame/tip/icon"):GetComponent(typeof(Image))
		slot0.consume = slot0._tf:Find("frame/tip/Text"):GetComponent(typeof(Text))
		slot0.desc = slot0._tf:Find("frame/desc"):GetComponent(typeof(Text))
		slot0.addBtn = slot0._tf:Find("frame/ok_btn")
		slot0.cancelBtn = slot0._tf:Find("frame/cancel_btn")

		onButton(nil, slot0.cancelBtn, function ()
			slot0:Hide()
		end, SFX_PANEL)
		onButton(nil, slot0._tf, function ()
			slot0:Hide()
		end, SFX_PANEL)
	end({
		Show = function (slot0, slot1, slot2, slot3)
			setParent(slot0._tf, slot0.overlay)
			setActive(slot0._tf, true)

			slot0.icon.sprite = LoadSprite("props/" .. id2res(slot5))
			slot0.consume.text = slot0[slot1].resource_num
			slot0.desc.text = i18n("backyard_backyardGranaryLayer_foodMaxIncreaseNotice", slot2, slot2 + slot0[slot1].num)

			onButton(nil, slot0.addBtn, function ()
				slot0({
					resType = slot1,
					resCount = slot1,
					shopId = slot3
				})
			end, SFX_CONFIRM)
		end,
		Hide = function (slot0)
			setActive(slot0._tf, false)
			setParent(slot0._tf, slot0.parent)
		end,
		Dispose = function (slot0)
			slot0:Hide()
			removeOnButton(slot0.addBtn)
		end
	})

	return 
end

slot0.getUIName = function (slot0)
	return "BackyardGranaryUI"
end

slot0.setIsRemind = function (slot0, slot1)
	slot0.remindEndTime = slot1
end

slot0.setFoodVOs = function (slot0, slot1)
	slot0.foodVOs = slot1
end

slot0.setPlayerVO = function (slot0, slot1)
	slot0.playerVO = slot1
end

slot0.setDormVO = function (slot0, slot1)
	slot0.dormVO = slot1
	slot0.capacity = slot1:getConfig("capacity") + slot0.dormVO.dorm_food_max
end

slot0.setTrainShipVOs = function (slot0, slot1)
	slot0.addExpShipVOs = slot1
end

slot0.getFoodVOById = function (slot0, slot1)
	return _.detect(slot0.foodVOs, function (slot0)
		return slot0.id == slot0
	end) or Item.New({
		count = 0,
		id = slot1
	})
end

slot0.init = function (slot0)
	slot0.itemList = UIItemList.New(slot0:findTF("foodPanel/frame/scrollview/content"), slot0:findTF("foodPanel/frame/scrollview/foodtpl"))
	slot0.foodPanel = slot0:findTF("foodPanel")
	slot0.stock = slot0:findTF("frame/top/stock", slot0.foodPanel)
	slot0.stockBar = slot0:findTF("bar", slot0.stock):GetComponent(typeof(Image))
	slot0.stockTxt = slot0:findTF("Text", slot0.stock):GetComponent(typeof(Text))
	slot0.leftTimeTF = slot0:findTF("paint/chat_bg/chat_text", slot0.foodPanel)
	slot0.chatContain = slot0:findTF("paint/chat_bg/chat_contain", slot0.foodPanel)
	slot0.bottomText = slot0:findTF("paint/chat_bg/bottom_text", slot0.foodPanel)
	slot0.paint = findTF(slot0.foodPanel, "paint/lenggui")
	slot1 = slot0.paint:GetComponent("SpineAnimUI")

	slot1:SetAction("animation", 0)

	slot0._overlayUIMain = pg.UIMgr:GetInstance().OverlayMain
	slot0.foodMsgBox = slot0(slot0:findTF("shopPanel"), slot0._overlayUIMain)
	slot0.extendPanel = slot1(slot0:findTF("extendPanel"), slot0._overlayUIMain)
	slot0.extendBtn = slot0:findTF("frame/top/extend_btn", slot0.foodPanel)

	pg.UIMgr.GetInstance():BlurPanel(slot0.foodPanel)
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0.foodPanel:Find("bg"), function ()
		slot0:emit(slot1.ON_CLOSE)
	end, SOUND_BACK)
	onButton(slot0, slot0.extendBtn, function ()
		slot0:openExtendPanel()
	end, SFX_PANEL)

	slot0.cards = {}
	slot0.count = 0

	slot0:updateDorm(slot0.dormVO)
	slot0:initItems()
end

slot0.initItems = function (slot0)
	slot0.itemList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventInit then
			if not slot1.cards[slot0[slot1 + 1]] then
				slot1.cards[slot3] = slot2(slot2)
			end

			onButton(slot1, slot4.mask, function ()
				slot0:openFoodShop(slot1.foodVO)
			end, SFX_PANEL)
			onButton(slot1, slot4.addTF, function ()
				slot0:openFoodShop(slot1.foodVO)
			end, SFX_PANEL)
			pressPersistTrigger(slot4.icon, 0.5, function (slot0)
				slot0:updateConsume(slot0, slot0.updateConsume)
			end, function ()
				slot0:updateTotalConsume(slot0)
			end, true, true, 0.15, SFX_PANEL)
		end
	end)
	slot0.itemList:align(#slot0)
	slot0:updateItems()
end

slot0.updateItems = function (slot0)
	for slot4, slot5 in pairs(slot0) do
		slot0.cards[slot5]:Update(slot0:getFoodVOById(slot5))
	end
end

slot0.updateConsume = function (slot0, slot1, slot2)
	if not slot0.dormClone then
		slot0.dormClone = Clone(slot0.dormVO)
	end

	slot3 = slot0[slot2.foodVO.id].usage_arg[1]

	if slot0.dormClone.food ~= slot0.capacity and slot0.capacity < slot0.dormClone.food + slot3 and slot0.remindEndTime < pg.TimeMgr.GetInstance():GetServerTime() then
		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			showStopRemind = true,
			type = MSGBOX_TYPE_SINGLE_ITEM,
			content = i18n("backyard_food_remind", slot2.foodVO:getConfig("name")),
			name = i18n("backyard_food_count", slot0.dormClone.food .. "/" .. slot0.capacity),
			drop = {
				type = DROP_TYPE_ITEM,
				id = slot2.foodVO.id,
				count = i18n("common_food") .. ":" .. slot3
			},
			onYes = function ()
				slot0:emit(BackyardGranaryMediator.USE_FOOD, slot1.foodVO.id, 1, slot2.stopRemindToggle.isOn)
			end
		})

		if slot1 then
			slot1()
		end

		return
	end

	if slot0.capacity <= slot0.dormClone.food then
		pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_full"))

		if slot1 then
			slot1()
		end

		return
	end

	if slot2.foodVO.count <= 0 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_foodCountLimit"))

		if slot1 then
			slot1()
		end

		return
	end

	slot0.count = slot0.count + 1

	slot0.dormClone:addFood(slot3)

	slot2.foodVO.count = slot2.foodVO.count - 1

	slot2:Update(slot4)
	slot0:updateDorm(slot0.dormClone)
	slot0:showStockAdd(slot3)
end

slot0.showStockAdd = function (slot0, slot1)
	if not slot0.stockAddTpl then
		slot0.stockAddContainter = slot0:findTF("frame/top/stockAddCont", slot0.foodPanel)
		slot0.stockAddAddTpl = slot0:findTF("stockAdd", slot0.stockAddContainter)
	end

	slot2 = cloneTplTo(slot0.stockAddAddTpl, slot0.stockAddContainter)

	setText(slot2, "+" .. slot1)

	if slot2:GetComponent(typeof(DftAniEvent)) then
		slot3:SetEndEvent(function (slot0)
			Destroy(slot0)
		end)
	end

	setActive(slot2, true)
end

slot0.updateTotalConsume = function (slot0, slot1)
	slot0.dormClone = nil

	if slot0.count == 0 then
		return
	end

	slot0.count = 0

	slot0:emit(BackyardGranaryMediator.USE_FOOD, slot1.foodVO.id, slot2)
end

slot0.openFoodShop = function (slot0, slot1)
	slot0.foodMsgBox:Show(slot1, function (slot0)
		if slot0.playerVO[id2res(slot0.resourceType)] < slot0.resourceNum * slot0.count then
			if slot0.resourceType == 4 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_error_noResource", pg.item_data_statistics[id2ItemId(slot0.resourceType)].name))
			end

			return
		end

		slot0:emit(BackyardGranaryMediator.BUY_FOOD, slot0.shopId, slot0.count)
		slot0.foodMsgBox:Hide()
	end)
end

slot0.openExtendPanel = function (slot0)
	if not ShoppingStreet.getRiseShopId(ShopArgs.BackyardFoodExtend, slot0.dormVO.food_extend_count) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_buy_max_count"))

		return
	end

	slot0.extendPanel:Show(slot1, slot0.capacity, function (slot0)
		if slot0.playerVO[id2res(slot0.resType)] < slot0.resCount then
			if slot0.resType == 4 then
				GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
			else
				pg.TipsMgr:GetInstance():ShowTips(i18n("backyard_backyardGranaryLayer_error_entendFail"))
			end
		else
			slot0:emit(BackyardGranaryMediator.EXTEND_GRANARY, slot0.shopId, 1)
		end

		slot0.extendPanel:Hide()
	end)
end

slot0.updateDorm = function (slot0, slot1)
	if not slot1 then
		return
	end

	slot0.stockBar.fillAmount = slot1.food / slot0.capacity
	slot0.stockTxt.text = math.ceil(slot1.food) .. "/" .. slot0.capacity

	slot0:calFoodLeftTime(slot1)
end

slot0.calFoodLeftTime = function (slot0, slot1)
	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end

	slot2 = table.getCount(slot0.addExpShipVOs)

	function slot3(slot0)
		SetActive(slot0.leftTimeTF, true)
		SetActive(slot0.chatContain, false)
		SetActive(slot0.bottomText, false)
		setText(slot0.leftTimeTF, slot0)
	end

	if slot1.food <= 0 then
		slot3(i18n("backyard_backyardGranaryLayer_word"))

		return
	end

	if slot2 <= 0 then
		slot3(i18n("backyard_backyardGranaryLayer_noShip"))

		return
	end

	SetActive(slot0.leftTimeTF, false)
	SetActive(slot0.chatContain, true)
	SetActive(slot0.bottomText, true)
	setText(findTF(slot0.chatContain, "Text"), i18n("backyard_backyardGranaryLayer_foodTimeNotice_top"))
	setText(slot0.bottomText, i18n("backyard_backyardGranaryLayer_foodTimeNotice_bottom"))

	slot4 = findTF(slot0.chatContain, "time"):GetComponent(typeof(Text))
	slot5 = slot1:getFoodLeftTime()
	slot0.timer = Timer.New(function ()
		pg.TimeMgr:GetInstance():GetServerTime().text = pg.TimeMgr:GetInstance():DescCDTime(math.ceil(math.ceil) - pg.TimeMgr.GetInstance().GetServerTime())

		if math.ceil(math.ceil) - pg.TimeMgr.GetInstance().GetServerTime() <= 0 then
			slot2.timer:Stop()

			slot2.timer.timer = nil

			slot3(i18n("backyard_backyardGranaryLayer_word"))
		end
	end, 1, -1)

	slot0.timer:Start()
end

slot0.willExit = function (slot0)
	for slot4, slot5 in pairs(slot0.cards) do
		slot5:Dispose()
	end

	if slot0.timer then
		slot0.timer:Stop()

		slot0.timer = nil
	end

	slot0.foodMsgBox:Dispose()
	slot0.extendPanel:Dispose()
	pg.UIMgr.GetInstance():UnblurPanel(slot0.foodPanel, slot0._tf)
end

return slot0
