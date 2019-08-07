slot0 = class("LoginScene", import("..base.BaseUI"))
slot1 = 1

slot0.getUIName = function (slot0)
	return "LoginUI2"
end

slot0.getBGM = function (slot0)
	return "login"
end

slot0.preload = function (slot0, slot1)
	slot0.iconSpries = {}

	ResourceMgr.Inst:loadAssetBundleAsync("ui/LoginUI2_atlas", function (slot0)
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_green", typeof(Sprite), true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_gray", typeof(Sprite), true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_red", typeof(Sprite), true, false))
		table.insert(slot0.iconSpries, ResourceMgr.Inst:LoadAssetSync(slot0, "statu_org", typeof(Sprite), true, false))

		if table.insert then
			slot1()
		end
	end)
end

slot0.init = function (slot0)
	slot0.version = slot0:findTF("version")
	slot0.version:GetComponent("Text").text = "ver " .. UpdateMgr.Inst.currentVersion:ToString()
	slot0.accountBtn = slot0:findTF("bg_lay/buttons/account_button")
	slot0.pressToLogin = GetOrAddComponent(slot0:findTF("background/press_to_login"), "CanvasGroup")

	LeanTween.alphaCanvas(slot0.pressToLogin, 0.25, slot0):setFrom(1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong()

	slot0.currentServer = slot0:findTF("current_server")
	slot0.loginPanel = slot0:findTF("login_panel")
	slot0.loginUsername = slot0:findTF("username", slot0.loginPanel)
	slot0.loginPassword = slot0:findTF("password", slot0.loginPanel)
	slot0.loginButton = slot0:findTF("login_button", slot0.loginPanel)
	slot0.registerButton = slot0:findTF("register_button", slot0.loginPanel)
	slot0.forgetButton = slot0:findTF("forget_button", slot0.loginPanel)
	slot0.registerPanel = slot0:findTF("register_panel")
	slot0.registerUsername = slot0:findTF("username", slot0.registerPanel)
	slot0.registerPassword = slot0:findTF("password", slot0.registerPanel)
	slot0.registerPassword2 = slot0:findTF("password2", slot0.registerPanel)
	slot0.registerEmail = slot0:findTF("email", slot0.registerPanel)
	slot0.cancelButton = slot0:findTF("cancel_button", slot0.registerPanel)
	slot0.confirmButton = slot0:findTF("confirm_button", slot0.registerPanel)
	slot0.serversPanel = slot0:findTF("servers")
	slot0.servers = slot0:findTF("panel/servers/content/server_list", slot0.serversPanel)
	slot0.serverTpl = slot0:getTpl("server_tpl")
	slot0.recentTF = slot0:findTF("panel/servers/content/advice_panel/recent", slot0.serversPanel)
	slot0.adviceTF = slot0:findTF("panel/servers/content/advice_panel/advice", slot0.serversPanel)
	slot0.tencentPanel = slot0:findTF("tencent_login_panel")
	slot0.wxLoginBtn = slot0:findTF("wx_login", slot0.tencentPanel)
	slot0.qqLoginBtn = slot0:findTF("qq_login", slot0.tencentPanel)
	slot0.airijpPanel = slot0:findTF("airijp_login_panel")
	slot0.airiLoginBtn = slot0:findTF("airi_login", slot0.airijpPanel)
	slot0.clearTranscodeBtn = slot0:findTF("clear_transcode", slot0.airijpPanel)

	setActive(slot0.clearTranscodeBtn, not LOCK_CLEAR_ACCOUNT)

	slot0.twitterLoginBtn = slot0:findTF("twitter_login", slot0.airijpPanel)
	slot0.facebookLoginBtn = slot0:findTF("facebook_login", slot0.airijpPanel)
	slot0.yostarLoginBtn = slot0:findTF("yostar_login", slot0.airijpPanel)

	setActive(slot0.yostarLoginBtn, CSharpVersion > 24)

	slot0.airiUidTxt = slot0:findTF("airi_uid")
	slot0.transcodeAlert = slot0:findTF("transcode_alert")
	slot0.tcSureBtn = slot0:findTF("transcode_sure", slot0.transcodeAlert)
	slot0.uidTxt = slot0:findTF("uid_input_txt", slot0.transcodeAlert):GetComponent(typeof(InputField))
	slot0.transcodeTxt = slot0:findTF("transcode_input_txt", slot0.transcodeAlert):GetComponent(typeof(InputField))
	slot0.tcDesc = slot0:findTF("desc", slot0.transcodeAlert)

	setText(slot0.tcDesc, i18n("transcode_desc"))

	slot0.yostarAlert = slot0:findTF("yostar_alert")
	slot0.yostarEmailTxt = slot0:findTF("email_input_txt", slot0.yostarAlert)
	slot0.yostarCodeTxt = slot0:findTF("code_input_txt", slot0.yostarAlert)
	slot0.yostarGenCodeBtn = slot0:findTF("gen_code_btn", slot0.yostarAlert)
	slot0.yostarGenTxt = slot0:findTF("Text", slot0.yostarGenCodeBtn)
	slot0.yostarSureBtn = slot0:findTF("login_btn", slot0.yostarAlert)
	slot0.serviceBtn = slot0:findTF("bg_lay/buttons/service_button")
	slot0.filingBtn = slot0:findTF("filingBtn")

	setActive(slot0.filingBtn, PLATFORM_CODE == PLATFORM_CH)

	slot0._bg = slot0:findTF("background/bg"):GetComponent(typeof(Image))
	slot0.userAgreenTF = slot0:findTF("UserAgreement")
	slot0.userAgreenMainTF = slot0:findTF("UserAgreement/window")
	slot0.closeUserAgreenTF = slot0.userAgreenTF:Find("window/close_btn")
	slot0.userAgreenConfirmTF = slot0:findTF("UserAgreement/window/accept_btn")

	setActive(slot0.userAgreenTF, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.userAgreenTF, slot0._tf)

	slot0.opBtn = slot0:findTF("bg_lay/buttons/opBtn")

	if slot0.opBtn then
		setActive(slot0.opBtn, PLAY_OPENING)
	end

	slot0:switchToServer()
	slot0:setBg()

	if CRI_BG_FLAG then
		slot0:setCriBg()
	end

	setText(findTF(slot0.currentServer, "server_name"), "")
end

slot0.onBackPressed = function (slot0)
	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.serversPanel) then
		pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
		setActive(slot0.serversPanel, false)

		return
	end

	if isActive(slot0.userAgreenTF) then
		setActive(slot0.userAgreenTF, false)
		pg.UIMgr.GetInstance():UnblurPanel(slot0.userAgreenTF, slot0._tf)

		return
	end

	BilibiliSdkMgr.inst:onBackPressed()
end

slot0.showUserAgreement = function (slot0, slot1)
	slot0.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(0.7843137254901961, 0.7843137254901961, 0.7843137254901961, 0.5019607843137255)
	slot3 = nil

	if PLATFORM_CODE == PLATFORM_CH then
		slot0.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(0.7843137254901961, 0.7843137254901961, 0.7843137254901961, 0.5019607843137255)
	else
		slot3 = true
	end

	setActive(slot0.userAgreenTF, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.userAgreenTF, false, {
		weight = LayerWeightConst.THIRD_LAYER
	})
	setText(slot0.userAgreenTF:Find("window/container/scrollrect/content/Text"), require("ShareCfg.UserAgreement").content)
	onButton(slot0, slot0.userAgreenConfirmTF, function ()
		if slot0 then
			setActive(slot1.userAgreenTF, false)
			pg.UIMgr.GetInstance():UnblurPanel(slot1.userAgreenTF, slot1._tf)

			if slot1.userAgreenTF then
				slot2()
			end
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("read_the_user_agreement"))
		end
	end)
	onScroll(slot0, slot0.userAgreenTF:Find("window/container/scrollrect"), function (slot0)
		if slot0.y <= 0.01 and not slot0 then
			slot0 = true

			if PLATFORM_CODE == PLATFORM_CH then
				slot1.userAgreenConfirmTF:GetComponent(typeof(Image)).color = Color.New(1, 1, 1, 1)
			end
		end
	end)

	if PLATFORM_CODE == PLATFORM_CH then
		onScroll(slot0, slot0.userAgreenTF:Find("window/container/scrollrect"), function (slot0)
			if slot0.y <= 0.01 and not slot0 then
				slot0 = true
				slot1.color = Color.New(1, 1, 1, 1)
			end
		end)
	else
		slot3 = true
		slot2.color = Color.New(1, 1, 1, 1)
	end
end

slot0.setBg = function (slot0)
	slot1 = "login"
	slot2 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y%m%d")

	for slot6, slot7 in ipairs(SPECIAL_DATE) do
		if slot7[1] == slot2 then
			slot1 = slot7[2]
		end
	end

	setImageSprite(slot0._bg, LoadSprite("loadingbg/" .. slot1))
end

slot0.setCriBg = function (slot0)
	LoadAndInstantiateAsync("effect", "loginbg", function (slot0)
		if slot0 then
			slot0.transform.SetParent(slot1, slot0._bg.transform, false)
			slot0.transform:SetAsFirstSibling()
		end
	end)
end

slot0.setLastLogin = function (slot0, slot1)
	slot0.lastLoginUser = slot1
end

slot0.setAutoLogin = function (slot0)
	slot0.autoLoginEnabled = true
end

slot0.setLastLoginServer = function (slot0, slot1)
	if not slot1 then
		return
	end

	setText(findTF(slot0.currentServer, "server_name"), slot1.name)

	slot0.lastLoginServer = slot1
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0.closeUserAgreenTF, function ()
		setActive(slot0.userAgreenMainTF, false)
		onNextTick(function ()
			setActive(slot0.userAgreenMainTF, true)
		end)
	end, SFX_CANCEL)
	onButton(slot0, slot0.loginButton, function ()
		if slot0.autoLoginEnabled and slot0.lastLoginUser then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot0.lastLoginUser)

			return
		end

		if getInputText(slot0.loginUsername) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noUserName"))
			ActivateInputField(slot0.loginUsername)

			return
		end

		if getInputText(slot0.loginPassword) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noPassword"))
			ActivateInputField(slot0.loginPassword)

			return
		end

		if User.New({
			type = 2,
			arg1 = slot0,
			arg2 = slot1
		}) then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot2)
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0.forgetButton, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("word_systemClose"))
	end, SFX_MAIN)
	onButton(slot0, slot0.registerButton, function ()
		setInputText(slot0.registerPassword, "")
		setInputText(slot0.registerPassword2, "")
		setInputText:switchToRegister()
	end, SFX_MAIN)
	onButton(slot0, slot0.confirmButton, function ()
		if getInputText(slot0.registerUsername) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noUserName"))
			ActivateInputField(slot0.registerUsername)

			return
		end

		if getInputText(slot0.registerPassword) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noPassword"))
			ActivateInputField(slot0.registerPassword)

			return
		end

		if getInputText(slot0.registerPassword2) ~= slot1 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_diffPassword"))
			ActivateInputField(slot0.registerPassword2)

			return
		end

		if getInputText(slot0.registerEmail) == "" then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_error_noMailBox"))
			ActivateInputField(slot0.registerEmail)

			return
		end

		if User.New({
			type = 2,
			arg1 = slot0,
			arg2 = slot1,
			arg3 = slot3
		}) then
			slot0.event:emit(LoginMediator.ON_REGISTER, slot4)
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0.serviceBtn, function ()
		pg.TipsMgr:GetInstance():ShowTips(i18n("word_systemClose"))
	end, SFX_MAIN)
	onButton(slot0, slot0.cancelButton, function ()
		slot0:switchToLogin()
	end, SFX_CANCEL)
	onButton(slot0, slot0.accountBtn, function ()
		slot0:switchToLogin()
	end, SFX_MAIN)

	function slot1()
		if isPlatform() then
			if not isTencent() then
				if isAiriUS() then
					AiriLogin()
				else
					BilibiliSdkMgr.inst:login(0)
				end
			else
				slot0:switchToTencentLogin()
			end
		else
			slot0:switchToLogin()
		end
	end

	onButton(slot0, slot0.filingBtn, function ()
		Application.OpenURL("http://sq.ccm.gov.cn:80/ccnt/sczr/service/business/emark/gameNetTag/4028c08b58bd467b0158bd8bd80d062a")
	end, SFX_PANEL)
	onButton(slot0, slot0.currentServer, function ()
		if slot0(slot0.serverList or {}) == 0 then
			slot1()
		else
			pg.UIMgr.GetInstance():BlurPanel(slot0.serversPanel)
			setActive(slot0.serversPanel, true)
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.serversPanel, function ()
		pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
		setActive(slot0.serversPanel, false)
	end, SFX_CANCEL)
	onButton(slot0, slot0:findTF("background"), function ()
		if not slot0.initFinished then
			return
		end

		if go(slot0.pressToLogin).activeSelf then
			if slot0(slot0.serverList or {}) == 0 then
				slot1()

				return
			end

			if not slot0.lastLoginServer then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_choiseServer"))

				return
			end

			if slot0.lastLoginServer.status == Server.STATUS.VINDICATE or slot0.lastLoginServer.status == Server.STATUS.FULL then
				pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_server_disabled"))

				return
			end

			slot0.event:emit(LoginMediator.ON_SERVER, slot0.lastLoginServer)
			playSoundEffect(SFX_CONFIRM)
		end
	end)
	onInputChanged(slot0, slot0.loginUsername, function ()
		slot0.autoLoginEnabled = false
	end)
	onInputChanged(slot0, slot0.loginPassword, function ()
		slot0.autoLoginEnabled = false
	end)
	onButton(slot0, slot0.qqLoginBtn, function ()
		BilibiliSdkMgr.inst:login(1)
	end)
	onButton(slot0, slot0.wxLoginBtn, function ()
		BilibiliSdkMgr.inst:login(2)
	end)
	slot0:initAiriEvent()
	slot0:checkVersion()

	if PLAY_OPENING then
		onButton(slot0, slot0.opBtn, function ()
			if slot0.initFinished then
				slot0:playOpening(true)
			end
		end)

		if PlayerPrefs.GetString("op_ver", "") ~= OP_VERSION then
			slot0:playOpening(true, function ()
				PlayerPrefs.SetString("op_ver", OP_VERSION)
				PlayerPrefs.SetString:playExtraVoice()

				PlayerPrefs.SetString.playExtraVoice.initFinished = true
			end)

			return
		end
	end

	slot0:playExtraVoice()

	slot0.initFinished = true
end

slot0.checkVersion = function (slot0)
	if PathMgr.FileExists(PathMgr.getStreamAssetsPath() .. "/" .. "version.txt") and PathMgr.FileExists(PathMgr.getStreamAssetsPath() .. "/" .. "hashes.csv") and System.Version.New(PathMgr.ReadAllText(PathMgr.getStreamingAsset("version.txt"))).CompareTo(slot1, UpdateMgr.Inst.serverVersion) < 0 then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = "当前游戏不是最新版本，请重启游戏进行更新",
			onYes = function ()
				Application.Quit()
			end
		})
	end
end

slot0.playExtraVoice = function (slot0)
	if pg.gameset.login_extra_voice.description and #slot1 > 0 then
		pg.CriMgr.GetInstance():LoadCueSheet("cv-" .. slot3, function ()
			if slot0.exited then
				slot1:UnloadCueSheet(slot2)

				return
			end

			slot0.loginCueSheet = slot2

			slot2:PlayCV(slot2, "extra")
		end)
	end
end

slot0.unloadExtraVoice = function (slot0)
	if slot0.loginCueSheet then
		pg.CriMgr.GetInstance():UnloadCueSheet(slot0.loginCueSheet)

		slot0.loginCueSheet = nil
	end
end

slot0.autoLogin = function (slot0)
	if slot0.lastLoginUser then
		if slot0.autoLoginEnabled then
			slot0.event:emit(LoginMediator.ON_LOGIN, slot0.lastLoginUser)
		end

		if slot0.lastLoginUser.type == 1 then
			setInputText(slot0.loginUsername, slot0.lastLoginUser.arg2)
			setInputText(slot0.loginPassword, slot0.lastLoginUser.arg3)
		elseif slot0.lastLoginUser.type == 2 then
			setInputText(slot0.loginUsername, slot0.lastLoginUser.arg1)
			setInputText(slot0.loginPassword, slot0.lastLoginUser.arg2)
		end
	end
end

slot2 = {
	{
		0.403921568627451,
		1,
		0.2196078431372549,
		0.6274509803921569
	},
	{
		0.6078431372549019,
		0.6078431372549019,
		0.6078431372549019,
		0.6274509803921569
	},
	{
		1,
		0.3607843137254902,
		0.2196078431372549,
		0.6274509803921569
	},
	{
		1,
		0.6588235294117647,
		0.2196078431372549,
		0.6274509803921569
	}
}

slot0.updateServerTF = function (slot0, slot1, slot2)
	setText(findTF(slot1, "name"), "-  " .. slot2.name .. "  -")
	setImageSprite(findTF(slot1, "statu"), slot0.iconSpries[slot2.status + 1], true)

	findTF(slot1, "statu_1"):GetComponent("Image").color = Color.New(slot0[slot2.status + 1][1], slot0[slot2.status + 1][2], slot0[slot2.status + 1][3], slot0[slot2.status + 1][4])

	setActive(findTF(slot1, "mark"), slot2.isLogined)
	setActive(slot0:findTF("tag_new", slot1), slot2.isNew)
	setActive(slot0:findTF("tag_hot", slot1), slot2.isHot)
	onButton(slot0, slot1, function ()
		if slot0.status == Server.STATUS.VINDICATE then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_server_vindicate"))

			return
		end

		if slot0.status == Server.STATUS.FULL then
			pg.TipsMgr:GetInstance():ShowTips(i18n("login_loginScene_server_full"))

			return
		end

		slot1:setLastLoginServer(slot1.setLastLoginServer)
		pg.UIMgr.GetInstance():UnblurPanel(slot1.serversPanel, slot1._tf)
		setActive(pg.UIMgr.GetInstance().serversPanel, false)
	end, SFX_CONFIRM)
end

slot0.updateAdviceServer = function (slot0)
	if not slot0.recentTF or not slot0.adviceTF then
		return
	end

	setActive(slot0.recentTF, slot0.lastLoginServer)

	if slot0.lastLoginServer then
		slot0:updateServerTF(findTF(slot0.recentTF, "server"), slot0.lastLoginServer)
	end

	setActive(slot0.adviceTF, getProxy(ServerProxy).firstServer)

	if getProxy(ServerProxy).firstServer then
		slot0:updateServerTF(findTF(slot0.adviceTF, "server"), slot1)
	end
end

slot0.updateServerList = function (slot0, slot1)
	slot0.serverList = slot1

	removeAllChildren(slot0.servers)

	for slot6, slot7 in pairs(slot2) do
		slot0:updateServerTF(cloneTplTo(slot0.serverTpl, slot0.servers), slot7)
	end
end

slot0.switchToTencentLogin = function (slot0)
	setActive(slot0.tencentPanel, true)
	setActive(slot0.accountBtn, false)
	setActive(slot0.pressToLogin, false)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	setActive(slot0.serversPanel, false)
	setActive(slot0.airijpPanel, false)
	setActive(slot0.transcodeAlert, false)
end

slot0.switchToAiriJPLogin = function (slot0)
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, false)
	setActive(slot0.pressToLogin, true)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	setActive(slot0.serversPanel, false)
	setActive(slot0.airiUidTxt, false)
	setActive(slot0.airijpPanel, true)
	setActive(slot0.transcodeAlert, false)
end

slot0.switchToLogin = function (slot0)
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, false)
	setActive(slot0.pressToLogin, false)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, true)
	setActive(slot0.registerPanel, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	setActive(slot0.serversPanel, false)
	setActive(slot0.airijpPanel, false)
	setActive(slot0.transcodeAlert, false)
end

slot0.switchToRegister = function (slot0)
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, false)
	setActive(slot0.pressToLogin, false)
	setActive(slot0.currentServer, false)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, true)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	setActive(slot0.serversPanel, false)
	setActive(slot0.airijpPanel, false)
	setActive(slot0.transcodeAlert, false)
end

slot0.switchToServer = function (slot0)
	slot0:updateAdviceServer()
	setActive(slot0.tencentPanel, false)
	setActive(slot0.accountBtn, not isPlatform())
	setActive(slot0.pressToLogin, true)
	setActive(slot0.currentServer, true)
	setActive(slot0.loginPanel, false)
	setActive(slot0.registerPanel, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.serversPanel, slot0._tf)
	setActive(slot0.serversPanel, false)
	setActive(slot0.airijpPanel, false)
	setActive(slot0.transcodeAlert, false)
	setActive(slot0.yostarAlert, false)
end

slot0.SwitchToWaitPanel = function (slot0, slot1)
	slot3 = slot0:findTF("window/content", slot2)
	slot0.waitTimer = nil
	slot4 = 0
	slot5 = slot1
	slot0.waitTimer = Timer.New(function ()
		setText(setText, i18n("login_wait_tip", setText))

		slot2 = slot2 - 1

		if math.random(0, 1) == 1 then
			slot1 = slot2
		end

		if slot2 <= 0 then
			triggerButton(slot3:findTF("background"))
			slot3.waitTimer:Stop()

			"background".waitTimer = nil
		end
	end, 1, -1)

	slot0.waitTimer:Start()
	slot0.waitTimer.func()
	setActive(slot0:findTF("Msgbox"), true)
end

slot0.willExit = function (slot0)
	if slot0.waitTimer then
		slot0.waitTimer:Stop()

		slot0.waitTimer = nil
	end

	if slot0.openingTF then
		SetParent(slot0.openingTF, slot0._tf)
	end
end

slot0.playOpening = function (slot0, slot1, slot2, slot3)
	pg.CriMgr.GetInstance():stopBGM()

	function slot4()
		setActive(slot0.openingTF, false)

		setActive.openingAni.enabled = false

		if setActive.openingAni.criAni then
			slot0.criAni:Stop()
		end

		if slot0.openingTF then
			pg.UIMgr.GetInstance():UnOverlayPanel(slot0.openingTF.transform, slot0._tf)
			Destroy(slot0.openingTF)

			Destroy.openingTF = nil
		end

		if slot1 then
			slot1()
		end

		slot0.cg.alpha = 1

		pg.CriMgr.GetInstance():resumeNormalBGM()
	end

	function slot5()
		if not slot0.cg then
			slot0.cg = GetOrAddComponent(slot0._tf, "CanvasGroup")
		end

		slot0.cg.alpha = 0

		setActive(slot0.openingTF, true)

		setActive.openingAni.enabled = true

		onButton(onButton, slot0.openingTF, function ()
			if slot0 then
				slot1()
			end
		end)

		slot0 = onButton.openingTF:GetComponent("DftAniEvent")

		slot0:SetStartEvent(function (slot0)
			if slot0.criAni then
				slot0.criAni:Play()
			end
		end)
		slot0:SetEndEvent(function (slot0)
			slot0()
		end)
		setActive(slot0.openingTF, true)
	end

	if IsNil(slot0.openingTF) then
		LoadAndInstantiateAsync("ui", "opening", function (slot0)
			slot0:SetActive(false)

			slot0.openingTF = slot0

			pg.UIMgr.GetInstance():OverlayPanel(slot0.openingTF.transform)

			slot0.criAni = slot0.openingTF:GetComponent("CriManaEffectUI")

			setActive(slot0.openingTF, false)

			slot0.openingAni = slot0.openingTF:GetComponent("Animator")

			slot0()
		end)
	else
		slot5()
	end
end

slot0.initAiriEvent = function (slot0)
	onButton(slot0, slot0.airiLoginBtn, function ()
		playSoundEffect(SFX_CONFIRM)

		if not getProxy(SettingsProxy):getUserAgreement() then
			slot0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
		else
			AiriLogin()
			pg.UIMgr.GetInstance():LoadingOn()
		end
	end)
	onButton(slot0, slot0.clearTranscodeBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("clear_transcode_cache_confirm"),
			onYes = function ()
				ClearAccountCache()

				slot0 = getProxy(SettingsProxy)

				slot0:deleteUserAreement()
				slot0:clearAllReadHelp()
				slot0.event:emit(LoginMediator.ON_LOGIN_PROCESS)
				pg.TipsMgr:GetInstance():ShowTips(i18n("clear_transcode_cache_success"))
			end,
			onNo = function ()
				return
			end
		})
	end)
	onButton(slot0, slot0.twitterLoginBtn, function ()
		LoginWithSocial(AIRI_PLATFORM_TWITTER)
	end)
	onButton(slot0, slot0.facebookLoginBtn, function ()
		LoginWithSocial(AIRI_PLATFORM_FACEBOOK)
	end)
	onButton(slot0, slot0.tcSureBtn, function ()
		slot1 = slot0.transcodeTxt.text

		if slot0.uidTxt.text == "" or slot1 == "" then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("transcode_empty_tip")
			})
		else
			LoginWithTranscode(slot0, slot1)
			pg.UIMgr:GetInstance():LoadingOn()
		end
	end)
	onButton(slot0, slot0.transcodeAlert, function ()
		setActive(slot0.transcodeAlert, false)
	end)
	onButton(slot0, slot0.yostarLoginBtn, function ()
		setActive(slot0.yostarAlert, true)
	end)
	onButton(slot0, slot0.yostarAlert, function ()
		setActive(slot0.yostarAlert, false)
	end)
	onButton(slot0, slot0.yostarGenCodeBtn, function ()
		if getInputText(slot0.yostarEmailTxt) ~= "" then
			VerificationCodeReq(slot0)
			slot0:CheckAiriGenCodeCounter()
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("verification_code_req_tip1"))
		end
	end)
	onButton(slot0, slot0.yostarSureBtn, function ()
		slot1 = getInputText(slot0.yostarCodeTxt)

		if getInputText(slot0.yostarEmailTxt) ~= "" and slot1 ~= "" then
			LoginWithSocial(AIRI_PLATFORM_YOSTAR, slot0, slot1)
		else
			pg.TipsMgr:GetInstance():ShowTips(i18n("verification_code_req_tip3"))
		end
	end)

	if CSharpVersion > 24 then
		slot0:CheckAiriGenCodeCounter()
	end
end

slot0.CheckAiriGenCodeCounter = function (slot0)
	if GetAiriGenCodeTimeRemain() > 0 then
		setButtonEnabled(slot0.yostarGenCodeBtn, false)

		slot0.genCodeTimer = Timer.New(function ()
			if GetAiriGenCodeTimeRemain() > 0 then
				setText(slot0.yostarGenTxt, "(" .. slot0 .. ")")
			else
				setText(slot0.yostarGenTxt, "Generate")
				slot0:ClearAiriGenCodeTimer()
			end
		end, 1, -1):Start()
	end
end

slot0.ClearAiriGenCodeTimer = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if CSharpVersion < 24 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-12, warpins: 2 ---
	setButtonEnabled(slot0.yostarGenCodeBtn, true)

	if slot0.genCodeTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-18, warpins: 1 ---
		slot0.genCodeTimer:Stop()

		slot0.genCodeTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

return slot0