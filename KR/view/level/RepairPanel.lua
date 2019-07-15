slot0 = class("RepairPanel", import("..base.BasePanel"))

slot0.init = function (slot0)
	slot0.super.init(slot0)

	slot0.desc = slot0:findTF("window/desc")
	slot0.descFree = slot0:findTF("window/text_free")
	slot0.descCharge = slot0:findTF("window/text_charge")
	slot0.free = slot0:findTF("window/text_free/time")
	slot0.charge = slot0:findTF("window/text_charge/time")
	slot0.diamond = slot0:findTF("window/diamond")
	slot0.cost = findTF(slot0.diamond, "cost")
	slot0.cancel = slot0:findTF("window/actions/cancel_button")
	slot0.confirm = slot0:findTF("window/actions/use_button")
	slot0.back = slot0:findTF("top/btnBack")
	slot0.onConfirm = nil
	slot0.onCancel = nil
end

slot0.set = function (slot0, slot1, slot2, slot3, slot4)
	slot0.repairTimes = slot1
	slot0.freeTimes = slot2
	slot0.chargeTimes = slot3
	slot0.chargeDiamond = slot4

	setText(slot0.free, slot5 .. "/" .. slot0.freeTimes)
	setText(slot0.charge, slot6 .. "/" .. slot0.chargeTimes)
	setText(slot0.cost, slot0.chargeDiamond)
	setActive(slot0.descFree, slot0.freeTimes - math.min(slot0.repairTimes, slot0.freeTimes) > 0)
	setActive(slot0.descCharge, slot5 <= 0)
	setText(slot0.desc, i18n("battle_repair_special_tip"))
	setText(slot0.descFree, i18n("battle_repair_normal_name"))
	setText(slot0.descCharge, i18n("battle_repair_special_name"))
	setActive(slot0.diamond, slot0.repairTimes < slot0.freeTimes + slot0.chargeTimes and slot0.freeTimes <= slot0.repairTimes)
	setButtonEnabled(slot0.confirm, slot0.repairTimes < slot0.freeTimes + slot0.chargeTimes)
	setGray(slot0.confirm, not (slot0.repairTimes < slot0.freeTimes + slot0.chargeTimes), true)
	onButton(slot0, slot0.back, function ()
		if slot0.onCancel then
			slot0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.cancel, function ()
		if slot0.onCancel then
			slot0.onCancel()
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.confirm, function ()
		if slot0.onConfirm then
			slot0.onConfirm()
		end
	end, SFX_CONFIRM)
end

return slot0
