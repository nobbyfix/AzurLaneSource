ys = ys or {}
ys.Battle.BattleFleetBuffEffect = class("BattleFleetBuffEffect")
ys.Battle.BattleFleetBuffEffect.__name = "BattleFleetBuffEffect"
slot1 = ys.Battle.BattleUnitEvent

ys.Battle.BattleFleetBuffEffect.Ctor = function (slot0, slot1)
	slot0._tempData = Clone(slot1)
	slot0._type = slot0._tempData.type

	slot0:SetActive()
end

ys.Battle.BattleFleetBuffEffect.SetArgs = function (slot0, slot1, slot2)
	slot0._fleetVO = slot1
	slot0._fleetBuff = slot2
end

ys.Battle.BattleFleetBuffEffect.Trigger = function (slot0, slot1, slot2, slot3, slot4)
	slot0[slot1](slot0, slot2, slot3, slot4)
end

ys.Battle.BattleFleetBuffEffect.onAttach = function (slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

ys.Battle.BattleFleetBuffEffect.onRemove = function (slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

ys.Battle.BattleFleetBuffEffect.onUpdate = function (slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

ys.Battle.BattleFleetBuffEffect.onStack = function (slot0, slot1, slot2)
	slot0:onTrigger(slot1, slot2)
end

ys.Battle.BattleFleetBuffEffect.getTargetList = function (slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = slot1:GetUnitList()[1]

	for slot9, slot10 in ipairs(slot2) do
		slot4 = slot0.Battle.BattleTargetChoise[slot10](slot5, slot3, slot4)
	end

	return slot4
end

ys.Battle.BattleFleetBuffEffect.IsHappen = function (slot0, slot1)
	return math.random(100) < slot1
end

ys.Battle.BattleFleetBuffEffect.IsActive = function (slot0)
	return slot0._isActive
end

ys.Battle.BattleFleetBuffEffect.SetActive = function (slot0)
	slot0._isActive = true
end

ys.Battle.BattleFleetBuffEffect.NotActive = function (slot0)
	slot0._isActive = false
end

ys.Battle.BattleFleetBuffEffect.Clear = function (slot0)
	return
end

ys.Battle.BattleFleetBuffEffect.Dispose = function (slot0)
	return
end

return
