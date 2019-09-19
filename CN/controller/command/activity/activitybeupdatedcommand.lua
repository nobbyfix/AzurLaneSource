class("ActivityBeUpdatedCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().isInit

	if slot1.getBody().activity.getConfig(slot3, "type") == ActivityConst.ACTIVITY_TYPE_VOTE then
		slot7 = getProxy(PlayerProxy):getRawData().getResource(slot6, pg.gameset.order_pt_max.description[1]) < pg.gameset.order_pt_max.description[2]

		getProxy(VoteProxy).SetOrderBook(slot9, slot8)
		slot0:sendNotification(GAME.VOTE_BOOK_BE_UPDATED_DONE)
	end
end

return class("ActivityBeUpdatedCommand", pm.SimpleCommand)
