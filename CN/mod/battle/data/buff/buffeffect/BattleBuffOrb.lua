ys = ys or {}
slot1 = class("BattleBuffOrb", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffOrb = slot1
slot1.__name = "BattleBuffOrb"

function slot1.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)
end

function slot1.SetArgs(slot0, slot1, slot2)
	slot0._buffID = slot0._tempData.arg_list.buff_id
	slot0._rant = slot0._tempData.arg_list.rant or 10000
	slot0._level = slot3.level or 1
	slot0._type = slot3.type
end

function slot1.onTrigger(slot0, slot1, slot2, slot3)
	if slot0._type and slot3._bullet:GetTemplate().type ~= slot0._type then
		return
	end

	slot0:attachOrb(slot4)
	uv0.super.onTrigger(slot0, slot1, slot2, slot3)
end

function slot1.attachOrb(slot0, slot1)
	slot1:AppendAttachBuff({
		buff_id = slot0._buffID,
		rant = slot0._rant,
		level = slot0._level
	})
end
