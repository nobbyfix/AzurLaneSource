class("SubmitInvestigationCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = slot1:getBody().activityId
	slot4 = slot1.getBody().id
	slot5 = {}

	for slot9, slot10 in pairs(slot2.quests) do
		for slot15, slot16 in pairs(slot10) do
			table.insert(({
				id = slot9,
				options = {},
				contain = slot16.content
			})["options"], slot16.id)

			if not ()["contain"] and slot16.content then
			end
		end

		table.insert(slot5, slot11)
	end

	pg.ConnectionMgr.GetInstance():Send(30101, {
		act_id = slot3,
		answers = slot5
	}, 30102, function (slot0)
		if slot0.result == 0 then
			for slot5, slot6 in ipairs(slot0.drop_list) do
				table.insert({}, slot7)
				uv0:sendNotification(GAME.ADD_ITEM, Item.New(slot6))
			end

			slot2 = getProxy(ActivityProxy)
			slot2:getActivityById(uv1).data1 = pg.TimeMgr.GetInstance():GetServerTime()

			slot2:updateActivity(slot3)
			uv0:sendNotification(GAME.SUBMIT_INVESTIGATION_DONE, {
				items = slot1
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("submit_investigation", slot0.result))
		end
	end)
end

return class("SubmitInvestigationCommand", pm.SimpleCommand)
