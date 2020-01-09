slot0 = class("ShipWordHelper")
slot1 = pg.ship_skin_template
slot2 = pg.ship_skin_words
slot3 = pg.ship_skin_words_extra
slot4 = pg.character_voice
slot5 = pg.voice_actor_CN
slot0.WORD_TYPE_MAIN = "main"
slot0.WORD_TYPE_SKILL = "skill"
slot0.WORD_TYPE_UNLOCK = "unlock"
slot0.WORD_TYPE_PROFILE = "profile"
slot0.WORD_TYPE_DROP = "drop_descrip"
slot0.WORD_TYPE_MVP = "win_mvp"
slot0.WORD_TYPE_LOSE = "lose"
slot0.WORD_TYPE_UPGRADE = "upgrade"
slot0.CV_KEY_REPALCE = 0
slot0.CV_KEY_BAN = -1
slot0.CV_KEY_BAN_NEW = -2
slot0.CVBattleKey = {
	hp = "hp",
	link2 = "link2",
	link4 = "link4",
	link5 = "link5",
	link3 = "link3",
	link6 = "link6",
	skill = "skill",
	link1 = "link1",
	lose = "lose",
	warcry = "warcry",
	mvp = "mvp"
}

function slot6(...)
	if Application.isEditor then
		print(...)
	end
end

function slot7(slot0)
	if not slot0 or slot0 == "" or slot0 == "nil" then
		return true
	end
end

function slot8(slot0)
	return slot0[slot0] ~= nil
end

function slot9(slot0)
	return slot0[slot0] ~= nil
end

function slot10(slot0)
	return ShipGroup.getDefaultSkin(slot0[slot0].ship_group).id
end

function slot11(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0 = slot0 or ""
	slot1[1] = slot1[1] or math.random(#string.split(slot0 or "", "|"))

	return string.split(slot0 or "", "|")[slot1[1]]

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	slot0 = ""
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-11, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 12-15, warpins: 1 ---
	slot3 = math.random(#string.split(slot0 or "", "|"))
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 16-19, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

function slot12(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot4 = slot0(slot0)

	if not slot1(slot0) or not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 2 ---
		slot5 = slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-17, warpins: 2 ---
	slot6 = slot2[slot5]

	if not slot2[slot5] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-19, warpins: 1 ---
		return nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-21, warpins: 2 ---
	if slot5 ~= slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-23, warpins: 1 ---
		slot7 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-24, warpins: 1 ---
		slot7 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 25-30, warpins: 2 ---
	slot8 = slot3(slot6[slot1], slot2)

	if slot7 and slot0 ~= slot4 and slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-36, warpins: 1 ---
		slot3[1] = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 37-41, warpins: 4 ---
	if slot4(slot8) and not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-45, warpins: 1 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-47, warpins: 1 ---
			slot3[1] = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 48-49, warpins: 2 ---
		slot6 = slot2[slot4]
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 50-50, warpins: 3 ---
	return slot6
	--- END OF BLOCK #5 ---



end

function slot13(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot1 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-8, warpins: 2 ---
	slot3 = nil

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 9-16, warpins: 0 ---
	for slot7, slot8 in ipairs(slot0) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 1 ---
		slot10 = slot8[2]

		if slot8[1] <= slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot3 = slot8

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-16, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 17-18, warpins: 2 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-25, warpins: 1 ---
		return slot0(slot3[2], slot2), slot3[1]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 26-26, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

function slot14(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot5 = slot0(slot0)

	if not slot1(slot0) or not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 2 ---
		slot6 = slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-15, warpins: 2 ---
	if not slot2[slot6] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-17, warpins: 1 ---
		return nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-20, warpins: 2 ---
	slot8 = slot7[slot1]

	if slot6 ~= slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-22, warpins: 1 ---
		slot9 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-23, warpins: 1 ---
		slot9 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 24-25, warpins: 2 ---
	if slot9 and slot0 ~= slot5 and slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-31, warpins: 1 ---
		slot4[1] = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 32-36, warpins: 4 ---
	if slot3(slot8) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-38, warpins: 1 ---
		return nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 39-43, warpins: 2 ---
	return slot4(slot8, slot3, slot2)
	--- END OF BLOCK #5 ---



end

function slot15(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	return PlayerPrefs.GetInt(CV_LANGUAGE_KEY .. slot0[slot0].ship_group)
	--- END OF BLOCK #0 ---



end

function slot16(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot3 = "event:/cv/" .. slot1 .. "/" .. slot0

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-11, warpins: 1 ---
		slot3 = slot3 .. "_" .. slot2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return slot3
	--- END OF BLOCK #1 ---



end

function slot17(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		return -1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-14, warpins: 1 ---
	rst = slot3(slot2)

	if rst == 0 or rst == -2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-26, warpins: 2 ---
		rst = slot3(slot0[slot1(slot1)])
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-29, warpins: 2 ---
	return rst
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 30-30, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

function slot18(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot0(slot0, slot1, slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot5, slot6 = nil

		if slot1(slot0) ~= 2 or not slot4.voice_key_2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 2 ---
			slot8 = slot4.voice_key
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-21, warpins: 2 ---
		if slot1 == slot2.WORD_TYPE_MAIN and not (slot1 .. slot2[1]) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-26, warpins: 1 ---
			slot1 = slot1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-32, warpins: 3 ---
		slot9 = slot3[slot1]

		if slot8 ~= slot2.CV_KEY_BAN and slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-43, warpins: 1 ---
			slot5 = slot4(slot7, slot0)
			slot10 = slot9.resource_key
			slot11 = nil

			if slot3 and slot8 == slot2.CV_KEY_REPALCE and slot5[slot0].group_index ~= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-53, warpins: 1 ---
				slot11 = slot12
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 54-55, warpins: 4 ---
			if slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-61, warpins: 1 ---
				slot6 = slot6(slot10, slot5, slot11)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 62-64, warpins: 4 ---
		return slot5, slot6
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 65-65, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

function slot19(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot3 = slot0:ExistDifferentWord(slot1, slot2)

	if slot1[slot0].voice_key ~= slot0.CV_KEY_BAN_NEW then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-15, warpins: 1 ---
		slot4 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-16, warpins: 1 ---
		slot4 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-18, warpins: 2 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-19, warpins: 1 ---
		slot5 = slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-20, warpins: 2 ---
	return slot5
	--- END OF BLOCK #2 ---



end

slot0.GetWordAndCV = function (slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot5 = nil
	slot11, slot9 = slot0(slot0, slot1, slot7, slot4, {
		false
	})

	if not slot1(slot8) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 1 ---
		slot5 = slot8
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-30, warpins: 1 ---
		if slot2(slot0, slot1, {
			slot2
		}, {
			false
		}) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-35, warpins: 1 ---
			slot5 = slot3(slot10[slot1], slot7)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 36-43, warpins: 3 ---
	slot10, slot11 = nil

	if not slot4(slot0, slot1, slot2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-54, warpins: 1 ---
		slot10, slot11 = slot5(slot0, slot1, slot7, not slot6[1])

		if slot13 and not slot1(slot8) and slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-65, warpins: 1 ---
			slot11 = slot11 .. "_ex" .. slot9
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 66-67, warpins: 5 ---
	if slot5 and ((slot3 == nil and PLATFORM_CODE ~= PLATFORM_US) or slot3 == true) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 76-81, warpins: 2 ---
		slot5 = slot5:gsub("%s", " ")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 82-83, warpins: 3 ---
	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 84-88, warpins: 1 ---
		slot5 = HXSet.hxLan(slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 89-100, warpins: 2 ---
	slot6("cv:", slot11, "cvkey:", slot10, "word:", slot5)

	return slot10, slot11, slot5
	--- END OF BLOCK #4 ---



end

slot0.RawGetWord = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	return slot0[slot0][slot1]
	--- END OF BLOCK #0 ---



end

slot0.RawGetCVKey = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	return 
	-- Decompilation error in this vicinity:
	slot0(slot0)(
	-- Decompilation error in this vicinity:
	slot0(slot0), slot0)
	--- END OF BLOCK #0 ---



end

slot0.GetDefaultSkin = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	return slot0(slot0)
	--- END OF BLOCK #0 ---



end

slot0.GetMainSceneWordCnt = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0[slot0] or not slot1[slot1.WORD_TYPE_MAIN] or slot1[slot1.WORD_TYPE_MAIN] == "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-19, warpins: 3 ---
		slot1 = slot0[slot2(slot0)]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-21, warpins: 2 ---
	if slot1 and slot1[slot1.WORD_TYPE_MAIN] and slot1[slot1.WORD_TYPE_MAIN] ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-40, warpins: 1 ---
		return #string.split(slot1[slot1.WORD_TYPE_MAIN], "|")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-42, warpins: 4 ---
	return 0
	--- END OF BLOCK #2 ---



end

slot0.GetL2dCvCalibrate = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0[slot0] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		return 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-10, warpins: 2 ---
	if slot1 == slot1.WORD_TYPE_MAIN then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-14, warpins: 1 ---
		slot1 = slot1 .. "_" .. slot2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-17, warpins: 2 ---
	return slot3.l2d_voice_calibrate[slot1]
	--- END OF BLOCK #2 ---



end

slot0.GetL2dSoundEffect = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if not slot0[slot0] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		return 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-10, warpins: 2 ---
	if slot1 == slot1.WORD_TYPE_MAIN then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-14, warpins: 1 ---
		slot1 = slot1 .. "_" .. slot2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-17, warpins: 2 ---
	return slot3.l2d_se[slot1]
	--- END OF BLOCK #2 ---



end

slot0.ExistVoiceKey = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0[slot0] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-9, warpins: 1 ---
		if slot1.voice_key == slot1.CV_KEY_BAN then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-11, warpins: 1 ---
			slot2 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-12, warpins: 1 ---
			slot2 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 3 ---
	return slot2
	--- END OF BLOCK #1 ---



end

slot0.GetCVAuthor = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	if slot1(slot0) ~= 2 or not slot1.voice_actor_2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 2 ---
		slot3 = slot1.voice_actor
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-16, warpins: 2 ---
	slot4 = ""

	if slot3 == slot2.CV_KEY_BAN then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-18, warpins: 1 ---
		slot4 = "-"
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-21, warpins: 1 ---
		slot4 = slot3[slot3].actor_name
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-22, warpins: 2 ---
	return slot4
	--- END OF BLOCK #2 ---



end

slot0.GetCVList = function ()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0 = {}

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-28, warpins: 0 ---
	for slot4, slot5 in pairs(pg.character_voice) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		if not pg.AssistantInfo.isDisableSpecialClick(slot5.key) and slot5.unlock_condition[1] >= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-26, warpins: 1 ---
			slot0[#slot0 + 1] = setmetatable({}, {
				__index = slot5
			})
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 27-28, warpins: 4 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-29, warpins: 1 ---
	return slot0
	--- END OF BLOCK #2 ---



end

slot0.ExistDifferentWord = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0(slot0) == slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-17, warpins: 2 ---
	slot4 = slot1[slot0]
	slot5 = nil

	if string.find(slot1, "main") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-27, warpins: 1 ---
		slot5 = string.split(slot4[slot2.WORD_TYPE_MAIN], "|")[slot2]
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-28, warpins: 1 ---
		slot5 = slot4[slot1]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-30, warpins: 2 ---
	if not slot5 or slot5 == "" or slot5 == "nil" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-36, warpins: 3 ---
		slot6 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-37, warpins: 1 ---
		slot6 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 38-38, warpins: 2 ---
	return slot6
	--- END OF BLOCK #3 ---



end

slot0.ExistDifferentExWord = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0 == slot0(slot0) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		return false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-15, warpins: 2 ---
	slot5 = nil

	if string.find(slot1, "main") then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-17, warpins: 1 ---
		slot5 = slot1.WORD_TYPE_MAIN
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-36, warpins: 2 ---
	slot7 = slot2(slot4, slot5, {
		slot2
	}, slot3)

	if slot3(slot2(slot0, slot5, {
		slot2
	}, slot3)) or slot6 == slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-40, warpins: 2 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-41, warpins: 1 ---
		slot8 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 42-42, warpins: 2 ---
	return slot8
	--- END OF BLOCK #3 ---



end

slot0.ExistExCv = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot4, slot5 = slot0(slot0, slot1, {
		slot2
	}, slot3)

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		return HXSet.hxLan(slot4), slot5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

return slot0
