slot0 = class("Commander", import("..BaseVO"))
slot1 = pg.commander_level
slot2 = pg.commander_attribute_template

slot0.rarity2Print = function (slot0)
	if not slot0.prints then
		slot0.prints = {
			"n",
			"n",
			"r",
			"sr",
			"ssr"
		}
	end

	return slot0.prints[slot0]
end

slot0.rarity2Frame = function (slot0)
	if not slot0.frames then
		slot0.frames = {
			"2",
			"2",
			"3",
			"4",
			"5"
		}
	end

	return slot0.frames[slot0]
end

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.template_id or slot0.id
	slot0.level = slot1.level
	slot0.exp = slot1.exp
	slot0.isLock = slot1.is_locked
	slot0.pt = slot1.used_pt

	if slot1.name and slot1.name ~= "" then
		slot0.name = slot1.name
	end

	slot0.renameTime = (slot1.rename_time or 0) + pg.gameset.commander_rename_coldtime.key_value
	slot0.talentOrigins = {}

	for slot6, slot7 in ipairs(slot1.ability_origin) do
		slot8 = CommanderTalent.New({
			id = slot7
		})

		slot8:setOrigin(slot8)
		table.insert(slot0.talentOrigins, slot8)
	end

	slot0.talents = {}

	for slot6, slot7 in ipairs(slot1.ability) do
		slot0:addTalent(CommanderTalent.New({
			id = slot7
		}))
	end

	slot0.notLearnedList = {}
	slot0.abilityTime = slot1.ability_time
	slot0.skills = {}

	for slot6, slot7 in ipairs(slot1.skill) do
		table.insert(slot0.skills, CommanderSkill.New({
			id = slot7.id,
			exp = slot7.exp
		}))
	end

	slot0.abilitys = {}

	slot0:updateAbilitys()

	slot0.maxLevel = slot0.all[#slot0.all]
	slot0.groupId = slot0:getConfig("group_type")
end

slot0.getRenameTime = function (slot0)
	return slot0.renameTime
end

slot0.setRenameTime = function (slot0, slot1)
	slot0.renameTime = slot1
end

slot0.canModifyName = function (slot0)
	return slot0.renameTime <= pg.TimeMgr.GetInstance():GetServerTime()
end

slot0.getRenameTimeDesc = function (slot0)
	slot3, slot4, slot5, slot6 = pg.TimeMgr.GetInstance():parseTimeFrom(slot0.renameTime - pg.TimeMgr.GetInstance():GetServerTime())

	if slot3 < 1 then
		if slot4 < 1 then
			return slot5 .. i18n("word_minute")
		else
			return slot4 .. i18n("word_hour")
		end
	else
		return slot3 .. i18n("word_date")
	end
end

slot0.setLock = function (slot0, slot1)
	slot0.isLock = slot1
end

slot0.getLock = function (slot0)
	return slot0.isLock
end

slot0.isLocked = function (slot0)
	return slot0.isLock == 1
end

slot0.bindConfigTable = function (slot0)
	return pg.commander_data_template
end

slot0.getSkill = function (slot0, slot1)
	return _.detect(slot0.skills, function (slot0)
		return slot0.id == slot0
	end)
end

slot0.getSkills = function (slot0)
	return slot0.skills
end

slot0.getTalents = function (slot0)
	return slot0.talents
end

slot0.getTalentOrigins = function (slot0)
	return slot0.talentOrigins
end

slot0.addTalent = function (slot0, slot1)
	slot1:setOrigin(slot2)
	table.insert(slot0.talents, slot1)
end

slot0.deleteTablent = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0.talents) do
		if slot6.id == slot1 then
			table.remove(slot0.talents, slot5)

			break
		end
	end
end

slot0.getTalent = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.talents) do
		if slot6 == slot1 then
			return slot6
		end
	end
end

slot0.resetTalents = function (slot0)
	slot0.talents = slot0.talentOrigins
end

slot0.getNotLearnedList = function (slot0)
	return slot0.notLearnedList
end

slot0.updateNotLearnedList = function (slot0, slot1)
	slot0.notLearnedList = slot1
end

slot0.getResetTalentConsume = function (slot0)
	return pg.gameset.commander_skill_reset_cost.description[1][slot0.pt]
end

slot0.getTotalPoint = function (slot0)
	return math.floor(slot0.level / CommanderConst.TALENT_POINT_LEVEL) * CommanderConst.TALENT_POINT
end

slot0.getTalentPoint = function (slot0)
	return slot0:getTotalPoint() - slot0.pt
end

slot0.updatePt = function (slot0, slot1)
	slot0.pt = slot1
end

slot0.getPt = function (slot0)
	return slot0.pt
end

slot0.fullTalentCnt = function (slot0)
	return CommanderConst.MAX_TELENT_COUNT <= #slot0.talents
end

slot0.hasTalent = function (slot0, slot1)
	return slot0:getSameGroupTalent(slot1.groupId) ~= nil
end

slot0.getSameGroupTalent = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0.talents) do
		if slot6.groupId == slot1 then
			return slot6
		end
	end
end

slot0.getTalentsDesc = function (slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot2) do
		for slot11, slot12 in pairs(slot7:getDesc()) do
			if slot1[slot11] then
				slot1[slot11].value = slot1[slot11].value + slot12.value
			else
				slot1[slot11] = {
					name = slot11,
					value = slot12.value,
					type = slot12.type
				}
			end
		end
	end

	return slot1
end

slot0.getAbilitys = function (slot0)
	return slot0.abilitys
end

slot0.updateAbilitys = function (slot0)
	slot1 = pg.gameset.commander_grow_form_a.key_value
	slot2 = pg.gameset.commander_grow_form_b.key_value

	function slot3(slot0)
		slot1 = slot0:getConfig(slot0 .. "_value")

		return math.floor(slot1 + (slot1 * (slot0.level - 1) * slot1) / math.floor)
	end

	slot5 = {
		101,
		102,
		103
	}

	for slot9, slot10 in ipairs(slot4) do
		slot0.abilitys[slot10] = {
			value = slot3(slot10),
			id = slot5[slot9]
		}
	end
end

slot0.getAbilitysAddition = function (slot0)
	slot1 = pg.gameset.commander_form_a.key_value
	slot2 = pg.gameset.commander_form_b.key_value
	slot3 = pg.gameset.commander_form_c.key_value
	slot4 = pg.gameset.commander_form_n.key_value

	function slot5(slot0)
		slot1 = 0

		for slot5, slot6 in pairs(slot0.abilitys) do
			if slot1[slot6.id]["rate_" .. slot0] and slot7["rate_" .. slot0] / 10000 > 0 then
				slot1 = slot1 + slot6.value * slot8
			end
		end

		return tonumber(string.format("%0.3f", (slot2 - slot3 / (slot1 + slot4)) * ()))
	end

	slot6 = {}

	for slot10, slot11 in ipairs(CommanderConst.PROPERTIES) do
		slot6[slot11] = slot5(slot11)
	end

	return slot6
end

slot0.getTalentsAddition = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = 0

	for slot10, slot11 in pairs(slot6) do
		slot12, slot13 = slot11:getAttrsAddition()
		slot14 = nil

		if slot1 == CommanderConst.TALENT_ADDITION_NUMBER then
			slot14 = slot12
		elseif slot1 == CommanderConst.TALENT_ADDITION_RATIO then
			slot14 = slot13
		end

		slot16 = true

		if slot14[slot2] then
			if #slot15.nation > 0 and not table.contains(slot15.nation, slot3) then
				slot16 = false
			end

			if #slot15.shiptype > 0 and not table.contains(slot15.shiptype, slot4) then
				slot16 = false
			end
		else
			slot16 = false
		end

		if slot16 then
			slot5 = slot5 + slot15.value
		end
	end

	return slot5
end

slot0.getAttrRatioAddition = function (slot0, slot1, slot2, slot3)
	if table.contains(CommanderConst.PROPERTIES, slot1) then
		return slot0:getAbilitysAddition()[slot1] + slot0:getTalentsAddition(CommanderConst.TALENT_ADDITION_RATIO, slot1, slot2, slot3) / 100
	else
		return 0
	end
end

slot0.getAttrValueAddition = function (slot0, slot1, slot2, slot3)
	if table.contains(CommanderConst.PROPERTIES, slot1) then
		return slot0:getTalentsAddition(CommanderConst.TALENT_ADDITION_NUMBER, slot1, slot2, slot3)
	else
		return 0
	end
end

slot0.addExp = function (slot0, slot1)
	if slot0:isMaxLevel() then
		return
	end

	slot0.exp = slot0.exp + slot1

	while not slot0:isMaxLevel() and slot0:canLevelUp() do
		slot0.exp = slot0.exp - slot0:getNextLevelExp()

		slot0:updateLevel()
	end
end

slot0.canLevelUp = function (slot0)
	return slot0:getNextLevelExp() <= slot0.exp
end

slot0.isMaxLevel = function (slot0)
	return slot0:getMaxLevel() <= slot0.level
end

slot0.getMaxLevel = function (slot0)
	return slot0.maxLevel
end

slot0.updateLevel = function (slot0)
	slot0.level = slot0.level + 1

	slot0:updateAbilitys()

	if slot0.level % CommanderConst.TALENT_POINT_LEVEL == 0 then
		slot0.notLearnedList = {}
	end
end

slot0.getConfigExp = function (slot0, slot1)
	return slot0[slot1]["exp_" .. slot0:getRarity()] or slot2.exp
end

slot0.getNextLevelExp = function (slot0)
	return slot0:getConfigExp(slot0.level)
end

slot0.getName = function (slot0)
	return slot0.name or slot0:getConfig("name")
end

slot0.setName = function (slot0, slot1)
	slot0.name = slot1
end

slot0.getRarity = function (slot0)
	return slot0:getConfig("rarity")
end

slot0.isSSR = function (slot0)
	return slot0:getRarity() == 5
end

slot0.getPainting = function (slot0)
	return slot0:getConfig("painting")
end

slot0.getLevel = function (slot0)
	return slot0.level
end

slot0.getDestoryedExp = function (slot0, slot1)
	slot2 = 0

	for slot6 = 1, slot0.level - 1, 1 do
		slot2 = slot2 + slot0:getConfigExp(slot6)
	end

	slot7, slot8 = 
	-- Decompilation error in this vicinity:
	function ()
		slot1 = 0

		for slot6, slot7 in ipairs(slot2) do
			slot0 = slot0 + slot7:getDestoryExpValue()
			slot1 = slot1 + slot7:getDestoryExpRetio()
		end

		return slot0, slot1 / 10000
	end()

	return (slot0:getConfig("exp") + (slot2 + slot0.exp) * pg.gameset.commander_exp_a.key_value / 10000) * ((slot1 == slot0.groupId and pg.gameset.commander_exp_same_rate.key_value / 10000) or 1) * (1 + slot8) + slot7
end

slot0.getDestoryedSkillExp = function (slot0, slot1)
	if slot1 == slot0.groupId then
		return pg.gameset.commander_skill_exp.key_value
	end

	return 0
end

slot0.updateAbilityTime = function (slot0, slot1)
	slot0.abilityTime = slot1
end

slot0.isLevelUp = function (slot0, slot1)
	return slot0.level > 1 and slot0.exp - slot1 < 0
end

slot0.isSameGroup = function (slot0, slot1)
	return slot1 == slot0.groupId
end

slot0.getUpgradeConsume = function (slot0)
	return math.floor(slot0:getConfig("exp_cost") + slot0.getConfig("exp_cost") * (slot0.level - 1) * (0.85 + 0.15 * slot0.level))
end

slot0.canEquipToEliteChapter = function (slot0, slot1, slot2, slot3)
	if getProxy(ChapterProxy).getChapterById(slot4, slot0):getEliteFleetCommanders()[slot1] or {}[slot2] ~= slot3 then
		slot8 = getProxy(CommanderProxy).getCommanderById(slot7, slot3)
		slot10 = pairs
		slot11 = slot4:getFleetCommander(slot0, slot1) or {}

		for slot13, slot14 in slot10(slot11) do
			if slot7:getCommanderById(slot14).groupId == slot8.groupId and slot13 ~= slot2 then
				return false, i18n("commander_can_not_select_same_group")
			end
		end
	end

	for slot11, slot12 in pairs(slot7) do
		for slot16, slot17 in pairs(slot12) do
			if slot3 == slot17 then
				return false, i18n("commander_is_in_fleet_already")
			end
		end
	end

	return true
end

return slot0
