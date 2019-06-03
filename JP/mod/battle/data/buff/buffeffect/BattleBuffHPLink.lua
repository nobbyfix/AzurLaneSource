ys = ys or {}
ys.Battle.BattleBuffHPLink = class("BattleBuffHPLink", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffHPLink.__name = "BattleBuffHPLink"
ys.Battle.BattleBuffHPLink.FX_TYPE = ys.Battle.BattleBuffEffect.FX_TYPE_LINK

function ys.Battle.BattleBuffHPLink.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffHPLink.SetArgs(slot0, slot1, slot2)
	slot0._number = slot0._tempData.arg_list.number or 0
	slot0._restoreRate = 0
	slot0._sumDMG = 0

	if slot3.restoreRatio then
		slot0._restoreRate = slot3.restoreRatio * 0.0001
	end
end

function ys.Battle.BattleBuffHPLink.onTakeDamage(slot0, slot1, slot2, slot3)
	if slot3.isShare then
		return
	end

	if slot2:GetCaster() and slot5:IsAlive() and slot5 ~= slot1 then
		slot3.damage = math.ceil(slot3.damage * slot0._number)

		if slot3.damage - slot3.damage > 0 then
			slot0._sumDMG = slot0._sumDMG + slot3.damage

			slot5:UpdateHP(-slot3.damage, {
				isMiss = false,
				isCri = false,
				isShare = true,
				isHeal = false
			})
		end
	end
end

function ys.Battle.BattleBuffHPLink.onRemove(slot0, slot1, slot2)
	if slot2:GetCaster() and slot3:IsAlive() and slot0._restoreRate > 0 and slot3 ~= slot1 and math.floor(slot0._sumDMG * slot0._restoreRate) ~= 0 then
		slot3:UpdateHP(slot4, {
			isMiss = false,
			isCri = false,
			isHeal = true
		})
	end
end
