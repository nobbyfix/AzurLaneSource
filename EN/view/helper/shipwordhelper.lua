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
	if type(slot0 or "") == "table" then
		return slot0
	else
		slot1[1] = slot1[1] or math.random(#string.split(slot0, "|"))

		return string.split(slot0, "|")[slot1[1]]
	end
end

function slot12(slot0, slot1, slot2, slot3)
	slot6 = slot2[(slot1(slot0) and slot0) or slot0(slot0)]

	if not slot2[slot5] then
		return nil
	end

	if slot5 == slot4 and slot0 ~= slot4 and slot3 then
		slot3[1] = true
	end

	if ((type(slot3(slot6[slot1], slot2)) == "table" and #slot8 == 0) or slot4(slot8)) and not slot7 then
		if slot3 then
			slot3[1] = true
		end

		slot6 = slot2[slot4]
	end

	return slot6
end

function slot13(slot0, slot1, slot2)
	slot1 = slot1 or 0
	slot3 = nil

	for slot7, slot8 in ipairs(slot0) do
		slot10 = slot8[2]

		if slot8[1] <= slot1 then
			slot3 = slot8

			break
		end
	end

	if slot3 then
		return slot0(slot3[2], slot2), slot3[1]
	end
end

function slot14(slot0, slot1, slot2, slot3, slot4)
	slot6 = (slot1(slot0) and slot0) or slot0(slot0)

	if not slot2[slot6] then
		return nil
	end

	slot8 = slot7[slot1]
	slot9 = slot6 == slot5

	if slot9 and slot0 ~= slot5 and slot4 then
		slot4[1] = true
	end

	if slot3(slot8) then
		return nil
	end

	return slot4(slot8, slot3, slot2)
end

function slot15(slot0)
	return PlayerPrefs.GetInt(CV_LANGUAGE_KEY .. slot0[slot0].ship_group)
end

function slot16(slot0, slot1, slot2)
	slot3 = "event:/cv/" .. slot1 .. "/" .. slot0

	if slot2 then
		slot3 = slot3 .. "_" .. slot2
	end

	return slot3
end

function slot17(slot0, slot1)
	if not slot0[slot1] then
		return -1
	end

	rst = slot3(slot2)

	if rst == 0 or rst == -2 then
		rst = slot3(slot0[slot1(slot1)])
	end

	return rst
end

function slot18(slot0, slot1, slot2, slot3)
	if slot0(slot0, slot1, slot2) then
		slot5, slot6 = nil
		slot8 = (slot1(slot0) == 2 and slot4.voice_key_2) or slot4.voice_key

		if slot1 == slot2.WORD_TYPE_MAIN then
			slot9 = slot3[slot1 .. slot2[1] or slot1]
		end

		if slot8 ~= slot2.CV_KEY_BAN and slot9 then
			slot5 = slot4(slot7, slot0)
			slot10 = slot9.resource_key
			slot11 = nil

			if slot3 and slot8 == slot2.CV_KEY_REPALCE and slot5[slot0].group_index ~= 0 then
				slot11 = slot12
			end

			if slot10 then
				slot6 = slot6(slot10, slot5, slot11)
			end
		end

		return slot5, slot6
	end
end

function slot19(slot0, slot1, slot2)
	return slot0:ExistDifferentWord(slot1, slot2) and slot1[slot0].voice_key == slot0.CV_KEY_BAN_NEW
end

slot0.GetWordAndCV = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = nil
	slot11, slot9 = slot0(slot0, slot1, slot7, slot4, {
		false
	})

	if not slot1(slot8) then
		slot5 = slot8
	elseif slot2(slot0, slot1, {
		slot2
	}, {
		false
	}) then
		slot5 = slot3(slot10[slot1], slot7)
	end

	slot10, slot11 = nil

	if not slot4(slot0, slot1, slot2) then
		slot10, slot11 = slot5(slot0, slot1, slot7, not slot6[1])

		if slot13 and not slot1(slot8) and slot9 then
			slot11 = slot11 .. "_ex" .. slot9
		end
	end

	if type(slot5) ~= "table" then
		if slot5 and ((slot3 == nil and PLATFORM_CODE ~= PLATFORM_US) or slot3 == true) then
			slot5 = slot5:gsub("%s", " ")
		end

		slot6("cv:", slot11, "cvkey:", slot10, "word:", slot5 and HXSet.hxLan(slot5))

		return slot10, slot11, slot5 and HXSet.hxLan(slot5)
	end
end

slot0.RawGetWord = function (slot0, slot1)
	return slot0[slot0][slot1]
end

slot0.RawGetCVKey = function (slot0)
	return 
	-- Decompilation error in this vicinity:
	slot0(slot0)(
	-- Decompilation error in this vicinity:
	slot0(slot0), slot0)
end

slot0.GetDefaultSkin = function (slot0)
	return slot0(slot0)
end

slot0.GetMainSceneWordCnt = function (slot0)
	if not slot0[slot0] or not slot1[slot1.WORD_TYPE_MAIN] or slot1[slot1.WORD_TYPE_MAIN] == "" then
		slot1 = slot0[slot2(slot0)]
	end

	if slot1 and slot1[slot1.WORD_TYPE_MAIN] and slot1[slot1.WORD_TYPE_MAIN] ~= "" then
		return #string.split(slot1[slot1.WORD_TYPE_MAIN], "|")
	end

	return 0
end

slot0.GetL2dCvCalibrate = function (slot0, slot1, slot2)
	if not slot0[slot0] then
		return 0
	end

	if slot1 == slot1.WORD_TYPE_MAIN then
		slot1 = slot1 .. "_" .. slot2
	end

	return slot3.l2d_voice_calibrate[slot1]
end

slot0.GetL2dSoundEffect = function (slot0, slot1, slot2)
	if not slot0[slot0] then
		return 0
	end

	if slot1 == slot1.WORD_TYPE_MAIN then
		slot1 = slot1 .. "_" .. slot2
	end

	return slot3.l2d_se[slot1]
end

slot0.ExistVoiceKey = function (slot0)
	return slot0[slot0] and slot1.voice_key ~= slot1.CV_KEY_BAN
end

slot0.GetCVAuthor = function (slot0)
	slot4 = ""

	return (((slot1(slot0) == 2 and slot1.voice_actor_2) or slot1.voice_actor) == slot2.CV_KEY_BAN and "-") or slot3[(slot1(slot0) == 2 and slot1.voice_actor_2) or slot1.voice_actor].actor_name
end

slot0.GetCVList = function ()
	slot0 = {}

	for slot4, slot5 in pairs(pg.character_voice) do
		if not pg.AssistantInfo.isDisableSpecialClick(slot5.key) and slot5.unlock_condition[1] >= 0 then
			slot0[#slot0 + 1] = setmetatable({}, {
				__index = slot5
			})
		end
	end

	return slot0
end

slot0.ExistDifferentWord = function (slot0, slot1, slot2)
	if slot0(slot0) == slot0 then
		return false
	end

	slot5 = nil

	return (not string.find(slot1, "main") or string.split(slot1[slot0][slot2.WORD_TYPE_MAIN], "|")[slot2]) and slot1[slot0][slot1] and ((not string.find(slot1, "main") or string.split(slot1[slot0][slot2.WORD_TYPE_MAIN], "|")[slot2]) and slot1[slot0][slot1]) ~= "" and ((not string.find(slot1, "main") or string.split(slot1[slot0][slot2.WORD_TYPE_MAIN], "|")[slot2]) and slot1[slot0][slot1]) ~= "nil"
end

slot0.ExistDifferentExWord = function (slot0, slot1, slot2, slot3)
	if slot0 == slot0(slot0) then
		return false
	end

	slot5 = nil

	if string.find(slot1, "main") then
		slot5 = slot1.WORD_TYPE_MAIN
	end

	return not slot3(slot2(slot0, slot5, {
		slot2
	}, slot3)) and slot6 ~= slot2(slot4, slot5, {
		slot2
	}, slot3)
end

slot0.ExistExCv = function (slot0, slot1, slot2, slot3)
	slot4, slot5 = slot0(slot0, slot1, {
		slot2
	}, slot3)

	if slot4 then
		return HXSet.hxLan(slot4), slot5
	end
end

return slot0
