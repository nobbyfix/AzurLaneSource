ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleBulletEvent
ys.Battle.BattleShrapnelBulletUnit = class("BattleShrapnelBulletUnit", ys.Battle.BattleBulletUnit)
ys.Battle.BattleShrapnelBulletUnit.__name = "BattleShrapnelBulletUnit"
ys.Battle.BattleShrapnelBulletUnit.STATE_NORMAL = "normal"
ys.Battle.BattleShrapnelBulletUnit.STATE_SPLIT = "split"
ys.Battle.BattleShrapnelBulletUnit.STATE_SPIN = "spin"

ys.Battle.BattleShrapnelBulletUnit.Ctor = function (slot0, slot1, slot2)
	slot0.super.Ctor(slot0, slot1, slot2)
	slot0:ChangeShrapnelState(slot0.STATE_NORMAL)
end

ys.Battle.BattleShrapnelBulletUnit.Hit = function (slot0, slot1, slot2)
	slot0.super.Hit(slot0, slot1, slot2)

	slot0._pierceCount = slot0._pierceCount - 1
end

ys.Battle.BattleShrapnelBulletUnit.Update = function (slot0, slot1)
	if slot0._currentState == slot0.STATE_NORMAL then
		slot0.super.Update(slot0, slot1)

		if slot0._verticalSpeed ~= 0 and slot2 * slot0._verticalSpeed < 0 then
			slot0:ChangeShrapnelState(slot0.STATE_SPLIT)
		end
	elseif slot0._currentState == slot0.STATE_SPIN and (not slot0._tempData.extra_param.lastTime or slot0._tempData.extra_param.lastTime < slot1 - slot0._spinStartTime) then
		slot0:ChangeShrapnelState(slot0.STATE_SPLIT)
	end
end

ys.Battle.BattleShrapnelBulletUnit.ChangeShrapnelState = function (slot0, slot1)
	if slot0._currentState == slot0.STATE_SPLIT or slot0._currentState == slot1 then
		return
	end

	slot0._currentState = slot1

	if slot0._currentState == slot0.STATE_SPIN then
		slot0._spinStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	elseif slot0._currentState == slot0.STATE_SPLIT then
		slot0:DispatchEvent(slot1.Event.New(slot2.SPLIT, {}))
	end
end

ys.Battle.BattleShrapnelBulletUnit.IsOutRange = function (slot0, slot1)
	if slot0._currentState == slot0.STATE_NORMAL then
		return slot0.super.IsOutRange(slot0, slot1)
	else
		return false
	end
end

ys.Battle.BattleShrapnelBulletUnit.SetSrcHost = function (slot0, slot1)
	slot0._srcHost = slot1
end

ys.Battle.BattleShrapnelBulletUnit.GetSrcHost = function (slot0)
	return slot0._srcHost
end

ys.Battle.BattleShrapnelBulletUnit.GetShrapnelParam = function (slot0)
	return slot0._tempData.extra_param
end

ys.Battle.BattleShrapnelBulletUnit.GetCurrentState = function (slot0)
	return slot0._currentState
end

ys.Battle.BattleShrapnelBulletUnit.SetSpawnPosition = function (slot0, slot1)
	slot0.super.SetSpawnPosition(slot0, slot1)

	if slot0:GetTemplate().extra_param.flare then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-48, warpins: 1 ---
		slot3 = Vector3.Distance(slot2, pg.Tool.FilterY(slot0._explodePos))
		slot6 = slot1.Battle.BattleDataFunction.GetBulletTmpDataFromID(slot4).hit_type.time
		slot7 = math.abs
		slot8 = slot1.Battle.BattleDataFunction.GetBulletTmpDataFromID(slot4).extra_param.gravity or -0.0005
		slot0._convertedVelocity = math.sqrt((-0.5 * slot0._gravity * slot3 * slot3) / (0.5 * slot7(slot8) * (slot1.Battle.BattleDataFunction.GetBulletTmpDataFromID(slot4).hit_type.time * slot1.Battle.BattleConfig.calcFPS)^2 - slot0._spawnPos.y))
		slot0._verticalSpeed = (0.5 * slot7(slot8) * (slot1.Battle.BattleDataFunction.GetBulletTmpDataFromID(slot4).hit_type.time * slot1.Battle.BattleConfig.calcFPS)^2 - slot0._spawnPos.y) / (slot3 / slot0._convertedVelocity) - 0.5 * slot0._gravity * slot3 / slot0._convertedVelocity
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 49-49, warpins: 1 ---
		slot8 = -0.0005
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 50-80, warpins: 2 ---
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 81-83, warpins: 1 ---
		if slot0._convertedVelocity ~= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 84-107, warpins: 1 ---
			slot0._verticalSpeed = slot0:GetTemplate().extra_param.launchVrtSpeed or (slot0._explodePos.y - slot0._spawnPos.y) / (Vector3.Distance(slot2, slot0._explodePos) / slot0._convertedVelocity) - 0.5 * slot0._gravity * Vector3.Distance(slot2, slot0._explodePos) / slot0._convertedVelocity
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #1 108-112, warpins: 1 ---
			slot6 = (slot0._explodePos.y - slot0._spawnPos.y) / (Vector3.Distance(slot2, slot0._explodePos) / slot0._convertedVelocity) - 0.5 * slot0._gravity * Vector3.Distance(slot2, slot0._explodePos) / slot0._convertedVelocity
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 113-113, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #0 ---



	end
end

ys.Battle.BattleShrapnelBulletUnit.GetExplodePostion = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._explodePos
	--- END OF BLOCK #0 ---



end

ys.Battle.BattleShrapnelBulletUnit.SetExplodePosition = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0._explodePos = Clone(slot1)
	slot0._explodePos.y = slot0.BombDetonateHeight

	return
	--- END OF BLOCK #0 ---



end

return
