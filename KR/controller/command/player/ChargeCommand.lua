class("ChargeCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot5 = getProxy(ShopsProxy):getFirstChargeList() or {}

	if not slot1:getBody().shopId then
		return
	end

	slot6 = not table.contains(slot5, slot3)
	slot7 = Goods.New({
		shop_id = slot3
	}, Goods.TYPE_CHARGE)

	pg.ConnectionMgr.GetInstance():Send(11501, {
		shop_id = slot3
	}, 11502, function (slot0)
		if slot0.result == 0 then
			slot3 = getProxy(PlayerProxy).getData(slot2)
			slot7 = 0

			pg.SDKMgr:GetInstance():pay(uv0:getConfig("id_str"), uv0:getConfig("money") * 100, uv0:getConfig("name"), uv0:isMonthCard() and 1 or uv0:firstPayDouble() and uv1 and uv0:getConfig("gem") * 2 or uv0:getConfig("gem") + uv0:getConfig("extra_gem"), slot0.pay_id, uv0:getConfig("subject"), "-" .. slot3.id .. "-" .. slot8, slot3.name, slot3.level)
			getProxy(ShopsProxy):addWaitTimer()
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("charge_erro", slot0.result))
		end
	end)
end

return class("ChargeCommand", pm.SimpleCommand)
