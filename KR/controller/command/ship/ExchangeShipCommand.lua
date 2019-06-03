class("ExchangeShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot7 = Ship.New({
		configId = getProxy(BuildShipProxy).getExchangeShipByIndex(slot4, slot3).id
	}).getExchangePrice(slot6)
	slot11 = getProxy(BagProxy).getItemById(slot10, ITEM_ID_SILVER_HOOK)

	if getProxy(PlayerProxy).getData(slot12).ship_bag_max <= #getProxy(BayProxy).getShips(slot8) then
		NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

		return
	end

	if slot11 == nil or slot11.count < slot7 then
		pg.TipsMgr:GetInstance():ShowTips(i18n("word_materal_no_enough"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(16102, {
		index = slot3,
		flash_time = slot4:getExchangeFlashTime()
	}, 16103, function (slot0)
		if slot0.result == 0 then
			uv0:removeItemById(ITEM_ID_SILVER_HOOK, uv1)
			getProxy(BayProxy).addShip(slot1, slot2)

			uv2:getExchangeShipByIndex(uv3).isFetched = true

			uv2:updateExchangeShip(uv3, slot3)
			uv4:sendNotification(GAME.EXCHANGE_SHIP_DONE, Ship.New(slot0.ship_info))
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("ship_exchange_erro", slot0.result))
		end
	end)
end

return class("ExchangeShipCommand", pm.SimpleCommand)
