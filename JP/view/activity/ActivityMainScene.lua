slot0 = class("ActivityMainScene", import("..base.BaseUI"))
slot1 = {
	[ActivityConst.DAY7_LOGIN_ACTIVITY_ID] = {
		className = "Day7LoginPage",
		uiName = "day7loginpage"
	},
	[ActivityConst.LEVEL_AWARD_ACTIVITY_ID] = {
		className = "LevelAwardPage",
		uiName = "levelawardpage"
	},
	[ActivityConst.MONTH_SIGN_ACTIVITY_ID] = {
		uiName = "monthsignpage",
		className = "MonthSignPage",
		uiName2 = "monthSignPage_special"
	},
	[ActivityConst.CHARGE_AWARD_ACTIVITY_ID] = {
		className = "ChargeAwardPage",
		uiName = "chargeawardpage"
	},
	[ActivityConst.ACTIVITY_TYPE_RETURN_AWARD_ID] = {
		className = "ReturnAwardPage",
		uiName = "returnawardpage"
	},
	[ActivityConst.SUB_RED_POCKET] = {
		className = "RedPocketShipPage",
		uiName = "redpocketshippage"
	},
	[ActivityConst.BISMARCK_PT_ID] = {
		className = "BismarckPtPage",
		uiName = "bismarckptpage"
	},
	[ActivityConst.BISMARCK_CHAPTER_ID] = {
		className = "BismarckChapterPage",
		uiName = "bismarckchapterpage"
	},
	[ActivityConst.SKIN_U73] = {
		className = "U73SkinPage",
		uiName = "u73skinpage"
	},
	[ActivityConst.SKIN_Z23] = {
		className = "Z23SkinPage",
		uiName = "z23skinpage"
	},
	[ActivityConst.XIMU_LOGIN_ID] = {
		className = "XimuLoginPage",
		uiName = "ximuloginpage"
	},
	[ActivityConst.SANDIEGO_PT_ID] = {
		className = "SanDiegoPtPage",
		uiName = "sandiegoptpage"
	}
}
slot2 = {}

function slot0.preload(slot0, slot1)
	slot1()
end

function slot0.getUIName(slot0)
	return "ActivityMainUI"
end

function slot0.onBackPressed(slot0)
	if slot0.bonusWindow and isActive(slot0.bonusWindow._tf) then
		slot0.bonusWindow:Hide()

		return
	end

	if slot0.taskBoundsWindow and isActive(slot0.taskBoundsWindow._tf) then
		slot0.taskBoundsWindow:Hide()

		return
	end

	slot0:emit(uv0.ON_BACK_PRESSED)
end

slot3 = nil

function slot0.init(slot0)
	slot0.btnBack = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.pageContainer = slot0:findTF("pages")
	slot0.tabs = slot0:findTF("scroll/viewport/content")
	slot0.tab = slot0:findTF("tab", slot0.tabs)
	slot0.entranceList = UIItemList.New(slot0:findTF("enter/viewport/content"), slot0:findTF("enter/viewport/content/btn"))

	setActive(slot0.tab, false)

	slot0.shareData = ActivityShareData.New()
	uv0 = require("GameCfg.activity.EntranceData")
	slot0.pageDic = {}

	for slot7, slot8 in pairs(uv1) do
		if getProxy(ActivityProxy):getActivityById(slot7) and not slot9:isEnd() and slot9:isShow() then
			if slot7 == ActivityConst.MONTH_SIGN_ACTIVITY_ID and tonumber(pg.TimeMgr.GetInstance():DescClientTime(slot1, "%m")) == pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[1] then
				import("view.activity.subPages." .. slot8.className).New(slot0.pageContainer, slot0.event, slot0.contextData):SetUIName(slot8.uiName2)
			else
				slot11:SetUIName(slot8.uiName)
			end

			slot11:SetShareData(slot0.shareData)

			slot0.pageDic[slot7] = slot11
		end
	end
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btnBack, function ()
		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)
	slot0:updateEntrances()
end

function slot0.setPlayer(slot0, slot1)
	slot0.shareData:SetPlayer(slot1)
end

function slot0.setFlagShip(slot0, slot1)
	slot0.shareData:SetFlagShip(slot1)
end

function slot0.setAllActivity(slot0, slot1)
	slot0.allActivity = slot1
end

function slot0.updateTaskLayers(slot0)
	if not slot0.activity then
		return
	end

	slot0:updateActivity(slot0.activity)
end

function slot0.setActivities(slot0, slot1)
	slot0.activities = slot1 or {}
	slot0.activity = nil

	table.sort(slot0.activities, function (slot0, slot1)
		if slot0:getShowPriority() == slot1:getShowPriority() then
			return slot1.id < slot0.id
		end

		return slot3 < slot2
	end)
	slot0:flushTabs()
end

function slot0.updateActivity(slot0, slot1)
	slot0.allActivity[slot1.id] = slot1

	if not slot1:isShow() then
		if uv0[slot1.id] then
			slot1 = getProxy(ActivityProxy):getActivityById(uv0[slot1.id])
		else
			return
		end
	end

	slot0.activities[slot2()] = slot1

	slot0:flushTabs()

	if slot0.activity and slot0.activity.id == slot1.id then
		slot0.activity = slot1

		slot0.pageDic[slot1.id].ActionInvoke(slot3, "Flush", slot1)
		slot0:verifyTabs()
	end
end

function slot0.updateEntrances(slot0)
	slot0.entranceList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = "empty"

			removeOnButton(slot2)

			if uv0[slot1 + 1] and table.getCount(slot3) ~= 0 and slot3.isShow() then
				onButton(uv1, slot2, function ()
					uv0:emit(uv1.event, uv1.data[1], uv1.data[2])
				end, SFX_PANEL)

				slot4 = slot3.banner
			end

			LoadImageSpriteAsync("activitybanner/" .. slot4, slot2)
		end
	end)
	slot0.entranceList:align(math.max(#_.select(uv0, function (slot0)
		return slot0.isShow and slot0.isShow()
	end), 5))
end

function slot0.flushTabs(slot0)
	if not slot0.tabsList then
		slot0.tabsList = UIItemList.New(slot0.tabs, slot0.tab)

		slot0.tabsList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				if uv0.pageDic[uv0.activities[slot1 + 1].id] ~= nil then
					if slot3:getConfig("title_res_tag") then
						setImageSprite(uv0:findTF("off/text", slot2), GetSpriteFromAtlas("ui/activityui_atlas", slot5 .. "_text") or GetSpriteFromAtlas("ui/activityui_atlas", "activity_text"), true)
						setImageSprite(uv0:findTF("on/text", slot2), GetSpriteFromAtlas("ui/activityui_atlas", slot5 .. "_text_selected") or GetSpriteFromAtlas("ui/activityui_atlas", "activity_text_selected"), true)
						setActive(uv0:findTF("red", slot2), slot3:readyToAchieve())
						onToggle(uv0, slot2, function (slot0)
							if slot0 then
								uv0:selectActivity(uv1.id)
							end
						end, SFX_PANEL)
					else
						onToggle(uv0, slot2, function (slot0)
							uv0:loadActivityPanel(slot0, uv1)
						end, SFX_PANEL)
					end
				end
			end
		end)
	end

	slot0.tabsList:align(#slot0.activities)
end

function slot0.selectActivity(slot0, slot1)
	if (_.detect(slot0.activities, function (slot0)
		return slot0.id == uv0
	end) or slot0.activities[1]) and (not slot0.activity or slot0.activity.id ~= slot2.id) then
		slot0.pageDic[slot2.id].Load(slot3)
		slot0.pageDic[slot2.id].ActionInvoke(slot3, "Flush", slot2)
		slot0.pageDic[slot2.id]:ActionInvoke("ShowOrHide", true)

		if slot0.activity and slot0.activity.id ~= slot2.id then
			slot0.pageDic[slot0.activity.id]:ActionInvoke("ShowOrHide", false)
		end

		slot0.activity = slot2
		slot0.contextData.id = slot2.id

		slot0:verifyTabs()
	end
end

function slot0.verifyTabs(slot0)
	triggerToggle(slot0.tabs:GetChild(table.indexof(slot0.activities, slot0.activity) - 1), true)
end

function slot0.loadActivityPanel(slot0, slot1, slot2)
	slot4 = nil

	if slot2:getConfig("type") == ActivityConst.ACTIVITY_TYPE_HITMONSTERNIAN then
		slot4 = Context.New({
			mediator = HitMonsterNianMediator,
			viewComponent = HitMonsterNianLayer
		})
	end

	if slot4 and slot1 then
		slot0:emit(ActivityMediator.OPEN_LAYER, slot4)
	elseif slot4 and not slot1 then
		slot0:emit(ActivityMediator.CLOSE_LAYER, slot4.mediator)
	else
		print("------活动id为" .. slot2.id .. "类型为" .. slot2:getConfig("type") .. "的页面不存在")
	end
end

function slot0.getBonusWindow(slot0, slot1)
	if not slot0:findTF("bonusWindow") then
		PoolMgr.GetInstance():GetUI("ActivitybonusWindow", true, function (slot0)
			SetParent(slot0, uv0._tf, false)

			slot0.name = uv1

			uv2(slot0)
		end)
	else
		slot1(slot3)
	end
end

function slot0.ShowBonusWindow(slot0, slot1)
	if not slot0.bonusWindow then
		slot0:getBonusWindow(function (slot0)
			uv0.bonusWindow = PtAwardWindow.New(tf(slot0), uv0)

			uv0.bonusWindow:Show(uv1)
		end)
	else
		slot0.bonusWindow:Show(slot1)
	end
end

function slot0.HideBonusWindow(slot0)
	if not slot0.bonusWindow then
		return
	end

	slot0.bonusWindow:Hide()
end

function slot0.ShowTaskBoundsWindow(slot0, slot1)
	if not slot0.taskBoundsWindow then
		slot0:getBonusWindow(function (slot0)
			uv0.taskBoundsWindow = TaskAwardWindow.New(tf(slot0), uv0)

			uv0.taskBoundsWindow:Show(uv1)
		end)
	else
		slot0.taskBoundsWindow:Show(slot1)
	end
end

function slot0.HideTaskBoundsWindow(slot0)
	if not slot0.taskBoundsWindow then
		return
	end

	slot0.taskBoundsWindow:Hide()
end

function slot0.ShowReturnerBoundsWindow(slot0, slot1)
	if not slot0.returnerAwardWindow then
		slot0:getBonusWindow(function (slot0)
			uv0.returnerAwardWindow = ReturnerAwardWindow.New(tf(slot0), uv0)

			uv0.returnerAwardWindow:Show(uv1)
		end)
	else
		slot0.returnerAwardWindow:Show(slot1)
	end
end

function slot0.HideReturnerAwardWindow(slot0)
	if not slot0.returnerAwardWindow then
		return
	end

	slot0.returnerAwardWindow:Hide()
end

function slot0.willExit(slot0)
	slot0.shareData = nil

	for slot4, slot5 in pairs(slot0.pageDic) do
		slot5:Destroy()
	end

	if slot0.bonusWindow then
		slot0.bonusWindow:Dispose()
	end

	if slot0.taskBoundsWindow then
		slot0.taskBoundsWindow:Dispose()
	end
end

return slot0
