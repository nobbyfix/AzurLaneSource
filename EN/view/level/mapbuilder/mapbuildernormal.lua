slot1 = class("MapBuilderNormal", import(".MapBuilder"))

slot1.Ctor = function (slot0, ...)
	slot0.super.Ctor(slot0, ...)

	slot0.mapItemTimer = {}
	slot0.chapterTFsById = {}
end

slot1.GetType = function (slot0)
	return slot0.TYPENORMAL
end

slot1.GetUIName = function (slot0)
	return "levels"
end

slot1.Load = function (slot0, slot1)
	slot0.state = slot0.StateLoading
	slot0.tf = tf(slot2)

	slot0:Init()
	slot1()
end

slot1.Destroy = function (slot0)
	if slot0.StateDestroy <= slot0.state then
		return
	end

	if slot0.StateInit <= slot0.state then
		slot0:Hide()
		slot0:OnDestroy()

		slot0.tf = nil
	end

	slot0.state = slot0.StateDestroy
end

slot1.OnInit = function (slot0)
	slot0.tpl = slot0.tf:Find("level_tpl")

	setActive(slot0.tpl, false)

	slot0.itemHolder = slot0.tf:Find("items")
end

slot1.OnHide = function (slot0)
	for slot4, slot5 in pairs(slot0.mapItemTimer) do
		if slot5 then
			slot5:Stop()
		end
	end

	slot0.mapItemTimer = {}
end

slot1.OnDestroy = function (slot0)
	slot0.mapItemTimer = nil
end

slot1.Update = function (slot0, slot1)
	slot0.map.pivot = Vector2(0.5, 0.5)
	slot0.float.pivot = Vector2(0.5, 0.5)
	slot0.float.localPosition = Vector2(0, 0)

	slot0.super.Update(slot0, slot1)
end

slot1.UpdateMapItems = function (slot0)
	slot0.super.UpdateMapItems(slot0)

	slot1 = slot0.data
	slot0.chapterTFsById = {}

	_.each(Chapter.bindConfigTable().all, function (slot0)
		if slot0:getChapter(slot0) and slot1:getConfig("map") == slot0.id and slot1:isValid() and not slot1:ifNeedHide() then
			table.insert(slot1, slot1)
		end
	end)

	slot4 = UIItemList.New(slot0.itemHolder, slot0.tpl)

	slot4:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot1:UpdateMapItem(slot2, slot0[slot1 + 1])

			slot2.name = "Chapter_" .. slot0[slot1 + 1].id
			slot1.chapterTFsById[slot0[slot1 + 1].id] = slot2
		elseif slot0 == UIItemList.EventExcess and slot1.mapItemTimer[slot2] then
			slot1.mapItemTimer[slot2]:Stop()

			slot1.mapItemTimer[slot2] = nil
		end
	end)
	slot4:align(#{})
end

slot1.UpdateMapItem = function (slot0, slot1, slot2, slot3)
	setAnchoredPosition(slot1, {
		x = slot0.mapWidth * slot2:getConfigTable().pos_x,
		y = slot0.mapHeight * slot2.getConfigTable().pos_y
	})

	if slot0.mapItemTimer[slot1] then
		slot0.mapItemTimer[slot1]:Stop()

		slot0.mapItemTimer[slot1] = nil
	end

	slot5 = findTF(slot1, "main")
	slot6 = findTF(slot1, "sub")

	if slot2:getPlayType() == ChapterConst.TypeMainSub then
		setActive(slot5, false)
		setActive(slot6, true)

		slot7 = findTF(slot6, "mask/count_down")

		local function slot8()
			if slot0 then
				if math.max(slot1.expireTime - pg.TimeMgr.GetInstance():GetServerTime(), 0) > 0 then
					setText(slot0, slot0:DescCDTime(slot1))
				elseif not slot1.active then
					slot1:clearSubChapter()
					getProxy(ChapterProxy):updateChapter(slot1)
				end
			end
		end

		slot0.mapItemTimer[slot1] = Timer.New(slot8, 1, -1)

		slot0.mapItemTimer[slot1]:Start()
		slot8()

		slot9 = findTF(slot6, "fighting")
		slot10 = GetOrAddComponent(slot9, "CanvasGroup")

		setText(findTF(slot9, "Text"), i18n("tag_level_fighting"))

		slot11 = findTF(slot6, "oni")
		slot12 = GetOrAddComponent(slot9, "CanvasGroup")

		setText(findTF(slot11, "Text"), i18n("tag_level_oni"))

		slot14 = GetOrAddComponent(slot11, "CanvasGroup")

		setText(findTF(slot13, "Text"), i18n("tag_level_narrative"))
		setActive(slot9, false)
		setActive(slot11, false)
		setActive(slot13, false)
		slot0:DeleteTween("fighting" .. slot2.id)

		slot6:GetComponent("Animator").enabled = true

		slot6:GetComponent("DftAniEvent"):SetEndEvent(function (slot0)
			slot0.enabled = false
			slot3, slot2 = nil

			if slot1:getConfig("chapter_tag") == 1 then
				slot1 = slot2
				slot2 = slot3
			end

			if slot1.active then
				slot2 = slot5

				if slot1:existOni() then
					slot1 = slot6
					slot2 = slot7
				end
			end

			if slot1 then
				setActive(slot1, true)

				slot2.alpha = 1

				slot8:RecordTween("fighting" .. slot1.id, LeanTween.alphaCanvas(slot2, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
			end
		end)
	else
		setActive(slot5, true)
		setActive(slot6, false)

		slot8 = findTF(slot5, "info/bk/fordark")

		setActive(findTF(slot5, "circle/fordark"), slot4.icon_outline == 1)
		setActive(slot8, slot4.icon_outline == 1)

		slot9 = findTF(slot5, "circle/clear_flag")
		slot11 = GetOrAddComponent(slot8, "CanvasGroup")

		setText(findTF(slot8, "Text"), i18n("tag_level_fighting"))

		slot12 = findTF(slot5, "circle/oni")
		slot13 = GetOrAddComponent(slot12, "CanvasGroup")

		setText(findTF(slot12, "Text"), i18n("tag_level_oni"))

		slot15 = GetOrAddComponent(slot12, "CanvasGroup")

		setText(findTF(slot14, "Text"), i18n("tag_level_narrative"))
		setText(findTF(slot5, "info/bk/title_form/title_index"), slot4.chapter_name .. "  ")
		setText(findTF(slot5, "info/bk/title_form/title"), string.split(slot4.name, "|")[1])
		setText(findTF(slot5, "info/bk/title_form/title_en"), string.split(slot4.name, "|")[2] or "")
		setFillAmount(findTF(slot5, "circle/progress"), slot2.progress / 100)
		setText(findTF(slot5, "circle/progress_text"), string.format("%d%%", slot2.progress))
		setActive(findTF(slot5, "circle/stars"), slot2:existAchieve())

		if slot2:existAchieve() then
			for slot23, slot24 in ipairs(slot2.achieves) do
				setActive(slot18:Find("star" .. slot23 .. "/light"), ChapterConst.IsAchieved(slot24))
			end
		end

		slot0:DeleteTween("fighting" .. slot2.id)
		setActive(slot10, false)
		setActive(slot12, false)
		setActive(slot14, false)
		setActive(slot9, false)
		setActive(slot17, true)

		if not slot2:isUnlock() and not slot2:activeAlways() then
			setActive(slot5, false)
		else
			setActive(slot5, true)

			slot20, slot21 = nil

			if slot2:getConfig("chapter_tag") == 1 then
				slot20 = slot14
				slot21 = slot15
			end

			if slot2.active then
				slot20 = slot10
				slot21 = slot11

				if slot2:existOni() then
					slot20 = slot12
					slot21 = slot13
				end
			elseif slot2:isClear() then
				setActive(slot9, true)
				setActive(slot17, false)
			end

			if slot20 then
				setActive(slot20, true)

				slot21.alpha = 1

				slot0:RecordTween("fighting" .. slot2.id, LeanTween.alphaCanvas(slot21, 0, 0.5):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
			end
		end

		setActive(slot20, false)

		slot23 = findTF(slot5, "circle")

		LeanTween.cancel(go(slot23))

		slot23.localScale = Vector3.zero

		LeanTween.scale(slot23, Vector3(1, 1, 1), 0.2):setDelay(0.3)
		setAnchoredPosition(slot24, {
			x = -1 * slot5:Find("info").rect.width
		})
		shiftPanel(findTF(slot5, "info/bk"), 0, nil, 0.4, 0.4, true, true, nil, function ()
			if slot0 then
				setActive(slot1, true)
			end

			if slot2 then
				slot2()
			end
		end)

		if slot2:isTriesLimit() then
			slot25 = slot2:getConfig("count")

			setText(slot20:Find("label"), i18n("levelScene_chapter_count_tip"))
			setText(slot20:Find("Text"), setColorStr(slot25 - slot2:getTodayDefeatCount() .. "/" .. slot25, (slot25 <= slot2:getTodayDefeatCount() and COLOR_RED) or COLOR_GREEN))
		end

		slot26 = 0

		for slot30, slot31 in ipairs(slot25) do
			slot26 = math.max(slot26, (pg.expedition_activity_template[slot31] and slot32.bonus_time) or 0)
		end

		if pg.chapter_defense[slot2.id] then
			slot26 = math.max(slot26, slot27.bonus_time or 0)
		end

		slot28 = findTF(slot5, "mark")
		slot31 = slot2:getOniChapterInfo()

		setActive(slot28:Find("bonus"), not slot0.data:isRemaster() and slot26 > 0 and math.max(slot26 - slot2.todayDefeatCount, 0) > 0)
		setActive(slot28, not slot0.data.isRemaster() and slot26 > 0 and math.max(slot26 - slot2.todayDefeatCount, 0) > 0)

		if slot30 then
			slot33 = slot28.anchoredPosition.y
			slot28:GetComponent(typeof(CanvasGroup)).alpha = 0

			LeanTween.cancel(go(slot28))
			LeanTween.value(go(slot28), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)
				slot0.alpha = slot0
				slot0.anchoredPosition.y = slot2 * slot0
				slot0.anchoredPosition.anchoredPosition = slot0.anchoredPosition
			end)):setEase(LeanTweenType.easeOutSine):setDelay(0.7)
		end
	end

	onButton(slot0.sceneParent, (isActive(slot5) and slot5) or slot6, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0:InvokeParent("isfrozen") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-8, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-14, warpins: 2 ---
		if not slot1:isUnlock() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-30, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_tracking_error_pre", slot1:getPrevChapterName()))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-41, warpins: 2 ---
		if slot0.sceneParent.player.level < slot1:getConfig("unlocklevel") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-53, warpins: 1 ---
			pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_chapter_level_limit", slot0))

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 54-60, warpins: 2 ---
		slot1 = nil

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 61-69, warpins: 0 ---
		for slot5, slot6 in pairs(slot0.sceneParent.maps) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-66, warpins: 1 ---
			if slot6:getActiveChapter() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 67-67, warpins: 1 ---
				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 68-69, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 70-71, warpins: 2 ---
		if slot1 and slot1 ~= slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 75-82, warpins: 1 ---
			slot0:InvokeParent("emit", LevelMediator2.ON_STRATEGYING_CHAPTER)

			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 83-86, warpins: 3 ---
		if slot1.active then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 87-93, warpins: 1 ---
			slot0:InvokeParent("switchToChapter", slot1)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 94-107, warpins: 1 ---
			slot0:InvokeParent("displayChapterPanel", slot1, Vector3(slot2.localPosition.x - 10, slot2.localPosition.y + 150))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 108-108, warpins: 2 ---
		return
		--- END OF BLOCK #7 ---



	end, SFX_UI_WEIGHANCHOR_SELECT)
end

slot1.RefreshMapItems = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.chapterTFsById then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 2 ---
	slot1 = slot0.data

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-41, warpins: 0 ---
	for slot5, slot6 in pairs(slot0.chapterTFsById) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		if slot1:getChapter(slot5) and (slot7:isUnlock() or slot7:activeAlways()) and not slot7:ifNeedHide() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-35, warpins: 1 ---
			setActive(slot6, true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-39, warpins: 3 ---
			setActive(slot6, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 40-41, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 42-42, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

slot1.UpdateChapterTF = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot3 = slot0.data:getChapter(slot1)

	if slot0.chapterTFsById[slot1] and slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 1 ---
		slot0:UpdateMapItem(slot2, slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot1.TryOpenChapter = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.chapterTFsById[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-18, warpins: 1 ---
		triggerButton((isActive(slot2:Find("main")) and slot3) or slot2:Find("sub"))
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-22, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-23, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return slot1
