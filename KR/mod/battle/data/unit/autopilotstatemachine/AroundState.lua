ys = ys or {}
ys.Battle.AroundState = class("AroundState", ys.Battle.IPilotState)
ys.Battle.AroundState.__name = "AroundState"
ys.Battle.AroundState.AROUND_TYPE_STAY = "stay"

function ys.Battle.AroundState.Ctor(slot0, slot1)
	slot0._stateName = uv0.Battle.IPilotState.STATE_AROUND

	uv0.Battle.AroundState.super.Ctor(slot0, slot1)
end

function ys.Battle.AroundState.CalculateDirection(slot0, slot1, slot2)
	slot3 = nil
	slot4 = Vector3.zero

	if slot0._trailParam.type == slot0.AROUND_TYPE_STAY then
		slot4 = slot0.Stay(slot1, (slot0._referenceTarget == nil or slot0._referenceTarget:GetPosition()) and (slot0._referencePoint == nil or slot0._referencePoint) and slot1, slot0._trailParam)
	elseif slot0._trailParam.type == "circle" then
		slot4 = slot0.Circle(slot1, slot3, slot2, slot0._trailParam)
	elseif slot0._trailParam.type == "random" then
		slot4 = slot0:Random(slot1, slot3, slot0._transParam.random)
	end

	return slot4
end

function ys.Battle.AroundState.ParseTransitionParam(slot0)
	slot0._trailParam = slot0._transParam.trail

	return uv0.Battle.AroundState.super.ParseTransitionParam(slot0)
end

function ys.Battle.AroundState.Stay(slot0, slot1, slot2)
	slot5 = nil

	return (Vector3.SqrDistance(slot0, slot1) >= slot2.distance * slot2.distance or uv0.Battle.AroundState.KeepHorizontal(slot0, slot1)) and (slot1 - slot0) / math.sqrt(slot3)
end

function ys.Battle.AroundState.Circle(slot0, slot1, slot2, slot3)
	slot4 = slot3.radius
	slot6 = 0.05
	slot7 = 0.15

	if slot2:EqualZero() then
		return (slot1 - slot0) / Vector3.Distance(slot1, slot0)
	end

	if slot4 < slot5 then
		return (slot1 - slot0) / slot5
	end

	return Vector3(Vector3((slot1 - slot0) / slot5.z, 0, -(slot1 - slot0) / slot5.x).x + Vector3((slot1 - slot0) / slot5.z, 0, -(slot1 - slot0) / slot5.x).z * slot6 + (slot1.x - slot0.x) / distance * slot7, 0, Vector3((slot1 - slot0) / slot5.z, 0, -(slot1 - slot0) / slot5.x).z - Vector3((slot1 - slot0) / slot5.z, 0, -(slot1 - slot0) / slot5.x).x * slot6 + (slot1.z - slot0.z) / distance * slot7).normalized
end

function ys.Battle.AroundState.Random(slot0, slot1, slot2, slot3)
	slot0._moveCount = slot0._moveCount or 0

	if slot3.stopCount and slot0._stopCount and slot0._stopCount < slot3.stopCount then
		slot0._stopCount = slot0._stopCount + 1

		return Vector3.zero
	end

	if Vector3.SqrDistance(slot1, Vector3(slot2.x, 0, slot2.z)) < (slot3.distance or 1) * (slot3.distance or 1) or (slot0._randomCount or 0) > 30 then
		slot0._referencePoint = uv0.Battle.BattleFormulas.RandomPosNull(slot3)
		slot0._randomCount = 0

		if slot3.moveCount and slot0._moveCount < slot3.moveCount then
			-- Nothing
		else
			slot0._stopCount = 0
			slot0._moveCount = 0
		end

		return Vector3.zero
	else
		if slot0._randomLastPos == slot1 then
			slot0._randomCount = slot6 + 1
		end

		slot0._randomLastPos = slot1
		slot0._moveCount = slot0._moveCount + 1

		return (slot2 - slot1) / math.sqrt(slot4)
	end
end

function ys.Battle.AroundState.KeepHorizontal(slot0, slot1)
	if slot1.z - slot0.z > 1 then
		return Vector3(0, 0, 1)
	elseif slot0.z - slot1.z > 1 then
		return Vector3(0, 0, -1)
	else
		return uv0.Battle.AroundState.FaceTo(slot0, slot1)
	end
end

function ys.Battle.AroundState.FaceTo(slot0, slot1)
	if slot0.x < slot1.x then
		return Vector3(1e-06, 0, 0)
	elseif slot1.x < slot0.x then
		return Vector3(-1e-06, 0, 0)
	elseif math.random() > 0.5 then
		return Vector3(1, 0, 0)
	else
		return Vector3(-1, 0, 0)
	end
end
