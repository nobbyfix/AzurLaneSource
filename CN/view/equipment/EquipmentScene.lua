slot0 = class("EquipmentScene", import("..base.BaseUI"))
slot1 = 1
slot0.WARP_TO_DESIGN = "WARP_TO_DESIGN"
slot0.WARP_TO_MATERIAL = "WARP_TO_MATERIAL"
slot0.WARP_TO_WEAPON = "WARP_TO_WEAPON"
slot0.OVERVIEW = "EquipmentScene_OVERVIEW"
slot0.SKIN = "EquipmentScene_SKIN"
slot0.EQUIPMENT = "EquipmentScene_EQUIPMENT"
slot0.DESTORY = "EquipmentScene_DESTORY"
slot2 = 0
slot3 = 1

function slot0.getUIName(slot0)
	return "EquipmentUI"
end

function slot0.setEquipments(slot0, slot1)
	slot0.equipmentVOs = slot1

	slot0:setEquipmentByIds(slot1)
end

function slot0.setEquipmentByIds(slot0, slot1)
	slot0.equipmentVOByIds = {}

	for slot5, slot6 in pairs(slot1) do
		if not slot6.isSkin then
			slot0.equipmentVOByIds[slot6.id] = slot6
		end
	end
end

slot4 = require("view.equipment.EquipmentSortCfg")

function slot0.init(slot0)
	slot0.showBusyEquip = false
	slot0.topItems = slot0:findTF("topItems")
	slot0.equipmentView = slot0:findTF("equipment_scrollview")
	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.topPanel = slot0:findTF("adapt/top", slot0.blurPanel)
	slot0.indexBtn = slot0:findTF("buttons/index_button", slot0.topPanel)
	slot0.indexPanel = slot0:findTF("index", slot0.topItems)
	slot0.indexContain = slot0:findTF("mask/panel", slot0.indexPanel)
	slot0.indexTpl = slot0:findTF("tpl", slot0.indexContain)

	setActive(slot0.indexTpl, false)

	slot0.sortBtn = slot0:findTF("buttons/sort_button", slot0.topPanel)
	slot0.sortPanel = slot0:findTF("sort", slot0.topItems)
	slot0.sortContain = slot0:findTF("mask/panel", slot0.sortPanel)
	slot0.sortTpl = slot0:findTF("tpl", slot0.sortContain)

	setActive(slot0.sortTpl, false)

	slot0.itemView = slot0:findTF("item_scrollview")
	slot0.equipmentView:Find("equipment_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = slot0.itemView.rect.width > 2000 and 8 or 7
	slot0.itemView:Find("item_grid"):GetComponent(typeof(GridLayoutGroup)).constraintCount = slot0.itemView.rect.width > 2000 and 8 or 7
	slot0.decBtn = findTF(slot0.topPanel, "buttons/dec_btn")
	slot0.sortImgAsc = findTF(slot0.decBtn, "asc")
	slot0.sortImgDec = findTF(slot0.decBtn, "desc")
	slot0.equipmentBtn = slot0:findTF("blur_panel/adapt/left_length/frame/toggle_root/equipment")
	slot0.equipmentSkinBtn = slot0:findTF("blur_panel/adapt/left_length/frame/toggle_root/skin")
	slot0.filterBusyToggle = slot0:findTF("blur_panel/adapt/left_length/frame/toggle_equip")

	setActive(slot0.filterBusyToggle, false)

	slot0.bottomBack = slot0:findTF("bottom_back", slot0.topItems)
	slot0.bottomPanel = slot0:findTF("types", slot0.bottomBack)
	slot0.materialToggle = slot0.bottomPanel:Find("material")
	slot0.weaponToggle = slot0.bottomPanel:Find("weapon")
	slot0.designToggle = slot0.bottomPanel:Find("design")
	slot0.capacityTF = slot0:findTF("bottom_left/tip/capcity/Text", slot0.bottomBack)
	slot0.tipTF = slot0:findTF("bottom_left/tip", slot0.bottomBack)
	slot0.tip = slot0.tipTF:Find("label")
	slot0.helpBtn = slot0:findTF("help_btn", slot0.topItems)

	setActive(slot0.helpBtn, true)

	slot0.backBtn = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.selectedMin = defaultValue(slot0.contextData.selectedMin, 1)
	slot0.selectedMax = defaultValue(slot0.contextData.selectedMax, pg.gameset.equip_select_limit.key_value or 0)
	slot0.selectedIds = Clone(slot0.contextData.selectedIds or {})
	slot0.checkEquipment = slot0.contextData.onEquipment or function (slot0)
		return true
	end
	slot0.onSelected = slot0.contextData.onSelected or function ()
		warning("not implemented.")
	end
	slot0.BatchDisposeBtn = slot0:findTF("dispos", slot0.bottomPanel)
	slot0.selectPanel = slot0:findTF("select_panel", slot0.topItems)

	setActive(slot0.selectPanel, true)
	setAnchoredPosition(slot0.selectPanel, {
		y = -124
	})

	slot0.selectEnabled = false
	slot0.destroyConfirm = slot0:findTF("destroy_confirm", slot0.topItems)
	slot0.destroyBonusList = slot0.destroyConfirm:Find("frame/bg/scrollview/list")
	slot0.destroyBonusItem = slot0.destroyBonusList:Find("equipment_tpl")
	slot0.destroyNoGotTip = slot0.destroyConfirm:Find("frame/bg/tip")

	setActive(slot0.destroyConfirm, false)
	setActive(slot0.destroyBonusItem, false)
	setActive(slot0.destroyNoGotTip, false)
	setActive(slot0.contextData.onSelected or function ()
		warning("not implemented.")
	end, false)

	slot0.assignedItemPanel = AssignedItemPanel.New(slot0:findTF("item_assigned_panel", slot0.topItems), slot0)
end

function slot0.setEquipment(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-40, warpins: 1 ---
	slot0.equipmentVOByIds[slot1.id] = slot1
	slot2 = true

	for slot6, slot7 in pairs(slot0.equipmentVOs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-20, warpins: 1 ---
		if slot7.id == slot1.id and not slot7.shipId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-18, warpins: 1 ---
			slot0.equipmentVOs[slot6] = slot1
			slot2 = false
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-27, warpins: 1 ---
		table.insert(slot0.equipmentVOs, slot1)
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.warp == uv0.WARP_TO_WEAPON then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-39, warpins: 1 ---
		slot0:filterEquipment()
		slot0:updateCapacity()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.removeEquipment(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot0.equipmentVOByIds[slot1] = nil

	for slot5 = #slot0.equipmentVOs, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-19, warpins: 2 ---
		if slot0.equipmentVOs[slot5].id == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-18, warpins: 1 ---
			table.remove(slot0.equipmentVOs, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.warp == uv0.WARP_TO_WEAPON then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-31, warpins: 1 ---
		slot0:filterEquipment()
		slot0:updateCapacity()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.setEquipmentSkin(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-46, warpins: 1 ---
	slot2 = true

	for slot6, slot7 in pairs(slot0.equipmentVOs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-22, warpins: 1 ---
		if slot7.id == slot1.id and slot7.isSkin then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-20, warpins: 1 ---
			slot0.equipmentVOs[slot6] = {
				isSkin = true,
				id = slot1.id,
				count = slot1.count
			}
			slot2 = false
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-33, warpins: 1 ---
		table.insert(slot0.equipmentVOs, {
			isSkin = true,
			id = slot1.id,
			count = slot1.count
		})
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.warp == uv0.WARP_TO_WEAPON then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-45, warpins: 1 ---
		slot0:filterEquipment()
		slot0:updateCapacity()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.didEnter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 76-333, warpins: 2 ---
	slot0.warp = slot0.contextData.warp or uv0.WARP_TO_MATERIAL
	slot0.contextData.warp = nil

	setText(slot0:findTF("tip", slot0.selectPanel), i18n("equipment_select_device_destroy_tip"))
	setText(slot0:findTF("frame/title_text/Text", slot0.destroyConfirm), i18n("equipment_select_device_destroy_bonus_tip"))
	setText(slot0.destroyNoGotTip, i18n("equipment_select_device_destroy_nobonus_tip"))
	setActive(slot0:findTF("stamp", slot0.topItems), getProxy(TaskProxy):mingshiTouchFlagEnabled())
	onButton(slot0, slot0:findTF("stamp", slot0.topItems), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		getProxy(TaskProxy):dealMingshiTouchFlag(2)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CONFIRM)
	onButton(slot0, slot0.helpBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-27, warpins: 2 ---
		slot0 = nil

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = (uv0.page ~= uv1 or pg.gametip.help_equipment_skin.tip) and pg.gametip.help_equipment.tip
		})

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	slot0.page = slot0.contextData.mode == uv0.SKIN and uv1 or uv2

	onToggle(slot0, slot0.equipmentBtn, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-41, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-40, warpins: 2 ---
			uv0.page = uv1

			uv0:updatePageFilterButtons(uv0.page)
			uv0:filterEquipment()
			setActive(uv0.BatchDisposeBtn, uv0.page == uv1)
			setActive(uv0.capacityTF.parent, uv0.page == uv1)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onToggle(slot0, slot0.equipmentSkinBtn, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-41, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-40, warpins: 2 ---
			uv0.page = uv1

			uv0:updatePageFilterButtons(uv0.page)
			uv0:filterEquipment()
			setActive(uv0.BatchDisposeBtn, uv0.page == uv2)
			setActive(uv0.capacityTF.parent, uv0.page == uv2)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		if uv0.selectEnabled then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-9, warpins: 1 ---
			triggerButton(uv0.BatchDisposeBtn)

			return
			--- END OF BLOCK #0 ---



		end

		GetOrAddComponent(uv0._tf, typeof(CanvasGroup)).interactable = false

		uv0:emit(uv1.ON_BACK)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onToggle(slot0, slot0.sortBtn, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-38, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-21, warpins: 1 ---
			pg.UIMgr.GetInstance():OverlayPanel(uv0.sortPanel, {
				groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
			})
			setActive(uv0.sortPanel, true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-37, warpins: 1 ---
			pg.UIMgr.GetInstance():UnOverlayPanel(uv0.sortPanel, uv0.topItems)
			setActive(uv0.sortPanel, false)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.sortPanel, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		triggerToggle(uv0.sortBtn, false)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onToggle(slot0, slot0.indexBtn, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-38, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-21, warpins: 1 ---
			pg.UIMgr.GetInstance():OverlayPanel(uv0.indexPanel, {
				groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
			})
			setActive(uv0.indexPanel, true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-37, warpins: 1 ---
			pg.UIMgr.GetInstance():UnOverlayPanel(uv0.indexPanel, uv0.topItems)
			setActive(uv0.indexPanel, false)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.indexPanel, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		triggerToggle(uv0.indexBtn, false)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	slot0.equipmetItems = {}
	slot0.itemCards = {}

	slot0:initItems()
	slot0:initEquipments()

	if not slot0.contextData.indexData then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 133-137, warpins: 1 ---
		slot0.contextData.indexData = uv3.index[1]
		--- END OF BLOCK #0 ---



	end

	slot0.asc = slot0.contextData.asc or false

	if not slot0.contextData.sortData then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 148-152, warpins: 1 ---
		slot0.contextData.sortData = uv3.sort[1]
		--- END OF BLOCK #0 ---



	end

	slot0:initSort()
	slot0:initEquipmentIndex()
	setActive(slot0.itemView, false)
	setActive(slot0.equipmentView, false)
	onToggle(slot0, slot0.materialToggle, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-50, warpins: 1 ---
		uv0.inMaterial = slot0

		if slot0 and uv0.contextData.warp ~= uv1.WARP_TO_MATERIAL then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-44, warpins: 1 ---
			uv0.contextData.warp = uv1.WARP_TO_MATERIAL

			setText(uv0.tip, i18n("equipment_select_materials_tip"))
			setActive(uv0.capacityTF.parent, false)
			setActive(uv0.tip, true)
			setActive(uv0.capacityTF.parent, false)
			uv0:sortItems()
			--- END OF BLOCK #0 ---



		end

		setActive(uv0.helpBtn, not slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onToggle(slot0, slot0.weaponToggle, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-70, warpins: 1 ---
		if slot0 and uv0.contextData.warp ~= uv1.WARP_TO_WEAPON then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-34, warpins: 1 ---
			uv0.contextData.warp = uv1.WARP_TO_WEAPON

			uv0:updateCapacity()
			setActive(uv0.tip, false)
			setActive(uv0.capacityTF.parent, true)

			if uv0.page == uv2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-40, warpins: 1 ---
				triggerToggle(uv0.equipmentSkinBtn, true)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 41-45, warpins: 1 ---
				if uv0.page == uv3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 46-50, warpins: 1 ---
					triggerToggle(uv0.equipmentBtn, true)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		setActive(uv0.BatchDisposeBtn, slot0 and uv0.page == uv3)
		setActive(uv0.filterBusyToggle, slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onToggle(slot0, slot0.designToggle, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-48, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-9, warpins: 1 ---
			if uv0.contextData.warp ~= uv1.WARP_TO_DESIGN then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-41, warpins: 1 ---
				uv0.contextData.warp = uv1.WARP_TO_DESIGN

				uv0:updateCapacity()
				uv0:emit(EquipmentMediator.OPEN_DESIGN)
				setActive(uv0.tip, false)
				setActive(uv0.capacityTF.parent, false)
				setActive(uv0.filterBusyToggle, false)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-47, warpins: 1 ---
			uv0:emit(EquipmentMediator.CLOSE_DESIGN_LAYER)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onToggle(slot0, slot0.filterBusyToggle, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		uv0.showBusyEquip = slot0

		uv0:filterEquipment()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	if slot0.warp == uv0.WARP_TO_DESIGN then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 196-200, warpins: 1 ---
		triggerToggle(slot0.designToggle, true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 201-205, warpins: 1 ---
		if slot0.warp == uv0.WARP_TO_MATERIAL then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 206-210, warpins: 1 ---
			triggerToggle(slot0.materialToggle, true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 211-215, warpins: 1 ---
			if slot0.warp == uv0.WARP_TO_WEAPON then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 216-219, warpins: 1 ---
				triggerToggle(slot0.weaponToggle, true)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot0.BatchDisposeBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-113, warpins: 1 ---
		uv0.selectEnabled = not uv0.selectEnabled

		if uv0.selectEnabled then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-56, warpins: 1 ---
			uv0.filterImportance = uv0.asc

			shiftPanel(uv0.bottomBack, nil, -124, nil, 0, true, true)
			shiftPanel(uv0.selectPanel, nil, 0, nil, 0, true, true)

			uv0.asc = true
			uv0.contextData.asc = uv0.asc
			uv0.contextData.sortData = uv1.sort[1]

			uv0:filterEquipment()

			uv0.mode = uv2.DESTORY
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-91, warpins: 1 ---
			uv0.mode = uv2.OVERVIEW
			uv0.asc = uv0.filterImportance
			uv0.filterImportance = nil

			shiftPanel(uv0.bottomBack, nil, 0, nil, 0, true, true)
			shiftPanel(uv0.selectPanel, nil, -124, nil, 0, true, true)
			uv0:filterEquipment()
			--- END OF BLOCK #0 ---



		end

		setActive(uv0.filterBusyToggle, not uv0.selectEnabled)
		setActive(uv0.equipmentBtn.parent, uv0.mode == uv2.OVERVIEW)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	if slot0.warp == uv0.WARP_TO_WEAPON and slot0.mode == uv0.DESTORY then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 236-238, warpins: 1 ---
		triggerButton(slot0.BatchDisposeBtn)
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, findTF(slot0.selectPanel, "cancel_button"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		uv0:unselecteAllEquips()
		triggerButton(uv0.BatchDisposeBtn)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, findTF(slot0.selectPanel, "confirm_button"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-49, warpins: 1 ---
		if not _.all(uv0:hasEliteEquips(uv0.selectedIds, uv0.equipmentVOByIds), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-6, warpins: 2 ---
			return slot0 == ""
			--- END OF BLOCK #0 ---



		end) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-46, warpins: 2 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("destroy_eliteequipment_tip", string.gsub(table.concat(slot1, ""), "$1", slot1[1] == "" and "" or ",")),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-19, warpins: 1 ---
					uv0:displayDestroyBonus()
					setActive(uv0.destroyConfirm, true)
					pg.UIMgr.GetInstance():BlurPanel(uv0.destroyConfirm)

					return
					--- END OF BLOCK #0 ---



				end
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-48, warpins: 1 ---
			slot0()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_CONFIRM)
	onButton(slot0, findTF(slot0.destroyConfirm, "frame/actions/cancel_btn"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		setActive(uv0.destroyConfirm, false)
		pg.UIMgr.GetInstance():UnblurPanel(uv0.destroyConfirm, uv0._tf)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, slot0.destroyConfirm, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		setActive(uv0.destroyConfirm, false)
		pg.UIMgr.GetInstance():UnblurPanel(uv0.destroyConfirm, uv0._tf)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, slot0.destroyConfirm:Find("frame/top/btnBack"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		setActive(uv0.destroyConfirm, false)
		pg.UIMgr.GetInstance():UnblurPanel(uv0.destroyConfirm, uv0._tf)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, findTF(slot0.destroyConfirm, "frame/actions/confirm_btn"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-29, warpins: 1 ---
		uv0:emit(EquipmentMediator.ON_DESTROY, uv0.selectedIds)
		setActive(uv0.destroyConfirm, false)
		pg.UIMgr.GetInstance():UnblurPanel(uv0.destroyConfirm, uv0._tf)
		uv0:unselecteAllEquips()

		return
		--- END OF BLOCK #0 ---



	end, SFX_UI_EQUIPMENT_RESOLVE)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.blurPanel, {
		groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
	})
	pg.UIMgr.GetInstance():OverlayPanel(slot0.topItems, {
		groupName = LayerWeightConst.GROUP_EQUIPMENTSCENE
	})
	setActive(slot0.equipmentBtn.parent, slot0.mode == uv0.OVERVIEW and slot0.warp == uv0.WARP_TO_WEAPON)

	return
	--- END OF BLOCK #0 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-31, warpins: 1 ---
	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.destroyConfirm) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-15, warpins: 1 ---
		triggerButton(findTF(slot0.destroyConfirm, "actions/cancel_button"))

		return
		--- END OF BLOCK #0 ---



	end

	if go(slot0.assignedItemPanel._tf).activeSelf then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-27, warpins: 1 ---
		slot0.assignedItemPanel:hide()

		return
		--- END OF BLOCK #0 ---



	end

	triggerButton(slot0.backBtn)

	return
	--- END OF BLOCK #0 ---



end

function slot0.hasEliteEquips(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	function slot4(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		if not _.include(uv0, slot0) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-9, warpins: 1 ---
			uv0[slot1] = slot0
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end

	_.each(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		if uv0[slot0[1]].config.level > 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-14, warpins: 1 ---
			uv1(i18n("destroy_high_intensify_tip"), 2)
			--- END OF BLOCK #0 ---



		end

		if slot2.config.rarity >= 4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-25, warpins: 1 ---
			uv1(i18n("destroy_high_rarity_tip"), 1)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	return {
		"",
		""
	}
	--- END OF BLOCK #0 ---



end

function slot0.updateCapacity(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	if slot0.contextData.warp == uv0.WARP_TO_DESIGN or slot0.contextData.warp == uv0.WARP_TO_MATERIAL then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	setText(slot0.tip, "")
	setText(slot0.capacityTF, slot0.capacity .. "/" .. slot0.player.equip_bag_max)

	return
	--- END OF BLOCK #0 ---



end

function slot0.setCapacity(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0.capacity = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.setShip(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 7-72, warpins: 2 ---
	slot0.mode = slot0.contextData.mode or EquipmentScene.OVERVIEW
	slot0.shipVO = slot1

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-71, warpins: 1 ---
		if slot0.mode == EquipmentScene.EQUIPMENT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-27, warpins: 1 ---
			slot0.contextData.qiutBtn = defaultValue(slot1:getEquip(slot0.contextData.pos), nil)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-32, warpins: 1 ---
			if slot0.mode == EquipmentScene.SKIN then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-42, warpins: 1 ---
				slot0.contextData.qiutBtn = slot1:getEquip(slot0.contextData.pos).hasSkin(slot2)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		slot0.showBusyEquip = true

		setActive(findTF(slot0.filterBusyToggle, "on"), true)
		setActive(findTF(slot0.filterBusyToggle, "off"), false)

		slot0.filterBusyToggle:GetComponent(typeof(Toggle)).isOn = true

		setActive(slot0.bottomPanel, false)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.setPlayer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0.player = slot1

	if not slot0.inMaterial then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot0:updateCapacity()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.initSort(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-64, warpins: 1 ---
	onButton(slot0, slot0.decBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-15, warpins: 1 ---
		uv0.asc = not uv0.asc
		uv0.contextData.asc = uv0.asc

		uv0:filterEquipment()

		return
		--- END OF BLOCK #0 ---



	end)

	slot0.sortButtons = {}

	eachChild(slot0.sortContain, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		setActive(slot0, false)

		return
		--- END OF BLOCK #0 ---



	end)

	for slot4, slot5 in ipairs(uv0.sort) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-57, warpins: 2 ---
		setActive(slot4 <= slot0.sortContain.childCount and slot0.sortContain:GetChild(slot4 - 1) or cloneTplTo(slot0.sortTpl, slot0.sortContain), true)
		setImageSprite(findTF(slot4 <= slot0.sortContain.childCount and slot0.sortContain.GetChild(slot4 - 1) or cloneTplTo(slot0.sortTpl, slot0.sortContain), "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", slot5.spr), true)
		onToggle(slot0, slot4 <= slot0.sortContain.childCount and slot0.sortContain.GetChild(slot4 - 1) or cloneTplTo(slot0.sortTpl, slot0.sortContain), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-15, warpins: 1 ---
				uv0.contextData.sortData = uv1

				uv0:filterEquipment()
				triggerToggle(uv0.sortBtn, false)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		slot0.sortButtons[slot4] = slot4 <= slot0.sortContain.childCount and slot0.sortContain.GetChild(slot4 - 1) or cloneTplTo(slot0.sortTpl, slot0.sortContain)
		--- END OF BLOCK #0 ---



	end

	slot0.contextData.sortData = uv0.sort[1]

	return
	--- END OF BLOCK #0 ---



end

function slot0.initEquipmentIndex(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-59, warpins: 1 ---
	slot0.indexButtons = {}

	eachChild(slot0.indexContain, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		setActive(slot0, false)

		return
		--- END OF BLOCK #0 ---



	end)

	for slot4, slot5 in ipairs(uv0.index) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-52, warpins: 2 ---
		setActive(slot4 <= slot0.indexContain.childCount and slot0.indexContain:GetChild(slot4 - 1) or cloneTplTo(slot0.indexTpl, slot0.indexContain), true)
		setImageSprite(findTF(slot4 <= slot0.indexContain.childCount and slot0.indexContain.GetChild(slot4 - 1) or cloneTplTo(slot0.indexTpl, slot0.indexContain), "Image"), GetSpriteFromAtlas("ui/equipmentui_atlas", slot5.spr), true)
		onToggle(slot0, slot4 <= slot0.indexContain.childCount and slot0.indexContain.GetChild(slot4 - 1) or cloneTplTo(slot0.indexTpl, slot0.indexContain), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-15, warpins: 1 ---
				uv0.contextData.indexData = uv1

				uv0:filterEquipment()
				triggerToggle(uv0.indexBtn, false)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		slot0.indexButtons[slot4] = slot4 <= slot0.indexContain.childCount and slot0.indexContain.GetChild(slot4 - 1) or cloneTplTo(slot0.indexTpl, slot0.indexContain)
		--- END OF BLOCK #0 ---



	end

	slot0.contextData.indexData = uv0.index[1]

	return
	--- END OF BLOCK #0 ---



end

function slot0.updatePageFilterButtons(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-43, warpins: 1 ---
	for slot5, slot6 in ipairs(uv0.index) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-21, warpins: 1 ---
		triggerToggle(slot0.indexButtons[slot5], false)
		setActive(slot0.indexButtons[slot5], table.contains(slot6.pages, slot1))
		--- END OF BLOCK #0 ---



	end

	for slot5, slot6 in ipairs(uv0.sort) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-42, warpins: 1 ---
		triggerToggle(slot0.sortButtons[slot5], false)
		setActive(slot0.sortButtons[slot5], table.contains(slot6.pages, slot1))
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.initEquipments(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	slot0.isInitWeapons = true
	slot0.equipmentRect = slot0.equipmentView:GetComponent("LScrollRect")

	function slot0.equipmentRect.onInitItem(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0:initEquipment(slot0)

		return
		--- END OF BLOCK #0 ---



	end

	slot0.equipmentRect.decelerationRate = 0.07

	function slot0.equipmentRect.onUpdateItem(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		uv0:updateEquipment(slot0, slot1)

		return
		--- END OF BLOCK #0 ---



	end

	function slot0.equipmentRect.onStart()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:updateSelected()

		return
		--- END OF BLOCK #0 ---



	end

	slot0.equipmentRect:ScrollTo(0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.initEquipment(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot2 = EquipmentItem.New(slot1)

	onButton(slot0, slot2.go, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-134, warpins: 1 ---
		if uv0.equipmentVO.isSkin then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-10, warpins: 1 ---
			if not uv0.equipmentVO.shipId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-23, warpins: 1 ---
				uv1:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, uv0.equipmentVO.id, uv1.contextData.pos)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-45, warpins: 1 ---
				uv1:emit(EquipmentMediator.ON_EQUIPMENT_SKIN_INFO, uv0.equipmentVO.id, uv1.contextData.pos, {
					id = uv0.equipmentVO.shipId,
					pos = uv0.equipmentVO.shipPos
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-133, warpins: 1 ---
			if uv0.equipmentVO.mask then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-51, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			if uv1.selectEnabled then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-65, warpins: 1 ---
				uv1:selectEquip(uv0.equipmentVO, uv0.equipmentVO.count)

				return
				--- END OF BLOCK #0 ---



			end

			uv1:emit(uv2.ON_EQUIPMENT, uv1.shipVO and {
				type = EquipmentInfoMediator.TYPE_REPLACE,
				equipmentId = uv0.equipmentVO.id,
				shipId = uv1.contextData.shipId,
				pos = uv1.contextData.pos,
				oldShipId = uv0.equipmentVO.shipId,
				oldPos = uv0.equipmentVO.shipPos
			} or uv0.equipmentVO.shipId and {
				type = EquipmentInfoMediator.TYPE_DISPLAY,
				equipmentId = uv0.equipmentVO.id,
				shipId = uv0.equipmentVO.shipId,
				pos = uv0.equipmentVO.shipPos
			} or {
				destroy = true,
				type = EquipmentInfoMediator.TYPE_DEFAULT,
				equipmentId = uv0.equipmentVO.id
			})
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot2.unloadBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-34, warpins: 1 ---
		if uv0.mode and uv0.mode == EquipmentScene.SKIN then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-17, warpins: 1 ---
			uv0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT_SKIN)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-21, warpins: 2 ---
			if uv0.mode and uv0.mode == EquipmentScene.EQUIPMENT then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-33, warpins: 1 ---
				uv0:emit(EquipmentMediator.ON_UNEQUIP_EQUIPMENT)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot2.reduceBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		uv0:selectEquip(uv1.equipmentVO, 1)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	slot0.equipmetItems[slot1] = slot2

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateEquipment(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-40, warpins: 1 ---
	if not slot0.equipmetItems[slot2] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-10, warpins: 1 ---
		slot0:initEquipment(slot2)

		slot3 = slot0.equipmetItems[slot2]
		--- END OF BLOCK #0 ---



	end

	slot3:update(slot0.loadEquipmentVOs[slot1 + 1])

	slot5 = false
	slot6 = 0

	if slot0.loadEquipmentVOs[slot1 + 1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-34, warpins: 1 ---
		for slot10, slot11 in ipairs(slot0.selectedIds) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-34, warpins: 1 ---
			if slot4.id == slot11[1] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-33, warpins: 1 ---
				slot5 = true
				slot6 = slot11[2]

				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot3:updateSelected(slot5, slot6)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateEquipmentCount(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 8-10, warpins: 2 ---
	slot0.equipmentRect:SetTotalCount(slot1 or #slot0.loadEquipmentVOs, -1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.filterEquipment(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-246, warpins: 1 ---
	slot2 = slot0.contextData.indexData.types
	slot4 = slot0.contextData.sortData
	slot0.pageEquipments = {}
	slot0.loadEquipmentVOs = {}

	if slot0.page == uv0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-28, warpins: 1 ---
		for slot8, slot9 in pairs(slot0.equipmentVOs) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-27, warpins: 1 ---
			if slot9.isSkin then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-25, warpins: 1 ---
				table.insert(slot0.pageEquipments, slot9)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-31, warpins: 1 ---
		if slot3 == uv1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-45, warpins: 1 ---
			for slot8, slot9 in pairs(slot0.equipmentVOs) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-45, warpins: 1 ---
				if not slot9.isSkin then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-43, warpins: 1 ---
					table.insert(slot0.pageEquipments, slot9)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-50, warpins: 1 ---
		if slot3 == uv0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 51-86, warpins: 1 ---
			for slot10, slot11 in pairs(slot0.pageEquipments) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 58-85, warpins: 1 ---
				if slot11.count > 0 and slot11.isSkin and function (slot0, slot1)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-20, warpins: 1 ---
					for slot5, slot6 in pairs(slot0) do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 5-17, warpins: 1 ---
						if _.any(slot1, function (slot0)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 7-7, warpins: 2 ---
							return slot0 == uv0
							--- END OF BLOCK #0 ---



						end) then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 12-14, warpins: 1 ---
							return true
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					return false
					--- END OF BLOCK #0 ---



				end(pg.equip_skin_template[slot11.id].equip_type, slot2) and slot0:checkFitBusyCondition(slot11) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 79-83, warpins: 1 ---
					table.insert(slot0.loadEquipmentVOs, slot11)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 87-89, warpins: 1 ---
			if slot3 == uv1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 90-125, warpins: 1 ---
				for slot8, slot9 in pairs(slot0.pageEquipments) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 94-124, warpins: 1 ---
					if (slot9.count > 0 or slot9.shipId) and not slot9.isSkin and table.contains(slot2, slot9.config.type) and slot0:checkFitBusyCondition(slot9) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 118-122, warpins: 1 ---
						table.insert(slot0.loadEquipmentVOs, slot9)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 126-149, warpins: 1 ---
		for slot8, slot9 in pairs(slot0.pageEquipments) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 130-149, warpins: 1 ---
			if (slot9.count > 0 or slot9.shipId) and slot0:checkFitBusyCondition(slot9) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 143-147, warpins: 1 ---
				table.insert(slot0.loadEquipmentVOs, slot9)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot0.filterImportance ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 153-176, warpins: 1 ---
		for slot8 = #slot0.loadEquipmentVOs, 1, -1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 158-176, warpins: 2 ---
			if slot0.loadEquipmentVOs[slot8].isSkin or not slot9.isSkin and slot9:isImportance() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 171-175, warpins: 2 ---
				table.remove(slot0.loadEquipmentVOs, slot8)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 179-185, warpins: 1 ---
		slot5 = slot0.asc

		table.sort(slot0.loadEquipmentVOs, function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			return uv0.sortFunc(slot0, slot1, uv1, uv2)
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	if slot0.contextData.qiutBtn then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 190-199, warpins: 1 ---
		table.insert(slot0.loadEquipmentVOs, 1, nil)

		if #slot0.loadEquipmentVOs == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 200-205, warpins: 1 ---
			slot0:updateEquipmentCount(1)

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0:updateSelected()
	slot0:updateEquipmentCount()
	setImageSprite(slot0:findTF("Image", slot0.sortBtn), GetSpriteFromAtlas("ui/equipmentui_atlas", slot4.spr), true)
	setImageSprite(slot0:findTF("Image", slot0.indexBtn), GetSpriteFromAtlas("ui/equipmentui_atlas", slot1.spr), true)
	setActive(slot0.sortImgAsc, slot0.asc)
	setActive(slot0.sortImgDec, not slot0.asc)

	return
	--- END OF BLOCK #0 ---



end

function slot0.checkFitBusyCondition(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 9-9, warpins: 2 ---
	return not slot0.selectEnabled and slot0.showBusyEquip or not slot1.shipId
	--- END OF BLOCK #0 ---



end

function slot0.setItems(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot0.itemVOs = slot1

	if slot0.isInitItems and slot0.contextData.warp == uv0.WARP_TO_MATERIAL then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		slot0:sortItems()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.initItems(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	slot0.isInitItems = true
	slot0.itemRect = slot0.itemView:GetComponent("LScrollRect")

	function slot0.itemRect.onInitItem(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0:initItem(slot0)

		return
		--- END OF BLOCK #0 ---



	end

	function slot0.itemRect.onUpdateItem(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		uv0:updateItem(slot0, slot1)

		return
		--- END OF BLOCK #0 ---



	end

	slot0.itemRect.decelerationRate = 0.07

	slot0.itemRect:ScrollTo(0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.sortItems(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	table.sort(slot0.itemVOs, function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-26, warpins: 1 ---
		if slot0:getConfig("rarity") == slot1:getConfig("rarity") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-19, warpins: 2 ---
			return slot0.id < slot1.id
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-25, warpins: 2 ---
			return slot3 < slot2
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.itemRect:SetTotalCount(#slot0.itemVOs, -1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.initItem(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	onButton(slot0, ItemCard.New(slot1).go, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-64, warpins: 1 ---
		if uv0.itemVO:getTempCfgTable().open_ui[1] > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-31, warpins: 1 ---
			uv1:emit(EquipmentMediator.ITEM_GO_SCENE, SCENE.ITEM_ORIGIN_PAGE, {
				itemVO = uv0.itemVO,
				open_ui = uv0.itemVO:getTempCfgTable().open_ui[1]
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-41, warpins: 1 ---
			if uv0.itemVO:getConfig("type") == Item.ASSIGNED_TYPE then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-54, warpins: 1 ---
				uv1.assignedItemPanel:show()
				uv1.assignedItemPanel:update(uv0.itemVO)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 55-63, warpins: 1 ---
				uv1:emit(uv2.ON_ITEM, uv0.itemVO.id)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	slot0.itemCards[slot1] = ItemCard.New(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateItem(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	if not slot0.itemCards[slot2] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-10, warpins: 1 ---
		slot0:initItem(slot2)

		slot3 = slot0.itemCards[slot2]
		--- END OF BLOCK #0 ---



	end

	slot3:update(slot0.itemVOs[slot1 + 1])

	return
	--- END OF BLOCK #0 ---



end

function slot0.selectCount(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	for slot5, slot6 in ipairs(slot0.selectedIds) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		slot1 = 0 + slot6[2]
		--- END OF BLOCK #0 ---



	end

	return slot1
	--- END OF BLOCK #0 ---



end

function slot0.selectEquip(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-120, warpins: 1 ---
	if not slot0:checkDestroyGold(slot1, slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.selectEnabled then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-12, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-31, warpins: 1 ---
		slot3 = false
		slot4 = nil
		slot5 = 0

		for slot9, slot10 in pairs(slot0.selectedIds) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-29, warpins: 1 ---
			if slot10[1] == slot1.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-28, warpins: 1 ---
				slot3 = true
				slot4 = slot9
				slot5 = slot10[2]

				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-63, warpins: 1 ---
			slot6, slot7 = slot0.checkEquipment(slot1, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				uv0:selectEquip(uv1, uv2)

				return
				--- END OF BLOCK #0 ---



			end, slot0.selectedIds)

			if not slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-51, warpins: 1 ---
				if slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 41-49, warpins: 1 ---
					pg.TipsMgr:GetInstance():ShowTips(slot7)
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end

			if slot0.selectedMax < slot0:selectCount() + slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 59-60, warpins: 1 ---
				slot2 = slot0.selectedMax - slot8
				--- END OF BLOCK #0 ---



			end

			if slot0.selectedMax == 0 or slot8 < slot0.selectedMax then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 67-75, warpins: 2 ---
				table.insert(slot0.selectedIds, {
					slot1.id,
					slot2
				})
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 76-78, warpins: 1 ---
				if slot0.selectedMax == 1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 79-85, warpins: 1 ---
					slot0.selectedIds[1] = {
						slot1.id,
						slot2
					}
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 86-100, warpins: 1 ---
					pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_equipmentScene_selectError_more", slot0.selectedMax))

					return
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 101-104, warpins: 1 ---
			if slot5 - slot2 > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 105-109, warpins: 1 ---
				slot0.selectedIds[slot4][2] = slot5 - slot2
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 110-114, warpins: 1 ---
				table.remove(slot0.selectedIds, slot4)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0:updateSelected()

	return
	--- END OF BLOCK #0 ---



end

function slot0.unselecteAllEquips(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.selectedIds = {}

	slot0:updateSelected()

	return
	--- END OF BLOCK #0 ---



end

function slot0.checkDestroyGold(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-71, warpins: 1 ---
	slot4 = false

	for slot8, slot9 in pairs(slot0.selectedIds) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-28, warpins: 1 ---
		if pg.equip_data_template[slot9[1]] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-19, warpins: 2 ---
			slot3 = 0 + (slot11.destory_gold or 0) * slot9[2]
			--- END OF BLOCK #0 ---



		end

		if slot1 and slot9[1] == slot1.configId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-26, warpins: 1 ---
			slot4 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if not slot4 and slot1 and slot2 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-45, warpins: 2 ---
		slot3 = slot3 + (pg.equip_data_template[slot1.configId].destory_gold or 0) * slot2
		--- END OF BLOCK #0 ---



	end

	if slot0.player:GoldMax(slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-69, warpins: 1 ---
		pg.TipsMgr:GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_destroy"))

		return false
		--- END OF BLOCK #0 ---



	end

	return true
	--- END OF BLOCK #0 ---



end

function slot0.updateSelected(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-75, warpins: 1 ---
	for slot4, slot5 in pairs(slot0.equipmetItems) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-30, warpins: 1 ---
		if slot5.equipmentVO then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-28, warpins: 1 ---
			slot6 = false
			slot7 = 0

			for slot11, slot12 in pairs(slot0.selectedIds) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-23, warpins: 1 ---
				if slot5.equipmentVO.id == slot12[1] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 19-22, warpins: 1 ---
					slot6 = true
					slot7 = slot12[2]

					break
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			slot5:updateSelected(slot6, slot7)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot0.selectedMax == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-44, warpins: 1 ---
		setText(findTF(slot0.selectPanel, "bottom_info/bg_input/count"), slot0:selectCount())
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-54, warpins: 1 ---
		setText(findTF(slot0.selectPanel, "bottom_info/bg_input/count"), slot1 .. "/" .. slot0.selectedMax)
		--- END OF BLOCK #0 ---



	end

	if #slot0.selectedIds < slot0.selectedMin then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 60-67, warpins: 1 ---
		setActive(findTF(slot0.selectPanel, "confirm_button/mask"), true)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 68-74, warpins: 1 ---
		setActive(findTF(slot0.selectPanel, "confirm_button/mask"), false)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayDestroyBonus(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-110, warpins: 1 ---
	slot1 = {}

	for slot6, slot7 in ipairs(slot0.selectedIds) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-68, warpins: 1 ---
		if pg.equip_data_template[slot7[1]] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-66, warpins: 2 ---
			slot2 = 0 + (slot8.destory_gold or 0) * slot7[2]

			for slot14, slot15 in ipairs(slot8.destory_item or {}) do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-66, warpins: 1 ---
				slot16 = false

				for slot20, slot21 in ipairs(slot1) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 33-49, warpins: 1 ---
					if slot15[1] == slot1[slot20].id then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 38-48, warpins: 1 ---
						slot1[slot20].count = slot1[slot20].count + slot15[2] * slot7[2]
						slot16 = true

						break
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				if not slot16 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 52-64, warpins: 1 ---
					table.insert(slot1, {
						type = DROP_TYPE_ITEM,
						id = slot15[1],
						count = slot15[2] * slot7[2]
					})
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot2 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-79, warpins: 1 ---
		table.insert(slot1, {
			id = 1,
			type = DROP_TYPE_RESOURCE,
			count = slot2
		})
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.destroyNoGotTip, #slot1 <= 0)

	if not slot0.destroyList then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 93-98, warpins: 1 ---
		slot0.destroyList = UIItemList.New(slot0.destroyBonusList, slot0.destroyBonusItem)
		--- END OF BLOCK #0 ---



	end

	slot0.destroyList:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-47, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-46, warpins: 1 ---
			if uv0[slot1 + 1].type == DROP_TYPE_SHIP then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-14, warpins: 1 ---
				uv1.hasShip = true
				--- END OF BLOCK #0 ---



			end

			updateDrop(slot2:Find("bg"), slot3)

			slot4, slot5 = contentWrap(slot3.cfg.name, 10, 2)

			if slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-32, warpins: 1 ---
				slot5 = slot5 .. "..."
				--- END OF BLOCK #0 ---



			end

			setText(slot2:Find("bg/name"), slot5)
			onButton(uv1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-40, warpins: 1 ---
				if uv0.type == DROP_TYPE_RESOURCE or uv0.type == DROP_TYPE_ITEM then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 11-20, warpins: 2 ---
					uv1:emit(uv2.ON_ITEM, uv0.cfg.id)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-25, warpins: 1 ---
					if uv0.type == DROP_TYPE_EQUIP then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 26-39, warpins: 1 ---
						uv1:emit(uv2.ON_EQUIPMENT, {
							equipmentId = uv0.cfg.id,
							type = EquipmentInfoMediator.TYPE_DISPLAY
						})
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.destroyList:align(#slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.SwitchToDestroy(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	triggerToggle(slot0.weaponToggle, true)

	slot0.selectEnabled = false

	triggerButton(slot0.BatchDisposeBtn)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.blurPanel, slot0._tf)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.topItems, slot0._tf)

	if slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-24, warpins: 1 ---
		cancelTweens(slot0.tweens)
		--- END OF BLOCK #0 ---



	end

	slot0.assignedItemPanel:dispose()

	return
	--- END OF BLOCK #0 ---



end

return slot0
