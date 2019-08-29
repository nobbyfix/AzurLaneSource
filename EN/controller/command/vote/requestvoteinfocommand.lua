class("RequestVoteInfoCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = getProxy(VoteProxy).getVoteGroup(slot3)
	slot5 = getProxy(ActivityProxy)
	slot6 = nil
	slot6 = coroutine.create(function ()
		if not pg.TimeMgr.GetInstance():GetServerTime() or VoteConst.RankExpiredTime < slot0 - slot1.lastRequestTime then
			slot2:sendNotification(GAME.FETCH_VOTE_INFO, {
				voteId = slot3.configId,
				callback = function (slot0)
					slot0 = slot0

					slot1()
				end
			})
			coroutine.yield()

			slot1.lastRequestTime = pg.TimeMgr.GetInstance():GetServerTime()
			slot3 = 0

			if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_VOTE) then
				slot3 = slot2.data1
			end

			slot1:initVoteGroup(slot1, slot3.configId, slot3)
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
