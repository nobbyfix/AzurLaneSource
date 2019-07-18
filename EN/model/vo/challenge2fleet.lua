slot0 = class("Challenge2Fleet", import(".Fleet"))

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id

	slot0:updateShips(slot1.ships)

	slot0.commanderList = {}
	slot2 = ipairs
	slot3 = slot1.commanders or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.commanderList[slot6.pos] = Commander.New(slot6.commanderinfo)
	end

	slot0.skills = {}

	slot0:updateCommanderSkills()
end

slot0.getShipsByTeam = function (slot0, slot1, slot2)
	slot3 = {}

	for slot7, slot8 in ipairs(slot0[slot1]) do
		if slot8.hpRant > 0 then
			slot3[#slot3 + 1] = slot8
		end
	end

	if slot2 then
		for slot7, slot8 in ipairs(slot0[slot1]) do
			if slot8.hpRant <= 0 then
				slot3[#slot3 + 1] = slot8
			end
		end
	end

	return slot3
end

slot0.getFleetType = function (slot0)
	for slot4, slot5 in pairs(slot0.ships) do
		if slot5:getTeamType() == TeamType.Submarine then
			return FleetType.Submarine
		end
	end

	return FleetType.Normal
end

slot0.getShips = function (slot0, slot1)
	slot2 = {}

	if slot0:getFleetType() == FleetType.Normal then
		_.each(slot0:getShipsByTeam(TeamType.Main, slot1), function (slot0)
			table.insert(slot0, slot0)
		end)
		_.each(slot0:getShipsByTeam(TeamType.Vanguard, slot1), function (slot0)
			table.insert(slot0, slot0)
		end)
	elseif slot3 == FleetType.Submarine then
		_.each(slot0:getShipsByTeam(TeamType.Submarine, slot1), function (slot0)
			table.insert(slot0, slot0)
		end)
	end

	return slot2
end

slot0.updateShips = function (slot0, slot1)
	slot0[TeamType.Vanguard] = {}
	slot0[TeamType.Main] = {}
	slot0[TeamType.Submarine] = {}
	slot0.ships = {}

	_.each(slot1 or {}, function (slot0)
		slot1 = Ship.New(slot0.ship_info)
		slot1.hpRant = slot0.hp_rant
		slot0.ships[slot1.id] = slot1

		table.insert(slot0[slot1:getTeamType()], slot1)
	end)
end

slot0.getCommanders = function (slot0)
	return slot0.commanderList
end

slot0.switchShip = function (slot0, slot1, slot2)
	slot3, slot4, slot5, slot6 = nil

	for slot10, slot11 in pairs(slot0.ships) do
		if slot10 == slot1 then
			slot4 = table.indexof(slot0[slot11:getTeamType()], slot11)
		end

		if slot10 == slot2 then
			slot6 = table.indexof(slot0[slot11:getTeamType()], slot11)
		end
	end

	if slot3 == slot5 and slot4 ~= slot6 then
		slot0[slot5][slot6] = slot0[slot3][slot4]
		slot0[slot3][slot4] = slot0[slot5][slot6]
	end
end

return slot0
