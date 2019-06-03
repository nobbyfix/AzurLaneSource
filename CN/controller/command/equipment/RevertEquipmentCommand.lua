class("RevertEquipmentCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(14010, {
		equip_id = slot1:getBody().id
	}, 14011, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(EquipmentProxy)
			slot2 = slot1:getEquipmentById(uv0)

			slot1:removeEquipmentById(slot2.id, 1)
			slot1:addEquipmentById(slot2:GetRootEquipment().id, slot2.GetRootEquipment().count)
			getProxy(BagProxy).removeItemById(slot4, Item.REVERT_EQUIPMENT_ID, 1)

			for slot10, slot11 in pairs(slot2:getRevertAwards() or {}) do
				uv1:sendNotification(GAME.ADD_ITEM, Item.New(slot11))
				table.insert({}, slot11)
			end

			uv1:sendNotification(GAME.REVERT_EQUIPMENT_DONE, {
				awards = slot6
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("equipment_destroyEquipments", slot0.result))
		end
	end)
end

return class("RevertEquipmentCommand", pm.SimpleCommand)
