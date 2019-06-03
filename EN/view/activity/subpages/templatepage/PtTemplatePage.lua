slot0 = class("PtTemplatePage", import("....base.BaseActivityPage"))

function slot0.OnInit(slot0)
	slot0.bg = slot0:findTF("AD")
	slot0.slider = slot0:findTF("AD/slider"):GetComponent(typeof(Slider))
	slot0.progress = slot0:findTF("AD/progress"):GetComponent(typeof(Text))
	slot0.value = slot0:findTF("AD/value"):GetComponent(typeof(Text))
	slot0.displayBtn = slot0:findTF("AD/display_btn")
	slot0.awardTF = slot0:findTF("AD/award")
	slot0.battleBtn = slot0:findTF("AD/battle_btn")
	slot0.getBtn = slot0:findTF("AD/get_btn")
	slot0.gotBtn = slot0:findTF("AD/got_btn")
end

function slot0.OnDataSetting(slot0)
	slot0.ptData = ActivityPtData.New(slot0.activity)
end

function slot0.OnFirstFlush(slot0)
	LoadImageSpriteAsync(slot0:GetBgImg(), slot0.bg)
	onButton(slot0, slot0.displayBtn, function ()
		uv0:emit(ActivityMediator.SHOW_AWARD_WINDOW, {
			dropList = uv0.ptData.dropList,
			targets = uv0.ptData.targets,
			level = uv0.ptData.level,
			count = uv0.ptData.count,
			resId = uv0.ptData.resId
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.battleBtn, function ()
		uv0:emit(ActivityMediator.BATTLE_OPERA)
	end, SFX_PANEL)
	onButton(slot0, slot0.getBtn, function ()
		slot0, slot5.arg1 = uv0.ptData:GetResProgress()

		uv0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 1,
			activity_id = uv0.ptData:GetId(),
			arg1 = slot1
		})
	end, SFX_PANEL)
end

function slot0.OnUpdateFlush(slot0)
	slot0.ptData:Update(slot0.activity)

	if checkExist(checkExist(slot2, slot0.ptData:getTargetLevel()), 1) and not pg.StoryMgr.GetInstance():IsPlayed(slot2[slot1][1]) then
		slot3:Play(slot2[slot1][1])
	end

	slot10, slot12, slot5 = slot0.ptData:GetLevelProgress()
	slot6, slot7, slot8 = slot0.ptData:GetResProgress()
	slot0.progress.text = slot3 .. "/" .. slot4
	slot0.value.text = (slot8 >= 1 and setColorStr(slot6, COLOR_GREEN) or slot6) .. "/" .. slot7
	slot0.slider.value = slot8

	setActive(slot0.battleBtn, slot0.ptData:CanGetMorePt() and not slot0.ptData:CanGetAward() and slot0.ptData:CanGetNextAward())
	setActive(slot0.getBtn, slot0.ptData.CanGetAward())
	setActive(slot0.gotBtn, not slot0.ptData.CanGetNextAward())
	updateDrop(slot0.awardTF, setActive)
	onButton(slot0, slot0.awardTF, function ()
		uv0:emit(BaseUI.ON_DROP, uv1)
	end, SFX_PANEL)
end

function slot0.OnDestroy(slot0)
end

function slot0.GetWorldPtData(slot0, slot1)
	if slot1 <= pg.TimeMgr.GetInstance():GetServerTime() - (ActivityMainScene.Data2Time or 0) then
		ActivityMainScene.Data2Time = pg.TimeMgr.GetInstance():GetServerTime()

		slot0:emit(ActivityMediator.EVENT_PT_OPERATION, {
			cmd = 2,
			activity_id = slot0.ptData:GetId()
		})
	end
end

return slot0
