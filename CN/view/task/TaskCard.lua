slot0 = class("TaskCard")
slot1 = 0
slot2 = 1
slot3 = 2
slot4 = 3
slot5 = 0.5

function slot0.Ctor(slot0, slot1, slot2)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot0._go)
	slot0.viewComponent = slot2
	slot0.descTxt = slot0._tf:Find("frame/desc"):GetComponent(typeof(Text))
	slot0.tagTF = slot0._tf:Find("frame/tag")
	slot0.rewardPanel = slot0._tf:Find("frame/awards")
	slot0._rewardModel = slot0.rewardPanel:GetChild(0)
	slot0.progressBar = slot0._tf:Find("frame/slider"):GetComponent(typeof(Slider))
	slot0.progressNum = slot0._tf:Find("frame/slider/Text"):GetComponent(typeof(Text))
	slot0.GotoBtn = slot0._tf:Find("frame/go_btn")
	slot0.GetBtn = slot0._tf:Find("frame/get_btn")
	slot0.storyIconFrame = slot0._tf:Find("frame/storyIcon")
	slot0.storyIcon = slot0._tf:Find("frame/storyIcon/icon")
	slot0.frame = slot0._tf:Find("frame")
	slot0._modelWidth = slot0.frame.rect.width + 100
	slot0.finishBg = slot0._tf:Find("frame/finish_bg")
	slot0.unfinishBg = slot0._tf:Find("frame/unfinish_bg")
	slot0.tip = slot0._tf:Find("frame/tip")
end

function slot0.update(slot0, slot1)
	slot0.taskVO = slot1

	if slot1.id == 10302 then
		slot0._go.name = slot1.id
	end

	slot0.descTxt.text = HXSet.hxLan(slot1:getConfig("desc"))

	slot0.viewComponent:setSpriteTo("taskTagOb/" .. slot1:getConfig("type"), slot0.tagTF)

	slot2 = slot1:getConfig("target_num")

	slot0:updateAwards(slot1)

	if slot1:isFinish() then
		slot0.progressNum.text = "COMPLETE"
	elseif slot1:getConfig("sub_type") == 1012 then
		slot0.progressNum.text = math.floor(slot1.progress / 100) .. "/" .. math.floor(slot2 / 100)
	else
		slot0.progressNum.text = slot1.progress .. "/" .. slot2
	end

	slot0.progressBar.value = slot1.progress / slot2

	slot0:updateBtnState(slot1)
	setActive(slot0.storyIconFrame, slot1:getConfig("story_id") and slot3 ~= "")

	if slot3 and slot3 ~= "" then
		if not slot1:getConfig("story_icon") or slot4 == "" then
			slot4 = "task_icon_default"
		end

		LoadSpriteAsync("shipmodels/" .. slot4, function (slot0)
			if slot0 then
				setImageSprite(uv0.storyIcon, slot0, true)
			end
		end)
		onButton(slot0, slot0.storyIconFrame, function ()
			pg.StoryMgr.GetInstance():Play(uv0, nil, true)
		end, SFX_PANEL)
	else
		removeOnButton(slot0.storyIconFrame)
	end

	setActive(slot0.frame, true)
end

function slot0.updateBtnState(slot0, slot1)
	slot2 = uv0

	removeOnButton(slot0.GotoBtn)
	removeOnButton(slot0.GetBtn)

	if slot1:isFinish() then
		slot2 = slot1:isReceive() and uv1 or uv2

		onButton(slot0, slot0.GetBtn, function ()
			function slot0()
				if not uv0.isClick then
					uv0.isClick = true

					LeanTween.value(go(uv0.frame), uv0.frame.localPosition.x, uv0.frame.localPosition.x + uv0._modelWidth, uv1):setOnUpdate(System.Action_float(function (slot0)
						uv0.frame.transform.localPosition = Vector3(slot0, uv1.y, uv1.z)
					end)):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-20, warpins: 1 ---
						uv0.frame.transform.localPosition = uv1

						setActive(uv0.frame, false)

						uv0.isClick = nil

						uv0.viewComponent:onSubmit(uv2)

						return
						--- END OF BLOCK #0 ---



					end))
				end
			end

			function slot2()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-15, warpins: 1 ---
				function uv0.overFlow.onYes()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-3, warpins: 1 ---
					uv0()

					return
					--- END OF BLOCK #0 ---



				end

				pg.MsgboxMgr:GetInstance():ShowMsgBox(uv0.overFlow)

				return
				--- END OF BLOCK #0 ---



			end

			function slot3()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-15, warpins: 1 ---
				function uv0.choice.onYes()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-24, warpins: 1 ---
					if not uv0.index then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 5-14, warpins: 1 ---
						pg.TipsMgr:GetInstance():ShowTips("未选择奖励,放弃领取")

						return
						--- END OF BLOCK #0 ---



					end

					if uv1.overFlow then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 19-21, warpins: 1 ---
						uv2()
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 22-23, warpins: 1 ---
						uv3()
						--- END OF BLOCK #0 ---



					end

					return
					--- END OF BLOCK #0 ---



				end

				pg.MsgboxMgr:GetInstance():ShowMsgBox(uv0.choice)

				return
				--- END OF BLOCK #0 ---



			end

			if uv2:getConfirmSetting().sub then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-14, warpins: 1 ---
				function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-15, warpins: 1 ---
					function uv0.sub.onYes()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-17, warpins: 1 ---
						if uv0.choice then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 5-7, warpins: 1 ---
							uv1()
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 8-11, warpins: 1 ---
							if uv0.overFlow then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 12-14, warpins: 1 ---
								uv2()
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 15-16, warpins: 1 ---
								uv3()
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end

						return
						--- END OF BLOCK #0 ---



					end

					pg.MsgboxMgr:GetInstance():ShowMsgBox(uv0.sub)

					return
					--- END OF BLOCK #0 ---



				end()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-17, warpins: 1 ---
				if slot1.choice then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 18-20, warpins: 1 ---
					slot3()
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-23, warpins: 1 ---
					if slot1.overFlow then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 24-26, warpins: 1 ---
						slot2()
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 27-28, warpins: 1 ---
						slot0()
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
		end, SFX_PANEL)
	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-35, warpins: 1 ---
		slot2 = uv4

		onButton(slot0, slot0.GotoBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			uv0.viewComponent:onGo(uv1)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	SetActive(slot0.GotoBtn, slot2 == uv4)
	SetActive(slot0.GetBtn, slot2 == uv2)
	setActive(slot0.finishBg, slot2 == uv2 or slot2 == uv1)
	setActive(slot0.unfinishBg, slot2 ~= uv2 and slot2 ~= BTN_STATE_FETC)
	setActive(slot0.tip, slot2 == uv2 or slot2 == uv1)
end

function slot0.updateAwards(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-57, warpins: 1 ---
	for slot7 = slot0.rewardPanel.childCount, #_.slice(slot1:getConfig("award_display"), 1, 3) - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-21, warpins: 2 ---
		cloneTplTo(slot0._rewardModel, slot0.rewardPanel)
		--- END OF BLOCK #0 ---



	end

	for slot7 = 1, slot0.rewardPanel.childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-56, warpins: 2 ---
		setActive(slot0.rewardPanel:GetChild(slot7 - 1), slot7 <= #slot2)

		if slot7 <= #slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-55, warpins: 1 ---
			updateDrop(slot8, {
				type = slot2[slot7][1],
				id = slot2[slot7][2],
				count = slot2[slot7][3]
			})
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.dispose(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	pg.DelegateInfo.Dispose(slot0)

	return
	--- END OF BLOCK #0 ---



end

return slot0
