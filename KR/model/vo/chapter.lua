slot0 = class("Chapter", import(".BaseVO"))
slot0.SelectFleet = 1
slot0.CustomFleet = 2
slot0.CHAPTER_STATE = {
	i18n("level_chapter_state_high_risk"),
	i18n("level_chapter_state_risk"),
	i18n("level_chapter_state_low_risk"),
	i18n("level_chapter_state_safety")
}

slot0.Ctor = function (slot0, slot1)
	slot0.configId = slot1.id
	slot0.id = slot0.configId
	slot0.unlock = false
	slot0.progress = defaultValue(slot1.progress, 0)
	slot0.defeatCount = slot1.defeat_count or 0
	slot0.passCount = slot1.pass_count or 0
	slot0.todayDefeatCount = slot1.today_defeat_count or 0
	slot0.expireTime = slot1.active_time
	slot0.awardIndex = slot1.index or 0
	slot0.theme = ChapterTheme.New(slot0:getConfig("theme"))
	slot2 = {
		defaultValue(slot1.kill_boss_count, 0),
		defaultValue(slot1.kill_enemy_count, 0),
		defaultValue(slot1.take_box_count, 0)
	}
	slot0.achieves = {}

	for slot6 = 1, 3, 1 do
		if slot0:getConfig("star_require_" .. slot6) > 0 then
			table.insert(slot0.achieves, {
				type = slot7,
				config = slot0:getConfig("num_" .. slot6),
				count = slot2[slot6]
			})
		end
	end

	slot0.dropShipIdList = {}
	slot3 = ipairs
	slot4 = slot1.drop_ship_id or {}

	for slot6, slot7 in slot3(slot4) do
		table.insert(slot0.dropShipIdList, slot7)
	end

	slot0.eliteFleetList = {
		{},
		{},
		{}
	}
	slot0.eliteCommanderList = {
		{},
		{},
		{}
	}
	slot0.pathFinder = nil
	slot0.active = false
	slot0.dueTime = nil
	slot0.cells = {}
	slot0.fleets = {}
	slot0.findex = 0
	slot0.champions = {}
	slot0.roundIndex = 0
	slot0.subAutoAttack = 0
	slot0.barriers = 0
	slot0.loopFlag = 0
	slot0.cellAttachments = {}
	slot0.buff_list = {}

	if slot1.buff_list then
		for slot6, slot7 in ipairs(slot1.buff_list) do
			slot0.buff_list[slot6] = slot7
		end
	end

	slot0.extraFlagList = {}
end

slot0.BuildEliteFleetList = function (slot0)
	slot1 = {
		{},
		{},
		{}
	}
	slot2 = {
		{},
		{},
		{}
	}
	slot3 = ipairs
	slot4 = slot0 or {}

	for slot6, slot7 in slot3(slot4) do
		slot8 = {}

		for slot12, slot13 in ipairs(slot7.main_id) do
			slot8[#slot8 + 1] = slot13
		end

		for slot12, slot13 in ipairs(slot7.scout_id) do
			slot8[#slot8 + 1] = slot13
		end

		for slot12, slot13 in ipairs(slot7.submarine_id) do
			slot8[#slot8 + 1] = slot13
		end

		slot1[slot6] = slot8
		slot9 = {}

		for slot13, slot14 in ipairs(slot7.commanders) do
			if getProxy(CommanderProxy):getCommanderById(slot14.id) then
				slot9[slot14.pos] = slot14.id
			end
		end

		slot2[slot6] = slot9
	end

	return slot1, slot2
end

slot0.__index = function (slot0, slot1)
	if slot1 == "fleet" then
		return slot0.fleets[slot0.findex]
	end

	return rawget(slot0, slot1) or slot0[slot1] or slot0.super[slot1]
end

slot0.getFleetById = function (slot0, slot1)
	return _.detect(slot0.fleets, function (slot0)
		return slot0.id == slot0
	end)
end

slot0.getMaxCount = function (slot0)
	if slot0:getDataType() == ChapterConst.TypeNone then
		if #slot0:getConfig("risk_levels") == 0 then
			return 0
		end

		return slot1[1][1]
	else
		return 0
	end
end

slot0.hasMitigation = function (slot0)
	if not LOCK_MITIGATION and slot0:getDataType() == ChapterConst.TypeNone then
		return slot0:getConfig("mitigation_level") > 0
	else
		return false
	end
end

slot0.getRemainPassCount = function (slot0)
	if slot0:getDataType() == ChapterConst.TypeNone then
		return math.max(slot0:getMaxCount() - slot0.passCount, 0)
	else
		return 0
	end
end

slot0.getRiskLevel = function (slot0)
	if slot0:getDataType() == ChapterConst.TypeNone then
		slot1 = slot0:getRemainPassCount()

		for slot6, slot7 in ipairs(slot2) do
			if slot1 <= slot7[1] and slot7[2] <= slot1 then
				return slot6
			end
		end
	else
		return 0
	end
end

slot0.getMitigationRate = function (slot0)
	if slot0:getDataType() == ChapterConst.TypeNone then
		return math.min(slot0.passCount, slot0:getMaxCount()) * ((LOCK_MITIGATION and 0) or slot0:getConfig("mitigation_rate"))
	else
		return 0
	end
end

slot0.getRepressInfo = function (slot0)
	return {
		repressMax = slot0:getMaxCount(),
		repressCount = slot0.passCount,
		repressReduce = slot0:getMitigationRate(),
		repressLevel = (LOCK_MITIGATION and 0) or (slot0:getRemainPassCount() > 0 and 0) or slot0:getConfig("mitigation_level") or 0,
		repressEnemyHpRant = 1 - slot0:getStageCell(slot0.fleet.line.row, slot0.fleet.line.column).data / 10000
	}
end

slot0.getChapterState = function (slot0)
	if slot0:getDataType() == ChapterConst.TypeNone then
		return slot0.CHAPTER_STATE[slot0:getRiskLevel()]
	else
		return ""
	end
end

slot0.getDataType = function (slot0)
	return ChapterConst.TypeNone
end

slot0.getPlayType = function (slot0)
	return slot0:getConfig("model")
end

slot0.bindConfigTable = function (slot0)
	return pg.chapter_template
end

slot0.getConfig = function (slot0, slot1)
	if slot0:isLoop() and pg.chapter_template_loop[slot0.id][slot1] ~= nil then
		return slot2[slot1]
	end

	return slot0:getConfigTable()[slot1]
end

slot0.update = function (slot0, slot1)
	slot0.active = true
	slot0.dueTime = slot1.time
	slot0.loopFlag = slot1.loop_flag
	slot4 = slot0:getConfig("float_items")
	slot0.cells = {}

	function slot6(slot0)
		if slot0.item_type == ChapterConst.AttachStory and slot0.item_data == ChapterConst.StoryTrigger then
			table.insert(slot0.cellAttachments, ChapterCell.New(slot0))
		end

		if not slot0.cells[ChapterCell.Line2Name(slot0.pos.row, slot0.pos.column)] or slot0.cells[slot1].attachment == ChapterConst.AttachNone then
			if ChapterCell.New(slot0).attachment == ChapterConst.AttachOni_Target or slot2.attachment == ChapterConst.AttachOni or (slot2.attachment == ChapterConst.AttachStory and slot2.data == ChapterConst.StoryTrigger) then
				slot2.attachment = ChapterConst.AttachNone
			end

			if _.detect(slot1, function (slot0)
				return slot0[1] == slot0.row and slot0[2] == slot0.column
			end) then
				slot2.item = slot3[3]
				slot2.itemOffset = Vector2(slot3[4], slot3[5])
			end

			slot0.cells[slot1] = slot2

			return slot2
		end
	end

	_.each(slot2, function (slot0)
		slot0(slot0)
	end)
	_.each(slot0:getConfig("grids"), function (slot0)
		if slot0.cells[ChapterCell.Line2Name(slot0[1], slot0[2])] then
			slot2.walkable = slot0[3]
		elseif not slot0[3] then
			slot1({
				pos = {
					row = slot0[1],
					column = slot0[2]
				},
				item_type = ChapterConst.AttachNone
			}).walkable = false
		end
	end)
	_.each(slot1.cell_flag_list or {}, function (slot0)
		if slot0.cells[ChapterCell.Line2Name(slot0.pos.row, slot0.pos.column)] then
			slot2:updateFlagList(slot0)
		else
			slot0.cells[slot1] = ChapterCell.New(slot0)
		end
	end)

	slot0.buff_list = {}

	if slot1.buff_list then
		for slot10, slot11 in ipairs(slot1.buff_list) do
			slot0.buff_list[slot10] = slot11
		end
	end

	slot0.pathFinder = PathFinding.New({}, ChapterConst.MaxRow, ChapterConst.MaxColumn)
	slot8 = nil

	if slot0:getConfig("npc_data") and slot7[1] then
		slot8 = NpcShip.New({
			id = slot7[1],
			configId = slot7[1],
			level = slot7[2]
		})
	end

	slot0.fleets = {}

	for slot12, slot13 in ipairs(slot1.group_list) do
		slot14 = ChapterFleet.New()

		slot14:setup(slot0)
		slot14:updateNpcShip(slot8)
		slot14:update(slot13)

		slot0.fleets[slot12] = slot14
	end

	slot0.fleets = _.sort(slot0.fleets, function (slot0, slot1)
		return slot0.id < slot1.id
	end)

	if slot1.escort_list then
		for slot12, slot13 in ipairs(slot1.escort_list) do
			slot0.fleets[#slot0.fleets + 1] = ChapterTransportFleet.New(slot13)
		end
	end

	slot0.findex = 0
	slot0.findex = slot0:getNextValidIndex()
	slot0.champions = {}

	if slot1.ai_list then
		for slot12, slot13 in ipairs(slot1.ai_list) do
			if slot13.item_flag == 0 then
				table.insert(slot0.champions, ChapterChampion.New(slot13))
			end
		end
	end

	slot0.roundIndex = slot1.round
	slot0.subAutoAttack = slot1.is_submarine_auto_attack
	slot0.modelCount = slot1.model_act_count
	slot0.operationBuffList = {}

	for slot12, slot13 in ipairs(slot1.operation_buff) do
		slot0.operationBuffList[#slot0.operationBuffList + 1] = slot13
	end

	slot0.airDominanceStatus = nil
	slot0.extraFlagList = {}

	for slot12, slot13 in ipairs(slot1.extra_flag_list) do
		table.insert(slot0.extraFlagList, slot13)
	end
end

slot0.retreat = function (slot0)
	if (slot0:findChapterCell(ChapterConst.AttachBoss) and slot1.flag == 1) or slot0:existOni() or slot0:isPlayingWithBombEnemy() then
		slot0.todayDefeatCount = slot0.todayDefeatCount + 1

		slot0:updateTodayDefeatCount()
	end

	slot0.active = false
	slot0.dueTime = nil
	slot0.cells = {}
	slot0.fleets = {}
	slot0.findex = 1
	slot0.champions = {}
	slot0.cellAttachments = {}
	slot0.round = 0
	slot0.airDominanceStatus = nil
end

slot0.clearSubChapter = function (slot0)
	slot0.expireTime = nil
	slot0.awardIndex = nil
end

slot0.existLoop = function (slot0)
	return pg.chapter_template_loop[slot0.id] ~= nil
end

slot0.canActivateLoop = function (slot0)
	return slot0:getRiskLevel() == 4 and slot0:isAllAchieve()
end

slot0.isLoop = function (slot0)
	return slot0.loopFlag == 1
end

slot0.getRound = function (slot0)
	return slot0.roundIndex % 2
end

slot0.getRoundNum = function (slot0)
	return math.floor(slot0.roundIndex / 2)
end

slot0.existMoveLimit = function (slot0)
	return slot0:getConfig("limit_move") == 1
end

slot0.getChapterCell = function (slot0, slot1, slot2)
	return Clone(slot0.cells[ChapterCell.Line2Name(slot1, slot2)])
end

slot0.findChapterCell = function (slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.cells) do
		if slot7.attachment == slot1 and (not slot2 or slot7.attachmentId == slot2) then
			return Clone(slot7)
		end
	end

	return nil
end

slot0.mergeChapterCell = function (slot0, slot1)
	slot3 = slot0:getChapterCell(slot1.row, slot1.column) == nil or slot2.attachment ~= slot1.attachment or slot2.attachmentId ~= slot1.attachmentId or (slot2.attachment == ChapterConst.AttachRival and slot2.rival.id ~= slot1.rival.id)

	if slot2 then
		slot2.attachment = slot1.attachment
		slot2.attachmentId = slot1.attachmentId
		slot2.flag = slot1.flag
		slot2.data = slot1.data
		slot2.rival = slot1.rival
		slot1 = slot2
	end

	if slot3 and ChapterConst.NeedMarkAsLurk(slot1) then
		slot1.trait = ChapterConst.TraitLurk
	end

	slot0:updateChapterCell(slot1)
end

slot0.updateChapterCell = function (slot0, slot1)
	slot0.cells[ChapterCell.Line2Name(slot1.row, slot1.column)] = Clone(slot1)
end

slot0.clearChapterCell = function (slot0, slot1, slot2)
	slot0.cells[ChapterCell.Line2Name(slot1, slot2)].attachment = ChapterConst.AttachNone
	slot0.cells[ChapterCell.Line2Name(slot1, slot2)].attachmentId = 0
	slot0.cells[ChapterCell.Line2Name(slot1, slot2)].flag = 0
	slot0.cells[ChapterCell.Line2Name(slot1, slot2)].data = 0
	slot0.cells[ChapterCell.Line2Name(slot1, slot2)].trait = ChapterConst.TraitNone
end

slot0.getShip = function (slot0, slot1)
	slot2 = nil

	for slot6 = 1, #slot0.fleets, 1 do
		if slot0.fleets[slot6]:getShip(slot1) then
			break
		end
	end

	return slot2
end

slot0.getShips = function (slot0)
	_.each(slot0.fleets, function (slot0)
		_.each(slot0:getShips(true), function (slot0)
			table.insert(slot0, Clone(slot0))
		end)
	end)

	return {}
end

slot0.getFirstValidIndex = function (slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.fleets) do
		if slot6:isValid() then
			slot1 = slot5

			break
		end
	end

	return slot1
end

slot0.getNextValidIndex = function (slot0)
	slot1 = 0

	for slot5 = slot0.findex + 1, #slot0.fleets, 1 do
		if slot0.fleets[slot5]:getFleetType() == FleetType.Normal and slot0.fleets[slot5]:isValid() then
			slot1 = slot5

			break
		end
	end

	if slot1 == 0 then
		for slot5 = 1, slot0.findex - 1, 1 do
			if slot0.fleets[slot5]:getFleetType() == FleetType.Normal and slot0.fleets[slot5]:isValid() then
				slot1 = slot5

				break
			end
		end
	end

	return slot1
end

slot0.shipInWartime = function (slot0, slot1)
	return _.any(slot0.fleets, function (slot0)
		return slot0.ships[slot0] ~= nil
	end)
end

slot0.existAmbush = function (slot0)
	return slot0:getDataType() == ChapterConst.TypeNone and slot0:getPlayType() == ChapterConst.TypeLagacy
end

slot0.getAmbushRate = function (slot0, slot1, slot2)
	slot5 = slot0:getConfig("investigation_ratio") / (slot0.getConfig("investigation_ratio") + slot1:getInvestSums()) / 4
	slot6 = (_.detect(slot0:getConfig("ambush_ratio_extra"), function (slot0)
		return slot0[1] == slot0.row and slot0[2] == slot0.column
	end) and slot6[3] / 10000) or 0
	slot8 = (_.detect(slot0:getConfig("ambush_ratio_extra"), function (slot0)
		return #slot0 == 1
	end) and _.detect(slot0.getConfig("ambush_ratio_extra"), function (slot0)
		return #slot0 == 1
	end)[1] / 10000) or 0
	slot8 = 0.05 + slot5 * math.max(slot1.step - 1, 0) + slot6 + slot8

	if slot6 + slot8 == 0 then
		slot8 = slot8 - slot1:getEquipAmbushRateReduce()
	end

	return math.clamp(slot8, 0, 1)
end

slot0.getAmbushDodge = function (slot0, slot1)
	slot2 = slot1.line
	slot5 = slot1:getDodgeSums() / (slot1.getDodgeSums() + slot0:getConfig("avoid_ratio"))
	slot6 = (_.detect(slot0:getConfig("ambush_ratio_extra"), function (slot0)
		return slot0[1] == slot0.row and slot0[2] == slot0.column
	end) and slot6[3] / 10000) or 0

	if slot6 == 0 then
		slot5 = slot5 + slot1:getEquipDodgeRateUp()
	end

	return math.clamp(slot5, 0, 1)
end

slot0.isValid = function (slot0)
	if slot0:getPlayType() == ChapterConst.TypeMainSub then
		return slot0.active or (slot0.expireTime and pg.TimeMgr.GetInstance():GetServerTime() < slot0.expireTime)
	end

	return true
end

slot0.inWartime = function (slot0)
	return slot0.dueTime and pg.TimeMgr.GetInstance():GetServerTime() < slot0.dueTime
end

slot0.getRemainTime = function (slot0)
	return (slot0.dueTime and math.max(slot0.dueTime - pg.TimeMgr.GetInstance():GetServerTime() - 1, 0)) or 0
end

slot0.getStartTime = function (slot0)
	return math.max(slot0.dueTime - slot0:getConfig("time"), 0)
end

slot0.setUnlock = function (slot0, slot1)
	slot0.unlock = slot1
end

slot0.isUnlock = function (slot0)
	return slot0.unlock
end

slot0.isClear = function (slot0)
	if slot0:getPlayType() == ChapterConst.TypeMainSub then
		return true
	else
		return slot0.progress >= 100
	end
end

slot0.existAchieve = function (slot0)
	return #slot0.achieves > 0
end

slot0.isAllAchieve = function (slot0)
	slot1 = 0

	for slot5, slot6 in ipairs(slot0.achieves) do
		if ChapterConst.IsAchieved(slot6) then
			slot1 = slot1 + 1
		end
	end

	return slot1 == #slot0.achieves
end

slot0.findPath = function (slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot8 = 0, ChapterConst.MaxRow - 1, 1 do
		if not slot4[slot8] then
			slot4[slot8] = {}
		end

		for slot12 = 0, ChapterConst.MaxColumn - 1, 1 do
			slot13 = PathFinding.PrioForbidden

			if slot0.cells[ChapterCell.Line2Name(slot8, slot12)] and slot15.walkable then
				slot13 = PathFinding.PrioNormal

				if slot15.row == slot3.row and slot15.column == slot3.column then
					if not slot0:considerAsStayPoint(slot1, slot15.row, slot15.column) then
						slot13 = PathFinding.PrioObstacle
					end
				elseif slot0:considerAsObstacle(slot1, slot15.row, slot15.column) then
					slot13 = PathFinding.PrioObstacle
				end
			end

			slot4[slot8][slot12] = slot13
		end
	end

	if slot1 == ChapterConst.SubjectPlayer then
		for slot9, slot10 in ipairs(slot5) do
			if slot10.row ~= slot3.row or slot10.column ~= slot3.column then
				slot4[slot10.row][slot10.column] = math.max(slot4[slot10.row][slot10.column], PathFinding.PrioObstacle)
			end
		end
	end

	slot0.pathFinder.cells = slot4

	return slot0.pathFinder:Find(slot2, slot3)
end

slot0.getWaveCount = function (slot0)
	slot1 = 0

	for slot5, slot6 in pairs(slot0.cells) do
		if slot6.attachment == ChapterConst.AttachEnemy and underscore.detect(slot0:getConfig("grids"), function (slot0)
			if slot0[1] == slot0.row and slot0[2] == slot0.column and (slot0[4] == ChapterConst.AttachElite or slot0[4] == ChapterConst.AttachEnemy) then
				return true
			end

			return false
		end) then
			slot1 = slot1 + 1
		end
	end

	slot3 = slot0:getConfig("elite_refresh")
	slot4 = 0

	for slot8, slot9 in pairs(slot2) do
		slot4 = slot4 + slot9

		if slot8 <= #slot3 then
			slot4 = slot4 + slot3[slot8]
		end

		if slot1 <= slot4 then
			return slot8
		end
	end

	return 1
end

slot0.bossRefreshed = function (slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		if slot5.attachment == ChapterConst.AttachBoss then
			return true
		end
	end

	return false
end

slot0.getFleetAmmo = function (slot0, slot1)
	slot2 = slot1:getShipAmmo()

	if slot1:getFleetType() == FleetType.Normal then
		slot2 = slot2 + slot0:getConfig("ammo_total")
	elseif slot3 == FleetType.Submarine then
		slot2 = slot2 + slot0:getConfig("ammo_submarine")
	end

	return slot2, slot1.restAmmo
end

slot0.getFleetStgs = function (slot0, slot1)
	slot2 = slot1:getStrategies()

	if slot0:getPlayType() == ChapterConst.TypeLagacy then
		slot2 = _.filter(slot2, function (slot0)
			return pg.strategy_data_template[slot0.id].type == ChapterConst.StgTypeForm or (slot1.type == ChapterConst.StgTypeConsume and slot1.id == ChapterConst.StrategyRepair) or slot1.id == ChapterConst.StrategyExchange
		end)
	end

	return slot2
end

slot0.getFleetStgIds = function (slot0, slot1)
	slot2 = {}
	slot3, slot4 = slot0:getFleetAmmo(slot1)

	if ChapterConst.AmmoRich <= slot4 then
		table.insert(slot2, ChapterConst.StrategyAmmoRich)
	elseif slot4 <= ChapterConst.AmmoPoor then
		table.insert(slot2, ChapterConst.StrategyAmmoPoor)
	end

	if #slot1.stgIds > 0 then
		_.each(slot1.stgIds, function (slot0)
			table.insert(slot0, slot0)
		end)
	end

	if OPEN_AIR_DOMINANCE and slot0:getConfig("air_dominance") > 0 then
		table.insert(slot2, slot0:getAirDominanceStg())
	end

	for slot8, slot9 in ipairs(slot0.extraFlagList) do
		table.insert(slot2, ChapterConst.KizunaJamming[slot9])
	end

	return slot2
end

slot0.getAirDominanceStg = function (slot0)
	slot1, slot2 = slot0:getAirDominanceValue()

	return ChapterConst.AirDominance[slot2].StgId
end

slot0.getAirDominanceValue = function (slot0)
	slot1 = 0
	slot2 = 0

	for slot6, slot7 in ipairs(slot0.fleets) do
		if slot7:isValid() then
			slot1 = slot1 + slot7:getFleetAirDominanceValue()
			slot2 = slot2 + slot7:getAntiAircraftSums()
		end
	end

	return slot1, calcAirDominanceStatus(slot1, slot0:getConfig("air_dominance"), slot2), slot0.airDominanceStatus
end

slot0.setAirDominanceStatus = function (slot0, slot1)
	slot0.airDominanceStatus = slot1
end

slot0.updateExtraFlags = function (slot0, slot1, slot2)
	slot3 = false

	for slot7, slot8 in ipairs(slot2) do
		for slot12, slot13 in ipairs(slot0.extraFlagList) do
			if slot13 == slot8 then
				table.remove(slot0.extraFlagList, slot12)

				slot3 = true

				break
			end
		end
	end

	for slot7, slot8 in ipairs(slot1) do
		if not table.contains(slot0.extraFlagList, slot8) then
			table.insert(slot0.extraFlagList, slot8)

			slot3 = true
		end
	end

	return slot3
end

slot0.getExtraFlags = function (slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.extraFlagList) do
		table.insert(slot1, ChapterConst.KizunaJamming[slot6])
	end

	return slot1
end

slot0.updateShipStg = function (slot0, slot1, slot2, slot3)
	slot0.fleet:updateShipStg(slot1, slot2, slot3)
end

slot0.getFleetBattleBuffs = function (slot0, slot1)
	_.each(slot0:getFleetStgIds(slot1), function (slot0)
		table.insert(slot0, pg.strategy_data_template[slot0].buff_id)
	end)

	return (slot0.buff_list and {
		unpack(slot0.buff_list)
	}) or {}, slot0:buildBattleBuffList(slot1)
end

slot0.buildBattleBuffList = function (slot0, slot1)
	slot2 = {}
	slot3, slot4 = slot0:triggerSkill(slot1, FleetSkill.TypeBattleBuff)

	if slot3 and #slot3 > 0 then
		slot5 = {}

		for slot9, slot10 in ipairs(slot3) do
			slot5[slot12] = slot5[slot1:findCommanderBySkillId(slot4[slot9].id)] or {}

			table.insert(slot5[slot12], slot10)
		end

		for slot9, slot10 in pairs(slot5) do
			table.insert(slot2, {
				slot9,
				slot10
			})
		end
	end

	for slot9, slot10 in pairs(slot5) do
		for slot15, slot16 in ipairs(slot11) do
			if #slot16:getBuffsAddition() > 0 then
				slot18 = nil

				for slot22, slot23 in ipairs(slot2) do
					if slot23[1] == slot10 then
						slot18 = slot23[2]

						break
					end
				end

				if not slot18 then
					table.insert(slot2, {
						slot10,
						{}
					})
				end

				for slot22, slot23 in ipairs(slot17) do
					table.insert(slot18, slot23)
				end
			end
		end
	end

	return slot2
end

slot0.updateShipHp = function (slot0, slot1, slot2)
	slot0.fleet:updateShipHp(slot1, slot2)
end

slot0.updateFleetShipHp = function (slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.fleets) do
		slot7:updateShipHp(slot1, slot2)

		if slot7.id ~= slot0.fleet.id then
			slot7:clearShipHpChange()
		end
	end
end

slot0.clearEliterFleetByIndex = function (slot0, slot1)
	if slot1 > #slot0.eliteFleetList then
		return
	end

	slot0.eliteFleetList[slot1] = {}
end

slot0.wrapEliteFleet = function (slot0, slot1)
	slot2 = {}
	slot3 = _.flatten(slot0:getEliteFleetList()[slot1])

	for slot7, slot8 in pairs(slot0:getEliteFleetCommanders()[slot1]) do
		table.insert(slot2, {
			pos = slot7,
			id = slot8
		})
	end

	return Fleet.New({
		id = 1,
		ship_list = slot3,
		commanders = slot2
	})
end

slot0.setEliteCommanders = function (slot0, slot1)
	slot0.eliteCommanderList = slot1
end

slot0.getEliteFleetCommanders = function (slot0)
	return slot0.eliteCommanderList
end

slot0.updateCommander = function (slot0, slot1, slot2, slot3)
	slot0.eliteCommanderList[slot1][slot2] = slot3
end

slot0.getEliteFleetList = function (slot0)
	return slot0.eliteFleetList
end

slot0.setEliteFleetList = function (slot0, slot1)
	slot0.eliteFleetList = slot1
end

slot0.IsEliteFleetLegal = function (slot0)
	slot1 = 0
	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5, slot6 = nil

	for slot10 = 1, #slot0.eliteFleetList, 1 do
		slot11, slot12 = slot0:singleEliteFleetVertify(slot10)

		if not slot11 then
			if not slot12 then
				if slot10 >= 3 then
					slot3 = slot3 + 1
				else
					slot1 = slot1 + 1
				end
			else
				slot5 = slot12
				slot6 = slot10
			end
		elseif slot10 >= 3 then
			slot4 = slot4 + 1
		else
			slot2 = slot2 + 1
		end
	end

	if slot1 == 2 then
		return false, i18n("elite_disable_no_fleet")
	elseif slot2 == 0 then
		return false, slot5
	elseif slot3 + slot4 < slot0:getConfig("submarine_num") then
		return false, slot5
	end

	slot11, slot8 = slot0:IsPropertyLimitationSatisfy()
	slot9 = 1

	for slot13, slot14 in ipairs(slot7) do
		slot9 = slot9 * slot14
	end

	if slot9 ~= 1 then
		return false, i18n("elite_disable_property_unsatisfied")
	end

	return true, slot6
end

slot0.IsPropertyLimitationSatisfy = function (slot0)
	slot1 = getProxy(BayProxy):getRawData()
	slot2 = {}

	for slot6, slot7 in ipairs(slot0:getConfig("property_limitation")) do
		slot2[slot7[1]] = 0
	end

	slot3 = 0

	for slot7 = 1, 2, 1 do
		if slot0:singleEliteFleetVertify(slot7) == true then
			for slot13, slot14 in ipairs(slot9) do
				slot3 = slot3 + 1
				slot16 = intProperties(slot1[slot14].getProperties(slot15))

				for slot20, slot21 in pairs(slot2) do
					if slot20 == "level" then
						slot2[slot20] = slot21 + slot15.level
					else
						slot2[slot20] = slot21 + slot16[slot20]
					end
				end
			end
		end
	end

	slot4 = {}

	for slot8, slot9 in ipairs(slot0:getConfig("property_limitation")) do
		slot11 = slot9[2]
		slot12 = slot9[3]
		slot13 = slot2[slot9[1]]

		if slot9[1] == "level" then
			if slot13 == 0 then
				slot2[slot10] = 0
			else
				slot2[slot10] = math.ceil(slot13 / slot3)
			end
		end

		slot13 = slot2[slot10]
		slot14 = 0

		if slot11 == -1 and slot13 < slot12 then
			slot14 = 1
		elseif slot11 == 1 and slot12 < slot13 then
			slot14 = 1
		end

		slot4[slot8] = slot14
	end

	return slot4, slot2
end

slot0.EliteShipTypeFilter = function (slot0, slot1)
	function slot2(slot0, slot1, slot2)
		slot3 = 0

		for slot7, slot8 in ipairs(slot1) do
			if slot8 == 0 then
				slot3 = slot3 + 1
			end
		end

		slot4 = {}

		for slot8, slot9 in ipairs(slot1) do
			if type(slot9) == "string" then
				for slot14, slot15 in ipairs(slot10) do
					slot4[#slot4 + 1] = slot15
				end
			end
		end

		for slot8, slot9 in ipairs(slot4) do
			slot1[#slot1 + 1] = slot9
		end

		for slot8, slot9 in pairs(slot2) do
			if table.contains(slot1, slot8:getShipType()) then
				for slot14, slot15 in ipairs(slot1) do
					if slot15 == slot10 then
						slot0 = slot14

						break
					end
				end

				table.remove(slot1, slot0)
			elseif slot3 - 1 < 0 then
				slot11 = nil

				for slot15, slot16 in ipairs(slot0) do
					if slot16 == slot9 then
						slot11 = slot15

						break
					end
				end

				table.remove(slot0, slot11)
			end
		end
	end

	for slot6, slot7 in ipairs(slot0:getConfig("limitation")) do
		slot8 = getProxy(BayProxy):getRawData()
		slot10 = {}
		slot11 = {}
		slot12 = {}

		for slot16, slot17 in ipairs(slot9) do
			if slot8[slot17].getTeamType(slot18) == TeamType.Main then
				slot10[slot18] = slot17
			elseif slot19 == TeamType.Vanguard then
				slot11[slot18] = slot17
			elseif slot19 == TeamType.Submarine then
				slot12[slot18] = slot17
			end
		end

		slot2(slot9, slot7[1], slot10)
		slot2(slot9, slot7[2], slot11)
		slot2(slot9, {
			0,
			0,
			0
		}, slot12)
	end
end

slot0.singleEliteFleetVertify = function (slot0, slot1)
	slot2 = getProxy(BayProxy):getRawData()
	slot4 = slot0:getConfig("limitation")

	if #slot0.eliteFleetList[slot1] == 0 then
		return false
	else
		slot5 = 0
		slot6 = 0
		slot7 = {}

		for slot11, slot12 in ipairs(slot3) do
			if slot2[slot12].inEvent then
				return false, i18n("elite_disable_ship_escort")
			end

			if slot13:getTeamType() == TeamType.Main then
				slot5 = slot5 + 1
			elseif slot14 == TeamType.Vanguard then
				slot6 = slot6 + 1
			end

			slot7[#slot7 + 1] = slot13:getShipType()
		end

		if slot1 >= 3 then
		elseif slot5 * slot6 == 0 and slot5 + slot6 ~= 0 then
			return false
		else
			slot8 = 1

			for slot12, slot13 in ipairs(slot4[slot1]) do
				slot14 = 0
				slot15 = 0

				for slot19, slot20 in ipairs(slot13) do
					if type(slot20) == "number" then
						slot14 = slot14 + slot20

						if slot20 ~= 0 and table.contains(slot7, slot20) then
							slot15 = 1
						end
					elseif type(slot20) == "string" then
						slot14 = slot14 + 1
						slot21 = Clone(ShipType.BundleList[slot20])

						if _.any(slot7, function (slot0)
							return table.contains(slot0, slot0)
						end) then
							slot15 = 1
						end
					end
				end

				if slot14 == 0 then
					slot15 = 1
				end

				slot8 = slot8 * slot15
			end

			if slot8 == 0 then
				return false, i18n("elite_disable_formation_unsatisfied")
			end
		end
	end

	return true
end

slot0.getDragExtend = function (slot0)
	slot1 = slot0.theme
	slot2 = 99999999
	slot3 = 99999999
	slot4 = 0
	slot5 = 0

	for slot9, slot10 in pairs(slot0.cells) do
		if slot10.row < slot2 then
			slot2 = slot10.row
		end

		if slot4 < slot10.row then
			slot4 = slot10.row
		end

		if slot10.column < slot3 then
			slot3 = slot10.column
		end

		if slot5 < slot10.column then
			slot5 = slot10.column
		end
	end

	return math.max(10 * slot1.cellSize + slot1.cellSpace.x - math.max((slot5 - (slot5 + slot3) * 0.5 - 0) * slot1.cellSize + slot1.cellSpace.x, 0), 0), math.max((slot5 - (slot5 + slot3) * 0.5 - 0) * slot1.cellSize + slot1.cellSpace.x, 0), math.max((ChapterConst.MaxRow * 0.5 - slot2) * slot1.cellSize + slot1.cellSpace.y, 0), math.max((slot4 - ChapterConst.MaxRow * 0.5) * slot1.cellSize + slot1.cellSpace.y, 0)
end

slot0.getPoisonArea = function (slot0, slot1)
	slot2 = {}
	slot4 = math.floor(slot0.theme.cellSize + slot0.theme.cellSpace.x * slot1)
	slot5 = math.floor(slot0.theme.cellSize + slot0.theme.cellSpace.y * slot1)

	for slot9, slot10 in pairs(slot0.cells) do
		if slot10:checkHadFlag(ChapterConst.FlagPoison) then
			slot2[slot9] = {
				x = math.floor(slot4 * slot10.column),
				y = math.floor(slot5 * slot10.row),
				w = slot4,
				h = slot5
			}
		end
	end

	return slot2
end

slot0.selectFleets = function (slot0, slot1, slot2)
	slot3 = Clone(slot1) or {}

	for slot7 = #slot3, 1, -1 do
		if not slot2[slot3[slot7]] or not slot8:isUnlock() or slot8:isLegalToFight() ~= true then
			table.remove(slot3, slot7)
		end
	end

	slot6 = slot0:getConfig("submarine_num")

	for slot10 = #({
		[FleetType.Normal] = _.filter(slot3, function (slot0)
			return slot0[slot0]:getFleetType() == FleetType.Normal
		end),
		[FleetType.Submarine] = _.filter(slot3, function (slot0)
			return slot0[slot0]:getFleetType() == FleetType.Submarine
		end)
	})[FleetType.Normal], slot0:getConfig("group_num") + 1, -1 do
		table.remove(slot4[FleetType.Normal], slot10)
	end

	for slot10 = #slot4[FleetType.Submarine], slot6 + 1, -1 do
		table.remove(slot4[FleetType.Submarine], slot10)
	end

	for slot10, slot11 in pairs(slot4) do
		if #slot11 == 0 then
			slot12 = 0

			if slot10 == FleetType.Normal then
				slot12 = slot5
			elseif slot10 == FleetType.Submarine then
				slot12 = slot6
			end

			for slot16, slot17 in pairs(slot2) do
				if slot12 <= #slot11 then
					break
				end

				if slot17 and slot17:getFleetType() == slot10 and slot17:isUnlock() and slot17:isLegalToFight() == true then
					table.insert(slot11, slot16)
				end
			end
		end
	end

	slot3 = {}

	for slot10, slot11 in pairs(slot4) do
		for slot15, slot16 in ipairs(slot11) do
			table.insert(slot3, slot16)
		end
	end

	table.sort(slot3, function (slot0, slot1)
		return slot0 < slot1
	end)

	return slot3
end

slot0.isEliteChapter = function (slot0)
	return Map.New({
		id = slot0:getConfig("map")
	}).getConfig(slot2, "type") == Map.ELITE
end

slot0.getInEliteShipIDs = function (slot0)
	slot1 = {}

	for slot5, slot6 in ipairs(slot0.eliteFleetList) do
		for slot10, slot11 in ipairs(slot6) do
			slot1[#slot1 + 1] = slot11
		end
	end

	return slot1
end

slot0.isActivity = function (slot0)
	return Map.New({
		id = slot0:getConfig("map")
	}):isActivity()
end

slot0.activeAlways = function (slot0)
	if slot0:isActivity() and type(pg.activity_template[slot0:getConfig("act_id")].config_client) == "table" then
		return table.contains(slot2.config_client.prevs or {}, slot0.id)
	end

	return false
end

slot0.getPrevChapterName = function (slot0)
	slot1 = ""

	if slot0:getConfig("pre_chapter") ~= 0 then
		slot1 = slot0:bindConfigTable()[slot2].chapter_name
	end

	return slot1
end

slot0.getMapType = function (slot0)
	return pg.expedition_data_by_map[slot0:getConfig("map")].type
end

slot0.getMaxColumnByRow = function (slot0, slot1)
	slot2 = -1

	for slot6, slot7 in pairs(slot0.cells) do
		if slot7.row == slot1 then
			slot2 = math.max(slot2, slot7.column)
		end
	end

	return slot2
end

slot0.withNpc = function (slot0)
	_.any(slot0.fleets, function (slot0)
		if slot0.npcShip then
			slot0 = _.detect(slot0:getShips(true), function (slot0)
				return slot0.id == slot0.npcShip.id
			end)
		end

		return slot0 ~= nil
	end)

	return Clone(nil)
end

slot0.getDefeatStory = function (slot0, slot1)
	if #slot0:getConfig("defeat_story_count") <= 0 then
		return nil
	end

	slot4 = slot3

	while slot4 > 0 do
		if slot2[slot4] <= slot1 then
			break
		end

		slot4 = slot4 - 1
	end

	return slot0:getConfig("defeat_story")[slot4]
end

slot0.getFleet = function (slot0, slot1, slot2, slot3)
	return _.detect(slot0.fleets, function (slot0)
		return slot0.line.row == slot0 and slot0.line.column ==  and (not slot2 or slot0:getFleetType() == slot0) and slot0:isValid()
	end) or _.detect(slot0.fleets, function (slot0)
		return slot0.line.row == slot0 and slot0.line.column ==  and (not slot2 or slot0:getFleetType() == slot0)
	end)
end

slot0.getFleetIndex = function (slot0, slot1, slot2, slot3)
	if slot0:getFleet(slot1, slot2, slot3) then
		return table.indexof(slot0.fleets, slot4)
	end
end

slot0.getOni = function (slot0)
	return _.detect(slot0.champions, function (slot0)
		return slot0.attachment == ChapterConst.AttachOni
	end)
end

slot0.getChampion = function (slot0, slot1, slot2)
	return _.detect(slot0.champions, function (slot0)
		return slot0.row == slot0 and slot0.column ==  and slot0.flag ~= 1
	end) or _.detect(slot0.champions, function (slot0)
		return slot0.row == slot0 and slot0.column == 
	end)
end

slot0.getChampionIndex = function (slot0, slot1, slot2)
	if slot0:getChampion(slot1, slot2) then
		return table.indexof(slot0.champions, slot3)
	end
end

slot0.getChampionVisibility = function (slot0, slot1, slot2, slot3)
	slot2 = slot2 or slot1.row
	slot3 = slot3 or slot1.column
	slot4 = true

	if slot1:getFleetType() == FleetType.Submarine then
		slot4 = _.any(slot0.fleets, function (slot0)
			return slot0:getFleetType() == FleetType.Submarine and _.any(slot0:getHuntingRange(), function (slot0)
				return slot0.row == slot0 and slot0.column == 
			end)
		end)
	end

	return slot4
end

slot0.mergeChampion = function (slot0, slot1)
	if slot0:getChampionIndex(slot1.row, slot1.column) then
		slot0.champions[slot2] = slot1
	else
		slot1.trait = ChapterConst.TraitLurk

		table.insert(slot0.champions, slot1)
	end
end

slot0.considerAsObstacle = function (slot0, slot1, slot2, slot3)
	if not slot0:getChapterCell(slot2, slot3) or not slot4.walkable then
		return true
	end

	if slot0:existBarrier(slot2, slot3) then
		return true
	end

	if slot1 == ChapterConst.SubjectPlayer then
		if slot4.flag == 0 then
			if slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachBoss or slot4.attachment == ChapterConst.AttachRival or slot4.attachment == ChapterConst.AttachAreaBoss or slot4.attachment == ChapterConst.AttachBomb_Enemy then
				return true
			end

			if slot4.attachment == ChapterConst.AttachBox and pg.box_data_template[slot4.attachmentId].type == ChapterConst.BoxTorpedo then
				return true
			end

			if slot4.attachment == ChapterConst.AttachStory then
				return true
			end
		end

		if slot0:existChampion(slot2, slot3) then
			return true
		end
	elseif slot1 == ChapterConst.SubjectChampion and slot0:existFleet(FleetType.Normal, slot2, slot3) then
		return true
	end

	return false
end

slot0.considerAsStayPoint = function (slot0, slot1, slot2, slot3)
	if not slot0:getChapterCell(slot2, slot3) or not slot4.walkable then
		return false
	end

	if slot0:existBarrier(slot2, slot3) then
		return false
	end

	if slot1 == ChapterConst.SubjectPlayer then
		if slot4.flag == 0 and slot4.attachment == ChapterConst.AttachStory then
			return true
		end

		if slot0:existFleet(FleetType.Normal, slot2, slot3) then
			return false
		end

		if slot0:existOni(slot2, slot3) then
			return false
		end

		if slot0:existBombEnemy(slot2, slot3) then
			return false
		end
	elseif slot1 == ChapterConst.SubjectChampion then
		if slot4.flag ~= 1 and slot4.attachment ~= ChapterConst.AttachNone then
			return false
		end

		if slot0:getChampion(slot2, slot3) and slot5.flag ~= 1 then
			return false
		end
	end

	return true
end

slot0.existAny = function (slot0, slot1, slot2)
	if slot0:getChapterCell(slot1, slot2).attachment ~= ChapterConst.AttachNone and slot3.flag == 0 then
		return true
	end

	if slot0:existFleet(nil, slot1, slot2) then
		return true
	end

	if slot0:existChampion(slot1, slot2) then
		return true
	end
end

slot0.existBarrier = function (slot0, slot1, slot2)
	return (slot0:getChapterCell(slot1, slot2).attachment == ChapterConst.AttachBox and slot3.flag == 0 and pg.box_data_template[slot3.attachmentId].type == ChapterConst.BoxBarrier) or (slot3.attachment == ChapterConst.AttachStory and slot3.flag == 3 and pg.map_event_template[slot3.attachmentId].type == ChapterConst.StoryObstacle)
end

slot0.existEnemy = function (slot0, slot1, slot2, slot3)
	if slot1 == ChapterConst.SubjectPlayer then
		if slot0:getChapterCell(slot2, slot3) and slot4.flag == 0 and (slot4.attachment == ChapterConst.AttachAmbush or slot4.attachment == ChapterConst.AttachEnemy or slot4.attachment == ChapterConst.AttachElite or slot4.attachment == ChapterConst.AttachBoss or slot4.attachment == ChapterConst.AttachRival or slot4.attachment == ChapterConst.AttachAreaBoss or slot4.attachment == ChapterConst.AttachBomb_Enemy) then
			return true, slot4.attachment
		end

		if slot0:existChampion(slot2, slot3) then
			return true, ChapterConst.AttachChampion
		end
	elseif slot1 == ChapterConst.SubjectChampion and (slot0:existFleet(FleetType.Normal, slot2, slot3) or slot0:existFleet(FleetType.Transport, slot2, slot3)) then
		return true
	end
end

slot0.existFleet = function (slot0, slot1, slot2, slot3)
	if _.any(slot0.fleets, function (slot0)
		return slot0.line.row == slot0 and slot0.line.column ==  and (not slot2 or slot0:getFleetType() == slot0) and slot0:isValid()
	end) then
		return true
	end
end

slot0.existChampion = function (slot0, slot1, slot2)
	if _.any(slot0.champions, function (slot0)
		return slot0.flag == 0 and slot0.row == slot0 and slot0.column ==  and slot2:getChampionVisibility(slot0)
	end) then
		return true
	end
end

slot0.existAlly = function (slot0, slot1)
	return _.any(slot0.fleets, function (slot0)
		return slot0.id ~= slot0.id and slot0.line.row == slot0.line.row and slot0.line.column == slot0.line.column and slot0:isValid()
	end)
end

slot0.existOni = function (slot0, slot1, slot2)
	return _.any(slot0.champions, function (slot0)
		return slot0.attachment == ChapterConst.AttachOni and slot0.flag == 0 and (not slot0 or slot0 == slot0.row) and (not slot1 or slot1 == slot0.column)
	end)
end

slot0.existBombEnemy = function (slot0, slot1, slot2)
	if slot1 and slot2 then
		return slot0:getChapterCell(slot1, slot2).attachment == ChapterConst.AttachBomb_Enemy and slot3.flag == 0
	end

	for slot6, slot7 in pairs(slot0.cells) do
		if slot7.attachment == ChapterConst.AttachBomb_Enemy and slot7.flag == 0 and (not slot1 or slot1 == slot7.row) and (not slot2 or slot2 == slot7.column) then
			return true
		end
	end

	return false
end

slot0.isPlayingWithBombEnemy = function (slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		if slot5.attachment == ChapterConst.AttachBomb_Enemy then
			return true
		end
	end

	return false
end

slot0.existCoastalGunNoMatterLiveOrDead = function (slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		if slot5.attachment == ChapterConst.AttachLandbase and pg.land_based_template[slot5.attachmentId].type == ChapterConst.LBCoastalGun then
			return true
		end
	end

	return false
end

slot0.calcWalkableCells = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	for slot9 = 0, ChapterConst.MaxRow - 1, 1 do
		if not slot5[slot9] then
			slot5[slot9] = {}
		end

		for slot13 = 0, ChapterConst.MaxColumn - 1, 1 do
			slot5[slot9][slot13] = slot0.cells[ChapterCell.Line2Name(slot9, slot13)] and slot15.walkable
		end
	end

	slot6 = {}

	if slot1 == ChapterConst.SubjectPlayer then
		for slot11, slot12 in ipairs(slot7) do
			slot6[slot12.row .. "_" .. slot12.column] = true
		end
	end

	slot7 = {}
	slot8 = {
		{
			step = 0,
			row = slot2,
			column = slot3
		}
	}
	slot9 = {}

	while #slot8 > 0 do
		table.insert(slot9, slot10)
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
			slot0.row = slot0.row + slot0.row
			slot0.column = slot0.column + slot0.column
			slot0.step = slot0.step + 1

			if slot0.row >= 0 and slot0.row < ChapterConst.MaxRow and slot0.column >= 0 and slot0.column < ChapterConst.MaxColumn and slot0.step <=  and not (_.any(slot2, function (slot0)
				return slot0.row == slot0.row and slot0.column == slot0.column
			end) or _.any(slot3, function (slot0)
				return slot0.row == slot0.row and slot0.column == slot0.column
			end)) and slot4[slot0.row][slot0.column] then
				table.insert(slot5, slot0)

				if not slot6:existEnemy(slot7, slot0.row, slot0.column) and not slot6:existBarrier(slot0.row, slot0.column) and not slot8[slot0.row .. "_" .. slot0.column] then
					table.insert(table.insert, slot0)
				end
			end
		end)
	end

	return _.filter(slot7, function (slot0)
		return (slot0.row == slot0 and slot0.column == ) or slot2:considerAsStayPoint(slot3, slot0.row, slot0.column)
	end)
end

slot0.calcAreaCells = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	for slot9 = 0, ChapterConst.MaxRow - 1, 1 do
		if not slot5[slot9] then
			slot5[slot9] = {}
		end

		for slot13 = 0, ChapterConst.MaxColumn - 1, 1 do
			slot5[slot9][slot13] = slot0.cells[ChapterCell.Line2Name(slot9, slot13)] and slot15.walkable
		end
	end

	slot6 = {}
	slot7 = {
		{
			step = 0,
			row = slot1,
			column = slot2
		}
	}
	slot8 = {}

	while #slot7 > 0 do
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
			slot0.row = slot0.row + slot0.row
			slot0.column = slot0.column + slot0.column
			slot0.step = slot0.step + 1

			if slot0.row >= 0 and slot0.row < ChapterConst.MaxRow and slot0.column >= 0 and slot0.column < ChapterConst.MaxColumn and slot0.step <=  and not (_.any(slot2, function (slot0)
				return slot0.row == slot0.row and slot0.column == slot0.column
			end) or _.any(slot3, function (slot0)
				return slot0.row == slot0.row and slot0.column == slot0.column
			end)) then
				table.insert(table.insert, slot0)

				if slot4[slot0.row][slot0.column] and slot5 <= slot0.step then
					table.insert(slot6, slot0)
				end
			end
		end)
	end

	return slot6
end

slot0.calcSquareBarrierCells = function (slot0, slot1, slot2, slot3)
	slot4 = {}

	for slot8 = -slot3, slot3, 1 do
		for slot12 = -slot3, slot3, 1 do
			if slot0:getChapterCell(slot1 + slot8, slot2 + slot12) and slot15.walkable and (slot0:existBarrier(slot13, slot14) or not slot0:existAny(slot13, slot14)) then
				table.insert(slot4, {
					row = slot13,
					column = slot14
				})
			end
		end
	end

	return slot4
end

slot0.checkAnyInteractive = function (slot0)
	slot2 = slot0:getChapterCell(slot0.fleet.line.row, slot0.fleet.line.column)
	slot3 = false

	if slot0.fleet:getFleetType() == FleetType.Normal then
		if slot0:existEnemy(ChapterConst.SubjectPlayer, slot2.row, slot2.column) then
			if slot0:getRound() == ChapterConst.RoundPlayer then
				slot3 = true
			end
		elseif slot2.attachment == ChapterConst.AttachAmbush or slot2.attachment == ChapterConst.AttachBox then
			if slot2.flag ~= 1 then
				slot3 = true
			end
		elseif slot2.attachment == ChapterConst.AttachStory then
			slot3 = slot2.flag == 0
		elseif slot2.attachment == ChapterConst.AttachSupply and slot2.attachmentId > 0 then
			slot4, slot5 = slot0:getFleetAmmo(slot0.fleet)

			if slot5 < slot4 then
				slot3 = true
			end
		end
	end

	return slot3
end

slot0.calcAttachmenArea = function (slot0, slot1)
	slot2 = slot0.theme
	slot3 = ChapterConst.MaxRow + 1
	slot4 = -1
	slot5 = ChapterConst.MaxColumn + 1
	slot6 = -1

	for slot10, slot11 in pairs(slot0.cells) do
		if slot11.attachment == slot1 then
			slot3 = math.min(slot3, slot11.row)
			slot4 = math.max(slot4, slot11.row)
			slot5 = math.min(slot5, slot11.column)
			slot6 = math.max(slot6, slot11.column)
		end
	end

	slot8 = Vector2(slot6 - slot5 + 1, slot4 - slot3 + 1)
	slot8.x = slot8.x * (slot2.cellSize.x + slot2.cellSpace.x) - slot2.cellSpace.x
	slot8.y = slot8.y * (slot2.cellSize.y + slot2.cellSpace.y) - slot2.cellSpace.y

	return slot3, slot4, slot5, slot6, Vector2((slot5 - slot6) * 0.5 * (slot2.cellSize.x + slot2.cellSpace.x), (slot4 - slot3) * 0.5 * (slot2.cellSize.y + slot2.cellSpace.y)), slot8
end

slot0.getQuadCellPic = function (slot0, slot1)
	slot2 = nil

	if slot1.trait == ChapterConst.TraitLurk then
	elseif slot1.attachment == ChapterConst.AttachRival then
		slot2 = "cell_enemy"
	elseif (slot1.attachment == ChapterConst.AttachEnemy or slot1.attachment == ChapterConst.AttachElite or slot1.attachment == ChapterConst.AttachAmbush or slot1.attachment == ChapterConst.AttachBoss or slot1.attachment == ChapterConst.AttachRival or slot1.attachment == ChapterConst.AttachAreaBoss or slot1.attachment == ChapterConst.AttachBomb_Enemy) and slot1.flag == 0 then
		slot2 = (pg.expedition_data_template[slot1.attachmentId].icon_type == 2 and "cell_escort") or "cell_enemy"
	elseif slot1.attachment == ChapterConst.AttachBox and slot1.flag == 0 then
		if pg.box_data_template[slot1.attachmentId].type == ChapterConst.BoxDrop or slot3.type == ChapterConst.BoxStrategy or slot3.type == ChapterConst.BoxSupply or slot3.type == ChapterConst.BoxEnemy then
			slot2 = "cell_box"
		elseif slot3.type == ChapterConst.BoxTorpedo then
			slot2 = "cell_enemy"
		elseif slot3.type == ChapterConst.BoxBarrier then
			slot2 = "cell_green"
		end
	elseif slot1.attachment == ChapterConst.AttachStory and slot1.data == ChapterConst.Story then
		if slot1.flag == 0 and pg.map_event_template[slot1.attachmentId].icon == "mapevent1" then
			slot2 = "cell_box"
		end
	elseif slot1.attachment == ChapterConst.AttachSupply and slot1.attachmentId > 0 then
		slot2 = "cell_box"
	elseif slot1.attachment == ChapterConst.AttachTransport_Target then
		slot2 = "cell_box"
	end

	return slot2
end

slot0.getMapShip = function (slot0, slot1)
	slot2 = nil

	if slot0:getDataType() == ChapterConst.TypeNone then
		if slot1:isValid() and not _.detect(slot1:getShips(false), function (slot0)
			return slot0.isNpc and slot0.hpRant > 0
		end) then
			if slot1:getFleetType() == FleetType.Normal then
				slot2 = slot1:getShipsByTeam(TeamType.Main, false)[1]
			elseif slot4 == FleetType.Submarine then
				slot2 = slot1:getShipsByTeam(TeamType.Submarine, false)[1]
			end
		end
	elseif slot3 == ChapterConst.TypeSham then
		slot2 = slot1[TeamType.Main][1]
	elseif slot3 == ChapterConst.TypeGuild then
		slot2 = slot1[TeamType.Main][1]
	end

	return slot2
end

slot0.getTorpedoShip = function (slot0, slot1)
	slot2 = nil

	if slot1:getFleetType() == FleetType.Submarine then
		slot2 = slot1:getShipsByTeam(TeamType.Submarine, false)[1]
	elseif slot1:getFleetType() == FleetType.Normal then
		slot2 = _.detect(slot1:getShipsByTeam(TeamType.Vanguard, false), function (slot0)
			return slot0:getShipType() == ShipType.QuZhu
		end)
	end

	return slot2
end

slot0.getCVship = function (slot0, slot1)
	slot2 = nil

	if slot1:getFleetType() == FleetType.Normal then
		slot2 = _.detect(slot1:getShipsByTeam(TeamType.Main, false), function (slot0)
			return table.contains(ShipType.BundleList[ShipType.BundleAircraftCarrier], slot0:getShipType())
		end)
	end

	return slot2
end

slot0.getBBship = function (slot0, slot1)
	slot2 = nil

	if slot1:getFleetType() == FleetType.Normal then
		slot2 = _.detect(slot1:getShipsByTeam(TeamType.Main, false), function (slot0)
			return table.contains(ShipType.BundleList[ShipType.BundleBattleShip], slot0:getShipType())
		end)
	end

	return slot2
end

slot0.GetSubmarineFleet = function (slot0)
	for slot4, slot5 in pairs(slot0.fleets) do
		if slot5:getFleetType() == FleetType.Submarine and slot5:isValid() then
			return slot5, slot4
		end
	end
end

slot0.getStageCell = function (slot0, slot1, slot2)
	if slot0:getChampion(slot1, slot2) and slot3.flag ~= 1 then
		return slot3
	end

	if slot0:getChapterCell(slot1, slot2) and slot4.flag ~= 1 then
		return slot4
	end
end

slot0.getStageId = function (slot0, slot1, slot2)
	if slot0:getChampion(slot1, slot2) and slot3.flag ~= 1 then
		return slot3.id
	end

	if slot0:getChapterCell(slot1, slot2) and slot4.flag ~= 1 then
		return slot4.attachmentId
	end
end

slot0.getStageExtraAwards = function (slot0)
	if slot0:getPlayType() == ChapterConst.TypeMainSub and pg.expedition_data_by_map[_.filter(pg.expedition_data_by_map.all, function (slot0)
		return type(pg.expedition_data_by_map[slot0].drop_by_map_display) == "table" and #slot1 > 0
	end)[math.min(#_.filter(pg.expedition_data_by_map.all, function (slot0)
		return type(pg.expedition_data_by_map[slot0].drop_by_map_display) == "table" and #slot1 > 0
	end), slot0.awardIndex)]] then
		return slot2.drop_by_map_display[table.indexof(slot1, slot0:getConfig("map"))]
	end
end

slot0.GetExtraCostRate = function (slot0)
	return math.max(1, 1), {}
end

slot0.getFleetCost = function (slot0, slot1)
	if slot0:getPlayType() == ChapterConst.TypeExtra then
		return {
			gold = 0,
			oil = 0
		}, {
			gold = 0,
			oil = 0
		}
	end

	return slot1:getCost(slot0:GetExtraCostRate())
end

slot0.writeDrops = function (slot0, slot1)
	_.each(slot1, function (slot0)
		if slot0.dropType == DROP_TYPE_SHIP and not table.contains(slot0.dropShipIdList, slot0.id) then
			table.insert(slot0.dropShipIdList, slot0.id)
		end
	end)
end

slot0.writeBack = function (slot0, slot1, slot2)
	function slot4(slot0)
		if slot0.statistics[slot0.id] then
			slot0.hpRant = slot1.bp
		end
	end

	for slot8, slot9 in pairs(slot0.fleet.ships) do
		slot4(slot9)
	end

	slot3.restAmmo = math.max(slot3.restAmmo - 1, 0)

	if slot2.statistics.submarineAid then
		if _.detect(slot0.fleets, function (slot0)
			return slot0:getFleetType() == FleetType.Submarine and slot0:isValid()
		end) and not slot5:inHuntingRange(slot3.line.row, slot3.line.column) then
			slot5:consumeOneStrategy(ChapterConst.StrategyCallSubOutofRange)
		end

		if slot5 then
			for slot9, slot10 in pairs(slot5.ships) do
				slot4(slot10)
			end

			slot5.restAmmo = math.max(slot5.restAmmo - 1, 0)
		end
	end

	if slot1 then
		slot5 = nil

		if _.detect(slot0.champions, function (slot0)
			return slot0.id == slot0.stageId and slot0.row == slot1.line.row and slot0.column == slot1.line.column and slot0.flag ~= 1
		end) then
			slot6.flag = 1
			slot5 = slot6.attachment
		else
			slot7 = slot0:getChapterCell(slot3.line.row, slot3.line.column)
			slot7.flag = 1

			slot0:updateChapterCell(slot7)

			slot5 = slot7.attachment
		end

		if slot5 == ChapterConst.AttachEnemy or slot5 == ChapterConst.AttachElite or slot5 == ChapterConst.AttachChampion then
			if _.detect(slot0.achieves, function (slot0)
				return slot0.type == ChapterConst.AchieveType2
			end) then
				slot7.count = slot7.count + 1
			end
		elseif slot5 == ChapterConst.AttachBoss then
			_.each(slot0.achieves, function (slot0)
				if slot0.type == ChapterConst.AchieveType1 then
					slot0.count = slot0.count + 1
				elseif slot0.type == ChapterConst.AchieveType3 then
					if _.all(_.values(slot0.cells), function (slot0)
						if slot0.attachment == ChapterConst.AttachEnemy or slot0.attachment == ChapterConst.AttachElite or slot0.attachment == ChapterConst.AttachBoss or (slot0.attachment == ChapterConst.AttachBox and pg.box_data_template[slot0.attachmentId].type == ChapterConst.BoxEnemy) then
							return slot0.flag == 1
						end

						return true
					end) and _.all(slot0.champions, function (slot0)
						return slot0.flag == 1
					end) then
						slot0.count = slot0.count + 1
					end
				elseif slot0.type == ChapterConst.AchieveType4 then
					if #slot0:getShips() <= slot0.config then
						slot0.count = slot0.count + 1
					end
				elseif slot0.type == ChapterConst.AchieveType5 and not _.any(slot0:getShips(), function (slot0)
					return slot0:getShipType() == slot0.config
				end) then
					slot0.count = slot0.count + 1
				end
			end)

			if slot0.progress == 100 then
				slot0.passCount = slot0.passCount + 1
			end

			slot0.progress = math.min(slot0.progress + slot0:getConfig("progress_boss"), 100)
			slot0.defeatCount = slot0.defeatCount + 1
		end

		if slot0:getPlayType() == ChapterConst.TypeMainSub and slot5 == ChapterConst.AttachBoss and slot2.statistics._battleScore == ys.Battle.BattleConst.BattleScore.S then
			getProxy(ChapterProxy).subProgress = math.max(getProxy(ChapterProxy).subProgress, table.indexof(slot7, slot0:getConfig("map")) + 1)
		end
	end
end

slot0.triggerSkill = function (slot0, slot1, slot2)
	return _.reduce(slot3, nil, function (slot0, slot1)
		slot3 = slot1:GetArgs()

		if slot1:GetType() == FleetSkill.TypeMoveSpeed or slot2 == FleetSkill.TypeHuntingLv or slot2 == FleetSkill.TypeTorpedoPowerUp then
			return (slot0 or 0) + slot3[1]
		elseif slot2 == FleetSkill.TypeAmbushDodge or slot2 == FleetSkill.TypeAirStrikeDodge then
			return math.max(slot0 or 0, slot3[1])
		elseif slot2 == FleetSkill.TypeAttack or slot2 == FleetSkill.TypeStrategy then
			table.insert(slot0 or {}, slot3)

			return slot0 or 
		elseif slot2 == FleetSkill.TypeBattleBuff then
			table.insert(slot0 or {}, slot3[1])

			return slot0 or 
		end
	end), _.filter(slot1:findSkills(slot2), function (slot0)
		return _.any(slot1, function (slot0)
			return slot0[1] == FleetSkill.TriggerInSubTeam and slot0[2] == 1
		end) == slot0:getFleetType() == FleetType.Submarine and _.all(slot0:GetTriggers(), function (slot0)
			return slot0:triggerCheck(slot0.triggerCheck, slot0, slot0)
		end)
	end)
end

slot0.triggerCheck = function (slot0, slot1, slot2, slot3)
	if slot3[1] == FleetSkill.TriggerDDCount then
		return slot3[2] <= #_.filter(slot5, function (slot0)
			return slot0:getShipType() == ShipType.QuZhu
		end) and slot6 <= slot3[3]
	elseif slot4 == FleetSkill.TriggerDDHead then
		return #slot1:getShipsByTeam(TeamType.Vanguard, false) > 0 and slot5[1]:getShipType() == ShipType.QuZhu
	elseif slot4 == FleetSkill.TriggerVanCount then
		return slot3[2] <= #slot1:getShipsByTeam(TeamType.Vanguard, false) and #slot5 <= slot3[3]
	elseif slot4 == FleetSkill.TriggerShipCount then
		return slot3[3] <= #_.filter(slot1:getShips(false), function (slot0)
			return table.contains(slot0[2], slot0:getShipType())
		end) and #slot5 <= slot3[4]
	else
		if slot4 == FleetSkill.TriggerAroundEnemy then
			slot5 = {
				row = slot1.line.row,
				column = slot1.line.column
			}

			return _.any(_.values(slot0.cells), function (slot0)
				return ManhattonDist(not slot0:existOni(slot0.row, slot0.column) and not slot0:existBombEnemy(slot0.row, slot0.column) and ((slot0:existChampion(slot0.row, slot0.column) and slot0:getChampion(slot0.row, slot0.column):getConfig("type")) or (slot0:existEnemy(ChapterConst.SubjectPlayer, slot0.row, slot0.column) and pg.expedition_data_template[slot0.attachmentId].type) or nil), {
					row = slot0.row,
					column = slot0.column
				}) <= slot2[2] and ((type(slot2[3]) == "number" and slot2[3] == (not slot0.existOni(slot0.row, slot0.column) and not slot0.existBombEnemy(slot0.row, slot0.column) and ((slot0.existChampion(slot0.row, slot0.column) and slot0.getChampion(slot0.row, slot0.column).getConfig("type")) or (slot0.existEnemy(ChapterConst.SubjectPlayer, slot0.row, slot0.column) and pg.expedition_data_template[slot0.attachmentId].type) or nil))) or (type(slot2[3]) == "table" and table.contains(slot2[3], not slot0.existOni(slot0.row, slot0.column) and not slot0.existBombEnemy(slot0.row, slot0.column) and ((slot0.existChampion(slot0.row, slot0.column) and slot0.getChampion(slot0.row, slot0.column).getConfig("type")) or (slot0.existEnemy(ChapterConst.SubjectPlayer, slot0.row, slot0.column) and pg.expedition_data_template[slot0.attachmentId].type) or nil))))
			end)
			return
		end

		if slot4 == FleetSkill.TriggerNekoPos then
			slot5 = slot1:findCommanderBySkillId(slot2.id)

			for slot9, slot10 in pairs(slot1:getCommanders()) do
				if slot5.id == slot10.id and slot9 == slot3[2] then
					return true
				end
			end
		elseif slot4 == FleetSkill.TriggerAroundLand then
			slot5 = {
				row = slot1.line.row,
				column = slot1.line.column
			}

			return _.any(_.values(slot0.cells), function (slot0)
				return not slot0.walkable and ManhattonDist(slot0, {
					row = slot0.row,
					column = slot0.column
				}) <= slot1[2]
			end)
		elseif slot4 == FleetSkill.TriggerAroundCombatAlly then
			slot5 = {
				row = slot1.line.row,
				column = slot1.line.column
			}

			return _.any(slot0.fleets, function (slot0)
				return slot0.id ~= slot0.id and slot0:getFleetType() == FleetType.Normal and slot1:existEnemy(ChapterConst.SubjectPlayer, slot0.line.row, slot0.line.column) and ManhattonDist(slot2, {
					row = slot0.line.row,
					column = slot0.line.column
				}) <= slot3[2]
			end)
		elseif slot4 == FleetSkill.TriggerInSubTeam then
			return true
		end
	end
end

slot0.checkOniState = function (slot0)
	slot1 = slot0:getOni()

	if _.all({
		{
			1,
			0
		},
		{
			-1,
			0
		},
		{
			0,
			1
		},
		{
			0,
			-1
		}
	}, function (slot0)
		if slot1:existFleet(FleetType.Normal, ({
			slot0.row + slot0[1],
			slot0.column + slot0[2]
		})[1], ()[2]) then
			return true
		end

		if not slot1:getChapterCell(slot1[1], slot1[2]) or not slot2.walkable then
			return true
		end

		if slot1:existBarrier(slot2.row, slot2.column) then
			return true
		end
	end) then
		return 1
	end

	if _.any(slot0:getOniChapterInfo().escape_grids, function (slot0)
		return slot0[1] == slot0.row and slot0[2] == slot0.column
	end) then
		return 2
	end
end

slot0.onOniEnter = function (slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		slot5.attachment = ChapterConst.AttachNone
		slot5.attachmentId = nil
		slot5.flag = nil
		slot5.data = nil
	end

	slot0.champions = {}
	slot0.modelCount = slot0:getOniChapterInfo().special_item
	slot0.roundIndex = 0
end

slot0.onBombEnemyEnter = function (slot0)
	for slot4, slot5 in pairs(slot0.cells) do
		slot5.attachment = ChapterConst.AttachNone
		slot5.attachmentId = nil
		slot5.flag = nil
		slot5.data = nil
	end

	slot0.champions = {}
	slot0.modelCount = 0
	slot0.roundIndex = 0
end

slot0.clearSubmarineFleet = function (slot0)
	for slot4 = #slot0.fleets, 1, -1 do
		if slot0.fleets[slot4]:getFleetType() == FleetType.Submarine then
			table.remove(slot0.fleets, slot4)
		end
	end
end

slot0.getOniChapterInfo = function (slot0)
	return pg.chapter_capture[slot0.id]
end

slot0.getBombChapterInfo = function (slot0)
	return pg.chapter_boom[slot0.id]
end

slot0.getSpAppearStory = function (slot0)
	if slot0:existOni() then
		for slot4, slot5 in ipairs(slot0.champions) do
			if slot5.trait == ChapterConst.TraitLurk and slot5.attachment == ChapterConst.AttachOni and slot5:getConfig("appear_story") and #slot6 > 0 then
				return slot6
			end
		end
	elseif slot0:isPlayingWithBombEnemy() then
		for slot4, slot5 in pairs(slot0.cells) do
			if slot5.attachment == ChapterConst.AttachBomb_Enemy and slot5.trait == ChapterConst.TraitLurk and pg.specialunit_template[slot5.attachmentId].appear_story and #slot6.appear_story > 0 then
				return slot6.appear_story
			end
		end
	end
end

slot0.getSpAppearGuide = function (slot0)
	if slot0:existOni() then
		for slot4, slot5 in ipairs(slot0.champions) do
			if slot5.trait == ChapterConst.TraitLurk and slot5.attachment == ChapterConst.AttachOni and slot5:getConfig("appear_guide") and #slot6 > 0 then
				return slot6
			end
		end
	elseif slot0:isPlayingWithBombEnemy() then
		for slot4, slot5 in pairs(slot0.cells) do
			if slot5.attachment == ChapterConst.AttachBomb_Enemy and slot5.trait == ChapterConst.TraitLurk and pg.specialunit_template[slot5.attachmentId].appear_guide and #slot6.appear_guide > 0 then
				return slot6.appear_guide
			end
		end
	end
end

slot0.getCoastalGunArea = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.cells) do
		if slot6.attachment == ChapterConst.AttachLandbase and slot6.flag ~= 1 and pg.land_based_template[slot6.attachmentId].type == ChapterConst.LBCoastalGun then
			slot10 = {
				Mathf.Sign(slot7.function_args[1]),
				Mathf.Sign(slot7.function_args[2])
			}

			for slot15 = 1, math.max(({
				math.abs(slot7.function_args[1]),
				math.abs(slot7.function_args[2])
			})[1], ()[2]), 1 do
				table.insert(slot1, {
					row = slot6.row + math.min(slot9[1], slot15) * slot10[1],
					column = slot6.column + math.min(slot9[2], slot15) * slot10[2]
				})
			end
		end
	end

	return slot1
end

slot0.getTodayDefeatCount = function (slot0)
	return getProxy(DailyLevelProxy):getChapterDefeatCount(slot0.configId)
end

slot0.isTriesLimit = function (slot0)
	return slot0:getConfig("count") and slot1 > 0
end

slot0.updateTodayDefeatCount = function (slot0)
	getProxy(DailyLevelProxy):updateChapterDefeatCount(slot0.configId)
end

slot0.enoughTimes2Start = function (slot0)
	if slot0:isTriesLimit() then
		return slot0:getTodayDefeatCount() < slot0:getConfig("count")
	else
		return true
	end
end

return slot0
