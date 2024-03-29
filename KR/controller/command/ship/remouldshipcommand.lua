class("RemouldShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot3 = slot2.shipId
	slot4 = slot2.remouldId
	slot5 = slot2.materialIds or {}

	if not slot3 or not slot4 then
		return
	end

	if getProxy(PlayerProxy).getData(slot6).gold < pg.transform_data_template[slot4].use_gold then
		pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_resource"))

		return
	end

	slot13 = 0

	if getProxy(BayProxy).getShipById(slot10, slot3).transforms[slot4] and slot11.transforms[slot4].level == #slot8.effect then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_remould_max_level"))

		return
	end

	slot14 = slot8.use_item[slot13 + 1] or {}
	slot15 = getProxy(BagProxy)

	for slot19, slot20 in ipairs(slot14) do
		if slot15:getItemCountById(slot20[1]) < slot20[2] then
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_item_1"))

			return
		end
	end

	if slot8.use_ship ~= 0 then
		if table.getCount(slot5) ~= slot8.use_ship then
			pg.TipsMgr:GetInstance():ShowTips(i18n("ship_remould_material_ship_no_enough"))

			return
		end

		for slot19, slot20 in ipairs(slot5) do
			if not slot10:getShipById(slot20) then
				pg.TipsMgr:GetInstance():ShowTips(i18n("ship_remould_material_ship_on_exist"))

				return
			end
		end
	end

	for slot19, slot20 in ipairs(slot8.ship_id) do
		if slot20[1] == slot11.configId and slot7.equip_bag_max <= getProxy(EquipmentProxy):getCapacity() then
			Clone(slot11).configId = slot20[2]

			for slot26, slot27 in ipairs(Clone(slot11).equipments) do
				if slot27 and slot22:isForbiddenAtPos(slot27, slot26) then
					pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_cant_unload"))

					return
				end
			end
		end
	end

	pg.ConnectionMgr.GetInstance():Send(12011, {
		ship_id = slot3,
		remould_id = slot4,
		material_id = slot5
	}, 12012, function (slot0)
		if slot0.result == 0 then
			if slot0 then
				slot1.transforms[].level = slot1.transforms[slot2].level + 1
			else
				slot1.transforms[slot2] = {
					level = 1,
					id = slot2
				}
			end

			slot2 = getProxy(NavalAcademyProxy).getStudentByShipId(slot1, )

			local function slot5(slot0)
				if slot0[1] == slot0.configId then
					slot2 = slot0.skills
					slot0.configId = slot0[2]
					slot0.skills = {}
					slot3 = pg.ship_data_template[slot0.configId].buff_list

					if pg.ship_data_template[slot0.configId].buff_list then
						slot6 = slot3[table.indexof(slot1, slot4)]

						if not table.contains(slot3, slot1:getSkillId(slot0)) and slot6 ~= slot4 then
							slot1:updateSkillId(slot6)
							slot2:updateStudent(slot1)
						end
					end

					for slot7, slot8 in ipairs(slot3) do
						if not slot2[slot8] then
							slot9 = {
								exp = 0,
								level = 1,
								id = slot8
							}

							if slot2[slot1[slot7]] then
								slot9.level = slot10.level
								slot9.exp = slot10.exp
							end

							pg.TipsMgr:GetInstance():ShowTips(i18n("ship_remould_material_unlock_skill", pg.skill_data_template[slot8].name))
						end

						slot0.skills[slot9.id] = slot9
					end

					if slot2[11720] and not slot0.skills[11720] then
						slot0.skills[11720] = slot2[11720]
					end
				end
			end

			_.each(slot1.ship_id, slot5)

			slot3 = pairs
			slot4 = slot1.ship_id.use_item[slot5] or {}

			for slot6, slot7 in slot3(slot4) do
				slot6:removeItemById(slot7[1], slot7[2])
			end

			slot3 = getProxy(PlayerProxy)
			slot4 = slot3:getData()

			slot4:consume({
				gold = slot4.use_gold
			})
			slot3:updatePlayer(slot4)

			slot5 = {}

			if slot4.skin_id ~= 0 then
				slot1:updateSkinId(slot4.skin_id)
				table.insert(slot5, {
					count = 1,
					type = DROP_TYPE_SKIN,
					id = slot4.skin_id
				})

				if getProxy(CollectionProxy):getShipGroup(slot1.groupId) and not slot7.trans then
					slot7.trans = true

					slot6:updateShipGroup(slot7)
				end
			end

			if slot4.skill_id ~= 0 and not slot1.skills[slot4.skill_id] then
				slot1.skills[slot4.skill_id] = {
					exp = 0,
					level = 1,
					id = slot4.skill_id
				}

				pg.TipsMgr:GetInstance():ShowTips(i18n("ship_remould_material_unlock_skill", HXSet.hxLan(pg.skill_data_template[slot4.skill_id].name)))
			end

			slot1:updateName()
			slot1:updateShip(slot1)

			slot6 = ipairs
			slot7 = slot1 or {}

			for slot9, slot10 in slot6(slot7) do
				slot7:removeShipById(slot10)
			end

			slot6 = nil
			slot6 = coroutine.create(function ()
				for slot3, slot4 in ipairs(slot0.equipments) do
					if slot4 and not slot0:canEquipAtPos(slot4, slot3) then
						slot1:sendNotification(GAME.UNEQUIP_FROM_SHIP, {
							shipId = slot0.id,
							pos = slot3,
							callback = slot2
						})
						coroutine.yield()
					end
				end

				slot1:sendNotification(GAME.REMOULD_SHIP_DONE, {
					ship = slot3:getShipById(slot3.getShipById),
					id = slot5,
					awards = slot3.getShipById
				})
			end)


			-- Decompilation error in this vicinity:
			function ()
				if slot0 and coroutine.status(coroutine.status) == "suspended" then
					slot0, slot1 = coroutine.resume(coroutine.resume)
				end
			end()

			return
		end

		pg.TipsMgr:GetInstance():ShowTips(errorTip("ship_remouldShip", slot0.result))
	end)
end

return class("RemouldShipCommand", pm.SimpleCommand)
