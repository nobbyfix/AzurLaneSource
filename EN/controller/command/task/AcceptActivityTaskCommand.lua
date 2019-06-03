class("AcceptActivityTaskCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	print("accpet activity task...................")

	slot2 = getProxy(TaskProxy)

	_.each(getProxy(ActivityProxy).getActivitiesByTypes(slot3, {
		ActivityConst.ACTIVITY_TYPE_TASK_LIST,
		ActivityConst.ACTIVITY_TYPE_TASK_RES
	}), function (slot0)
		if not slot0:isEnd() and (slot0:getConfig("config_id") == 1 or slot0.getConfig("config_id") == 3) then
			updateActivityTaskStatus(slot0)
		end
	end)
end

return class("AcceptActivityTaskCommand", pm.SimpleCommand)
