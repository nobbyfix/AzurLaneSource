slot0 = class("AnswerScene", import("..base.BaseUI"))
slot0.Idle = "stand"
slot0.HandsUp = "attack"

function slot0.getUIName(slot0)
	return "AnswerUI"
end

function slot0.setActivity(slot0, slot1)
	slot0.activity = slot1
end

function slot0.init(slot0)
	slot0.top = slot0:findTF("top")
	slot0.btnBack = slot0:findTF("back", slot0.top)
	slot0.btnHelp = slot0:findTF("btnHelp")
	slot0.layerSelection = slot0:findTF("layer_selection")
	slot0.layerProcess = slot0:findTF("layer_process")
	slot0.layerResult = slot0:findTF("layer_result")
	slot0.resources = slot0:findTF("resources")

	setActive(slot0.layerSelection, false)
	setActive(slot0.layerProcess, false)
	setActive(slot0.layerResult, false)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.btnBack, function ()
		if uv0.isTweening then
			return
		end

		if isActive(uv0.layerProcess) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("answer_exit_tip"),
				onYes = function ()
					uv0:emit(uv1.ON_BACK)
				end
			})
		else
			uv0:emit(uv1.ON_BACK)
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0.btnHelp, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("answer_help_tip")
		})
	end, SFX_PANEL)
	slot0:displaySelection()
end

function slot0.onBackPressed(slot0)
	if slot0.isTweening then
		return
	end

	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0.btnBack)
end

function slot0.displaySelection(slot0)
	setActive(slot0.layerSelection, true)

	slot1 = slot0.layerSelection:Find("panel")
	slot2 = slot1:Find("name")
	slot4 = slot1:Find("confirm")
	slot5 = slot1:Find("cancel")
	slot6 = getProxy(AnswerProxy)

	for slot10 = 0, slot1:Find("subjects").childCount - 1, 1 do
		setText(slot3:GetChild(slot10):Find("score"), slot6:getScore(slot10) or "--")
		setToggleEnabled(slot11, slot6:isSubjectOpen(slot0.activity, slot10))
		setActive(slot11:Find("lock"), not slot6.isSubjectOpen(slot0.activity, slot10))
	end

	setText(slot2, getProxy(PlayerProxy):getRawData().name)

	slot0.isTweening = true

	LeanTween.value(go(slot1), 0, 1, 0.7):setOnUpdate(System.Action_float(function (slot0)
		uv0.localScale = Vector3(slot0, slot0, 1)
		uv0.localEulerAngles = Vector3(0, 0, 720 * slot0)
	end)):setOnComplete(System.Action(function ()
		uv0.isTweening = false
	end)):setEase(LeanTweenType.easeInOutSine)
	onButton(slot0, slot4, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-32, warpins: 1 ---
		for slot3 = 0, uv0.childCount - 1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-31, warpins: 2 ---
			if getToggleState(uv0:GetChild(slot3)) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-31, warpins: 1 ---
				uv1:hideSelection()
				uv1:emit(AnswerMediator.ANSWER_START, uv1.activity.id, slot3)

				break
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_CONFIRM)
	onButton(slot0, slot5, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		triggerButton(uv0.btnBack)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
end

function slot0.hideSelection(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0.layerSelection, false)

	return
	--- END OF BLOCK #0 ---



end

function slot0.startProcess(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-59, warpins: 1 ---
	setActive(slot0.layerProcess, true)

	slot4 = slot0.layerProcess:Find("prepare").Find(slot3, "tips")
	slot5 = slot0.layerProcess:Find("count_down")
	slot6 = slot5:Find("progress")
	slot7 = slot5:Find("time")
	slot8 = slot5:Find("question")
	slot9 = slot5:Find("answer1")
	slot10 = slot5:Find("answer2")
	slot11 = slot0.layerProcess:Find("ship_left")
	slot12 = slot0.layerProcess:Find("ship_right")
	slot13 = nil
	process = coroutine.create(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-491, warpins: 1 ---
		slot0 = uv0.activity:getConfig("config_client")
		slot1 = slot0.pretime
		slot2 = slot0.answertime
		slot3 = slot0.endtime
		slot4 = uv0.activity:getConfig("config_data")[1][1]
		slot6 = Ship.New({
			id = 2,
			configId = Answer.Ship2
		})

		if uv1.childCount == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-47, warpins: 1 ---
			uv0:loadShip(Ship.New({
				id = 1,
				configId = Answer.Ship1
			}):getPrefab(), uv1, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				onNextTick(uv0)

				return
				--- END OF BLOCK #0 ---



			end)
			coroutine.yield()
			--- END OF BLOCK #0 ---



		end

		if uv3.childCount == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-63, warpins: 1 ---
			uv0:loadShip(slot6:getPrefab(), uv3, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				onNextTick(uv0)

				return
				--- END OF BLOCK #0 ---



			end)
			coroutine.yield()
			--- END OF BLOCK #0 ---



		end

		slot7 = uv1:GetChild(0):GetComponent(typeof(SpineAnimUI))
		slot8 = uv3:GetChild(0):GetComponent(typeof(SpineAnimUI))

		while 1 <= #uv4 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 91-474, warpins: 1 ---
			if uv0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 96-97, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			if uv4[slot9].type ~= 0 or not slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 105-105, warpins: 2 ---
				slot11 = slot6
				--- END OF BLOCK #0 ---



			end

			slot13 = slot10.type == 0 and slot7 or slot8

			setActive(uv5, true)
			setActive(uv6, false)
			setText(uv7, i18n("answer_answer_role", slot11:getName()))
			setImageAlpha(uv1:Find("spot_light"), 0)
			setImageAlpha(uv3:Find("spot_light"), 0)
			slot7:SetAction(uv8.Idle, 0)
			slot8:SetAction(uv8.Idle, 0)
			LeanTween.textAlpha(uv7, 1, slot15)
			LeanTween.textAlpha(uv7, 0, slot15):setDelay(slot1 - 0.3):setOnComplete(System.Action(uv2))
			LeanTween.alpha(slot10.type == 0 and uv1 or uv3:Find("spot_light"), 1, 0.3):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				uv0:SetAction(uv1.HandsUp, 0)

				return
				--- END OF BLOCK #0 ---



			end))
			coroutine.yield()

			slot16, slot17 = nil
			uv9.sizeDelta.x = 746
			uv9.sizeDelta = uv9.sizeDelta

			setActive(uv5, false)
			setActive(uv6, true)
			setText(uv11, slot10:getConfig("qusetion"))
			setActive(uv12:Find("correct"), false)
			setActive(uv12:Find("wrong"), false)
			setActive(uv13:Find("correct"), false)
			setActive(uv13:Find("wrong"), false)
			setButtonEnabled(uv12, true)
			setButtonEnabled(uv13, true)
			setText(uv12:Find("text"), "A." .. (math.random() >= 0.5 and slot10:getConfig("incorrect_answer") or slot10:getConfig("correct_answer")))
			setText(uv13:Find("text"), "B." .. (math.random() >= 0.5 and slot10:getConfig("correct_answer") or slot10:getConfig("incorrect_answer")))
			onButton(uv0, uv12, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				uv0 = 0

				uv1()

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			onButton(uv0, uv13, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				uv0 = 1

				uv1()

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			coroutine.yield()
			LeanTween.cancel(LeanTween.value(go(uv9), slot2, 0, slot2):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-19, warpins: 1 ---
				uv0.sizeDelta.x = slot0 / uv1 * 746
				uv0.sizeDelta = uv0.sizeDelta
				uv2 = slot0

				setText(uv3, math.ceil(slot0) .. "s")

				return
				--- END OF BLOCK #0 ---



			end)):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				uv0 = 0

				uv1()

				return
				--- END OF BLOCK #0 ---



			end)).uniqueId)
			setButtonEnabled(uv12, false)
			setButtonEnabled(uv13, false)

			if (slot10.type == 0 and 0 or 1) + (math.random() >= 0.5 and 1 or 0) == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 385-401, warpins: 1 ---
				setActive(uv12:Find("wrong"), true)
				setActive(uv13:Find("correct"), true)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 402-417, warpins: 1 ---
				setActive(uv12:Find("correct"), true)
				setActive(uv13:Find("wrong"), true)
				--- END OF BLOCK #0 ---



			end

			if not slot16 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 426-427, warpins: 2 ---
				slot10.select = slot10.type == 0 and 1 or 0
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 434-434, warpins: 2 ---
				slot10.select = slot14 and 1 - slot16 or slot16
				--- END OF BLOCK #0 ---



			end

			slot4 = slot4 + _.reduce(slot21, 0, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-13, warpins: 1 ---
				if slot1[1] >= uv0 or not math.max(slot0, slot1[2]) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 12-12, warpins: 2 ---
					slot2 = slot0
					--- END OF BLOCK #0 ---



				end

				return slot2
				--- END OF BLOCK #0 ---



			end)
			slot10.restTime = math.floor(slot17 * 10)

			Timer.New(uv2, slot3, 1):Start()
			coroutine.yield()

			if uv0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 470-471, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			slot9 = slot9 + 1
			--- END OF BLOCK #0 ---



		end

		uv0:emit(AnswerMediator.ANSWER_SUBMIT, uv0.activity.id, uv14, _.map(uv4, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			return {
				id = slot0.id,
				answer = slot0.select,
				time = slot0.restTime
			}
			--- END OF BLOCK #0 ---



		end), slot4)

		return
		--- END OF BLOCK #0 ---



	end)

	function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0, slot1 = coroutine.resume(process)

		return
		--- END OF BLOCK #0 ---



	end()

	return
	--- END OF BLOCK #0 ---



end

function slot0.loadShip(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	PoolMgr.GetInstance():GetSpineChar(slot1, true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-45, warpins: 1 ---
		if uv0.exited then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-13, warpins: 1 ---
			PoolMgr.GetInstance():ReturnSpineChar(uv1, slot0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-44, warpins: 1 ---
			setParent(slot0, uv2, false)
			slot0.transform:SetAsFirstSibling()

			slot0.transform.localScale = Vector3.New(0.8, 0.8, 1)

			slot0:GetComponent(typeof(SpineAnimUI)):SetAction(uv3.Idle, 0)
			uv4()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.displayResult(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-79, warpins: 1 ---
	setActive(slot0.layerProcess, false)
	setActive(slot0.top, false)
	setActive(slot0.btnHelp, false)
	setActive(slot0.layerResult, true)

	slot5 = slot0.layerResult:Find("top")
	slot6 = slot0.layerResult:Find("left")
	slot7 = slot0.layerResult:Find("right")
	slot8 = slot0.layerResult:Find("alpha"):GetComponent(typeof(CanvasGroup))
	slot9 = slot0.layerResult:Find("score")
	slot10 = slot0.layerResult:Find("btnReset")

	setImageSprite(slot4, getImageSprite(slot0.resources:Find(tostring(slot1))))

	process = coroutine.create(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-133, warpins: 1 ---
		uv0.alpha = 0

		setText(uv1, "")
		setActive(uv2, false)
		setAnchoredPosition(uv3, {
			y = uv3.rect.height
		})
		setAnchoredPosition(uv4, {
			x = -uv4.rect.width
		})
		setAnchoredPosition(uv5, {
			x = uv5.rect.width
		})

		uv6.isTweening = true

		LeanTween.moveY(uv3, 0, 0.5):setEase(LeanTweenType.easeOutSine)
		LeanTween.moveX(uv4, 0, 0.5):setDelay(0.5):setEase(LeanTweenType.easeOutSine)
		LeanTween.moveX(uv5, 0, 0.5):setDelay(0.6):setEase(LeanTweenType.easeOutSine)
		LeanTween.value(go(uv0), 0, 1, 0.5):setDelay(1.1):setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			uv0.alpha = slot0

			return
			--- END OF BLOCK #0 ---



		end)):setOnComplete(System.Action(uv7))
		coroutine.yield()
		setText(uv1, uv8)
		setActive(uv2, true)
		onButton(uv6, uv2, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-20, warpins: 1 ---
			setActive(uv0.layerResult, false)
			setActive(uv0.top, true)
			setActive(uv0.btnHelp, true)
			uv0:displaySelection()

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		if uv9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 128-129, warpins: 1 ---
			uv9()
			--- END OF BLOCK #0 ---



		end

		uv6.isTweening = false

		return
		--- END OF BLOCK #0 ---



	end)

	function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0, slot1 = coroutine.resume(process)

		return
		--- END OF BLOCK #0 ---



	end()

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-65, warpins: 1 ---
	LeanTween.cancelAll(false)

	slot2 = slot0.layerProcess:Find("ship_right")

	if slot0.layerProcess:Find("ship_left").childCount > 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-39, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(Ship.New({
			id = 1,
			configId = Answer.Ship1
		}).getPrefab(slot3), slot1:GetChild(0).gameObject)
		--- END OF BLOCK #0 ---



	end

	if slot2.childCount > 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-64, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(Ship.New({
			id = 2,
			configId = Answer.Ship2
		}).getPrefab(slot3), slot2:GetChild(0).gameObject)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

return slot0
