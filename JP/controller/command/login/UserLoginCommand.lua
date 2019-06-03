class("UserLoginCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	print("connect to gateway - " .. NetConst.GATEWAY_HOST .. ":" .. NetConst.GATEWAY_PORT)

	slot3 = ""

	if PLATFORM_CODE == 1 then
		if GetBiliServerId() == SHAREJOY_SERVER_ID then
			slot3 = "cps"
		elseif slot4 == BILI_SERVER_ID then
			slot3 = "0"
		elseif slot4 == UNION_SERVER_ID then
			slot3 = BilibiliSdkMgr.inst.channelUID
		end
	end

	if slot3 == "" then
		slot3 = PLATFORM_LOCAL
	end

	print("platformCode", slot3)

	if not slot2.arg4 then
		slot2.arg4 = "0"
	end

	print("login type -- : ", slot2.type, ", arg3 -- : ", slot2.arg4 == "0" and slot2.arg3 or slot2.arg4, ", sessionid -- : " .. slot2.arg4)
	pg.ConnectionMgr.GetInstance():Connect(NetConst.GATEWAY_HOST, NetConst.GATEWAY_PORT, function ()
		pg.ConnectionMgr.GetInstance():Send(10020, {
			login_type = uv0.type,
			arg1 = uv0.arg1,
			arg2 = uv0.arg2,
			arg3 = uv1,
			arg4 = uv2,
			check_key = HashUtil.CalcMD5(uv0.arg1 .. AABBUDUD),
			device = PLATFORM
		}, 10021, function (slot0)
			print("disconnect from gateway...")
			pg.ConnectionMgr.GetInstance():Disconnect()

			if slot0.device ~= 0 and slot0.device ~= PLATFORM then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_failed"))

				return
			end

			if slot0.result == 0 then
				uv0.id = slot0.account_id
				uv0.uid = slot0.account_id
				uv0.token = slot0.server_ticket

				getProxy(UserProxy).setLastLogin(slot1, uv0)
				getProxy(SettingsProxy).setUserAgreement(slot2)

				for slot8, slot9 in ipairs(slot0.serverlist) do
					slot10 = Server.New({
						id = slot9.ids[1],
						host = slot9.ip,
						port = slot9.port,
						proxy_host = slot9.proxy_ip,
						proxy_port = slot9.proxy_port,
						status = slot9.state,
						name = slot9.name,
						tag_state = slot9.tag_state,
						sort = slot9.sort
					})

					slot10:display()
					table.insert({}, slot10)
				end

				print(table.concat(slot4, "\n"))
				getProxy(ServerProxy).setServers(slot5, slot3, uv0.uid)
				getProxy(GatewayNoticeProxy).setGatewayNotices(slot6, slot0.notice_list)
				uv1.facade:sendNotification(GAME.USER_LOGIN_SUCCESS, uv0)
				pg.PushNotificationMgr.GetInstance():cancelAll()
				print("user logined............", #slot3)
			else
				print("user login failed ............")

				if slot0.result == 13 then
					pg.TipsMgr:GetInstance():ShowTips(i18n("login_gate_not_ready"))
				elseif slot0.result == 15 then
					pg.TipsMgr:GetInstance():ShowTips(i18n("login_game_rigister_full"))
				elseif slot0.result == 18 then
					pg.TipsMgr:GetInstance():ShowTips(i18n("system_database_busy"))
				elseif slot0.result == 6 then
					pg.TipsMgr:GetInstance():ShowTips(i18n("login_game_login_full"))
				else
					uv1.facade:sendNotification(GAME.USER_LOGIN_FAILED, slot0.result)
				end
			end
		end, false)
	end)
end

return class("UserLoginCommand", pm.SimpleCommand)
