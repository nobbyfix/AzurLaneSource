ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleUnitEvent
slot3 = ys.Battle.BattleAttr
slot4 = class("BattlePointHitWeaponUnit", ys.Battle.BattleWeaponUnit)
ys.Battle.BattlePointHitWeaponUnit = slot4
slot4.__name = "BattlePointHitWeaponUnit"

slot4.Ctor = function (slot0)
	slot0.super.Ctor(slot0)

	slot0._strikePoint = nil
	slot0._strikeRequire = 1
	slot0._strikeMode = false
end

slot4.DispatchBlink = function (slot0, slot1)
	slot0:DispatchEvent(slot0.Event.New(slot1.CHARGE_WEAPON_FINISH, slot2))
end

slot4.RemoveAllLock = function (slot0)
	for slot4, slot5 in ipairs(slot0._lockList) do
		slot0:UnlockUnit(slot5)
	end

	slot0._lockList = {}

	if slot0._currentLockUnit ~= nil then
		slot0:UnlockUnit(slot0._currentLockUnit)
	end

	slot0._currentLockUnit = nil
end

slot4.SetTemplateData = function (slot0, slot1)
	slot0.super.SetTemplateData(slot0, slot1)

	slot0._maxLock = slot0._tmpData.charge_param.maxLock
	slot0._lockRequiredTime = slot0._tmpData.charge_param.lockTime
end

slot4.createMajorEmitter = function (slot0, slot1, slot2)
	slot1.super.createMajorEmitter(slot0, slot1, slot2, slot1.EMITTER_NORMAL, function (slot0, slot1, slot2, slot3)
		slot4, slot5 = nil
		slot6 = slot0._bulletList[slot1]

		if slot0._strikePoint then
			slot5 = slot0._strikePoint
			slot4 = slot0:SpawnPointBullet(slot6, slot0._strikePoint)
		else
			slot0._lockList[#slot0._lockList] = nil

			if slot0._lockList[#slot0._lockList] == nil then
				return
			end

			slot4 = slot0:Spawn(slot6, slot7, slot0.INTERNAL)
			slot5 = slot7:GetPosition()

			slot0:UnlockUnit(slot7)
		end

		slot4:SetOffsetPriority(slot3)
		slot4:SetShiftInfo(slot0, slot1)
		slot4:SetRotateInfo(slot5, 0, 0)
		slot2.Battle.BattleVariable.AddExempt(slot4:GetSpeedExemptKey(), slot4:GetIFF(), slot2.Battle.BattleConfig.SPEED_FACTOR_FOCUS_CHARACTER)
		slot0:DispatchBulletEvent(slot4)
	end, function ()
		slot0._strikePoint = nil

		slot0:RemoveAllLock()
	end)
end

slot4.SetPlayerChargeWeaponVO = function (slot0, slot1)
	slot0._playerChargeWeaponVo = slot1
end

slot4.Charge = function (slot0)
	slot0._currentState = slot0.STATE_PRECAST
	slot0._lockList = {}

	slot0:DispatchEvent(slot0.Event.New(slot1.POINT_HIT_CHARGE, slot1))

	slot0._strikeMode = true
end

slot4.CancelCharge = function (slot0)
	if slot0._currentState ~= slot0.STATE_PRECAST then
		return
	end

	slot0:RemoveAllLock()

	slot0._currentState = slot0.STATE_READY

	slot0:DispatchEvent(slot0.Event.New(slot1.POINT_HIT_CANCEL, slot1))

	slot0._strikeMode = nil
end

slot4.QuickTag = function (slot0)
	slot0._currentState = slot0.STATE_PRECAST
	slot0._lockList = {}

	slot0:updateMovementInfo()

	slot1 = slot0:Tracking()

	while #slot0._lockList < slot0._maxLock and slot1 ~= nil do
		slot0._lockList[#slot0._lockList + 1] = slot1
		slot1 = slot0:Tracking()
	end
end

slot4.CancelQuickTag = function (slot0)
	slot0._currentState = slot0.STATE_READY
	slot0._lockList = {}
end

slot4.Update = function (slot0, slot1)
	slot0:UpdateReload()
end

slot4.UpdateLockList = function (slot0)
	for slot4, slot5 in ipairs(slot0._lockList) do
		if not slot5:IsAlive() then
			slot0:UnlockUnit(slot5)
			slot0.Battle.BattlePlayerWeaponVO.deleteElementFromArray(slot5, slot0._lockList)
		end
	end
end

slot4.Fire = function (slot0, slot1)
	if slot0._currentState ~= slot0.STATE_PRECAST then
		return
	end

	slot0._strikePoint = slot1
	slot0._strikeMode = false

	slot0.super.Fire(slot0)
end

slot4.DoAttack = function (slot0, slot1)
	slot0.Battle.PlayBattleSFX(slot0._tmpData.fire_sfx)
	slot0:DispatchEvent(slot0.Event.New(slot1.CHARGE_WEAPON_FIRE, {
		weapon = slot0
	}))

	slot3 = {}
	slot4 = #slot0._lockList

	while slot4 > 0 do
		slot3[#slot3 + 1] = slot0._lockList[slot4]
		slot4 = slot4 - 1
	end

	slot0._lockList = slot3

	slot0:TriggerBuffOnSteday()

	for slot8, slot9 in ipairs(slot0._majorEmitterList) do
		slot9:Ready()
	end

	for slot8, slot9 in ipairs(slot0._majorEmitterList) do
		slot9:Fire(slot1, slot0:GetDirection(), slot0:GetAttackAngle())
		slot9:SetTimeScale(false)
	end

	slot0:DispatchEvent(slot0.Event.New(slot1.MANUAL_WEAPON_FIRE, {}))
	slot0:TriggerBuffOnFire()
	slot0.Battle.BattleCameraUtil.GetInstance():StartShake(pg.shake_template[slot2.ShakeType.FIRE])
end

slot4.TriggerBuffOnReady = function (slot0)
	slot0._host:TriggerBuff(slot0.Battle.BattleConst.BuffEffectType.ON_CHARGE_READY, {})
end

slot4.Spawn = function (slot0, slot1, slot2, slot3)
	slot4 = nil

	if slot2 == nil then
		slot0:updateMovementInfo()
		slot0:setBulletSkin(slot5, slot1)
		slot0:TriggerBuffWhenSpawn(slot0._dataProxy:CreateBulletUnit(slot1, slot0._host, slot0, (slot0:TrackingRandom(slot0:GetFilteredList()) ~= nil or Vector3.zero) and slot2:GetPosition() and slot2:GetPosition()))

		if slot3 == slot0.INTERNAL then
			slot5:SetDamageEnhance(1 + slot0._host:GetAttrByName("initialEnhancement"))
			slot0:TriggerBuffWhenSpawn(slot5, slot0.BuffEffectType.ON_INTERNAL_BULLET_CREATE)
		end
	end

	return slot5
end

slot4.SpawnPointBullet = function (slot0, slot1, slot2)
	slot3 = slot0._dataProxy:CreateBulletUnit(slot1, slot0._host, slot0, slot2)

	slot0:setBulletSkin(slot3, slot1)
	slot3:SetDamageEnhance(slot0.Battle.BattleConfig.ChargeWeaponConfig.Enhance + slot0._host:GetAttrByName("initialEnhancement") + slot0._host:GetAttrByName("manualEnhancement"))
	slot0:TriggerBuffWhenSpawn(slot3)
	slot0:TriggerBuffWhenSpawn(slot3, slot1.BuffEffectType.ON_INTERNAL_BULLET_CREATE)
	slot0:TriggerBuffWhenSpawn(slot3, slot1.BuffEffectType.ON_MANUAL_BULLET_CREATE)

	return slot3
end

slot4.TriggerBuffOnFire = function (slot0)
	slot0._host:TriggerBuff(slot0.BuffEffectType.ON_CHARGE_FIRE, {})
end

slot4.InitialCD = function (slot0)
	slot0.super.InitialCD(slot0)
	slot0._playerChargeWeaponVo:Deduct(slot0)
	slot0._playerChargeWeaponVo:Charge(slot0)
end

slot4.EnterCoolDown = function (slot0)
	slot0.super.EnterCoolDown(slot0)
	slot0._playerChargeWeaponVo:Charge(slot0)
end

slot4.OverHeat = function (slot0)
	slot0.super.OverHeat(slot0)
	slot0._playerChargeWeaponVo:Deduct(slot0)
end

slot4.GetLockRequiredTime = function (slot0)
	return slot0._lockRequiredTime
end

slot4.GetMinAngle = function (slot0)
	return slot0:GetAttackAngle()
end

slot4.GetLockList = function (slot0)
	return slot0._lockList
end

slot4.GetFilteredList = function (slot0)
	return slot0:filterEnemyUnitType(slot0:filterTagCount(slot0.super.GetFilteredList(slot0)))
end

slot4.filterTagCount = function (slot0, slot1)
	slot2 = {}
	slot3 = slot0._maxLock

	for slot7, slot8 in ipairs(slot1) do
		if slot8:GetSingleWeaponTagCount(slot0) < slot3 then
			slot3 = slot9
		elseif slot9 == slot3 then
			slot2[#slot2 + 1] = slot8
		end
	end

	return slot2
end

slot4.filterEnemyUnitType = function (slot0, slot1)
	slot2 = {}
	slot3 = {}
	slot4 = 0

	for slot8, slot9 in ipairs(slot1) do
		if slot9:GetTemplate().battle_unit_type == nil then
			slot3[#slot3 + 1] = slot9
		elseif slot4 < slot10 then
			slot4 = slot10
		elseif slot4 == slot10 then
			slot2[#slot2 + 1] = slot9
		end
	end

	for slot8, slot9 in ipairs(slot3) do
		slot2[#slot2 + 1] = slot9
	end

	return slot2
end

slot4.handleCoolDown = function (slot0)
	slot0._currentState = slot0.STATE_READY

	slot0._playerChargeWeaponVo:Plus(slot0)
	slot0:DispatchEvent(slot0.Event.New(slot1.MANUAL_WEAPON_READY, {}))
	slot0:TriggerBuffOnReady()

	slot0._CDstartTime = nil
end

slot4.FlushReloadRequire = function (slot0)
	if slot0.super.FlushReloadRequire(slot0) then
		return true
	end

	slot0._playerChargeWeaponVo:RefreshReloadingBar()
end

slot4.QuickCoolDown = function (slot0)
	if slot0._currentState == slot0.STATE_OVER_HEAT then
		slot0._currentState = slot0.STATE_READY

		slot0._playerChargeWeaponVo:InstantCoolDown(slot0)
		slot0:DispatchEvent(slot0.Event.New(slot1.MANUAL_WEAPON_INSTANT_READY, {}))

		slot0._CDstartTime = nil
	end
end

slot4.IsStrikeMode = function (slot0)
	return slot0._strikeMode
end

return
