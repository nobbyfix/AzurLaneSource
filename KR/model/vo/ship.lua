slot0 = class("Ship", import(".BaseVO"))
slot0.ENERGY_MID = 40
slot0.ENERGY_LOW = 0
slot0.RECOVER_ENERGY_POINT = 2
slot0.INTIMACY_PROPOSE = 6
slot0.SKIN_TYPE_DEFAULT = -1
slot0.SKIN_TYPE_COMMON_FASHION = 0
slot0.SKIN_TYPE_PROPOSE = 1
slot0.SKIN_TYPE_REMAKE = 2
slot0.BACKYARD_1F_ENERGY_ADDITION = 2
slot0.BACKYARD_2F_ENERGY_ADDITION = 3
slot0.PREFERENCE_TAG_NONE = 0
slot0.PREFERENCE_TAG_COMMON = 1
slot1 = {
	vanguard = i18n("word_vanguard_fleet"),
	main = i18n("word_main_fleet")
}
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
slot0.LOCK_STATE_UNLOCK = 0
slot0.LOCK_STATE_LOCK = 1
slot0.WEAPON_COUNT = 3
slot0.PREFAB_EQUIP = 4
slot0.MAX_SKILL_LEVEL = 10
slot0.ENERGY_RECOVER_TIME = 360
slot0.TEST_SHIP_TYPE_1 = 1
slot0.TEST_SHIP_TYPE_2 = 2
slot0.STATE_NORMAL = 1
slot0.STATE_REST = 2
slot0.STATE_CLASS = 3
slot0.STATE_COLLECT = 4
slot0.STATE_TRAIN = 5
slot2 = 4
slot3 = pg.ship_data_strengthen
slot4 = pg.ship_level
slot5 = pg.equip_skin_template

function nation2print(slot0)
	return Nation.Nation2Print(slot0)
end

slot0.getRecoverEnergyPoint = function (slot0)
	return (slot0.propose and 3) or 2
end

function shipType2name(slot0)
	return ShipType.Type2Name(slot0)
end

function shipType2print(slot0)
	return ShipType.Type2Print(slot0)
end

function shipType2Battleprint(slot0)
	return ShipType.Type2BattlePrint(slot0)
end

function shipRarity2bgPrint(slot0, slot1, slot2)
	if slot1 and pg.ship_skin_template[slot1].rarity_bg and slot4 ~= "" then
		return slot4
	end

	return ((slot2 and "0") or "") .. ShipRarity.Rarity2Print(slot0)
end

function shipRarity2FrameColor(slot0)
	return ShipRarity.Rarity2FrameColor(slot0)
end

slot0.rarity2bgPrint = function (slot0)
	return ((slot0:isBluePrintShip() and "0") or "") .. ShipRarity.Rarity2Print(slot0:getRarity())
end

slot0.rarity2bgPrintForGet = function (slot0)
	if pg.ship_skin_template[slot0.skinId].rarity_bg and slot2 ~= "" then
		return slot2
	end

	return ((slot0:isBluePrintShip() and "0") or "") .. ShipRarity.Rarity2Print(slot0:getRarity())
end

slot0.getShipBgPrint = function (slot0)
	return (pg.ship_skin_template[slot0.skinId].bg and #slot1.bg > 0 and slot1.bg) or slot0:rarity2bgPrintForGet()
end

slot0.getStar = function (slot0)
	return slot0:getConfig("star")
end

slot0.getMaxStar = function (slot0)
	return pg.ship_data_template[slot0.configId].star_max
end

slot0.getShipArmor = function (slot0)
	return slot0:getConfig("armor_type")
end

slot0.getShipArmorName = function (slot0)
	return ArmorType.Type2Name(slot0:getShipArmor())
end

slot0.getGroupId = function (slot0)
	return pg.ship_data_template[slot0.configId].group_type
end

slot0.getGroupIdByConfigId = function (slot0)
	return math.floor(slot0 / 10)
end

slot0.getShipWords = function (slot0)
	if not pg.ship_skin_words[slot0] then
		warning("找不到ship_skin_words: " .. slot0)

		return
	end

	for slot6, slot7 in pairs(slot2) do
		if type(slot7) == "string" then
			slot2[slot6] = HXSet.hxLan(slot7)
		end
	end

	return slot2, pg.ship_skin_words_extra[slot0]
end

slot0.getMainwordsCount = function (slot0)
	if not slot0:getShipWords().main or slot1.main == "" then
		slot1 = slot0.getShipWords(slot0:getOriginalSkinId())
	end

	return #string.split(slot1.main, "|")
end

slot0.getWordsEx = function (slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	slot6 = false

	if type(slot5) == "string" then
		return
	end

	slot3 = slot3 or 0

	for slot10, slot11 in ipairs(slot5) do
		if slot11[1] <= slot3 then
			if slot1 == "main" then
				return string.split(slot11[2], "|")[slot2], slot11[1], slot6
			else
				return slot11[2], slot11[1], slot6
			end
		end
	end
end

slot0.getWords = function (slot0, slot1, slot2, slot3, slot4)
	slot5, slot6 = slot0:getShipWords()
	slot8 = math.fmod(slot0, slot0:getOriginalSkinId())

	if not slot5 then
		slot5, slot6 = slot0.getShipWords(slot7)

		if not slot9 then
			return nil
		end
	end

	slot9 = 0
	slot10 = false

	if not slot5[slot1] or slot11 == "" then
		slot10 = true

		if slot5.id == slot7 then
			return nil
		else
			if not slot0.getShipWords(slot7) then
				return nil
			end

			if not slot5[slot1] or slot11 == "" then
				return nil
			end
		end
	end

	slot13 = slot2 or math.random(#string.split(slot11, "|"))

	if slot1 == "main" and slot12[slot13] == "nil" then
		if not slot0.getShipWords(slot7) then
			return nil
		end

		if not slot5[slot1] or slot11 == "" then
			return nil
		end

		slot12 = string.split(slot11, "|")
	end

	rstEx, cvEx, defaultCoverEx = slot0.getWordsEx(slot6, slot1, slot13, slot4, slot7)
	slot14 = nil
	slot16 = (PlayerPrefs.GetInt("CV_LANGUAGE_" .. pg.ship_skin_template[slot0].ship_group) == 2 and slot5.voice_key_2) or slot5.voice_key

	if slot16 == 0 then
		if not slot10 or (rstEx and not defaultCoverEx) then
			slot14 = slot0.getCVPath(slot7, slot1, slot13, slot8)
		end
	else
		slot14 = slot0.getCVPath(slot7, slot1, slot13)
	end

	slot17 = slot12[slot13]

	if slot3 == nil or slot3 == true then
		slot17 = slot17:gsub("%s", " ")
	end

	if rstEx then
		return rstEx or slot17, slot14 and slot14 .. "_ex" .. cvEx, cvEx
	end
end

slot0.getCVKeyID = function (slot0)
	if not Ship.getShipWords(slot0) then
		return -1
	end

	slot2 = nil

	if ((PlayerPrefs.GetInt("CV_LANGUAGE_" .. pg.ship_skin_template[slot0].ship_group) == 2 and slot1.voice_key_2 >= 0 and slot1.voice_key_2) or slot1.voice_key) == 0 then
		slot5 = slot0.getShipWords(slot0:getOriginalSkinId())

		return (slot3 == 2 and slot5.voice_key_2 >= 0 and slot5.voice_key_2) or slot5.voice_key
	end
end

slot0.getCVPath = function (slot0, slot1, slot2, slot3)
	slot2 = slot2 or 1
	slot5 = slot0:getOriginalSkinId()

	if not Ship.getShipWords(slot0) and not slot0.getShipWords(slot5) then
		return
	end

	slot6 = PlayerPrefs.GetInt("CV_LANGUAGE_" .. slot0 / 10)
	slot7 = slot4[slot1]

	if slot1 == "main" then
		slot7 = string.split(slot7, "|")[slot2]
		slot1 = slot1 .. slot2
	end

	if slot1 == "skill" or string.find(slot1, "link") then
		if slot4.voice_key == 0 then
			slot4 = slot0.getShipWords(slot5)
		end
	elseif not slot7 or slot7 == "" or slot7 == "nil" then
		slot4 = slot0.getShipWords(slot5)
	end

	slot8 = nil
	slot9 = (slot6 == 2 and slot4.voice_key_2) or slot4.voice_key

	if slot9 ~= -1 and pg.character_voice[slot1] and pg.character_voice[slot1].resource_key then
		slot8 = "event:/cv/" .. slot9 .. "/" .. slot8

		if slot3 then
			slot8 = slot8 .. "_" .. slot3
		end
	end

	return slot8
end

slot0.getCVCalibrate = function (slot0, slot1, slot2)
	if not pg.ship_skin_template[slot0] then
		return 0
	end

	if slot1 == "main" then
		slot1 = slot1 .. "_" .. slot2
	end

	return slot3.l2d_voice_calibrate[slot1]
end

slot0.getL2dSoundEffect = function (slot0, slot1, slot2)
	if not pg.ship_skin_template[slot0] then
		return 0
	end

	if slot1 == "main" then
		slot1 = slot1 .. "_" .. slot2
	end

	return slot3.l2d_se[slot1]
end

slot0.getOriginalSkinId = function (slot0)
	return ShipGroup.getDefaultSkin(pg.ship_skin_template[slot0].ship_group).id
end

slot0.getTransformShipId = function (slot0)
	if pg.ship_data_trans[pg.ship_data_template[slot0].group_type] then
		for slot6, slot7 in ipairs(slot2.transform_list) do
			for slot11, slot12 in ipairs(slot7) do
				for slot17, slot18 in ipairs(pg.transform_data_template[slot12[2]].ship_id) do
					if slot18[1] == slot0 then
						return slot18[2]
					end
				end
			end
		end
	end
end

slot0.getAircraftCount = function (slot0)
	slot1 = slot0:getConfigTable().base_list
	slot2 = slot0:getConfigTable().default_equip_list
	slot3 = {
		[EquipType.FighterAircraft] = 0,
		[EquipType.TorpedoAircraft] = 0,
		[EquipType.BomberAircraft] = 0,
		[EquipType.SeaPlane] = 0
	}

	for slot7 = 1, 3, 1 do
		if table.contains(EquipType.AirDomainEquip, pg.equip_data_statistics[(slot0:getEquip(slot7) and slot0:getEquip(slot7).configId) or slot2[slot7]].type) then
			slot3[slot9] = slot3[slot9] + slot1[slot7]
		end
	end

	return slot3
end

slot0.getShipType = function (slot0)
	return slot0:getConfig("type")
end

slot0.getEnergy = function (slot0)
	return slot0.energy
end

slot0.getEnergeConfig = function (slot0)
	slot2 = slot0:getEnergy()

	for slot6, slot7 in pairs(slot1) do
		if type(slot6) == "number" and slot7.lower_bound <= slot2 and slot2 <= slot7.upper_bound then
			return slot7
		end
	end
end

slot0.getEnergyPrint = function (slot0)
	return slot0:getEnergeConfig().icon, slot0.getEnergeConfig().desc
end

slot0.getIntimacy = function (slot0)
	return slot0.intimacy
end

slot0.getIntimacyDetail = function (slot0)
	return pg.intimacy_template[slot0:getIntimacyLevel()].icon, slot0:getIntimacyMax(), math.floor(slot0:getIntimacy() / 100)
end

slot0.getIntimacyMax = function (slot0)
	if slot0.propose then
		return 200
	end

	return 100
end

slot0.getInitmacyInfo = function (slot0)
	return pg.intimacy_template[slot0:getIntimacyLevel()].icon, pg.intimacy_template[slot0.getIntimacyLevel()].desc
end

slot0.getIntimacyLevel = function (slot0)
	slot1 = 0

	for slot6, slot7 in pairs(slot2) do
		if type(slot6) == "number" and slot7.lower_bound <= slot0:getIntimacy() and slot0:getIntimacy() <= slot7.upper_bound then
			slot1 = slot6

			break
		end
	end

	if slot1 < slot0.INTIMACY_PROPOSE and slot0.propose then
		slot1 = slot0.INTIMACY_PROPOSE
	end

	return slot1
end

slot0.getBluePrint = function (slot0)
	slot1 = ShipBluePrint.New({
		id = slot0.groupId
	})

	slot1:updateInfo({
		blue_print_level = slot0.strengthList[1] or {
			exp = 0,
			level = 0
		}.level,
		exp = slot0.strengthList[1] or .exp
	})

	return slot1
end

slot0.getBaseList = function (slot0)
	if slot0:isBluePrintShip() then
		return slot0:getBluePrint():getBaseList(slot0)
	else
		return slot0:getConfig("base_list")
	end
end

slot0.getPreLoadCount = function (slot0)
	if slot0:isBluePrintShip() then
		return slot0:getBluePrint():getPreLoadCount(slot0)
	else
		return slot0:getConfig("preload_count")
	end
end

slot0.getNation = function (slot0)
	return slot0:getConfig("nationality")
end

slot0.getPaintingName = function (slot0)
	slot2 = pg.ship_skin_template[pg.ship_data_statistics[slot0].skin_id]

	if not HXSet.isHx() then
		return slot2.painting
	else
		return (slot2.painting_hx ~= "" and slot2.painting_hx) or slot2.painting
	end
end

slot0.getName = function (slot0)
	if slot0.propose and pg.PushNotificationMgr.GetInstance():isEnableShipName() then
		return slot0.name
	end

	if slot0:isRemoulded() then
		return HXSet.hxLan(pg.ship_skin_template[slot0:getRemouldSkinId()].name)
	end

	return pg.ship_data_statistics[slot0.configId].name
end

slot0.getShipName = function (slot0)
	print(slot0)

	return pg.ship_data_statistics[slot0].name
end

slot0.getBreakOutLevel = function (slot0)
	return pg.ship_data_statistics[slot0].star
end

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.template_id or slot1.configId
	slot0.level = slot1.level
	slot0.exp = slot1.exp
	slot0.energy = slot1.energy
	slot0.lockState = slot1.is_locked
	slot0.intimacy = slot1.intimacy
	slot0.propose = slot1.propose and slot1.propose > 0
	slot0.proposeTime = slot1.propose

	if slot0.intimacy and slot0.intimacy > 10000 and not slot0.propose then
		slot0.intimacy = 10000
	end

	slot0.renameTime = slot1.change_name_timestamp

	if slot1.name and slot1.name ~= "" then
		slot0.name = slot1.name
	else
		slot0.name = pg.ship_data_statistics[slot0.configId].name
	end

	slot0.bluePrintFlag = slot1.blue_print_flag or 0
	slot0.strengthList = {}
	slot2 = ipairs
	slot3 = slot1.strength_list or {}

	for slot5, slot6 in slot2(slot3) do
		if not slot0:isBluePrintShip() then
			slot0.strengthList[ShipModAttr.ID_TO_ATTR[slot6.id]] = slot6.exp
		else
			table.insert(slot0.strengthList, {
				level = slot6.id,
				exp = slot6.exp
			})
		end
	end

	slot0.state = slot1.state or {}.state
	slot0.state_info_1 = slot1.state or .state_info_1
	slot0.state_info_2 = slot1.state or .state_info_2
	slot0.state_info_3 = slot1.state or .state_info_3
	slot0.state_info_4 = slot1.state or .state_info_4
	slot0.equipments = {}

	if slot1.equip_info_list then
		slot3 = ipairs
		slot4 = slot1.equip_info_list or {}

		for slot6, slot7 in slot3(slot4) do

			-- Decompilation error in this vicinity:
			slot8 = slot0.equipments
			slot8[slot6] = Equipment.New({
				count = 1,
				id = (slot7.uid > 0 and slot7.uid) or slot7.id,
				config_id = slot7.id,
				skinId = slot7.skinId,
				affix_list = _.map(slot7.affix_list, function (slot0)
					return {
						id = slot0.id,
						value = slot0.random_num
					}
				end)
			}) or false
		end
	end

	slot0.skills = {}
	slot3 = ipairs
	slot4 = slot1.skill_id_list or {}

	for slot6, slot7 in slot3(slot4) do
		slot0:updateSkill(slot7)
	end

	slot0.star = slot0:getConfig("rarity")
	slot0.transforms = {}
	slot3 = ipairs
	slot4 = slot1.transform_list or {}

	for slot6, slot7 in slot3(slot4) do
		slot0.transforms[slot7.id] = {
			id = slot7.id,
			level = slot7.level
		}
	end

	slot0.groupId = pg.ship_data_template[slot0.configId].group_type
	slot0.createTime = slot1.create_time or 0
	slot0.virgin = getProxy(CollectionProxy) and slot1.create_time or 0.shipGroups[slot0.groupId] == nil
	slot5 = pg.gameset.test_ship_config_2.key_value

	if slot0.configId == pg.gameset.test_ship_config_1.key_value then
		slot0.testShip = slot0.TEST_SHIP_TYPE_1
	elseif slot0.configId == slot5 then
		slot0.testShip = slot0.TEST_SHIP_TYPE_2
	end

	slot0.maxIntimacy = pg.intimacy_template[#pg.intimacy_template.all].upper_bound
	slot0.skinId = slot1.skin_id or 0

	if slot0.skinId == 0 then
		slot0.skinId = slot0:getConfig("skin_id")
	end

	if slot1.name and slot1.name ~= "" then
		slot0.name = slot1.name
	elseif slot0:isRemoulded() then
		slot0.name = HXSet.hxLan(pg.ship_skin_template[slot0:getRemouldSkinId()].name)
	else
		slot0.name = pg.ship_data_statistics[slot0.configId].name
	end

	slot0.maxLevel = slot1.max_level
	slot0.proficiency = slot1.proficiency or 0
	slot0.preferenceTag = slot1.common_flag
	slot0.hpRant = 10000
	slot0.strategies = {}
	slot0.triggers = {}
	slot0.commanderId = slot1.commanderid or 0
	slot0.activityNpc = slot1.activity_npc or 0
end

slot0.unlockActivityNpc = function (slot0, slot1)
	slot0.activityNpc = slot1
end

slot0.isActivityNpc = function (slot0)
	return slot0.activityNpc > 0
end

slot0.getActiveEquipments = function (slot0)
	for slot5 = #Clone(slot0.equipments), 1, -1 do
		if slot1[slot5] then
			for slot10 = 1, slot5 - 1, 1 do
				if slot1[slot10] and pos ~= slot5 and slot6.config.equip_limit ~= 0 and slot11.config.equip_limit == slot6.config.equip_limit then
					slot1[slot5] = false
				end
			end
		end
	end

	return slot1
end

slot0.getAllEquipments = function (slot0)
	return slot0.equipments
end

slot0.isBluePrintShip = function (slot0)
	return slot0.bluePrintFlag == 1
end

slot0.updateEquipmentSkin = function (slot0, slot1, slot2)
	slot0.equipments[slot1].skinId = slot2
end

slot0.updateSkinId = function (slot0, slot1)
	slot0.skinId = slot1
end

slot0.updateName = function (slot0)
	if slot0.name ~= pg.ship_data_statistics[slot0.configId].name then
		return
	end

	if slot0:isRemoulded() then
		slot0.name = HXSet.hxLan(pg.ship_skin_template[slot0:getRemouldSkinId()].name)
	else
		slot0.name = pg.ship_data_statistics[slot0.configId].name
	end
end

slot0.isRemoulded = function (slot0)
	if slot0.remoulded then
		return true
	end

	if pg.ship_data_trans[slot0.groupId] then
		for slot5, slot6 in ipairs(slot1.transform_list) do
			for slot10, slot11 in ipairs(slot6) do
				if pg.transform_data_template[slot11[2]].skin_id ~= 0 and slot0.transforms[slot11[2]] and slot0.transforms[slot11[2]].level == slot12.max_level then
					return true
				end
			end
		end
	end

	return false
end

slot0.getRemouldSkinId = function (slot0)
	if ShipGroup.getModSkin(slot0.groupId) then
		return slot1.id
	end

	return nil
end

slot0.hasEquipmentSkinInPos = function (slot0, slot1)
	return slot0.equipments[slot1] and slot2:hasSkin()
end

slot0.getPrefab = function (slot0)
	slot1 = slot0.skinId

	if slot0:hasEquipmentSkinInPos(slot0) then
		slot1 = slot1[slot0:getEquip(slot0).skinId].ship_skin_id
	end

	return pg.ship_skin_template[slot1].prefab
end

slot0.getAttachmentPrefab = function (slot0)
	slot1 = {}

	if slot0:hasEquipmentSkinInPos(slot0) and slot1[slot0:getEquip(slot0).skinId].attachment_key ~= 0 and not slot1[slot4] then
		slot1[slot4] = slot3
	end

	return slot1
end

slot0.getPainting = function (slot0)
	slot1 = pg.ship_skin_template[slot0.skinId]

	if not HXSet.isHx() then
		return slot1.painting
	else
		return (slot1.painting_hx ~= "" and slot1.painting_hx) or slot1.painting
	end
end

slot0.GetSkinConfig = function (slot0)
	return pg.ship_skin_template[slot0.skinId]
end

slot0.getRemouldPainting = function (slot0)
	slot1 = pg.ship_skin_template[slot0:getRemouldSkinId()]

	if not HXSet.isHx() then
		return slot1.painting
	else
		return (slot1.painting_hx ~= "" and slot1.painting_hx) or slot1.painting
	end
end

slot0.updateStateInfo34 = function (slot0, slot1, slot2)
	slot0.state_info_3 = slot1
	slot0.state_info_4 = slot2
end

slot0.hasStateInfo3Or4 = function (slot0)
	return slot0.state_info_3 ~= 0 or slot0.state_info_4 ~= 0
end

slot0.isTestShip = function (slot0)
	return slot0.testShip
end

slot0.canUseTestShip = function (slot0, slot1)
	if slot0.lockState == slot0.LOCK_STATE_LOCK then
		return false
	end

	if slot0.testShip == slot0.TEST_SHIP_TYPE_1 then
		return table.contains({
			2,
			3,
			4
		}, slot1)
	elseif slot0.testShip == slot0.TEST_SHIP_TYPE_2 then
		return slot1 == 5
	end

	return false
end

slot0.updateEquip = function (slot0, slot1, slot2)
	slot0.equipments[slot1] = (slot2 and Clone(slot2)) or false
end

slot0.getEquip = function (slot0, slot1)
	return Clone(slot0.equipments[slot1])
end

slot0.updateState = function (slot0, slot1)
	slot0.state = slot1
end

slot0.addSkillExp = function (slot0, slot1, slot2)
	if ((slot0.skills[slot1] or {
		exp = 0,
		level = 1,
		id = slot1
	}.level and slot0.skills[slot1] or .level) or 1) == pg.skill_need_exp.all[#pg.skill_need_exp.all] then
		return
	end

	slot6 = (slot3.exp and slot2 + slot3.exp) or 0 + slot2

	while pg.skill_need_exp[slot4].exp <= slot6 do
		slot6 = slot6 - pg.skill_need_exp[slot4].exp

		if slot4 + 1 == slot5 then
			slot6 = 0

			break
		end
	end

	slot0:updateSkill({
		id = slot3.id,
		level = slot4,
		exp = slot6
	})
end

slot0.canAddAttr = function (slot0, slot1)
	return slot0:getAttrValue(slot1) < slot0:getMaxAddAttr(slot1), slot2 / slot3
end

slot0.getMaxAddAttr = function (slot0, slot1)
	return pg.ship_data_lesson[slot0.configId][pg.attribute_info_by_type[slot1].name]
end

slot0.bindConfigTable = function (slot0)
	return pg.ship_data_statistics
end

slot0.isAvaiable = function (slot0)
	return true
end

slot0.getFleetId = function (slot0)
	return getProxy(FleetProxy):getFleetByShip(slot0) and slot2.id
end

slot0.PROPERTIES = {
	AttributeType.Durability,
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.AntiAircraft,
	AttributeType.Air,
	AttributeType.Reload,
	AttributeType.Armor,
	AttributeType.Hit,
	AttributeType.Dodge,
	AttributeType.Speed,
	AttributeType.Luck,
	AttributeType.AntiSub
}
slot0.PROPERTIES_ENHANCEMENT = {
	AttributeType.Durability,
	AttributeType.Cannon,
	AttributeType.Torpedo,
	AttributeType.AntiAircraft,
	AttributeType.Air,
	AttributeType.Reload,
	AttributeType.Hit,
	AttributeType.Dodge,
	AttributeType.Speed,
	AttributeType.Luck,
	AttributeType.AntiSub
}
slot0.DIVE_PROPERTIES = {
	AttributeType.OxyMax,
	AttributeType.OxyCost,
	AttributeType.OxyRecovery,
	AttributeType.OxyRecoveryBench,
	AttributeType.OxyAttackDuration,
	AttributeType.OxyRaidDistance
}
slot0.SONAR_PROPERTIES = {
	AttributeType.SonarRange,
	AttributeType.SonarInterval,
	AttributeType.SonarDuration
}

slot0.intimacyAdditions = function (slot0, slot1)
	slot2 = pg.intimacy_template[slot0:getIntimacyLevel()].attr_bonus * 0.0001

	for slot6, slot7 in pairs(slot1) do
		if slot6 == AttributeType.Durability or slot6 == AttributeType.Cannon or slot6 == AttributeType.Torpedo or slot6 == AttributeType.AntiAircraft or slot6 == AttributeType.AntiSub or slot6 == AttributeType.Air or slot6 == AttributeType.Reload or slot6 == AttributeType.Hit or slot6 == AttributeType.Dodge then
			slot1[slot6] = slot1[slot6] * (slot2 + 1)
		end
	end
end

slot0.getShipProperties = function (slot0)
	slot1 = slot0:getBaseProperties()

	if slot0:isBluePrintShip() then
		for slot7, slot8 in pairs(slot3) do
			slot1[slot7] = slot1[slot7] + slot8
		end

		slot0:intimacyAdditions(slot1)
	else
		slot3 = slot0[pg.ship_data_template[slot0.configId].strengthen_id]

		for slot7, slot8 in pairs(slot0.strengthList) do
			slot1[slot7] = slot1[slot7] + calcFloor(math.min(slot8, slot3.durability[ShipModAttr.ATTR_TO_INDEX[slot7]] * slot3.level_exp[ShipModAttr.ATTR_TO_INDEX[slot7]]) / math.max(slot0:getModExpRatio(slot7), 1))
		end

		slot0:intimacyAdditions(slot1)

		for slot7, slot8 in pairs(slot0.transforms) do
			slot9 = pg.transform_data_template[slot8.id].effect

			for slot13 = 1, slot8.level, 1 do
				slot14 = slot9[slot13] or {}

				for slot18, slot19 in pairs(slot1) do
					if slot14[slot18] then
						slot1[slot18] = slot1[slot18] + slot14[slot18]
					end
				end
			end
		end
	end

	return slot1
end

slot0.getTechNationAddition = function (slot0, slot1)
	return getProxy(TechnologyNationProxy):getShipAddition(slot0:getConfig("type"), slot1)
end

slot0.getEquipProficiencyByPos = function (slot0, slot1)
	return slot0:getEquipProficiencyList()[slot1]
end

slot0.getEquipProficiencyList = function (slot0)
	slot2 = Clone(slot0:getConfigTable().equipment_proficiency)

	if slot0:isBluePrintShip() then
		slot2 = slot0:getBluePrint():getEquipProficiencyList(slot0)
	else
		for slot6, slot7 in ipairs(slot2) do
			slot8 = 0

			for slot12, slot13 in pairs(slot0.transforms) do
				slot14 = pg.transform_data_template[slot13.id].effect

				for slot18 = 1, slot13.level, 1 do
					if slot14[slot18] or {}["equipment_proficiency_" .. slot6] then
						slot8 = slot8 + slot19["equipment_proficiency_" .. slot6]
					end
				end
			end

			slot2[slot6] = slot7 + slot8
		end
	end

	return slot2
end

slot0.getBaseProperties = function (slot0)
	slot1 = slot0:getConfigTable()
	slot2 = {}
	slot3 = {}

	for slot7, slot8 in ipairs(slot0.PROPERTIES) do
		slot2[slot8] = slot0:getGrowthForAttr(slot8)
		slot3[slot8] = slot2[slot8]
	end

	for slot7, slot8 in ipairs(slot0:getConfig("lock")) do
		slot3[slot8] = slot2[slot8]
	end

	for slot7, slot8 in ipairs(slot0.DIVE_PROPERTIES) do
		slot3[slot8] = slot1[slot8]
	end

	for slot7, slot8 in ipairs(slot0.SONAR_PROPERTIES) do
		slot3[slot8] = 0
	end

	return slot3
end

slot0.getGrowthForAttr = function (slot0, slot1)
	slot2 = slot0:getConfigTable()
	slot3 = nil
	slot4 = table.indexof(slot0.PROPERTIES, slot1)

	return (pg.gameset.extra_attr_level_limit.key_value < slot0.level and slot2.attrs[slot4] + ((slot0.level - 1) * slot2.attrs_growth[slot4]) / 1000 + ((slot0.level - 100) * slot2.attrs_growth_extra[slot4]) / 1000) or slot2.attrs[slot4] + (slot2.attrs_growth[slot4] * (slot0.level - 1)) / 1000
end

slot0.isMaxStar = function (slot0)
	return slot0:getMaxStar() <= slot0:getStar()
end

slot0.getModProperties = function (slot0, slot1)
	return slot0.strengthList[slot1] or 0
end

slot0.addModAttrExp = function (slot0, slot1, slot2)
	if slot0:getModAttrTopLimit(slot1) == 0 then
		return
	end

	if slot3 < (slot0:getModProperties(slot1) + slot2) / slot0:getModExpRatio(slot1) then
		slot0.strengthList[slot1] = slot3 * slot4
	else
		slot0.strengthList[slot1] = slot5 + slot2
	end
end

slot0.attrVertify = function (slot0)
	if not BayProxy.checkShiplevelVertify(slot0) then
		return false
	end

	for slot4, slot5 in ipairs(slot0.equipments) do
		if slot5 and not slot5:vertify() then
			return false
		end
	end

	return true
end

slot0.getEquipmentProperties = function (slot0)
	slot1 = {}
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.PROPERTIES) do
		slot1[slot7] = 0
	end

	for slot6, slot7 in ipairs(slot0.DIVE_PROPERTIES) do
		slot1[slot7] = 0
	end

	for slot6, slot7 in ipairs(slot0.SONAR_PROPERTIES) do
		slot1[slot7] = 0
	end

	for slot6, slot7 in ipairs(slot0.PROPERTIES_ENHANCEMENT) do
		slot2[slot7] = 0
	end

	slot1[AttributeType.AirDominate] = 0

	for slot7, slot8 in ipairs(slot3) do
		if slot8 then
			for slot13, slot14 in ipairs(slot9) do
				if slot14 and slot1[slot14.type] then
					slot1[slot14.type] = slot1[slot14.type] + slot14.value
				end
			end

			for slot14, slot15 in ipairs(slot10) do
				if slot15 and slot1[slot15.type] then
					slot1[slot15.type] = slot1[slot15.type] + slot15.value
				end
			end

			for slot15, slot16 in pairs(slot11) do
				slot2[slot15] = math.max(slot2[slot15], slot16)
			end

			if slot8:GetSonarProperty() then
				for slot16, slot17 in pairs(slot12) do
					slot1[slot16] = slot1[slot16] + slot17
				end
			end
		end
	end

	for slot7, slot8 in pairs(slot2) do
		slot2[slot7] = slot8 + 1
	end

	return slot1, slot2
end

slot0.getSkillEffects = function (slot0)
	_.each(slot0:getEquipmentSkillEffects(), function (slot0)
		table.insert(slot0, slot0)
	end)

	return slot0:getShipSkillEffects()
end

slot0.getShipSkillEffects = function (slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot2) do
		if require("GameCfg.buff.buff_" .. slot7) and slot8.const_effect_list then
			for slot12 = 1, #slot8.const_effect_list, 1 do
				slot14 = slot8.const_effect_list[slot12].trigger
				slot15 = slot8.const_effect_list[slot12].arg_list
				slot16 = 1

				if slot0.skills[slot7] and slot8[slot0.skills[slot7].level].const_effect_list and slot17[slot12] then
					slot14 = slot17[slot12].trigger or slot14
					slot15 = slot17[slot12].arg_list or slot15
					slot17 = true
				end

				for slot21, slot22 in pairs(slot14) do
					if slot0.triggers[slot21] ~= slot22 then
						slot17 = false

						break
					end
				end

				if slot17 then
					table.insert(slot1, {
						type = slot13.type,
						arg_list = slot15,
						level = slot16
					})
				end
			end
		end
	end

	return slot1
end

slot0.getEquipmentSkillEffects = function (slot0)
	slot1 = {}

	for slot6, slot7 in ipairs(slot2) do
		slot8 = nil
		slot9 = slot7 and slot7.config.skill_id[1]

		if slot9 then
			slot8 = require("GameCfg.buff.buff_" .. slot9)
		end

		if slot8 and slot8.const_effect_list then
			for slot13 = 1, #slot8.const_effect_list, 1 do
				slot15 = true

				for slot19, slot20 in pairs(slot8.const_effect_list[slot13].trigger) do
					if slot0.triggers[slot19] ~= slot20 then
						slot15 = false

						break
					end
				end

				if slot15 then
					table.insert(slot1, {
						level = 1,
						type = slot14.type,
						arg_list = slot14.arg_list
					})
				end
			end
		end
	end

	return slot1
end

slot0.getEquipmentGearScore = function (slot0)
	slot1 = 0

	for slot6, slot7 in ipairs(slot2) do
		if slot7 then
			slot1 = slot1 + slot7:GetGearScore()
		end
	end

	return slot1
end

slot0.getWeaponCD = function (slot0, slot1)
	slot2 = 0

	return slot0:calcWeaponCD(slot0:getActiveEquipments()[slot1])
end

slot0.calcWeaponCD = function (slot0, slot1)
	slot2 = 0

	if slot1 then
		return string.format("%0.2f", ys.Battle.BattleFormulas.CalculateReloadTime(slot1.config[AttributeType.Reload] or 0, slot0:getProperties().reload))
	end
end

slot0.getProperties = function (slot0, slot1, slot2)
	slot3 = slot1 or {}
	slot4 = slot0:getConfig("nationality")
	slot5 = slot0:getConfig("type")
	slot6 = slot0:getShipProperties()
	slot7, slot8 = slot0:getEquipmentProperties()

	for slot12, slot13 in ipairs(slot0.PROPERTIES) do
		slot14 = 0
		slot15 = 0

		for slot19, slot20 in pairs(slot3) do
			slot14 = slot14 + slot20:getAttrRatioAddition(slot13, slot4, slot5) / 100
			slot15 = slot15 + slot20:getAttrValueAddition(slot13, slot4, slot5)
		end

		if LOCK_EQUIP_DEVELOPMENT then
			slot6[slot13] = slot6[slot13] + slot7[slot13]
		else
			slot16 = slot8[slot13] or 1
			slot16 = slot14 + slot16

			if slot13 == AttributeType.Speed then
				slot6[slot13] = slot6[slot13] * slot16 + slot15 + slot7[slot13]
			else
				slot6[slot13] = math.floor(math.floor(slot6[slot13]) * slot16) + slot15 + slot7[slot13]
			end
		end
	end

	if not slot2 and slot0:isMaxStar() then
		for slot12, slot13 in pairs(slot6) do
			slot6[slot12] = slot6[slot12] + slot0:getTechNationAddition(slot12)
		end
	end

	for slot12, slot13 in ipairs(slot0.DIVE_PROPERTIES) do
		slot6[slot13] = slot6[slot13] + slot7[slot13]
	end

	for slot12, slot13 in ipairs(slot0.SONAR_PROPERTIES) do
		slot6[slot13] = slot6[slot13] + slot7[slot13]
	end

	return slot6
end

slot0.getTransGearScore = function (slot0)
	slot1 = 0
	slot2 = pg.transform_data_template

	for slot6, slot7 in pairs(slot0.transforms) do
		for slot11 = 1, slot7.level, 1 do
			slot1 = slot1 + slot2[slot7.id].gear_score[slot11] or 0
		end
	end

	return slot1
end

slot0.getShipCombatPower = function (slot0, slot1)
	slot2 = slot0:getProperties(slot1)

	return slot2[AttributeType.Durability] / 5 + slot2[AttributeType.Cannon] + slot2[AttributeType.Torpedo] + slot2[AttributeType.AntiAircraft] + slot2[AttributeType.Air] + slot2[AttributeType.AntiSub] + slot2[AttributeType.Reload] + slot2[AttributeType.Hit] * 2 + slot2[AttributeType.Dodge] * 2 + slot2[AttributeType.Speed] + slot0:getEquipmentGearScore() + slot0:getTransGearScore()
end

slot0.cosumeEnergy = function (slot0, slot1)
	slot0:setEnergy(math.max(slot0:getEnergy() - slot1, 0))
end

slot0.addEnergy = function (slot0, slot1)
	slot0:setEnergy(slot0:getEnergy() + slot1)
end

slot0.setEnergy = function (slot0, slot1)
	slot0.energy = slot1
end

slot0.setLikability = function (slot0, slot1)
	slot0:setIntimacy(slot1)
end

slot0.addLikability = function (slot0, slot1)
	newValue = Mathf.Clamp(slot0:getIntimacy() + slot1, 0, slot0.maxIntimacy)

	slot0:setIntimacy(newValue)
end

slot0.setIntimacy = function (slot0, slot1)
	if slot1 > 10000 and not slot0.propose then
		slot1 = 10000
	end

	slot0.intimacy = slot1

	if not slot0:isActivityNpc() then
		getProxy(CollectionProxy).shipGroups[slot0.groupId]:updateMaxIntimacy(slot0:getIntimacy())
	end
end

slot0.getLevelExpConfig = function (slot0, slot1)
	if slot0:getConfig("rarity") == ShipRarity.SSR then
		slot2 = Clone(getConfigFromLevel1(slot0, slot1 or slot0.level))
		slot2.exp = slot2.exp_ur
		slot2.exp_start = slot2.exp_ur_start
		slot2.exp_interval = slot2.exp_ur_interval
		slot2.exp_end = slot2.exp_ur_end

		return slot2
	else
		return getConfigFromLevel1(slot0, slot1 or slot0.level)
	end
end

slot0.getExp = function (slot0)
	if slot0.level == slot0:getMaxLevel() and LOCK_FULL_EXP then
		return 0
	end

	return slot0.exp
end

slot0.getProficiency = function (slot0)
	return slot0.proficiency
end

slot0.addExp = function (slot0, slot1, slot2)
	slot3 = pg.gameset.level_get_proficency.key_value

	if slot2 and slot3 <= slot0.level and pg.ship_data_template[slot0.configId].can_get_proficency == 1 then
		slot5 = getProxy(NavalAcademyProxy)
		slot6 = slot5:getCourse()
		slot7 = slot5:GetClassVO()
		slot6.proficiency = slot6.proficiency + math.floor(slot1 * slot7:getConfig("proficency_get_percent") * slot6:getExtraRate() * 0.01)
		slot6.proficiency = math.min(slot6.proficiency, slot7:getConfig("store"))

		slot5:setCourse(slot6)
	end

	if slot0.level == slot0:getMaxLevel() then
		if LOCK_FULL_EXP then
			slot1 = 0
		end

		if not slot0:isBluePrintShip() then
			if not slot2 or not slot0:isMaxStar() then
				slot1 = 0
			end
		elseif not slot2 then
			slot1 = 0
		end
	end

	slot0.exp = slot0.exp + slot1

	while slot0:canLevelUp() do
		slot0.exp = slot0.exp - slot0:getLevelExpConfig().exp_interval
		slot0.level = math.min(slot0.level + 1, slot4)
	end

	if slot0:isBluePrintShip() then
		if slot0.level == slot4 then
			slot0.exp = math.min(slot0.exp, pg.gameset.exp_overflow_max.key_value)
		end
	elseif slot0.level == slot4 and not slot0:isMaxStar() then
		slot0.exp = 0
	elseif slot0:isMaxLevelAndMaxStar() then
		slot0.exp = math.min(slot0.exp, pg.gameset.exp_overflow_max.key_value)
	end
end

slot0.getMaxLevel = function (slot0)
	return slot0.maxLevel
end

slot0.canLevelUp = function (slot0)
	return slot0:getLevelExpConfig(slot0.level + 1) and slot0:getLevelExpConfig().exp_interval <= slot0.exp and not (slot0:getMaxLevel() <= slot0.level)
end

slot0.getConfigMaxLevel = function (slot0)
	return slot0.all[#slot0.all]
end

slot0.updateMaxLevel = function (slot0, slot1)
	slot0.maxLevel = math.min(slot0:getConfigMaxLevel(), slot1)
end

slot0.getNextMaxLevel = function (slot0)
	for slot6 = slot0:getMaxLevel() + 1, slot0:getConfigMaxLevel(), 1 do
		if slot0[slot6].level_limit == 1 then
			return slot6
		end
	end
end

slot0.isReachNextMaxLevel = function (slot0)
	return slot0:isMaxLevelAndMaxStar() and slot0:getNextMaxLevel() ~= nil
end

slot0.getNextMaxLevelConsume = function (slot0)
	return _.map(slot0[slot0:getMaxLevel()]["need_item_rarity" .. slot0:getConfig("rarity")], function (slot0)
		return {
			type = slot0[1],
			id = slot0[2],
			count = slot0[3]
		}
	end)
end

slot0.canUpgradeMaxLevel = function (slot0)
	if not slot0:isReachNextMaxLevel() then
		return false, i18n("upgrade_to_next_maxlevel_failed")
	else
		slot1 = getProxy(PlayerProxy):getData()
		slot2 = getProxy(BagProxy)

		for slot7, slot8 in pairs(slot3) do
			if slot8.type == DROP_TYPE_RESOURCE then
				if slot1:getResById(slot8.id) < slot8.count then
					return false, i18n("common_no_resource")
				end
			elseif slot8.type == DROP_TYPE_ITEM and slot2:getItemCountById(slot8.id) < slot8.count then
				return false, i18n("common_no_item_1")
			end
		end
	end

	return true
end

slot0.isMaxLevelAndMaxStar = function (slot0)
	slot1 = slot0:getMaxLevel()

	if slot0:isBluePrintShip() then
		return slot0.level == slot1
	else
		return slot0.level == slot1 and slot0:isMaxStar()
	end
end

slot0.getTotalExp = function (slot0)
	return slot0:getLevelExpConfig().exp_start + slot0.exp
end

slot0.getStartBattleExpend = function (slot0)
	if table.contains(TeamType.SubShipType, slot0:getShipType()) then
		return 0
	else
		return pg.ship_data_template[slot0.configId].oil_at_start
	end
end

slot0.getEndBattleExpend = function (slot0)
	return math.floor((pg.ship_data_template[slot0.configId].oil_at_end * slot0:getLevelExpConfig().fight_oil_ratio) / 10000)
end

slot0.getBattleTotalExpend = function (slot0)
	return slot0:getStartBattleExpend() + slot0:getEndBattleExpend()
end

slot0.getShipAmmo = function (slot0)
	slot1 = slot0:getConfig(AttributeType.Ammo)

	for slot5, slot6 in pairs(slot0:getAllSkills()) do
		for slot10, slot11 in pairs(pg.skill_benefit_template) do
			if slot11.skill_id == slot6.id and slot11.lv == slot6.level then
				if slot0:IsBenefitSkillActive(slot11) then
					slot1 = slot1 + slot11.effect[1]
				end

				break
			end
		end
	end

	for slot6, slot7 in ipairs(slot2) do
		if slot7 and slot7.config.equip_parameters.ammo then
			slot1 = slot1 + slot8
		end
	end

	return slot1
end

slot0.getHuntingLv = function (slot0)
	slot1 = slot0:getConfig("huntingrange_level")

	for slot5, slot6 in pairs(slot0:getAllSkills()) do
		for slot10, slot11 in pairs(pg.skill_benefit_template) do
			if slot11.skill_id == slot6.id and slot11.lv == slot6.level then
				if slot0:IsBenefitSkillActive(slot11) then
					slot1 = slot1 + slot11.effect[2]
				end

				break
			end
		end
	end

	for slot6, slot7 in ipairs(slot2) do
		if slot7 and slot7.config.equip_parameters.hunting_lv then
			slot1 = slot1 + slot8
		end
	end

	return math.min(slot1, slot0:getMaxHuntingLv())
end

slot0.BENEFIT_SKILL = 2
slot0.BENEFIT_EQUIP = 3

slot0.IsBenefitSkillActive = function (slot0, slot1)
	slot2 = false

	if slot1.type == slot0.BENEFIT_SKILL then
		if slot1.limit[1] == slot0.triggers.TeamNumbers then
			slot2 = true
		end
	elseif slot1.type == slot0.BENEFIT_EQUIP then
		slot3 = slot1.limit

		for slot8, slot9 in ipairs(slot4) do
			if slot9 and table.contains(slot3, slot9.config.id) then
				slot2 = true

				break
			end
		end
	end

	return slot2
end

slot0.getMaxHuntingLv = function (slot0)
	return #slot0:getConfig("hunting_range")
end

slot0.getHuntingRange = function (slot0, slot1)
	slot3 = Clone(slot0:getConfig("hunting_range")[1])
	slot4 = slot1 or slot0:getHuntingLv()

	for slot8 = 2, math.min(slot4, slot0:getMaxHuntingLv()), 1 do
		_.each(slot2[slot8], function (slot0)
			table.insert(slot0, {
				slot0[1],
				slot0[2]
			})
		end)
	end

	return slot3
end

slot0.getTriggerSkills = function (slot0)
	_.each(slot0:getSkillEffects(), function (slot0)
		if slot0.type == "AddBuff" and slot0.arg_list and slot0.arg_list.buff_id then
			slot0[slot0.arg_list.buff_id] = {
				id = slot0.arg_list.buff_id,
				level = slot0.level
			}
		end
	end)

	return {}
end

slot0.getAllSkills = function (slot0)
	slot1 = Clone(slot0.skills)

	for slot6, slot7 in ipairs(slot2) do
		slot8 = nil
		slot9 = slot7 and slot7.config.skill_id[1]

		if slot9 then
			slot1[slot9] = {
				level = 1,
				id = slot9
			}
		end
	end

	return slot1
end

slot0.isSameKind = function (slot0, slot1)
	return pg.ship_data_template[slot0.configId].group_type == pg.ship_data_template[slot1.configId].group_type
end

slot0.GetLockState = function (slot0)
	return slot0.lockState
end

slot0.SetLockState = function (slot0, slot1)
	slot0.lockState = slot1
end

slot0.GetPreferenceTag = function (slot0)
	return slot0.preferenceTag or 0
end

slot0.SetPreferenceTag = function (slot0, slot1)
	slot0.preferenceTag = slot1
end

slot0.canProposeShip = function (slot0)
	slot1 = slot0.id

	if getProxy(ChapterProxy):getActiveChapter() and slot3:shipInWartime(slot1) then
		return false, i18n("word_shipState_fight")
	end

	for slot9, slot10 in ipairs(slot5) do
		if slot10 == slot1 then
			return false, i18n("ship_vo_event")
		end
	end

	return true
end

slot0.canModifyShip = function (slot0)
	slot1 = slot0.id

	if getProxy(ChapterProxy):getActiveChapter() and slot3:shipInWartime(slot1) then
		return false, i18n("word_shipState_fight")
	end

	for slot9, slot10 in ipairs(slot5) do
		if slot10 == slot1 then
			return false, i18n("ship_vo_event")
		end
	end

	return true
end

slot0.canDestroyShip = function (slot0, slot1)
	if slot0:isBluePrintShip() then
		return false, i18n("blueprint_destory_tip")
	elseif slot0:GetLockState() == Ship.LOCK_STATE_LOCK then
		return false, i18n("ship_vo_locked")
	elseif slot0.inChapter or slot0.inWorld then
		return false, i18n("word_shipState_fight")
	elseif slot0.inClass then
		return false, i18n("ship_vo_inClass")
	elseif slot0.inEvent then
		return false, i18n("ship_vo_event")
	elseif slot0.inAdmiral then
		return false, i18n("playerinfo_ship_is_already_flagship")
	elseif slot0.inBackyard then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_vo_moveout_backyard"),
			onYes = function ()
				pg.m02:sendNotification(GAME.EXIT_SHIP, {
					callback = slot0,
					shipId = slot1.id
				})
			end
		})

		return false, nil
	elseif slot0.inFleet then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_vo_moveout_formation"),
			onYes = function ()
				slot0 = getProxy(FleetProxy)

				if not slot0:getFleetByShip(slot0) then
					return
				end

				if slot1:isFirstFleet() or slot1:isPvpFleet() then
					slot2, slot3 = slot1:canRemoveByShipId(slot0.id)

					if not slot2 then
						if slot3 == Fleet.VANGUARD then
							pg.TipsMgr:GetInstance():ShowTips(i18n("ship_vo_vanguardFleet_must_hasShip"))

							return
						elseif slot3 == Fleet.MAIN then
							pg.TipsMgr:GetInstance():ShowTips(i18n("ship_vo_mainFleet_must_hasShip"))

							return
						end
					end
				end

				slot1:removeShip(slot0)
				pg.m02:sendNotification(GAME.UPDATE_FLEET, {
					callback = slot1,
					fleet = slot1
				})
			end
		})

		return false, nil
	elseif slot0.inExercise then
		if not getProxy(MilitaryExerciseProxy).getExerciseFleet(slot2):canRemoveByShipId(slot0.id) then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("exercise_clear_fleet_tip"),
				onYes = function ()
					slot0:removeShip(slot0)
					pg.m02:sendNotification(GAME.UPDATE_EXERCISE_FLEET, {
						fleet = slot0,
						callback = GAME.UPDATE_EXERCISE_FLEET
					})
				end
			})
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("exercise_fleet_exit_tip"),
				onYes = function ()
					slot0:removeShip(slot0)
					pg.m02:sendNotification(GAME.UPDATE_EXERCISE_FLEET, {
						fleet = slot0,
						callback = GAME.UPDATE_EXERCISE_FLEET
					})
				end
			})
		end

		return false, nil
	elseif slot0.inTactics then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("tactics_lesson_cancel"),
			onYes = function ()
				slot0 = getProxy(NavalAcademyProxy)

				pg.m02:sendNotification(GAME.CANCEL_LEARN_TACTICS, {
					callback = slot1,
					shipId = slot0:getStudentIdByShipId(slot0.id),
					type = Student.CANCEL_TYPE_MANUAL
				})
			end
		})

		return false, nil
	elseif slot0.inActivity then
		return false, i18n("word_shipState_activity")
	elseif slot0.inSham then
		return false, i18n("word_shipState_sham")
	elseif slot0.inChallenge then
		return false, i18n("word_shipState_sham")
	end

	return true
end

slot0.calReturnRes = function (slot0)
	return math.floor((30 + slot0.level * pg.ship_data_by_type[slot0:getShipType()].distory_resource_gold_ratio) / 10), math.floor((30 + slot0.level * pg.ship_data_by_type[slot0:getShipType()].distory_resource_oil_ratio) / 10), pg.ship_data_by_star[slot0:getConfig("rarity")].destory_battle_stars
end

slot0.getRarity = function (slot0)
	slot1 = slot0:getConfig("rarity")

	if slot0:isRemoulded() then
		slot1 = slot1 + 1
	end

	return slot1
end

slot0.getExchangePrice = function (slot0)
	return pg.ship_data_by_star[slot0:getConfig("rarity")].exchange_price
end

slot0.updateSkill = function (slot0, slot1)
	slot0.skills[slot1.skill_id or slot1.id] = {
		id = slot1.skill_id or slot1.id,
		level = slot1.skill_lv or slot1.lv or slot1.level,
		exp = slot1.skill_exp or slot1.exp
	}
end

slot0.canEquipAtPos = function (slot0, slot1, slot2)
	slot3, slot4 = slot0:isForbiddenAtPos(slot1, slot2)

	if slot3 then
		return false, slot4
	end

	for slot8, slot9 in pairs(slot0.equipments) do
		if slot9 and slot8 ~= slot2 and slot9.config.equip_limit ~= 0 and slot1.config.equip_limit == slot9.config.equip_limit then
			return false, i18n("ship_equip_same_group_equipment")
		end
	end

	return true
end

slot0.isForbiddenAtPos = function (slot0, slot1, slot2)
	if not table.contains(pg.ship_data_template[slot0.configId]["equip_" .. slot2], slot1.config.type) then
		return true, i18n("common_limit_equip")
	end

	if table.contains(pg.equip_data_template[slot1.configId].ship_type_forbidden, slot0:getShipType()) then
		return true, i18n("common_limit_equip")
	end

	return false
end

slot0.canEquipCommander = function (slot0, slot1)
	if slot1:getShipType() ~= slot0:getShipType() then
		return false, i18n("commander_type_unmatch")
	end

	return true
end

slot0.upgrade = function (slot0)
	if pg.ship_data_transform[slot0.configId].trans_id and slot1.trans_id > 0 then
		slot0.configId = slot1.trans_id
		slot0.star = slot0:getConfig("star")
	end
end

slot0.getTeamType = function (slot0)
	return pg.ship_data_by_type[slot0:getShipType()].team_type
end

slot0.getFleetName = function (slot0)
	return slot0[slot0:getTeamType()]
end

slot0.getMaxConfigId = function (slot0)
	slot1 = pg.ship_data_template
	slot2 = nil

	for slot6 = 4, 1, -1 do
		if slot1[tonumber(slot0.groupId .. slot6)] then
			slot2 = slot7

			break
		end
	end

	return slot2
end

slot0.STATE_CHANGE_FAIL = 0
slot0.STATE_CHANGE_CHECK = 1
slot0.STATE_CHANGE_OK = 2
slot6 = {
	inFleet = {
		inElite = 2,
		inChapter = 2,
		inFleet = 2,
		inClass = 2,
		inActivity = 2,
		inTactics = 2,
		inBackyard = 2,
		inEvent = 0,
		inWorld = 2
	},
	inElite = {
		inElite = 0,
		inChapter = 2,
		inFleet = 2,
		inClass = 2,
		inActivity = 2,
		inTactics = 2,
		inBackyard = 2,
		inEvent = 0,
		inWorld = 2
	},
	inEvent = {
		inElite = 0,
		inChapter = 0,
		inFleet = 1,
		inClass = 2,
		inActivity = 0,
		inTactics = 2,
		inBackyard = 2,
		inEvent = 0,
		inWorld = 0
	},
	inBackyard = {
		inElite = 2,
		inChapter = 2,
		inFleet = 2,
		inClass = 0,
		inActivity = 2,
		inTactics = 2,
		inBackyard = 2,
		inEvent = 2,
		inWorld = 2
	},
	inClass = {
		inElite = 2,
		inChapter = 2,
		inFleet = 2,
		inClass = 0,
		inActivity = 2,
		inTactics = 2,
		inBackyard = 1,
		inEvent = 2,
		inWorld = 2
	},
	inTactics = {
		inElite = 2,
		inChapter = 2,
		inFleet = 2,
		inClass = 2,
		inActivity = 2,
		inTactics = 0,
		inBackyard = 2,
		inEvent = 2,
		inWorld = 2
	},
	inActivity = {
		inElite = 2,
		inChapter = 2,
		inFleet = 2,
		inClass = 2,
		inActivity = 0,
		inTactics = 2,
		inBackyard = 2,
		inEvent = 0,
		inWorld = 0
	}
}
slot7 = {
	"inChapter",
	"inFleet",
	"inEvent",
	"inClass",
	"inTactics",
	"inBackyard",
	"inElite",
	"inActivity",
	"inWorld"
}
slot8 = {
	inFleet = {
		tips_block = "word_shipState_fight"
	},
	inChapter = {
		tips_block = "word_shipState_fight"
	},
	inElite = {
		tips_block = "word_shipState_fight"
	},
	inActivity = {
		tips_block = "word_shipState_fight"
	},
	inEvent = {
		tips_block = "word_shipState_event"
	},
	inBackyard = {
		tips_block = "word_shipState_rest"
	},
	inClass = {
		tips_block = "word_shipState_study"
	},
	inTactics = {
		tips_block = "word_shipState_tactics"
	},
	inChapter = {
		tips_block = "word_shipState_fight"
	}
}

slot0.ShipStateConflict = function (slot0, slot1)
	slot2 = slot0[slot0]
	slot3 = nil

	for slot7, slot8 in ipairs(slot1) do
		if slot1[slot8] then
			if slot2[slot8] == slot2.STATE_CHANGE_FAIL then
				return slot2.STATE_CHANGE_FAIL, slot3[slot8].tips_block
			elseif slot9 == slot2.STATE_CHANGE_CHECK then
				return slot2.STATE_CHANGE_CHECK, slot8
			end
		end
	end

	return slot2.STATE_CHANGE_OK
end

slot0.ChangeStateCheckBox = function (slot0, slot1, slot2)
	if slot0 == "inBackyard" then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_vo_moveout_backyard"),
			onYes = function ()
				pg.m02:sendNotification(GAME.EXIT_SHIP, {
					callback = slot0,
					shipId = slot1.id
				})
			end
		})

		return false, nil
	elseif slot0 == "inFleet" then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("ship_vo_moveout_formation"),
			onYes = function ()
				slot0 = getProxy(FleetProxy)

				if not slot0:getFleetByShip(slot0) then
					return
				end

				if slot1:isFirstFleet() then
					slot2, slot3 = slot1:canRemoveByShipId(slot0.id)

					if not slot2 then
						if slot3 == Fleet.VANGUARD then
							pg.TipsMgr:GetInstance():ShowTips(i18n("ship_vo_vanguardFleet_must_hasShip"))

							return
						elseif slot3 == Fleet.MAIN then
							pg.TipsMgr:GetInstance():ShowTips(i18n("ship_vo_mainFleet_must_hasShip"))

							return
						end
					end
				end

				slot1:removeShip(slot0)
				pg.m02:sendNotification(GAME.UPDATE_FLEET, {
					callback = slot1,
					fleet = slot1
				})
			end
		})

		return false, nil
	elseif slot0 == "inTactics" then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("tactics_lesson_cancel"),
			onYes = function ()
				slot0 = getProxy(NavalAcademyProxy)

				pg.m02:sendNotification(GAME.CANCEL_LEARN_TACTICS, {
					callback = slot1,
					shipId = slot0:getStudentIdByShipId(slot0.id),
					type = Student.CANCEL_TYPE_MANUAL
				})
			end
		})

		return false, nil
	end

	return true
end

slot0.isBreakOut = function (slot0)
	return slot0.configId % 10 > 1
end

slot0.fateSkillChange = function (slot0, slot1)
	if not slot0.skillChangeList then
		slot0.skillChangeList = (slot0:isBluePrintShip() and slot0:getBluePrint():getChangeSkillList()) or {}
	end

	for slot5, slot6 in ipairs(slot0.skillChangeList) do
		if slot6[1] == slot1 and slot0.skills[slot6[2]] then
			return slot6[2]
		end
	end

	return slot1
end

slot0.getSkillList = function (slot0)
	slot2 = Clone(pg.ship_data_template[slot0.configId].buff_list_display)
	slot3 = Clone(pg.ship_data_template[slot0.configId].buff_list)
	slot5 = 0

	if pg.ship_data_trans[slot0.groupId] and slot4.skill_id ~= 0 then
		slot7 = pg.transform_data_template[slot4.skill_id]

		if slot0.transforms[slot4.skill_id] and slot7.skill_id ~= 0 then
			table.insert(slot3, slot7.skill_id)
		end
	end

	slot6 = {}

	for slot10, slot11 in ipairs(slot2) do
		for slot15, slot16 in ipairs(slot3) do
			if slot11 == slot16 then
				table.insert(slot6, slot0:fateSkillChange(slot11))
			end
		end
	end

	return slot6
end

slot0.getModAttrTopLimit = function (slot0, slot1)
	return calcFloor((3 + 7 * math.min(slot0.level, 100) / 100) * pg.ship_data_strengthen[pg.ship_data_template[slot0.configId].strengthen_id].durability[ShipModAttr.ATTR_TO_INDEX[slot1]] * 0.1)
end

slot0.leftModAdditionPoint = function (slot0, slot1)
	return math.max(0, slot0:getModAttrTopLimit(slot1) - calcFloor(slot0:getModProperties(slot1) / slot0:getModExpRatio(slot1)))
end

slot0.getModAttrBaseMax = function (slot0, slot1)
	if not table.contains(slot0:getConfig("lock"), slot1) then
		return calcFloor(slot0:getShipProperties()[slot1] + slot0:leftModAdditionPoint(slot1))
	else
		return 0
	end
end

slot0.getModExpRatio = function (slot0, slot1)
	if not table.contains(slot0:getConfig("lock"), slot1) then
		return math.max(pg.ship_data_strengthen[pg.ship_data_template[slot0.configId].strengthen_id].level_exp[ShipModAttr.ATTR_TO_INDEX[slot1]], 1)
	else
		return 1
	end
end

slot0.inUnlockTip = function (slot0)
	return table.contains(pg.gameset.tip_unlock_shipIds.description[0], slot0)
end

slot0.proposeSkinOwned = function (slot0, slot1)
	return slot1 and slot0.propose and slot1.skin_type == Ship.SKIN_TYPE_PROPOSE
end

slot0.getProposeSkin = function (slot0)
	for slot4, slot5 in ipairs(pg.ship_skin_template.all) do
		if pg.ship_skin_template[slot5].ship_group == slot0.groupId and slot6.skin_type == slot0.SKIN_TYPE_PROPOSE then
			return slot6
		end
	end

	return nil
end

slot0.getDockSortValue = function (slot0)
	return ((slot0.inFleet and 1) or 0) + ((slot0.inShamPre and 1) or 0) + ((slot0.shamInFleet and 1) or 0) + ((slot0.inWorld and slot0.bindingData and slot0.bindingData.fleetId and 100 - slot0.bindingData.fleetId) or 0)
end

slot0.getDisplaySkillIds = function (slot0)
	return _.map(pg.ship_data_template[slot0.configId].buff_list_display, function (slot0)
		return slot0:fateSkillChange(slot0)
	end)
end

slot0.isFullSkillLevel = function (slot0)
	slot1 = pg.skill_data_template

	for slot5, slot6 in pairs(slot0.skills) do
		if slot1[slot6.id].max_level ~= slot6.level then
			return false
		end
	end

	return true
end

slot0.setEquipmentRecord = function (slot0, slot1, slot2)
	PlayerPrefs.SetString("equipment_record" .. "_" .. slot1 .. "_" .. slot0.id, table.concat(_.flatten(slot2), ":"))
	PlayerPrefs.Save()
end

slot0.getEquipmentRecord = function (slot0, slot1)
	if not slot0.equipmentRecords then
		slot3 = string.split(PlayerPrefs.GetString("equipment_record" .. "_" .. slot1 .. "_" .. slot0.id) or "", ":")
		slot4 = {}

		for slot8 = 1, 3, 1 do
			slot4[slot8] = _.map(_.slice(slot3, 5 * slot8 - 4, 5), function (slot0)
				return tonumber(slot0)
			end)
		end

		slot0.equipmentRecords = slot4
	end

	return slot0.equipmentRecords
end

slot0.hasEquipEquipmentSkin = function (slot0)
	for slot4, slot5 in pairs(slot0.equipments) do
		if slot5 and slot5:hasSkin() then
			return true
		end
	end

	return false
end

slot0.hasCommander = function (slot0)
	return slot0.commanderId and slot0.commanderId ~= 0
end

slot0.getCommander = function (slot0)
	return slot0.commanderId
end

slot0.setCommander = function (slot0, slot1)
	slot0.commanderId = slot1
end

slot0.getSkillIndex = function (slot0, slot1)
	for slot6, slot7 in ipairs(slot2) do
		if slot1 == slot7 then
			return slot6
		end
	end
end

slot0.getTactics = function (slot0)
	return 1, "tactics_attack"
end

slot0.SetExpression = function (slot0, slot1, slot2)
	slot3 = findTF(slot0, "face")

	if not pg.ship_skin_expression[slot1] then
		if slot3 then
			setActive(slot3, false)
		end

		return
	end

	if not slot4[slot2] or slot5 == "" then
		slot5 = slot4.default
	end

	slot6 = GetSpriteFromAtlas("paintingface/" .. slot1, slot5)

	if slot3 then
		setActive(slot3, slot5 and slot5 ~= "")
		setImageSprite(slot3, slot6)

		if findTF(slot3, "face_sub") then
			setActive(slot7, GetSpriteFromAtlas("paintingface/" .. slot1, slot5 .. "_sub"))

			if GetSpriteFromAtlas("paintingface/" .. slot1, slot5 .. "_sub") then
				setImageSprite(slot7, slot8)
			end
		end
	end

	return (slot4.default and true) or false
end

slot0.DefaultFaceless = function (slot0)
	if pg.ship_skin_expression[slot0] and slot1.default ~= "" then
		return true
	else
		return false
	end
end

return slot0
