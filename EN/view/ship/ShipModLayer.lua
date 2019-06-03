slot0 = class("ShipModLayer", import("..base.BaseUI"))
slot1 = 12
slot0.IGNORE_ID = 4

function slot0.getUIName(slot0)
	return "ShipModUI"
end

function slot0.setShipVOs(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.init(slot0)
	slot0.blurPanelTF = slot0:findTF("blur_panel")
	slot0.mainPanel = slot0:findTF("blur_panel/main")
	slot0.shipContainer = slot0:findTF("bg/add_ship_panel/ships", slot0.mainPanel)
	slot0.attrsPanel = slot0:findTF("bg/property_panel/attrs", slot0.mainPanel)

	setText(slot0:findTF("bg/add_ship_panel/title/tip", slot0.mainPanel), i18n("ship_mod_exp_to_attr_tip"))
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0:findTF("ok_btn", slot0.mainPanel), function ()
		function slot0()
			slot0, slot1 = Ship.canModifyShip(uv0.shipVO)

			if not slot0 then
				pg.TipsMgr:GetInstance():ShowTips(slot1)

				return
			end

			if table.getCount(uv0.contextData.materialShipIds or {}) == 0 then
				pg.TipsMgr:GetInstance():ShowTips(i18n("word_materal_no_enough"))

				return
			elseif not _.all(uv0:hasEliteShips(uv0.contextData.materialShipIds, uv0.shipVOs), function (slot0)
				return slot0 == ""
			end) then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("destroy_eliteship_tip", string.gsub(table.concat(slot2, ""), "$1", slot2[1] == "" and "" or ",")),
					onYes = function ()
						uv0:startModShip()
					end
				})
			else
				uv0:startModShip()
			end
		end

		if uv0.shipVO:isActivityNpc() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("npc_strength_tip"),
				onYes = function ()
					slot0, slot1 = Ship.canModifyShip(uv0.shipVO)

					if not slot0 then
						pg.TipsMgr.GetInstance().ShowTips(slot1)

						return
					end

					if table.getCount(uv0.contextData.materialShipIds or ) == 0 then
						pg.TipsMgr.GetInstance().ShowTips(i18n("word_materal_no_enough"))

						return
					elseif not _.all(uv0.hasEliteShips(uv0.contextData.materialShipIds, uv0.shipVOs), function (slot0)
						return slot0 == ""
					end) then
						pg.MsgboxMgr.GetInstance().ShowMsgBox()
					else
						uv0.startModShip()
					end
				end
			})
		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-24, warpins: 1 ---
			slot0()
			--- END OF BLOCK #0 ---



		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0:findTF("cancel_btn", slot0.mainPanel), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		if not uv0.contextData.materialShipIds or table.getCount(slot0) == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-12, warpins: 2 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-17, warpins: 2 ---
		uv0:clearAllShip()

		return
		--- END OF BLOCK #1 ---



	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("select_btn", slot0.mainPanel), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		uv0:emit(ShipModMediator.ON_AUTO_SELECT_SHIP)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	slot0:initAttrs()

	slot0.inited = true

	slot0:emit(ShipModMediator.LOADEND, slot0.mainPanel)
	slot0:blurPanel(true)
end

function slot0.blurPanel(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = pg.UIMgr.GetInstance()

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-27, warpins: 1 ---
		pg.UIMgr.GetInstance():OverlayPanelPB(slot0.blurPanelTF, {
			pbList = {
				slot0.mainPanel:Find("bg")
			},
			groupName = slot0:getGroupNameFromData(),
			overlayType = LayerWeightConst.OVERLAY_UI_ADAPT
		})
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-32, warpins: 1 ---
		slot2:UnOverlayPanel(slot0.blurPanelTF, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-33, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.startModShip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.hasAddition then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-18, warpins: 1 ---
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_mod_no_addition_tip"),
			onYes = function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				uv0:emit(ShipModMediator.MOD_SHIP, uv0.shipVO.id)

				return
				--- END OF BLOCK #0 ---



			end
		})
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-25, warpins: 1 ---
		slot0:emit(ShipModMediator.MOD_SHIP, slot0.shipVO.id)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-27, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.hasEliteShips(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	function slot4(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if not _.include(uv0, slot0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-9, warpins: 1 ---
			uv0[slot1] = slot0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-10, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	_.each(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if uv0[slot0].level > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-12, warpins: 1 ---
			uv1(i18n("destroy_high_level_tip"), 2)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-18, warpins: 2 ---
		if slot1:getRarity() >= 4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-24, warpins: 1 ---
			uv1(i18n("destroy_high_rarity_tip"), 1)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 25-25, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end)

	return {
		"",
		""
	}
	--- END OF BLOCK #0 ---



end

function slot0.setShip(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.shipVO and slot0.shipVO.id ~= slot1.id then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-11, warpins: 1 ---
		slot0:switchToPage()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-18, warpins: 3 ---
	slot0.shipVO = slot1

	slot0:initSelectedShips()

	if slot0.inited then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-21, warpins: 1 ---
		slot0:initAttrs()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-22, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.clearAllShip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-26, warpins: 0 ---
	for slot4 = 1, uv0, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-26, warpins: 2 ---
		slot5 = slot0.shipContainer:GetChild(slot4 - 1)

		setActive(slot5:Find("IconTpl"), false)
		onButton(slot0, slot5:Find("add"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			uv0:emit(ShipModMediator.ON_SELECT_MATERIAL_SHIPS)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-34, warpins: 1 ---
	slot0.contextData.materialShipIds = nil

	slot0:updateAttrs()

	return
	--- END OF BLOCK #2 ---



end

function slot0.initSelectedShips(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 6-13, warpins: 2 ---
	slot2 = table.getCount(slot0.contextData.materialShipIds or {})

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-47, warpins: 0 ---
	for slot6 = 1, uv0, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-20, warpins: 2 ---
		slot7 = slot0.shipContainer:GetChild(slot6 - 1)

		if slot6 <= slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-26, warpins: 1 ---
			slot0:updateShip(slot0.shipContainer.GetChild(slot6 - 1), slot1[slot6])
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-35, warpins: 1 ---
			onButton(slot0, slot7:Find("add"), function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				uv0:emit(ShipModMediator.ON_SELECT_MATERIAL_SHIPS)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 46-47, warpins: 2 ---
		setActive(slot7:Find("IconTpl"), slot6 <= slot2)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 48-49, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.updateShip(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	onButton(slot0, slot1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-42, warpins: 0 ---
		for slot3, slot4 in pairs(uv0.contextData.materialShipIds) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-9, warpins: 1 ---
			if uv1 == slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-40, warpins: 1 ---
				setActive(uv2:Find("IconTpl"), false)
				onButton(uv0, slot5, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-7, warpins: 1 ---
					uv0:emit(ShipModMediator.ON_SELECT_MATERIAL_SHIPS)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				table.remove(uv0.contextData.materialShipIds, slot3)
				uv0:updateAttrs()

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 41-41, warpins: 1 ---
				break
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-42, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 43-43, warpins: 2 ---
		return
		--- END OF BLOCK #2 ---



	end, SFX_PANEL)
	updateShip(slot0:findTF("IconTpl", slot1), slot3, {
		initStar = true
	})
	setText(slot1:Find("IconTpl/icon_bg/lv/Text"), slot0.shipVOs[slot2].level)

	return
	--- END OF BLOCK #0 ---



end

function slot0.initAttrs(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.attrTFs = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-21, warpins: 0 ---
	for slot4, slot5 in pairs(ShipModAttr.ID_TO_ATTR) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		if slot0.IGNORE_ID ~= slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-19, warpins: 1 ---
			slot0.attrTFs[slot4] = slot0.attrsPanel:Find("attr_" .. slot4)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 20-21, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-25, warpins: 1 ---
	slot0:updateAttrs()

	return
	--- END OF BLOCK #2 ---



end

function slot0.updateAttrs(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.hasAddition = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-12, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.attrTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		slot0:updateAttr(slot4)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-12, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 13-13, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.updateAttr(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-54, warpins: 1 ---
	slot3 = slot0:findTF("info", slot2)
	slot4 = slot0.attrTFs[slot1].GetComponent(slot2, typeof(CanvasGroup))
	slot6 = slot0.shipVO:getModAttrTopLimit(slot5)
	slot7 = intProperties(slot0.shipVO:getShipProperties())
	slot10 = slot0.shipVO:getModExpRatio(slot5)
	slot11 = math.max(slot0.shipVO:getModExpRatio(ShipModAttr.ID_TO_ATTR[slot1]), 1)

	if uv0.getExpAddition(slot0.shipVO, slot8, slot5) ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-56, warpins: 1 ---
		slot0.hasAddition = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 123-148, warpins: 2 ---
	setText(slot0:findTF("info_container/addition", slot3), "+" .. slot14)
	setText(slot0:findTF("info_container/name", slot3), AttributeType.Type2Name(slot5))
	setText(slot0:findTF("max_container/Text", slot3), slot12)
	setText(slot0:findTF("info_container/value", slot3), slot7[slot5])

	slot4.alpha = slot7[slot5] == 0 and 0.3 or 1

	slot0:setSliderValue(slot7[slot5] == 0 and 0.3 or 1, (slot9 + slot13) / slot11)

	slot16 = slot13 / slot11
	slot17 = slot13 + slot9 .. "/" .. slot10

	if slot12 == slot7[slot5] and slot7[slot5] ~= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 152-153, warpins: 1 ---
		slot16 = 1
		slot17 = "MAX"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 154-178, warpins: 3 ---
	slot0:setSliderValue(slot18, slot16)
	setText(slot0:findTF("exp_container/Text", slot2), slot17)

	return
	--- END OF BLOCK #2 ---



end

function slot0.modAttrAnim(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 4-19, warpins: 2 ---
	slot4 = slot3 or 0.3
	slot5 = intProperties(slot1:getShipProperties())
	slot6 = intProperties(slot2:getShipProperties())
	slot0.tweens = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-143, warpins: 0 ---
	for slot10, slot11 in pairs(slot0.attrTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-33, warpins: 1 ---
		slot14 = slot0.shipVO:getModAttrBaseMax(ShipModAttr.ID_TO_ATTR[slot10])

		if slot1:getModAttrTopLimit(slot12) == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-38, warpins: 1 ---
			slot0:updateAttr(slot10)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-117, warpins: 1 ---
			slot16 = slot0:findTF("info", slot15)
			slot17 = slot0:findTF("info_container/value", slot16)
			slot22 = slot0:findTF("cur_slider", slot16).GetComponent(slot20, typeof(Slider))
			slot25 = slot0:findTF("info_container/addition", slot16)
			slot26 = slot0:findTF("exp_container/Text", slot15)

			slot0:setSliderValue(slot23, 0)
			setText(slot0:findTF("exp_container/Text", slot15), slot24 .. "/" .. math.max(slot1:getModExpRatio(slot12), 1))

			function slot27(slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-11, warpins: 1 ---
				setText(uv0, slot0)
				setText(uv1, "+" .. slot1)

				return
				--- END OF BLOCK #0 ---



			end

			if slot5[slot12] - slot6[slot12] >= 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 118-129, warpins: 1 ---
				slot28 = slot6[slot12]

				slot0:tweenValue(slot0.findTF("cur_slider", slot16).GetComponent(slot20, typeof(Slider)), slot0.findTF("cur_slider", slot16).GetComponent(slot20, typeof(Slider)).value, 1, slot4, nil, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-7, warpins: 1 ---
					uv0:setSliderValue(uv1, slot0)

					return
					--- END OF BLOCK #0 ---



				end, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-22, warpins: 1 ---
					playSoundEffect(SFX_BREAK_OUT_FULL)

					uv0 = uv0 + 1

					uv1(uv0, uv2[uv3] - uv0)

					if uv2[uv3] - uv0 > 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 23-35, warpins: 1 ---
						uv4:tweenValue(uv5, 0, 1, uv6, nil, function (slot0)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-7, warpins: 1 ---
							uv0:setSliderValue(uv1, slot0)

							return
							--- END OF BLOCK #0 ---



						end, function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-20, warpins: 1 ---
							playSoundEffect(SFX_BREAK_OUT_FULL)

							uv0 = uv0 + 1

							uv1(uv0, uv2[uv3] - uv0)

							if uv0 == uv2[uv3] then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 21-33, warpins: 1 ---
								uv4:tweenValue(uv5, 0, uv6 / uv7, uv8, nil, function (slot0)

									-- Decompilation error in this vicinity:
									--- BLOCK #0 1-7, warpins: 1 ---
									uv0:setSliderValue(uv1, slot0)

									return
									--- END OF BLOCK #0 ---



								end, function ()

									-- Decompilation error in this vicinity:
									--- BLOCK #0 1-6, warpins: 1 ---
									if uv0 == uv1[uv2] then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 7-16, warpins: 1 ---
										uv3:setSliderValue(uv4, 1)
										setText(uv5, "MAX")
										--- END OF BLOCK #0 ---



									end

									--- END OF BLOCK #0 ---

									FLOW; TARGET BLOCK #1



									-- Decompilation error in this vicinity:
									--- BLOCK #1 17-17, warpins: 2 ---
									return
									--- END OF BLOCK #1 ---



								end)
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 34-34, warpins: 2 ---
							return
							--- END OF BLOCK #1 ---



						end, slot0)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 36-48, warpins: 1 ---
						uv4:tweenValue(uv5, 0, uv7 / uv8, uv6, nil, function (slot0)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-7, warpins: 1 ---
							uv0:setSliderValue(uv1, slot0)

							return
							--- END OF BLOCK #0 ---



						end, function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-6, warpins: 1 ---
							if uv0 == uv1[uv2] then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 7-16, warpins: 1 ---
								uv3:setSliderValue(uv4, 1)
								setText(uv5, "MAX")
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 17-17, warpins: 2 ---
							return
							--- END OF BLOCK #1 ---



						end)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 49-49, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 130-139, warpins: 1 ---
				slot0:tweenValue(slot22, slot22.value, slot24 / slot19, slot4, nil, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-7, warpins: 1 ---
					uv0:setSliderValue(uv1, slot0)

					return
					--- END OF BLOCK #0 ---



				end, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-6, warpins: 1 ---
					if uv0 == uv1[uv2] then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 7-16, warpins: 1 ---
						uv3:setSliderValue(uv4, 1)
						setText(uv5, "MAX")
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 17-17, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 140-140, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 141-141, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 142-143, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 144-145, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

function slot0.tweenValue(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 24-33, warpins: 2 ---
	slot0.tweens[slot1] = slot1
	slot10 = LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if uv0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			uv0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end))
	slot11 = slot5 or 0
	slot9 = LeanTween.value(go(slot1), slot2, slot3, slot4).setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if uv0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			uv0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)):setDelay(slot11):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if uv0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			uv0()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end))

	if slot8 and slot8 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-40, warpins: 1 ---
		slot9:setRepeat(slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 41-42, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.getModExpAdditions(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot3 = pg.ship_data_template[slot0.configId].group_type
	slot4 = pg.ship_data_strengthen
	slot5 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-39, warpins: 0 ---
	for slot9, slot10 in pairs(ShipModAttr.ID_TO_ATTR) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		slot11 = 0

		if slot9 ~= ShipModLayer.IGNORE_ID then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-22, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 23-36, warpins: 0 ---
			for slot15, slot16 in pairs(slot1) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-32, warpins: 1 ---
				slot19 = slot4[slot2[slot16.configId].strengthen_id].attr_exp[slot9 - 1]

				if slot2[slot16.configId].group_type == slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 33-33, warpins: 1 ---
					slot19 = slot19 * 2
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 34-34, warpins: 2 ---
				slot11 = slot11 + slot19
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 35-36, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-37, warpins: 2 ---
		slot5[slot10] = slot11
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 38-39, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 40-40, warpins: 1 ---
	return slot5
	--- END OF BLOCK #2 ---



end

function slot0.getMaterialShips(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = {}
	slot3 = ipairs

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot4 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-15, warpins: 0 ---
	for slot6, slot7 in slot3(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		table.insert(slot2, slot0.shipVOs[slot7])
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-15, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-16, warpins: 1 ---
	return slot2
	--- END OF BLOCK #3 ---



end

function slot0.getExpAddition(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot3 = uv0.getModExpAdditions(slot0, slot1)

	if slot0:getModAttrTopLimit(slot2) == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 1 ---
		return 0, 0
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-33, warpins: 1 ---
		slot4 = Clone(slot0)

		slot4:addModAttrExp(slot2, slot3[slot2])

		return slot4:getModProperties(slot2) - slot0:getModProperties(slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 34-34, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot0.getRemainExp(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	return slot0:getModProperties(slot1) % math.max(slot0:getModExpRatio(slot1), 1)
	--- END OF BLOCK #0 ---



end

function slot0.setSliderValue(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot2 ~= 0 or not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 2 ---
		slot3 = math.max(slot2, 0.08)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-11, warpins: 2 ---
	slot1.value = slot3

	return
	--- END OF BLOCK #1 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0:blurPanel(false)

	slot1 = pairs

	if not slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		slot2 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-11, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-27, warpins: 0 ---
	for slot4, slot5 in slot1(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-19, warpins: 1 ---
		if LeanTween.isTweening(go(slot5)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-25, warpins: 1 ---
			LeanTween.cancel(go(slot5))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-27, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-30, warpins: 1 ---
	slot0.tweens = nil

	return
	--- END OF BLOCK #3 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:emit(BaseUI.ON_BACK_PRESSED, true)

	return
	--- END OF BLOCK #0 ---



end

return slot0
