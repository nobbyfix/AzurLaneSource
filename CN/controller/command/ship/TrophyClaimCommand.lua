class("TrophyClaimCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = getProxy(CollectionProxy)

	pg.ConnectionMgr.GetInstance():Send(17301, {
		id = slot1:getBody().trophyID
	}, 17302, function (slot0)
		if slot0.result == 0 then
			uv0:updateTrophyClaim(uv1, slot1)

			for slot6, slot7 in ipairs(slot0.next) do
			end

			uv0:unlockNewTrophy(slot2)
			uv2:sendNotification(GAME.TROPHY_CLAIM_DONE, {
				trophyID = uv1
			})
			uv0:updateTrophy()
		end
	end)
end

return class("TrophyClaimCommand", pm.SimpleCommand)
