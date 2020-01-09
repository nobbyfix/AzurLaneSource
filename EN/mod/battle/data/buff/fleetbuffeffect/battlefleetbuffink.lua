ys = ys or {}
ys.Battle.BattleFleetBuffInk = class("BattleFleetBuffInk", ys.Battle.BattleFleetBuffEffect)
ys.Battle.BattleFleetBuffInk.__name = "BattleFleetBuffInk"

ys.Battle.BattleFleetBuffInk.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)
end

ys.Battle.BattleFleetBuffInk.onAttach = function (slot0, slot1, slot2)
	slot1:Blinding(true)
	slot1:SetWeaponBlock(1)
end

ys.Battle.BattleFleetBuffInk.onRemove = function (slot0, slot1, slot2)
	slot1:Blinding(false)
	slot1:SetWeaponBlock(-1)
end

return
