ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = class("BattleDisposableTorpedoUnit", ys.Battle.BattleManualTorpedoUnit)
ys.Battle.BattleDisposableTorpedoUnit = slot2
slot2.__name = "BattleDisposableTorpedoUnit"

slot2.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
end

slot2.EnterCoolDown = function (slot0)
	return
end

slot2.OverHeat = function (slot0)
	slot0.super.OverHeat(slot0)
	slot0._playerTorpedoVO:RemoveWeapon(slot0)
	slot0._playerTorpedoVO:DispatchOverLoadChange()
end

return
