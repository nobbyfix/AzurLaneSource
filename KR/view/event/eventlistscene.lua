EventConst = require("view/event/EventConst")
EventListItem = require("view/event/EventListItem")
EventDetailPanel = require("view/event/EventDetailPanel")
slot0 = class("EventListScene", import("..base.BaseUI"))
slot1 = {
	{
		1,
		3,
		4,
		6
	},
	{
		2,
		5
	}
}

slot0.getUIName = function (slot0)
	return "EventUI"
end

slot0.init = function (slot0)
	slot0.dispatch = function (...)
		slot0:emit(...)
	end

	slot0.blurPanel = slot0:findTF("blur_panel")
	slot0.lay = slot0.blurPanel:Find("adapt/left_length")
	slot0.topPanel = slot0:findTF("blur_panel/adapt/top").gameObject
	slot0.btnBack = slot0:findTF("blur_panel/adapt/top/back_btn").gameObject
	slot0.topLeft = slot0:findTF("blur_panel/adapt/top/topLeftBg$")
	slot0.topLeftBg = slot0:findTF("blur_panel/adapt/top/topLeftBg$").gameObject
	slot0.labelShipNums = slot0:findTF("blur_panel/adapt/top/topLeftBg$/labelShipNums$"):GetComponent("Text")
	slot0.btnFlush = slot0:findTF("blur_panel/btnFlush$").gameObject
	slot0.labelFlushTimes = slot0:findTF("blur_panel/btnFlush$/label"):GetComponent(typeof(Text))
	slot0.mask = slot0:findTF("mask$"):GetComponent("Image")
	slot0.scrollItem = EventListItem.New(slot0:findTF("blur_panel/scrollItem").gameObject, slot0.dispatch)

	slot0.scrollItem.go:SetActive(false)

	slot0.detailPanel = EventDetailPanel.New(slot0:findTF("detailPanel").gameObject, slot0.dispatch)

	slot0.detailPanel.go:SetActive(false)

	slot0.scrollRectObj = slot0:findTF("scrollRect$")
	slot0.scrollRect = slot0.scrollRectObj:GetComponent("LScrollRect")

	slot0.scrollRect.onInitItem = function (slot0)
		slot0:onInitItem(slot0)
	end

	slot0.scrollRect.onUpdateItem = function (slot0, slot1)
		slot0:onUpdateItem(slot0, slot1)
	end

	slot0.scrollRect.onReturnItem = function (slot0, slot1)
		slot0:onReturnItem(slot0, slot1)
	end

	slot0.scrollItems = {}
	slot0.selectedItem = nil
	slot0.rawLayouts = {}

	setImageAlpha(slot0.mask, 0)

	slot0.scrollRect.decelerationRate = 0.07
	slot0.listEmptyTF = slot0:findTF("empty")

	setActive(slot0.listEmptyTF, false)

	slot0.listEmptyTxt = slot0:findTF("Text", slot0.listEmptyTF)

	setText(slot0.listEmptyTxt, i18n("list_empty_tip_eventui"))
end

slot2 = {
	"daily",
	"urgency"
}

slot0.didEnter = function (slot0)
	onButton(slot0, slot0.btnBack, function ()
		if slot0.selectedItem then
			slot0:easeOut(function ()
				slot0:emit(slot1.ON_BACK)
			end)
		else
			slot0:emit(slot1.ON_BACK)
		end
	end, SFX_CANCEL)
	setActive(slot0:findTF("stamp"), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(slot0:findTF("stamp"), false)
	end

	onButton(slot0, slot0:findTF("stamp"), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(9)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.btnFlush, function ()
		slot0.dispatch(EventConst.EVENT_FLUSH)
	end, SFX_PANEL)

	slot0.toggles = {}
	slot0.toggleIndex = -1

	for slot4, slot5 in ipairs(ipairs) do
		slot0.toggles[slot4] = slot0.lay:Find("frame/scroll_rect/tagRoot/" .. slot5 .. "_btn")

		onToggle(slot0, slot0.toggles[slot4], function (slot0)
			slot1 = slot0.toggleIndex == -1

			if slot0 and slot0.toggleIndex ~= slot1 then
				slot0.toggleIndex = slot1

				if slot0.selectedItem then
					pg.UIMgr.GetInstance():UnblurPanel(slot0.blurPanel, slot0._tf)

					slot4 = 1000000

					for slot8 = 0, slot0.scrollRect.content.childCount - 1, 1 do
						if slot2:GetChild(slot8) == slot0.selectedItem.tr then
							slot4 = slot8
						elseif slot4 < slot8 then
							slot9:GetComponent(typeof(LayoutElement)).ignoreLayout = slot0.rawLayouts[slot9] or false
						end
					end

					slot0.rawLayouts = {}

					slot0.mask.gameObject:SetActive(false)
					slot0.scrollItem.go:SetActive(false)
					slot0.detailPanel.go:SetActive(false)

					slot0.scrollRect.enabled = true
					slot0.selectedItem = nil
				end

				slot0.contextData.index = slot1

				if slot1 then
					slot0:Flush()
				else
					slot0:filter()
					slot0.scrollRect:SetTotalCount(#slot0.eventList, 0)
					setActive(slot0.listEmptyTF, #slot0.eventList <= 0)
				end
			end
		end)
	end

	triggerToggle(slot0.toggles[slot0.contextData.index or 1], true)

	local function slot2()
		if slot0.scrollItem.event.state == EventInfo.StateFinish then
			slot0.dispatch(EventConst.EVENT_FINISH, slot0.scrollItem.event)
		else
			slot0:easeOut()
		end
	end

	onButton(slot0, slot0.scrollItem.bgNormal, slot2, SFX_PANEL)
	onButton(slot0, slot0.scrollItem.bgEmergence, slot2, SFX_PANEL)
	onButton(slot0, slot0.mask.gameObject, function ()
		slot0:easeOut()
	end, SFX_CANCEL)
	slot0:ctimer()
	slot0:updateBtnTip()
end

slot0.onBackPressed = function (slot0)
	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0.btnBack)
end

slot0.updateAll = function (slot0, slot1, slot2, slot3)
	slot0.eventProxy = slot1

	if slot2 then
		if slot0.selectedItem then
			if slot0.eventProxy:findInfoById(slot0.selectedItem.event.id) then
				slot0:updateOne(slot4)
			else
				slot0:easeOut()
			end

			if not slot3 then
				slot0.invalide = true
			end

			slot0:updateFlushTimes(slot1)
		else
			slot0:Flush()
		end

		slot0:updateBtnTip()
	end
end

slot0.updateOne = function (slot0, slot1)
	slot0.labelShipNums.text = slot0.eventProxy.maxFleetNums - slot0.eventProxy.busyFleetNums .. "/" .. slot0.eventProxy.maxFleetNums

	for slot5, slot6 in pairs(slot0.scrollItems) do
		if slot6.event and slot6.event.id == slot1 then
			slot6:Flush()

			break
		end
	end

	if slot0.selectedItem then
		if slot0.scrollItem.event and slot0.scrollItem.event.id == slot1 then
			slot0.scrollItem:Flush()
			slot0.scrollItem:UpdateTime()
		end

		if slot0.detailPanel.event and slot0.detailPanel.event.id == slot1 then
			slot0.detailPanel:Flush()
		end
	end

	slot0:updateBtnTip()
end

slot0.updateFlushTimes = function (slot0, slot1)
	slot0.eventProxy = slot1
	slot0.labelFlushTimes.text = EventConst.MaxFlushTimes - slot0.eventProxy.flushTimes .. "/" .. EventConst.MaxFlushTimes
end

slot0.Flush = function (slot0)
	slot0.labelShipNums.text = slot0.eventProxy.maxFleetNums - slot0.eventProxy.busyFleetNums .. "/" .. slot0.eventProxy.maxFleetNums
	slot0.labelFlushTimes.text = EventConst.MaxFlushTimes - slot0.eventProxy.flushTimes .. "/" .. EventConst.MaxFlushTimes

	slot0:filter()
	slot0.scrollRect:SetTotalCount(#slot0.eventList, slot0.scrollRect.value)
	setActive(slot0.listEmptyTF, #slot0.eventList <= 0)

	if slot0.eventProxy.selectedEvent then
		function slot1()
			slot1 = 1

			for slot5, slot6 in ipairs(slot0.eventList) do
				if slot6.id == slot0 then
					slot1 = slot5

					break
				end
			end

			slot0.scrollRect:ScrollTo(slot2)

			for slot6, slot7 in pairs(slot0.scrollItems) do
				if slot7.event and slot7.event.id == slot0 then
					slot0.selectedItem = slot7

					slot0:showDetail()

					break
				end
			end

			slot0.eventProxy.selectedEvent = nil

			print("nnnnnnn")
			pg.UIMgr:GetInstance():LoadingOff()
		end

		if slot0.scrollRect.isStart then
			slot1()
		else
			slot0.scrollRect.onStart = slot1

			pg.UIMgr:GetInstance():LoadingOn()
		end
	end
end

slot0.filter = function (slot0)
	slot0.eventList = {}
	slot1 = slot0[slot0.contextData.index]

	for slot5, slot6 in ipairs(slot0.eventProxy.eventList) do
		for slot10, slot11 in ipairs(slot1) do
			if slot6.template.type == slot11 then
				table.insert(slot0.eventList, slot6)

				break
			end
		end
	end

	slot0.eventList = _.sort(slot0.eventList, function (slot0, slot1)
		if slot0.state ~= slot1.state then
			return slot1.state < slot0.state
		end

		if slot0.template.type == 3 and slot1.template.type ~= 3 then
			return true
		end

		if slot0.template.type ~= 3 and slot1.template.type == 3 then
			return false
		end

		return slot0.id < slot1.id
	end)
end

slot0.onInitItem = function (slot0, slot1)
	slot2 = EventListItem.New(slot1, slot0.dispatch)

	local function slot3()
		if slot0.event.state == EventInfo.StateFinish then
			slot1.dispatch(EventConst.EVENT_FINISH, slot0.event)
		else
			slot1:easeIn(slot1.easeIn)
		end
	end

	onButton(slot0, slot2.bgNormal, slot3, SFX_PANEL)
	onButton(slot0, slot2.bgEmergence, slot3, SFX_PANEL)

	slot0.scrollItems[slot1] = slot2
end

slot0.onUpdateItem = function (slot0, slot1, slot2)
	if not slot0.scrollItems[slot2] then
		slot0:onInitItem(slot2)

		slot3 = slot0.scrollItems[slot2]
	end

	if slot0.eventList[slot1 + 1] then
		slot3:Update(slot1, slot4)
		slot3:UpdateTime()
	end
end

slot0.onReturnItem = function (slot0, slot1, slot2)
	if slot0.scrollItems and slot0.scrollItems[slot2] then
		slot0.scrollItems[slot2]:Clear()
	end
end

slot0.easeIn = function (slot0, slot1)
	if not slot0.easing then
		slot0.easing = true
		slot0.selectedItem = slot1

		slot0:setOpEnabled(false)
		slot0:easeInDetail(function ()
			pg.UIMgr.GetInstance():BlurPanel(slot0.blurPanel)

			pg.UIMgr.GetInstance().BlurPanel.easing = false

			pg.UIMgr.GetInstance().BlurPanel:setOpEnabled(true)
		end)
	end
end

slot0.easeOut = function (slot0, slot1)
	if not slot0.easing then
		slot0.easing = true

		slot0:setOpEnabled(false)
		slot0:easeOutDetail(function ()
			pg.UIMgr.GetInstance():UnblurPanel(slot0.blurPanel, slot0._tf)

			pg.UIMgr.GetInstance().UnblurPanel.easing = false
			pg.UIMgr.GetInstance().UnblurPanel.selectedItem = nil

			pg.UIMgr.GetInstance().UnblurPanel:setOpEnabled(true)

			if pg.UIMgr.GetInstance().UnblurPanel.setOpEnabled.invalide then
				slot0.invalide = false

				slot0:Flush()
			end

			if slot1 then
				slot1()
			end
		end)
	end
end

slot0.easeInDetail = function (slot0, slot1)
	slot3 = 0.3

	slot0.mask.gameObject:SetActive(true)

	slot0.scrollRect.enabled = false

	LeanTween.value(slot0.scrollRect.content.gameObject, slot8, slot9, (0.3 * math.abs(slot0.scrollRect.transform.rect.yMax - slot0.scrollRect.content.localPosition.y - slot0.selectedItem.tr.localPosition.y)) / slot0.scrollRect.transform.rect.height):setEase(LeanTweenType.easeInOutCirc):setOnUpdate(System.Action_float(function (slot0)
		slot0.scrollRect:SetNormalizedPosition(slot0, 1)
	end)):setOnComplete(System.Action(function ()
		slot0.scrollItem.tr.localPosition.y = slot1 + slot2.localPosition.y
		slot0.scrollItem.tr.localPosition = slot0.scrollItem.tr.localPosition

		slot0.scrollItem.go:SetActive(true)
		slot0.scrollItem:Update(slot0.selectedItem.index, slot0.selectedItem.event)
		slot0.scrollItem:UpdateTime()

		slot1 = -347

		slot0.detailPanel.tr.SetParent(slot2, slot0.scrollItem:findTF("maskDetail"), true)

		slot0.detailPanel.tr.localPosition = Vector3.zero

		slot0.detailPanel.go:SetActive(true)
		slot0.detailPanel:Update(slot0.selectedItem.index, slot0.selectedItem.event)
		shiftPanel(slot0.detailPanel.go, nil, -175, shiftPanel, 0, true):setEase(LeanTweenType.easeInOutCirc):setOnComplete(System.Action(shiftPanel(slot0.detailPanel.go, nil, -175, shiftPanel, 0, true).setEase(LeanTweenType.easeInOutCirc)))

		slot4 = 100000
		slot5 = {}

		for slot9 = 0, slot5.childCount - 1, 1 do
			if slot5:GetChild(slot9) == slot0.selectedItem.tr then
				slot4 = slot9
			elseif slot4 < slot9 then
				table.insert(slot5, slot10)
			end
		end

		slot0.rawLayouts = {}

		for slot9, slot10 in ipairs(slot5) do
			slot0.rawLayouts[slot10] = slot10:GetComponent(typeof(LayoutElement)).ignoreLayout
			slot10.GetComponent(typeof(LayoutElement)).ignoreLayout = true

			shiftPanel(slot10, nil, slot10.localPosition.y + slot1, slot3, 0, true):setEase(LeanTweenType.easeInOutCirc)
		end
	end))
end

slot0.easeOutDetail = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot2 = 0.2
	slot3 = 268
	slot6 = 100000
	slot7 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-29, warpins: 0 ---
	for slot11 = 0, slot0.scrollRect.content.childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-19, warpins: 2 ---
		if slot4:GetChild(slot11) == slot0.selectedItem.tr then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-21, warpins: 1 ---
			slot6 = slot11
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-23, warpins: 1 ---
			if slot6 < slot11 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-28, warpins: 1 ---
				table.insert(slot7, slot12)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-29, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 30-33, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-50, warpins: 0 ---
	for slot11, slot12 in ipairs(slot7) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-48, warpins: 1 ---
		shiftPanel(slot12, nil, slot12.localPosition.y + slot3, slot2, 0, true):setEase(LeanTweenType.easeInOutCirc)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 49-50, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 51-73, warpins: 1 ---
	shiftPanel(slot0.detailPanel.go, nil, 129, slot2, 0, true):setEase(LeanTweenType.easeInOutCirc):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-19, warpins: 0 ---
		for slot3, slot4 in ipairs(ipairs) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-15, warpins: 1 ---
			slot4:GetComponent(typeof(LayoutElement)).ignoreLayout = slot1.rawLayouts[slot4] or false
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-17, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 18-19, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 20-50, warpins: 1 ---
		slot1.rawLayouts = {}

		slot1.mask.gameObject:SetActive(false)
		slot1.scrollItem.go:SetActive(false)
		slot1.detailPanel.go:SetActive(
		-- Decompilation error in this vicinity:
		false)

		slot1.scrollRect.enabled = true


		-- Decompilation error in this vicinity:
		false()

		return
		--- END OF BLOCK #2 ---



	end))

	return
	--- END OF BLOCK #4 ---



end

slot0.showDetail = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-84, warpins: 1 ---
	slot0.scrollRect.enabled = false

	slot0.mask.gameObject:SetActive(true)

	slot0.scrollItem.tr.localPosition.y = slot0.scrollRect.transform.rect.yMax + slot0.scrollRect.transform.localPosition.y
	slot0.scrollItem.tr.localPosition = slot0.scrollItem.tr.localPosition

	slot0.scrollItem.go:SetActive(true)
	slot0.scrollItem:Update(slot0.selectedItem.index, slot0.selectedItem.event)
	slot0.scrollItem:UpdateTime()

	slot4 = -347

	slot0.detailPanel.tr.SetParent(slot5, slot0.scrollItem:findTF("maskDetail"), true)

	slot0.detailPanel.tr.anchoredPosition = Vector3.New(-1, -175, 0)

	slot0.detailPanel.go:SetActive(true)
	slot0.detailPanel:Update(slot0.selectedItem.index, slot0.selectedItem.event)

	slot7 = 100000
	slot0.rawLayouts = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 85-128, warpins: 0 ---
	for slot11 = 0, slot0.scrollRect.content.childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-97, warpins: 2 ---
		if slot2:GetChild(slot11).GetComponent(slot12, typeof(LayoutElement)).ignoreLayout or not slot12.gameObject.activeSelf then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 102-105, warpins: 2 ---
			slot0.rawLayouts[slot12] = slot13.ignoreLayout
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 106-109, warpins: 1 ---
			if slot12 == slot0.selectedItem.tr then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 110-111, warpins: 1 ---
				slot7 = slot11
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 112-113, warpins: 1 ---
				if slot7 < slot11 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 114-127, warpins: 1 ---
					slot0.rawLayouts[slot12] = slot13.ignoreLayout
					slot13.ignoreLayout = true
					slot12.localPosition = slot12.localPosition + Vector3.New(-1, slot4, 0)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 128-128, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 129-137, warpins: 1 ---
	pg.UIMgr.GetInstance():BlurPanel(slot0.blurPanel)

	return
	--- END OF BLOCK #2 ---



end

slot0.ctimer = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.timer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0.selectedItem then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-9, warpins: 1 ---
			slot0.scrollItem:UpdateTime()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-22, warpins: 2 ---
		slot1 = false

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 23-57, warpins: 0 ---
		for slot5, slot6 in pairs(slot0.scrollItems) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-31, warpins: 1 ---
			slot6:UpdateTime()

			if slot6.event.state == EventInfo.StateNone and slot6.event.overTime > 0 and slot6.event.overTime < slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 41-55, warpins: 1 ---
				slot7, slot11 = slot0.eventProxy:findInfoById(slot6.event.id)

				table.remove(slot0.eventProxy.eventList, slot8)

				slot1 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 56-57, warpins: 5 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 58-59, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 60-64, warpins: 1 ---
			slot0.dispatch(EventConst.EVENT_LIST_UPDATE)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 65-65, warpins: 2 ---
		return
		--- END OF BLOCK #4 ---



	end, 1, -1, true)

	slot0.timer:Start()

	return
	--- END OF BLOCK #0 ---



end

slot0.ktimer = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.timer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.timer:Stop()

		slot0.timer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.setOpEnabled = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	_.each(slot0.toggles, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		setToggleEnabled(slot0, slot0)

		return
		--- END OF BLOCK #0 ---



	end)
	setButtonEnabled(slot0.btnFlush, slot1)
	setButtonEnabled(slot0.btnBack, slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateBtnTip = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = {
		false,
		false
	}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-17, warpins: 0 ---
	for slot5, slot6 in ipairs(slot0.eventProxy.eventList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-11, warpins: 1 ---
		if slot6.state == EventInfo.StateFinish then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-15, warpins: 1 ---
			slot1[slot6.template.type] = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-17, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-21, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 22-30, warpins: 0 ---
	for slot5, slot6 in ipairs(slot0.toggles) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-28, warpins: 1 ---
		setActive(findTF(slot6, "tip"), slot1[slot5])
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-30, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 31-31, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		cancelTweens(slot0.tweens)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-22, warpins: 2 ---
	pg.UIMgr.GetInstance():UnblurPanel(slot0.blurPanel, slot0._tf)
	slot0:ktimer()

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-27, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.scrollItems) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-25, warpins: 1 ---
		slot5:Clear()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 26-27, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-36, warpins: 1 ---
	slot0.scrollItem:Clear()
	slot0.detailPanel:Clear()

	return
	--- END OF BLOCK #3 ---



end

return slot0
