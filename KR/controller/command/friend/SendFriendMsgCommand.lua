class("SendFriendMsgCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = slot1:getBody().msg

	if not getProxy(FriendProxy):isFriend(slot1.getBody().playerId) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("friend_sendFriendMsg_error_noFriend"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(50105, {
		id = slot3,
		content = slot4
	}, 50106, function (slot0)
		if slot0.result == 0 then
			uv0:addChatMsg(uv1, ChatMsg.New(ChatConst.ChannelFriend, {
				player = getProxy(PlayerProxy).getData(slot1),
				content = uv2,
				timestamp = pg.TimeMgr.GetInstance():GetServerTime()
			}))
			uv3:sendNotification(GAME.FRIEND_SEND_MSG_DONE)
		elseif slot0.result == 28 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("friend_offline"))
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("friend_sendFriendMsg", slot0.result))
		end
	end)
end

return class("SendFriendMsgCommand", pm.SimpleCommand)
