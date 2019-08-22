slot0 = class("HitMonsterNianLayer", import("..base.BaseUI"))
slot1 = 1
slot2 = 0.1
slot3 = 1

function slot4(slot0)
	return {
		_go = slot0.go,
		animator = ()["_go"]:GetComponent(typeof(Animator)),
		playAnim = function (slot0, slot1, slot2)
			slot0.animator:SetTrigger(slot1)
			slot0:updateHp(slot2)
		end,
		updateHp = function (slot0, slot1)
			slot0.animator:SetInteger("hp", slot1)
		end,
		dispose = function (slot0)
			return
		end
	}
end

function slot5(slot0)
	return {
		_go = slot0,
		animator = slot0:GetComponent(typeof(Animator)),
		playAnim = function (slot0, slot1, slot2)
			slot0.animator:SetTrigger(slot1)
			slot0:updateMonsterHp(slot2)
		end,
		updateMonsterHp = function (slot0, slot1)
			slot0.animator:SetInteger("hp", slot1)
		end,
		dispose = function (slot0)
			return
		end
	}
end

function slot6(slot0)
	setActive(({
		_go = slot0,
		protagonistGo = ()["_go"]:Find("bg/role"),
		monsterGo = ()["_go"]:Find("bg/monster"),
		hpTF = ()["_go"]:Find("bg/hp"):GetComponent(typeof(Slider)),
		attackTF = ()["_go"]:Find("bg/attack_count/Text"):GetComponent(typeof(Text)),
		curtainTF = ()["_go"]:Find("bg/stage"),
		startLabel = ()["_go"]:Find("bg/stage/start_label"),
		actionTF = ()["_go"]:Find("bg/actions"),
		actionStr = "",
		actionsTF = {
			()["_go"]:Find("bg/actions/content/1"),
			()["_go"]:Find("bg/actions/content/2"),
			()["_go"]:Find("bg/actions/content/3")
		},
		actions = {
			{
				"AAA",
				"isAttack1",
				"isAttack"
			},
			{
				"AAB",
				"isAttack2",
				"isAttack"
			},
			{
				"ABA",
				"isAttack3",
				"isAttack"
			},
			{
				"ABB",
				"isAttack4",
				"isAttack"
			},
			{
				"BBB",
				"isAttack5",
				"isAttack"
			},
			{
				"BAB",
				"isAttack6",
				"isAttack"
			},
			{
				"BBA",
				"isAttack7",
				"isAttack"
			},
			{
				"BAA",
				"isAttack3",
				"isAttack"
			}
		},
		init = function (slot0, slot1)
			slot0.monsterVO = slot0({
				go = slot0.monsterGo
			})
			slot0.protagonistVO = slot1(slot0.protagonistGo)

			slot0:update(slot1)
		end,
		start = function (slot0, slot1)
			setActive(slot0.curtainTF, true)

			if slot0:isEnd() or not slot0:isShowAnim() then
				setActive(slot0.curtainTF, false)
				slot1()
			else
				LeanTween.color(slot0.curtainTF, Color.white, slot0):setFromColor(Color.black):setOnComplete(System.Action(function ()
					setActive(slot0.startLabel, true)
					blinkAni(slot0.startLabel, , 2):setOnComplete(System.Action(function ()
						LeanTween.alpha(slot0.curtainTF, 0, ):setFrom(1)
						LeanTween.alpha(slot0.startLabel, 0, ):setFrom(1):setOnComplete(System.Action(System.Action))
					end))
				end))
				slot0:setPlayAnimFlag()
			end
		end,
		update = function (slot0, slot1, slot2)
			slot4 = slot1:getDataConfig("hp")
			slot0.stageVO = {
				leftAttackCnt = (slot0.isFake and slot1.data2) or slot1:getCountForHitMonster(),
				preHp = (slot0.stageVO and slot0.stageVO.hp) or math.max(slot4 - slot1.data3, 0),
				hp = math.max(slot4 - slot1.data3, 0),
				maxHp = slot4,
				storys = slot1:getDataConfig("story")
			}

			slot0:play(slot2)
		end,
		receiveAction = function (slot0, slot1, slot2)
			if slot0:isEnd() or slot0.inAnim then
				return
			end

			slot0:removeTimer()

			slot0.timer = Timer.New(function ()
				slot0:updateActionStr("")
				slot0.updateActionStr:removeTimer()
			end, 1.5, 1)

			slot0.timer:Start()
			slot0:updateActionStr(slot0.actionStr .. slot1)

			if _.detect(slot0.actions, function (slot0)
				return slot0[1] == slot0.actionStr
			end) and slot2 then
				slot2(slot3[2], slot3[3])
			end
		end,
		updateActionStr = function (slot0, slot1)
			slot0.actionStr = slot1

			if slot1 and slot1 ~= "" then
				for slot6, slot7 in pairs(slot0.actionsTF) do
					setActive(slot7:Find("a"), (string.sub(slot0.actionStr, slot6, slot6) or "") == "A")
					setActive(slot7:Find("b"), (string.sub(slot0.actionStr, slot6, slot6) or "") == "B")
				end
			end

			setActive(slot0.actionTF, slot2)
		end,
		play = function (slot0, slot1)
			slot0.inAnim = true
			slot2 = slot0.stageVO

			function slot3(slot0)
				LeanTween.value(slot1.hpTF.gameObject, slot1, slot2, 0.3):setOnUpdate(System.Action_float(function (slot0)
					slot0.hpTF.value = slot0
				end)):setOnComplete(System.Action(function ()
					slot0.attackTF.text = slot1.leftAttackCnt
					slot0.attackTF.inAnim = false

					slot0.attackTF:triggerStory(slot2)
				end))
			end

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-32, warpins: 1 ---
				slot0.protagonistVO:playAnim(slot4, slot2.hp)
				slot0.monsterVO:playAnim(slot5, slot2.hp)

				slot0.animTimer = Timer.New(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-13, warpins: 1 ---
					slot0.animTimer:Stop()

					slot0.animTimer.Stop.animTimer = 
					-- Decompilation error in this vicinity:
					nil


					-- Decompilation error in this vicinity:
					nil(slot2.callback)

					return
					--- END OF BLOCK #0 ---



				end, 2, 1)

				slot0.animTimer:Start()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-45, warpins: 1 ---
				slot0.protagonistVO:updateMonsterHp(slot2.hp)
				slot0.monsterVO:updateHp(slot2.hp)
				slot3(nil)
				--- END OF BLOCK #0 ---



			end
		end,
		removeTimer = function (slot0)

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



		end,
		isShowAnim = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-24, warpins: 1 ---
			return tonumber(PlayerPrefs.GetString("HitMonsterNianLayer" .. getProxy(PlayerProxy):getRawData().id, "0")) < pg.TimeMgr.GetInstance():GetServerTime()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-28, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end,
		setPlayAnimFlag = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-18, warpins: 1 ---
			PlayerPrefs.SetString("HitMonsterNianLayer" .. getProxy(PlayerProxy):getRawData().id, GetZeroTime())
			PlayerPrefs.Save()

			return
			--- END OF BLOCK #0 ---



		end,
		isEnd = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			return slot0.stageVO.hp <= 0
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 9-9, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end,
		restart = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0.isFake = true

			slot0:update(slot1)

			return
			--- END OF BLOCK #0 ---



		end,
		isEnable = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			return slot0.stageVO.leftAttackCnt > 0
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 9-9, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end,
		triggerStory = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			slot1 = slot1 or function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-1, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end
			slot2 = false
			slot4 = pg.StoryMgr.GetInstance()

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 4-15, warpins: 2 ---
			if type(slot0.stageVO.storys) == "table" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 16-19, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 20-40, warpins: 0 ---
				for slot8, slot9 in pairs(slot3) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-25, warpins: 1 ---
					slot11 = slot9[2]

					if slot0.stageVO.hp <= slot9[1] and not slot4:IsPlayed(slot11) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 32-38, warpins: 1 ---
						slot2 = true

						slot4:Play(slot11, slot1)

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 39-39, warpins: 1 ---
						break
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 39-40, warpins: 3 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 41-42, warpins: 3 ---
			if not slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 43-44, warpins: 1 ---
				slot1()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 45-45, warpins: 2 ---
			return
			--- END OF BLOCK #3 ---



		end,
		dispose = function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			slot0:removeTimer()
			slot0.monsterVO:dispose()
			slot0.protagonistVO:dispose()

			if slot0.animTimer then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-20, warpins: 1 ---
				slot0.animTimer:Stop()

				slot0.animTimer = nil
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-23, warpins: 2 ---
			slot0.stageVO = nil

			return
			--- END OF BLOCK #1 ---



		end
	})["actionTF"], false)

	return 
end

slot0.getUIName = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return "HitMonsterNianUI"
	--- END OF BLOCK #0 ---



end

slot0.setActivity = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0.activityVO = Clone(slot1)

	if slot0.onActivityUpdate then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		slot0.onActivityUpdate()

		slot0.onActivityUpdate = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.init = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0.attackA = slot0._tf:Find("bg/a_attack_btn")
	slot0.attackB = slot0._tf:Find("bg/b_attack_btn")

	return
	--- END OF BLOCK #0 ---



end

slot0.didEnter = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot0.triggers = {}
	slot0.stage = slot0(slot0._tf)

	slot0.stage:init(slot0.activityVO)

	slot1 = nil

	function slot2(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		seriesAsync({
			function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0.onActivityUpdate = slot0

				if slot0.stage.isFake then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 8-14, warpins: 1 ---
					slot0:emit(HitMonsterNianMediator.ON_FAKE_HIT)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-20, warpins: 1 ---
					slot0:emit(HitMonsterNianMediator.ON_HIT)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 21-21, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end,
			function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-14, warpins: 1 ---
				slot0.stage:update(slot0.activityVO, {
					action = slot1,
					action1 = slot0.stage,
					callback = slot0
				})

				return
				--- END OF BLOCK #0 ---



			end,
			function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				if not slot0.stage:isEnable() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 8-9, warpins: 1 ---
					slot1()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 10-12, warpins: 2 ---
				slot0()

				return
				--- END OF BLOCK #1 ---



			end,
			function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				if slot0.contextData.onAaward then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 6-13, warpins: 1 ---
					slot0.contextData.onAaward()

					slot0.contextData.onAaward = nil
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 14-16, warpins: 2 ---
				slot0()

				return
				--- END OF BLOCK #1 ---



			end
		})

		return
		--- END OF BLOCK #0 ---



	end

	slot0.stage:start(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		slot0:clearEvents()
		slot0.clearEvents:reigsterEvent(slot0.attackA, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot0.stage:receiveAction("A", slot0.stage)

			return
			--- END OF BLOCK #0 ---



		end)
		slot0.clearEvents.reigsterEvent:reigsterEvent(slot0.attackB, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot0.stage:receiveAction("B", slot0.stage)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.reigsterEvent = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	slot3 = slot1:Find("deactive")
	slot4 = slot0.activityVO
	slot5 = slot0.stage:isEnable()
	slot6 = GetOrAddComponent(slot1, typeof(EventTriggerListener))

	slot6:AddPointDownFunc(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-7, warpins: 1 ---
			setActive(slot1, false)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-8, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot6:AddPointUpFunc(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		if slot0.stage:isEnd() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-26, warpins: 1 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("activity_hit_monster_reset_tip"),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-18, warpins: 1 ---
					slot0.data2 = 100
					slot0.data3 = 0

					slot1.stage:restart(slot1.stage.restart)
					slot1.stage:setActivity(slot1.stage.setActivity)

					return
					--- END OF BLOCK #0 ---



				end
			})
			setActive(setActive, true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-29, warpins: 1 ---
			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-36, warpins: 1 ---
				setActive(setActive, true)

				if true then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-39, warpins: 1 ---
					slot4()
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 40-49, warpins: 1 ---
				pg.TipsMgr.GetInstance():ShowTips(i18n("activity_hit_monster_nocount"))
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 50-50, warpins: 4 ---
		return
		--- END OF BLOCK #1 ---



	end)
	table.insert(slot0.triggers, slot6)

	return
	--- END OF BLOCK #0 ---



end

slot0.clearEvents = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0.triggers) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		ClearEventTrigger(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-10, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0:clearEvents()
	slot0.stage:dispose()

	return
	--- END OF BLOCK #0 ---



end

return slot0
