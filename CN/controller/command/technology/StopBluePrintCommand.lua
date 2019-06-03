class("StopBluePrintCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().callback

	if not getProxy(TechnologyProxy):getBluePrintById(slot1.getBody().id) then
		return
	end

	if not slot6:isDeving() and not slot6:isFinished() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(63206, {
		blueprint_id = slot3
	}, 63207, function (slot0)
		if slot0.result == 0 then
			uv0:updateStartUpTime(slot1)
			uv0:reset()
			uv1:updateBluePrint(uv0)
			uv2:sendNotification(GAME.STOP_BLUEPRINT_DONE, {
				id = uv0.id
			})

			if uv3 then
				uv3()
			end
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("technology_stop_erro") .. slot0.result)
		end
	end)
end

return class("StopBluePrintCommand", pm.SimpleCommand)
