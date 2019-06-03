class("ColoringClearCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.ConnectionMgr.GetInstance():Send(26006, {
		act_id = slot1:getBody().activityId,
		id = slot1.getBody().id
	}, 26007, function (slot0)
		if slot0.result == 0 then
			getProxy(ColoringProxy).getColorGroup(slot1, uv0).clearFill(slot2)
			uv1:sendNotification(GAME.COLORING_CLEAR_DONE)
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("coloring_clear", slot0.result))
		end
	end)
end

return class("ColoringClearCommand", pm.SimpleCommand)
