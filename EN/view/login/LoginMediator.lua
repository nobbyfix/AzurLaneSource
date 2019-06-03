slot0 = class("LoginMediator", import("..base.ContextMediator"))
slot0.ON_LOGIN = "LoginMediator:ON_LOGIN"
slot0.ON_REGISTER = "LoginMediator:ON_REGISTER"
slot0.ON_SERVER = "LoginMediator:ON_SERVER"

function slot0.register(slot0)
	slot0:bind(uv0.ON_LOGIN, function (slot0, slot1)
		uv0:sendNotification(GAME.USER_LOGIN, slot1)
	end)
	slot0:bind(uv0.ON_REGISTER, function (slot0, slot1)
		uv0:sendNotification(GAME.USER_REGISTER, slot1)
	end)
	slot0:bind(uv0.ON_SERVER, function (slot0, slot1)
		uv0:sendNotification(GAME.SERVER_LOGIN, slot1)
	end)

	slot1 = getProxy(SettingsProxy)
	slot0.process = coroutine.wrap(function ()
		if not uv0:getUserAgreement() then
			uv1.viewComponent:showUserAgreement(uv1.process)
			coroutine.yield()
			uv0:setUserAgreement()
		end

		slot0 = nil

		if isPlatform() then
			if isTencent() then
				uv1.viewComponent:switchToTencentLogin()
			elseif isAiriUS() then
				uv1.viewComponent:switchToAiriJPLogin()
			else
				uv1.viewComponent:switchToServer()
			end
		else
			uv1.viewComponent:switchToLogin()
			uv1.viewComponent:setLastLogin(getProxy(UserProxy).getLastLoginUser(slot1))
		end

		uv1:CheckMaintain()
		coroutine.yield()

		if uv1.contextData.code then
			if uv1.contextData.code ~= 0 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					modal = true,
					hideNo = true,
					content = ({
						i18n("login_loginMediator_kickOtherLogin"),
						i18n("login_loginMediator_kickServerClose"),
						i18n("login_loginMediator_kickIntError"),
						i18n("login_loginMediator_kickTimeError"),
						i18n("login_loginMediator_kickLoginOut"),
						i18n("login_loginMediator_serverLoginErro"),
						i18n("login_loginMediator_vertifyFail"),
						[99] = i18n("login_loginMediator_dataExpired")
					})[uv1.contextData.code] or i18n("login_loginMediator_kickUndefined", uv1.contextData.code)
				})
			end

			if slot0 then
				if slot0.type == 1 then
					slot0.arg3 = ""
				elseif slot0.type == 2 then
					slot0.arg2 = ""
				end

				uv1.viewComponent:setLastLogin(slot0)
			end
		else
			uv1.viewComponent:setAutoLogin()
		end

		if not isAiriUS() then
			if uv1.contextData.loginPlatform then
				BilibiliSdkMgr.inst:login(0)
			elseif isTencent() then
				BilibiliSdkMgr.inst:tryTencLogin()
			end
		end

		uv1.viewComponent:autoLogin()
	end)

	slot0.process()
end

function slot0.CheckMaintain(slot0)
	slot1 = -1
	slot2 = 0
	slot3 = 1
	slot4 = 2

	VersionMgr.Inst:GetServerState(function (slot0)
		if slot0 == uv0 then
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("login_loginMediator_kickServerClose"),
				onNo = function ()
					uv0.process()
				end,
				onYes = function ()
					uv0.process()
				end
			})
		elseif slot0 == uv2 then
			print("All servers working well. thanks God.")
			uv1.process()
		elseif slot0 == uv3 then
			print("Check server maintain state failed. but it doesnt matter. keep going.")
			uv1.process()
		else
			print("no servers working. anyway. you should have a try. ")
			uv1.process()
		end
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.USER_LOGIN_SUCCESS,
		GAME.USER_LOGIN_FAILED,
		GAME.USER_REGISTER_SUCCESS,
		GAME.USER_REGISTER_FAILED,
		GAME.SERVER_LOGIN_SUCCESS,
		GAME.SERVER_LOGIN_FAILED,
		GAME.LOAD_PLAYER_DATA_DONE,
		ServerProxy.SERVERS_UPDATED,
		GAME.PLATFORM_LOGIN_DONE,
		GAME.SERVER_LOGIN_WAIT,
		GAME.BEGIN_STAGE_DONE,
		GAME.SERVER_USER_LOGIN_INVALIDCERT
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == ServerProxy.SERVERS_UPDATED then
		slot0.viewComponent:updateServerList(slot1:getBody())
	elseif slot2 == GAME.USER_LOGIN_SUCCESS then
		pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginMediator_loginSuccess"))
		slot0.viewComponent:setLastLoginServer(slot5)
		slot0.viewComponent:switchToServer()

		if #getProxy(GatewayNoticeProxy).getGatewayNotices(slot6, false) > 0 then
			slot0:addSubLayers(Context.New({
				mediator = GatewayNoticeMediator,
				viewComponent = GatewayNoticeLayer
			}))
		end
	elseif slot2 == GAME.USER_REGISTER_SUCCESS then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			content = i18n("login_loginMediator_quest_RegisterSuccess"),
			onYes = function ()
				uv0:sendNotification(GAME.USER_LOGIN, uv1)
			end
		})
	elseif slot2 == GAME.SERVER_LOGIN_SUCCESS then
		if slot3.uid == 0 then
			slot0:sendNotification(GAME.BEGIN_STAGE, {
				system = SYSTEM_PROLOGUE
			})
		else
			slot0:blockEvents()
			slot0.facade:sendNotification(GAME.LOAD_PLAYER_DATA, {
				id = slot3.uid
			})
		end
	elseif slot2 == GAME.USER_REGISTER_FAILED then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			content = errorTip("login_loginMediator_registerFail", slot3)
		})
	elseif slot2 == GAME.USER_LOGIN_FAILED then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			content = errorTip("login_loginMediator_userLoginFail_error", slot3),
			onYes = function ()
				if isAiriUS() then
					uv0.viewComponent:switchToAiriJPLogin()
				elseif uv1 == 20 then
					uv0.viewComponent:switchToRegister()
				elseif uv1 == 3 or uv1 == 6 then
					uv0.viewComponent:switchToServer()
				elseif uv1 == 1 or uv1 == 9 or uv1 == 11 or uv1 == 12 then
					uv0.viewComponent:switchToLogin()
				elseif isPlatform() then
					uv0.viewComponent:switchToServer()
				else
					uv0.viewComponent:switchToLogin()
				end
			end
		})
	elseif slot2 == GAME.SERVER_LOGIN_FAILED then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			modal = true,
			hideNo = true,
			content = errorTip("login_loginMediator_serverLoginFail", slot3),
			onYes = function ()
				if isPlatform() then
					uv0.viewComponent:switchToServer()
				else
					uv0.viewComponent:switchToLogin()
				end
			end
		})
	elseif slot2 == GAME.LOAD_PLAYER_DATA_DONE then
		slot0.viewComponent:unloadExtraVoice()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.MAINUI, {
			isFromLogin = true
		})
	elseif slot2 == GAME.BEGIN_STAGE_DONE then
		slot0.viewComponent:unloadExtraVoice()
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
	elseif slot2 == GAME.PLATFORM_LOGIN_DONE then
		slot0:sendNotification(GAME.USER_LOGIN, slot3.user)
	elseif slot2 == GAME.SERVER_LOGIN_WAIT then
		slot0.viewComponent:SwitchToWaitPanel(slot3)
	elseif slot2 == GAME.SERVER_USER_LOGIN_INVALIDCERT then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = true,
			content = i18n("airi_error_code_100200"),
			onYes = function ()
				ClearAccountCache()

				slot0 = getProxy(SettingsProxy)

				slot0:deleteUserAreement()
				slot0:clearAllReadHelp()
				uv0:loginProcessHandler()
			end
		})
	end
end

return slot0
