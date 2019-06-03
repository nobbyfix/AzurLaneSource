class("ComposeItemCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot7 = getProxy(BagProxy).getItemById(slot5, slot3).getTempCfgTable(slot6)
	slot8 = slot1:getBody().skip_check

	if slot1.getBody().count == 0 then
		return
	end

	slot9 = slot7.target_id

	if slot4 > slot6.count / slot7.compose_number then
		pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_item_1"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(15006, {
		id = slot3,
		num = slot4
	}, 15007, function (slot0)
		if slot0.result == 0 then
			uv0:removeItemById(uv1, uv2 * uv3)
			table.insert(slot1, slot2)
			uv5:sendNotification(GAME.ADD_ITEM, slot2)
			uv5:sendNotification(GAME.USE_ITEM_DONE, {})
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("", slot0.result))
		end
	end)
end

return class("ComposeItemCommand", pm.SimpleCommand)
