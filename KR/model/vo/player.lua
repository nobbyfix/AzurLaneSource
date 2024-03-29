slot0 = class("Player", import(".PlayerAttire"))
slot2 = pg.player_resource.get_id_list_by_name
slot0.MAX_SHIP_BAG = 2000
slot0.MAX_EQUIP_BAG = 2000
slot0.MAX_COMMANDER_BAG = 200
slot0.ASSISTS_TYPE_SHAM = 0
slot0.ASSISTS_TYPE_GUILD = 1
slot0.CHANGE_NAME_KEY = 1

function id2res(slot0)
	return slot0[slot0].name
end

function res2id(slot0)
	return slot0.get_id_list_by_name[slot0][1]
end

function id2ItemId(slot0)
	return slot0[slot0].itemid
end

function itemId2Id(slot0)
	return
end

slot0.skin2Res = function (slot0)
	slot2 = 1
	slot3 = 0

	for slot7, slot8 in pairs(pg.drop_data_restore.all) do
		if slot0 == slot1[slot8].target_id then
			slot2 = slot9.resource_type
			slot3 = slot9.resource_num

			break
		end
	end

	return slot2, slot3
end

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	if not storyIndex then
		storyIndex = pg.StoryMgr:GetInstance():GetStoryByName("index")
	end

	if not storyIndexAgain then
		storyIndexAgain = pg.StoryMgr:GetInstance():GetStoryByName("index_again")
	end

	slot0.id = slot1.id
	slot0.name = slot1.name
	slot0.level = slot1.level or slot1.lv
	slot0.configId = slot0.level
	slot0.exp = slot1.exp or 0
	slot0.attackCount = slot1.attack_count or 0
	slot0.winCount = slot1.win_count or 0
	slot0.manifesto = slot1.adv or slot1.manifesto
	slot0.ship_bag_max = slot1.ship_bag_max
	slot0.equip_bag_max = slot1.equip_bag_max
	slot0.buff_list = slot1.buffList or {}
	slot0.rank = slot1.rank or slot1.title or 0
	slot0.pvp_attack_count = slot1.pvp_attack_count or 0
	slot0.pvp_win_count = slot1.pvp_win_count or 0
	slot0.collect_attack_count = slot1.collect_attack_count or 0
	slot0.guideIndex = slot1.guide_index
	slot0.buyOilCount = slot1.buy_oil_count
	slot0.chatRoomId = slot1.chat_room_id or 1
	slot0.score = slot1.score or 0
	slot0.guildWaitTime = slot1.guild_wait_time or 0
	slot0.commanderBagMax = slot1.commander_bag_max
	slot0.displayTrophyList = slot1.medal_id or {}
	slot0.cdList = {}
	slot2 = ipairs
	slot3 = slot1.cd_list or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.cdList[slot6.key] = slot6.timestamp
	end

	slot0.commonFlagList = {}
	slot2 = ipairs
	slot3 = slot1.flag_list or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.commonFlagList[slot6] = true
	end

	slot0.registerTime = slot1.register_time
	slot0.vipCards = {}
	slot2 = ipairs
	slot3 = slot1.card_list or {}

	for slot5, slot6 in slot2(slot3) do
		slot0.vipCards[VipCard.New(slot6).id] = VipCard.New(slot6)
	end

	slot0:updateResources(slot1.resource_list)

	slot0.maxRank = slot1.max_rank or 0
	slot0.shipCount = slot1.ship_count or 0
	slot0.chargeExp = slot1.acc_pay_lv or 0
	slot0.mingshiflag = 0
	slot0.mingshiCount = 0
	slot0.stories = {}
	slot0.storiesAgain = {}

	if slot1.story_list then
		for slot5, slot6 in pairs(slot1.story_list) do
			if slot6 == 20008 then
				slot6 = 1131
			end

			if slot6 == 20009 then
				slot6 = 1132
			end

			if slot6 == 20010 then
				slot6 = 1133
			end

			if slot6 == 20011 then
				slot6 = 1134
			end

			if slot6 == 20012 then
				slot6 = 1135
			end

			if slot6 == 20013 then
				slot6 = 1136
			end

			if slot6 == 20014 then
				slot6 = 1137
			end

			if storyIndex[slot6] then
				slot0.stories[slot6] = storyIndex[slot6]
			end

			if storyIndexAgain[slot6] then
				slot0.storiesAgain[slot6] = storyIndexAgain[slot6]
			end
		end
	end

	slot0.maxGold = pg.gameset.max_gold.key_value
	slot0.maxOil = pg.gameset.max_oil.key_value
	slot0.chatMsgBanTime = slot1.chat_msg_ban_time or 0
	slot0.displayInfo = slot1.display or {}
	slot0.attireInfo = {
		[AttireConst.TYPE_ICON_FRAME] = slot0.iconFrame,
		[AttireConst.TYPE_CHAT_FRAME] = slot0.chatFrame
	}
end

slot0.updateAttireFrame = function (slot0, slot1, slot2)
	slot0.attireInfo[slot1] = slot2
end

slot0.getAttireByType = function (slot0, slot1)
	return slot0.attireInfo[slot1]
end

slot0.canModifyName = function (slot0)
	slot1 = pg.TimeMgr.GetInstance():GetServerTime()

	if slot0.level < pg.gameset.player_name_change_lv_limit.key_value then
		return false, i18n("player_name_change_time_lv_tip", slot2)
	end

	if slot1 < slot0:getModifyNameTimestamp() then
		slot4, slot5, slot6, slot7 = pg.TimeMgr.GetInstance():parseTimeFrom(slot3 - slot1)
		slot8 = nil

		return false, i18n("player_name_change_time_limit_tip", (slot4 == 0 and ((slot5 == 0 and math.max(slot6, 1) .. i18n("word_minute")) or slot5 .. i18n("word_hour"))) or slot4 .. i18n("word_date"))
	end

	return true
end

slot0.getModifyNameComsume = function (slot0)
	return pg.gameset.player_name_change_cost.description
end

slot0.getModifyNameTimestamp = function (slot0)
	return slot0.cdList[slot0.CHANGE_NAME_KEY] or 0
end

slot0.updateModifyNameColdTime = function (slot0, slot1)
	slot0.cdList[slot0.CHANGE_NAME_KEY] = slot1
end

slot0.getMaxGold = function (slot0)
	slot1 = 0

	if getProxy(GuildProxy):getData() then
		slot1 = slot2.maxGoldAddition
	end

	return slot0.maxGold + slot1
end

slot0.getMaxOil = function (slot0)
	slot1 = 0

	if getProxy(GuildProxy):getData() then
		slot1 = slot2.maxOilAddition
	end

	return slot0.maxOil + slot1
end

slot0.getResource = function (slot0, slot1)
	return slot0[id2res(slot1)] or 0
end

slot0.updateResources = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0) do
		slot7 = slot6[1]

		if slot5 == "gem" then
			slot0.chargeGem = 0
		elseif slot5 == "freeGem" then
			slot0.awardGem = 0
		else
			slot0[slot5] = 0
		end
	end

	slot2 = ipairs
	slot3 = slot1 or {}

	for slot5, slot6 in slot2(slot3) do
		if id2res(slot6.type) == "gem" then
			slot0.chargeGem = slot6.num
		elseif slot7 == "freeGem" then
			slot0.awardGem = slot6.num
		else
			slot0[slot7] = slot6.num
		end
	end
end

slot0.getPainting = function (slot0)
	slot2 = nil

	if pg.ship_skin_template[slot0.skinId] then
		return ((HXSet.isHx() or slot1.painting) and ((slot1.painting_hx ~= "" and slot1.painting_hx) or slot1.painting)) or "unknown"
	end
end

slot0.inGuildCDTime = function (slot0)
	return slot0.guildWaitTime > 0 and pg.TimeMgr.GetInstance():GetServerTime() < slot0.guildWaitTime
end

slot0.setGuildWaitTime = function (slot0, slot1)
	slot0.guildWaitTime = slot1
end

slot0.addStory = function (slot0, slot1)
	slot0.stories[slot1] = storyIndex[slot1]
end

slot0.getStoryIndexID = function (slot0, slot1)
	for slot5, slot6 in pairs(storyIndex) do
		if slot6 == slot1 then
			return slot5
		end
	end

	return 0
end

slot0.getStoryByIndexID = function (slot0, slot1)
	return storyIndex[slot1]
end

slot0.addStoryAgain = function (slot0, slot1)
	slot0.storiesAgain[slot1] = storyIndexAgain[slot1]
end

slot0.getStoryIndexAgainID = function (slot0, slot1)
	for slot5, slot6 in pairs(storyIndexAgain) do
		if slot6 == slot1 then
			return slot5
		end
	end

	return 0
end

slot0.IsPlayed = function (slot0, slot1, slot2)
	return (table.contains(slot0.stories, slot1) or slot0.stories[slot1]) and (slot2 or slot0:IsPlayedAgain(slot1))
end

slot0.IsPlayedAgain = function (slot0, slot1)
	return slot0:getStoryIndexAgainID(slot1) <= 0 or table.contains(slot0.storiesAgain, slot1) or slot0.storiesAgain[slot1]
end

slot0.getChargeLevel = function (slot0)
	slot2 = pg.pay_level_award.all[1]
	slot3 = pg.pay_level_award.all[#pg.pay_level_award.all]

	for slot7, slot8 in ipairs(pg.pay_level_award.all) do
		if slot1[slot8].exp <= slot0.chargeExp then
			slot2 = math.min(slot8 + 1, slot3)
		end
	end

	return slot2
end

slot0.getCardById = function (slot0, slot1)
	return Clone(slot0.vipCards[slot1])
end

slot0.addVipCard = function (slot0, slot1)
	slot0.vipCards[slot1.id] = slot1
end

slot0.addShipBagCount = function (slot0, slot1)
	slot0.ship_bag_max = slot0.ship_bag_max + slot1
end

slot0.addEquipmentBagCount = function (slot0, slot1)
	slot0.equip_bag_max = slot0.equip_bag_max + slot1
end

slot0.bindConfigTable = function (slot0)
	return pg.user_level
end

slot0.updateScoreAndRank = function (slot0, slot1, slot2)
	slot0.score = slot1
	slot0.rank = slot2
end

slot0.increasePvpCount = function (slot0)
	slot0.pvp_attack_count = slot0.pvp_attack_count + 1
end

slot0.increasePvpWinCount = function (slot0)
	slot0.pvp_win_count = slot0.pvp_win_count + 1
end

slot0.isEnough = function (slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot0[slot5] == nil or slot0[slot5] < slot6 then
			return false, slot5
		end
	end

	return true
end

slot0.increaseBuyOilCount = function (slot0)
	slot0.buyOilCount = slot0.buyOilCount + 1
end

slot0.changeChatRoom = function (slot0, slot1)
	slot0.chatRoomId = slot1
end

slot0.increaseAttackCount = function (slot0)
	slot0.attackCount = slot0.attackCount + 1
end

slot0.increaseAttackWinCount = function (slot0)
	slot0.winCount = slot0.winCount + 1
end

slot0.increaseShipCount = function (slot0, slot1)
	slot0.shipCount = slot0.shipCount + ((slot1 and slot1) or 1)
end

slot0.isFull = function (slot0)
	for slot4, slot5 in pairs(slot0) do
		if pg.user_level["max_" .. slot4] and slot0[slot4] < slot6 then
			return false
		end
	end

	return true
end

slot0.__index = function (slot0, slot1)
	if slot1 == "gem" then
		return slot0:getChargeGem()
	elseif slot1 == "freeGem" then
		return slot0:getTotalGem()
	end

	return rawget(slot0, slot1) or slot0[slot1] or slot0.super[slot1]
end

slot0.__newindex = function (slot0, slot1, slot2)
	rawset(slot0, slot1, slot2)
end

slot0.getFreeGem = function (slot0)
	return slot0.awardGem
end

slot0.getChargeGem = function (slot0)
	return slot0.chargeGem
end

slot0.getTotalGem = function (slot0)
	return slot0:getFreeGem() + slot0:getChargeGem()
end

slot0.getResById = function (slot0, slot1)
	if slot1 == 4 then
		return slot0:getTotalGem()
	else
		return slot0[id2res(slot1)]
	end
end

slot0.consume = function (slot0, slot1)
	slot1.freeGem = nil
	slot1.gem = nil

	if (slot1.freeGem or 0) + (slot1.gem or 0) > 0 then
		slot0.awardGem = slot0:getFreeGem() - math.min(slot2, slot3)
		slot0.chargeGem = slot0.chargeGem - (slot2 - math.min(slot2, slot3))
	end

	for slot6, slot7 in pairs(slot1) do
		slot0[slot6] = slot0[slot6] - slot7
	end
end

slot0.addResources = function (slot0, slot1)
	for slot5, slot6 in pairs(slot1) do
		if slot5 == "gold" then
			slot0[slot5] = math.min(slot0[slot5] + slot6, slot0.maxGold)
		elseif slot5 == "oil" then
			slot0[slot5] = math.min(slot0[slot5] + slot6, slot0.maxOil)
		elseif slot5 == "chargeGem" then
			slot0.chargeGem = slot0:getChargeGem() + slot6
		elseif slot5 == "gem" or slot5 == "freeGem" then
			slot0.awardGem = slot0:getFreeGem() + slot6
		else
			slot0[slot5] = slot0[slot5] + slot6
		end
	end
end

slot0.resetBuyOilCount = function (slot0)
	slot0.buyOilCount = 0
end

slot0.addExp = function (slot0, slot1)
	slot0.exp = slot0.exp + slot1

	while slot0:canLevelUp() do
		slot0.exp = slot0.exp - slot0:getLevelExpConfig().exp_interval
		slot0.level = slot0.level + 1

		pg.SDKMgr:GetInstance():levelUp(slot0.level)
	end
end

slot0.getBuffByType = function (slot0, slot1)
	slot2 = {}

	for slot6, slot7 in ipairs(slot0.buff_list) do
		if pg.benefit_buff_template[slot7.id].benefit_type == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

slot0.getLevelExpConfig = function (slot0)
	return getConfigFromLevel1(pg.user_level, slot0.level)
end

slot0.getMaxLevel = function (slot0)
	return pg.user_level.all[#pg.user_level.all]
end

slot0.getTotalExp = function (slot0)
	return slot0:getLevelExpConfig().exp_start + slot0.exp
end

slot0.canLevelUp = function (slot0)
	return getConfigFromLevel1(pg.user_level, slot0.level + 1) and getConfigFromLevel1(pg.user_level, slot0.level) ~= slot1 and slot0:getLevelExpConfig().exp_interval <= slot0.exp
end

slot0.isSelf = function (slot0)
	return getProxy(PlayerProxy):isSelf(slot0.id)
end

slot0.isFriend = function (slot0)
	return getProxy(FriendProxy):isFriend(slot0.id)
end

slot0.OilMax = function (slot0, slot1)
	if (slot1 or 0) < 0 then
		slot1 = 0
	end

	return pg.gameset.max_oil.key_value < slot0.oil + slot1
end

slot0.GoldMax = function (slot0, slot1)
	return pg.gameset.max_gold.key_value < slot0.gold + (slot1 or 0)
end

slot0.UpdateCommonFlag = function (slot0, slot1)
	slot0.commonFlagList[slot1] = true
end

slot0.GetCommonFlag = function (slot0, slot1)
	return slot0.commonFlagList[slot1]
end

slot0.updateCommanderBagMax = function (slot0, slot1)
	slot0.commanderBagMax = slot0.commanderBagMax + slot1
end

return slot0
