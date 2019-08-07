slot0 = class("Fleet", import(".BaseVO"))
slot0.VANGUARD = "vanguard"
slot0.MAIN = "main"
slot0.SUBMARINE = "submarine"
slot0.C_TEAM_NAME = {
	[slot0.VANGUARD] = i18n("word_vanguard_fleet"),
	[slot0.MAIN] = i18n("word_main_fleet"),
	[slot0.SUBMARINE] = i18n("word_sub_fleet")
}
slot0.DEFAULT_NAME = {
	i18n("ship_formationUI_fleetName1"),
	i18n("ship_formationUI_fleetName2"),
	i18n("ship_formationUI_fleetName3"),
	i18n("ship_formationUI_fleetName4"),
	i18n("ship_formationUI_fleetName5"),
	i18n("ship_formationUI_fleetName6"),
	[11] = i18n("ship_formationUI_fleetName11"),
	[12] = i18n("ship_formationUI_fleetName12"),
	[101] = i18n("ship_formationUI_exercise_fleetName")
}
slot0.DEFAULT_NAME_FOR_DOCKYARD = {
	i18n("ship_formationUI_fleetName1"),
	i18n("ship_formationUI_fleetName2"),
	i18n("ship_formationUI_fleetName3"),
	i18n("ship_formationUI_fleetName4"),
	i18n("ship_formationUI_fleetName5"),
	i18n("ship_formationUI_fleetName6"),
	[11] = i18n("ship_formationUI_fleetName1"),
	[12] = i18n("ship_formationUI_fleetName2"),
	[101] = i18n("ship_formationUI_exercise_fleetName")
}
slot0.REGULAR_FLEET_ID = 1
slot0.REGULAR_FLEET_NUMS = 6
slot0.SUBMARINE_FLEET_ID = 11
slot0.SUBMARINE_FLEET_NUMS = 2

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.name = slot1.name
	slot0.defaultName = slot0.DEFAULT_NAME[slot0.id]

	slot0:updateShips(slot1.ship_list)

	slot0.commanderIds = {}
	slot2 = ipairs
	slot3 = slot1.commanders or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.commanderIds[slot6.pos] = slot6.id
	end

	slot0.skills = {}

	slot0:updateCommanderSkills()
end

slot0.isUnlock = function (slot0)
	slot2 = getProxy(ChapterProxy)

	if ({
		nil,
		nil,
		404,
		504,
		604,
		704
	})[slot0.id] then
		return slot2:getChapterById(slot3) and slot4:isClear(), i18n("formation_chapter_lock", string.sub(tostring(slot3), 1, 1), slot0.id)
	end

	return true
end

slot0.containShip = function (slot0, slot1)
	return table.contains(slot0.ships, slot1.id)
end

slot0.isFirstFleet = function (slot0)
	return slot0.id == slot0.REGULAR_FLEET_ID
end

slot0.getCommanders = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.commanderIds) do
		slot1[slot5] = getProxy(CommanderProxy):getCommanderById(slot6)
	end

	return slot1
end

slot0.getCommanderByPos = function (slot0, slot1)
	return slot0:getCommanders()[slot1]
end

slot0.updateCommanderByPos = function (slot0, slot1, slot2)
	if slot2 then
		slot0.commanderIds[slot1] = slot2.id

		slot0:updateCommanderSkills()
	else
		slot0.commanderIds[slot1] = nil
	end
end

slot0.getCommandersAddition = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(CommanderConst.PROPERTIES) do
		slot7 = 0

		for slot11, slot12 in pairs(slot0:getCommanders()) do
			slot7 = slot7 + slot12:getAbilitysAddition()[slot6]
		end

		if slot7 > 0 then
			table.insert(slot1, {
				attrName = slot6,
				value = slot7
			})
		end
	end

	return slot1
end

slot0.getCommandersTalentDesc = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0:getCommanders()) do
		for slot11, slot12 in pairs(slot7) do
			if slot1[slot11] then
				slot1[slot11].value = slot1[slot11].value + slot12.value
			else
				slot1[slot11] = {
					name = slot11,
					value = slot12.value,
					type = slot12.type
				}
			end
		end
	end

	return slot1
end

slot0.findCommanderBySkillId = function (slot0, slot1)
	for slot6, slot7 in pairs(slot2) do
		if _.any(slot7:getSkills(), function (slot0)
			return _.any(slot0:getTacticSkill(), function (slot0)
				return slot0 == slot0
			end)
		end) then
			return slot7
		end
	end
end

slot0.updateCommanderSkills = function (slot0)
	for slot5, slot6 in pairs(slot1) do
		for slot10, slot11 in ipairs(slot6:getSkills()) do
			for slot15, slot16 in ipairs(slot11:getTacticSkill()) do
				table.insert(slot0.skills, FleetSkill.New(FleetSkill.SystemCommanderNeko, slot16))
			end
		end
	end
end

slot0.buildBattleBuffList = function (slot0)
	slot1 = {}
	slot2, slot3 = FleetSkill.triggerSkill(slot0, FleetSkill.TypeBattleBuff)

	if slot2 and #slot2 > 0 then
		slot4 = {}

		for slot8, slot9 in ipairs(slot2) do
			slot4[slot11] = slot4[slot0:findCommanderBySkillId(slot3[slot8].id)] or {}

			table.insert(slot4[slot11], slot9)
		end

		for slot8, slot9 in pairs(slot4) do
			table.insert(slot1, {
				slot8,
				slot9
			})
		end
	end

	for slot8, slot9 in pairs(slot4) do
		for slot14, slot15 in ipairs(slot10) do
			if #slot15:getBuffsAddition() > 0 then
				slot17 = nil

				for slot21, slot22 in ipairs(slot1) do
					if slot22[1] == slot9 then
						slot17 = slot22[2]

						break
					end
				end

				if not slot17 then
					table.insert(slot1, {
						slot9,
						{}
					})
				end

				for slot21, slot22 in ipairs(slot16) do
					table.insert(slot17, slot22)
				end
			end
		end
	end

	return slot1
end

slot0.getSkills = function (slot0)
	return slot0.skills
end

slot0.getShipIds = function (slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot2) do
		for slot11, slot12 in ipairs(slot7) do
			table.insert(slot1, slot12)
		end
	end

	return slot1
end

slot0.findSkills = function (slot0, slot1)
	return _.filter(slot0:getSkills(), function (slot0)
		return slot0:GetType() == slot0
	end)
end

slot0.updateShips = function (slot0, slot1)
	slot0.ships = {}
	slot0.vanguardShips = {}
	slot0.mainShips = {}
	slot0.subShips = {}
	slot2 = getProxy(BayProxy)

	for slot6, slot7 in ipairs(slot1) do
		if slot2:getShipById(slot7) then
			table.insert(slot0.ships, slot7)

			if slot8:getTeamType() == TeamType.Vanguard then
				table.insert(slot0.vanguardShips, slot7)
			elseif slot9 == TeamType.Main then
				table.insert(slot0.mainShips, slot7)
			elseif slot9 == TeamType.Submarine then
				table.insert(slot0.subShips, slot7)
			end
		end
	end
end

slot0.getShipPos = function (slot0, slot1)
	if not slot1 then
		return
	end

	if table.contains(slot0.vanguardShips, slot1.id) then
		return table.indexof(slot0.vanguardShips, slot2), slot0.VANGUARD
	elseif table.contains(slot0.mainShips, slot2) then
		return table.indexof(slot0.mainShips, slot2), slot0.MAIN
	elseif table.contains(slot0.subShips, slot2) then
		return table.indexof(slot0.subShips, slot2), slot0.SUBMARINE
	else
		return -1
	end
end

slot0.getTeamByName = function (slot0, slot1)
	if slot1 == slot0.VANGUARD then
		return slot0.vanguardShips
	elseif slot1 == slot0.MAIN then
		return slot0.mainShips
	elseif slot1 == slot0.SUBMARINE then
		return slot0.subShips
	end
end

slot0.insertShip = function (slot0, slot1, slot2, slot3)
	if slot3 == slot0.VANGUARD then
		table.insert(slot0.vanguardShips, slot2 or #slot0.vanguardShips + 1, slot1.id)
	elseif slot3 == slot0.MAIN then
		table.insert(slot0.mainShips, slot2 or #slot0.mainShips + 1, slot1.id)
	elseif slot3 == slot0.SUBMARINE then
		table.insert(slot0.subShips, slot2 or #slot0.subShips + 1, slot1.id)
	end

	table.insert(slot0.ships, slot1.id)
end

slot0.canRemove = function (slot0, slot1)
	slot2, slot8 = slot0:getShipPos(slot1)
	slot4 = slot0:isPvpFleet()
	slot5 = slot0:isFirstFleet()
	slot6 = slot0:getTeamByName(slot3) or {}

	if #slot6 == 1 and (slot5 or slot4) then
		return false
	else
		return true
	end
end

slot0.isRegularFleet = function (slot0)
	return (slot0.SUBMARINE_FLEET_ID <= slot0.id and slot0.id < slot0.SUBMARINE_FLEET_ID + slot0.SUBMARINE_FLEET_NUMS) or (slot0.REGULAR_FLEET_ID <= slot0.id and slot0.id < slot0.REGULAR_FLEET_ID + slot0.REGULAR_FLEET_NUMS)
end

slot0.isSubmarineFleet = function (slot0)
	return slot0.SUBMARINE_FLEET_ID <= slot0.id and slot0.id < slot0.SUBMARINE_FLEET_ID + slot0.SUBMARINE_FLEET_NUMS
end

slot0.isPvpFleet = function (slot0)
	return slot0.id == FleetProxy.PVP_FLEET_ID
end

slot0.getFleetType = function (slot0)
	if not slot0.id then
		return FleetType.Normal
	end

	if slot0.SUBMARINE_FLEET_ID <= slot0.id and slot0.id < slot0.SUBMARINE_FLEET_ID + slot0.SUBMARINE_FLEET_NUMS then
		return FleetType.Submarine
	end

	return FleetType.Normal
end

slot0.removeShip = function (slot0, slot1)
	slot2 = slot1.id

	for slot6, slot7 in ipairs(slot0.ships) do
		if slot7 == slot2 then
			table.remove(slot0.ships, slot6)

			break
		end
	end

	for slot6, slot7 in ipairs(slot0.vanguardShips) do
		if slot7 == slot2 then
			return table.remove(slot0.vanguardShips, slot6), slot0.VANGUARD
		end
	end

	for slot6, slot7 in ipairs(slot0.mainShips) do
		if slot7 == slot2 then
			return table.remove(slot0.mainShips, slot6), slot0.MAIN
		end
	end

	for slot6, slot7 in ipairs(slot0.subShips) do
		if slot7 == slot2 then
			return table.remove(slot0.subShips, slot6), slot0.SUBMARINE
		end
	end

	return nil
end

slot0.canRemoveByShipId = function (slot0, slot1)
	if table.getCount(slot0.vanguardShips) == 1 and slot1 == slot0.vanguardShips[1] then
		return false, slot0.VANGUARD
	end

	if table.getCount(slot0.mainShips) == 1 and slot1 == slot0.mainShips[1] then
		return false, slot0.MAIN
	end

	if table.getCount(slot0.subShips) == 1 and slot1 == slot0.subShips[1] then
		return false, slot0.SUBMARINE
	end

	return true
end

slot0.isFull = function (slot0)
	if slot0:getFleetType() == FleetType.Normal then
		return #slot0.ships >= 6
	elseif slot1 == FleetType.Submarine then
		return #slot0.subShips >= 3
	end

	return false
end

slot0.isEmpty = function (slot0)
	return #slot0.ships == 0
end

slot0.isLegalToFight = function (slot0)
	if slot0:getFleetType() == FleetType.Normal then
		if #slot0.vanguardShips == 0 then
			return slot0.VANGUARD, 1
		elseif #slot0.mainShips == 0 then
			return slot0.MAIN, 1
		end
	elseif slot1 == FleetType.Submarine and #slot0.subShips == 0 then
		return slot0.SUBMARINE, 1
	end

	return true
end

slot0.getSkillNum = function (slot0)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		slot2[slot7] = 0
	end

	slot4 = getProxy(BayProxy).getRawData(slot3)
	slot5 = ys.Battle.BattleConst.EquipmentType

	for slot9, slot10 in ipairs(slot0.ships) do
		for slot14, slot15 in ipairs(slot4[slot10]:getActiveEquipments()) do
			if slot15 > 0 then
				for slot21, slot22 in ipairs(slot17) do
					if slot22 > 0 then
						if pg.weapon_property[slot22].type == slot5.POINT_HIT_AND_LOCK then
							slot2.zhupao = slot2.zhupao + 1
						elseif slot23 == slot5.TORPEDO or slot23 == slot5.MANUAL_TORPEDO then
							slot2.yulei = slot2.yulei + 1
						elseif slot23 == slot5.ANTI_AIR then
							slot2.fangkongpao = slot2.fangkongpao + 1
						elseif slot23 == slot5.SCOUT then
							slot2.jianzaiji = slot2.jianzaiji + 1
						end
					end
				end
			end
		end
	end

	return slot2
end

slot0.GetPropertiesSum = function (slot0)
	slot1 = {
		cannon = 0,
		antiAir = 0,
		air = 0,
		torpedo = 0
	}
	slot2 = getProxy(BayProxy):getRawData()

	for slot6, slot7 in ipairs(slot0.ships) do
		slot8 = slot2[slot7]:getProperties(slot0:getCommanders())
		slot1.cannon = slot1.cannon + math.floor(slot8.cannon)
		slot1.torpedo = slot1.torpedo + math.floor(slot8.torpedo)
		slot1.antiAir = slot1.antiAir + math.floor(slot8.antiaircraft)
		slot1.air = slot1.air + math.floor(slot8.air)
	end

	return slot1
end

slot0.GetCostSum = function (slot0)
	slot1 = {
		gold = 0,
		oil = 0
	}
	slot2 = slot0:getStartCost()
	slot3 = slot0:getEndCost()

	if slot0:getFleetType() == FleetType.Submarine then
		slot1.oil = slot3.oil
	else
		slot1.oil = slot2.oil + slot3.oil
	end

	return slot1
end

slot0.getStartCost = function (slot0)
	slot1 = {
		gold = 0,
		oil = 0
	}
	slot2 = getProxy(BayProxy):getRawData()

	for slot6, slot7 in ipairs(slot0.ships) do
		slot1.oil = slot1.oil + slot2[slot7]:getStartBattleExpend()
	end

	return slot1
end

slot0.getEndCost = function (slot0)
	slot1 = {
		gold = 0,
		oil = 0
	}
	slot2 = getProxy(BayProxy):getRawData()

	for slot6, slot7 in ipairs(slot0.ships) do
		slot1.oil = slot1.oil + slot2[slot7]:getEndBattleExpend()
	end

	return slot1
end

slot0.GetGearScoreSum = function (slot0, slot1)
	slot2 = nil
	slot2 = (slot1 ~= nil or slot0.ships) and slot0:getTeamByName(slot1)
	slot3 = 0
	slot4 = getProxy(BayProxy):getRawData()

	for slot8, slot9 in ipairs(slot2) do
		slot3 = slot3 + slot4[slot9]:getShipCombatPower(slot0:getCommanders())
	end

	return slot3
end

slot0.GetEnergyStatus = function (slot0)
	slot2 = ""
	slot3 = ""
	slot4 = getProxy(BayProxy)

	local function slot5(slot0)
		for slot4 = 1, 3, 1 do
			if slot0[slot4] and slot0:getShipById(slot0[slot4]).energy == Ship.ENERGY_LOW then
				slot1 = true
				slot2 = slot2 .. "「" .. slot5:getConfig("name") .. "」"
			end
		end
	end

	slot5(slot0.mainShips)
	slot5(slot0.vanguardShips)
	slot5(slot0.subShips)

	if false then
		return slot1, i18n("ship_energy_low_warn", (slot0.name == "" and slot0.DEFAULT_NAME[slot0.id]) or slot0.name, slot3)
	end
end

slot0.genRobotDataString = function (slot0)
	slot2 = getProxy(BayProxy).getRawData(slot1)
	slot3 = "99999,"

	for slot7 = 1, 3, 1 do
		if slot0.vanguardShips[slot7] and slot0.vanguardShips[slot7] > 0 then
			slot3 = slot3 .. slot2[slot0.vanguardShips[slot7]].configId .. "," .. slot2[slot0.vanguardShips[slot7]].level .. ",\"{"

			for slot11, slot12 in pairs(slot2[slot0.vanguardShips[slot7]]:getActiveEquipments()) do
				slot3 = slot3 .. ((slot12 and slot12.id) or 0)

				if slot11 < 5 then
					slot3 = slot3 .. ","
				end
			end

			slot3 = slot3 .. "}\","
		else
			slot3 = slot3 .. "" .. "," .. "" .. ",{" .. "},"
		end
	end

	for slot7 = 1, 3, 1 do
		if slot0.mainShips[slot7] and slot0.mainShips[slot7] > 0 then
			slot3 = slot3 .. slot2[slot0.mainShips[slot7]].configId .. "," .. slot2[slot0.mainShips[slot7]].level .. ",\"{"

			for slot11, slot12 in pairs(slot2[slot0.mainShips[slot7]]:getActiveEquipments()) do
				slot3 = slot3 .. ((slot12 and slot12.id) or 0)

				if slot11 < 5 then
					slot3 = slot3 .. ","
				end
			end

			slot3 = slot3 .. "}\","
		else
			slot3 = slot3 .. "" .. "," .. "" .. ",{" .. "},"
		end
	end

	return slot3 .. math.floor(slot0:GetGearScoreSum(slot0.VANGUARD) + slot0:GetGearScoreSum(slot0.MAIN)) .. ","
end

slot0.getIndex = function (slot0)
	if slot0.SUBMARINE_FLEET_ID <= slot0.id and slot0.id < slot0.SUBMARINE_FLEET_ID + slot0.SUBMARINE_FLEET_NUMS then
		return slot0.id - slot0.SUBMARINE_FLEET_ID + 1
	elseif slot0.REGULAR_FLEET_ID <= slot0.id and slot0.id < slot0.REGULAR_FLEET_ID + slot0.REGULAR_FLEET_NUMS then
		return slot0.id - slot0.REGULAR_FLEET_ID + 1
	end

	return slot0.id
end

slot0.getShipCount = function (slot0)
	return #slot0.ships
end

slot0.avgLevel = function (slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.ships) do
		slot1 = getProxy(BayProxy):getShipById(slot6).level + slot1
	end

	return math.floor(slot1 / #slot0.ships)
end

slot0.clearFleet = function (slot0)
	slot2 = getProxy(BayProxy)

	for slot6, slot7 in ipairs(slot1) do
		slot0:removeShip(slot2:getShipById(slot7))
	end
end

slot0.EnergyCheck = function (slot0, slot1, slot2, slot3)
	slot4 = slot3 or "ship_energy_low_warn"
	slot5 = false
	slot6 = ""

	for slot10, slot11 in ipairs(slot0) do
		if slot11.energy == Ship.ENERGY_LOW then
			slot5 = true
			slot6 = slot6 .. "「" .. slot11:getConfig("name") .. "」"
		end
	end

	if slot5 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n(slot4, slot1, slot6),
			onYes = function ()
				slot0()
			end,
			weight = LayerWeightConst.TOP_LAYER
		})
	else
		return true
	end
end

slot0.getFleetAirDominanceValue = function (slot0)
	slot1 = getProxy(BayProxy)
	slot2 = slot0:getCommanders()
	slot3 = 0

	for slot7, slot8 in ipairs(slot0.ships) do
		slot3 = 
		-- Decompilation error in this vicinity:
		function (slot0, slot1)
			return slot0 + calcAirDominanceValue(slot0:getShipById(slot1), slot1)
		end(slot3, slot8)
	end

	return slot3
end

return slot0