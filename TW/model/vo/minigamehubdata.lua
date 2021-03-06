slot0 = class("MiniGameHubData", import(".BaseVO"))

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.id = slot1.id
	slot0.configId = slot1.id
	slot0.count = slot1.available_cnt or slot0:getConfig("reborn_times")
	slot0.usedtime = slot1.used_cnt or 0
	slot0.ultimate = slot1.ultimate or 0
end

slot0.bindConfigTable = function (slot0)
	return pg.mini_game_hub
end

slot0.UpdateData = function (slot0, slot1)
	slot0.count = slot1.available_cnt or slot0.count
	slot0.usedtime = slot1.used_cnt or slot0.usedtime
	slot0.ultimate = slot1.ultimate or slot0.ultimate
end

slot0.CheckInTime = function (slot0)
	if slot0:getConfig("act_id") ~= nil then
		return pg.TimeMgr.GetInstance():inTime(pg.activity_template[slot1].time)
	else
		return true
	end
end

return slot0
