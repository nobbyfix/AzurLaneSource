slot0 = class("Activity", import(".BaseVO"))

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.stopTime = slot1.stop_time
	slot0.data1 = defaultValue(slot1.data1, 0)
	slot0.data2 = defaultValue(slot1.data2, 0)
	slot0.data3 = defaultValue(slot1.data3, 0)
	slot0.data4 = defaultValue(slot1.data4, 0)
	slot0.data1_list = {}

	for slot5, slot6 in ipairs(slot1.data1_list) do
		table.insert(slot0.data1_list, slot6)
	end

	slot0.data2_list = {}

	for slot5, slot6 in ipairs(slot1.data2_list) do
		table.insert(slot0.data2_list, slot6)
	end

	slot0.data3_list = {}

	for slot5, slot6 in ipairs(slot1.data3_list) do
		table.insert(slot0.data3_list, slot6)
	end

	slot0.data1KeyValueList = {}
	slot2 = ipairs
	slot3 = slot1.date1_key_value_list or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.data1KeyValueList[slot6.key] = {}
		slot7 = ipairs
		slot8 = slot6.value_list or {}

		for slot10, slot11 in slot7(slot8) do
			slot0.data1KeyValueList[slot6.key][slot11.key] = slot11.value
		end
	end

	slot0.clientList = {}
end

slot0.setClientList = function (slot0, slot1)
	slot0.clientList = slot1
end

slot0.getClientList = function (slot0)
	return slot0.clientList
end

slot0.updateDataList = function (slot0, slot1)
	table.insert(slot0.data1_list, slot1)
end

slot0.updateKVPList = function (slot0, slot1, slot2, slot3)
	if not slot0.data1KeyValueList[slot1] then
		slot0.data1KeyValueList[slot1] = {}
	end

	slot0.data1KeyValueList[slot1][slot2] = slot3
end

slot0.getKVPList = function (slot0, slot1, slot2)
	if not slot0.data1KeyValueList[slot1] then
		slot0.data1KeyValueList[slot1] = {}
	end

	return slot0.data1KeyValueList[slot1][slot2] or 0
end

slot0.getData1 = function (slot0)
	return slot0.data1
end

slot0.getData3 = function (slot0)
	return slot0.data3
end

slot0.getData1List = function (slot0)
	return slot0.data1_list
end

slot0.bindConfigTable = function (slot0)
	return pg.activity_template
end

slot0.getDataConfigTable = function (slot0)
	slot2 = slot0:getConfig("config_id")

	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		return pg.activity_event_nianshou[tonumber(slot2)]
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
		return pg.activity_event_monopoly[tonumber(slot2)]
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_PT_ACCUM then
		return pg.activity_event_pt[tonumber(slot2)]
	end
end

slot0.getDataConfig = function (slot0, slot1)
	return slot0:getDataConfigTable() and slot2[slot1]
end

slot0.isEnd = function (slot0)
	return slot0.stopTime > 0 and slot0.stopTime <= pg.TimeMgr.GetInstance():GetServerTime()
end

slot0.increaseUsedCount = function (slot0, slot1)
	if slot1 == 1 then
		slot0.data1 = slot0.data1 + 1
	elseif slot1 == 2 then
		slot0.data2 = slot0.data2 + 1
	end
end

slot0.readyToAchieve = function (slot0)
	slot1 = false

	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LEVELAWARD then
		slot3 = getProxy(PlayerProxy):getRawData()

		for slot8 = 1, #pg.activity_level_award[slot0:getConfig("config_id")].front_drops, 1 do
			if slot4.front_drops[slot8][1] <= slot3.level and not _.include(slot0.data1_list, slot10) then
				slot1 = true

				break
			end
		end
	else
		if slot2 == ActivityConst.ACTIVITY_TYPE_TASKS or slot2 == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
			slot3 = getProxy(TaskProxy)

			return _.any(_.flatten(slot0:getConfig("config_data")), function (slot0)
				return slot0:getTaskById(slot0) and slot1:isFinish() and not slot1:isReceive()
			end)
		end

		if slot2 == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
			return not (slot0:getDataConfig("hp") <= slot0.data3) and slot0:getCountForHitMonster() > 0
		elseif slot2 == ActivityConst.ACTIVITY_TYPE_DODGEM then
			slot3 = pg.TimeMgr.GetInstance()
			slot4 = slot3:DiffDay(slot0.data1, slot3:GetServerTime()) + 1

			if slot0:getConfig("config_id") == 1 then
				return (slot0.data4 == 0 and slot0.data2 >= 7) or defaultValue(slot0.data2_list[1], 0) > 0 or defaultValue(slot0.data2_list[2], 0) > 0 or slot0.data2 < math.min(slot4, 7) or slot0.data3 < slot4
			elseif slot5 == 2 then
				return (slot0.data4 == 0 and slot0.data2 >= 7) or defaultValue(slot0.data2_list[1], 0) > 0 or defaultValue(slot0.data2_list[2], 0) > 0 or slot0.data2 < math.min(slot4, 7)
			end
		elseif slot2 == ActivityConst.ACTIVITY_TYPE_MONOPOLY then
			return (math.ceil((pg.TimeMgr.GetInstance():GetServerTime() - slot0.data1) / 86400) * slot0:getDataConfig("daily_time") + slot0.data1_list[1]) - slot0.data1_list[2] > 0 or slot0.data2_list[1] - slot0.data2_list[2] > 0
		elseif slot2 == ActivityConst.ACTIVITY_TYPE_PT_ACCUM then
			slot1 = ActivityPtData.New(slot0):CanGetAward()
		elseif slot2 == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
			if slot0.data1 == 1 then
				slot5 = pg.activity_template_headhunting[slot0.id].target
				slot6 = 0

				for slot10, slot11 in ipairs(slot0:getClientList()) do
					slot6 = slot6 + slot11:getPt()
				end

				slot7 = 0

				for slot11 = #slot5, 1, -1 do
					if table.contains(slot0.data1_list, slot5[slot11]) then
						slot7 = slot11

						break
					end
				end

				return slot5[math.min(slot7 + 1, #slot4.drop_client)] <= slot6 and slot7 ~= #slot8
			elseif slot3 == 2 then
				slot4 = getProxy(TaskProxy)

				return _.any(_.flatten(pg.activity_template_returnner[slot0.id].task_list), function (slot0)
					return slot0:getTaskById(slot0) and slot1:isFinish()
				end)
			end
		end
	end
end

slot0.isShow = function (slot0)
	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_RETURN_AWARD then
		return slot0:getConfig("is_show") > 0 and slot0.data1 ~= 0 and getProxy(PlayerProxy):getRawData().level >= 15
	else
		return slot0:getConfig("is_show") > 0
	end
end

slot0.getShowPriority = function (slot0)
	return slot0:getConfig("is_show")
end

slot0.left4Day = function (slot0)
	if slot0.stopTime - pg.TimeMgr.GetInstance():GetServerTime() < 345600 then
		return true
	end

	return false
end

slot0.getAwardInfos = function (slot0)
	return slot0.data1KeyValueList or {}
end

slot0.updateData = function (slot0, slot1, slot2)
	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		if not slot0:getAwardInfos()[slot1] then
			slot0.data1KeyValueList[slot1] = {}
		end

		for slot8, slot9 in ipairs(slot2) do
			if slot0.data1KeyValueList[slot1][slot9] then
				slot0.data1KeyValueList[slot1][slot9] = slot0.data1KeyValueList[slot1][slot9] + 1
			else
				slot0.data1KeyValueList[slot1][slot9] = 1
			end
		end
	end
end

slot0.getTaskShip = function (slot0)
	return slot0:getConfig("config_client")[1]
end

slot0.getNotificationMsg = function (slot0)
	slot2 = ActivityProxy.ACTIVITY_SHOW_AWARDS

	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_SHOP then
		slot2 = ActivityProxy.ACTIVITY_SHOP_SHOW_AWARDS
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_LOTTERY then
		slot2 = ActivityProxy.ACTIVITY_LOTTERY_SHOW_AWARDS
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		slot2 = ActivityProxy.ACTIVITY_HITMONSTER_SHOW_AWARDS
	elseif slot1 == ActivityConst.ACTIVITY_TYPE_REFLUX then
		slot2 = ActivityProxy.ACTIVITY_SHOW_REFLUX_AWARDS
	end

	return slot2
end

slot0.getCountForHitMonster = function (slot0)
	if slot0:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		return ((pg.TimeMgr:GetInstance():parseTimeFrom(pg.TimeMgr:GetInstance():GetServerTime() - pg.TimeMgr:GetInstance():parseTimeFromConfig(slot0:getConfig("time")[2])) + 1) * slot0:getDataConfig("daily_count") + slot0:getDataConfig("first_extra_count")) - slot0.data2
	end
end

slot0.getDayIndex = function (slot0)
	slot2 = pg.TimeMgr.GetInstance()

	return slot2:DiffDay(pg.TimeMgr:GetInstance():parseTimeFromConfig(slot0:getConfig("time")[2]), slot2:GetServerTime()) + 1
end

slot0.getStartTime = function (slot0)
	return pg.TimeMgr:GetInstance():parseTimeFromConfig(slot0:getConfig("time")[2])
end

return slot0
