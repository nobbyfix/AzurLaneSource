class("FinishCampTecCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().levelID

	pg.ConnectionMgr.GetInstance():Send(64003, {
		tech_group_id = slot1.getBody().tecID
	}, 64004, function (slot0)
		if slot0.result == 0 then
			slot1 = getProxy(TechnologyNationProxy)

			slot1:updateTecItem(uv0, uv1, 0, 0)
			slot1:setTimer()
			slot1:calculateTecBuff()
			uv2:sendNotification(TechnologyConst.FINISH_TEC_SUCCESS, uv0)
			slot1:refreshRedPoint()
			uv2:sendNotification(TechnologyConst.UPDATE_REDPOINT_ON_TOP)
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("coloring_cell", slot0.result))
		end
	end)
end

return class("FinishCampTecCommand", pm.SimpleCommand)
