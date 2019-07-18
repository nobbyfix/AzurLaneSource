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
		uiName2 = "monthsignpage_special"
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
	},
	[ActivityConst.SIPEI_PAGE_ID] = {
		className = "SipeiTaskPage",
		uiName = "sipeitaskpage"
	},
	[ActivityConst.GLORY_PAGE_ID] = {
		className = "GloryTaskPage",
		uiName = "glorytaskpage"
	},
	[ActivityConst.FRANCE_RE_MAIN] = {
		className = "FranceRestartMainPage",
		uiName = "francerestartmainpage"
	},
	[ActivityConst.FRANCE_RE_PT] = {
		className = "FranceRestartPtPage",
		uiName = "francerestartptpage"
	},
	[ActivityConst.FRANCE_RE_OIL] = {
		className = "FranceRestartOilPage",
		uiName = "francerestartoilpage"
	},
	[ActivityConst.HONGRAN_RE_PREVIEW_ID] = {
		className = "HongranPreviewPage",
		uiName = "hongranpreviewpage"
	},
	[ActivityConst.HONGRAN_RE_PT_ID] = {
		className = "HongranPtPage",
		uiName = "hongranptpage"
	},
	[ActivityConst.JAVELIN_COMIC_NINE_DAY_TASK] = {
		className = "JavelinComicSkinPage",
		uiName = "javelincomicskinpage"
	},
	[ActivityConst.CENTAUR_ACTIVITY_ID] = {
		className = "CentaurAwardPage",
		uiName = "centaurawardpage"
	},
	[ActivityConst.I56_SKIN_ACTIVITY_ID] = {
		className = "I56SkinPage",
		uiName = "i56skinPage"
	}
}
slot2 = {}

slot0.preload = function (slot0, slot1)
	slot1()
end

slot0.getUIName = function (slot0)
	return "ActivityMainUI"
end

slot0.onBackPressed = function (slot0)
	for slot4, slot5 in pairs(slot0.windowList) do
		if isActive(slot5._tf) then
			slot0:HideWindow(slot5.class)

			return
		end
	end

	slot0:emit(slot0.ON_BACK_PRESSED)
end

slot3 = nil

slot0.init = function (slot0)
	slot0.btnBack = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.pageContainer = slot0:findTF("pages")
	slot0.tabs = slot0:findTF("scroll/viewport/content")
	slot0.tab = slot0:findTF("tab", slot0.tabs)
	slot0.entranceList = UIItemList.New(slot0:findTF("enter/viewport/content"), slot0:findTF("enter/viewport/content/btn"))
	slot0.windowList = {}

	setActive(slot0.tab, false)

	slot0.shareData = ActivityShareData.New()
	slot2 = tonumber(pg.TimeMgr.GetInstance():CTimeDescC(slot1, "%m"))
	slot3 = pg.activity_template[ActivityConst.MONTH_SIGN_ACTIVITY_ID].config_client[1]
	require("GameCfg.activity.EntranceData").pageDic = {}

	for slot7, slot8 in pairs(slot1) do
		if getProxy(ActivityProxy):getActivityById(slot7) and not slot9:isEnd() and slot9:isShow() then
			slot11 = import("view.activity.subPages." .. slot8.className).New(slot0.pageContainer, slot0.event, slot0.contextData)

			if slot7 == ActivityConst.MONTH_SIGN_ACTIVITY_ID and slot2 == slot3 then
				slot11:SetUIName(slot8.uiName2)
			else
				slot11:SetUIName(slot8.uiName)
			end

			slot11:SetShareData(slot0.shareData)

			slot0.pageDic[slot7] = slot11
		end
	end
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0.btnBack, function ()
		slot0:emit(slot1.ON_BACK)
	end, SOUND_BACK)
	slot0:updateEntrances()
	slot0:emit(ActivityMediator.SHOW_NEXT_ACTIVITY)
end

slot0.setPlayer = function (slot0, slot1)
	slot0.shareData:SetPlayer(slot1)
end

slot0.setFlagShip = function (slot0, slot1)
	slot0.shareData:SetFlagShip(slot1)
end

slot0.setAllActivity = function (slot0, slot1)
	slot0.allActivity = slot1
end

slot0.updateTaskLayers = function (slot0)
	if not slot0.activity then
		return
	end

	slot0:updateActivity(slot0.activity)
end

slot0.setActivities = function (slot0, slot1)
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

slot0.updateActivity = function (slot0, slot1)
	slot0.allActivity[slot1.id] = slot1

	if not slot1:isShow() then
		if slot0[slot1.id] then
			slot1 = getProxy(ActivityProxy):getActivityById(slot0[slot1.id])
		else
			return
		end
	end

	slot0.activities[slot2()] = slot1

	slot0:flushTabs()

	if slot0.activity and slot0.activity.id == slot1.id then
		slot0.activity = slot1

		slot0.pageDic[slot1.id]:ActionInvoke("Flush", slot1)
	end
end

slot0.updateEntrances = function (slot0)
	slot0.entranceList:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = "empty"

			removeOnButton(slot2)

			if slot0[slot1 + 1] and table.getCount(slot3) ~= 0 and slot3.isShow() then
				onButton(slot1, slot2, function ()
					slot0:emit(slot1.event, slot1.data[1], slot1.data[2])
				end, SFX_PANEL)

				slot4 = slot3.banner
			end

			LoadImageSpriteAsync("activitybanner/" .. slot4, slot2)
		end
	end)
	slot0.entranceList:align(math.max(#_.select(slot0, function (slot0)
		return slot0.isShow and slot0.isShow()
	end), 5))
end

slot0.flushTabs = function (slot0)
	if not slot0.tabsList then
		slot0.tabsList = UIItemList.New(slot0.tabs, slot0.tab)

		slot0.tabsList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				if slot0.pageDic[slot0.activities[slot1 + 1].id] ~= nil then
					if slot3:getConfig("title_res_tag") then
						setImageSprite(slot0:findTF("off/text", slot2), GetSpriteFromAtlas("ui/activityui_atlas", slot5 .. "_text") or GetSpriteFromAtlas("ui/activityui_atlas", "activity_text"), true)
						setImageSprite(slot0:findTF("on/text", slot2), GetSpriteFromAtlas("ui/activityui_atlas", slot5 .. "_text_selected") or GetSpriteFromAtlas("ui/activityui_atlas", "activity_text_selected"), true)
						setActive(slot0:findTF("red", slot2), slot3:readyToAchieve())
						onToggle(slot0, slot2, function (slot0)
							if slot0 then
								slot0:selectActivity(slot0.selectActivity)
							end
						end, SFX_PANEL)
					else
						onToggle(slot0, slot2, function (slot0)
							slot0:loadActivityPanel(slot0, slot0.loadActivityPanel)
						end, SFX_PANEL)
					end
				end
			end
		end)
	end

	slot0.tabsList:align(#slot0.activities)
end

slot0.selectActivity = function (slot0, slot1)
	if slot1 and (not slot0.activity or slot0.activity.id ~= slot1.id) then
		slot0.pageDic[slot1.id].Load(slot2)
		slot0.pageDic[slot1.id].ActionInvoke(slot2, "Flush", slot1)
		slot0.pageDic[slot1.id]:ActionInvoke("ShowOrHide", true)

		if slot0.activity and slot0.activity.id ~= slot1.id then
			slot0.pageDic[slot0.activity.id]:ActionInvoke("ShowOrHide", false)
		end

		slot0.activity = slot1
		slot0.contextData.id = slot1.id
	end
end

slot0.verifyTabs = function (slot0, slot1)
	slot2 = 1

	for slot6, slot7 in ipairs(slot0.activities) do
		if slot7.id == slot1 then
			slot2 = slot6

			break
		end
	end

	triggerToggle(slot0.tabs:GetChild(slot2 - 1), true)
end

slot0.loadActivityPanel = function (slot0, slot1, slot2)
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

slot0.getBonusWindow = function (slot0, slot1, slot2)
	if not slot0:findTF(slot1) then
		PoolMgr.GetInstance():GetUI("ActivitybonusWindow", true, function (slot0)
			SetParent(slot0, slot0._tf, false)

			slot0.name = SetParent

			slot0(slot0)
		end)
	else
		slot2(slot3)
	end
end

slot0.ShowWindow = function (slot0, slot1, slot2)
	if not slot0.windowList[slot1.__cname] then
		slot0:getBonusWindow(slot3, function (slot0)
			slot0.windowList[] = slot2.New(tf(slot0), slot0)

			slot0.windowList[]:Show(slot2.New(tf(slot0), slot0))
		end)
	else
		slot0.windowList[slot3]:Show(slot2)
	end
end

slot0.HideWindow = function (slot0, slot1)
	if not slot0.windowList[slot1.__cname] then
		return
	end

	slot0.windowList[slot2]:Hide()
end

slot0.willExit = function (slot0)
	slot0.shareData = nil

	for slot4, slot5 in pairs(slot0.pageDic) do
		slot5:Destroy()
	end

	for slot4, slot5 in pairs(slot0.windowList) do
		slot5:Dispose()
	end
end

return slot0
