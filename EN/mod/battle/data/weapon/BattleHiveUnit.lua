ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.BattleHiveUnit = class("BattleHiveUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattleHiveUnit.__name = "BattleHiveUnit"

function ys.Battle.BattleHiveUnit.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.BattleHiveUnit.Update(slot0)
	slot0:UpdateReload()
	slot0:updateMovementInfo()

	if slot0._currentState == slot0.STATE_READY then
		if slot0._host:GetUnitType() ~= uv0.UnitType.PLAYER_UNIT then
			if slot0._preCastInfo.time == nil then
				slot0._currentState = slot0.STATE_PRECAST_FINISH
			else
				slot0:PreCast()
			end
		else
			slot1 = nil

			if #((not slot0._antiSub or uv1.Battle.BattleTargetChoise.TargetDetectedUnit(nil, nil, uv1.Battle.BattleTargetChoise.TargetDiveState(nil, nil, uv1.Battle.BattleTargetChoise.TargetAllFoe(slot0._host)))) and uv1.Battle.BattleTargetChoise.TargetAircraftHarm(slot0._host)) > 0 then
				slot0._currentState = slot0.STATE_PRECAST_FINISH
			end
		end
	end

	if slot0._currentState == slot0.STATE_PRECAST_FINISH then
		slot0:updateMovementInfo()
		slot0:Fire()
	end
end

function ys.Battle.BattleHiveUnit.SetTemplateData(slot0, slot1)
	uv0.super.SetTemplateData(slot0, slot1)

	slot0._antiSub = table.contains(slot1.search_condition, uv1.OXY_STATE.DIVE)
end

function ys.Battle.BattleHiveUnit.Fire(slot0)
	slot0:DispatchGCD()

	slot0._currentState = slot0.STATE_ATTACK

	if slot0._tmpData.action_index == "" then
		slot0:DoAttack()
	else
		slot0:DispatchFireEvent(nil, slot0._tmpData.action_index)
	end

	return true
end

function ys.Battle.BattleHiveUnit.createMajorEmitter(slot0, slot1, slot2, slot3, slot4, slot5)
	uv0.super.createMajorEmitter(slot0, slot1, slot2, nil, function (slot0, slot1, slot2, slot3, slot4)
		uv0._dataProxy:CreateAircraft(uv0._host, uv0._tmpData.id, uv0:GetPotential(), uv0._skinID):AddCreateTimer(Vector3(math.cos(slot7), 0, math.sin(slot7)), 1.5)
	end, nil)
end

function ys.Battle.BattleHiveUnit.SingleFire(slot0, slot1, slot2)
	slot0._tempEmitterList = {}

	for slot8, slot9 in ipairs(slot0._tmpData.barrage_ID) do
		slot0._tempEmitterList[#slot0._tempEmitterList + 1] = uv0.Battle[slot2 or uv1.EMITTER_SHOTGUN].New(function (slot0, slot1, slot2, slot3, slot4)
			slot5 = uv0._dataProxy:CreateAircraft(uv0._host, uv0._tmpData.id, uv0:GetPotential(), uv0._skinID)

			uv1.Battle.BattleVariable.AddExempt(slot5:GetSpeedExemptKey(), slot5:GetIFF(), uv1.Battle.BattleConfig.SPEED_FACTOR_FOCUS_CHARACTER)
			slot5:AddCreateTimer(Vector3(math.cos(slot7), 0, math.sin(slot7)), 1)
		end, function ()
			for slot3, slot4 in ipairs(uv0._tempEmitterList) do
				if slot4:GetState() ~= slot4.STATE_STOP then
					return
				end
			end

			for slot3, slot4 in ipairs(uv0._tempEmitterList) do
				slot4:Destroy()
			end

			uv0._tempEmitterList = nil
		end, slot9)
	end

	for slot8, slot9 in ipairs(slot0._tempEmitterList) do
		slot9:Ready()
		slot9:Fire(slot1, slot0:GetDirection(), slot0:GetAttackAngle())
		slot9:SetTimeScale(false)
	end
end
