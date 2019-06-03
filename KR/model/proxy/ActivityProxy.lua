slot0 = class("ActivityProxy", import(".NetProxy"))
slot0.ACTIVITY_ADDED = "ActivityProxy ACTIVITY_ADDED"
slot0.ACTIVITY_UPDATED = "ActivityProxy ACTIVITY_UPDATED"
slot0.ACTIVITY_DELETED = "ActivityProxy ACTIVITY_DELETED"
slot0.ACTIVITY_OPERATION_DONE = "ActivityProxy ACTIVITY_OPERATION_DONE"
slot0.ACTIVITY_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOW_AWARDS"
slot0.ACTIVITY_SHOP_SHOW_AWARDS = "ActivityProxy ACTIVITY_SHOP_SHOW_AWARDS"
slot0.ACTIVITY_SHOW_BB_RESULT = "ActivityProxy ACTIVITY_SHOW_BB_RESULT"
slot0.ACTIVITY_LOTTERY_SHOW_AWARDS = "ActivityProxy ACTIVITY_LOTTERY_SHOW_AWARDS"
slot0.ACTIVITY_HITMONSTER_SHOW_AWARDS = "ActivityProxy ACTIVITY_HITMONSTER_SHOW_AWARDS"
slot0.ACTIVITY_SHOW_REFLUX_AWARDS = "ActivityProxy ACTIVITY_SHOW_REFLUX_AWARDS"
slot0.ACTIVITY_OPERATION_ERRO = "ActivityProxy ACTIVITY_OPERATION_ERRO"
slot0.ACTIVITY_SHOW_LOTTERY_AWARD_RESULT = "ActivityProxy ACTIVITY_SHOW_LOTTERY_AWARD_RESULT"
slot0.ACTIVITY_PT_ID = 110

function slot0.register(slot0)
	slot0:on(11200, function (slot0)
		uv0.data = {}

		for slot4, slot5 in ipairs(slot0.activity_list) do
			if not pg.activity_template[slot5.id] then
				Debugger.LogError("活动acvitity_template不存在: " .. slot5.id)
			else
				if Activity.New(slot5).getConfig(slot6, "type") == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
					uv0:updateActivityFleet(slot5)
				end

				uv0.data[slot5.id] = slot6
			end
		end

		if uv0.data[ActivityConst.MILITARY_EXERCISE_ACTIVITY_ID] then
			getProxy(MilitaryExerciseProxy):addSeasonOverTimer()
		end

		if ChapterConst.ActivateMirror then
			getProxy(ChapterProxy):checkMirrorCount()
		end

		if uv0:getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE) and not slot1:isEnd() then
			uv0:sendNotification(GAME.FETCH_CHALLENGE)
		end

		if uv0:getActivityByType(ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR) and not slot2:isEnd() and slot2.data1 == 0 then
			uv0:monitorTaskList(slot2)
		end
	end)
	slot0:on(11201, function (slot0)
		if not uv0.data[Activity.New(slot0.activity_info).id] then
			uv0:addActivity(slot1)
		else
			uv0:updateActivity(slot1)
		end

		if pg.activity_template[slot1.id].type == ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2 then
			uv0:updateActivityFleet(slot0.activity_info)
		end
	end)
end

function slot0.getActivityListByType(slot0, slot1)
	for slot6, slot7 in pairs(slot0.data) do
		if slot7:getConfig("type") == slot1 and not slot7:isEnd() then
			table.insert({}, slot7)
		end
	end

	return slot2
end

function slot0.getActivityByType(slot0, slot1)
	slot2 = nil

	for slot6, slot7 in pairs(slot0.data) do
		if slot7:getConfig("type") == slot1 then
			slot2 = slot7

			break
		end
	end

	return slot2
end

function slot0.getActivitiesByType(slot0, slot1)
	for slot6, slot7 in pairs(slot0.data) do
		if slot7:getConfig("type") == slot1 then
			table.insert({}, slot7)
		end
	end

	return slot2
end

function slot0.getActivitiesByTypes(slot0, slot1)
	for slot6, slot7 in pairs(slot0.data) do
		if table.contains(slot1, slot7:getConfig("type")) then
			table.insert({}, slot7)
		end
	end

	return slot2
end

function slot0.getMilitaryExerciseActivity(slot0)
	slot1 = nil

	for slot5, slot6 in pairs(slot0.data) do
		if slot6:getConfig("type") == ActivityConst.ACTIVITY_TYPE_MILITARY_EXERCISE then
			slot1 = slot6

			break
		end
	end

	return Clone(slot1)
end

function slot0.getPanelActivities(slot0)
	slot1 = {
		ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN,
		ActivityConst.ACTIVITY_TYPE_LEVELAWARD,
		ActivityConst.ACTIVITY_TYPE_LEVELPLAN,
		ActivityConst.ACTIVITY_TYPE_MONTHSIGN,
		ActivityConst.ACTIVITY_TYPE_CHARGEAWARD,
		ActivityConst.ACTIVITY_TYPE_ZPROJECT,
		ActivityConst.ACTIVITY_TYPE_SHOP,
		ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN,
		ActivityConst.ACTIVITY_TYPE_DAILY_TASK,
		ActivityConst.ACTIVITY_TYPE_TASK_LIST,
		ActivityConst.ACTIVITY_TYPE_PUZZLA,
		ActivityConst.ACTIVITY_TYPE_BB,
		ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN,
		ActivityConst.ACTIVITY_TYPE_COLORING,
		ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE,
		ActivityConst.ACTIVITY_TYPE_CARD_PAIRS,
		ActivityConst.ACTIVITY_TYPE_ANSWER,
		ActivityConst.ACTIVITY_TYPE_TASKS,
		ActivityConst.ACTIVITY_TYPE_TASK_RES,
		ActivityConst.ACTIVITY_TYPE_COLORING_ALPHA,
		ActivityConst.ACTIVITY_TYPE_LINK_LINK,
		ActivityConst.ACTIVITY_TYPE_LOTTERY_AWARD,
		ActivityConst.ACTIVITY_TYPE_MONOPOLY,
		ActivityConst.ACTIVITY_TYPE_BUILD,
		ActivityConst.ACTIVITY_TYPE_DODGEM,
		ActivityConst.ACTIVITY_TYPE_PT_ACCUM,
		ActivityConst.ACTIVITY_TYPE_RETURN_AWARD
	}

	return _(_.values(slot0.data)):chain():filter(function (slot0)
		if _.contains(uv0, slot0:getConfig("type")) then
			slot2 = slot0:isShow()
		end

		if slot2 then
			if slot1 == ActivityConst.ACTIVITY_TYPE_CHARGEAWARD then
				slot2 = slot0.data2 == 0
			else
				slot2 = not slot0.achieved

				if not slot0.achieved then
					slot2 = false and true

					if false and true then
						if slot1 == ActivityConst.ACTIVITY_TYPE_DAILY_TASK then
							slot2 = getProxy(TaskProxy):getTaskById(slot0:getConfig("config_data")[1]) and not slot4:isReceive()
						else
							slot2 = not slot0:isEnd()
						end
					end
				end
			end
		end

		return slot2
	end):sort(function (slot0, slot1)
		if slot0.id >= slot1.id then
			slot2 = false
		else
			slot2 = true
		end

		return slot2
	end):value()
end

function slot0.getBannerDisplays(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	return _(pg.activity_banner.all):chain():map(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		return pg.activity_banner[slot0]
		--- END OF BLOCK #0 ---



	end):filter(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		return pg.TimeMgr.GetInstance():inTime(slot0.time)
		--- END OF BLOCK #0 ---



	end):value()
	--- END OF BLOCK #0 ---



end

function slot0.getNoticeBannerDisplays(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	return _.map(pg.activity_banner_notice.all, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		return pg.activity_banner_notice[slot0]
		--- END OF BLOCK #0 ---



	end)
	--- END OF BLOCK #0 ---



end

function slot0.findNextAutoActivity(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-127, warpins: 1 ---
	slot1 = nil
	slot3 = pg.TimeMgr.GetInstance().GetServerTime(slot2)

	for slot7, slot8 in ipairs(slot0:getPanelActivities()) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-126, warpins: 1 ---
		if slot8:isShow() and not slot8.autoActionForbidden then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-30, warpins: 1 ---
			if slot8:getConfig("type") == ActivityConst.ACTIVITY_TYPE_7DAYSLOGIN then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-46, warpins: 1 ---
				slot12 = #pg.activity_7_day_sign[slot8:getConfig("config_id")].front_drops + 1

				if slot8.getConfig("config_id") == 3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 43-43, warpins: 1 ---
					slot12 = #slot11
					--- END OF BLOCK #0 ---



				end

				if slot8.data1 < slot12 and not slot2:IsSameDay(slot3, slot8.data2) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 54-56, warpins: 1 ---
					slot1 = slot8

					break
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 57-60, warpins: 1 ---
				if slot9 == ActivityConst.ACTIVITY_TYPE_PROGRESSLOGIN then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 61-67, warpins: 1 ---
					if slot8.data1 < 7 and not slot2:IsSameDay(slot3, slot8.data2) or slot8.data1 == 7 and not slot8.achieved and getProxy(ChapterProxy):isClear(204) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 87-89, warpins: 2 ---
						slot1 = slot8

						break
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 90-93, warpins: 1 ---
					if slot9 == ActivityConst.ACTIVITY_TYPE_MONTHSIGN then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 94-102, warpins: 1 ---
						if os.server_date("*t", slot3).year ~= slot8.data1 or slot10.month ~= slot8.data2 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 107-115, warpins: 2 ---
							slot8.data1 = slot10.year
							slot8.data2 = slot10.month
							slot8.data1_list = {}
							slot1 = slot8

							break
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 116-122, warpins: 1 ---
							if not table.contains(slot8.data1_list, slot10.day) then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 123-125, warpins: 1 ---
								slot1 = slot8

								break
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return slot1
	--- END OF BLOCK #0 ---



end

function slot0.findRefluxAutoActivity(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-40, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot1:isEnd() and not slot1.autoActionForbidden then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-27, warpins: 1 ---
		slot2 = pg.TimeMgr.GetInstance()

		if slot1.data1_list[2] < #pg.return_sign_template.all and not slot2:IsSameDay(slot2:GetServerTime(), slot1.data1_list[1]) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-39, warpins: 1 ---
			return 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.existRefluxAwards(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-76, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot1:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-74, warpins: 1 ---
		for slot6 = #pg.return_pt_template.all, 1, -1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-32, warpins: 2 ---
			if slot2[slot2.all[slot6]].pt_require <= slot1.data3 and slot1.data4 < slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-31, warpins: 1 ---
				return true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		slot3 = getProxy(TaskProxy)

		if _.any(_(slot1:getConfig("config_data")[7]):chain():map(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			return slot0[2]
			--- END OF BLOCK #0 ---



		end):flatten():map(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			if not uv0:getTaskById(slot0) and not uv0:getFinishTaskById(slot0) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-15, warpins: 1 ---
				slot1 = false
				--- END OF BLOCK #0 ---



			end

			return slot1
			--- END OF BLOCK #0 ---



		end):filter(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			return not not slot0
			--- END OF BLOCK #0 ---



		end):value(), function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			if slot0:getTaskStatus() ~= 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-7, warpins: 1 ---
				slot1 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-8, warpins: 1 ---
				slot1 = true
				--- END OF BLOCK #0 ---



			end

			return slot1
			--- END OF BLOCK #0 ---



		end) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 71-73, warpins: 1 ---
			return true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.getActivityById(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return Clone(slot0.data[slot1])
	--- END OF BLOCK #0 ---



end

function slot0.updateActivity(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0.data[slot1.id] = slot1

	slot0.facade:sendNotification(uv0.ACTIVITY_UPDATED, slot1:clone())

	return
	--- END OF BLOCK #0 ---



end

function slot0.addActivity(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0.data[slot1.id] = slot1

	slot0.facade:sendNotification(uv0.ACTIVITY_ADDED, slot1:clone())

	return
	--- END OF BLOCK #0 ---



end

function slot0.deleteActivityById(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot0.data[slot1] = nil

	slot0.facade:sendNotification(uv0.ACTIVITY_DELETED, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.readyToAchieveByType(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot2 = false

	for slot7, slot8 in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-18, warpins: 1 ---
		if slot8:readyToAchieve() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			slot2 = true

			break
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return slot2
	--- END OF BLOCK #0 ---



end

function slot0.getBuildBgActivityByID(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	for slot6, slot7 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-27, warpins: 1 ---
		if not slot7:isEnd() and slot7:getConfig("config_client") and slot8.id == slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-25, warpins: 1 ---
			return slot8.bg
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return nil
	--- END OF BLOCK #0 ---



end

function slot0.getBuffList(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	_.each(slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		if slot0 and not slot0:isEnd() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-20, warpins: 1 ---
			table.insert(uv0, ActivityBuff.New(slot0.id, slot0:getConfig("config_id")))
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	return _.filter({}, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		return slot0:isActivate()
		--- END OF BLOCK #0 ---



	end)
	--- END OF BLOCK #0 ---



end

function slot0.getVirtualItemNumber(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) and not slot2:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-24, warpins: 1 ---
		if not slot2.data1KeyValueList[1][slot1] or not slot2.data1KeyValueList[1][slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-23, warpins: 2 ---
			slot3 = 0
			--- END OF BLOCK #0 ---



		end

		return slot3
		--- END OF BLOCK #0 ---



	end

	return 0
	--- END OF BLOCK #0 ---



end

function slot0.removeVitemById(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) and not slot3:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-19, warpins: 1 ---
		slot3.data1KeyValueList[1][slot1] = slot3.data1KeyValueList[1][slot1] - slot2
		--- END OF BLOCK #0 ---



	end

	slot0:updateActivity(slot3)

	return
	--- END OF BLOCK #0 ---



end

function slot0.addVitemById(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-33, warpins: 1 ---
	if slot0:getActivityByType(ActivityConst.ACTIVITY_TYPE_VIRTUAL_BAG) and not slot3:isEnd() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-28, warpins: 1 ---
		if not slot3.data1KeyValueList[1][slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-21, warpins: 1 ---
			slot3.data1KeyValueList[1][slot1] = 0
			--- END OF BLOCK #0 ---



		end

		slot3.data1KeyValueList[1][slot1] = slot3.data1KeyValueList[1][slot1] + slot2
		--- END OF BLOCK #0 ---



	end

	slot0:updateActivity(slot3)

	return
	--- END OF BLOCK #0 ---



end

function slot0.monitorTaskList(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-43, warpins: 1 ---
	if slot1 and not slot1:isEnd() and slot1:getConfig("type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST_MONITOR then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-32, warpins: 1 ---
		if not slot1:getConfig("config_data")[1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-23, warpins: 1 ---
			slot2 = {}
			--- END OF BLOCK #0 ---



		end

		if getProxy(TaskProxy):isReceiveTasks(slot2) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-42, warpins: 1 ---
			pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
				cmd = 1,
				activity_id = slot1.id
			})
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateActivityFleet(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	getProxy(FleetProxy):addActivityFleet(slot1.id, slot1.group_list)

	return
	--- END OF BLOCK #0 ---



end

function slot0.recommendActivityFleet(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-68, warpins: 1 ---
	slot5 = getProxy(BayProxy)

	if Fleet.SUBMARINE_FLEET_ID <= slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-21, warpins: 1 ---
		if not getProxy(FleetProxy):getActivityFleets()[slot1][slot2]:isFull() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-31, warpins: 1 ---
			function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-26, warpins: 1 ---
				for slot7, slot8 in ipairs(slot3) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-25, warpins: 1 ---
					uv1:insertShip(slot8, nil, slot0)
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end(TeamType.Submarine, TeamType.SubmarineMax - #getProxy(FleetProxy).getActivityFleets()[slot1][slot2].subShips)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-52, warpins: 1 ---
		slot9 = TeamType.MainMax - #slot6.mainShips

		if TeamType.VanguardMax - #slot6.vanguardShips > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-49, warpins: 1 ---
			slot7(TeamType.Vanguard, slot8)
			--- END OF BLOCK #0 ---



		end

		if slot9 > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 53-57, warpins: 1 ---
			slot7(TeamType.Main, slot9)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	getProxy(FleetProxy):updateActivityFleet(slot1, slot2, slot6)

	return
	--- END OF BLOCK #0 ---



end

return slot0
