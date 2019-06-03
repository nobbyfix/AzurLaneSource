class("RequestVoteInfoCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot3 = pg.activity_vote[slot1:getBody().configId]
	slot5 = getProxy(VoteProxy).getVoteGroup(slot4)
	slot6 = nil
	slot6 = coroutine.create(function ()
		if not uv0 then
			uv1:sendNotification(GAME.FETCH_VOTE_INFO, {
				callback = function (slot0)
					uv0 = slot0

					uv1()
				end
			})
			coroutine.yield()
			uv4:initVoteGroup(getProxy(ActivityProxy):getActivityById(uv3.activityId), uv5.id, nil)
		end

		if VoteConst.RankExpiredTime < pg.TimeMgr.GetInstance():GetServerTime() - uv4.lastRequestTime then
			uv1:sendNotification(GAME.FETCH_VOTE_RANK, {
				type = 1,
				callback = function (slot0)
					uv0 = slot0

					uv1()
				end
			})
			coroutine.yield()
			uv4:updateRankInfo(nil)

			uv4.lastRequestTime = slot0
		end

		if uv3.callback then
			uv3.callback()
		end
	end)

	function ()
		if uv0 and coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)
		end
	end()
end

return class("RequestVoteInfoCommand", pm.SimpleCommand)
