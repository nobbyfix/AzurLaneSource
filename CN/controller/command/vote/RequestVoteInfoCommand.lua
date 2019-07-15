class("RequestVoteInfoCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = pg.activity_vote[slot1:getBody().configId]
	slot5 = getProxy(VoteProxy).getVoteGroup(slot4)
	slot6 = nil
	slot6 = coroutine.create(function ()
		if not slot0 then
			local function slot5(slot0)
				slot0 = slot0

				slot1()
			end

			slot1:sendNotification(GAME.FETCH_VOTE_INFO, {
				callback = slot5
			})
			coroutine.yield()
			slot4:initVoteGroup(getProxy(ActivityProxy):getActivityById(GAME.FETCH_VOTE_INFO.activityId), slot5.id, nil)
		end

		if VoteConst.RankExpiredTime < pg.TimeMgr.GetInstance():GetServerTime() - slot4.lastRequestTime then
			slot1:sendNotification(GAME.FETCH_VOTE_RANK, {
				type = 1,
				callback = function (slot0)
					slot0 = slot0

					slot1()
				end
			})
			coroutine.yield()
			slot4:updateRankInfo(nil)

			nil.lastRequestTime = slot0
		end

		if slot3.callback then
			slot3.callback()
		end
	end)


	-- Decompilation error in this vicinity:
	function ()
		if slot0 and coroutine.status(coroutine.status) == "suspended" then
			slot0, slot1 = coroutine.resume(coroutine.resume)
		end
	end()
end

return class("RequestVoteInfoCommand", pm.SimpleCommand)
