ys = ys or {}
ys.Battle.BattleBuffBulletPierce = class("BattleBuffBulletPierce", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffBulletPierce.__name = "BattleBuffBulletPierce"

function ys.Battle.BattleBuffBulletPierce.Ctor(slot0, slot1)
	uv0.Battle.BattleBuffBulletPierce.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffBulletPierce.SetArgs(slot0, slot1, slot2)
	slot0._number = slot0._tempData.arg_list.number
	slot0._rate = slot0._tempData.arg_list.rate
	slot0._bulletType = slot0._tempData.arg_list.bulletType or 0
end

function ys.Battle.BattleBuffBulletPierce.onBulletCreate(slot0, slot1, slot2, slot3)
	if slot0:IsHappen(tonumber(slot0._rate)) and (slot0._bulletType == slot3._bullet._tempData.type or slot0._bulletType == 0) then
		slot3._bullet._pierceCount = slot0._number
	end
end
