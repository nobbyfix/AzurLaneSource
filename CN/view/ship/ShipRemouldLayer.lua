slot0 = class("ShipRemouldLayer", import("..base.BaseUI"))
slot1 = 5
slot2 = 6
slot3 = 1
slot4 = 9
slot5 = 55
slot6 = Vector2(-5, 25)

function slot0.getUIName(slot0)
	return "ShipRemouldUI"
end

function slot0.init(slot0)
	slot0.container = slot0:findTF("main/bg/container")
	slot0.gridContainer = slot0:findTF("grids", slot0.container)
	slot0.gridTF = slot0:findTF("grid_tpl", slot0.gridContainer)
	slot0.height = slot0.gridTF.sizeDelta.y + uv0
	slot0.width = slot0.gridTF.sizeDelta.x + uv1
	slot0.startPos = Vector2(-1 * (uv2 / 2 - 0.5) * slot0.width + uv3.x, (uv4 / 2 - 0.5) * slot0.height + uv3.y)
	slot0.containerWidth = uv2 * slot0.gridTF.sizeDelta.x + (uv2 - 1) * uv1
	slot0.containerHeight = uv4 * slot0.gridTF.sizeDelta.y + (uv4 - 1) * uv0
	slot0.container.sizeDelta = Vector2(slot0.containerWidth, slot0.containerHeight)

	setActive(slot0.gridTF, false)

	slot0.infoPanel = slot0:findTF("main/info_panel")
	slot0.itemContainer = slot0:findTF("usages/items", slot0.infoPanel)
	slot0.itemTF = slot0:findTF("itemTF", slot0.itemContainer)
	slot0.infoName = slot0:findTF("name_container/Text", slot0.infoPanel):GetComponent(typeof(Text))
	slot0.attrContainer = slot0:findTF("align/attrs", slot0.infoPanel)
	slot0.attrTpl = slot0:getTpl("attr", slot0.attrContainer)
	slot0.attrTplD = slot0:getTpl("attrd", slot0.attrContainer)
	slot0.confirmBtn = slot0:findTF("confirm_btn/activity", slot0.infoPanel)
	slot0.inactiveBtn = slot0:findTF("confirm_btn/inactivity", slot0.infoPanel)
	slot0.completedteBtn = slot0:findTF("confirm_btn/complete", slot0.infoPanel)
	slot0.shipTF = slot0:findTF("main/info_panel/usages/shipTF")
	slot0.skillDesc = slot0:findTF("align/skill_desc/text", slot0.infoPanel)
	slot0.shipContainer = slot0:findTF("char_container", slot0.infoPanel)
	slot0.lineTpl = slot0:findTF("resources/line")
	slot0.lineContainer = slot0:findTF("grids/lines", slot0.container)
	slot0.helpBtn = GameObject.Find("/OverlayCamera/Overlay/UIMain/common/help_btn")

	if not IsNil(slot0.helpBtn) then
		setActive(slot0.helpBtn, false)
	end

	slot0.tooltip = slot0:findTF("tooltip")

	setActive(slot0.tooltip, false)
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1

	if slot0.curTranformId then
		slot0:updateInfo(slot0.curTranformId)
	end
end

function slot0.setItems(slot0, slot1)
	slot0.itemsVO = slot1
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.getItemCount(slot0, slot1)
	return slot0.itemsVO[slot1] or Item.New({
		count = 0,
		id = slot1
	}).count
end

function slot0.setShipVO(slot0, slot1)
	slot0.shipVO = slot1
	slot0.shipGroupId = math.floor(slot0.shipVO:getGroupId())
	slot0.transforms = slot0.shipVO.transforms
end

function slot0.getShipTranformData(slot0)
	return pg.ship_data_trans[slot0.shipGroupId].transform_list
end

function slot0.didEnter(slot0)
	slot0:initTranformInfo()
	slot0:initShipModel()
end

function slot0.initTranformInfo(slot0)
	slot0.transformIds = {}
	slot0.grids = {}

	function slot1(slot0, slot1)
		for slot5, slot6 in ipairs(slot0) do
			if slot6[1] == slot1 then
				return true, slot5
			end
		end

		return false
	end

	slot2 = slot0:getShipTranformData()

	for slot6 = 1, uv0, 1 do
		slot7 = {
			[slot12] = slot16
		}
		slot8 = {
			[slot12] = slot2[slot6][slot14][2]
		}

		for slot12 = 1, uv1, 1 do
			slot13, slot14 = slot1(slot2[slot6], slot12)

			if slot13 then
				slot16 = cloneTplTo(slot0.gridTF, slot0.gridContainer)
				go(slot16).name = slot6 .. "/" .. slot12
				slot16.localPosition = Vector2(slot0.startPos.x + slot0.width * (slot6 - 1), slot0.startPos.y - slot0.height * (slot12 - 1))

				onToggle(slot0, slot16, function (slot0)
					if slot0 and uv0.curTranformId ~= uv1 then
						uv0:updateInfo(uv1)
					end
				end, SFX_PANEL)
			end
		end

		slot0.transformIds[slot6] = slot8
		slot0.grids[slot6] = slot7
	end

	slot0.lineTFs = {}

	for slot6, slot7 in pairs(slot0.transformIds) do
		for slot11, slot12 in pairs(slot7) do
			slot0:updateGridTF(slot12)
			slot0:initLines(slot12)
		end
	end

	slot0:updateLines()

	if slot0.contextData.transformId then
		triggerToggle(slot0:getGridById(slot0.contextData.transformId), true)
	end
end

function slot0.initLines(slot0, slot1)
	slot3 = 75
	slot0.lineTFs[slot1] = {}
	slot4, slot5 = slot0:getPositionById(slot1)

	for slot14, slot15 in pairs(slot10) do
		slot16, slot17 = slot0:getPositionById(slot15)
		cloneTplTo(slot0.lineTpl, slot0.lineContainer, slot4 .. "-" .. slot5 .. "-v").eulerAngles = Vector3(0, 0, Vector2(slot16 - slot4, slot17 - slot5).y < 0 and 90 or -90)
		cloneTplTo(slot0.lineTpl, slot0.lineContainer, slot4 .. "-" .. slot5 .. "-h").eulerAngles = Vector3(0, 0, slot18.x < 0 and 180 or 0)

		if math.abs(slot18.y) > 0 and math.abs(slot18.x) > 0 then
			slot20.localPosition = Vector2(slot0:getGridById(slot1).localPosition.x, slot0.getGridById(slot1).localPosition.y + (slot5 - slot17) * 270, 0)
			slot19.localPosition = Vector2(slot0.getGridById(slot1).localPosition.x, slot18.y < 0 and slot0.getGridById(slot1).localPosition.y + slot0.getGridById(slot1).sizeDelta.y / 2 or slot0.getGridById(slot1).localPosition.y - slot0.getGridById(slot1).sizeDelta.y / 2)
			slot20.sizeDelta = Vector2(math.abs(slot18.x) * 270, slot20.sizeDelta.y)
			slot19.sizeDelta = Vector2(math.abs(slot18.y) * 270 - slot0.getGridById(slot1).sizeDelta.y / 2, slot19.sizeDelta.y)
			slot19:Find("corner").localScale = Vector3(1, slot18.x < 0 and slot21 < 0 and -1 or 1, 1)
		else
			slot20.sizeDelta = Vector2(math.abs(slot18.x) * slot2, slot20.sizeDelta.y)
			slot19.sizeDelta = Vector2(math.abs(slot18.y) * slot3, slot19.sizeDelta.y)
			slot20.localPosition = slot8
			slot19.localPosition = Vector3(slot8.x, slot18.y < 0 and slot8.y + slot7.y / 2 or slot8.y - slot7.y / 2, 0)
		end

		setActive(slot19:Find("arr"), slot23 or math.abs(slot18.y) > 0)
		setActive(slot19:Find("corner"), slot23)
		setActive(slot20:Find("arr"), false)
		setActive(slot20:Find("corner"), false)
		table.insert(slot0.lineTFs[slot1], {
			id = slot15,
			hrz = slot20,
			vec = slot19
		})
	end
end

function slot0.updateLines(slot0)
	for slot4, slot5 in pairs(slot0.transformIds) do
		for slot9, slot10 in pairs(slot5) do
			slot0:updateGridTF(slot10)

			if slot0:canRemould(slot10) or slot0:isFinished(slot10) then
				for slot14, slot15 in ipairs(slot0.lineTFs[slot10] or {}) do
					slot15.hrz:GetComponent("UIGrayScale").enabled = false
					slot15.vec:GetComponent("UIGrayScale").enabled = false
				end
			end
		end
	end
end

function slot0.getLevelById(slot0, slot1)
	return pg.transform_data_template[slot1].level_limit
end

function slot0.getPositionById(slot0, slot1)
	for slot5, slot6 in pairs(slot0.transformIds) do
		for slot10, slot11 in pairs(slot6) do
			if slot1 == slot11 then
				return slot5, slot10
			end
		end
	end
end

function slot0.getGridById(slot0, slot1)
	slot2, slot3 = slot0:getPositionById(slot1)

	return slot0.grids[slot2][slot3]
end

slot0.STATE_FINISHED = 1
slot0.STATE_ACTIVE = 2
slot0.STATE_LOCK = 3

function slot0.updateGridTF(slot0, slot1)
	slot3 = slot0:getLevelById(slot1)

	setText(slot0:getGridById(slot1).Find(slot2, "name"), pg.transform_data_template[slot1].name)

	slot5 = 0

	if slot0.shipVO.transforms[slot1] then
		slot5 = slot0.shipVO.transforms[slot1].level
	end

	slot6, slot7, slot8 = slot0:canRemould(slot1)
	slot11 = slot2:Find("icon"):GetComponent(typeof(Image))

	GetSpriteFromAtlasAsync("modicon", slot4.icon, function (slot0)
		if not IsNil(uv0) then
			uv0.sprite = slot0
		end
	end)
	setActive(slot2:Find("bgs/finished"), slot9() == uv0.STATE_FINISHED)
	setActive(slot2:Find("bgs/ongoing"), slot10 == uv0.STATE_ACTIVE)
	setActive(slot2:Find("bgs/lock"), slot10 == uv0.STATE_LOCK)
	setActive(slot2:Find("tags/finished"), slot10 == uv0.STATE_FINISHED)
	setActive(slot2:Find("tags/ongoing"), slot10 == uv0.STATE_ACTIVE)
	setActive(slot2:Find("tags/lock"), slot10 == uv0.STATE_LOCK)

	if slot10 == uv0.STATE_FINISHED then
		setText(slot2:Find("icon/progress"), slot5 .. "/" .. slot4.max_level)
	elseif slot10 == uv0.STATE_ACTIVE then
		setText(slot12, slot5 .. "/" .. slot4.max_level)
	elseif slot10 == uv0.STATE_LOCK then
		setText(slot12, "")
		setActive(slot2:Find("tags/lock/lock_prev"), slot8 and slot8[1] == 1)
		setActive(slot2:Find("tags/lock/lock_level"), slot8 and slot8[1] == 2)
		setActive(slot2:Find("tags/lock/lock_star"), slot8 and slot8[1] == 3)

		if slot8 and slot8[1] == 2 then
			setText(slot2:Find("tags/lock/lock_level/Text"), slot8[2])
		elseif slot8 and slot8[1] == 3 then
			setText(slot2:Find("tags/lock/lock_star/Text"), slot8[2])
		end
	end
end

function slot0.initShipModel(slot0)
	if slot0.shipContainer.childCount ~= 0 then
		PoolMgr.GetInstance():ReturnSpineChar(slot0.shipVO:getPrefab(), go(slot0.shipModel))
	end

	function slot2(slot0)
		if not IsNil(uv0._tf) then
			slot1 = tf(slot0)
			uv0.shipModel = slot1
			uv0.spineAnimUI = slot1:GetComponent("SpineAnimUI")

			pg.ViewUtils.SetLayer(slot1, Layer.UI)

			slot1.localScale = Vector3(uv1, uv1, 1)

			setParent(slot1, uv0.shipContainer)

			slot1.localPosition = Vector2(0, 10)

			uv0.spineAnimUI:SetAction("stand2", 0)
		end
	end

	PoolMgr.GetInstance():GetSpineChar(slot1, true, function (slot0)
		uv0(slot0)
	end)
end

function slot0.updateInfo(slot0, slot1)
	if slot0:isFinished(slot1) then
		slot0:updateFinished(slot1)
	else
		slot0:updateProgress(slot1)
	end
end

function slot0.updateFinished(slot0, slot1)
	slot0.curTranformId = slot1
	slot0.infoName.text = pg.transform_data_template[slot1].name
	slot4 = {}

	for slot8 = 1, slot0.transforms[slot1].level, 1 do
		_.each(slot3.use_item[slot8], function (slot0)
			if not _.detect(uv0, function (slot0)
				return slot0.type == DROP_TYPE_ITEM and slot0.id == uv0[1]
			end) then
				table.insert(uv0, {
					type = DROP_TYPE_ITEM,
					id = slot0[1],
					count = slot0[2]
				})
			else
				slot1.count = slot1.count + slot0[2]
			end
		end)
	end

	table.insert(slot4, {
		type = DROP_TYPE_ITEM,
		id = id2ItemId(1),
		count = slot3.use_gold * slot2
	})

	for slot9 = slot0.itemContainer.childCount, #slot4 - 1, 1 do
		cloneTplTo(slot0.itemTF, slot0.itemContainer)
	end

	for slot9 = 1, slot0.itemContainer.childCount, 1 do
		setActive(slot0.itemContainer:GetChild(slot9 - 1), slot9 <= #slot4)

		if slot9 <= #slot4 then
			updateDrop(slot0:findTF("IconTpl", slot10), slot4[slot9])
		end
	end

	setActive(slot0.shipTF, slot3.use_ship > 0)

	if slot3.use_ship > 0 then
		setActive(slot0.shipTF:Find("addTF"), false)
		setActive(slot0.shipTF:Find("IconTpl"), true)
		updateDrop(slot0:findTF("IconTpl", slot0.shipTF), {
			type = DROP_TYPE_SHIP,
			id = slot0.shipVO.configId
		})
		removeOnButton(slot0.shipTF)
	end

	setActive(slot0.skillDesc.parent, slot3.skill_id ~= 0)

	if slot3.skill_id ~= 0 then
		setText(slot0.skillDesc, i18n("ship_remould_material_unlock_skill", HXSet.hxLan(pg.skill_data_template[slot3.skill_id].name)))
	end

	removeAllChildren(slot0.attrContainer)
	_.each(slot3.ship_id, function (slot0)
		if slot0[1] == uv0.shipVO.configId then
			uv1 = slot0[2]
		end

		if pg.ship_data_template[slot0[1]].group_type == uv0.shipVO.groupId then
			uv2 = pg.ship_data_statistics[slot0[2]].type
		end
	end)

	if nil then
		slot8 = cloneTplTo(slot0.attrTplD, slot0.attrContainer)

		setText(slot8:Find("name"), i18n("common_ship_type"))
		setText(slot8:Find("value"), ShipType.Type2Name(slot7))
		setActive(slot9, true)
		onButton(slot0, slot8, function ()
			uv0:showToolTip(uv1)
		end)
	else
		for slot13, slot14 in pairs(slot9) do
			if _.reduce(slot3.effect, {}, function (slot0, slot1)
				for slot5, slot6 in pairs(slot1) do
					slot0[slot5] = (slot0[slot5] or 0) + slot6
				end

				return slot0
			end)[slot13] then
				slot0:updateAttrTF_D(cloneTplTo(slot0.attrTplD, slot0.attrContainer), {
					attrName = AttributeType.Type2Name(slot13),
					value = math.floor(slot14),
					addition = _.reduce(slot3.effect, , function (slot0, slot1)
						for slot5, slot6 in pairs(slot1) do
							slot0[slot5] = (slot0[slot5] or 0) + slot6
						end

						return slot0
					end)[slot13]
				})
			end
		end

		for slot14 = 1, 3, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 254-297, warpins: 2 ---
			if slot8["equipment_proficiency_" .. slot14] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 260-296, warpins: 1 ---
				slot0:updateAttrTF_D(cloneTplTo(slot0.attrTplD, slot0.attrContainer), {
					attrName = EquipType.type2Title(slot14, pg.ship_data_template[slot0.shipVO.configId]["equip_" .. slot14][1]) .. i18n("common_proficiency"),
					value = slot0.shipVO:getEquipProficiencyByPos(slot14) * 100,
					addition = slot8["equipment_proficiency_" .. slot14] * 100
				}, true)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
	end

	setActive(slot0.confirmBtn, false)
	setActive(slot0.inactiveBtn, false)
	setActive(slot0.completedteBtn, slot0:isFinished(slot1))

	slot0.contextData.transformId = slot1
end

function slot0.updateProgress(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 28-452, warpins: 2 ---
	slot0.curTranformId = slot1
	slot0.infoName.text = pg.transform_data_template[slot1].name
	slot4, slot5 = slot0:canRemould(slot1)

	setActive(slot0.shipTF, false)
	setText(slot0.skillDesc, "")

	slot7 = {}

	if table.getCount(pg.transform_data_template[slot1].effect[(slot0.transforms[slot1] and slot0.transforms[slot1].level or 0) + 1] or {}) > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-142, warpins: 2 ---
		table.insert(Clone(slot3.use_item[slot2]) or {}, {
			id2ItemId(1),
			slot3.use_gold
		})
		setActive(slot0.shipTF, slot3.use_ship ~= 0)

		if slot3.use_ship ~= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 87-126, warpins: 3 ---
			setActive(slot0.shipTF:Find("IconTpl"), slot0.contextData.materialShipIds and table.getCount(slot8) ~= 0)
			setActive(slot0.shipTF:Find("addTF"), not (slot0.contextData.materialShipIds and table.getCount(slot8) ~= 0))

			if slot0.contextData.materialShipIds and table.getCount(slot8) ~= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 105-119, warpins: 1 ---
				updateDrop(slot0:findTF("IconTpl", slot0.shipTF), {
					id = slot0.shipVOs[slot8[1]].configId,
					type = DROP_TYPE_SHIP
				})
				--- END OF BLOCK #0 ---



			end

			onButton(slot0, slot0.shipTF, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-22, warpins: 1 ---
				if uv0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 4-12, warpins: 1 ---
					uv1:emit(ShipRemouldMediator.ON_SELECTE_SHIP, uv1.shipVO)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-21, warpins: 1 ---
					pg.TipsMgr:GetInstance():ShowTips(uv2)
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 127-129, warpins: 1 ---
			slot0.contextData.materialShipIds = nil
			--- END OF BLOCK #0 ---



		end

		setActive(slot0.skillDesc.parent, slot3.skill_id ~= 0)

		if slot3.skill_id ~= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 143-160, warpins: 1 ---
			setText(slot0.skillDesc, i18n("ship_remould_material_unlock_skill", HXSet.hxLan(pg.skill_data_template[slot3.skill_id].name)))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 161-163, warpins: 1 ---
		slot0.contextData.materialShipIds = nil
		--- END OF BLOCK #0 ---



	end

	for slot12 = slot0.itemContainer.childCount, #slot7 - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 171-175, warpins: 2 ---
		cloneTplTo(slot0.itemTF, slot0.itemContainer)
		--- END OF BLOCK #0 ---



	end

	for slot12 = 1, slot0.itemContainer.childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 195-256, warpins: 2 ---
		setActive(slot0.itemContainer:GetChild(slot12 - 1), slot12 <= #slot7)

		if slot12 <= #slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 243-255, warpins: 2 ---
			slot15 = ""

			updateDrop(slot0:findTF("IconTpl", slot13), {
				id = slot14[1],
				type = DROP_TYPE_ITEM,
				count = (slot7[slot12][1] ~= id2ItemId(1) or setColorStr(slot14[2], slot0.playerVO.gold < slot14[2] and COLOR_RED or COLOR_WHITE)) and setColorStr(slot0:getItemCount(slot14[1]), slot0:getItemCount(slot14[1]) < slot14[2] and COLOR_RED or COLOR_WHITE) .. "/" .. slot14[2]
			})
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	removeAllChildren(slot0.attrContainer)
	_.each(slot3.ship_id, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		if slot0[1] == uv0.shipVO.configId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-8, warpins: 1 ---
			uv1 = slot0[2]
			--- END OF BLOCK #0 ---



		end

		if pg.ship_data_template[slot0[1]].group_type == uv0.shipVO.groupId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-24, warpins: 1 ---
			uv2 = pg.ship_data_statistics[slot0[2]].type
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	if nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 268-316, warpins: 1 ---
		slot11 = cloneTplTo(slot0.attrTpl, slot0.attrContainer)

		setText(slot11:Find("name"), i18n("common_ship_type"))
		setText(slot11:Find("pre_value"), ShipType.Type2Name(slot0.shipVO:getShipType()))
		setText(slot11:Find("value"), ShipType.Type2Name(slot10))
		setActive(slot11:Find("addtion"), false)

		if slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 317-326, warpins: 1 ---
			setActive(slot11:Find("quest"), true)
			onButton(slot0, slot11, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				uv0:showToolTip(uv1)

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 327-331, warpins: 1 ---
			setActive(slot12, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 332-418, warpins: 1 ---
		for slot15, slot16 in pairs(slot11) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 340-365, warpins: 1 ---
			if slot6[slot15] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 343-363, warpins: 1 ---
				slot0:updateAttrTF(cloneTplTo(slot0.attrTpl, slot0.attrContainer), {
					attrName = AttributeType.Type2Name(slot15),
					value = math.floor(slot16),
					addition = slot6[slot15]
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		for slot16 = 1, 3, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 375-418, warpins: 2 ---
			if slot6["equipment_proficiency_" .. slot16] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 381-417, warpins: 1 ---
				slot0:updateAttrTF(cloneTplTo(slot0.attrTpl, slot0.attrContainer), {
					attrName = EquipType.type2Title(slot16, pg.ship_data_template[slot0.shipVO.configId]["equip_" .. slot16][1]) .. i18n("common_proficiency"),
					value = slot0.shipVO:getEquipProficiencyByPos(slot16) * 100,
					addition = slot6["equipment_proficiency_" .. slot16] * 100
				}, true)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.confirmBtn, slot4 and slot0:isEnoughResource(slot1))
	setActive(slot0.inactiveBtn, not slot4 or not slot0.isEnoughResource(slot1))
	setActive(slot0.completedteBtn, false)
	onButton(slot0, slot0.confirmBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-95, warpins: 1 ---
		slot0, slot1 = Ship.canModifyShip(uv0.shipVO)

		if not slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-17, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
			--- END OF BLOCK #0 ---



		end

		slot2, slot3 = uv0:canRemould(uv1)

		if not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-34, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(slot3)

			return
			--- END OF BLOCK #0 ---



		end

		slot4, slot5 = uv0:isEnoughResource(uv1)

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-51, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(slot5)

			return
			--- END OF BLOCK #0 ---



		end

		if uv2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 55-81, warpins: 1 ---
			slot6 = pg.MsgboxMgr.GetInstance()

			slot6:ShowMsgBox({
				modal = true,
				content = i18n("ship_remould_warning_" .. uv2, uv0.shipVO:getName()),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-11, warpins: 1 ---
					uv0:emit(ShipRemouldMediator.REMOULD_SHIP, uv0.shipVO.id, uv1)

					return
					--- END OF BLOCK #0 ---



				end
			})
			slot6.contentText:AddListener(function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				if slot0 == "clickDetail" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 3-7, warpins: 1 ---
					uv0:showToolTip(uv1)
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 82-91, warpins: 1 ---
			uv0:emit(ShipRemouldMediator.REMOULD_SHIP, uv0.shipVO.id, uv1)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_CONFIRM)

	slot0.contextData.transformId = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.isUnlock(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	if not slot0:isUnLockPrev(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-8, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	if slot0.shipVO.level < slot0:getLevelById(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	if not slot0:isReachStar(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-26, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	return true
	--- END OF BLOCK #0 ---



end

function slot0.isFinished(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 14-20, warpins: 2 ---
	if pg.transform_data_template[slot1].max_level == (slot0.transforms[slot1] and slot0.transforms[slot1].level or 0) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 1 ---
		return true
		--- END OF BLOCK #0 ---



	end

	return false
	--- END OF BLOCK #0 ---



end

function slot0.isReachStar(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 14-14, warpins: 2 ---
	return pg.transform_data_template[slot1].star_limit <= slot0.shipVO:getStar()
	--- END OF BLOCK #0 ---



end

function slot0.canRemould(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-61, warpins: 1 ---
	if not slot0:isUnLockPrev(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-12, warpins: 1 ---
		return false, i18n("ship_remould_prev_lock"), {
			1
		}
		--- END OF BLOCK #0 ---



	end

	if slot0.shipVO.level < slot0:getLevelById(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-32, warpins: 1 ---
		return false, i18n("ship_remould_need_level", pg.transform_data_template[slot1].level_limit), {
			2,
			pg.transform_data_template[slot1].level_limit
		}
		--- END OF BLOCK #0 ---



	end

	if not slot0:isReachStar(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-47, warpins: 1 ---
		return false, i18n("ship_remould_need_star", slot2.star_limit), {
			3,
			slot2.star_limit
		}
		--- END OF BLOCK #0 ---



	end

	if slot0:isFinished(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-59, warpins: 1 ---
		return false, i18n("ship_remould_finished"), {
			4
		}
		--- END OF BLOCK #0 ---



	end

	return true
	--- END OF BLOCK #0 ---



end

function slot0.isUnLockPrev(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	for slot6, slot7 in pairs(pg.transform_data_template[slot1].condition_id) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-24, warpins: 1 ---
		if not slot0.transforms[slot7] or slot0.transforms[slot7].level ~= pg.transform_data_template[slot7].max_level then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-22, warpins: 2 ---
			return false
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return true
	--- END OF BLOCK #0 ---



end

function slot0.isEnoughResource(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-70, warpins: 1 ---
	slot2 = pg.transform_data_template[slot1]
	slot3 = 0

	if slot0.transforms[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-11, warpins: 1 ---
		slot3 = slot0.transforms[slot1].level
		--- END OF BLOCK #0 ---



	end

	for slot7, slot8 in ipairs(slot2.use_item[slot3 + 1] or {}) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-39, warpins: 1 ---
		if not slot0.itemsVO[slot8[1]] or slot0.itemsVO[slot8[1]].count < slot8[2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-37, warpins: 2 ---
			return false, i18n("ship_remould_no_item")
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if slot0.playerVO.gold < slot2.use_gold then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-49, warpins: 1 ---
		return false, i18n("ship_remould_no_gold")
		--- END OF BLOCK #0 ---



	end

	if slot2.use_ship ~= 0 and table.getCount(slot0.contextData.materialShipIds or {}) ~= slot2.use_ship then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-68, warpins: 1 ---
		return false, i18n("ship_remould_no_material")
		--- END OF BLOCK #0 ---



	end

	return true
	--- END OF BLOCK #0 ---



end

function slot0.updateAttrTF(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 48-51, warpins: 2 ---
	setText(slot1:Find("name"), slot2.attrName)
	setText(slot1:Find("pre_value"), slot2.value .. (slot3 and "%" or ""))
	setText(slot1:Find("value"), slot2.addition + slot2.value .. (slot3 and "%" or ""))
	setText(slot1:Find("addtion"), (slot2.addition > 0 and "+" .. slot2.addition or slot2.addition) .. (slot3 and "%" or ""))

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateAttrTF_D(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 28-31, warpins: 2 ---
	setText(slot1:Find("name"), slot2.attrName)
	setText(slot1:Find("value"), (slot2.addition > 0 and "+" .. slot2.addition or slot2.addition) .. (slot3 and "%" or ""))

	return
	--- END OF BLOCK #0 ---



end

function slot0.showToolTip(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-224, warpins: 1 ---
	if not slot0.shipVO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	setActive(findTF(slot0.tooltip, "window/scrollview/list/attrs"), not slot0:isFinished(slot1))

	if not slot0.isFinished(slot1) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-180, warpins: 1 ---
		slot4 = Clone(slot0.shipVO)

		_.each(pg.transform_data_template[slot1].ship_id, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if slot0[1] == uv0.shipVO.configId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-9, warpins: 1 ---
				uv1.configId = slot0[2]
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)

		slot4.transforms[slot1] = {
			level = 1,
			id = slot1
		}

		table.insert(slot5, {
			name = i18n("common_ship_type"),
			from = ShipType.Type2Name(slot0.shipVO:getShipType()),
			to = ShipType.Type2Name(slot4:getShipType())
		})
		table.insert(slot5, {
			name = i18n("attribute_armor_type"),
			from = slot0.shipVO:getShipArmorName(),
			to = slot4:getShipArmorName()
		})

		slot7 = slot0.shipVO:getShipProperties()
		slot8 = slot4:getShipProperties()

		for slot12, slot13 in ipairs(slot6) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 115-160, warpins: 1 ---
			slot14 = {
				name = AttributeType.Type2Name(slot13),
				from = slot0.shipVO:getBattleTotalExpend(),
				to = slot4:getBattleTotalExpend()
			}

			if slot13 == AttributeType.Expend then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 120-134, warpins: 1 ---
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 135-149, warpins: 1 ---
				slot14.name = AttributeType.Type2Name(slot13)
				slot14.from = math.floor(slot7[slot13])
				slot14.to = math.floor(slot8[slot13])
				--- END OF BLOCK #0 ---



			end

			slot14.add = slot14.to - slot14.from

			table.insert(slot5, slot14)
			--- END OF BLOCK #0 ---



		end

		slot9 = UIItemList.New(findTF(slot0.tooltip, "window/scrollview/list/attrs"), findTF(slot0.tooltip, "window/scrollview/list/attrs/attr"))

		slot9:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-89, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-29, warpins: 1 ---
				setText(slot2:Find("name"), uv0[slot1 + 1].name)
				setText(slot2:Find("pre_value"), uv0[slot1 + 1].from)

				slot5 = "#A9F548"

				if uv0[slot1 + 1].add and slot3.from ~= slot3.to then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 34-72, warpins: 1 ---
					setActive(slot2:Find("addtion"), true)

					if slot3.to < slot3.from then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 42-42, warpins: 1 ---
						slot5 = "#FF3333"
						--- END OF BLOCK #0 ---



					end

					setText(slot4, string.format("<color=%s>[%s%s]</color>", slot5, slot3.from < slot3.to and "+" or "", slot3.add))
					setText(slot2:Find("value"), string.format("<color=%s>%s</color>", slot5, slot3.to))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 73-88, warpins: 2 ---
					setActive(slot4, false)
					setText(slot2:Find("value"), string.format("<color=%s>%s</color>", slot5, slot3.to))
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		slot9:align(#slot5)
		--- END OF BLOCK #0 ---



	end

	setText(findTF(slot0.tooltip, "window/scrollview/list/content/"), HXSet.hxLan(slot2.descrip))
	onButton(slot0, findTF(slot0.tooltip, "window/top/btnBack"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:closeTip()

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, slot0.tooltip, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:closeTip()

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	setActive(slot0.tooltip, true)
	pg.UIMgr.GetInstance():OverlayPanel(slot0.tooltip, {
		groupName = LayerWeightConst.GROUP_SHIPINFOUI
	})

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeTip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	setActive(slot0.tooltip, false)
	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.tooltip, slot0._tf)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	if slot0.helpBtn then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		setActive(slot0.helpBtn, true)
		--- END OF BLOCK #0 ---



	end

	pg.UIMgr.GetInstance():UnOverlayPanel(slot0.tooltip, slot0._tf)

	return
	--- END OF BLOCK #0 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	if isActive(slot0.tooltip) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		slot0:closeTip()

		return
		--- END OF BLOCK #0 ---



	end

	slot0:emit(BaseUI.ON_BACK_PRESSED, true)

	return
	--- END OF BLOCK #0 ---



end

return slot0
