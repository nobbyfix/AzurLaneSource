slot0 = class("ActivityBossPtData", import(".ActivityPtData"))

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.linkID = slot1:getDataConfig("link_id")
	slot0.progress_target = pg.activity_event_worldboss[getProxy(ActivityProxy):getActivityById(slot2).getConfig(slot3, "config_id")].reward_pt
end

slot0.GetBossProgress = function (slot0)
	slot1 = slot0:getTargetLevel()
	slot3 = 0

	if getProxy(ActivityProxy):getActivityById(slot0.linkID) and not slot2:isEnd() then
		return slot2.data1 or 0, slot0.progress_target[slot1]
	end
end

slot0.CanGetAward = function (slot0)
	slot2, slot3 = slot0:GetBossProgress()

	return slot0:CanGetNextAward() and 
	-- Decompilation error in this vicinity:
	function ()
		slot0, slot1, slot2 = slot0:GetResProgress()

		return slot2 >= 1
	end() and slot2 <= slot3
end

return slot0
