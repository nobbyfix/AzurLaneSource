ys = ys or {}
slot1 = ys.Battle.BattleConfig.TorpedoCFG
slot2 = class("BattleTorpedoWeaponVO", ys.Battle.BattlePlayerWeaponVO)
ys.Battle.BattleTorpedoWeaponVO = slot2
slot2.__name = "BattleTorpedoWeaponVO"

function slot2.Ctor(slot0)
	uv0.super.Ctor(slot0, uv1.GCD)
end

function slot2.AppendWeapon(slot0, slot1)
	uv0.super.AppendWeapon(slot0, slot1)
	slot1:SetPlayerTorpedoWeaponVO(slot0)
end
