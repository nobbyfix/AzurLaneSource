class("FinishTechnologyCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().pool_id

	if not getProxy(TechnologyProxy):getTechnologyById(slot1.getBody().id) then
		return
	end

	if not slot6:isFinished() then
		return
	end

	pg.ConnectionMgr.GetInstance():Send(63003, {
		tech_id = slot3,
		refresh_id = slot4
	}, 63004, function (slot0)
		if slot0.result == 0 then
			uv0:reset()
			uv1:updateTechnology(uv0)

			for slot5, slot6 in ipairs(slot0.drop_list) do
				uv2:sendNotification(GAME.ADD_ITEM, Item.New(slot6))
				table.insert({}, Item.New(slot6))
			end

			for slot6, slot7 in ipairs(slot0.common_list) do
				uv2:sendNotification(GAME.ADD_ITEM, Item.New(slot7))
				table.insert({}, Item.New(slot7))
			end

			if uv0:hasCondition() and uv0:getTaskId() then
				getProxy(TaskProxy):removeTaskById(slot3)
			end

			uv1:updateTechnologys(slot0)
			uv2:sendNotification(GAME.FINISH_TECHNOLOGY_DONE, {
				technologyId = uv0.id,
				items = slot1,
				commons = slot2
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("technology_finish_erro") .. slot0.result)
		end
	end)
end

return class("FinishTechnologyCommand", pm.SimpleCommand)
