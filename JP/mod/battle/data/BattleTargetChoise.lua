ys = ys or {}
slot0 = ys.Battle.BattleConfig
ys.Battle.BattleTargetChoise = {
	TargetNil = function (slot0)
		return nil
	end,
	TargetNull = function (slot0)
		return {}
	end,
	TargetAll = function (slot0)
		return ys.Battle.BattleDataProxy:GetInstance():GetUnitList()
	end,
	TargetTemplate = function (slot0, slot1, slot2)
		for slot10, slot11 in pairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
			if table.contains(slot1.targetTemplateIDList or {
				slot1.targetTemplateID
			}, slot11:GetTemplateID()) and slot0:GetIFF() == slot11:GetIFF() then
			end
		end

		return slot5
	end,
	TargetNationality = function (slot0, slot1, slot2)
		slot3 = slot1.targetTemplateIDList or {
			slot1.targetTemplateID
		}

		for slot11, slot12 in pairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
			if type(slot6) == "number" then
				if slot12:GetTemplate().nationality == slot6 then
				end
			elseif slot7 == "table" and table.contains(slot6, slot12:GetTemplate().nationality) then
				slot5[#slot5 + 1] = slot12
			end
		end

		return slot5
	end,
	TargetShipType = function (slot0, slot1, slot2)
		for slot9, slot10 in pairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
			if table.contains(slot1.ship_type_list, slot10:GetTemplate().type) then
			end
		end

		return slot4
	end,
	TargetShipTag = function (slot0, slot1, slot2)
		for slot9, slot10 in pairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
			if slot10:ContainsLabelTag(slot1.ship_tag_list) then
			end
		end

		return slot4
	end,
	TargetShipArmor = function (slot0, slot1, slot2)
		for slot9, slot10 in ipairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
			if slot10:GetAttrByName("armorType") == slot1.armor_type then
			end
		end

		return slot4
	end,
	getShipListByIFF = function (slot0)
		slot2 = nil

		if slot0 == uv0.FRIENDLY_CODE then
			slot2 = ys.Battle.BattleDataProxy:GetInstance():GetFriendlyShipList()
		elseif slot0 == uv0.FOE_CODE then
			slot2 = slot1:GetFoeShipList()
		end

		return slot2
	end,
	TargetAllHelp = function (slot0, slot1, slot2)
		slot3 = {}

		if slot0 then
			for slot10, slot11 in pairs(slot2 or uv0.getShipListByIFF(slot0:GetIFF())) do
				if slot11:IsAlive() and (not slot1 or {}.exceptCaster or slot11:GetUniqueID() ~= slot0:GetUniqueID()) then
					slot3[#slot3 + 1] = slot11
				end
			end
		end

		return slot3
	end,
	TargetHelpLeastHP = function (slot0, slot1, slot2)
		slot3 = nil
		slot4 = slot1 or {}.targetMaxHPRatio

		if slot0 then
			for slot10, slot11 in pairs(slot2 or uv0.getShipListByIFF(slot0:GetIFF())) do
				if slot11:IsAlive() and slot11:GetCurrentHP() < 9999999999.0 and (not slot4 or slot11:GetHPRate() <= slot4) then
					slot3 = slot11
					slot6 = slot11:GetCurrentHP()
				end
			end
		end

		return {
			slot3
		}
	end,
	TargetHelpLeastHPRatio = function (slot0, slot1, slot2)
		slot1 = slot1 or {}

		if slot0 then
			for slot8, slot9 in pairs(slot2 or uv0.getShipListByIFF(slot0:GetIFF())) do
				if slot9:IsAlive() and slot9:GetHPRate() < 100 then
					target = slot9
					slot3 = slot9:GetHPRate()
				end
			end
		end

		return {
			target
		}
	end,
	TargetHighestHP = function (slot0, slot1, slot2)
		slot1 = slot1 or {}
		slot3 = nil

		if slot0 then
			for slot9, slot10 in pairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
				if slot10:IsAlive() and 1 < slot10:GetCurrentHP() then
					slot3 = slot10
					slot5 = slot10:GetCurrentHP()
				end
			end
		end

		return {
			slot3
		}
	end,
	TargetHighestHPRatio = function (slot0, slot1, slot2)
		slot1 = slot1 or {}
		slot3 = nil

		if slot0 then
			for slot9, slot10 in pairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
				if slot10:IsAlive() and 0 < slot10:GetHPRate() then
					slot3 = slot10
					slot5 = slot10:GetHPRate()
				end
			end
		end

		return {
			slot3
		}
	end,
	TargetHPCompare = function (slot0, slot1, slot2)
		slot3 = {}
		slot4 = slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()

		if slot0 then
			for slot9, slot10 in ipairs(slot4) do
				if slot10:GetHP() < slot0:GetHP() then
					slot3[#slot3 + 1] = slot10
				end
			end
		end

		return slot3
	end,
	TargetHPRatioLowerThan = function (slot0, slot1, slot2)
		for slot9, slot10 in ipairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
			if slot10:GetHP() < slot1.hpRatioList[1] then
			end
		end

		return slot3
	end,
	TargetNationalityFriendly = function (slot0, slot1, slot2)
		slot3 = {}

		if slot0 then
			for slot9, slot10 in pairs(slot2 or uv0.TargetAllHelp(slot0, slot1)) do
				if slot10:GetTemplate().nationality == slot1.nationality then
					slot3[#slot3 + 1] = slot10
				end
			end
		end

		return slot3
	end,
	TargetNationalityFoe = function (slot0, slot1, slot2)
		slot3 = {}

		if slot0 then
			for slot9, slot10 in pairs(slot2 or uv0.TargetAllHarm(slot0, slot1)) do
				if slot10:GetTemplate().nationality == slot1.nationality then
					slot3[#slot3 + 1] = slot10
				end
			end
		end

		return slot3
	end,
	TargetShipTypeFriendly = function (slot0, slot1, slot2)
		slot3 = {}

		if slot0 then
			for slot9, slot10 in pairs(slot2 or uv0.TargetAllHelp(slot0, slot1)) do
				if table.contains(slot1.ship_type_list, slot10:GetTemplate().type) then
					slot3[#slot3 + 1] = slot10
				end
			end
		end

		return slot3
	end,
	TargetSelf = function (slot0)
		return {
			slot0
		}
	end,
	TargetAllHarm = function (slot0, slot1, slot2)
		slot3 = {}
		slot4 = nil
		slot5 = ys.Battle.BattleDataProxy:GetInstance()

		if slot2 then
			slot4 = slot2
		elseif slot0:GetIFF() == uv0.FRIENDLY_CODE then
			slot4 = slot5:GetFoeShipList()
		elseif slot6 == uv0.FOE_CODE then
			slot4 = slot5:GetFriendlyShipList()
		end

		slot6 = slot5:GetTotalRightBound()

		if slot4 then
			for slot10, slot11 in pairs(slot4) do
				if slot11:IsAlive() and slot11:GetPosition().x < slot6 and slot11:GetCurrentOxyState() ~= ys.Battle.BattleConst.OXY_STATE.DIVE then
					slot3[#slot3 + 1] = slot11
				end
			end
		end

		return slot3
	end,
	TargetAllFoe = function (slot0, slot1, slot2)
		slot3 = {}
		slot4 = nil
		slot5 = ys.Battle.BattleDataProxy:GetInstance()

		if slot2 then
			slot4 = slot2
		elseif slot0:GetIFF() == uv0.FRIENDLY_CODE then
			slot4 = slot5:GetFoeShipList()
		elseif slot6 == uv0.FOE_CODE then
			slot4 = slot5:GetFriendlyShipList()
		end

		slot6 = slot5:GetTotalRightBound()

		if slot4 then
			for slot10, slot11 in pairs(slot4) do
				if slot11:IsAlive() and slot11:GetPosition().x < slot6 then
					slot3[#slot3 + 1] = slot11
				end
			end
		end

		return slot3
	end,
	TargetHarmNearest = function (slot0, slot1, slot2)
		slot4 = nil

		for slot9, slot10 in ipairs(slot2 or uv0.TargetAllHarm(slot0)) do
			if slot0:GetDistance(slot10) < (slot1 or {}.range or 9999999999.0) then
				slot3 = slot11
				slot4 = slot10
			end
		end

		return {
			slot4
		}
	end,
	TargetHarmFarthest = function (slot0, slot1, slot2)
		slot4 = nil

		for slot9, slot10 in ipairs(slot2 or uv0.TargetAllHarm(slot0)) do
			if 0 < slot0:GetDistance(slot10) then
				slot3 = slot11
				slot4 = slot10
			end
		end

		return {
			slot4
		}
	end,
	TargetHarmRandom = function (slot0, slot1, slot2)
		if #(slot2 or uv0.TargetAllHarm(slot0)) > 0 then
			return {
				slot4[math.random(#slot4)]
			}
		else
			return {}
		end
	end,
	TargetHarmRandomByWeight = function (slot0, slot1, slot2)
		for slot9, slot10 in ipairs(slot2 or uv0.TargetAllHarm(slot0)) do
			if (slot10:GetTemplate().battle_unit_type or 0) == 0 then
			elseif slot5 < slot11 then
				slot4 = {
					slot10
				}
				slot5 = slot11
			end
		end

		if #slot4 > 0 then
			return {
				slot4[math.random(#slot4)]
			}
		else
			return {}
		end
	end,
	TargetWeightiest = function (slot0, slot1, slot2)
		for slot9, slot10 in ipairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
			if (slot10:GetTemplate().battle_unit_type or 0) == 0 then
			elseif slot5 < slot11 then
				slot4 = {
					slot10
				}
				slot5 = slot11
			end
		end

		return slot4
	end,
	TargetAircraftHelp = function (slot0)
		for slot7, slot8 in pairs(ys.Battle.BattleDataProxy:GetInstance().GetAircraftList(slot1)) do
			if slot0:GetIFF() == slot8:GetIFF() then
			end
		end

		return slot2
	end,
	TargetAircraftHarm = function (slot0)
		for slot7, slot8 in pairs(ys.Battle.BattleDataProxy:GetInstance().GetAircraftList(slot1)) do
			if slot0:GetIFF() ~= slot8:GetIFF() and slot8:IsVisitable() then
			end
		end

		return slot2
	end,
	TargetDiveState = function (slot0, slot1, slot2)
		for slot9, slot10 in pairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
			if (slot1 and slot1.diveState or ys.Battle.BattleConst.OXY_STATE.DIVE) == slot10:GetCurrentOxyState() then
			end
		end

		return slot5
	end,
	TargetDetectedUnit = function (slot0, slot1, slot2)
		for slot8, slot9 in pairs(slot2 or ys.Battle.BattleDataProxy:GetInstance():GetUnitList()) do
			if slot9:GetDiveDetected() then
			end
		end

		return slot4
	end,
	TargetAllHarmBullet = function (slot0)
		for slot7, slot8 in pairs(ys.Battle.BattleDataProxy:GetInstance().GetBulletList(slot1)) do
			if slot0:GetIFF() ~= slot8:GetIFF() then
			end
		end

		return slot2
	end,
	TargetAllHarmBulletByType = function (slot0, slot1)
		for slot8, slot9 in pairs(ys.Battle.BattleDataProxy:GetInstance().GetBulletList(slot2)) do
			if slot0:GetIFF() ~= slot9:GetIFF() and slot9:GetType() == slot1 then
			end
		end

		return slot3
	end,
	TargetAllHarmTorpedoBullet = function (slot0)
		return uv0.TargetAllHarmBulletByType(slot0, ys.Battle.BattleConst.BulletType.TORPEDO)
	end,
	TargetPlayerVanguardFleet = function (slot0, slot1, slot2)
		if not slot2 then
			return ys.Battle.BattleDataProxy:GetInstance():GetFleetByIFF(slot0:GetIFF()):GetScoutList()
		else
			while #slot2 > 0 do
				if not table.contains(slot4, slot2[slot5]) then
					table.remove(slot2, slot5)
				end

				slot5 = slot5 - 1
			end

			return slot2
		end
	end,
	TargetPlayerMainFleet = function (slot0, slot1, slot2)
		if not slot2 then
			return ys.Battle.BattleDataProxy:GetInstance():GetFleetByIFF(slot0:GetIFF()):GetMainList()
		else
			while #slot2 > 0 do
				if not table.contains(slot4, slot2[slot5]) then
					table.remove(slot2, slot5)
				end

				slot5 = slot5 - 1
			end

			return slot2
		end
	end,
	TargetPlayerFlagShip = function (slot0, slot1, slot2)
		return {
			ys.Battle.BattleDataProxy:GetInstance():GetFleetByIFF(slot0:GetIFF()):GetFlagShip()
		}
	end,
	TargetPlayerByType = function (slot0, slot1)
		for slot9, slot10 in ipairs(slot3) do
			if slot10:GetTemplate().type == slot1.shipType then
			end
		end

		return slot4
	end
}
