class("LockCommanderCommande", pm.SimpleCommand).execute = function (slot0, slot1)
	if not getProxy(CommanderProxy):getCommanderById(slot1:getBody().commanderId) or slot6:getLock() == slot1.getBody().flag then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(25016, {
		commanderid = slot3,
		flag = slot4
	}, 25017, function (slot0)
		if slot0.result == 0 then
			uv0:setLock(uv1)
			uv2:updateCommander(uv0)
			uv3:sendNotification(GAME.COMMANDER_LOCK_DONE, {
				commander = uv0,
				flag = uv1
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("commander_lock_erro", slot0.result))
		end
	end)
end

return class("LockCommanderCommande", pm.SimpleCommand)
