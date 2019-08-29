slot0 = class("VoteGroup", import("..BaseVO"))
slot0.VOTE_STAGE = 1
slot0.STTLEMENT_STAGE = 2
slot0.DISPLAY_STAGE = 3

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot0.id
	slot0.list = slot1.list

	slot0:updateRankMap()
end

slot0.bindConfigTable = function (slot0)
	return pg.activity_vote
end

slot0.isResurrectionRace = function (slot0)
	return slot0:getConfig("type") == 4
end

slot0.getList = function (slot0)
	return slot0.list
end

slot0.UpdateVoteCnt = function (slot0, slot1, slot2)
	for slot6, slot7 in ipairs(slot0.list) do
		if slot7:isSamaGroup(slot1) then
			slot7:UpdateVoteCnt(slot2)
		end
	end

	slot0:updateRankMap()
end

slot0.updateRankMap = function (slot0)
	table.sort(slot0.list, function (slot0, slot1)
		return slot1.votes < slot0.votes
	end)

	slot0.rankMaps = {}

	for slot4, slot5 in ipairs(slot0.list) do
		slot0.rankMaps[slot5.group] = slot4
	end
end

slot0.GetRank = function (slot0, slot1)
	return slot0.rankMaps[slot1.group] or 0
end

slot0.GetStage = function (slot0)
	slot2 = slot0:getConfig("time_vote_client")
	slot3 = slot0:getConfig("time_show")

	if pg.TimeMgr.GetInstance():inTime(slot0:getConfig("time_vote")) then
		return slot0.VOTE_STAGE
	elseif pg.TimeMgr.GetInstance():inTime(slot2) then
		return slot0.STTLEMENT_STAGE
	elseif pg.TimeMgr.GetInstance():inTime(slot3) then
		return slot0.DISPLAY_STAGE
	end
end

return slot0
