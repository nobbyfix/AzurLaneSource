class("ConfirmSecondaryPasswordCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOn()
	pg.ConnectionMgr.GetInstance():Send(11609, {
		password = slot1:getBody().pwd
	}, 11610, function (slot0)
		pg.UIMgr.GetInstance():LoadingOff()

		if slot0.result == 0 then
			slot2 = getProxy(SecondaryPWDProxy).getRawData(slot1)
			slot2.state = 2
			slot2.fail_cd = nil
			slot2.fail_count = 0
		end

		slot0:sendNotification(GAME.CONFIRM_PASSWORD_DONE, slot0)
	end)
end

return class("ConfirmSecondaryPasswordCommand", pm.SimpleCommand)
