class("DestroyEquipmentsCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = {}
	slot4 = {}

	for slot9, slot10 in ipairs(slot1:getBody().equipments) do
		slot12 = slot10[2]

		if not getProxy(EquipmentProxy):getEquipmentById(slot10[1]) then
			pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_destroyEquipments_error_noEquip"))

			return
		end

		if slot13.count < slot12 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_destroyEquipments_error_notEnoughEquip"))

			return
		end

		if slot13:GetCategory() == EquipCategory.Siren then
			table.insert(slot4, slot11)
		else
			table.insert(slot3, {
				id = slot11,
				count = slot12
			})
		end
	end

	pg.ConnectionMgr.GetInstance():Send(14008, {
		equip_list = slot3,
		affixequipment_id_list = slot4
	}, 14009, function (slot0)
		if slot0.result == 0 then
			slot2 = getProxy(PlayerProxy).getData(slot1)
			slot3 = {}
			slot4 = 0

			for slot9, slot10 in ipairs(uv1) do
				function (slot0, slot1)
					print("remove: " .. slot0 .. " " .. slot1)
					uv0:removeEquipmentById(slot0, slot1)

					uv1 = uv1 + (slot2.config.destory_gold or 0) * slot1

					for slot8, slot9 in ipairs(uv0:getEquipmentById(slot0).config.destory_item or {}) do
						slot10 = false

						for slot14, slot15 in ipairs(uv2) do
							if slot9[1] == uv2[slot14].id then
								uv2[slot14].count = uv2[slot14].count + slot9[2] * slot1
								slot10 = true

								break
							end
						end

						if not slot10 then
							table.insert(uv2, Item.New({
								type = DROP_TYPE_ITEM,
								id = slot9[1],
								count = slot9[2] * slot1
							}))
						end
					end
				end(slot10.id, slot10.count)
			end

			for slot9, slot10 in ipairs(uv2) do
				slot5(slot10, 1)
			end

			table.insert(slot3, Item.New({
				id = 1,
				type = DROP_TYPE_RESOURCE,
				count = slot4
			}))

			for slot9, slot10 in ipairs(slot3) do
				uv3:sendNotification(GAME.ADD_ITEM, slot10)
			end

			uv3:sendNotification(GAME.DESTROY_EQUIPMENTS_DONE, slot3)

			return
		end

		pg.TipsMgr:GetInstance():ShowTips(errorTip("equipment_destroyEquipments", slot0.result))
	end)
end

return class("DestroyEquipmentsCommand", pm.SimpleCommand)
