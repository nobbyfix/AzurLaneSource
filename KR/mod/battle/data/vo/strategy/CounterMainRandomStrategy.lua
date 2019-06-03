ys = ys or {}
slot1 = ys.Battle.BattleFormulas
slot2 = ys.Battle.BattleConfig
ys.Battle.CounterMainRandomStrategy = class("CounterMainRandomStrategy", ys.Battle.RandomStrategy)
ys.Battle.CounterMainRandomStrategy.__name = "CounterMainRandomStrategy"
ys.Battle.CounterMainRandomStrategy.FIX_FRONT = 0.5

function ys.Battle.CounterMainRandomStrategy.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)
end

function ys.Battle.CounterMainRandomStrategy.GetStrategyType(slot0)
	return uv0.Battle.BattleJoyStickAutoBot.COUNTER_MAIN
end

function ys.Battle.CounterMainRandomStrategy.generateTargetPoint(slot0)
	for slot6, slot7 in pairs(slot0._foeShipList) do
		slot1 = math.min(slot8, slot0._upperBound)
		slot2 = math.max(slot7:GetPosition().z, slot0._lowerBound)
	end

	if slot0._fleetVO:GetIFF() == uv1.FRIENDLY_CODE then
		slot4 = 1 - uv0.FIX_FRONT
		slot5 = 1 - slot0._fleetVO:GetLeaderPersonality().rear_rate
	end

	slot10 = nil

	return Vector3(math.random(slot7, slot6), 0, math.random(slot9, slot8))
end
