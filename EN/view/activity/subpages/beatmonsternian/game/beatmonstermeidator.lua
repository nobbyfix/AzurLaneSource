slot0 = class("BeatMonsterMeidator")
slot1 = 1
slot2 = 0.1
slot3 = 1

slot0.Ctor = function (slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0.controller = slot1
end

slot0.SetUI = function (slot0, slot1)
	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.monsterNian = slot0:findTF("AD/monster")
	slot0.fushun = slot0:findTF("AD/fushun")
	slot0.hpTF = slot0:findTF("AD/hp"):GetComponent(typeof(Slider))
	slot0.attackCntTF = slot0:findTF("AD/attack_count/Text"):GetComponent(typeof(Text))
	slot0.actions = slot0:findTF("AD/actions")
	slot0.actionKeys = {
		slot0.actions:Find("content/1"),
		slot0.actions:Find("content/2"),
		slot0.actions:Find("content/3")
	}
	slot0.curtainTF = slot0:findTF("AD/curtain")
	slot0.startLabel = slot0.curtainTF:Find("start_label")
	slot0.ABtn = slot0:findTF("AD/A_btn")
	slot0.joyStick = slot0:findTF("AD/joyStick")
end

slot0.DoCurtainUp = function (slot0, slot1)
	if getProxy(SettingsProxy):IsShowBeatMonseterNianCurtain() then
		slot2:SetBeatMonseterNianFlag()
		slot0:StartCurtainUp(slot1)
	else
		slot1()
	end
end

slot0.StartCurtainUp = function (slot0, slot1)
	setActive(slot0.curtainTF, true)
	LeanTween.color(slot0.curtainTF, Color.white, slot0):setFromColor(Color.black):setOnComplete(System.Action(function ()
		setActive(slot0.startLabel, true)
		blinkAni(slot0.startLabel, , 2):setOnComplete(System.Action(function ()
			LeanTween.alpha(slot0.curtainTF, 0, ):setFrom(1)
			LeanTween.alpha(slot0.startLabel, 0, ):setFrom(1):setOnComplete(System.Action(System.Action))
		end))
	end))
end

slot0.OnInited = function (slot0)
	local function slot1()
		if slot0.attackCnt <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("activity_hit_monster_nocount"))

			return false
		end

		if slot0.hp <= 0 then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("activity_hit_monster_reset_tip"),
				onYes = function ()
					slot0.controller:ReStartGame()
				end
			})

			return false
		end

		return true
	end

	slot0:OnTrigger(slot0.ABtn, slot1, function ()
		slot0.controller:Input(BeatMonsterNianConst.ACTION_NAME_A)
	end)
	slot0:OnSwitch(slot0.joyStick, slot1, function (slot0)
		slot0.controller:Input((slot0 and BeatMonsterNianConst.ACTION_NAME_L) or BeatMonsterNianConst.ACTION_NAME_R)
	end)
end

slot0.OnAttackCntUpdate = function (slot0, slot1)
	slot0.attackCnt = slot1
	slot0.attackCntTF.text = slot1
end

slot0.OnMonsterHpUpdate = function (slot0, slot1)
	slot0.hp = slot1

	slot0.fuShun:SetInteger("hp", slot1)
	slot0.nian:SetInteger("hp", slot1)
end

slot0.OnUIHpUpdate = function (slot0, slot1, slot2, slot3)
	LeanTween.value(slot0.hpTF.gameObject, slot4, slot5, 0.3):setOnUpdate(System.Action_float(function (slot0)
		slot0.hpTF.value = slot0
	end)):setOnComplete(System.Action(function ()
		if slot0 then
			slot0()
		end
	end))
end

slot0.OnAddFuShun = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.fuShun = slot0.fushun:GetComponent(typeof(Animator))

	slot0.fuShun:SetInteger("hp", slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.OnAddMonsterNian = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot0.hp = slot1
	slot0.nian = slot0.monsterNian:GetComponent(typeof(Animator))
	slot0.hpTF.value = slot1 / slot2

	slot0.nian:SetInteger("hp", slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.OnChangeFuShunAction = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.fuShun:SetTrigger(slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.OnChangeNianAction = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0.nian:SetTrigger(slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.OnInputChange = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 8-9, warpins: 3 ---
	if slot1 and slot1 ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-13, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-63, warpins: 0 ---
		for slot6, slot7 in ipairs(slot0.actionKeys) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-21, warpins: 1 ---
			setActive(slot7:Find("A"), (string.sub(slot1, slot6, slot6) or "") == BeatMonsterNianConst.ACTION_NAME_A)
			setActive(slot7:Find("L"), (string.sub(slot1, slot6, slot6) or "") == BeatMonsterNianConst.ACTION_NAME_L)
			setActive(slot7:Find("R"), (string.sub(slot1, slot6, slot6) or "") == BeatMonsterNianConst.ACTION_NAME_R)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 23-31, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 35-44, warpins: 2 ---
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 48-57, warpins: 2 ---
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 61-61, warpins: 2 ---
			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 62-63, warpins: 2 ---
			--- END OF BLOCK #5 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 64-68, warpins: 2 ---
	setActive(slot0.actions, slot2)

	return
	--- END OF BLOCK #1 ---



end

slot0.PlayStory = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	pg.StoryMgr.GetInstance():Play(slot1, slot2)

	return
	--- END OF BLOCK #0 ---



end

slot0.DisplayAwards = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	pg.m02:sendNotification(ActivityProxy.ACTIVITY_SHOW_AWARDS, {
		awards = slot1,
		callback = slot2
	})

	return
	--- END OF BLOCK #0 ---



end

slot0.Dispose = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	pg.DelegateInfo.Dispose(slot0)

	return
	--- END OF BLOCK #0 ---



end

slot0.OnTrigger = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot4 = slot1:Find("off")
	slot5 = true
	slot6 = GetOrAddComponent(slot1, typeof(EventTriggerListener))

	slot6:AddPointDownFunc(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot1() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-10, warpins: 1 ---
			setActive(setActive, false)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-11, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot6:AddPointUpFunc(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-10, warpins: 1 ---
			setActive(slot1, true)

			if setActive then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 1 ---
				slot2()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-13, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot0.OnSwitch = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	onButton(slot0, slot1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-13, warpins: 1 ---
			slot2(not slot1)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-16, warpins: 1 ---
				slot3(slot1)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-17, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	-- Decompilation error in this vicinity:
	function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		setActive(slot0:Find("on"), slot0)
		setActive(slot0:Find("off"), not slot0)

		return
		--- END OF BLOCK #0 ---



	end(false)

	return
	--- END OF BLOCK #0 ---



end

slot0.findTF = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return findTF(slot2 or slot0._tf, slot1)
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-6, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

return slot0
