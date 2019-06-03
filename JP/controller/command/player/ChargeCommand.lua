class("ChargeCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot5 = getProxy(ShopsProxy):getFirstChargeList() or {}

	if not slot1:getBody().shopId then
		return
	end

	slot6 = not table.contains(slot5, slot3)
	slot7 = Goods.New({
		shop_id = slot3
	}, Goods.TYPE_CHARGE)

	if isAiriJP() then
		SendAiriJPTracking(AIRIJP_TRACKING_PURCHASE_CLICK, getProxy(PlayerProxy):getData().id, slot3)
	end

	pg.ConnectionMgr.GetInstance():Send(11501, {
		shop_id = slot3
	}, 11502, function (slot0)
		if slot0.result == 0 then
			if isAiriJP() then
				if AiriCheckAudit() then
					print("serverTag:audit 请求购买物品")
					AiriBuy(uv0:getConfig("airijp_id"), "audit", slot0.pay_id)
				elseif AiriCheckPreAudit() then
					print("serverTag:preAudit 请求购买物品")
					AiriBuy(uv0:getConfig("airijp_id"), "preAudit", slot0.pay_id)
				else
					print("serverTag:production 请求购买物品")
					AiriBuy(uv0:getConfig("airijp_id"), "production", slot0.pay_id)
				end

				print("请求购买的airijp_id为：" .. uv0:getConfig("airijp_id"))
				print("请求购买的id为：" .. slot0.pay_id)
			else
				slot7 = 0

				BilibiliSdkMgr.inst:pay(uv0:getConfig("id_str"), uv0:getConfig("money") * 100, uv0:getConfig("name"), uv0:isMonthCard() and 1 or uv0:firstPayDouble() and uv1 and uv0:getConfig("gem") * 2 or uv0:getConfig("gem") + uv0:getConfig("extra_gem"), slot0.pay_id, uv0:getConfig("subject"), "-" .. getProxy(PlayerProxy).getData(slot2).id .. "-" .. slot8, getProxy(PlayerProxy).getData(slot2).name)
			end

			getProxy(ShopsProxy):addWaitTimer()
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("charge_erro", slot0.result))
		end
	end)
end

return class("ChargeCommand", pm.SimpleCommand)
