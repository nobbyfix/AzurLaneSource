slot0 = class("ShenshengxvmuPage", import(".TemplatePage.PtTemplatePage"))

slot0.OnFirstFlush = function (slot0)
	slot0.super.OnFirstFlush(slot0)
	setActive(slot0.displayBtn, false)
	setActive(slot0.awardTF, false)
end

slot0.OnUpdateFlush = function (slot0)
	slot0.super.OnUpdateFlush(slot0)
	setActive(slot0.battleBtn, false)
	setActive(slot1, not slot0.ptData:CanGetNextAward())

	slot2, slot3, slot4 = slot0.ptData:GetResProgress()

	setText(slot0.step, (slot4 >= 1 and setColorStr(slot2, COLOR_GREEN)) or slot2)
	setText(slot0.progress, "/" .. slot3)
end

return slot0
