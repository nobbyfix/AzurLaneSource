slot0 = class("ChargeScene", import("..base.BaseUI"))
slot0.TYPE_MENU = 1
slot0.TYPE_SKIN = 2
slot0.TYPE_DIAMOND = 3
slot0.TYPE_GIFT = 4
slot0.TYPE_ITEM = 5
slot1 = pg.skin_page_template

function slot0.getUIName(slot0)
	return "ChargeUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	slot0.resPanel:setResources(slot1)
end

function slot0.setFirstChargeIds(slot0, slot1)
	slot0.firstChargeIds = slot1
end

function slot0.setChargedList(slot0, slot1)
	slot0.chargedList = slot1
end

function slot0.setNormalList(slot0, slot1)
	slot0.normalList = slot1
end

function slot0.setNormalGroupList(slot0, slot1)
	slot0.normalGroupList = slot1

	slot0:addRefreshTimer(GetZeroTime())
end

function slot0.init(slot0)
	slot0.cards = {}
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.top = slot0:findTF("adapt/top", slot0.blurPanel)
	slot0.detail = slot0:findTF("detail", slot0.blurPanel)
	slot0.frame = slot0:findTF("frame")
	slot0.viewContainer = slot0:findTF("frame/viewContainer")
	slot0.bg = slot0:findTF("frame/viewContainer/bg")
	slot0.painting = slot0:findTF("frame/painting")
	slot0.chat = slot0:findTF("frame/painting/chat")
	slot0.chatText = slot0:findTF("Text", slot0.chat)
	slot0.menu = slot0:findTF("menu_screen")
	slot0.itemToggle = slot0:findTF("toggle_list/item_toggle", slot0.viewContainer)
	slot0.giftToggle = slot0:findTF("toggle_list/gift_toggle", slot0.viewContainer)
	slot0.diamondToggle = slot0:findTF("toggle_list/diamond_toggle", slot0.viewContainer)
	slot0.resPanel = PlayerResource.New()

	slot0.resPanel:setParent(slot0:findTF("res", slot0.top), false)

	slot0.linkPage = {
		1,
		1,
		slot0:findTF("diamondPanel", slot0.viewContainer),
		slot0:findTF("giftPanel", slot0.viewContainer),
		slot0:findTF("itemPanel", slot0.viewContainer)
	}
	slot0.linkTitle = {
		slot0:findTF("title/title_shop", slot0.top),
		1,
		slot0:findTF("title/title_diamond", slot0.top),
		slot0:findTF("title/title_gift", slot0.top),
		slot0:findTF("title/title_item", slot0.top)
	}
	slot0.toggleList = {
		1,
		1,
		slot0.diamondToggle,
		slot0.giftToggle,
		slot0.itemToggle
	}
	slot0.cvBankName = "cv-chargeShop"

	slot0:createLive2D()

	slot0.live2dTimer = Timer.New(function ()
		if uv0:checkBuyDone(pg.ChargeShipTalkInfo.Actions[math.random(#pg.ChargeShipTalkInfo.Actions)].action) then
			uv0:displayShipWord(nil, false, slot1.dialog_index)
		end
	end, 20, -1)

	slot0.live2dTimer:Start()
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0:findTF("back_button", slot0.top), function ()
		if uv0.prePage ~= uv1.TYPE_MENU then
			uv0:switchToMenu()
		else
			uv0:emit(uv1.ON_BACK, nil, 0.2)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.painting, function ()
		uv0:displayShipWord()
		uv0:emit(ChargeMediator.CLICK_MING_SHI)
	end, SFX_PANEL)

	for slot4 = 1, #slot0.toggleList, 1 do
		if slot0.toggleList[slot4] ~= 1 then
			onToggle(slot0, slot0.toggleList[slot4], function (slot0)
				setActive(uv0:findTF("dark", uv1), not slot0)

				if slot0 then
					uv0:goPage(uv2)
				end
			end, SFX_PANEL)
		end
	end

	onButton(slot0, slot0:findTF("skin_shop", slot0.menu), function ()
		uv0:jumpToSkinShop()
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("dimond_shop", slot0.menu), function ()
		uv0:switchPage(uv1.TYPE_DIAMOND)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("item_shop", slot0.menu), function ()
		uv0:switchPage(uv1.TYPE_ITEM)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("gift_shop", slot0.menu), function ()
		uv0:switchPage(uv1.TYPE_GIFT)
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("supply_shop", slot0.menu), function ()
		uv0:emit(ChargeMediator.SWITCH_TO_SHOP, {
			chargePage = uv1.TYPE_DIAMOND
		})
		uv0:stopCV()
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("switch_btn", slot0.frame), function ()
		uv0:emit(ChargeMediator.SWITCH_TO_SHOP, {
			chargePage = uv0.prePage
		})
		uv0:stopCV()
	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("skin_btn", slot0.frame), function ()
		uv0:emit(ChargeMediator.ON_SKIN_SHOP)
	end, SFX_PANEL)
	slot0:setItemVOs()
	slot0:updateNoRes()

	if slot0.contextData.wrap ~= nil then
		slot0:switchPage(slot0.contextData.wrap)
	else
		slot0:switchPage(uv0.TYPE_MENU)
	end
end

function slot0.triggerPageToggle(slot0, slot1)
	if slot0.contextData.page == slot1 then
		return
	end

	slot0:switchPage(slot1)
end

function slot0.jumpToSkinShop(slot0)
	slot0.timer = Timer.New(function ()
		uv0:emit(ChargeMediator.ON_SKIN_SHOP)
	end, 0.2, 1):Start()
end

function slot0.switchPage(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-34, warpins: 1 ---
	if slot0.toggleList[slot1] ~= 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-21, warpins: 1 ---
		for slot5, slot6 in ipairs(slot0.toggleList) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-20, warpins: 1 ---
			if slot6 ~= 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-18, warpins: 2 ---
				triggerToggle(slot6, slot5 == slot1)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-25, warpins: 1 ---
		if slot1 == uv0.TYPE_MENU then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-29, warpins: 1 ---
			slot0:switchToMenu()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-33, warpins: 1 ---
			slot0:goPage(slot1)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.switchToMenu(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot0:unBlurView()
	setActive(slot0.frame, false)
	setActive(slot0.menu, true)

	slot0.prePage = uv0.TYPE_MENU
	slot0.contextData.page = uv0.TYPE_MENU

	slot0:ChangeTitle(slot0.prePage)

	return
	--- END OF BLOCK #0 ---



end

function slot0.goPage(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-107, warpins: 1 ---
	if slot1 == uv0.TYPE_MENU then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.contextData.page = slot1

	if slot0.prePage and slot0.prePage == slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.frame, true)
	setActive(slot0.menu, false)
	slot0:blurView()

	if slot1 == uv0.TYPE_DIAMOND then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-38, warpins: 1 ---
		if not slot0.isInitDamonds then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-35, warpins: 1 ---
			slot0:initDamonds()
			--- END OF BLOCK #0 ---



		end

		if slot0.chargedList and slot0.firstChargeIds then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-46, warpins: 1 ---
			slot0:sortDamondItems(0)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-50, warpins: 1 ---
		if slot1 == uv0.TYPE_GIFT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-59, warpins: 1 ---
			if not slot0.isInitDamonds then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 54-56, warpins: 1 ---
				slot0:initDamonds()
				--- END OF BLOCK #0 ---



			end

			if slot0.chargedList and slot0.firstChargeIds then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-67, warpins: 1 ---
				slot0:sortDamondItems(0)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 68-71, warpins: 1 ---
			if slot1 == uv0.TYPE_SKIN then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 72-75, warpins: 1 ---
				slot0:jumpToSkinShop()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 76-79, warpins: 1 ---
				if slot1 == uv0.TYPE_ITEM and not slot0.isInitItems then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 83-85, warpins: 1 ---
					slot0:initItems()
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	for slot5, slot6 in ipairs(slot0.linkPage) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-101, warpins: 1 ---
		if slot6 ~= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 99-99, warpins: 2 ---
			setActive(slot6, slot5 == slot1)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0:ChangeTitle(slot1)

	slot0.prePage = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.ChangeTitle(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	for slot5, slot6 in ipairs(slot0.linkTitle) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-16, warpins: 1 ---
		if slot6 ~= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 2 ---
			setActive(slot6, slot5 == slot1)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.initRect(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot4 = slot1:GetComponent("LScrollRect")

	function slot4.onInitItem(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		uv0(slot0)

		return
		--- END OF BLOCK #0 ---



	end

	function slot4.onUpdateItem(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0(slot0, slot1)

		return
		--- END OF BLOCK #0 ---



	end

	return slot4
	--- END OF BLOCK #0 ---



end

function slot0.initDamondsData(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-56, warpins: 1 ---
	slot0.damondItemVOs = {}

	for slot5, slot6 in pairs(pg.pay_data_display.all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-32, warpins: 1 ---
		if AiriCheckAudit() and slot6 == 1 and PLATFORM_CODE ~= PLATFORM_US then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-19, warpins: 1 ---
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-30, warpins: 3 ---
			table.insert(slot0.damondItemVOs, Goods.New({
				shop_id = slot6
			}, Goods.TYPE_CHARGE))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	for slot6, slot7 in pairs(pg.shop_template.all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-55, warpins: 1 ---
		if slot2[slot7].genre == "gift_package" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-53, warpins: 1 ---
			table.insert(slot0.damondItemVOs, Goods.New({
				shop_id = slot7
			}, Goods.TYPE_GIFT_PACKAGE))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.initDamonds(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-33, warpins: 1 ---
	slot0.isInitDamonds = true

	slot0:initDamondsData()

	slot0.damondItems = {}

	local function slot1(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-22, warpins: 1 ---
		slot1 = uv0:createGoods(slot0)

		onButton(uv0, slot1.tr, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			uv0:confirm(uv1)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onButton(uv0, slot1.mask, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-1, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		uv0.damondItems[slot0] = slot1

		return
		--- END OF BLOCK #0 ---



	end

	local function slot2(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		if not uv0.damondItems[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-11, warpins: 1 ---
			uv1(slot1)

			slot2 = uv0.damondItems[slot1]
			--- END OF BLOCK #0 ---



		end

		if uv0.tempDamondVOs[slot0 + 1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-25, warpins: 1 ---
			slot2:update(slot3, uv0.player, uv0.firstChargeIds)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end

	slot0.diamondRect = slot0:initRect(slot0.viewContainer:Find("diamondPanel"), slot1, slot2)
	slot0.giftRect = slot0:initRect(slot0.viewContainer:Find("giftPanel"), slot1, slot2)

	return
	--- END OF BLOCK #0 ---



end

function slot0.confirm(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-282, warpins: 1 ---
	if slot1.goods:isChargeType() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-34, warpins: 2 ---
		slot4 = (table.contains(slot0.firstChargeIds, slot1.goods.id) or slot1.goods:firstPayDouble()) and 4 or slot1.goods:getConfig("tag")

		if slot1.goods:isMonthCard() or slot1.goods:isGiftBox() or slot1.goods:isItemBox() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-154, warpins: 3 ---
			for slot11, slot12 in ipairs(slot7) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 57-69, warpins: 1 ---
				table.insert({}, {
					type = slot12[1],
					id = slot12[2],
					count = slot12[3]
				})
				--- END OF BLOCK #0 ---



			end

			if not slot5 and slot1.goods:getConfig("gem") + slot1.goods:getConfig("extra_gem") > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 86-91, warpins: 1 ---
				table.insert(slot6, {
					id = 4,
					type = 1,
					count = slot1.goods.getConfig("gem") + slot1.goods.getConfig("extra_gem")
				})
				--- END OF BLOCK #0 ---



			end

			slot9 = nil

			if slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 95-97, warpins: 1 ---
				slot9 = {
					id = 4,
					type = 1,
					count = slot8
				}
				--- END OF BLOCK #0 ---



			end

			slot0:showItemDetail({
				isChargeType = true,
				icon = "chargeicon/" .. slot1.goods:getConfig("picture"),
				name = slot1.goods:getConfig("name"),
				tipExtra = slot5 and i18n("charge_title_getitem_month") or i18n("charge_title_getitem"),
				extraItems = slot6,
				price = slot1.goods:getConfig("money"),
				tagType = slot4,
				isMonthCard = slot5,
				tipBonus = slot5 and i18n("charge_title_getitem_soon") or "",
				bonusItem = slot9,
				descExtra = slot1.goods:getConfig("descrip_extra"),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-19, warpins: 1 ---
					uv0:emit(ChargeMediator.CHARGE, uv1.goods.id)
					SetActive(uv0.detail, false)
					uv0:revertDetailBlur()

					return
					--- END OF BLOCK #0 ---



				end
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 155-160, warpins: 1 ---
			if slot1.goods:isGem() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 186-219, warpins: 2 ---
				slot0:showItemDetail({
					isChargeType = true,
					icon = "chargeicon/" .. slot1.goods:getConfig("picture"),
					name = slot1.goods:getConfig("name"),
					price = slot1.goods:getConfig("money"),
					tagType = slot4,
					normalTip = i18n("charge_start_tip", slot1.goods:getConfig("money"), slot3 and slot1.goods:getConfig("gem") + slot1.goods:getConfig("gem") or slot1.goods.getConfig("gem") + slot1.goods:getConfig("extra_gem")),
					onYes = function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-19, warpins: 1 ---
						uv0:emit(ChargeMediator.CHARGE, uv1.goods.id)
						SetActive(uv0.detail, false)
						uv0:revertDetailBlur()

						return
						--- END OF BLOCK #0 ---



					end
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 220-280, warpins: 1 ---
		slot2 = {}

		if type(pg.item_data_statistics[slot1.goods:getConfig("effect_args")[1]].display_icon) == "table" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 236-252, warpins: 1 ---
			for slot9, slot10 in ipairs(slot5) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 240-252, warpins: 1 ---
				table.insert(slot2, {
					type = slot10[1],
					id = slot10[2],
					count = slot10[3]
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		slot0:showItemDetail({
			isChargeType = false,
			isMonthCard = false,
			icon = slot4.icon,
			name = slot4.name,
			tipExtra = i18n("charge_title_getitem"),
			extraItems = slot2,
			price = slot1.goods:getConfig("resource_num"),
			tagType = slot1.goods:getConfig("tag"),
			onYes = function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-24, warpins: 1 ---
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					content = i18n("charge_scene_buy_confirm", uv0.goods:getConfig("resource_num"), uv1.name),
					onYes = function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-20, warpins: 1 ---
						uv0:revertDetailBlur()
						uv0:emit(ChargeMediator.BUY_ITEM, uv1.goods.id, 1)
						SetActive(uv0.detail, false)

						return
						--- END OF BLOCK #0 ---



					end
				})

				return
				--- END OF BLOCK #0 ---



			end
		})
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.sortDamondItems(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-217, warpins: 1 ---
	if slot0.damondItemVOs == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.page ~= uv0.TYPE_DIAMOND and slot2 ~= uv0.TYPE_GIFT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.tempDamondVOs = {}

	for slot6, slot7 in ipairs(slot0.damondItemVOs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-183, warpins: 1 ---
		if slot7:isChargeType() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-38, warpins: 1 ---
			slot7:updateBuyCount(slot0:getBuyCount(slot0.chargedList, slot7.id))

			if slot2 == uv0.TYPE_DIAMOND and (slot7:isMonthCard() or slot7:isGem() or slot7:isGiftBox()) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 54-58, warpins: 3 ---
				if slot7:canPurchase() and slot7:inTime() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 64-69, warpins: 1 ---
					table.insert(slot0.tempDamondVOs, slot7)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 70-73, warpins: 2 ---
				if slot2 == uv0.TYPE_GIFT and slot7:isItemBox() and slot7:canPurchase() and slot7:inTime() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 89-94, warpins: 1 ---
					table.insert(slot0.tempDamondVOs, slot7)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-99, warpins: 1 ---
			if not slot7:isChargeType() and slot2 == uv0.TYPE_GIFT and not slot7:isLevelLimit(slot0.player.level, true) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 127-169, warpins: 2 ---
				slot7:updateBuyCount(slot0:getBuyCount(slot0.normalList, slot7.id))

				slot9 = false

				if (slot7:getConfig("group") or 0) > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 131-145, warpins: 1 ---
					slot7:updateGroupCount(slot0:getGroupLimit(slot8))

					slot9 = slot7:getConfig("group_limit") > 0 and slot10 <= slot11
					--- END OF BLOCK #0 ---



				end

				slot10, slot11 = pg.TimeMgr.GetInstance():inTime(slot7:getConfig("time"))

				if slot11 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 164-167, warpins: 1 ---
					slot0:addUpdateTimer(slot11)
					--- END OF BLOCK #0 ---



				end

				if slot10 and slot7:canPurchase() and not slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 177-181, warpins: 1 ---
					table.insert(slot0.tempDamondVOs, slot7)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	table.sort(slot0.tempDamondVOs, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-203, warpins: 2 ---
		slot3 = not table.contains(uv0.firstChargeIds, slot0.id) and slot0:firstPayDouble() and 1 or 0
		slot5 = not table.contains(uv0.firstChargeIds, slot1.id) and slot1:firstPayDouble() and 1 or 0
		slot6 = 0
		slot7 = 0
		slot8 = nil

		if slot0:isChargeType() and slot0:isMonthCard() and uv0.player:getCardById(VipCard.MONTH) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 79-80, warpins: 2 ---
			slot6 = math.floor((slot9:getLeftDate() - pg.TimeMgr.GetInstance():GetServerTime()) / 86400) > (slot0:getConfig("limit_arg") or 0) and 1 or 0
			--- END OF BLOCK #0 ---



		end

		if slot1:isChargeType() and slot1:isMonthCard() and uv0.player:getCardById(VipCard.MONTH) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 125-126, warpins: 2 ---
			slot7 = math.floor((slot9:getLeftDate() - pg.TimeMgr.GetInstance():GetServerTime()) / 86400) > (slot1:getConfig("limit_arg") or 0) and 1 or 0
			--- END OF BLOCK #0 ---



		end

		if slot6 ~= slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 137-137, warpins: 2 ---
			return slot6 < slot7
			--- END OF BLOCK #0 ---



		end

		if slot3 and slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 142-143, warpins: 1 ---
			if slot2 == slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 162-163, warpins: 2 ---
				if (slot0:getConfig("tag") == 2 and 1 or 0) == (slot1:getConfig("tag") == 2 and 1 or 0) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 171-172, warpins: 2 ---
					return slot0.id < slot1.id
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 178-179, warpins: 2 ---
					return slot10 < slot9
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 195-195, warpins: 2 ---
				return (slot2 and 1 or 0) > (slot4 and 1 or 0)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return slot0.id < slot1.id
		--- END OF BLOCK #0 ---



	end)

	if slot2 == uv0.TYPE_DIAMOND then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 193-201, warpins: 1 ---
		slot0.diamondRect:SetTotalCount(#slot0.tempDamondVOs, slot0.diamondRect.value)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 202-205, warpins: 1 ---
		if slot2 == uv0.TYPE_GIFT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 206-213, warpins: 1 ---
			slot0.giftRect:SetTotalCount(#slot0.tempDamondVOs, slot0.diamondRect.value)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.createGoods(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return ChargeCard.New(slot1)
	--- END OF BLOCK #0 ---



end

function slot0.setItemVOs(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot0.itemVOs = {}

	for slot5, slot6 in pairs(pg.shop_template.all) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-25, warpins: 1 ---
		if slot1[slot6].genre == "gem_shop" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-23, warpins: 1 ---
			table.insert(slot0.itemVOs, Goods.New({
				count = 0,
				shop_id = slot6
			}, Goods.TYPE_MILITARY))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.initItems(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot0.isInitItems = true
	slot0.itemGos = {}
	slot0.itemRect = slot0:initRect(slot0.viewContainer:Find("itemPanel"), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-20, warpins: 1 ---
		slot1 = GoodsCard.New(slot0)

		table.insert(uv0.cards, slot1)
		onButton(uv0, slot1.tr, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-178, warpins: 1 ---
			if uv0.goodsVO:isLevelLimit(uv1.player.level) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-22, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("charge_level_limit"))

				return
				--- END OF BLOCK #0 ---



			end

			slot1 = {}
			slot2 = nil

			if uv0.goodsVO:getConfig("effect_args") == "ship_bag_size" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-60, warpins: 1 ---
				if Player.MAX_SHIP_BAG <= uv1.player.ship_bag_max then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 40-51, warpins: 1 ---
					pg.TipsMgr:GetInstance():ShowTips(i18n("charge_ship_bag_max"))

					return
					--- END OF BLOCK #0 ---



				end

				slot2 = ({
					count = 1,
					type = DROP_TYPE_ITEM,
					id = Goods.SHIP_BAG_SIZE_ITEM
				})["id"]
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 61-62, warpins: 1 ---
				if slot0 == "equip_bag_size" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 63-90, warpins: 1 ---
					if Player.MAX_EQUIP_BAG <= uv1.player.equip_bag_max then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 70-81, warpins: 1 ---
						pg.TipsMgr:GetInstance():ShowTips(i18n("charge_equip_bag_max"))

						return
						--- END OF BLOCK #0 ---



					end

					slot2 = ({
						count = 1,
						type = DROP_TYPE_ITEM,
						id = Goods.EQUIP_BAG_SIZE_ITEM
					})["id"]
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 91-92, warpins: 1 ---
					if slot0 == "commander_bag_size" then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 93-120, warpins: 1 ---
						if Player.MAX_COMMANDER_BAG <= uv1.player.commanderBagMax then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 100-111, warpins: 1 ---
							pg.TipsMgr:GetInstance():ShowTips(i18n("charge_commander_bag_max"))

							return
							--- END OF BLOCK #0 ---



						end

						slot2 = ({
							count = 1,
							type = DROP_TYPE_ITEM,
							id = Goods.COMMANDER_BAG_SIZE_ITEM
						})["id"]
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 121-153, warpins: 1 ---
						slot2 = (uv0.goodsVO:getConfig("type") ~= DROP_TYPE_RESOURCE or id2ItemId(({
							id = uv0.goodsVO:getConfig("effect_args")[1],
							type = uv0.goodsVO:getConfig("type"),
							count = uv0.goodsVO:getConfig("num")
						})["id"])) and ()["id"]
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideLine = true,
				yesText = "text_buy",
				type = MSGBOX_TYPE_SINGLE_ITEM,
				drop = slot1,
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-36, warpins: 1 ---
					if uv0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 4-35, warpins: 1 ---
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							content = i18n("charge_scene_buy_confirm", uv1.goodsVO:getConfig("resource_num"), Item.New({
								id = uv0
							}):getConfig("name")),
							onYes = function ()

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-11, warpins: 1 ---
								uv0:emit(ChargeMediator.BUY_ITEM, uv1.goodsVO.id, 1)

								return
								--- END OF BLOCK #0 ---



							end
						})
						--- END OF BLOCK #0 ---



					end

					return
					--- END OF BLOCK #0 ---



				end
			})

			return
			--- END OF BLOCK #0 ---



		end)

		uv0.itemGos[slot0] = slot1

		return
		--- END OF BLOCK #0 ---



	end, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-37, warpins: 1 ---
		if not uv0.itemGos[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-11, warpins: 1 ---
			uv1(slot1)

			slot2 = uv0.itemGos[slot1]
			--- END OF BLOCK #0 ---



		end

		slot2:update(slot3)
		slot2:setLevelMask(uv0.player.level)
		slot2:setGroupMask(uv0:getGroupLimit(uv0.itemVOs[slot0 + 1]:getConfig("group")))

		return
		--- END OF BLOCK #0 ---



	end)

	slot0:sortItems()

	return
	--- END OF BLOCK #0 ---



end

function slot0.sortItems(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	table.sort(slot0.itemVOs, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-38, warpins: 2 ---
		if (slot0:isLevelLimit(uv0.player.level) and 1 or 0) == (slot1:isLevelLimit(uv0.player.level) and 1 or 0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-32, warpins: 2 ---
			return slot1.id < slot0.id
			--- END OF BLOCK #0 ---



		end

		return slot2 < slot3
		--- END OF BLOCK #0 ---



	end)
	slot0.itemRect:SetTotalCount(#slot0.itemVOs, -1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeItemDetail(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	if slot0.detail and isActive(slot0.detail) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-15, warpins: 1 ---
		SetActive(slot0.detail, false)
		slot0:revertDetailBlur()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.showItemDetail(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 71-344, warpins: 2 ---
	slot2 = slot1.icon
	slot3 = slot1.name and slot1.name or ""
	slot4 = slot1.tipBonus or ""
	slot5 = slot1.bonusItem
	slot6 = slot1.tipExtra and slot1.tipExtra or ""
	slot7 = slot1.extraItems and slot1.extraItems or {}
	slot8 = slot1.price and slot1.price or 0
	slot9 = slot1.isChargeType
	slot10 = slot1.isMonthCard
	slot11 = slot1.tagType

	setActive(slot0:findTF("window2", slot0.detail), slot12)
	setActive(slot0:findTF("window", slot0.detail), not slot1.normalTip)
	slot0:bindDetailTF(slot1.normalTip and slot0:findTF("window2", slot0.detail) or slot0:findTF("window", slot0.detail))

	if slot0.detailNormalTip then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 75-78, warpins: 1 ---
		setActive(slot0.detailNormalTip, slot12)
		--- END OF BLOCK #0 ---



	end

	if slot0.detailContain then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 82-85, warpins: 1 ---
		setActive(slot0.detailContain, not slot12)
		--- END OF BLOCK #0 ---



	end

	if slot12 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 88-94, warpins: 1 ---
		if slot0.detailNormalTip:GetComponent("Text") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-99, warpins: 1 ---
			setText(slot0.detailNormalTip, slot12)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 100-103, warpins: 1 ---
			setButtonText(slot0.detailNormalTip, slot12)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.detailTag, slot11 > 0)

	if slot11 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 116-129, warpins: 1 ---
		for slot16, slot17 in ipairs(slot0.detailTags) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 127-129, warpins: 2 ---
			setActive(slot17, slot16 == slot11)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0.detailIconTF.sprite = GetSpriteFromAtlas("chargeicon/1", "")

	LoadSpriteAsync(slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-5, warpins: 1 ---
			uv0.detailIconTF.sprite = slot0
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	setText(slot0.detailName, slot3)
	setActive(slot0.detailRmb, slot9)
	setActive(slot0.detailGem, not slot9)

	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 154-158, warpins: 1 ---
		setText(slot0.detailPrice, slot8)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 159-164, warpins: 1 ---
		setText(slot0.detailPrice, usMoneyFormat(slot8))
		--- END OF BLOCK #0 ---



	end

	if slot0.detailDescExtra ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 186-186, warpins: 2 ---
		setActive(slot0.detailDescExtra, slot1.descExtra and slot1.descExtra ~= "")
		setText(slot0.detailDescExtra, slot1.descExtra or "")
		--- END OF BLOCK #0 ---



	end

	if slot0.detailContain then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 190-297, warpins: 1 ---
		SetActive(slot0.normal, slot10)

		if slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 196-228, warpins: 1 ---
			updateDrop(slot0.detailItem, slot5)
			onButton(slot0, slot0.detailItem, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				uv0:emit(uv1.ON_DROP, uv2)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)

			slot13, slot14 = contentWrap(slot5.cfg.name, 10, 2)

			if slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 214-216, warpins: 1 ---
				slot14 = slot14 .. "..."
				--- END OF BLOCK #0 ---



			end

			setText(slot0.detailItem:Find("name"), slot14)
			setText(slot0.detailTip, slot4)
			--- END OF BLOCK #0 ---



		end

		setText(slot0.detailTip2, slot6)

		for slot16 = #slot7, slot0.detailItemList.childCount - 1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 239-246, warpins: 2 ---
			Destroy(slot0.detailItemList:GetChild(slot16))
			--- END OF BLOCK #0 ---



		end

		for slot16 = slot0.detailItemList.childCount, #slot7 - 1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 253-257, warpins: 2 ---
			cloneTplTo(slot0.detailItem, slot0.detailItemList)
			--- END OF BLOCK #0 ---



		end

		for slot16 = 1, #slot7, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 262-297, warpins: 2 ---
			updateDrop(slot17, slot7[slot16])

			slot18, slot19 = contentWrap(slot7[slot16].cfg.name, 8, 2)

			if slot18 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 280-282, warpins: 1 ---
				slot19 = slot19 .. "..."
				--- END OF BLOCK #0 ---



			end

			setText(slot17:Find("name"), slot19)
			onButton(slot0, slot17, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-15, warpins: 1 ---
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					hideNo = true,
					type = MSGBOX_TYPE_SINGLE_ITEM,
					drop = uv0[uv1]
				})

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot0:findTF("back_sign", slot0.detail), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		SetActive(uv0.detail, false)
		uv0:revertDetailBlur()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("button_container/button_cancel", slot0.detailWindow), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		SetActive(uv0.detail, false)
		uv0:revertDetailBlur()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0:findTF("button_container/button_ok", slot0.detailWindow), slot1.onYes or function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-1, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	setActive(slot0.detail, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.blurPanel)

	return
	--- END OF BLOCK #0 ---



end

function slot0.bindDetailTF(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-162, warpins: 1 ---
	slot0.detailWindow = slot1
	slot0.detailName = slot0:findTF("goods/name", slot0.detailWindow)
	slot0.detailIcon = slot0:findTF("goods/icon", slot0.detailWindow)
	slot0.detailIconTF = slot0.detailIcon:GetComponent(typeof(Image))
	slot0.detailRmb = slot0:findTF("prince_bg/contain/icon_rmb", slot0.detailWindow)
	slot0.detailGem = slot0:findTF("prince_bg/contain/icon_gem", slot0.detailWindow)
	slot0.detailPrice = slot0:findTF("prince_bg/contain/Text", slot0.detailWindow)
	slot0.detailTag = slot0:findTF("goods/tag", slot0.detailWindow)
	slot0.detailTags = {}

	table.insert(slot0.detailTags, slot0:findTF("hot", slot0.detailTag))
	table.insert(slot0.detailTags, slot0:findTF("new", slot0.detailTag))
	table.insert(slot0.detailTags, slot0:findTF("advice", slot0.detailTag))
	table.insert(slot0.detailTags, slot0:findTF("double", slot0.detailTag))
	table.insert(slot0.detailTags, slot0:findTF("discount", slot0.detailTag))

	slot0.detailTagDoubleTF = slot0:findTF("double", slot0.detailTag)
	slot0.detailTagAdviceTF = slot0:findTF("advice", slot0.detailTag)
	slot0.detailContain = slot0:findTF("container", slot0.detailWindow)

	if slot0.detailContain then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 114-155, warpins: 1 ---
		slot0.extra = slot0:findTF("container/items", slot0.detailWindow)
		slot0.detailTip2 = slot0:findTF("Text", slot0.extra)
		slot0.detailItemList = slot0:findTF("scrollview/list", slot0.extra)
		slot0.normal = slot0:findTF("container/normal_items", slot0.detailWindow)
		slot0.detailTip = slot0:findTF("Text", slot0.normal)
		slot0.detailItem = slot0:findTF("item_tpl", slot0.normal)
		slot0.detailDescExtra = slot0:findTF("container/Text", slot0.detailWindow)
		--- END OF BLOCK #0 ---



	end

	slot0.detailNormalTip = slot0:findTF("NormalTips", slot0.detailWindow)

	return
	--- END OF BLOCK #0 ---



end

function slot0.getBuyCount(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-4, warpins: 1 ---
		return 0
		--- END OF BLOCK #0 ---



	end

	return slot1[slot2] and slot3.buyCount or 0
	--- END OF BLOCK #0 ---



end

function slot0.getGroupLimit(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	if not slot0.normalGroupList then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		return 0
		--- END OF BLOCK #0 ---



	end

	for slot5, slot6 in ipairs(slot0.normalGroupList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-16, warpins: 1 ---
		if slot6.shop_id == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			return slot6.pay_count
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return 0
	--- END OF BLOCK #0 ---



end

function slot0.updateNoRes(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-121, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-5, warpins: 1 ---
		slot1 = slot0.contextData.noRes
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot0.contextData.noRes = slot1
		--- END OF BLOCK #0 ---



	end

	if not slot1 or #slot1 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.contextData.noRes = {}
	slot3 = getProxy(BagProxy).getData(slot2)
	slot4 = ""

	for slot8, slot9 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-69, warpins: 1 ---
		if slot9[2] > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-35, warpins: 1 ---
			if slot9[1] == 59001 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-42, warpins: 1 ---
				slot1[slot8][2] = slot9[3] - slot0.player.gold
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 55-56, warpins: 2 ---
				slot1[slot8][2] = slot9[3] - (slot3[slot9[1]] and slot3[slot9[1]].count or 0)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		if slot1[slot8][2] > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-67, warpins: 1 ---
			table.insert(slot0.contextData.noRes, slot1[slot8])
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	for slot8, slot9 in ipairs(slot0.contextData.noRes) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 87-102, warpins: 2 ---
		if slot8 < #slot0.contextData.noRes then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 96-100, warpins: 1 ---
			slot4 = slot4 .. i18n(slot9[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", pg.item_data_statistics[slot9[1]].name, slot9[2]) .. i18n("text_noRes_info_tip_link")
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot4 == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 105-112, warpins: 1 ---
		slot0:displayShipWord(i18n("text_shop_enoughRes_tip"), false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 113-120, warpins: 1 ---
		slot0:displayShipWord(i18n("text_shop_noRes_tip", slot4), true)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayShipWord(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-95, warpins: 1 ---
	if not slot0.chatFlag then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-93, warpins: 1 ---
		if not slot1 and slot0.contextData.noRes and #slot0.contextData.noRes > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-27, warpins: 1 ---
			setActive(slot0.chat, false)

			slot0.chat.transform.localScale = Vector3(0, 0, 1)
			--- END OF BLOCK #0 ---



		end

		slot0.chatFlag = true

		setActive(slot0.chat, true)

		slot6 = nil
		slot6 = (not slot3 or pg.pay_level_award[slot3 or math.random(1, slot0.player:getChargeLevel())].dialog) and (slot1 or pg.pay_level_award[slot3 or math.random(1, slot0.player.getChargeLevel())].dialog)

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-64, warpins: 1 ---
			slot0:playCV(slot5)
			--- END OF BLOCK #0 ---



		end

		setText(slot0.chatText, HXSet.hxLan(slot6))

		if CHAT_POP_STR_LEN_SHORT < #slot0.chatText:GetComponent(typeof(Text)).text then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 84-87, warpins: 1 ---
			slot7.alignment = TextAnchor.MiddleLeft
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 88-90, warpins: 1 ---
			slot7.alignment = TextAnchor.MiddleCenter
			--- END OF BLOCK #0 ---



		end

		function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-40, warpins: 1 ---
			slot0 = 3

			LeanTween.scale(rtf(uv0.chat.gameObject), Vector3.New(1, 1, 1), slot1):setFrom(Vector3.New(0, 0, 0)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-41, warpins: 1 ---
				if not uv0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 4-37, warpins: 1 ---
					LeanTween.scale(rtf(uv1.chat.gameObject), Vector3.New(0, 0, 1), uv2):setEase(LeanTweenType.easeInBack):setDelay(uv2 + uv3):setOnComplete(System.Action(function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-25, warpins: 1 ---
						uv0.chatFlag = nil

						setActive(uv0.chat, false)

						if uv0.contextData.noRes and #uv0.contextData.noRes > 0 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 21-24, warpins: 1 ---
							uv0:updateNoRes()
							--- END OF BLOCK #0 ---



						end

						return
						--- END OF BLOCK #0 ---



					end))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 38-40, warpins: 1 ---
					uv1.chatFlag = nil
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end))

			return
			--- END OF BLOCK #0 ---



		end()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.playHeartEffect(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	if slot0.heartsTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0.heartsTimer:Stop()
		--- END OF BLOCK #0 ---



	end

	setActive(slot1, true)

	slot0.heartsTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		setActive(uv0, false)

		return
		--- END OF BLOCK #0 ---



	end, 1, 1)

	slot0.heartsTimer:Start()

	return
	--- END OF BLOCK #0 ---



end

function slot0.addRefreshTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot2()

	slot0.refreshTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-31, warpins: 1 ---
		if uv0 + 1 - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-22, warpins: 1 ---
			uv1()
			uv2:emit(ChargeMediator.GET_CHARGE_LIST)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-30, warpins: 1 ---
			slot1 = pg.TimeMgr.GetInstance():DescCDTime(slot0)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, 1, -1)

	slot0.refreshTimer:Start()
	slot0.refreshTimer.func()

	return
	--- END OF BLOCK #0 ---



end

function slot0.addUpdateTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-37, warpins: 1 ---
	if slot0.refreshTime and pg.TimeMgr:GetInstance():LaterThan(slot1, slot0.refreshTime) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-16, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.refreshTime = slot1

	slot0:removeUpdateTimer()

	slot0.updateTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		if uv0:LaterThan(os.server_date("*t", uv0:GetServerTime()), uv1) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-24, warpins: 1 ---
			uv2:removeUpdateTimer()
			uv2:sortDamondItems()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, 1, -1)

	slot0.updateTimer:Start()
	slot0.updateTimer.func()

	return
	--- END OF BLOCK #0 ---



end

function slot0.removeUpdateTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	if slot0.updateTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.updateTimer:Stop()

		slot0.updateTimer = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.createLive2D(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot0.live2dChar = Live2D.New(Live2D.live2dData({
		ship = Ship.New({
			configId = 312011
		}),
		scale = Vector3(75, 75, 75),
		position = Vector3(0, 0, 100),
		parent = slot0:findTF("frame/painting/live2d")
	}))

	return
	--- END OF BLOCK #0 ---



end

function slot0.checkBuyDone(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-78, warpins: 1 ---
	if not slot0.live2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot2 = nil

	if type(slot1) == "string" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		if slot1 == "damonds" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot2 = "diamond"
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 1 ---
			slot2 = slot1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-21, warpins: 1 ---
		if pg.shop_template[slot1] and slot3.effect_args and type(slot3.effect_args) == "table" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-38, warpins: 1 ---
			for slot7, slot8 in ipairs(slot3.effect_args) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-38, warpins: 1 ---
				if slot8 == 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 36-36, warpins: 1 ---
					slot2 = "gold"
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot5 = (slot0.preAniName == "gold" or slot0.preAniName == "diamond") and (slot2 == "gold" or slot2 == "diamond") or not (slot0.preAniName == "gold" or slot0.preAniName == "diamond")

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-64, warpins: 1 ---
		if slot0.preAniName ~= slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 65-65, warpins: 1 ---
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 66-67, warpins: 1 ---
			slot5 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 68-68, warpins: 0 ---
				slot5 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-77, warpins: 1 ---
		slot0.preAniName = slot2

		slot0.live2dChar:TriggerAction(slot2, true)
		--- END OF BLOCK #0 ---



	end

	return slot5
	--- END OF BLOCK #0 ---



end

function slot0.playCV(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-34, warpins: 1 ---
	slot3 = nil

	if pg.pay_level_award[slot1] and slot2.cv_key ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-12, warpins: 1 ---
		slot3 = "event:/cv/chargeShop/" .. slot2.cv_key
		--- END OF BLOCK #0 ---



	end

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-32, warpins: 1 ---
		if slot0.loadedCVBankName then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-21, warpins: 1 ---
			function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				uv0:stopCV()

				uv0._currentVoice = playSoundEffect(uv1)

				return
				--- END OF BLOCK #0 ---



			end()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-31, warpins: 1 ---
			pg.CriMgr:LoadCV("chargeShop", function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-24, warpins: 1 ---
				if uv1.exited then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 10-15, warpins: 1 ---
					pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(uv0))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 16-21, warpins: 1 ---
					uv2()

					if uv1._currentVoice then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 22-23, warpins: 1 ---
						uv1.loadedCVBankName = slot0
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.stopCV(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	if slot0._currentVoice then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		slot0._currentVoice:Stop(true)
		--- END OF BLOCK #0 ---



	end

	slot0._currentVoice = nil

	return
	--- END OF BLOCK #0 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-34, warpins: 1 ---
	if slot0.detail and isActive(slot0.detail) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-16, warpins: 1 ---
		setActive(slot0.detail, false)
		slot0:revertDetailBlur()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-21, warpins: 2 ---
		if slot0.prePage ~= uv0.TYPE_MENU then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-25, warpins: 1 ---
			slot0:switchToMenu()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-33, warpins: 1 ---
			playSoundEffect(SFX_CANCEL)
			slot0:emit(uv0.ON_BACK)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.revertDetailBlur(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	pg.UIMgr.GetInstance():UnblurPanel(slot0.blurPanel, slot0._tf)

	return
	--- END OF BLOCK #0 ---



end

function slot0.blurView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	pg.UIMgr.GetInstance():OverlayPanelPB(slot0.viewContainer, {
		pbList = {
			slot0:findTF("blurBg", slot0.viewContainer)
		}
	})

	return
	--- END OF BLOCK #0 ---



end

function slot0.unBlurView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.viewContainer, slot0.frame)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-90, warpins: 1 ---
	slot0:unBlurView()

	for slot4, slot5 in ipairs(slot0.cards) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		slot5:dispose()
		--- END OF BLOCK #0 ---



	end

	if slot0.resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-21, warpins: 1 ---
		slot0.resPanel:exit()

		slot0.resPanel = nil
		--- END OF BLOCK #0 ---



	end

	for slot4, slot5 in pairs(slot0.damondItems or {}) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-42, warpins: 1 ---
		if slot5.skinPainting then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-37, warpins: 1 ---
			retPaintingPrefab(slot5.painting, slot5.skinPainting)

			slot5.skinPainting = nil
			--- END OF BLOCK #0 ---



		end

		slot5:destoryTimer()
		--- END OF BLOCK #0 ---



	end

	if slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-48, warpins: 1 ---
		cancelTweens(slot0.tweens)
		--- END OF BLOCK #0 ---



	end

	slot0:removeUpdateTimer()

	if slot0.heartsTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-60, warpins: 1 ---
		slot0.heartsTimer:Stop()

		slot0.heartsTimer = nil
		--- END OF BLOCK #0 ---



	end

	if slot0.live2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-67, warpins: 1 ---
		slot0.live2dChar:Dispose()
		--- END OF BLOCK #0 ---



	end

	if slot0.live2dTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-76, warpins: 1 ---
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
		--- END OF BLOCK #0 ---



	end

	slot0:stopCV()

	if slot0.loadedCVBankName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 83-89, warpins: 1 ---
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

return slot0
