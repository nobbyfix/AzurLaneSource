class("GetShipCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().type or 1
	slot6 = slot2.isBatch
	slot7 = slot2.canSkipBatch
	slot8 = slot2.isSkip
	slot9 = slot2.anim

	if not getProxy(BuildShipProxy):getBuildShip(slot2.pos) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_getShip_error_noShip"))

		if slot2.callBack then
			slot2.callBack()
		end

		return
	end

	if not slot11:isFinish() then
		pg.TipsMgr:GetInstance():ShowTips(i18n("ship_getShip_error_notFinish"))

		if slot5 then
			slot5()
		end

		return
	end

	if not slot6 and getProxy(PlayerProxy).getData(slot14).ship_bag_max <= #getProxy(BayProxy):getShips() then
		NoPosMsgBox(i18n("switch_to_shop_tip_noDockyard"), openDockyardClear, gotoChargeScene, openDockyardIntensify)

		if slot5 then
			slot5()
		end

		return
	end

	pg.ConnectionMgr.GetInstance():Send(12025, {
		type = slot3,
		pos = slot4
	}, 12026, function (slot0)
		if slot0.result == 0 then
			if uv7 then
				uv7(function ()
					uv0:removeBuildShipByIndex(uv1)
					uv3:addShip(Ship.New(uv2.ship))
					uv0:setBuildShipState()

					if uv4 and not slot0.virgin and slot0:getRarity() < 4 then
						uv5:sendNotification(GAME.SKIP_SHIP_DONE)
						uv6(slot0)
					else
						uv5:sendNotification(GAME.GET_SHIP_DONE, {
							ship = slot0,
							quitCallBack = uv6,
							canSkipBatch = uv7
						})
					end
				end, uv8.type)
			else
				slot1()
			end
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("ship_getShip", slot0.result))
		end
	end)
end

return class("GetShipCommand", pm.SimpleCommand)
