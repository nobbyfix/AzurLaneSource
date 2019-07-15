ys = ys or {}
slot0 = ys
slot1 = slot0.Battle
slot2 = singletonClass
slot3 = "BattleGravitationBulletFactory"
slot4 = slot0.Battle
slot4 = slot4.BattleBulletFactory
slot2 = slot2(slot3, slot4)
slot1.BattleGravitationBulletFactory = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleGravitationBulletFactory
slot2 = "BattleGravitationBulletFactory"
slot1.__name = slot2
slot1 = slot0.Battle
slot1 = slot1.BattleGravitationBulletFactory

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.super
	slot1 = slot1.Ctor
	slot2 = slot0

	slot1(slot2)
end

slot1.Ctor = slot2

function slot2(slot0)
	slot1 = slot0
	slot1 = slot1.Battle
	slot1 = slot1.BattleTorpedoBullet
	slot1 = slot1.New

	return slot1()
end

slot1.MakeBullet = slot2

function slot2(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-32, warpins: 1 ---
	slot4 = slot0
	slot3 = slot0.GetBulletData
	slot3 = slot3(slot4)
	slot5 = slot3
	slot4 = slot3.GetPierceCount
	slot4 = slot4(slot5)
	slot5 = 0

	if slot4 <= slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot5 = slot3
	slot4 = slot3.GetTemplate
	slot4 = slot4(slot5)
	slot5 = slot4.hit_type
	slot6 = slot0
	slot6 = slot6.GetDataProxy
	slot6 = slot6()
	slot8 = slot0
	slot7 = slot0.GetBulletData
	slot7 = slot7(slot8)
	slot9 = slot7
	slot8 = slot7.GetTemplate
	slot8 = slot8(slot9)
	slot9 = slot1
	slot9 = slot9.Battle
	slot9 = slot9.PlayBattleSFX
	slot10 = slot8.hit_sfx

	slot9(slot10)

	slot9 = slot8.extra_param
	slot9 = slot9.diveFilter
	slot9 = slot9 or {
		2
	}
	slot11 = slot7
	slot10 = slot7.GetPosition
	slot10 = slot10(slot11)
	slot11 = slot10
	slot10 = slot10.Clone
	slot10 = slot10(slot11)
	slot12 = slot7
	slot11 = slot7.GetTemplate
	slot11 = slot11(slot12)
	slot11 = slot11.extra_param
	slot11 = slot11.buff_id

	function slot12(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.CanDealDamage
		slot1 = slot1(slot2)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-10, warpins: 1 ---
			slot1 = ipairs
			slot2 = slot0
			slot1, slot2, slot3 = slot1(slot2)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-83, warpins: 0 ---
			for slot4, slot5 in slot1, slot2, slot3 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-13, warpins: 1 ---
				slot6 = slot5.Active

				if slot6 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 14-32, warpins: 1 ---
					slot6 = slot1
					slot7 = slot6
					slot6 = slot6.GetSceneMediator
					slot6 = slot6(slot7)
					slot7 = slot6
					slot6 = slot6.GetCharacter
					slot8 = slot5.UID
					slot6 = slot6(slot7, slot8)
					slot7 = slot6
					slot6 = slot6.GetUnitData
					slot6 = slot6(slot7)
					slot7 = false
					slot9 = slot6
					slot8 = slot6.GetCurrentOxyState
					slot8 = slot8(slot9)
					slot9 = ipairs
					slot10 = slot2
					slot9, slot10, slot11 = slot9(slot10)

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 33-37, warpins: 0 ---
					for slot12, slot13 in slot9, slot10, slot11 do

						-- Decompilation error in this vicinity:
						--- BLOCK #0 33-34, warpins: 1 ---
						if slot8 == slot13 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 35-35, warpins: 1 ---
							slot7 = true
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 36-37, warpins: 3 ---
						--- END OF BLOCK #1 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 38-39, warpins: 1 ---
					if not slot7 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 40-68, warpins: 1 ---
						slot9 = slot3
						slot9 = slot9.Battle
						slot9 = slot9.BattleBuffUnit
						slot9 = slot9.New
						slot10 = slot4
						slot9 = slot9(slot10)
						slot11 = slot6
						slot10 = slot6.AddBuff
						slot12 = slot9

						slot10(slot11, slot12)

						slot10 = slot5
						slot11 = slot10
						slot10 = slot10.HandleDamage
						slot12 = slot0
						slot13 = slot6

						slot10(slot11, slot12, slot13)

						slot10 = pg
						slot10 = slot10.Tool
						slot10 = slot10.FilterY
						slot11 = slot6
						slot13 = slot6
						slot12 = slot6.GetPosition
						slot12 = slot12(slot13)
						slot11 = slot11 - slot12
						slot10 = slot10(slot11)
						slot11 = slot10.magnitude
						slot12 = 0.1

						if slot11 < slot12 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 69-75, warpins: 1 ---
							slot12 = slot6
							slot11 = slot6.SetUncontrollableSpeed
							slot13 = slot10
							slot14 = 0.001
							slot15 = 1e-06

							slot11(slot12, slot13, slot14, slot15)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 76-81, warpins: 1 ---
							slot12 = slot6
							slot11 = slot6.SetUncontrollableSpeed
							slot13 = slot10
							slot14 = 0.1
							slot15 = 1e-07

							slot11(slot12, slot13, slot14, slot15)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #2 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 82-83, warpins: 5 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 84-87, warpins: 1 ---
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.DealDamage

			slot1(slot2)
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 88-88, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	function slot13(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot1 = slot0.Active

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-18, warpins: 1 ---
			slot1 = slot0
			slot2 = slot1
			slot1 = slot1.GetSceneMediator
			slot1 = slot1(slot2)
			slot2 = slot1
			slot1 = slot1.GetCharacter
			slot3 = slot0.UID
			slot1 = slot1(slot2, slot3)
			slot2 = slot1
			slot1 = slot1.GetUnitData
			slot1 = slot1(slot2)
			slot3 = slot1
			slot2 = slot1.RemoveBuff
			slot4 = slot1

			slot2(slot3, slot4)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-19, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	function slot14(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-10, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.GetTemplate
		slot1 = slot1(slot2)
		slot1 = slot1.extra_param
		slot1 = slot1.exploDMG
		slot2 = ipairs
		slot3 = slot0
		slot2, slot3, slot4 = slot2(slot3)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-68, warpins: 0 ---
		for slot5, slot6 in slot2, slot3, slot4 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-13, warpins: 1 ---
			slot7 = slot6.Active

			if slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-32, warpins: 1 ---
				slot7 = slot1
				slot8 = slot7
				slot7 = slot7.GetSceneMediator
				slot7 = slot7(slot8)
				slot8 = slot7
				slot7 = slot7.GetCharacter
				slot9 = slot6.UID
				slot7 = slot7(slot8, slot9)
				slot8 = slot7
				slot7 = slot7.GetUnitData
				slot7 = slot7(slot8)
				slot8 = false
				slot10 = slot7
				slot9 = slot7.GetCurrentOxyState
				slot9 = slot9(slot10)
				slot10 = ipairs
				slot11 = slot2
				slot10, slot11, slot12 = slot10(slot11)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 33-37, warpins: 0 ---
				for slot13, slot14 in slot10, slot11, slot12 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 33-34, warpins: 1 ---
					if slot9 == slot14 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 35-35, warpins: 1 ---
						slot8 = true
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 36-37, warpins: 3 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 38-39, warpins: 1 ---
				if not slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 40-66, warpins: 1 ---
					slot10 = slot3
					slot11 = slot10
					slot10 = slot10.HandleDirectDamage
					slot12 = slot7
					slot13 = slot1
					slot14 = slot0

					slot10(slot11, slot12, slot13, slot14)

					slot10 = pg
					slot10 = slot10.Tool
					slot10 = slot10.FilterY
					slot12 = slot7
					slot11 = slot7.GetPosition
					slot11 = slot11(slot12)
					slot12 = slot4
					slot11 = slot11 - slot12
					slot10 = slot10(slot11)
					slot12 = slot7
					slot11 = slot7.SetUncontrollableSpeed
					slot13 = slot10
					slot14 = 1
					slot15 = 0.2
					slot16 = 6

					slot11(slot12, slot13, slot14, slot15, slot16)

					slot12 = slot7
					slot11 = slot7.RemoveBuff
					slot13 = slot5

					slot11(slot12, slot13)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 67-68, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 69-100, warpins: 1 ---
		slot2 = slot1
		slot2 = slot2.GetFXPool
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.GetFX
		slot4 = slot6
		slot5 = slot4
		slot4 = slot4.GetMissFXID
		slot2, slot3 = slot2(slot3, slot4(slot5))
		slot4 = pg
		slot4 = slot4.EffectMgr
		slot4 = slot4.GetInstance
		slot4 = slot4()
		slot5 = slot4
		slot4 = slot4.PlayBattleEffect
		slot6 = slot2
		slot8 = slot3
		slot7 = slot3.Add
		slot9 = slot4
		slot7 = slot7(slot8, slot9)
		slot8 = true

		slot4(slot5, slot6, slot7, slot8)

		slot4 = slot3
		slot5 = slot4
		slot4 = slot4.RemoveBulletUnit
		slot6 = slot0
		slot7 = slot6
		slot6 = slot6.GetUniqueID

		slot4(slot5, slot6(slot7))

		return
		--- END OF BLOCK #2 ---



	end

	slot16 = slot6
	slot15 = slot6.SpawnLastingColumnArea
	slot18 = slot7
	slot17 = slot7.GetEffectField
	slot17 = slot17(slot18)
	slot19 = slot7
	slot18 = slot7.GetIFF
	slot18 = slot18(slot19)
	slot19 = pg
	slot19 = slot19.Tool
	slot19 = slot19.FilterY
	slot20 = slot10
	slot19 = slot19(slot20)
	slot20 = slot5.range
	slot21 = slot5.time
	slot22 = slot12
	slot23 = slot13
	slot24 = false
	slot26 = slot0
	slot25 = slot0.GetFXID
	slot25 = slot25(slot26)
	slot26 = false
	slot27 = slot14

	slot15(slot16, slot17, slot18, slot19, slot20, slot21, slot22, slot23, slot24, slot25, slot26, slot27)

	return

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #2 33-33, warpins: 1 ---
	slot9 = 
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-73, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 74-74, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

slot1.onBulletHitFunc = slot2

function slot2(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = slot0
	slot1 = slot1.onBulletHitFunc
	slot2 = slot0

	slot1(slot2)

	return
	--- END OF BLOCK #0 ---



end

slot1.onBulletMissFunc = slot2

function slot2(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot4 = slot1
	slot3 = slot1.GetBulletData
	slot3 = slot3(slot4)
	slot5 = slot3
	slot4 = slot3.GetTemplate
	slot4 = slot4(slot5)
	slot6 = slot0
	slot5 = slot0.GetDataProxy
	slot5 = slot5(slot6)
	slot7 = slot0
	slot6 = slot0.GetBulletPool
	slot6 = slot6(slot7)
	slot7 = slot6
	slot6 = slot6.InstBullet
	slot9 = slot1
	slot8 = slot1.GetModleID
	slot8 = slot8(slot9)

	function slot9(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-7, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.AddModel
		slot3 = slot0
		slot1 = slot1(slot2, slot3)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-11, warpins: 1 ---
			slot1 = slot1
			slot1 = slot1.track_fx

			if slot1 ~= "" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-29, warpins: 1 ---
				slot1 = slot2
				slot2 = slot1
				slot1 = slot1.GetFXPool
				slot1 = slot1(slot2)
				slot2 = slot1
				slot1 = slot1.GetFX
				slot3 = slot0
				slot4 = slot3
				slot3 = slot3.GetTrackFXID
				slot1, slot2 = slot1(slot2, slot3(slot4))
				slot3 = slot2
				slot4 = slot3
				slot3 = slot3.MakeTrack
				slot5 = slot0
				slot6 = slot1
				slot7 = slot2

				slot3(slot4, slot5, slot6, slot7)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-30, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot6 = slot6(slot7, slot8, slot9)

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-30, warpins: 1 ---
		slot8 = slot1
		slot7 = slot1.AddTempModel
		slot10 = slot0
		slot9 = slot0.GetTempGOPool
		slot9 = slot9(slot10)
		slot10 = slot9
		slot9 = slot9.GetObject

		slot7(slot8, slot9(slot10))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-54, warpins: 2 ---
	slot8 = slot1
	slot7 = slot1.SetSpawn
	slot9 = slot2

	slot7(slot8, slot9)

	slot8 = slot1
	slot7 = slot1.SetFXFunc
	slot9 = slot0.onBulletHitFunc
	slot10 = slot0.onBulletMissFunc

	slot7(slot8, slot9, slot10)

	slot8 = slot0
	slot7 = slot0.GetSceneMediator
	slot7 = slot7(slot8)
	slot8 = slot7
	slot7 = slot7.AddBullet
	slot9 = slot1

	slot7(slot8, slot9)

	slot8 = slot3
	slot7 = slot3.GetIFF
	slot7 = slot7(slot8)
	slot9 = slot5
	slot8 = slot5.GetFriendlyCode
	slot8 = slot8(slot9)

	if slot7 ~= slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-57, warpins: 1 ---
		slot7 = slot4.alert_fx

		if slot7 ~= "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 58-67, warpins: 1 ---
			slot8 = slot1
			slot7 = slot1.MakeAlert
			slot10 = slot0
			slot9 = slot0.GetFXPool
			slot9 = slot9(slot10)
			slot10 = slot9
			slot9 = slot9.GetFX
			slot11 = slot4.alert_fx

			slot7(slot8, slot9(slot10, slot11))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 68-69, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

slot1.MakeModel = slot2

return
