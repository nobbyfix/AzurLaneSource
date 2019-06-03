class("WorldShipRepairCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().shipIds

	if getProxy(WorldProxy).GetWorld(slot5).getInventoryProxy(slot6):GetItemCount(WorldItem.MoneyId) < slot1.getBody().totalCost then
		pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(33407, {
		ship_list = slot3
	}, 33408, function (slot0)
		if slot0.result == 0 then
			_.each(uv0, function (slot0)
				uv0:GetShip(slot0):Repair()
			end)
			uv2:RemoveItem(WorldItem.MoneyId, uv3)
			uv4:sendNotification(GAME.WORLD_SHIP_REPAIR_DONE, {
				shipIds = uv0
			})
		else
			pg.TipsMgr.GetInstance():ShowTips(errorTip("world_ship_repair_err_", slot0.result))
		end
	end)
end

return class("WorldShipRepairCommand", pm.SimpleCommand)
