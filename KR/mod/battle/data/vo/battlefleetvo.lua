ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = ys.Battle.BattleFormulas
slot4 = ys.Battle.BattleConst
slot5 = ys.Battle.BattleConfig
slot6 = ys.Battle.BattleDataFunction
slot7 = class("BattleFleetVO")
ys.Battle.BattleFleetVO = slot7
slot7.__name = "BattleFleetVO"

slot7.Ctor = function (slot0, slot1)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)
	slot0.EventListener.AttachEventListener(slot0)

	slot0._IFF = slot1
	slot0._lastDist = 0

	slot0:init()
end

slot7.UpdateMotion = function (slot0)
	if slot0._motionReferenceUnit then
		slot0._motionVO:UpdatePos(slot0._motionReferenceUnit)
		slot0._motionVO:UpdateVelocityAndDirection(slot0:GetFleetVelocity(), slot0._motionSourceFunc())
	end

	if math.max(slot0._motionVO:GetPos().x - slot0._rightBound, 0) >= 0 and slot1 ~= slot0._lastDist then
		slot0._lastDist = slot1

		slot0:DispatchEvent(slot0.Event.New(slot1.SHOW_BUFFER, {
			dist = slot1
		}))
	end
end

slot7.UpdateAutoComponent = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._scoutList) do
		slot6:UpdateWeapon(slot1)
	end

	for slot5, slot6 in ipairs(slot0._mainList) do
		slot6:UpdateWeapon(slot1)
		slot6:UpdateAirAssist()
	end

	for slot5, slot6 in ipairs(slot0._subList) do
		slot6:UpdateWeapon(slot1)
		slot6:UpdateOxygen(slot1)
		slot6:UpdatePhaseSwitcher()
	end

	for slot5, slot6 in ipairs(slot0._manualSubList) do
		slot6:UpdateOxygen(slot1)
	end

	slot0._fleetAntiAir:Update(slot1)
	slot0._fleetSonar:Update(slot1)

	for slot5, slot6 in pairs(slot0._indieSonarList) do
		slot5:Update(slot1)
	end
end

slot7.UpdateManualWeaponVO = function (slot0, slot1)
	slot0._chargeWeaponVO:Update(slot1)
	slot0._torpedoWeaponVO:Update(slot1)
	slot0._airAssistVO:Update(slot1)
	slot0._submarineDiveVO:Update(slot1)
	slot0._submarineFloatVO:Update(slot1)
	slot0._submarineBoostVO:Update(slot1)
	slot0._submarineShiftVO:Update(slot1)
end

slot7.UpdateFleetDamage = function (slot0, slot1)
	slot0._currentDMGRatio = slot0._currentDMGRatio + slot0.CalculateFleetDamage(slot1)

	slot0:DispatchFleetDamageChange()
end

slot7.UpdateFleetOverDamage = function (slot0, slot1)
	slot0._currentDMGRatio = slot0._currentDMGRatio - slot0:CalculateFleetOverDamage(slot1)

	slot0:DispatchFleetDamageChange()
end

slot7.DispatchFleetDamageChange = function (slot0)
	slot0:DispatchEvent(slot0.Event.New(slot1.FLEET_DMG_CHANGE, {}))
end

slot7.DispatchSonarScan = function (slot0, slot1)
	slot0:DispatchEvent(slot0.Event.New(slot1.SONAR_SCAN, {
		indieSonar = slot1
	}))
end

slot7.FreeMainUnit = function (slot0, slot1)
	if slot0._mainUnitFree then
		return
	end

	slot0._mainUnitFree = true

	for slot5, slot6 in ipairs(slot0._mainList) do
		slot6:AddBuff(slot7)
		slot6:SetMainUnitStatic(false)
	end
end

slot7.SetMotionSource = function (slot0, slot1)
	if slot1 == nil then
		slot0._motionSourceFunc = function ()
			return pg.UIMgr:GetInstance().hrz, pg.UIMgr.GetInstance().vtc
		end
	else
		slot0._motionSourceFunc = slot1
	end
end

slot7.SetSubAidData = function (slot0, slot1, slot2)
	slot0._submarineVO = slot0.Battle.BattleSubmarineAidVO.New()

	if slot2 == slot1.SubAidFlag.AID_EMPTY or slot2 == slot1.SubAidFlag.OIL_EMPTY then
		slot0._submarineVO:SetUseable(false)
	else
		slot0._submarineVO:SetCount(slot2)
		slot0._submarineVO:SetTotal(slot1)
		slot0._submarineVO:SetUseable(true)
	end
end

slot7.SetBound = function (slot0, slot1, slot2, slot3, slot4)
	slot0._upperBound = slot1
	slot0._lowerBound = slot2
	slot0._leftBound = slot3
	slot0._rightBound = slot4
end

slot7.SetTotalBound = function (slot0, slot1, slot2, slot3, slot4)
	slot0._totalUpperBound = slot1
	slot0._totalLowerBound = slot2
	slot0._totalLeftBound = slot3
	slot0._totalRightBound = slot4
end

slot7.CalcSubmarineBaseLine = function (slot0, slot1)
	slot2 = (slot0._totalRightBound + slot0._totalLeftBound) * 0.5

	if slot0._IFF == slot0.FRIENDLY_CODE then
		if slot1 == SYSTEM_DUEL then
		elseif slot1 == SYSTEM_SHAM then
		else
			slot0._subAttackBaseLine = slot2
			slot0._subRetreatBaseLine = slot0._leftBound - 10
		end
	elseif slot0._IFF == slot0.FOE_CODE then
		if slot1 == SYSTEM_DUEL then
		elseif slot1 == SYSTEM_SHAM then
		end
	end
end

slot7.AppendPlayerUnit = function (slot0, slot1)
	slot0._unitList[#slot0._unitList + 1] = slot1
	slot0._maxCount = slot0._maxCount + 1

	if slot1:IsMainFleetUnit() then
		slot0:appendMainUnit(slot1)
		slot1:SetMainUnitIndex(#slot0._mainList)
	else
		slot0:appendScoutUnit(slot1)
	end

	slot1:SetFleetVO(slot0)
	slot1:SetMotion(slot0._motionVO)
	slot1:RegisterEventListener(slot0, slot0.UPDATE_HP, slot0.onUnitUpdateHP)
end

slot7.RemovePlayerUnit = function (slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0._unitList) do
		if slot7 ~= slot1 then
			slot2[#slot2 + 1] = slot6
		else
			slot7:UnregisterEventListener(slot0, slot0.UPDATE_HP)
			slot7:DeactiveCldBox()

			for slot12, slot13 in ipairs(slot8) do
				if slot13:IsAttacking() then
					slot0._chargeWeaponVO:CancelFocus()
					slot0._chargeWeaponVO:ResetFocus()
					slot0:CancelChargeWeapon()
				end

				slot0._chargeWeaponVO:RemoveWeapon(slot13)
				slot13:Clear()
			end

			slot0._fleetAntiAir:RemoveCrewUnit(slot1)
			slot0._fleetSonar:RemoveCrewUnit(slot1)

			for slot13, slot14 in ipairs(slot9) do
				if slot14:IsAttacking() then
					slot0:CancelTorpedo()
				end

				slot0._torpedoWeaponVO:RemoveWeapon(slot14)
				slot14:Clear()
			end

			if slot7:GetAirAssistList() then
				for slot14, slot15 in ipairs(slot10) do
					slot0._airAssistVO:RemoveWeapon(slot15)
				end
			end
		end
	end

	for slot6, slot7 in ipairs(slot0._scoutList) do
		if slot7 == slot1 then
			if #slot0._scoutList == 1 then
				slot0:CancelChargeWeapon()
			end

			table.remove(slot0._scoutList, slot6)

			break
		end
	end

	for slot6, slot7 in ipairs(slot0._mainList) do
		if slot7 == slot1 then
			table.remove(slot0._mainList, slot6)

			break
		end
	end

	for slot6, slot7 in ipairs(slot0._manualSubList) do
		if slot7 == slot1 then
			table.remove(slot0._manualSubList, slot6)

			break
		end
	end

	if not slot0._manualSubUnit then
		slot0:refreshFleetFormation(slot2)
	end
end

slot7.OverrideJoyStickAutoBot = function (slot0, slot1)
	slot0._autoBotAIID = slot1

	slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleEvent.OVERRIDE_AUTO_BOT))
end

slot7.SnapShot = function (slot0)
	slot0._totalDMGRatio = slot0:GetFleetTotalHP()
	slot0._currentDMGRatio = slot0._totalDMGRatio
end

slot7.GetIFF = function (slot0)
	return slot0._IFF
end

slot7.GetMaxCount = function (slot0)
	return slot0._maxCount
end

slot7.GetFlagShip = function (slot0)
	return slot0._flagShip
end

slot7.GetUnitList = function (slot0)
	return slot0._unitList
end

slot7.GetMainList = function (slot0)
	return slot0._mainList
end

slot7.GetScoutList = function (slot0)
	return slot0._scoutList
end

slot7.GetSubBench = function (slot0)
	return slot0._manualSubBench
end

slot7.GetMotion = function (slot0)
	return slot0._motionVO
end

slot7.GetMotionReferenceUnit = function (slot0)
	return slot0._motionReferenceUnit
end

slot7.GetAutoBotAIID = function (slot0)
	return slot0._autoBotAIID
end

slot7.GetChargeWeaponVO = function (slot0)
	return slot0._chargeWeaponVO
end

slot7.GetTorpedoWeaponVO = function (slot0)
	return slot0._torpedoWeaponVO
end

slot7.GetAirAssistVO = function (slot0)
	return slot0._airAssistVO
end

slot7.GetSubAidVO = function (slot0)
	return slot0._submarineVO
end

slot7.GetSubFreeDiveVO = function (slot0)
	return slot0._submarineDiveVO
end

slot7.GetSubFreeFloatVO = function (slot0)
	return slot0._submarineFloatVO
end

slot7.GetSubBoostVO = function (slot0)
	return slot0._submarineBoostVO
end

slot7.GetSubSpecialVO = function (slot0)
	return slot0._submarineSpecialVO
end

slot7.GetSubShiftVO = function (slot0)
	return slot0._submarineShiftVO
end

slot7.GetFleetAntiAirWeapon = function (slot0)
	return slot0._fleetAntiAir
end

slot7.GetFleetVelocity = function (slot0)
	return slot0.GetFleetVelocity(slot0._scoutList)
end

slot7.GetFleetBound = function (slot0)
	return slot0._upperBound, slot0._lowerBound, slot0._leftBound, slot0._rightBound
end

slot7.GetLeaderPersonality = function (slot0)
	return slot0._motionReferenceUnit:GetAutoPilotPreference()
end

slot7.GetDamageRatioResult = function (slot0)
	return string.format("%0.2f", slot0._currentDMGRatio / slot0._totalDMGRatio * 100), slot0._totalDMGRatio
end

slot7.GetDamageRatio = function (slot0)
	return slot0._currentDMGRatio / slot0._totalDMGRatio
end

slot7.GetSubmarineBaseLine = function (slot0)
	return slot0._subAttackBaseLine, slot0._subRetreatBaseLine
end

slot7.GetFleetSonar = function (slot0)
	return slot0._fleetSonar
end

slot7.Dispose = function (slot0)
	slot0.EventDispatcher.DetachEventDispatcher(slot0)
	slot0.EventListener.DetachEventListener(slot0)

	slot0._leaderUnit = nil

	slot0._fleetAntiAir:Dispose()
	slot0._fleetSonar:Dispose()

	slot0._fleetSonar = nil
	slot0._indieSonarList = nil
end

slot7.refreshFleetFormation = function (slot0, slot1)
	slot2 = slot0.GetFormationTmpDataFromID(slot1.FORMATION_ID).pos_offset
	slot0._unitList = slot0.SortFleetList(slot1, slot0._unitList)
	slot3 = slot1.BornOffset

	if not slot0._mainUnitFree then
		for slot7, slot8 in ipairs(slot0._unitList) do
			if not table.contains(slot0._subList, slot8) then
				slot8:UpdateFormationOffset(Vector3(slot2[slot7].x, slot2[slot7].y, slot2[slot7].z) + slot3 * (slot7 - 1))
			end
		end
	end

	if #slot0._scoutList > 0 then
		slot0._motionReferenceUnit = slot0._scoutList[1]
		slot0._leaderUnit = slot0._scoutList[1]

		slot0._leaderUnit:LeaderSetting()
		slot0._fleetAntiAir:SwitchHost(slot0._motionReferenceUnit)
		slot0._fleetSonar:SwitchHost(slot0._motionReferenceUnit)

		for slot7, slot8 in pairs(slot0._indieSonarList) do
			slot7:SwitchHost(slot0._motionReferenceUnit)
		end

		slot0._motionVO:UpdatePos(slot0._motionReferenceUnit)
	elseif slot0._fleetAntiAir:GetCurrentState() ~= slot0._fleetAntiAir.STATE_DISABLE then
		for slot8, slot9 in pairs(slot4) do
			slot0._motionReferenceUnit = slot8

			slot0._fleetAntiAir:SwitchHost(slot8)

			break
		end
	else
		slot0._motionReferenceUnit = slot0._mainList[1]
		slot0._leaderUnit = nil
	end

	if #slot0:GetUnitList() == 0 then
		return
	end

	slot0:DispatchEvent(slot2.Event.New(slot2.Battle.BattleEvent.REFRESH_FLEET_FORMATION))
end

slot7.init = function (slot0)
	slot0._chargeWeaponVO = slot0.Battle.BattleChargeWeaponVO.New()
	slot0._torpedoWeaponVO = slot0.Battle.BattleTorpedoWeaponVO.New()
	slot0._airAssistVO = slot0.Battle.BattleAllInStrikeVO.New()
	slot0._submarineDiveVO = slot0.Battle.BattleSubmarineFuncVO.New(slot1.SR_CONFIG.DIVE_CD)
	slot0._submarineFloatVO = slot0.Battle.BattleSubmarineFuncVO.New(slot1.SR_CONFIG.FLOAT_CD)
	slot0._submarineVOList = {
		slot0._submarineDiveVO,
		slot0._submarineFloatVO
	}
	slot0._submarineBoostVO = slot0.Battle.BattleSubmarineFuncVO.New(slot1.SR_CONFIG.BOOST_CD)
	slot0._submarineShiftVO = slot0.Battle.BattleSubmarineFuncVO.New(slot1.SR_CONFIG.SHIFT_CD)
	slot0._submarineSpecialVO = slot0.Battle.BattleSubmarineAidVO.New()

	slot0._submarineSpecialVO:SetCount(1)
	slot0._submarineSpecialVO:SetTotal(1)

	slot0._fleetAntiAir = slot0.Battle.BattleFleetAntiAirUnit.New()
	slot0._motionVO = slot0.Battle.BattleFleetMotionVO.New()
	slot0._fleetSonar = slot0.Battle.BattleFleetSonar.New(slot0)
	slot0._indieSonarList = {}
	slot0._scoutList = {}
	slot0._mainList = {}
	slot0._subList = {}
	slot0._manualSubList = {}
	slot0._manualSubBench = {}
	slot0._unitList = {}
	slot0._maxCount = 0
	slot0._blockCast = 0

	slot0:SetMotionSource()
end

slot7.appendScoutUnit = function (slot0, slot1)
	slot0._scoutList[#slot0._scoutList + 1] = slot1

	for slot6, slot7 in ipairs(slot2) do
		slot0._torpedoWeaponVO:AppendWeapon(slot7)
	end

	slot0._fleetAntiAir:AppendCrewUnit(slot1)
	slot0._fleetSonar:AppendCrewUnit(slot1)

	slot3 = 1
	slot4 = #slot0._unitList
	slot5 = {}

	while slot3 < slot4 do
		table.insert(slot5, slot3)

		slot3 = slot3 + 1
	end

	table.insert(slot5, #slot0._scoutList, slot3)
	slot0:refreshFleetFormation(slot5)
end

slot7.appendMainUnit = function (slot0, slot1)
	if #slot0._mainList == 0 then
		slot0._flagShip = slot1
	end

	slot0._mainList[#slot0._mainList + 1] = slot1

	for slot6, slot7 in ipairs(slot2) do
		slot0._chargeWeaponVO:AppendWeapon(slot7)
	end

	if #slot1:GetHiveList() > 0 then
		for slot8, slot9 in ipairs(slot4) do
			slot0._airAssistVO:AppendWeapon(slot9)
		end

		slot1:SetAirAssistList(slot4)
	end

	slot0._fleetAntiAir:AppendCrewUnit(slot1)

	slot4 = {}

	for slot8, slot9 in ipairs(slot0._unitList) do
		table.insert(slot4, slot8)
	end

	slot0:refreshFleetFormation(slot4)
end

slot7.appendSubUnit = function (slot0, slot1)
	slot0._subList[#slot0._subList + 1] = slot1

	slot1:SetMainUnitIndex(#slot0._subList)
end

slot7.FleetWarcry = function (slot0)
	slot1 = nil
	slot2 = math.random(0, 1)
	slot3 = slot0:GetScoutList()[1]

	if slot0:GetMainList()[1] == nil or slot2 == 0 then
		slot1 = slot3
	elseif slot2 == 1 then
		slot1 = slot4
	end

	slot1:DispatchVoice(slot5)
	slot1:DispatchChat(slot0.Battle.BattleDataFunction.GetWords(slot1:GetSkinID(), slot5, slot1:GetDefaultSkinID()), 2.5, "battle")
end

slot7.SubWarcry = function (slot0)
	slot0:GetSubList()[1].DispatchVoice(slot1, slot2)
	slot0.GetSubList()[1]:DispatchChat(slot0.Battle.BattleDataFunction.GetWords(slot0.GetSubList()[1].GetSkinID(slot1), slot2, slot0.GetSubList()[1].GetDefaultSkinID(slot1)), 2.5, "battle")
end

slot7.SetWeaponBlock = function (slot0, slot1)
	slot0._blockCast = slot0._blockCast + slot1
end

slot7.GetWeaponBlock = function (slot0)
	return slot0._blockCast > 0
end

slot7.CastChargeWeapon = function (slot0)
	if slot0:GetWeaponBlock() then
		return
	end

	if slot0._chargeWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_READY then
		slot1:Charge()
		slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.POINT_HIT_CHARGE, slot2))
	end
end

slot7.CancelChargeWeapon = function (slot0)
	if slot0._chargeWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_PRECAST then
		slot0:DispatchEvent(slot0.Event.New(slot0.Battle.BattleUnitEvent.POINT_HIT_CANCEL, slot2))
		slot1:CancelCharge()
	end
end

slot7.UnleashChrageWeapon = function (slot0)
	if slot0:GetWeaponBlock() then
		slot0:CancelChargeWeapon()

		return
	end

	if slot0._chargeWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_PRECAST then
		if slot1:IsStrikeMode() then
			slot0:fireChargeWeapon(slot1, true, Vector3.New(math.min(slot0._motionVO:GetPos().x + slot0.ChargeWeaponConfig.SIGHT_C, slot0._totalRightBound), 0, slot0._motionVO:GetPos().z))
		else
			slot1:CancelCharge()
		end

		slot0:DispatchEvent(slot1.Event.New(slot1.Battle.BattleUnitEvent.POINT_HIT_CANCEL, slot2))
	end
end

slot7.QuickTagChrageWeapon = function (slot0, slot1)
	if slot0:GetWeaponBlock() then
		return
	end

	if slot0._chargeWeaponVO:GetCurrentWeapon() ~= nil and slot2:GetCurrentState() == slot2.STATE_READY then
		slot2:QuickTag()
		slot2:UpdateLockList()

		if #slot2:GetLockList() <= 0 then
			slot2:CancelQuickTag()
		else
			slot0:fireChargeWeapon(slot2, slot1)
		end
	end
end

slot7.fireChargeWeapon = function (slot0, slot1, slot2, slot3)
	slot4 = slot1:GetHost()

	function slot5()
		local function slot0()
			slot0:Fire(slot0)
		end

		slot0:DispatchBlink(slot0)
	end

	if slot2 then
		if slot0._IFF == slot0.FRIENDLY_CODE then
			slot0._chargeWeaponVO:PlayCutIn(slot4, 1 / slot0.FOCUS_MAP_RATE)
		end

		slot0._chargeWeaponVO:PlayFocus(slot4, slot5)
	else
		if slot0._IFF == slot0.FRIENDLY_CODE then
			slot0._chargeWeaponVO:PlayCutIn(slot4, 1)
		end

		slot5()
	end
end

slot7.UnleashAllInStrike = function (slot0)
	if slot0:GetWeaponBlock() then
		return
	end

	if slot0._airAssistVO:GetCurrentWeapon() and slot1:GetCurrentState() == slot1.STATE_READY then
		slot2 = slot1:GetHost()

		if slot0._IFF == slot0.FRIENDLY_CODE then
			slot0._airAssistVO:PlayCutIn(slot2, 1)
		end

		slot1:CLSBullet()
		slot1:DispatchBlink()
		slot1:Fire()
	end
end

slot7.CastTorpedo = function (slot0)
	if slot0:GetWeaponBlock() then
		return
	end

	if slot0._torpedoWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_READY then
		slot1:Prepar()
	end
end

slot7.CancelTorpedo = function (slot0)
	if slot0._torpedoWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_PRECAST then
		slot1:Cancel()
	end
end

slot7.UnleashTorpedo = function (slot0)
	if slot0:GetWeaponBlock() then
		slot0:CancelTorpedo()

		return
	end

	if slot0._torpedoWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_PRECAST then
		slot1:Fire()
	end
end

slot7.QuickCastTorpedo = function (slot0)
	if slot0:GetWeaponBlock() then
		return
	end

	if slot0._torpedoWeaponVO:GetCurrentWeapon() ~= nil and slot1:GetCurrentState() == slot1.STATE_READY then
		slot1:Fire()
	end
end

slot7.Jamming = function (slot0, slot1)
	if slot1 then
		slot0._chargeWeaponVO:StartJamming()
		slot0._torpedoWeaponVO:StartJamming()
		slot0._airAssistVO:StartJamming()
	else
		slot0._chargeWeaponVO:JammingEliminate()
		slot0._torpedoWeaponVO:JammingEliminate()
		slot0._airAssistVO:JammingEliminate()
	end
end

slot7.CoupleEncourage = function (slot0)
	slot1 = {}
	slot2 = {}
	slot3 = {}
	slot4 = {}
	slot5 = {}
	slot6 = {}
	slot7 = {}

	for slot11, slot12 in ipairs(slot0._unitList) do
		slot1[slot0.GetPlayerShipModelFromID(slot13).group_type] = true
		slot2[slot14.type] = (slot2[slot12:GetTemplate().type] or 0) + 1
		slot3[slot12:GetRarity()] = (slot3[slot12.GetRarity()] or 0) + 1
		slot4[slot14.nationality] = (slot4[slot14.nationality] or 0) + 1
		slot5[slot20] = (slot5[slot1.Battle.BattleDataFunction.GetPlayerShipSkinDataFromID(slot12:GetSkinID()).illustrator] or 0) + 1

		if #slot0.GetWords(slot12:GetSkinID(), "couple_encourage", slot12:GetDefaultSkinID()) > 0 then
			slot6[slot12] = slot22
		end
	end

	slot8 = slot2.CPChatType

	for slot12, slot13 in pairs(slot6) do
		for slot17, slot18 in ipairs(slot13) do
			slot19 = slot18[1]
			slot20 = slot18[2]
			slot21 = slot18[4] or slot8.GROUP_ID
			slot22 = 0

			if slot21 == slot8.GROUP_ID then
				for slot26, slot27 in ipairs(slot19) do
					if slot1[slot27] then
						slot22 = slot22 + 1
					end
				end
			elseif slot21 == slot8.SHIP_TYPE then
				slot22 = slot2[slot19[1]]
			elseif slot21 == slot8.RARE then
				slot22 = slot3[slot19[1]]
			elseif slot21 == slot8.NATIONALITY then
				slot22 = slot4[slot19[1]]
			elseif slot21 == slot8.ILLUSTRATOR then
				slot22 = slot5[slot19[1]]
			end

			if slot22 and slot20 <= slot22 then
				slot7[#slot7 + 1] = {
					cp = slot12,
					content = slot18[3],
					linkIndex = slot17
				}
			end
		end
	end

	if #slot7 > 0 then
		slot7[math.random(#slot7)].cp:DispatchVoice(slot11)
		slot7[math.random(#slot7)].cp:DispatchChat(HXSet.hxLan(slot7[math.random(#slot7)].content), 3, "link" .. slot7[math.random(#slot7)].linkIndex)
	end
end

slot7.onUnitUpdateHP = function (slot0, slot1)
	slot2 = slot1.Dispatcher
	slot3 = slot1.Data.dHP

	for slot7, slot8 in ipairs(slot0._unitList) do
		slot8:TriggerBuff(slot0.BuffEffectType.ON_FRIENDLY_HP_RATIO_UPDATE, {
			unit = slot2,
			dHP = slot3
		})

		if slot8 ~= slot2 then
			slot8:TriggerBuff(slot0.BuffEffectType.ON_TEAMMATE_HP_RATIO_UPDATE, {
				unit = slot2,
				dHP = slot3
			})
		end
	end
end

slot7.SetSubUnitData = function (slot0, slot1)
	slot0._subUntiDataList = slot1
end

slot7.GetSubUnitData = function (slot0)
	return slot0._subUntiDataList
end

slot7.AddSubMarine = function (slot0, slot1)
	slot1:InitOxygen()
	slot0.Battle.BattleUnitPhaseSwitcher.New(slot1).SetTemplateData(slot3, slot1.GeneratePlayerSubmarinPhase(slot0._subAttackBaseLine, slot0._subRetreatBaseLine, slot1:GetAttrByName("raidDist"), function ()
		return slot0:GetRaidDuration()
	end, slot1:GetAttrByName("oxyAtkDuration")))

	slot0._unitList[#slot0._unitList + 1] = slot1
	slot0._subList[#slot0._subList + 1] = slot1

	slot1:SetFleetVO(slot0)
	slot1:RegisterEventListener(slot0, slot2.UPDATE_HP, slot0.onUnitUpdateHP)
end

slot7.AddManualSubmarine = function (slot0, slot1)
	slot0._unitList[#slot0._unitList + 1] = slot1
	slot0._manualSubList[#slot0._manualSubList + 1] = slot1
	slot0._manualSubBench[#slot0._manualSubBench + 1] = slot1
	slot0._maxCount = slot0._maxCount + 1

	slot1:InitOxygen()
	slot1:SetFleetVO(slot0)
	slot1:SetMotion(slot0._motionVO)
	slot1:RegisterEventListener(slot0, slot0.UPDATE_HP, slot0.onUnitUpdateHP)
end

slot7.GetSubList = function (slot0)
	return slot0._subList
end

slot7.ShiftManualSub = function (slot0)
	slot1 = nil

	if slot0._manualSubUnit then
		for slot6, slot7 in ipairs(slot2) do
			if slot7:IsAttacking() then
				slot0:CancelTorpedo()
			end

			slot0._torpedoWeaponVO:RemoveWeapon(slot7)
		end

		if slot0._manualSubUnit:IsAlive() then
			table.insert(slot0._manualSubBench, slot0._manualSubUnit)
		end

		slot1 = slot0._motionVO:GetPos():Clone()
	else
		slot1 = slot0._manualSubList[1]:GetPosition():Clone()
	end

	slot0._manualSubUnit = table.remove(slot0._manualSubBench, 1)
	slot0._scoutList[1] = slot0._manualSubUnit
	slot2 = {}

	for slot6, slot7 in ipairs(slot0._manualSubBench) do
		for slot11, slot12 in ipairs(slot0._unitList) do
			if slot12 == slot7 then
				table.insert(slot2, slot11)

				break
			end
		end
	end

	for slot6, slot7 in ipairs(slot0._unitList) do
		if slot7 == slot0._manualSubUnit then
			table.insert(slot2, 1, slot6)

			break
		end
	end

	slot0:refreshFleetFormation(slot2)
	slot0._manualSubUnit:SetMainUnitStatic(false)
	slot0._manualSubUnit:SetPosition(slot1)
	slot0:UpdateMotion()
	slot0._submarineSpecialVO:SetUseable(false)

	for slot7, slot8 in pairs(slot3) do
		if slot8:IsSubmarineSpecial() then
			slot0._submarineSpecialVO:SetCount(1)
			slot0._submarineSpecialVO:SetUseable(true)

			break
		end
	end

	slot0:ChangeSubmarineState(slot0.Battle.OxyState.STATE_FREE_DIVE)
	slot0._torpedoWeaponVO:Reset()

	for slot8, slot9 in ipairs(slot4) do
		if slot9:GetCurrentState() ~= slot9.STATE_OVER_HEAT then
			slot0._torpedoWeaponVO:AppendWeapon(slot9)
		end
	end

	for slot8, slot9 in ipairs(slot4) do
		if slot9:GetCurrentState() == slot9.STATE_OVER_HEAT then
			slot0._torpedoWeaponVO:AppendWeapon(slot9)
		end
	end

	for slot8, slot9 in ipairs(slot0._manualSubBench) do
		slot9:SetPosition(slot1.SUB_BENCH_POS[slot8])
		slot9:SetMainUnitStatic(true)
		slot9:ChangeOxygenState(slot0.Battle.OxyState.STATE_FREE_BENCH)
	end

	slot0._submarineShiftVO:ResetCurrent()

	if #slot0._manualSubBench == 0 then
		slot0._submarineShiftVO:SetActive(false)
	end
end

slot7.ChangeSubmarineState = function (slot0, slot1, slot2)
	slot0._manualSubUnit:ChangeOxygenState(slot1)

	if slot2 then
		for slot6, slot7 in ipairs(slot0._submarineVOList) do
			slot7:ResetCurrent()
		end

		slot3 = slot0._submarineShiftVO:GetMax() - slot0._submarineShiftVO:GetCurrent()

		if slot0._submarineShiftVO:IsOverLoad() and slot0.SR_CONFIG.DIVE_CD < slot3 then
		else
			slot0._submarineShiftVO:SetMax(slot0.SR_CONFIG.DIVE_CD)
			slot0._submarineShiftVO:ResetCurrent()
		end
	end

	slot0:DispatchEvent(slot1.Event.New(slot2.MANUAL_SUBMARINE_SHIFT, {
		state = slot1
	}))
end

slot7.SubmarinBoost = function (slot0)
	slot0._manualSubUnit:Boost(Vector3.right, slot0.SR_CONFIG.BOOST_SPEED, slot0.SR_CONFIG.BOOST_DECAY, slot0.SR_CONFIG.BOOST_DURATION, slot0.SR_CONFIG.BOOST_DECAY_STAMP)
	slot0._submarineBoostVO:ResetCurrent()
end

slot7.UnleashSubmarineSpecial = function (slot0)
	if slot0:GetWeaponBlock() then
		return
	end

	slot0._submarineSpecialVO:Cast()
	slot0._manualSubUnit:TriggerBuff(slot0.BuffEffectType.ON_SUBMARINE_FREE_SPECIAL)
end

slot7.AppendIndieSonar = function (slot0, slot1, slot2)
	slot3 = slot0.Battle.BattleIndieSonar.New(slot0, slot1, slot2)

	slot3:SwitchHost(slot0._motionReferenceUnit)

	slot0._indieSonarList[slot3] = true

	slot3:Detect()
end

slot7.RemoveIndieSonar = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0._indieSonarList) do
		if slot1 == slot5 then
			slot0._indieSonarList[slot5] = nil

			break
		end
	end
end

return
