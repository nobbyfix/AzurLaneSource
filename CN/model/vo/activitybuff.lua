slot0 = class("ActivityBuff", import(".BaseVO"))

slot0.bindConfigTable = function (slot0)
	return pg.benefit_buff_template
end

slot0.Ctor = function (slot0, slot1, slot2)
	slot0.activityId = slot1
	slot0.id = slot2
	slot0.configId = slot0.id
end

slot0.isActivate = function (slot0)
	slot1 = false

	if getProxy(ActivityProxy):getActivityById(slot0.activityId) and not slot3:isEnd() and slot0:getConfig("benefit_condition")[1] == "lv" then
		slot1 = 
		-- Decompilation error in this vicinity:
		loadstring("return " .. getProxy(PlayerProxy).getRawData(slot5).level .. slot4[2] .. slot4[3])()
	end

	return slot1
end

return slot0
