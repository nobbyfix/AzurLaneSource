slot0 = class("SwichSkinLayer", import("..base.BaseUI"))

slot0.setShip = function (slot0, slot1)
	slot0.shipVO = slot1
end

slot0.setShipSkin = function (slot0, slot1)
	slot0.shipVO.skinId = slot1
end

slot0.setSkinList = function (slot0, slot1)
	slot0.skinList = slot1
	slot0.skins = slot0:getGroupSkinList(slot0.shipVO.groupId)
	slot0.owns = slot0:getGroupOwnSkins(slot0.shipVO.groupId)
end

slot0.getUIName = function (slot0)
	return "SwichSkinLayer"
end

slot0.back = function (slot0)
	slot0:emit(slot0.ON_CLOSE)
end

slot0.init = function (slot0)
	return
end

slot0.didEnter = function (slot0)
	slot0:initSelectSkinPanel()

	if slot0.shipVO and #slot0.skins > 1 then
		slot0:openSelectSkinPanel()
	end
end

slot0.initSelectSkinPanel = function (slot0)
	slot0.skinPanel = slot0._tf

	onButton(slot0, slot1, function ()
		slot0:back()
	end)
	onButton(slot0, slot2, function ()
		slot0:back()
	end)

	slot0.skinScroll = slot0:findTF("select_skin/style_scroll", slot0.skinPanel)
	slot0.skinContainer = slot0:findTF("view_port", slot0.skinScroll)
	slot0.skinCard = slot0._go:GetComponent(typeof(ItemList)).prefabItem[0]

	setActive(slot0.skinCard, false)

	slot0.skinCardMap = {}
end

slot0.openSelectSkinPanel = function (slot0)
	for slot4 = slot0.skinContainer.childCount, #slot0.skins - 1, 1 do
		cloneTplTo(slot0.skinCard, slot0.skinContainer)
	end

	for slot4 = #slot0.skins, slot0.skinContainer.childCount - 1, 1 do
		setActive(slot0.skinContainer:GetChild(slot4), false)
	end

	slot1 = slot0.skinContainer.childCount

	for slot5, slot6 in ipairs(slot0.skins) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-43, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 51-57, warpins: 2 ---
		if not slot0.skinCardMap[slot0.skinContainer:GetChild(slot5 - 1)] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-50, warpins: 1 ---
			slot0.skinCardMap[slot7] = ShipSkinCard.New(slot7.gameObject)
			--- END OF BLOCK #0 ---



		end

		slot9 = slot0.shipVO:getRemouldSkinId() == slot6.id and slot0.shipVO:isRemoulded()

		slot8:updateData(slot0.shipVO, slot6, slot0.shipVO:proposeSkinOwned(slot6) or table.contains(slot0.skinList, slot6.id) or (slot0.shipVO.getRemouldSkinId() == slot6.id and slot0.shipVO.isRemoulded()) or slot6.skin_type == 3)
		slot8:updateSkin(slot6, slot0.shipVO.proposeSkinOwned(slot6) or table.contains(slot0.skinList, slot6.id) or (slot0.shipVO.getRemouldSkinId() == slot6.id and slot0.shipVO.isRemoulded()) or slot6.skin_type == 3)
		slot8:updateUsing(slot0.shipVO.skinId == slot6.id)
		removeOnButton(slot7)

		slot14 = ((slot6.shop_id > 0 and pg.shop_template[slot6.shop_id]) or nil) and not pg.TimeMgr.GetInstance():inTime((slot6.shop_id > 0 and pg.shop_template[slot6.shop_id]) or nil.time)
		slot15 = slot6.id == slot0.shipVO.skinId
		slot16 = slot6.id == slot0.shipVO:getConfig("skin_id") or (((slot0.shipVO:proposeSkinOwned(slot6) or table.contains(slot0.skinList, slot6.id) or (slot0.shipVO:getRemouldSkinId() == slot6.id and slot0.shipVO:isRemoulded())) and 1) or 0) >= 1 or slot6.skin_type == 3

		onToggle(slot0, slot8.hideObjToggleTF, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot1 = PlayerPrefs.SetInt
			slot2 = "paint_hide_other_obj_" .. slot0.paintingName

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-10, warpins: 1 ---
				slot3 = 1
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-11, warpins: 1 ---
				slot3 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-26, warpins: 2 ---
			slot1(slot2, slot3)
			slot0:flushSkin()
			slot0.flushSkin:emit(SwichSkinMediator.UPDATE_SKINCONFIG, slot1.shipVO.skinId)

			return
			--- END OF BLOCK #1 ---



		end, SFX_PANEL)
		onButton(slot0, slot7, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-8, warpins: 1 ---
				slot1:back()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-11, warpins: 1 ---
				if slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 12-29, warpins: 1 ---
					slot0 = slot1.emit
					slot2 = SwichSkinMediator.CHANGE_SKIN

					if slot3.id == slot1.shipVO:getConfig("skin_id") then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 30-31, warpins: 1 ---
						slot4 = 0
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 32-33, warpins: 1 ---
						slot4 = slot3.id
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 34-39, warpins: 2 ---
					slot0(slot1, slot2, slot3, slot4)
					slot1:back()
					--- END OF BLOCK #1 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 40-42, warpins: 1 ---
					if slot4 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 43-45, warpins: 1 ---
						if slot5 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 46-56, warpins: 1 ---
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_skin_out_of_stock"))
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 57-74, warpins: 1 ---
							slot0 = Goods.New({
								shop_id = slot4.id
							}, Goods.TYPE_SKIN)
							slot1 = slot0:getConfig("resource_num")

							if slot0:isDisCount() then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 75-81, warpins: 1 ---
								slot1 = slot1 * (100 - slot0:getConfig("discount")) / 100
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 82-101, warpins: 2 ---
							pg.MsgboxMgr.GetInstance():ShowMsgBox({
								content = i18n("text_buy_fashion_tip", slot1, HXSet.hxLan(slot3.name)),
								onYes = function ()

									-- Decompilation error in this vicinity:
									--- BLOCK #0 1-10, warpins: 1 ---
									slot0:emit(SwichSkinMediator.BUY_ITEM, slot1.id, 1)

									return
									--- END OF BLOCK #0 ---



								end
							})
							--- END OF BLOCK #1 ---



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
			--- BLOCK #1 102-102, warpins: 5 ---
			return
			--- END OF BLOCK #1 ---



		end)
		setActive(slot7, true)

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 58-62, warpins: 1 ---
		slot9 = slot0.shipVO.isRemoulded()

		if slot0.shipVO.isRemoulded() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-64, warpins: 1 ---
			slot9 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-65, warpins: 0 ---
				slot9 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 66-72, warpins: 3 ---
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #4 73-79, warpins: 1 ---
		if not table.contains(slot0.skinList, slot6.id) and not slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 82-84, warpins: 1 ---
			if slot6.skin_type ~= 3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-86, warpins: 1 ---
				slot10 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 87-87, warpins: 1 ---
				slot10 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 88-105, warpins: 5 ---
		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #6 106-107, warpins: 1 ---
		slot13 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 108-108, warpins: 1 ---
			slot13 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 109-119, warpins: 2 ---
		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #8 120-124, warpins: 1 ---
		slot11 = slot0.shipVO.isRemoulded()

		if slot0.shipVO.isRemoulded() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 125-126, warpins: 1 ---
			slot11 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 127-127, warpins: 0 ---
				slot11 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 128-134, warpins: 3 ---
		--- END OF BLOCK #9 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #10 135-141, warpins: 1 ---
		if table.contains(slot0.skinList, slot6.id) or slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 144-145, warpins: 3 ---
			slot12 = 1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 146-146, warpins: 1 ---
			slot12 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #10 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #11 147-150, warpins: 2 ---
		--- END OF BLOCK #11 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #12 151-156, warpins: 1 ---
		if not pg.shop_template[slot6.shop_id] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 157-157, warpins: 2 ---
			slot13 = nil
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #12 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #13 158-159, warpins: 2 ---
		--- END OF BLOCK #13 ---

		FLOW; TARGET BLOCK #15



		-- Decompilation error in this vicinity:
		--- BLOCK #14 160-168, warpins: 1 ---
		slot14 = not pg.TimeMgr.GetInstance().inTime((slot6.shop_id > 0 and pg.shop_template[slot6.shop_id]) or nil.time)
		--- END OF BLOCK #14 ---

		FLOW; TARGET BLOCK #15



		-- Decompilation error in this vicinity:
		--- BLOCK #15 169-173, warpins: 2 ---
		--- END OF BLOCK #15 ---

		FLOW; TARGET BLOCK #17



		-- Decompilation error in this vicinity:
		--- BLOCK #16 174-175, warpins: 1 ---
		slot15 = false

		if false then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 176-176, warpins: 1 ---
			slot15 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #16 ---

		FLOW; TARGET BLOCK #17



		-- Decompilation error in this vicinity:
		--- BLOCK #17 177-184, warpins: 2 ---
		--- END OF BLOCK #17 ---

		FLOW; TARGET BLOCK #19



		-- Decompilation error in this vicinity:
		--- BLOCK #18 185-187, warpins: 1 ---
		if slot12 < 1 and slot6.skin_type ~= 3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 191-192, warpins: 1 ---
			slot16 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 193-193, warpins: 3 ---
			slot16 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #18 ---

		FLOW; TARGET BLOCK #19



		-- Decompilation error in this vicinity:
		--- BLOCK #19 194-210, warpins: 2 ---
		--- END OF BLOCK #19 ---

		FLOW; TARGET BLOCK #20



		-- Decompilation error in this vicinity:
		--- BLOCK #20 211-212, warpins: 2 ---
		--- END OF BLOCK #20 ---



	end
end

slot0.isCurrentShipExistSkin = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-7, warpins: 1 ---
		if #slot0.skins > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-10, warpins: 1 ---
			return true
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-14, warpins: 1 ---
			if #slot0.skins == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-16, warpins: 1 ---
				return false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.getGroupSkinList = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot2 = ShipGroup.getSkinList(slot1)

	if pg.ship_data_trans[slot1] and not slot0.shipVO:isRemoulded() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-24, warpins: 1 ---
		slot3 = ShipGroup.GetGroupConfig(slot1).trans_skin

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-35, warpins: 0 ---
		for slot7 = #slot2, 1, -1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-28, warpins: 2 ---
			if slot2[slot7].id == slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 29-34, warpins: 1 ---
				table.remove(slot2, slot7)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 35-35, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 35-35, warpins: 1 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 36-39, warpins: 4 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 40-73, warpins: 0 ---
	for slot6 = #slot2, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-43, warpins: 2 ---
		if slot2[slot6].show_time and ((type(slot7.show_time) == "string" and slot7.show_time == "stop") or (type(slot7.show_time) == "table" and not pg.TimeMgr:GetInstance():inTime(slot7.show_time))) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 68-72, warpins: 2 ---
			table.remove(slot2, slot6)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 73-73, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 74-77, warpins: 1 ---
	if PLATFORM_CODE == PLATFORM_CH then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 78-85, warpins: 1 ---
		slot3 = pg.gameset.big_seven_old_skin_timestamp.key_value

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 86-99, warpins: 0 ---
		for slot7 = #slot2, 1, -1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 86-89, warpins: 2 ---
			if slot2[slot7].skin_type == 3 and slot3 < slot0.shipVO.createTime then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 94-98, warpins: 1 ---
				table.remove(slot2, slot7)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 99-99, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 100-100, warpins: 2 ---
	return slot2
	--- END OF BLOCK #4 ---



end

slot0.getGroupOwnSkins = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot2 = {}
	slot3 = slot0.skinList

	if getProxy(CollectionProxy):getShipGroup(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-19, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-52, warpins: 0 ---
		for slot9, slot10 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-24, warpins: 1 ---
			if slot10.skin_type == Ship.SKIN_TYPE_DEFAULT or table.contains(slot3, slot10.id) or (slot10.skin_type == Ship.SKIN_TYPE_REMAKE and slot4.trans) or (slot10.skin_type == Ship.SKIN_TYPE_PROPOSE and slot4.married == 1) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 48-50, warpins: 4 ---
				slot2[slot10.id] = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 51-52, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 53-53, warpins: 2 ---
	return slot2
	--- END OF BLOCK #1 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.skinCardMap) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:clear()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

return slot0
