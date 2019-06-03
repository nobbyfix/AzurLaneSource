ys = ys or {}
ys.Battle.BattleDamageRateView = class("BattleDamageRateView")
ys.Battle.BattleDamageRateView.__name = "BattleDamageRateView"

function ys.Battle.BattleDamageRateView.Ctor(slot0, slot1)
	slot0._go = slot1
	slot0.tick_bar = slot1.transform:Find("tick_bar"):GetComponent(typeof(Image))
	slot0.tickBarOb = slot0.tick_bar.gameObject
	slot0.tick_bar.fillAmount = 0
end

function ys.Battle.BattleDamageRateView.UpdateScore(slot0, slot1, slot2)
	LeanTween.cancel(slot0.tickBarOb)
	LeanTween.value(slot0.tickBarOb, slot0.tick_bar.fillAmount, slot3, 0.5):setOnUpdate(System.Action_float(function (slot0)
		uv0.tick_bar.fillAmount = slot0
	end))
end

function ys.Battle.BattleDamageRateView.CalScore(slot0, slot1, slot2)
	slot5 = {
		0,
		0.445,
		0.7,
		0.88,
		1
	}
	slot6 = 0

	for slot10, slot11 in ipairs(slot4) do
		if slot1 < pg.expedition_data_template[slot2][slot11] then
			break
		end

		slot6 = slot10
	end

	slot7 = 0

	return slot6 < #slot4 and (slot5[slot6 + 1] - slot5[slot6]) * (slot1 - slot8) / (slot3[slot4[slot6 + 1]] - slot8) + slot5[slot6] or 1
end

function ys.Battle.BattleDamageRateView.Dispose(slot0)
	LeanTween.cancel(slot0.tickBarOb)
end
