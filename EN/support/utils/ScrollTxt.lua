ScrollTxt = class("ScrollTxt")
ScrollTxt._speed = 10
ScrollTxt._delayTime = 0.5
ScrollTxt._padding = 4

ScrollTxt.Ctor = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._mask = GetOrAddComponent(slot1, typeof(RectMask2D))

	if slot4 == nil then
	end

	slot0._vertical = slot4

	if slot3 == nil then
	end

	slot0._notSensitive = slot3
	slot0._maskRTF = slot1:GetComponent(typeof(RectTransform))

	slot0:setMaskEnable(slot5)

	slot0._txt = slot2:GetComponent(typeof(Text))
	slot0._txtRTF = slot2:GetComponent(typeof(RectTransform))

	slot0:setBaseSize(slot0._txtRTF)

	slot0._txtRect = slot0._txtRTF.rect
end

ScrollTxt.changeToScroll = function (slot0, slot1)
	slot1:GetComponent(typeof(Text)).enabled = false
	ScrollTxt.New(slot1, cloneTplTo(slot1, slot1))._txtIsClone = true

	return ScrollTxt.New(slot1, cloneTplTo(slot1, slot1))
end

ScrollTxt.setBaseSize = function (slot0, slot1)
	slot1.localScale = Vector3.one
	slot1.anchorMin = Vector2(0.5, 0.5)
	slot1.anchorMax = Vector2(0.5, 0.5)
	slot1.pivot = Vector2(0.5, 0.5)
	slot1.anchoredPosition = Vector2.zero
end

ScrollTxt.setText = function (slot0, slot1)
	slot0:clear()

	slot0._txt.text = tostring(slot1)

	slot0:delayBegin()
end

ScrollTxt.delayBegin = function (slot0)
	slot0.timer = Timer.New(function ()
		slot0:begin()
	end, 0.1, 1):Start()
end

ScrollTxt.preCalFunc = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = nil

	if slot0._vertical then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		if slot0:checkOverlength() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-46, warpins: 1 ---
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._maskRTF.rect.width, slot0._txt.preferredHeight)

			slot0:setMaskEnable(true)

			slot0._topLimit = (slot0._txt.preferredHeight - slot0._maskRTF.rect.height) * 0.5 + slot0._padding
			slot0._bottomLimit = -((slot0._txt.preferredHeight - slot0._maskRTF.rect.height) * 0.5 + slot0._padding)
			slot0._tweenTime = ((slot0._txt.preferredHeight - slot0._maskRTF.rect.height) * 0.5 + slot0._padding) / slot0._speed
			slot0._txtRTF.anchoredPosition = Vector2.New(0, slot0._bottomLimit)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-66, warpins: 1 ---
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._maskRTF.rect.width, slot0._maskRTF.rect.height)

			slot0:setMaskEnable(false)

			slot0._txtRTF.anchoredPosition = Vector2.zero
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 67-71, warpins: 1 ---
		if slot0:checkOverlength() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-108, warpins: 1 ---
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._txt.preferredWidth, slot0._maskRTF.rect.height)

			slot0:setMaskEnable(true)

			slot0._leftLimit = -((slot0._txt.preferredWidth - slot0._maskRTF.rect.width) * 0.5 + slot0._padding)
			slot0._rightLimit = (slot0._txt.preferredWidth - slot0._maskRTF.rect.width) * 0.5 + slot0._padding
			slot0._tweenTime = ((slot0._txt.preferredWidth - slot0._maskRTF.rect.width) * 0.5 + slot0._padding) / slot0._speed
			slot0._txtRTF.anchoredPosition = Vector2.New(slot0._rightLimit, 0)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 109-127, warpins: 1 ---
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._maskRTF.rect.width, slot0._maskRTF.rect.height)

			slot0:setMaskEnable(false)

			slot0._txtRTF.anchoredPosition = Vector2.zero
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 128-128, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

ScrollTxt.begin = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if IsNil(slot0._maskRTF) or IsNil(slot0._txt) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-17, warpins: 2 ---
	slot0:preCalFunc()

	if slot0._vertical then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-22, warpins: 1 ---
		if slot0:checkOverlength() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-26, warpins: 1 ---
			slot0:startTweenVertical()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-31, warpins: 1 ---
		if slot0:checkOverlength() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 32-34, warpins: 1 ---
			slot0:startTween()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-35, warpins: 4 ---
	return
	--- END OF BLOCK #2 ---



end

ScrollTxt.checkOverlength = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._vertical then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		return slot0._maskRTF.rect.height ~= 0 and slot0._maskRTF.rect.height < slot0._txt.preferredHeight
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-20, warpins: 2 ---
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-25, warpins: 1 ---
		return slot0._maskRTF.rect.width ~= 0 and slot0._maskRTF.rect.width < slot0._txt.preferredWidth
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-36, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 37-37, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

ScrollTxt.startTween = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if IsNil(slot0._maskRTF) or IsNil(slot0._txt) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-34, warpins: 1 ---
	LeanTween.moveX(slot0._txtRTF, slot0._leftLimit, slot0._tweenTime):setFrom(slot0._rightLimit):setDelay(slot0._delayTime):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		LeanTween.delayedCall(go(slot0._txtRTF), slot0._delayTime, System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			slot0._txtRTF.anchoredPosition = Vector2.New(slot0._rightLimit, 0)

			slot0._txtRTF:startTween()

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-35, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

ScrollTxt.startTweenVertical = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if IsNil(slot0._maskRTF) or IsNil(slot0._txt) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-34, warpins: 1 ---
	LeanTween.moveY(slot0._txtRTF, slot0._topLimit, slot0._tweenTime):setFrom(slot0._bottomLimit):setDelay(slot0._delayTime):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		LeanTween.delayedCall(go(slot0._txtRTF), slot0._delayTime, System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			slot0._txtRTF.anchoredPosition = Vector2.New(0, slot0._bottomLimit)

			slot0._txtRTF:startTweenVertical()

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-35, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

ScrollTxt.setMaskEnable = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0._notSensitive and slot0._mask then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-10, warpins: 1 ---
		slot0._mask.enabled = slot1

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-23, warpins: 1 ---
			slot0._maskRTF.gameObject:SetActive(false)
			slot0._maskRTF.gameObject:SetActive(true)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-26, warpins: 2 ---
		slot0._mask.enabled = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 27-27, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

ScrollTxt.clear = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if not IsNil(slot0._txtRTF) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-11, warpins: 1 ---
		LeanTween.cancel(go(slot0._txtRTF))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-14, warpins: 2 ---
	if slot0.timer ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-20, warpins: 1 ---
		slot0.timer:Stop()

		slot0.timer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-21, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

ScrollTxt.destroy = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:clear()

	if slot0._txtIsClone then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-19, warpins: 1 ---
		Destroy(slot0._txt.gameObject)

		slot0._mask:GetComponent(typeof(Text)).enabled = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-26, warpins: 2 ---
	slot0._txt = nil
	slot0._txtRTF = nil
	slot0._txtRect = nil

	return
	--- END OF BLOCK #1 ---



end

return ScrollTxt
