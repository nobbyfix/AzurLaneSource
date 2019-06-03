ys = ys or {}
ys.Battle.BattleBuffCastSkillRandom = class("BattleBuffCastSkillRandom", ys.Battle.BattleBuffCastSkill)
ys.Battle.BattleBuffCastSkillRandom.__name = "BattleBuffCastSkillRandom"

function ys.Battle.BattleBuffCastSkillRandom.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0._skillIDList = {}
	slot0._skillList = {}
end

function ys.Battle.BattleBuffCastSkillRandom.SetArgs(slot0, slot1, slot2)
	uv0.super.SetArgs(slot0, slot1, slot2)

	slot4 = slot0._tempData.arg_list.skill_id_list

	for slot9, slot10 in ipairs(slot0._tempData.arg_list.skill_id_list) do
		slot0._skillIDList[slot10] = slot0._tempData.arg_list.range[slot9]
	end
end

function ys.Battle.BattleBuffCastSkillRandom.spell(slot0, slot1)
	for slot6, slot7 in pairs(slot0._skillIDList) do
		if slot7[1] <= math.random() and math.random() < slot7[2] then
			slot0._skillList[slot6] = slot0._skillList[slot6] or uv0.Battle.BattleSkillUnit.GenerateSpell(slot6, slot0._level, slot1, attData)

			if attach and attach.target then
				slot0._skillList[slot6]:SetTarget({
					attach.target
				})
			end

			slot10:Cast(slot1, slot0._commander)
		end
	end
end

function ys.Battle.BattleBuffCastSkillRandom.Clear(slot0)
	uv0.super.Clear(slot0)

	for slot4, slot5 in pairs(slot0._skillList) do
		slot5:Clear()
	end
end
