slot0 = class("PlayerProxy", import(".NetProxy"))
slot0.UPDATED = "player updated"

slot0.register = function (slot0)
	slot0._flags = {}
	slot0._fishCfg = {}
	slot0.combatFleetId = 1
	slot0.mainBGShiftFlag = false
	slot0.inited = false
	slot0.botHelp = false
	slot0.playerAssists = {}
	slot0.playerGuildAssists = {}
	slot0.summaryInfo = nil

	slot0:on(11000, function (slot0)
		slot0:sendNotification(GAME.TIME_SYNCHRONIZATION, slot0)
	end)
	slot0:on(11003, function (slot0)
		Player.New(slot0).resUpdateTm = pg.TimeMgr.GetInstance():GetServerTime()

		slot0:updatePlayer(slot1)
		print("days from regist time to new :" .. slot0.data:GetDaysFromRegister())

		if isAiriJP() then
			if slot0.data:GetDaysFromRegister() == 1 then
				SendAiriJPTracking(AIRIJP_TRACKING_2D_RETENTION, slot1.id)
			elseif slot0.data:GetDaysFromRegister() == 6 then
				SendAiriJPTracking(AIRIJP_TRACKING_7D_RETENTION, slot1.id)
			end
		end

		slot0:flushTimesListener()
	end)
	slot0:on(11004, function (slot0)
		if not slot0.data then
			return
		end

		slot1 = slot0.data:clone()

		slot1:updateResources(slot0.resource_list)

		slot1.resUpdateTm = pg.TimeMgr.GetInstance():GetServerTime()

		slot0:updatePlayer(slot1)

		if slot0.data:isFull() then
		end
	end)
	slot0:on(10999, function (slot0)
		slot0:sendNotification(GAME.LOGOUT, {
			code = slot0.reason
		})
	end)
	slot0:on(11015, function (slot0)
		slot0.data:clone().buff_list = {}

		for slot5, slot6 in ipairs(slot0.buff_list) do
			table.insert(slot1.buff_list, {
				id = slot6.id,
				timestamp = slot6.timestamp
			})
		end

		slot0:updatePlayer(slot1)
	end)
	slot0:on(11503, function (slot0)
		getProxy(ShopsProxy).removeChargeTimer(slot1, slot0.pay_id)
		slot0:sendNotification(GAME.CHARGE_SUCCESS, {
			shopId = slot0.shop_id,
			payId = slot0.pay_id,
			gem = slot0.gem,
			gem_free = slot0.gem_free
		})
	end)
end

slot0.getSummaryInfo = function (slot0)
	return slot0.summaryInfo
end

slot0.setSummaryInfo = function (slot0, slot1)
	slot0.summaryInfo = slot1
end

slot0.flushTimesListener = function (slot0)
	if slot0.clockId then
		slot0:remove()
	end

	slot1 = pg.TimeMgr.GetInstance()
	slot0.clockId = slot1:AddTimer("daily", slot1:GetNextTime(0, 0, 0) - slot1:GetServerTime(), 86400, function ()
		slot0:sendNotification(GAME.ZERO_HOUR)
	end)
end

slot0.remove = function (slot0)
	if slot0.clockId then
		pg.TimeMgr.GetInstance():RemoveTimer(slot0.clockId)

		slot0.clockId = nil
	end
end

slot0.updatePlayer = function (slot0, slot1)
	slot0:updatePt(slot0.data, slot1)

	slot0.data = slot1:clone()

	slot0.data:display("updated")
	slot0:sendNotification(slot0.UPDATED, slot1:clone())
end

slot0.updatePt = function (slot0, slot1, slot2)
	slot0.activityProxy = slot0.activityProxy or getProxy(ActivityProxy)
	slot3 = {}

	for slot7, slot8 in ipairs(slot0.activityProxy:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_RANK)) do
		slot3[slot9] = slot3[slot8:getConfig("config_id")] or slot2:getResource(slot9) - slot1:getResource(slot9)

		if not slot8:isEnd() and slot3[slot9] > 0 then
			slot8.data1 = slot8.data1 + slot3[slot9]

			slot0.activityProxy:updateActivity(slot8)
		end
	end

	for slot7, slot8 in ipairs(slot0.activityProxy:getActivitiesByType(ActivityConst.ACTIVITY_TYPE_PT_ACCUM)) do
		slot10 = nil
		slot3[slot9] = slot3[slot8:getDataConfig("pt")] or slot2:getResource(slot9) - slot1:getResource(slot9)
		slot10 = (slot8:getDataConfig("type") ~= 1 or math.max(slot3[slot9], 0)) and (slot8:getDataConfig("type") ~= 2 or math.min(slot3[slot9], 0)) and 0

		if not slot8:isEnd() and slot10 ~= 0 then
			slot8.data1 = slot8.data1 + math.abs(slot10)

			slot0.activityProxy:updateActivity(slot8)
		end
	end
end

slot0.updatePlayerMedalDisplay = function (slot0, slot1)
	slot0.data.displayTrophyList = slot1
end

slot0.SetFishRes = function (slot0, slot1)
	slot0._fishCfg = slot1
end

slot0.GetFishRes = function (slot0)
	return slot0._fishCfg
end

slot0.getPlayerId = function (slot0)
	return slot0.data.id
end

slot0.setFlag = function (slot0, slot1, slot2)
	slot0._flags[slot1] = slot2
end

slot0.getFlag = function (slot0, slot1)
	return slot0._flags[slot1]
end

slot0.isSelf = function (slot0, slot1)
	return slot0.data.id == slot1
end

slot0.setInited = function (slot0, slot1)
	slot0.inited = slot1
end

slot0.getInited = function (slot0)
	return slot0.inited
end

return slot0
