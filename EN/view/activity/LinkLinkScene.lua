slot0 = class("LinkLinkScene", import("..base.BaseUI"))
slot0.MAX_ROW = 6
slot0.MAX_COLUMN = 11
slot0.COUNT_DOWN = 3
slot0.RESET_CD = 5
slot0.GAME_STATE_BEGIN = 0
slot0.GAME_STATE_GAMING = 1
slot0.GAME_STATE_END = 2
slot0.CARD_STATE_NORMAL = 0
slot0.CARD_STATE_LINKED = 1
slot0.CARD_STATE_BLANK = 2

function slot0.getUIName(slot0)
	return "LinkLinkUI"
end

function slot0.init(slot0)
	slot0.backBtn = slot0:findTF("top/back")
	slot0.helpBtn = slot0:findTF("top/help_btn")
	slot0.resetBtn = slot0:findTF("info/reset_button")
	slot0.awardTxt = slot0:findTF("info/award_txt")
	slot0.timeTxt = slot0:findTF("info/time_txt")
	slot0.bestTxt = slot0:findTF("info/best_txt")
	slot0.layout = slot0:findTF("card_con/layout")
	slot0.item = slot0.layout:Find("card")
	slot0.bottom = slot0:findTF("card_con/bottom")
	slot0.line = slot0.bottom:Find("card")
	slot0.result = slot0:findTF("result")
	slot0.countDown = slot0:findTF("count_down")
	slot0.resource = slot0:findTF("resource")

	setActive(slot0.helpBtn, false)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0.backBtn, function ()
		uv0:emit(uv1.ON_BACK, nil, 0.3)
	end, SOUND_BACK)
	slot0:SetState(uv0.GAME_STATE_BEGIN)
end

function slot0.willExit(slot0)
	slot0:HideResult()
	LeanTween.cancel(go(slot0.countDown))

	for slot4 = 0, slot0.layout.childCount - 1, 1 do
		LeanTween.cancel(go(slot0.layout:GetChild(slot4)))
	end

	if slot0.countTimer then
		slot0.countTimer:Stop()

		slot0.countTimer = nil
	end
end

function slot0.SetPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.SetActivity(slot0, slot1)
	slot0.activity = slot1
	slot0.activityAchieved = slot1.data1
	slot0.activityProgress = slot1.data2
	slot0.activityStartTime = slot1.data3
	slot0.activityBestRecord = slot1.data4
	slot3 = pg.TimeMgr.GetInstance()
	slot0.activityRestTimes = slot3:DiffDay(slot0.activityStartTime, slot3:GetServerTime()) + 1 - slot0.activityProgress
	slot0.activityRestTimes = math.clamp(slot0.activityRestTimes, 0, #slot0.activity:getConfig("config_client")[3] - slot0.activityProgress)

	setText(slot0.awardTxt, slot0.activityRestTimes > 0 and slot2[slot0.activityProgress + 1] or 0)
	setText(slot0.bestTxt, slot0:FormatRecordTime(slot0.activityBestRecord))
end

function slot0.SetState(slot0, slot1)
	if slot0.state ~= slot1 then
		slot0.state = slot1

		if slot1 == uv0.GAME_STATE_BEGIN then
			slot0:GameBegin()
		elseif slot1 == uv0.GAME_STATE_GAMING then
			slot0:GameLoop()
		elseif slot1 == uv0.GAME_STATE_END then
			slot0:GameEnd()
		end
	end
end

function slot0.GameBegin(slot0)
	slot0.cards = {}

	for slot5 = 0, 17, 1 do
		table.insert({}, slot5)
		table.insert(, slot5)
	end

	slot2 = 0

	while #slot1 > 0 do
		slot0.cards[slot4] = slot0.cards[math.floor(slot2 / (uv0.MAX_COLUMN - 2)) + 1] or {}
		slot0.cards[slot4][slot2 % (uv0.MAX_COLUMN - 2) + 1] = {
			row = slot4,
			column = slot2 % (uv0.MAX_COLUMN - 2) + 1,
			id = slot1[math.clamp(math.floor(math.random() * #slot1 + 1), 1, #slot1)],
			state = uv0.CARD_STATE_NORMAL
		}

		table.remove(slot1, math.clamp(math.floor(math.random() * #slot1 + 1), 1, #slot1))

		slot2 = slot2 + 1
	end

	for slot6 = 0, uv0.MAX_ROW - 1, 1 do
		for slot10 = 0, uv0.MAX_COLUMN - 1, 1 do
			slot0.cards[slot6] = slot0.cards[slot6] or {}
			slot0.cards[slot6][slot10] = slot0.cards[slot6][slot10] or {
				row = slot6,
				column = slot10,
				state = uv0.CARD_STATE_BLANK
			}
		end
	end

	slot0.list = UIItemList.New(slot0.layout, slot0.item)

	slot0.list:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot2.name = slot3 .. "_" .. slot4
			slot2.localScale = Vector3.one

			setActive(slot2:Find("display"), uv1.cards[math.floor(slot1 / uv0.MAX_COLUMN)][slot1 % uv0.MAX_COLUMN].state == uv0.CARD_STATE_NORMAL)

			if slot5.state == uv0.CARD_STATE_NORMAL then
				setImageSprite(slot2:Find("display/icon"), slot6)
				setActive(slot2:Find("display/selected"), false)
			end
		end
	end)
	slot0.list:align(uv0.MAX_ROW * uv0.MAX_COLUMN)

	slot0.llist = UIItemList.New(slot0.bottom, slot0.line)

	slot0.llist:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			for slot7 = 0, slot2:Find("lines").childCount - 1, 1 do
				setActive(slot3:GetChild(slot7), false)
			end
		end
	end)
	slot0.llist:align(uv0.MAX_ROW * uv0.MAX_COLUMN)
	setActive(slot0.countDown, true)

	for slot6 = 0, slot0.countDown.childCount - 1, 1 do
		setActive(slot0.countDown:GetChild(slot6), false)
	end

	setActive(slot4, true)
	setImageAlpha(slot4, 0)
	LeanTween.value(go(slot0.countDown), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
		setImageAlpha(uv0, slot0)
		setLocalScale(uv0, {
			x = (1 - math.min(slot0 / 0.3, 1)) * 2 + 1,
			y = (1 - math.min(slot0 / 0.3, 1)) * 2 + 1
		})
	end)):setOnComplete(System.Action(function ()
		setActive(uv0, false)

		uv1 = uv1 + 1

		if uv1 < uv2.countDown.childCount then
			uv0 = uv2.countDown:GetChild(uv1)

			setActive(uv0, true)
			setImageAlpha(uv0, 0)
		else
			setActive(uv2.countDown, false)
			uv2:SetState(uv3.GAME_STATE_GAMING)
		end
	end)):setRepeat(4):setLoopType(LeanTweenType.punch):setOnCompleteOnRepeat(true):setEase(LeanTweenType.easeOutSine)
end

function slot0.GameLoop(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-50, warpins: 1 ---
	function slot1(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-168, warpins: 1 ---
		slot1 = 0
		slot2 = 0

		for slot6 = 1, #slot0 - 1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-167, warpins: 2 ---
			slot9 = slot0[slot6 + 1].row - slot0[slot6].row
			slot10 = slot0[slot6 + 1].column - slot0[slot6].column

			for slot15 = 0, uv0.bottom:GetChild(slot0[slot6].row * uv1.MAX_COLUMN + slot0[slot6].column):Find("lines").childCount - 1, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 37-44, warpins: 2 ---
				setActive(slot11:GetChild(slot15), false)
				--- END OF BLOCK #0 ---



			end

			if slot9 ~= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 47-56, warpins: 1 ---
				setActive(slot11:Find("y" .. slot9), true)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 57-58, warpins: 1 ---
				if slot10 ~= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 59-67, warpins: 1 ---
					setActive(slot11:Find("x" .. slot10), true)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			if slot9 ~= slot1 and slot10 ~= slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 104-118, warpins: 4 ---
				slot12 = 0

				setActive(slot13, true)

				slot11:Find("joint").localEulerAngles = Vector3(0, 0, (slot9 == -1 and slot2 == 1 or slot1 == 1 and slot10 == -1) and 0 or (slot10 == -1 and slot1 == -1 or slot9 == 1 and slot2 == 1) and 90 or (slot9 == 1 and slot2 == -1 or slot1 == -1 and slot10 == 1) and 180 or 270)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 119-120, warpins: 2 ---
				if slot1 == 0 and slot9 ~= 0 or slot1 ~= 0 and slot9 == slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 127-141, warpins: 2 ---
					setActive(slot12, true)

					slot11:Find("cross").localEulerAngles = Vector3(0, 0, 90)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 142-143, warpins: 2 ---
					if slot2 == 0 and slot10 ~= 0 or slot2 ~= 0 and slot10 == slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 150-163, warpins: 2 ---
						setActive(slot12, true)

						slot11:Find("cross").localEulerAngles = Vector3(0, 0, 0)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			slot2 = slot10
			slot1 = slot9
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end

	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-37, warpins: 1 ---
		for slot4 = 1, #slot0 - 1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-36, warpins: 2 ---
			for slot11 = 0, uv1.bottom:GetChild(slot6):Find("lines").childCount - 1, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-35, warpins: 2 ---
				setActive(slot7:GetChild(slot11), false)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end

	slot3, slot4, slot5 = nil

	slot0.list:each(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		onButton(uv0, slot1:Find("display/icon"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-181, warpins: 1 ---
			if uv2.cards[math.floor(uv0 / uv1.MAX_COLUMN)][uv0 % uv1.MAX_COLUMN].state ~= uv1.CARD_STATE_NORMAL then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-22, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-25, warpins: 1 ---
				if not uv3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 26-37, warpins: 1 ---
					uv3 = slot2
					uv4 = uv5

					setActive(uv5:Find("display/selected"), true)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 38-40, warpins: 1 ---
					if uv6 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 41-42, warpins: 1 ---
						return
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 43-45, warpins: 1 ---
						if uv3 == slot2 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 46-56, warpins: 1 ---
							setActive(uv5:Find("display/selected"), false)

							uv4 = nil
							uv3 = nil
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 57-61, warpins: 1 ---
							if uv3.id ~= slot2.id then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 62-72, warpins: 1 ---
								setActive(uv4:Find("display/selected"), false)

								uv4 = nil
								uv3 = nil
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 73-178, warpins: 1 ---
								if not uv2:LinkLink(uv3, slot2) then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 81-91, warpins: 1 ---
									setActive(uv4:Find("display/selected"), false)

									uv4 = nil
									uv3 = nil
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 92-177, warpins: 1 ---
									slot2.state = uv1.CARD_STATE_LINKED
									uv3.state = uv1.CARD_STATE_LINKED

									setActive(uv5:Find("display/selected"), true)
									uv7(slot3)

									uv6 = true
									slot5 = uv4

									LeanTween.value(go(slot4), 1, 0.15, 0.3):setEase(LeanTweenType.easeInBack):setOnUpdate(System.Action_float(function (slot0)

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-15, warpins: 1 ---
										uv0.localScale = Vector3(slot0, slot0, 1)
										uv1.localScale = Vector3(slot0, slot0, 1)

										return
										--- END OF BLOCK #0 ---



									end)):setOnComplete(System.Action(function ()

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-21, warpins: 1 ---
										uv0(uv1)
										setActive(uv2:Find("display"), false)
										setActive(uv3:Find("display"), false)

										uv4 = false

										return
										--- END OF BLOCK #0 ---



									end))

									uv4 = nil
									uv3 = nil
									slot6 = true

									for slot10 = 0, uv1.MAX_ROW - 1, 1 do

										-- Decompilation error in this vicinity:
										--- BLOCK #0 150-168, warpins: 2 ---
										for slot14 = 0, uv1.MAX_COLUMN - 1, 1 do

											-- Decompilation error in this vicinity:
											--- BLOCK #0 156-167, warpins: 2 ---
											if uv2.cards[slot10][slot14].state == uv1.CARD_STATE_NORMAL then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 165-167, warpins: 1 ---
												slot6 = false

												break
												--- END OF BLOCK #0 ---



											end
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									end

									if slot6 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 171-176, warpins: 1 ---
										uv2:SetState(uv1.GAME_STATE_END)
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)

		return
		--- END OF BLOCK #0 ---



	end)

	if Application.isEditor and AUTO_LINKLINK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-24, warpins: 1 ---
		setActive(slot0.helpBtn, true)
		onButton(slot0, slot0.helpBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-102, warpins: 1 ---
			uv0 = nil
			uv1 = nil

			for slot3 = 0, uv2.MAX_ROW - 1, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-101, warpins: 2 ---
				for slot7 = 0, uv2.MAX_COLUMN - 1, 1 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-100, warpins: 2 ---
					slot10 = uv3.layout:GetChild(slot9)

					if uv3.cards[slot3][slot7].state == uv2.CARD_STATE_NORMAL then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 36-99, warpins: 1 ---
						for slot14 = 0, uv2.MAX_ROW - 1, 1 do

							-- Decompilation error in this vicinity:
							--- BLOCK #0 42-99, warpins: 2 ---
							for slot18 = 0, uv2.MAX_COLUMN - 1, 1 do

								-- Decompilation error in this vicinity:
								--- BLOCK #0 48-98, warpins: 2 ---
								if slot3 ~= slot14 or slot7 ~= slot18 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 52-71, warpins: 2 ---
									if slot8.id == uv3.cards[slot14][slot18].id then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 72-86, warpins: 1 ---
										triggerButton(slot10:Find("display/icon"))
										triggerButton(uv3.layout:GetChild(slot20):Find("display/icon"))

										if uv4 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 87-97, warpins: 1 ---
											Timer.New(function ()

												-- Decompilation error in this vicinity:
												--- BLOCK #0 1-5, warpins: 1 ---
												triggerButton(uv0.helpBtn)

												return
												--- END OF BLOCK #0 ---



											end, 0.4, 1):Start()

											return
											--- END OF BLOCK #0 ---



										end
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	slot6 = 0

	onButton(slot0, slot0.resetBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-125, warpins: 1 ---
		if uv0.state ~= uv1.GAME_STATE_GAMING then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-8, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-16, warpins: 1 ---
			if Time.realtimeSinceStartup - uv2 < uv1.RESET_CD then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-27, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("common_wait"))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-123, warpins: 1 ---
				if uv3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 31-40, warpins: 1 ---
					setActive(uv4:Find("display/selected"), false)

					uv4 = nil
					uv3 = nil
					--- END OF BLOCK #0 ---



				end

				slot0 = {}
				slot1 = {}

				for slot5 = 0, uv1.MAX_ROW - 1, 1 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 49-77, warpins: 2 ---
					for slot9 = 0, uv1.MAX_COLUMN - 1, 1 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 55-76, warpins: 2 ---
						if uv0.cards[slot5][slot9].state == uv1.CARD_STATE_NORMAL then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 64-75, warpins: 1 ---
							table.insert(slot0, {
								row = slot5,
								column = slot9
							})
							table.insert(slot1, slot10.id)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				slot2 = 1

				while #slot1 > 0 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 83-115, warpins: 1 ---
					uv0.cards[slot0[slot2].row][slot0[slot2].column].id = slot1[math.clamp(math.floor(math.random() * #slot1 + 1), 1, #slot1)]

					table.remove(slot1, math.clamp(math.floor(math.random() * #slot1 + 1), 1, #slot1))

					slot2 = slot2 + 1
					--- END OF BLOCK #0 ---



				end

				uv0.list:each(function (slot0, slot1)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-34, warpins: 1 ---
					if uv1.cards[math.floor(slot0 / uv0.MAX_COLUMN)][slot0 % uv0.MAX_COLUMN].state == uv0.CARD_STATE_NORMAL then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 19-33, warpins: 1 ---
						setImageSprite(slot1:Find("display/icon"), getImageSprite(uv1.resource:GetChild(slot4.id)))
						--- END OF BLOCK #0 ---



					end

					return
					--- END OF BLOCK #0 ---



				end)

				uv2 = Time.realtimeSinceStartup
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	slot0.startTime = Time.realtimeSinceStartup
	slot0.countTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		setText(uv0.timeTxt, uv0:FormatRecordTime(math.floor((Time.realtimeSinceStartup - uv0.startTime) * 1000)))

		return
		--- END OF BLOCK #0 ---



	end, 0.033, -1)

	slot0.countTimer:Start()
	slot0.countTimer.func()

	return
	--- END OF BLOCK #0 ---



end

function slot0.GameEnd(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-50, warpins: 1 ---
	slot0.countTimer:Stop()

	slot0.countTimer = nil
	slot0.lastRecord = math.floor((Time.realtimeSinceStartup - slot0.startTime) * 1000)

	if slot0.activityRestTimes > 0 or slot0.lastRecord < slot0.activityBestRecord then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-45, warpins: 2 ---
		slot0:emit(LinkLinkMediator.EVENT_OPERATION, {
			cmd = 1,
			activity_id = slot0.activity.id,
			arg1 = slot0.activityProgress + (slot0.activityRestTimes > 0 and 1 or 0),
			arg2 = slot0.lastRecord
		})
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-49, warpins: 1 ---
		slot0:DisplayResult(slot0.activity)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.DisplayResult(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 65-90, warpins: 2 ---
	setActive(slot0.result, true)
	setActive(slot0.result:Find("bg").Find(slot2, "pic_new_record"), slot1.data4 < slot0.activityBestRecord)
	setActive(slot2:Find("pic_win"), slot0.activityBestRecord <= slot1.data4)
	setText(slot2:Find("time_txt"), slot0:FormatRecordTime(slot0.lastRecord))
	setText(slot2:Find("award_txt"), slot0.activityProgress < slot1.data2 and slot1:getConfig("config_client")[3][slot1.data2] or 0)
	onButton(slot0, slot2:Find("button"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		uv0:HideResult()
		uv0:SetActivity(uv1)
		uv0:SetState(uv2.GAME_STATE_BEGIN)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.result, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		triggerButton(uv0.backBtn)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	pg.UIMgr.GetInstance():BlurPanel(slot0.result)

	return
	--- END OF BLOCK #0 ---



end

function slot0.HideResult(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	if isActive(slot0.result) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-18, warpins: 1 ---
		setActive(slot0.result, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.result, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.FormatRecordTime(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 39-45, warpins: 2 ---
	return (math.floor(slot1 / 60000) >= 10 and slot2 or "0" .. slot2) .. "'" .. (math.floor(slot1 % 60000 / 1000) >= 10 and slot3 or "0" .. slot3) .. "'" .. (math.floor(slot1 % 1000 / 10) >= 10 and slot4 or "0" .. slot4)
	--- END OF BLOCK #0 ---



end

function slot0.LinkLink(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-106, warpins: 1 ---
	table.insert(slot5, slot3)
	table.insert(slot6, slot3)

	for slot10 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-105, warpins: 2 ---
		if slot0:IterateByOneSnap({
			row = slot2.row,
			column = slot2.column
		}, slot1.id, slot5, slot6) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-104, warpins: 1 ---
			slot12 = {
				slot11
			}

			if slot11 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 40-104, warpins: 1 ---
				while slot11 and slot11.from do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 43-104, warpins: 1 ---
					if slot11.row ~= slot11.from.row then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 57-72, warpins: 2 ---
						for slot17 = slot11.row + (slot11.from.row < slot11.row and -1 or 1), slot11.from.row, slot11.from.row < slot11.row and -1 or 1 do

							-- Decompilation error in this vicinity:
							--- BLOCK #0 63-71, warpins: 2 ---
							table.insert(slot12, {
								row = slot17,
								column = slot11.column
							})
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 73-77, warpins: 1 ---
						if slot11.from.column ~= slot11.column then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 86-101, warpins: 2 ---
							for slot17 = slot11.column + (slot11.from.column < slot11.column and -1 or 1), slot11.from.column, slot11.from.column < slot11.column and -1 or 1 do

								-- Decompilation error in this vicinity:
								--- BLOCK #0 92-100, warpins: 2 ---
								table.insert(slot12, {
									row = slot11.row,
									column = slot17
								})
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					slot11 = slot11.from
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			return slot12
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.IterateByOneSnap(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-39, warpins: 1 ---
	for slot8 = 1, #slot3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-31, warpins: 2 ---
		for slot13, slot14 in ipairs(slot9) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-30, warpins: 1 ---
			if slot14.row == slot1.row and slot14.column == slot1.column then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-23, warpins: 1 ---
				return slot14
				--- END OF BLOCK #0 ---



			end

			table.insert(slot3, slot14)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	_.each(slot3, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		uv0[slot0.row .. "_" .. slot0.column] = true

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.FindDirectLinkPoint(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-146, warpins: 1 ---
	slot4 = {}

	for slot8 = slot2.row - 1, 0, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-36, warpins: 2 ---
		if slot0.cards[slot8][slot2.column].state == uv0.CARD_STATE_NORMAL and slot10.id ~= slot1 or slot3[slot8 .. "_" .. slot2.column] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-26, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		table.insert(slot4, {
			row = slot8,
			column = slot2.column,
			from = slot2
		})
		--- END OF BLOCK #0 ---



	end

	for slot8 = slot2.row + 1, uv0.MAX_ROW - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-73, warpins: 2 ---
		if slot0.cards[slot8][slot2.column].state == uv0.CARD_STATE_NORMAL and slot10.id ~= slot1 or slot3[slot8 .. "_" .. slot2.column] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 63-63, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		table.insert(slot4, {
			row = slot8,
			column = slot2.column,
			from = slot2
		})
		--- END OF BLOCK #0 ---



	end

	for slot8 = slot2.column - 1, 0, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-108, warpins: 2 ---
		if slot0.cards[slot2.row][slot8].state == uv0.CARD_STATE_NORMAL and slot10.id ~= slot1 or slot3[slot2.row .. "_" .. slot8] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 98-98, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		table.insert(slot4, {
			row = slot2.row,
			column = slot8,
			from = slot2
		})
		--- END OF BLOCK #0 ---



	end

	for slot8 = slot2.column + 1, uv0.MAX_COLUMN - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 116-145, warpins: 2 ---
		if slot0.cards[slot2.row][slot8].state == uv0.CARD_STATE_NORMAL and slot10.id ~= slot1 or slot3[slot2.row .. "_" .. slot8] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 135-135, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end

		table.insert(slot4, {
			row = slot2.row,
			column = slot8,
			from = slot2
		})
		--- END OF BLOCK #0 ---



	end

	return slot4
	--- END OF BLOCK #0 ---



end

function slot0.LinkLink1(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-74, warpins: 1 ---
	slot3 = nil
	slot4 = {
		[slot1.row .. "_" .. slot1.column] = {
			rdir = 0,
			cdir = 0,
			snap = 0,
			row = slot1.row,
			column = slot1.column,
			path = {}
		}
	}
	slot6 = {
		row = slot2.row,
		column = slot2.column
	}
	slot8 = {}

	while #{
		{
			row = slot1.row,
			column = slot1.column
		}
	} > 0 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-73, warpins: 1 ---
		if table.remove(slot7, 1).row == slot6.row and slot9.column == slot6.column then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-52, warpins: 1 ---
			return slot4[slot9.row .. "_" .. slot9.column].path
			--- END OF BLOCK #0 ---



		end

		table.insert(slot8, slot9)
		_.each({
			{
				row = 1,
				column = 0
			},
			{
				row = -1,
				column = 0
			},
			{
				row = 0,
				column = 1
			},
			{
				row = 0,
				column = -1
			}
		}, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-166, warpins: 2 ---
			slot0.row = uv0.row + slot0.row
			slot0.column = uv0.column + slot0.column

			if not (_.any(uv1, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-14, warpins: 2 ---
				return slot0.row == uv0.row and slot0.column == uv0.column
				--- END OF BLOCK #0 ---



			end) or _.any(uv2, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-14, warpins: 2 ---
				return slot0.row == uv0.row and slot0.column == uv0.column
				--- END OF BLOCK #0 ---



			end)) and (not (uv3.cards[slot0.row] and uv3.cards[slot0.row][slot0.column] or nil) or uv3.cards[slot0.row] and uv3.cards[slot0.row][slot0.column] or nil.state == uv4.CARD_STATE_LINKED or uv3.cards[slot0.row] and uv3.cards[slot0.row][slot0.column] or nil.state == uv4.CARD_STATE_BLANK or uv3.cards[slot0.row] and uv3.cards[slot0.row][slot0.column] or nil.id == uv5.id) and slot0.row >= 0 and slot0.row < uv4.MAX_ROW and slot0.column >= 0 and slot0.column < uv4.MAX_COLUMN then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 75-107, warpins: 1 ---
				if uv6[uv0.row .. "_" .. uv0.column].rdir ~= 0 and slot3.rdir ~= slot0.row - uv0.row or slot3.cdir ~= 0 and slot3.cdir ~= slot0.column - uv0.column then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 104-104, warpins: 2 ---
					slot4 = uv6[uv0.row .. "_" .. uv0.column].snap + 1
					--- END OF BLOCK #0 ---



				end

				if slot4 <= 2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 108-164, warpins: 1 ---
					table.insert(slot7, slot0)

					uv6[slot0.row .. "_" .. slot0.column] = {
						row = slot0.row,
						column = slot0.column,
						snap = slot4,
						rdir = slot5,
						cdir = slot6,
						path = Clone(slot3.path)
					}
					slot8 = 0

					for slot12 = #uv1, 1, -1 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 137-158, warpins: 2 ---
						if uv6[uv1[slot12].row .. "_" .. uv1[slot12].column].snap < slot4 or slot4 == slot14.snap and #slot7 > #slot14.path then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 156-158, warpins: 2 ---
							slot8 = slot12

							break
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					table.insert(uv1, slot8 + 1, slot0)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #0 ---



end

return slot0
