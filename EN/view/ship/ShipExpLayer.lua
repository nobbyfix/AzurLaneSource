slot0 = class("ShipExpLayer", import("..base.BaseUI"))
slot0.TypeDefault = 0
slot0.TypeClass = 1

function slot0.getUIName(slot0)
	return "ShipExpUI"
end

function slot0.init(slot0)
	slot0._grade = slot0:findTF("grade")
	slot0._gradeLabel = slot0:findTF("label", slot0._grade)
	slot0._levelText = slot0:findTF("Text", slot0._grade)
	slot0._main = slot0:findTF("main")
	slot0._leftPanel = slot0:findTF("leftPanel", slot0._main)
	slot0._topBar = slot0:findTF("topBar", slot0._leftPanel)
	slot0._expResult = slot0:findTF("expResult", slot0._leftPanel)
	slot0._expContainer = slot0:findTF("expContainer", slot0._expResult)
	slot0._extpl = slot0:getTpl("ShipCardTpl", slot0._expContainer)
	slot0._skipBtn = slot0:findTF("skipLayer")

	setActive(slot0._topBar, false)
end

function slot0.didEnter(slot0)
	slot0.tweenTFs = {}
	slot0.timerId = {}

	onButton(slot0, slot0._skipBtn, function ()
		uv0:skip()
	end, SFX_CONFIRM)
	pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})
	slot0:display()
end

function slot0.display(slot0)
	setActive(slot0._grade, true)
	setText(slot0._levelText, slot0.contextData.title)

	if slot0.contextData.type == uv0.TypeClass then
		setActive(slot0._gradeLabel, false)
	else
		setActive(slot0._gradeLabel, true)
		LoadImageSpriteAsync("battlescore/" .. (slot0.contextData.isCri and "grade_label_task_perfect" or "grade_label_task_complete"), slot0._gradeLabel, true)
	end

	setActive(slot0._topBar, slot0.contextData.top)

	if slot0.contextData.top then
		setText(slot0._topBar:Find("text_1"), slot1.text1)
		setText(slot0._topBar:Find("text_2"), slot1.text2)
		setText(slot0._topBar:Find("text_3"), slot1.text3)

		slot0._topBar:Find("progress"):GetComponent(typeof(Image)).fillAmount = slot1.progress
	end

	slot0._expTFs = {}
	slot0._nameTxts = {}
	slot0._skipExp = {}
	slot0._maxRightDelay = 0
	slot2 = {
		[slot7.id] = slot7
	}

	for slot6, slot7 in ipairs(slot0.contextData.newShips) do
	end

	slot4 = 0.5

	for slot8, slot9 in ipairs(slot3) do
		slot11 = cloneTplTo(slot0._extpl, slot0._expContainer)
		slot14 = findTF(slot11, "content")
		slot15 = ScrollTxt.New(findTF(slot14, "info/name_mask"), findTF(slot14, "info/name_mask/name"))
		slot11.transform.anchoredPosition = Vector3(slot11.transform.anchoredPosition.x + (16.2 + rtf(slot11).rect.width) * (slot8 - 1), slot11.transform.anchoredPosition.y, slot11.transform.anchoredPosition.z)
		slot0._expTFs[#slot0._expTFs + 1] = slot11
		slot0._nameTxts[#slot0._nameTxts + 1] = slot15

		flushShipCard(slot11, slot9)
		slot15:setText(slot9:getName())

		slot17 = findTF(slot14, "dockyard/lv_bg/levelUpLabel")
		slot18 = findTF(slot14, "dockyard/lv_bg/levelup")

		setText(slot16, slot9.level)

		slot20 = findTF(slot19, "exp_text")
		slot21 = findTF(slot19, "exp_progress")
		slot0._maxRightDelay = math.max(slot0._maxRightDelay, slot2[slot9.id].level - slot9.level + slot8 * 0.5)

		function slot22()
			SetActive(uv0, true)

			slot1 = uv2:getLevelExpConfig().exp
			uv3:GetComponent(typeof(Image)).fillAmount = uv1.exp / uv1:getLevelExpConfig().exp

			if uv1.level < uv2.level then
				for slot6 = uv1.level, uv2.level - 1, 1 do
					slot2 = 0 + uv1:getLevelExpConfig(slot6).exp
				end

				uv4:PlayAnimation(uv5, 0, slot2 + uv2.exp - uv1.exp, 1, 0, function (slot0)
					setText(uv0, "+" .. math.ceil(slot0))
				end)

				function slot3(slot0)
					SetActive(uv0, true)
					SetActive(uv1, true)
					LeanTween.moveY(rtf(uv0), uv0.localPosition.y + 30, 0.5):setOnComplete(System.Action(function ()
						SetActive(uv0, false)

						uv0.localPosition = uv1

						playSoundEffect(SFX_BOAT_LEVEL_UP)
					end))
					setText(uv2, slot0)
					table.insert(uv3.tweenTFs, uv0)
				end

				LeanTween.value(go(uv5), uv1.exp / slot0, 1, 0.5):setOnUpdate(System.Action_float(function (slot0)
					uv0:GetComponent(typeof(Image)).fillAmount = slot0
				end)):setOnComplete(System.Action(function ()
					uv1(uv0.level + 1)

					slot1 = 0.1

					while uv0.level + 1 + 1 <= uv2.level do
						slot2 = slot0

						LeanTween.value(go(uv3), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
							uv0:GetComponent(typeof(Image)).fillAmount = slot0
						end)):setDelay(slot1):setOnComplete(System.Action(function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-4, warpins: 1 ---
							uv0(uv1)

							return
							--- END OF BLOCK #0 ---



						end))

						slot1 = slot1 + 1
						slot0 = slot0 + 1
					end

					uv5.timerId[uv0.id] = pg.TimeMgr:GetInstance():AddTimer("delayTimer", slot1, 0, function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-38, warpins: 1 ---
						if uv0.level == uv0:getMaxLevel() then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 9-23, warpins: 1 ---
							uv1:GetComponent(typeof(Image)).fillAmount = 1
							uv2._skipExp[uv3] = false

							return
							--- END OF BLOCK #0 ---



						end

						uv2:PlayAnimation(uv4, 0, uv0.exp / uv5, 0.5, 0, function (slot0)

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-14, warpins: 1 ---
							uv0:GetComponent(typeof(Image)).fillAmount = slot0
							uv1._skipExp[uv2] = false

							return
							--- END OF BLOCK #0 ---



						end)

						return
						--- END OF BLOCK #0 ---



					end)
				end))
				table.insert(uv4.tweenTFs, uv5)

				return
			end

			setText(uv6, "+" .. math.ceil(uv2:getExp() - uv1:getExp()))

			if uv1.level == uv1:getMaxLevel() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 122-137, warpins: 1 ---
				uv3:GetComponent(typeof(Image)).fillAmount = 1
				uv4._skipExp[uv10] = false

				return
				--- END OF BLOCK #0 ---



			end

			uv4:PlayAnimation(uv5, uv1.exp / slot0, uv2.exp / slot0, 1, 0, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-14, warpins: 1 ---
				uv0:GetComponent(typeof(Image)).fillAmount = slot0
				uv1._skipExp[uv2] = false

				return
				--- END OF BLOCK #0 ---



			end)
		end

		slot0._skipExp[slot8] = function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-147, warpins: 1 ---
			LeanTween.cancel(go(uv0))
			LeanTween.cancel(go(uv1))
			SetActive(uv1, true)
			SetActive(uv2, true)
			setText(uv3, uv4.level)

			if uv5.level == uv5:getMaxLevel() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-60, warpins: 1 ---
				setText(uv6, "+" .. math.ceil(uv4:getExp() - uv5:getExp()))

				uv7:GetComponent(typeof(Image)).fillAmount = 1
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 61-123, warpins: 1 ---
				if uv5.level < uv4.level then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 67-94, warpins: 1 ---
					for slot4 = uv5.level, uv4.level - 1, 1 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 75-82, warpins: 2 ---
						slot0 = 0 + uv5:getLevelExpConfig(slot4).exp
						--- END OF BLOCK #0 ---



					end

					setText(uv6, "+" .. slot0 + uv4.exp - uv5.exp)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 95-107, warpins: 1 ---
					setText(uv6, "+" .. math.ceil(uv4.exp - uv5.exp))
					--- END OF BLOCK #0 ---



				end

				uv7:GetComponent(typeof(Image)).fillAmount = uv4.exp / uv4:getLevelExpConfig().exp
				--- END OF BLOCK #0 ---



			end

			SetActive(uv0, false)

			uv1:GetComponent("CanvasGroup").alpha = 1
			rtf(uv1).anchoredPosition = Vector2(rtf(uv1).anchoredPosition.x, 0)

			return
			--- END OF BLOCK #0 ---



		end

		slot23 = slot11:GetComponent("CanvasGroup")

		setActive(slot11, false)
		LeanTween.moveY(rtf(slot11), 0, 0.2):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			setActive(uv0, true)
			uv1()

			return
			--- END OF BLOCK #0 ---



		end)):setDelay(slot24)
		table.insert(slot0.tweenTFs, slot11)
		LeanTween.value(go(slot11), 0, 1, 0.2):setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			uv0.alpha = slot0

			return
			--- END OF BLOCK #0 ---



		end)):setDelay(slot8 * 0.2)
	end
end

function slot0.skip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	if _.any(slot0._skipExp, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-1, warpins: 1 ---
		return slot0
		--- END OF BLOCK #0 ---



	end) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-24, warpins: 1 ---
		for slot4 = 1, #slot0._skipExp, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-23, warpins: 2 ---
			if slot0._skipExp[slot4] then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-22, warpins: 1 ---
				slot0._skipExp[slot4]()

				slot0._skipExp[slot4] = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-29, warpins: 1 ---
		slot0:emit(BaseUI.ON_CLOSE)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.PlayAnimation(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	LeanTween.value(slot1.gameObject, slot2, slot3, slot4):setDelay(slot5):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		uv0(slot0)

		return
		--- END OF BLOCK #0 ---



	end))
	table.insert(slot0.tweenTFs, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-66, warpins: 1 ---
	for slot4, slot5 in pairs(slot0.tweenTFs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-20, warpins: 1 ---
		if LeanTween.isTweening(go(slot5)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-18, warpins: 1 ---
			LeanTween.cancel(go(slot5))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0.tweenTFs = nil

	for slot4, slot5 in pairs(slot0.timerId) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-37, warpins: 1 ---
		pg.TimeMgr:GetInstance():RemoveTimer(slot5)
		--- END OF BLOCK #0 ---



	end

	slot0.timerId = nil

	for slot4 = #slot0._nameTxts, 1, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-55, warpins: 2 ---
		slot0._nameTxts[slot4]:destroy()
		table.remove(slot0._nameTxts, slot4)
		--- END OF BLOCK #0 ---



	end

	slot0._nameTxts = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	return
	--- END OF BLOCK #0 ---



end

return slot0
