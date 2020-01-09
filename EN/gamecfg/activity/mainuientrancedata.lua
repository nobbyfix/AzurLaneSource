return {
	{
		Tip = "tip_1920",
		Image = "event_all",
		ButtonName = "activityButton",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, true)
			onButton(slot0, slot1, function ()
				slot0:emit(MainUIMediator.GO_SCENE, {
					SCENE.ACTIVITY
				})
			end, SFX_PANEL)
		end
	},
	{
		Image = "event_map",
		ButtonName = "activity_map_btn",
		UpdateButton = function (slot0, slot1)
			setActive(slot1, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot2:isEnd())

			if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_ZPROJECT) and not slot2.isEnd() then
				onButton(slot0, slot1, function ()
					slot0:emit(MainUIMediator.ON_ACTIVITY_MAP, slot1.id)
				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_minigame",
		ButtonName = "activity_newyear",
		Tip = "tip_1920",
		CtorButton = function (slot0, slot1)
			if getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) and not slot2:isEnd() and getProxy(MiniGameProxy):GetMiniGameData(3) and not slot3:GetRuntimeData("isInited") then
				slot0:emit(MainUIMediator.MINIGAME_OPERATION, 4, MiniGameOPCommand.CMD_SPECIAL_GAME, {
					3,
					1
				})
			end
		end,
		UpdateButton = function (slot0, slot1)
			if getProxy(ActivityProxy):getActivityById(ActivityConst.NEWYEAR_ACTIVITY) then
				slot3 = not slot2:isEnd()
			end

			setActive(slot1, slot3)

			if slot3 then
				slot6 = getProxy(MiniGameProxy).GetHubByHubId(slot5, slot4)
				slot7 = slot6.count

				if slot6:getConfig("reward_need") > slot6.usedtime or slot6.ultimate ~= 0 then
					slot8 = false
				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 45-45, warpins: 1 ---
					slot8 = true

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 46-50, warpins: 2 ---
					if not slot9() then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 51-53, warpins: 1 ---
						slot10 = CygnetBathrobePage.IsTip()

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 54-56, warpins: 2 ---
						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #2 57-58, warpins: 1 ---
						if not slot8 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 59-60, warpins: 1 ---
							slot11 = slot10

							if slot10 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 61-62, warpins: 0 ---
								slot11 = false

								if false then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 63-63, warpins: 1 ---
									slot11 = true
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #2 ---



					end
					--- END OF BLOCK #1 ---



				end

				slot10 = slot9() or CygnetBathrobePage.IsTip()

				setActive(slot1:Find("Tip"), slot7 > 0 or slot8 or slot9() or CygnetBathrobePage.IsTip())

				if slot7 > 0 or slot8 or slot9() or CygnetBathrobePage.IsTip() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 73-79, warpins: 1 ---
					slot12 = slot1:Find("Tip/Text")
					slot13 = nil

					if slot8 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 80-81, warpins: 1 ---
						slot13 = "!"
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 82-84, warpins: 1 ---
						if slot7 > 0 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 85-86, warpins: 1 ---
							slot13 = slot7
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 87-88, warpins: 1 ---
							if slot10 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 89-89, warpins: 1 ---
								slot13 = "!"
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 90-93, warpins: 4 ---
					setText(slot12, slot13 or "")

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #2 94-94, warpins: 1 ---
					slot16 = ""
					--- END OF BLOCK #2 ---

					FLOW; TARGET BLOCK #3



					-- Decompilation error in this vicinity:
					--- BLOCK #3 95-95, warpins: 2 ---
					--- END OF BLOCK #3 ---



				end

				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-10, warpins: 1 ---
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.NEWYEAR_SQUARE)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
			end
		end
	},
	{
		Image = "event_escort",
		ButtonName = "activity_escort",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-12, warpins: 1 ---
			setActive(slot1, OPEN_ESCORT)
			onButton(slot0, slot1, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0:emit(MainUIMediator.OPEN_ESCORT)

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)

			return
			--- END OF BLOCK #0 ---



		end
	},
	{
		Tip = "tip",
		Image = "event_boss",
		ButtonName = "activity_boss",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_BOSS_BATTLE_MARK_2) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot3 = not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-20, warpins: 2 ---
			setActive(slot1, slot3)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-31, warpins: 1 ---
				slot4 = false

				if getProxy(ActivityProxy):getActivityById(ActivityConst.ACTIVITY_BOSS_PT_ID) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 32-39, warpins: 1 ---
					slot4 = ActivityBossPtData.New(slot5):CanGetAward()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 40-52, warpins: 2 ---
				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-11, warpins: 1 ---
					slot0:emit(MainUIMediator.GO_SCENE, {
						SCENE.ACT_BOSS_BATTLE
					})

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 53-54, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end
	},
	{
		ButtonName = "activity_ins",
		UpdateButton = function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_INSTAGRAM) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				slot3 = not slot2:isEnd()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-20, warpins: 2 ---
			setActive(slot1, slot3)

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-50, warpins: 1 ---
				slot1:Find("icon"):GetComponent(typeof(Animator)).enabled = getProxy(InstagramProxy):ShouldShowTip()

				setActive(slot1:Find("Tip"), slot4)
				onButton(slot0, slot1, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-7, warpins: 1 ---
					slot0:emit(MainUIMediator.OPEN_INS)

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 51-52, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end
	},
	LayoutProperty = {
		CellSize = Vector2(208, 215)
	},
	CurrentEntrancesList = {
		1,
		2,
		3,
		6
	}
}
