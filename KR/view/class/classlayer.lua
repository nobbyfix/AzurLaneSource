slot0 = class("ClassLayer", import("..base.BaseUI"))
slot0.HasEnteredClass = nil

slot0.setPlayer = function (slot0, slot1)
	slot0.playerVO = slot1
end

slot0.setResClass = function (slot0, slot1)
	slot0.resClass = slot1
end

slot0.setCourse = function (slot0, slot1)
	slot0.course = slot1
	slot2 = getProxy(BayProxy)
	slot0.studentVOs = _.map(slot1.students, function (slot0)
		return slot0:getShipById(slot0)
	end)
end

slot0.getUIName = function (slot0)
	return "ClassUI"
end

slot0.init = function (slot0)
	slot0.top = slot0:findTF("blur_panel/adapt/top")
	slot0.btnBack = slot0:findTF("back", slot0.top)
	slot0.desks = _.map({
		1,
		2,
		3,
		4,
		5
	}, function (slot0)
		return slot0:findTF("scene/desk" .. slot0)
	end)
	slot0.teacher = slot0:findTF("scene/teacher")
	slot0.btnHelp = slot0:findTF("btn_help", slot0.top)
	slot0.btnUpgrade = slot0:findTF("scene/bg_room/btn_upgrade")
	slot0.btnStart = slot0:findTF("scene/bg_room/btn_start")
	slot0.btnClass = slot0:findTF("scene/bg_room/btn_class")
	slot0.textNums = slot0:findTF("scene/bg_room/btn_class/Text")
	slot0.barProficiency = slot0:findTF("scene/bg_room/stock_bg/bar_exp/bar")
	slot0.barCurProficiency = slot0:findTF("scene/bg_room/stock_bg/bar_exp/current")
	slot0.textProficiency = slot0:findTF("scene/bg_room/stock_bg/bar_exp/Text")
	slot0.textStaticSpeed = slot0:findTF("scene/bg_room/stock_bg/speed2")
	slot0.textSpeed = slot0:findTF("scene/bg_room/stock_bg/speed")
	slot0.textClassOn = slot0:findTF("scene/bg_room/stock_bg/class_on")
	slot0.textClassOff = slot0:findTF("scene/bg_room/stock_bg/class_off")
	slot0.textDuration = slot0:findTF("scene/bg_room/stock_bg/duration")
	slot0.tipProficiency = slot0:findTF("proficiency", slot0.top)
	slot0.percentProficiency = slot0:findTF("Text", slot0.tipProficiency)
	slot0.chatProficiency = slot0:findTF("chat", slot0.tipProficiency)
	slot0.resourcePanel = slot0:findTF("resource_panel")

	setActive(slot0.teacher, false)
	setActive(slot0.resourcePanel, false)
	setActive(slot0.textDuration, false)
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0.btnBack, function ()
		if not slot0.course:inClass() and #slot0.course.students > 0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("course_exit_confirm"),
				onYes = function ()
					slot0:emit(ClassMediator.CLASS_CLEAR_STUDENT)
					slot0.emit:emit(slot1.ON_BACK)
				end
			})
		else
			slot0:emit(slot1.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnHelp, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("course_class_help")
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.btnUpgrade, function ()
		slot0:updateResourcePanel()
		setActive(slot0.resourcePanel, true)
		pg.UIMgr.GetInstance():BlurPanel(slot0.resourcePanel)
	end, SFX_PANEL)
	onButton(slot0, slot0.btnClass, function ()
		slot0:emit(ClassMediator.OPEN_DOCK)
	end, SFX_PANEL)
	onButton(slot0, slot0.btnStart, function ()
		if slot0.course:inClass() then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("course_stop_confirm"),
				onYes = function ()
					slot0:emit(ClassMediator.CLASS_STOP_COURSE)
				end
			})
		elseif #slot0.students == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("course_class_not_ready"))
		elseif slot0.proficiency == 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("course_proficiency_not_enough"))
		else
			slot1 = getProxy(BayProxy)

			if _.any(slot0.students, function (slot0)
				return slot0:getShipById(slot0) and slot1:getMaxLevel() <= slot1.level
			end) then
				pg.TipsMgr.GetInstance():ShowTips(i18n("course_student_max_level"))

				return
			end

			slot0:emit(ClassMediator.CLASS_START_COURSE, slot0.students)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.tipProficiency, function ()
		setText(slot0.chatProficiency:Find("Text"), i18n("course_proficiency_tip", pg.gameset.level_get_proficency.key_value, slot0.resClass:getConfig("proficency_get_percent") * slot0.course:getExtraRate()))
		setActive(slot0.chatProficiency, true)
		setButtonEnabled(slot0.tipProficiency, false)
		LeanTween.scale(rtf(slot0.chatProficiency), Vector3(1.5, 1.5, 1), 0.3):setFrom(Vector3.zero):setOnComplete(System.Action(function ()
			LeanTween.scale(rtf(slot0.chatProficiency), Vector3(0, 0, 0), 0.2):setDelay(2):setOnComplete(System.Action(function ()
				if not IsNil(slot0.tipProficiency) then
					setButtonEnabled(slot0.tipProficiency, true)
					setActive(slot0.chatProficiency, false)
				end
			end))
		end))
	end, SFX_PANEL)
	slot0:updateMainView()
	slot0:updateResourceTimer()

	if slot0.course:getDay() == 7 then
		pg.TipsMgr.GetInstance():ShowTips(i18n("course_sunday_tip"))
	end

	slot1 = "has_entered_class"

	if slot0.HasEnteredClass == nil then
		slot0.HasEnteredClass = PlayerPrefs.GetInt(slot1) or 0
	end

	if slot0.HasEnteredClass ~= 1 then
		slot0.HasEnteredClass = 1

		PlayerPrefs.SetInt(slot1, 1)
		PlayerPrefs.Save()
		triggerButton(slot0.btnHelp)
	end
end

slot0.uiStartAnimating = function (slot0)
	setAnchoredPosition(slot0.top, {
		y = 84
	})
	shiftPanel(slot0.top, nil, 0, slot2, slot1, true, true)

	slot0.tweens = topAnimation(slot0:findTF("bg/left", slot0.top), slot0:findTF("bg/right", slot0.top), slot0:findTF("bg/class", slot0.top), slot0:findTF("bg/title_class", slot0.top), 0.25, function ()
		slot0.tweens = nil
	end)
end

slot0.uiExitAnimating = function (slot0)
	shiftPanel(slot0.top, nil, 84, 0.3, 0, true, true)
end

slot0.onBackPressed = function (slot0)
	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.resourcePanel) then
		triggerButton(slot0.resourcePanel:Find("frame/btnBack"))
	else
		triggerButton(slot0.btnBack)
	end
end

slot0.updateMainView = function (slot0)
	if slot0.course.getExtraRate(slot1) > 1 then
		setText(slot0.percentProficiency, "<color=#92fc63>" .. slot0.resClass:getConfig("proficency_get_percent") * slot2 .. "%</color>")
	else
		setText(slot0.percentProficiency, slot0.resClass:getConfig("proficency_get_percent") .. "%")
	end

	setText(slot0.textSpeed, string.format("-%s/h", 60 * slot0.resClass:getConfig("proficency_cost_per_min")))
	setActive(slot0.textClassOn, slot1:inClass())
	setActive(slot0.textClassOff, not slot1:inClass())
	setActive(slot0.textDuration, slot1:inClass())
	setActive(slot0.textSpeed, slot1:inClass())
	setActive(slot0.textStaticSpeed, slot1:inClass())

	if slot1:inClass() then
		slot0:updateEffect()

		if not slot0.effectTimer then
			slot0.effectTimer = Timer.New(function ()
				slot0:updateEffect()
			end, 1, -1)

			slot0.effectTimer:Start()
		end
	else
		if slot0.effectTimer then
			slot0.effectTimer:Stop()

			slot0.effectTimer = nil
		end

		setText(slot0.textProficiency, slot1.proficiency .. "/" .. slot0.resClass:getConfig("store"))

		slot0.barProficiency:GetComponent(typeof(Image)).fillAmount = slot1.proficiency / slot0.resClass:getConfig("store")
		slot0.barCurProficiency:GetComponent(typeof(Image)).fillAmount = slot1.proficiency / slot0.resClass:getConfig("store")
	end

	if not slot1:existCourse() then
		setActive(slot0.teacher, false)
		_.each(slot0.desks, function (slot0)
			setActive(slot0, false)
		end)
		setActive(slot0.btnStart, false)
		setActive(slot0.btnClass, false)

		return
	end

	slot3 = 0
	slot4 = {}

	if slot1:inClass() then
		slot3, slot4 = AcademyCourse.GetProficiencyAchieved(slot0.resClass:getConfigTable(), slot1.proficiency, math.min(pg.TimeMgr.GetInstance():GetServerTime() - slot1.timestamp, AcademyCourse.MaxStudyTime), slot0.studentVOs)
	end

	setActive(slot0.btnStart:Find("start"), not slot1:inClass())
	setActive(slot0.btnStart:Find("end"), slot1:inClass())
	setGray(slot0.btnStart, slot1:inClass())
	setActive(slot0.btnClass, true)
	setText(slot0.btnClass:Find("Text"), #slot1.students .. "/" .. AcademyCourse.MaxStudentSlot)
	setActive(slot0.teacher, true)
	slot0:updateShipModel(slot7, Ship.New({
		id = slot1:getConfig("id"),
		configId = slot1.getConfig("id")
	}).getPrefab(slot6), function (slot0)
		slot0.transform.localScale = Vector3(1, 1, 1)

		slot0:GetComponent("SpineAnimUI"):SetAction("stand2", 0)
	end)
	GetImageSpriteFromAtlasAsync(slot1:getConfig("icon"), "", slot0.teacher:Find("pop/icon"))
	onButton(slot0, slot0.teacher:Find("pop"), function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = slot0:getConfig("name")
		})
	end, SFX_PANEL)

	for slot11, slot12 in ipairs(slot0.desks) do
		function slot17()
			slot0:emit(ClassMediator.OPEN_DOCK)
		end

		removeOnButton(slot14)
		removeOnButton(slot13)
		setActive(slot14, slot16)
		setActive(slot15, false)

		if not slot1:inClass() then
			setActive(slot15, not slot16 and slot11 == #slot0.studentVOs + 1)
			onButton(slot0, slot13, slot17, SFX_PANEL)
			onButton(slot0, slot14, slot17, SFX_PANEL)
			onButton(slot0, slot15, slot17, SFX_PANEL)
		end

		slot0:updateShipModel(slot14, slot16 and slot16:getPrefab(), function (slot0)
			slot0.transform.localScale = Vector3(-0.8, 0.8, 1)

			slot0:GetComponent("SpineAnimUI"):SetAction("sit", 0)
		end)
	end
end

slot0.updateShipModel = function (slot0, slot1, slot2, slot3)
	if (slot1.childCount > 0 and slot1:GetChild(0).gameObject and slot1.childCount > 0 and slot1.GetChild(0).gameObject.name) ~= slot2 then
		if slot4 then
			PoolMgr.GetInstance():ReturnSpineChar(slot4.name, slot4)
		end

		if slot2 then
			PoolMgr.GetInstance():GetSpineChar(slot2, true, function (slot0)
				if slot0.exited then
					PoolMgr.GetInstance():ReturnSpineChar(PoolMgr.GetInstance().ReturnSpineChar, slot0)
				end

				setActive(slot0, true)

				slot0.name = setActive

				slot0.transform:SetParent(slot0.transform, false)

				slot0.transform.localPosition = Vector3.zero

				if slot0.transform then
					slot3(slot0)
				end
			end)
		end
	end
end

slot0.updateEffect = function (slot0)
	slot2 = 0
	slot3 = {}

	if slot0.course:inClass() then
		slot2, slot3 = AcademyCourse.GetProficiencyAchieved(slot0.resClass:getConfigTable(), slot1.proficiency, math.min(pg.TimeMgr.GetInstance():GetServerTime() - slot1.timestamp, AcademyCourse.MaxStudyTime), slot0.studentVOs)
	end

	setText(slot0.textDuration, pg.TimeMgr.GetInstance():DescCDTime(math.min(slot5, AcademyCourse.MaxStudyTime)))
	setText(slot0.textProficiency, slot1.proficiency .. "<color=#92fc63>(-" .. slot2 .. ")</color>/" .. slot0.resClass:getConfig("store"))

	slot0.barProficiency:GetComponent(typeof(Image)).fillAmount = slot1.proficiency / slot0.resClass:getConfig("store")
	slot0.barCurProficiency:GetComponent(typeof(Image)).fillAmount = math.max(slot1.proficiency - slot2, 0) / slot0.resClass:getConfig("store")

	if pg.TimeMgr.GetInstance():GetServerTime() - slot1.timestamp < AcademyCourse.MaxStudyTime and slot5 > 0 and slot5 % 60 == 0 then
		slot6 = {}

		if slot2 < slot1.proficiency then
			for slot10, slot11 in ipairs(slot0.studentVOs) do
				slot11:addExp(slot3[slot10])

				if slot11.level < slot11:getMaxLevel() then
					setActive(slot12, true)
					table.insert(slot6, slot0.desks[slot10]:Find("exp"))
				end
			end
		end

		if #slot6 > 0 then
			slot7 = Vector2(4, 95)
			slot8 = Vector2(4, 180)

			LeanTween.value(slot0._go, 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
				slot1 = Vector2.Lerp(slot0, Vector2.Lerp, slot0)

				_.each(_.each, function (slot0)
					slot0.anchoredPosition = slot0

					setImageAlpha(slot0, 1 - slot1)
				end)
			end)):setOnComplete(System.Action(function ()
				_.each(_.each, function (slot0)
					setActive(slot0, false)
				end)
			end))
		end
	end

	if math.random(0, 20) <= 1 and slot0.desks[math.floor(math.random(1, 6))] and isActive(slot7:Find("ship")) and not isActive(slot7:Find("chat")) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 224-231, warpins: 1 ---
		slot0:showShipFace(slot7:Find("chat"))
		--- END OF BLOCK #0 ---



	end
end

slot0.showShipFace = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-67, warpins: 1 ---
	setActive(slot1, true)
	LeanTween.alpha(go(slot1), 1, 0.3):setFrom(0)
	LeanTween.scale(go(slot1), Vector3(1, 1, 1), 0.3):setFrom(Vector3.zero)
	LeanTween.alpha(go(slot1), 0, 0.3):setDelay(3)
	LeanTween.scale(go(slot1), Vector3.zero, 0.3):setDelay(3):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		setActive(setActive, false)

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

slot0.updateResourcePanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-133, warpins: 1 ---
	slot0:onCloseRsourcePanel()
	setImageAlpha(slot1, 1)
	blinkAni(go(slot1), 0.8)
	setImageAlpha(slot2, 1)
	blinkAni(go(slot2), 0.8)
	setImageAlpha(slot3, 1)
	blinkAni(go(slot3), 0.8)

	slot5 = slot0.resClass.bindConfigTable(slot4)
	slot6 = slot0.resourcePanel:Find("frame/content/upgrade_btn")
	slot7 = slot0.resourcePanel:Find("frame/content/upgrading_block")
	slot8 = slot6:Find("Image")
	slot9 = slot6:Find("cost")
	slot10 = slot0.resourcePanel:Find("frame/upgrade_duration/Text")
	slot11 = slot0.resourcePanel:Find("frame/content/info/store")
	slot12 = slot0.resourcePanel:Find("frame/content/info/rate")
	slot13 = slot0.resourcePanel:Find("frame/content/info/exp")
	slot14 = slot0.resourcePanel:Find("frame/content/info/level/curr")
	slot15 = slot0.resourcePanel:Find("frame/content/info/level/next")
	slot16 = slot0.resourcePanel:Find("frame/btnBack")
	slot17 = slot0.resourcePanel:Find("mengban")

	setText(slot0.resourcePanel:Find("frame/title/icon/current"), "Lv." .. slot0.resClass:GetLevel())

	slot20 = slot5[slot0.resClass.GetLevel(slot4)]
	slot21 = slot5[slot5.all[#slot5.all]]

	if slot0.resClass.GetLevel(slot4) == slot5.all[#slot5.all] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 134-187, warpins: 1 ---
		setActive(slot8, true)
		setActive(slot7, false)
		setButtonEnabled(slot6, false)
		setText(slot9, "-")
		setText(slot10, "-")
		setText(slot14, "Lv.Max")
		setText(slot15, "-")
		slot0:setBar(slot11, slot20.store, 0, slot21.store)
		slot0:setBar(slot12, slot20.proficency_get_percent, 0, slot21.proficency_get_percent, "%")
		slot0:setBar(slot13, slot20.proficency_cost_per_min * 60, 0, slot21.proficency_cost_per_min * 60, "/h")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 188-232, warpins: 1 ---
		slot0:setBar(slot11, slot20.store, slot23, slot21.store)
		slot0:setBar(slot12, slot20.proficency_get_percent, slot24, slot21.proficency_get_percent, "%")
		slot0:setBar(slot13, slot20.proficency_cost_per_min * 60, (slot5[slot18 + 1].proficency_cost_per_min - slot20.proficency_cost_per_min) * 60, slot21.proficency_cost_per_min * 60, "/h")
		setText(slot9, (slot20.use[2] <= slot0.playerVO.gold and slot20.use[2]) or "<color=#FB4A2C>" .. slot20.use[2] .. "</color>")
		setText(slot14, "Lv." .. slot18)
		setText(slot15, "Lv." .. slot18 + 1)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 242-259, warpins: 2 ---
		if slot4:GetUpgradeTimeStamp() == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 260-289, warpins: 1 ---
			setActive(slot7, false)
			setText(slot10, pg.TimeMgr.GetInstance():DescCDTime(slot20.time))
			setButtonEnabled(slot6, true)
			setActive(slot8, true)
			onButton(slot0, slot6, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:emit(ClassMediator.CLASS_UPGRADE, slot0)

				return
				--- END OF BLOCK #0 ---



			end, SFX_UI_ACADEMY_LVLUP)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 290-314, warpins: 1 ---
			setActive(slot8, false)
			setActive(slot7, true)
			setButtonEnabled(slot6, false)

			slot0.resTickTimer = pg.TimeMgr:GetInstance():AddTimer("tick_timer", 0, 1, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				if slot0:GetDuration() and slot0 > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 10-20, warpins: 1 ---
					setText(setText, pg.TimeMgr.GetInstance():DescCDTime(slot0))
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 21-21, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 315-329, warpins: 3 ---
	local function slot22()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		slot0:onCloseRsourcePanel()
		setActive(slot0.resourcePanel, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.resourcePanel, slot0._tf)

		return
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot17, slot22, SFX_CANCEL)
	onButton(slot0, slot16, slot22, SFX_CANCEL)

	return
	--- END OF BLOCK #1 ---



end

slot0.setBar = function (slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0:setSliderValue(slot6, (slot2 + slot3) / slot4)
	slot0:setSliderValue(slot7, slot2 / slot4)
	setText(slot1:Find("current"), slot2 .. (slot5 or "") .. "/" .. slot4 .. (slot5 or ""))

	slot8 = slot1:Find("advance")

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-41, warpins: 2 ---
	if slot3 <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 42-46, warpins: 1 ---
		setActive(slot8, false)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-58, warpins: 1 ---
		setActive(slot8, true)
		setText(slot8, "[+" .. slot3 .. slot5 .. "]")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 59-59, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.setSliderValue = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	setFillAmount(slot1, (slot2 == 0 and slot2) or math.max(slot2, 0.08))

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-14, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

slot0.onCloseRsourcePanel = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-33, warpins: 1 ---
	LeanTween.cancel(go(slot0.resourcePanel:Find("frame/content/info/store/prev")))
	LeanTween.cancel(go(slot0.resourcePanel:Find("frame/content/info/rate/prev")))
	LeanTween.cancel(go(slot0.resourcePanel:Find("frame/content/info/exp/prev")))

	if slot0.resTickTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-44, warpins: 1 ---
		pg.TimeMgr:GetInstance():RemoveTimer(slot0.resTickTimer)

		slot0.resTickTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 45-45, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateResourceTimer = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.resTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-14, warpins: 1 ---
		pg.TimeMgr:GetInstance():RemoveTimer(slot0.resTimer)

		slot0.resTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-21, warpins: 2 ---
	if slot0.resClass:GetUpgradeTimeStamp() > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-34, warpins: 1 ---
		slot0.resTimer = pg.TimeMgr:GetInstance():AddTimer("timer", 0, 1, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			if not slot0.resClass:GetDuration() or slot0 <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-16, warpins: 2 ---
				slot0:emit(ClassMediator.CLASS_UPGRADE_TIMES_UP)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 17-17, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-36, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	LeanTween.cancel(slot0._go)

	if slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		cancelTweens(slot0.tweens)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-15, warpins: 2 ---
	if isActive(slot0.resourcePanel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-31, warpins: 1 ---
		slot0:onCloseRsourcePanel()
		setActive(slot0.resourcePanel, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.resourcePanel, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 32-48, warpins: 2 ---
	slot0:updateShipModel(slot0.teacher:Find("ship"), nil)
	_.each(slot0.desks, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		slot0:updateShipModel(slot0:Find("ship"), nil)
		LeanTween.cancel(go(slot0:Find("chat")))

		return
		--- END OF BLOCK #0 ---



	end)

	if slot0.resTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-59, warpins: 1 ---
		pg.TimeMgr:GetInstance():RemoveTimer(slot0.resTimer)

		slot0.resTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 60-62, warpins: 2 ---
	if slot0.effectTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-68, warpins: 1 ---
		slot0.effectTimer:Stop()

		slot0.effectTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 69-70, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

return slot0
