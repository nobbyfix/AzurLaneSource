slot0 = class("UserChallengeInfo", import(".BaseVO"))

slot0.Ctor = function (slot0, slot1)
	slot0:UpdateChallengeInfo(slot1)
end

slot0.UpdateChallengeInfo = function (slot0, slot1)
	slot0._score = slot1.current_score
	slot0._level = slot1.level
	slot0._mode = slot1.mode
	slot0._resetflag = slot1.issl
	slot0._seasonIndex = slot1.season_id
	slot0._dungeonIDList = {}

	for slot5, slot6 in ipairs(slot1.dungeon_id_list) do
		table.insert(slot0._dungeonIDList, slot6)
	end

	if slot0._mode == ChallengeProxy.MODE_INFINITE then
		slot0:setInfiniteDungeonIDListByLevel()
	end

	slot0._fleetList = {}

	for slot5, slot6 in ipairs(slot1.groupinc_list) do
		slot0:updateChallengeFleet(slot6)
	end

	slot0._buffList = {}

	for slot5, slot6 in ipairs(slot1.buff_list) do
		table.insert(slot0._buffList, slot6)
	end
end

slot0.updateChallengeFleet = function (slot0, slot1)
	if Challenge2Fleet.New(slot1):isSubmarineFleet() then
		slot0._submarineFleet = slot2
	else
		slot0._fleet = slot2
	end
end

slot0.getRegularFleet = function (slot0)
	return slot0._fleet
end

slot0.getSubmarineFleet = function (slot0)
	return slot0._submarineFleet
end

slot0.getLevel = function (slot0)
	return slot0._level
end

slot0.getDungeonIDList = function (slot0)
	return Clone(slot0._dungeonIDList)
end

slot0.getSeasonID = function (slot0)
	return slot0._seasonIndex
end

slot0.getResetFlag = function (slot0)
	return slot0._resetflag
end

slot0.getScore = function (slot0)
	return slot0._score
end

slot0.getNextStageID = function (slot0)
	return pg.expedition_challenge_template[slot0._dungeonIDList[slot0._level]].dungeon_id
end

slot0.setInfiniteDungeonIDListByLevel = function (slot0)
	slot0._dungeonIDList = pg.activity_event_challenge.infinite_stage[slot0._seasonIndex][(math.modf((slot0._level - 1) / ChallengeConst.BOSS_NUM) + 1) % #pg.activity_event_challenge.infinite_stage[slot0._seasonIndex]]
end

return slot0
