class("EventGiveUpCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(13007, {
		id = slot1:getBody().id
	}, 13008, function (slot0)
		if slot0.result == 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("event_giveup_success"))

			slot2, slot3 = getProxy(EventProxy).findInfoById(slot1, uv0)
			slot2.state = EventInfo.StateNone

			uv1:sendNotification(GAME.EVENT_LIST_UPDATE)
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("event_giveup_fail", slot0.result))
		end
	end)
end

return class("EventGiveUpCommand", pm.SimpleCommand)
