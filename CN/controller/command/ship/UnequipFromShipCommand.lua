class("UnequipFromShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().pos
	slot7 = getProxy(BayProxy).getShipById(slot6, slot3)

	if getProxy(PlayerProxy):getData().equip_bag_max <= getProxy(EquipmentProxy):getCapacity() then
		NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)

		if slot1.getBody().callback then
			slot1.getBody().callback()
		end

		return
	end

	if slot7 == nil then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_error_noShip", slot3))

		if slot5 then
			slot5()
		end

		return
	end

	if not slot7:getEquip(slot4) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_unequipFromShip_error_noEquip"))

		if slot5 then
			slot5()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12006, {
		type = 0,
		equip_id = 0,
		ship_id = slot3,
		pos = slot4
	}, 12007, function (slot0)
		if slot0.result == 0 then
			if uv0:hasSkin() then
				uv1:updateEquipmentSkin(uv2, 0)
				getProxy(EquipmentProxy):addEquipmentSkin(uv0.skinId, 1)

				uv0.skinId = 0

				pg.TipsMgr:GetInstance():ShowTips(i18n("equipment_skin_unload"))
			end

			uv1:updateEquip(uv2, nil)
			uv3:updateShip(uv1)
			slot1:addEquipment(uv0)
			uv4:sendNotification(GAME.UNEQUIP_FROM_SHIP_DONE, uv1)
			pg.TipsMgr:GetInstance():ShowTips(i18n("ship_unequipFromShip_ok", uv0.config.name), "red")
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("ship_unequipFromShip", slot0.result))
		end

		if uv5 then
			uv5()
		end
	end)
end

return class("UnequipFromShipCommand", pm.SimpleCommand)
