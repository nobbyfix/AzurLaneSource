ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = class("BattleBuffAddFleetBuff", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffAddFleetBuff = slot2
slot2.__name = "BattleBuffAddFleetBuff"

slot2.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

slot2.SetArgs = function (slot0, slot1, slot2)
	slot0._level = slot2:GetLv()
	slot0._fleetBuffID = slot0._tempData.arg_list.fleet_buff_id
end

slot2.onAttach = function (slot0, slot1, slot2)
	if slot1:GetUnitType() ~= slot0.UnitType.PLAYER_UNIT then
		return
	end

	slot1:GetFleetVO():AttachFleetBuff(slot1.Battle.BattleFleetBuffUnit.New(slot0._fleetBuffID))
end

slot2.onRemove = function (slot0, slot1, slot2)
	if slot1:GetUnitType() ~= slot0.UnitType.PLAYER_UNIT then
		return
	end

	slot1:GetFleetVO():RemoveFleetBuff(slot0._fleetBuffID)
end

return
