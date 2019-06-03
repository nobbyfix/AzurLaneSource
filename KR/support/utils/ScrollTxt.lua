ScrollTxt = class("ScrollTxt")
ScrollTxt._speed = 10
ScrollTxt._delayTime = 0.5
ScrollTxt._padding = 4

function ScrollTxt.Ctor(slot0, slot1, slot2, slot3, slot4, slot5)
	slot0._mask = GetOrAddComponent(slot1, typeof(RectMask2D))

	if slot4 == nil then
		-- Nothing
	end

	slot0._vertical = slot4

	if slot3 == nil then
		-- Nothing
	end

	slot0._notSensitive = slot3
	slot0._maskRTF = slot1:GetComponent(typeof(RectTransform))

	slot0:setMaskEnable(slot5)

	slot0._txt = slot2:GetComponent(typeof(Text))
	slot0._txtRTF = slot2:GetComponent(typeof(RectTransform))
	slot0._txtRect = slot0._txtRTF.rect
end

function ScrollTxt.changeToScroll(slot0, slot1)
	slot2 = cloneTplTo(slot1, slot1)
	slot1:GetComponent(typeof(Text)).enabled = false
	slot2.localScale = Vector3.one
	slot2.anchorMin = Vector2(0.5, 0.5)
	slot2.anchorMax = Vector2(0.5, 0.5)
	slot2.localPosition = Vector3.zero
	ScrollTxt.New(slot1, slot2)._txtIsClone = true

	return ScrollTxt.New(slot1, slot2)
end

function ScrollTxt.setText(slot0, slot1)
	slot0:clear()

	slot0._txt.text = tostring(slot1)

	slot0:begin()
end

function ScrollTxt.delayBegin(slot0)
	slot0.timer = Timer.New(function ()
		uv0:begin()
	end, 0.1, 1):Start()
end

function ScrollTxt.preCalFunc(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-129, warpins: 1 ---
	slot1 = nil

	if slot0._vertical then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-21, warpins: 1 ---
		slot0._txtRTF.sizeDelta = Vector2.New(slot0._txtRTF.sizeDelta.x, slot0._txt.preferredHeight)

		if slot0:checkOverlength() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-49, warpins: 1 ---
			slot0:setMaskEnable(true)

			slot0._topLimit = (slot0._txt.preferredHeight - slot0._maskRTF.rect.height) * 0.5 + slot0._padding
			slot0._bottomLimit = -((slot0._txt.preferredHeight - slot0._maskRTF.rect.height) * 0.5 + slot0._padding)
			slot0._tweenTime = ((slot0._txt.preferredHeight - slot0._maskRTF.rect.height) * 0.5 + slot0._padding) / slot0._speed
			slot0._txtRTF.localPosition = Vector3.New(slot0._txtRTF.localPosition.x, slot0._bottomLimit, slot0._txtRTF.localPosition.z)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 50-62, warpins: 1 ---
			slot0:setMaskEnable(false)

			slot0._txtRTF.localPosition = Vector3.New(slot2.x, 0, slot2.z)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-67, warpins: 1 ---
		if slot0:checkOverlength() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 68-105, warpins: 1 ---
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._txt.preferredWidth, slot0._txtRTF.sizeDelta.y)

			slot0:setMaskEnable(true)

			slot0._leftLimit = -((slot0._txt.preferredWidth - slot0._maskRTF.rect.width) * 0.5 + slot0._padding)
			slot0._rightLimit = (slot0._txt.preferredWidth - slot0._maskRTF.rect.width) * 0.5 + slot0._padding
			slot0._tweenTime = ((slot0._txt.preferredWidth - slot0._maskRTF.rect.width) * 0.5 + slot0._padding) / slot0._speed
			slot0._txtRTF.localPosition = Vector3.New(slot0._rightLimit, slot2.y, slot2.z)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 106-128, warpins: 1 ---
			slot0._txtRTF.sizeDelta = Vector2.New(slot0._maskRTF.rect.width, slot0._txtRTF.sizeDelta.y)

			slot0:setMaskEnable(false)

			slot0._txtRTF.localPosition = Vector3.New(0, slot2.y, slot2.z)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function ScrollTxt.begin(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	if IsNil(slot0._maskRTF) or IsNil(slot0._txt) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

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

	return
	--- END OF BLOCK #0 ---



end

function ScrollTxt.checkOverlength(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-37, warpins: 1 ---
	if slot0._vertical then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-20, warpins: 2 ---
		return slot0._maskRTF.rect.height ~= 0 and slot0._maskRTF.rect.height < slot0._txt.preferredHeight
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-36, warpins: 1 ---
		return slot0._maskRTF.rect.width ~= 0 and slot0._maskRTF.rect.width < slot0._txt.preferredWidth
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function ScrollTxt.startTween(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	if IsNil(slot0._maskRTF) or IsNil(slot0._txt) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	LeanTween.moveX(slot0._txtRTF, slot0._leftLimit, slot0._tweenTime):setFrom(slot0._rightLimit):setDelay(slot0._delayTime):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		LeanTween.delayedCall(go(uv0._txtRTF), uv0._delayTime, System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-18, warpins: 1 ---
			uv0._txtRTF.localPosition = Vector3.New(uv0._rightLimit, uv0._txtRTF.localPosition.y, uv0._txtRTF.localPosition.z)

			uv0:startTween()

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

function ScrollTxt.startTweenVertical(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	if IsNil(slot0._maskRTF) or IsNil(slot0._txt) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	LeanTween.moveY(slot0._txtRTF, slot0._topLimit, slot0._tweenTime):setFrom(slot0._bottomLimit):setDelay(slot0._delayTime):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		LeanTween.delayedCall(go(uv0._txtRTF), uv0._delayTime, System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-18, warpins: 1 ---
			uv0._txtRTF.localPosition = Vector3.New(uv0._txtRTF.localPosition.x, uv0._bottomLimit, uv0._txtRTF.localPosition.z)

			uv0:startTweenVertical()

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #0 ---



end

function ScrollTxt.setMaskEnable(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
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

	return
	--- END OF BLOCK #0 ---



end

function ScrollTxt.clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	if not IsNil(slot0._txtRTF) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-11, warpins: 1 ---
		LeanTween.cancel(go(slot0._txtRTF))
		--- END OF BLOCK #0 ---



	end

	if slot0.timer ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-20, warpins: 1 ---
		slot0.timer:Stop()

		slot0.timer = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function ScrollTxt.destroy(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	slot0:clear()

	if slot0._txtIsClone then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-19, warpins: 1 ---
		Destroy(slot0._txt.gameObject)

		slot0._mask:GetComponent(typeof(Text)).enabled = true
		--- END OF BLOCK #0 ---



	end

	slot0._txt = nil
	slot0._txtRTF = nil
	slot0._txtRect = nil

	return
	--- END OF BLOCK #0 ---



end

return ScrollTxt
