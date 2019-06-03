slot0 = class("ShamChapter", import(".Chapter"))
slot0.SAVE_TAG = "sham_all_ships_"

function slot0.Ctor(slot0)
	slot0.id = nil
	slot0.configId = nil
	slot0.theme = nil
	slot0.active = false
	slot0.shamResetCount = 0
	slot0.progress = 0
	slot0.repairTimes = 0
	slot0.dueTime = 999999999
	slot0.fleet = ShamFleet.New()
	slot0.fleets = {
		slot0.fleet
	}
	slot0.findex = 1
	slot0.ships = {}
	slot0.cells = {}
	slot0.pathFinder = nil
	slot0.friendAssistShip = nil
	slot0.mirrors = {}
end

function slot0.getDataType(slot0)
	return ChapterConst.TypeSham
end

function slot0.getPlayType(slot0)
	return ChapterConst.TypeLagacy
end

function slot0.bindConfigTable(slot0)
	return pg.sham_battle_template
end

function slot0.update(slot0, slot1)
	slot0.active = true
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.theme = ChapterTheme.New(slot0:getConfig("theme"))
	slot0.progress = slot1.progress or 0
	slot3 = slot0:getConfig("float_items")
	slot0.cells = {}

	function slot5(slot0)
		slot2 = ChapterCell.Line2Name(ChapterCell.New(slot0).row, ChapterCell.New(slot0).column)

		if _.detect(uv0, function (slot0)
			return slot0[1] == uv0.row and slot0[2] == uv0.column
		end) then
			slot1.item = slot3[3]
			slot1.itemOffset = Vector2(slot3[4], slot3[5])
		end

		uv1.cells[slot2] = slot1

		return slot1
	end

	_.each(slot4, function (slot0)
		if not slot0[3] then
			uv0({
				pos = {
					row = slot0[1],
					column = slot0[2]
				},
				item_type = ChapterConst.AttachNone
			}).walkable = false
		end
	end)
	_.each(slot1.progress or 0, function (slot0)
		uv0(slot0)
	end)

	slot0.pathFinder = PathFinding.New({}, ChapterConst.MaxRow, ChapterConst.MaxColumn)

	slot0:updateFriendShip(nil)

	if slot1.assist_ship and pg.ship_data_statistics[slot1.assist_ship.template_id] then
		slot0:updateFriendShip(Ship.New(slot1.assist_ship))
	end

	slot0.ships = {}
	slot0.mirrors = {}

	_.each(slot1.group_list, function (slot0)
		if not uv0.friendAssistShip or uv0.friendAssistShip.id ~= slot0.id then
			uv0.ships[slot0.id] = {
				id = slot0.id,
				hp_rant = slot0.hp_rant,
				strategies = _.map(slot0.strategy_list or {}, function (slot0)
					return {
						id = slot0.id,
						count = slot0.count
					}
				end)
			}
			uv0.mirrors[slot0.id] = Ship.New(slot0.ship_info)
		elseif uv0.friendAssistShip.id == slot0.id then
			uv0.friendAssistShip.hpRant = slot0.hp_rant
			uv0.friendAssistShip.strategies = slot1
		end
	end)
	slot0.fleet:updateShipMirrors(slot0.mirrors)
	slot0.fleet:update(slot1.group)
	slot0:updateFleetShips(slot1.group.formation_list)
end

function slot0.retreat(slot0)
	slot0:updateFriendShip(nil)
	slot0:flushShips()

	for slot4, slot5 in pairs(slot0.ships) do
		slot5.hp_rant = 10000
		slot5.strategies = {}
	end

	slot0.fleet:retreat()

	slot0.cells = {}
	slot0.active = false
end

function slot0.inWartime(slot0)
	return slot0.active
end

function slot0.shipInWartime(slot0, slot1)
	return slot0:inWartime() and slot0:containsShip(slot1)
end

function slot0.fetchShipVO(slot0, slot1)
	if slot0.active then
		return Clone(slot0.mirrors[slot1])
	else
		return getProxy(BayProxy):getShipById(slot1)
	end
end

function slot0.flushShips(slot0)
	_.each(_.keys(slot0.ships), function (slot0)
		if not uv0:fetchShipVO(slot0) then
			uv0.ships[slot0] = nil
		end
	end)
	slot0.fleet:flushShips()
end

function slot0.getFriendShip(slot0)
	return Clone(slot0.friendAssistShip)
end

function slot0.updateFriendShip(slot0, slot1)
	slot0.friendAssistShip = slot1

	slot0.fleet:updateFriendShip(slot1)
end

function slot0.getShips(slot0, slot1)
	if slot0:getFriendShip() and defaultValue(slot1, false) then
		table.insert(_(slot2):chain():map(function (slot0)
			if uv0:fetchShipVO(slot0.id) then
				slot1.hpRant = slot0.hp_rant
				slot1.strategies = Clone(slot0.strategies)
			end

			return slot1
		end):filter(function (slot0)
			return slot0 ~= nil
		end):sort(function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-38, warpins: 2 ---
			if (uv0.fleet.ships[slot0.id] and 1 or 0) ~= (uv0.fleet.ships[slot1.id] and 1 or 0) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-29, warpins: 2 ---
				return slot3 < slot2
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 37-37, warpins: 2 ---
				return slot0.id < slot1.id
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end):value(), slot4)
	end

	return slot3
end

function slot0.getShipsByTeam(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	return _.filter(slot0:getShips(true), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 2 ---
		return slot0:getTeamType() == uv0
		--- END OF BLOCK #0 ---



	end)
	--- END OF BLOCK #0 ---



end

function slot0.getShip(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	slot2 = nil

	if slot0:getFriendShip() and slot3.id == slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-11, warpins: 1 ---
		slot2 = slot3
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 2 ---
		if slot0.ships[slot1] and slot0:fetchShipVO(slot4.id) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-28, warpins: 1 ---
			slot2.hpRant = slot4.hp_rant
			slot2.strategies = Clone(slot4.strategies)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return slot2
	--- END OF BLOCK #0 ---



end

function slot0.containsShip(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 14-14, warpins: 3 ---
	return slot0.friendAssistShip and slot0.friendAssistShip.id == slot1 or slot0.ships[slot1]
	--- END OF BLOCK #0 ---



end

function slot0.getRawShips(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return Clone(slot0.ships)
	--- END OF BLOCK #0 ---



end

function slot0.updateRawShips(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0.ships = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateRawShipsByTeam(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	slot3 = slot0:getFriendShip()

	for slot7, slot8 in pairs(slot0.ships) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-30, warpins: 2 ---
		if (slot3 and slot3.id == slot7 and slot3 or slot0:fetchShipVO(slot7)) and nil:getTeamType() ~= slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-28, warpins: 1 ---
			slot1[slot7] = slot8
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0:updateRawShips(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateShipHp(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	if slot0.friendAssistShip and slot0.friendAssistShip.id == slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		slot0.friendAssistShip.hpRant = slot2
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-14, warpins: 2 ---
		if slot0.ships[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			slot0.ships[slot1].hp_rant = slot2
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0.fleet:updateShipHp(slot1, slot2)

	return
	--- END OF BLOCK #0 ---



end

function slot0.isValid(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 17-18, warpins: 2 ---
	return _.any(slot0:getShips(true), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 2 ---
		return slot0:getTeamType() == TeamType.Main and slot0.hpRant > 0
		--- END OF BLOCK #0 ---



	end) and _.any(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 2 ---
		return slot0:getTeamType() == TeamType.Vanguard and slot0.hpRant > 0
		--- END OF BLOCK #0 ---



	end)
	--- END OF BLOCK #0 ---



end

function slot0.updateFleetShips(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-55, warpins: 1 ---
	for slot6, slot7 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-49, warpins: 1 ---
		if slot0.friendAssistShip and slot0.friendAssistShip.id == slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-27, warpins: 1 ---
			table.insert({}, {
				id = slot7,
				hp_rant = slot0.friendAssistShip.hpRant,
				strategies = Clone(slot0.friendAssistShip.strategies)
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-31, warpins: 2 ---
			if slot0.ships[slot7] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 32-47, warpins: 1 ---
				table.insert(slot2, {
					id = slot7,
					hp_rant = slot0.ships[slot7].hp_rant,
					strategies = Clone(slot0.ships[slot7].strategies)
				})
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0.fleet:updateShips(slot2)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateShipStg(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	slot4 = {}

	if slot0.friendAssistShip and slot0.friendAssistShip.id == slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-11, warpins: 1 ---
		slot4 = slot0.friendAssistShip.strategies
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 2 ---
		if slot0.ships[slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-16, warpins: 1 ---
			slot4 = slot5.strategies
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	_.each(slot4, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0.id == uv0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-6, warpins: 1 ---
			slot0.count = uv1
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.fleet:updateShipStg(slot1, slot2, slot3)

	return
	--- END OF BLOCK #0 ---



end

function slot0.getFleetStgIds(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	if slot1.stgId > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		table.insert({}, slot1.stgId)
		--- END OF BLOCK #0 ---



	end

	return slot2
	--- END OF BLOCK #0 ---



end

function slot0.filterPower3(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	local function slot4(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-28, warpins: 1 ---
		table.sort(slot0, function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-12, warpins: 2 ---
			return slot1:getShipCombatPower() < slot0:getShipCombatPower()
			--- END OF BLOCK #0 ---



		end)
		_.each(slot0, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			if not _.any(uv0, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				return slot0:isSameKind(uv0)
				--- END OF BLOCK #0 ---



			end) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-12, warpins: 1 ---
				table.insert(uv0, slot0)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		_(slot1):chain():slice(1, 3):each(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			table.insert(uv0, slot0.id)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end

	slot4(slot2)
	slot4(slot0:getShipsByTeam(TeamType.Main))

	return {}
	--- END OF BLOCK #0 ---



end

function slot0.isOpen(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-55, warpins: 1 ---
	slot1 = false

	if ChapterConst.ActivateMirror then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-20, warpins: 2 ---
		slot1 = getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MIRROR) and not slot3:isEnd()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-26, warpins: 1 ---
		if pg.sim_battle_template[slot0.simId] and os.server_date("*t", pg.TimeMgr.GetInstance():GetServerTime()).month == slot0.simId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-46, warpins: 1 ---
			slot1 = slot2.sim_time[1] <= slot4.day and slot4.day <= slot2.sim_time[2]
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return slot1
	--- END OF BLOCK #0 ---



end

function slot0.isFirstDay(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-72, warpins: 1 ---
	slot1 = false
	slot2 = pg.TimeMgr.GetInstance()
	slot4 = os.server_date("*t", slot2:GetServerTime())

	if ChapterConst.ActivateMirror then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-29, warpins: 1 ---
		if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MIRROR) and not slot6:isEnd() and slot6:getConfig("time")[2] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 57-57, warpins: 2 ---
			slot1 = slot2:DiffDay(slot2:parseTimeFromConfig(slot7[2], true), slot2:GetServerTime()) == 0
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 58-63, warpins: 1 ---
		if pg.sim_battle_template[slot0.simId] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 64-68, warpins: 1 ---
			slot1 = slot4.day == slot5.sim_time[1]
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return slot1
	--- END OF BLOCK #0 ---



end

function slot0.getRestDays(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-73, warpins: 1 ---
	slot1 = 0
	slot2 = pg.TimeMgr.GetInstance()
	slot4 = os.server_date("*t", slot2:GetServerTime())

	if ChapterConst.ActivateMirror then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-29, warpins: 1 ---
		if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_MIRROR) and not slot6:isEnd() and slot6:getConfig("time")[1] == "timer" and slot7[3] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-55, warpins: 1 ---
			slot1 = slot2:DiffDay(slot2:GetServerTime(), slot2:parseTimeFromConfig(slot7[3]))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-61, warpins: 1 ---
		if pg.sim_battle_template[slot0.simId] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-66, warpins: 1 ---
			slot1 = slot5.sim_time[2] - slot4.day + 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return math.max(slot1, 1)
	--- END OF BLOCK #0 ---



end

function slot0.localSaveChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-31, warpins: 1 ---
	PlayerPrefs.SetString(uv0.SAVE_TAG .. slot1, table.concat(_.map(slot0:getShips(false), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		return slot0.id
		--- END OF BLOCK #0 ---



	end), ":"))
	PlayerPrefs.Save()

	return
	--- END OF BLOCK #0 ---



end

function slot0.localLoadChapter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 20-50, warpins: 2 ---
	slot3 = PlayerPrefs.GetString(uv0.SAVE_TAG .. getProxy(PlayerProxy):getRawData().id) or ""
	slot4 = 0
	slot5 = ChapterConst.ShamShipLimit
	slot6 = {
		[TeamType.Vanguard] = 0,
		[TeamType.Main] = 0
	}
	slot7 = ChapterConst.ShamTeamShipLimit
	slot8 = getProxy(BayProxy)

	_.each(string.split, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-37, warpins: 1 ---
		if uv0:getShipById(tonumber(slot0)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-17, warpins: 1 ---
			slot3 = slot2:getTeamType()

			if uv1 < uv2 and uv3[slot3] < uv4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-36, warpins: 1 ---
				uv1 = uv1 + 1
				uv3[slot3] = uv3[slot3] + 1
				uv5[slot1] = {
					hp_rant = 10000,
					id = slot1,
					strategies = {}
				}
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:updateRawShips({})

	return
	--- END OF BLOCK #0 ---



end

function slot0.writeBack(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-45, warpins: 1 ---
	for slot8, slot9 in pairs(slot0.fleet.ships) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-11, warpins: 1 ---
		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			if uv0.statistics[slot0.id] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-12, warpins: 1 ---
				uv1:updateShipHp(slot0.id, slot1.bp)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end(slot9)
		--- END OF BLOCK #0 ---



	end

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-26, warpins: 1 ---
		slot0:getChapterCell(slot3.line.row, slot3.line.column).flag = 1
		slot0.progress = slot0.progress + 1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-39, warpins: 1 ---
		function slot7(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if uv0.statistics._rivalInfo[slot0.id] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-9, warpins: 1 ---
				slot0.hpRant = slot1.bp
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end

		_.each(slot5.rival.mainShips, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			uv0(slot0)

			return
			--- END OF BLOCK #0 ---



		end)
		_.each(slot5.rival.vanguardShips, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			uv0(slot0)

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	slot0:updateChapterCell(slot5)

	return
	--- END OF BLOCK #0 ---



end

return slot0
