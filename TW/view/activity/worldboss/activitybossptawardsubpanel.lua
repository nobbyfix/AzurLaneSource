slot0 = class("ActivityBossPtAwardSubPanel", import("view.activity.Panels.PtAwardSubPanel"))

slot0.UpdateView = function (slot0, slot1)
	slot0.ptData = slot1
	slot2 = slot1.dropList
	slot3 = slot1.targets
	slot4 = slot1.level
	slot5 = slot1.count
	slot7 = pg.item_data_statistics[id2ItemId(slot1.resId)].name

	if slot1.type == 2 then
		slot0.cntTitle = i18n("pt_total_count", i18n("pt_cosume", slot7))
		slot0.resTitle = i18n("pt_count", i18n("pt_cosume", slot7))
	else
		slot0.cntTitle = i18n("pt_total_count", slot7)
		slot0.resTitle = i18n("pt_count", slot7)
	end

	setActive(slot0.btn_get, slot9)
	setActive(slot0.btn_banned, not slot0.ptData:CanGetAward())
	slot0:UpdateList(slot2, slot3, slot4, slot0.ptData:GetBossProgress())
	Canvas.ForceUpdateCanvases()
end

slot0.UpdateList = function (slot0, slot1, slot2, slot3, slot4)
	slot0.UIlist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("title/Text"), "PHASE " .. slot1 + 1)
			setText(slot2:Find("target/Text"), slot4)
			setText(slot2:Find("target/title"), slot2.resTitle)
			updateDrop(slot2:Find("award"), slot5, {
				hideName = true
			})
			onButton(slot2, slot2:Find("award"), function ()
				slot0:emit(BaseUI.ON_DROP, slot0)
			end, SFX_PANEL)
			setActive(slot2:Find("award/mask"), slot1 + 1 <= slot0[slot1 + 1])
			setActive(slot2:Find("mask"), slot2.ptData.progress_target[slot1 + 1] < slot4)

			if slot2.ptData.progress_target[slot1 + 1] < slot4 then
				setText(slot2:Find("mask/Text"), i18n("world_boss_award_limit", math.round(slot2.ptData.progress_target[slot1 + 1] / 100)))
			end

			setActive(slot2:Find("award/mask/Image"), slot1 + 1 <= slot3)
		end
	end)
	slot0.UIlist:align(#slot1)
end

return slot0
