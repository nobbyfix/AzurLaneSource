slot0 = class("SettingsScene", import("..base.BaseUI"))
slot0.CLD_RED = Color.New(0.6, 0.05, 0.05, 0.5)
slot0.DEFAULT_GREY = Color.New(0.5, 0.5, 0.5, 0.5)

slot0.getUIName = function (slot0)
	return "SettingsUI"
end

slot0.init = function (slot0)
	slot0.eventTriggers = {}
	slot0.top = slot0:findTF("blur_panel/adapt/top")
	slot0.backButton = slot0:findTF("blur_panel/adapt/top/back_btn")
	slot0.logoutButton = slot0:findTF("blur_panel/adapt/left_length/logout")
	slot0.bbsButton = slot0:findTF("main/bbs")
	slot0.bbsButton = slot0:findTF("bbs", slot0.leftPanel)
	slot0.soundToggle = slot0:findTF("blur_panel/adapt/left_length/resources")
	slot0.optionsToggle = slot0:findTF("blur_panel/adapt/left_length/options")
	slot0.otherToggle = slot0:findTF("blur_panel/adapt/left_length/other")
	slot0.interfaceToggle = slot0:findTF("blur_panel/adapt/left_length/battle_ui")
	slot0.resToggle = slot0:findTF("blur_panel/adapt/left_length/resources")
	slot0.repairMask = slot0:findTF("mask_repair")

	slot0:initSoundPanel(slot0:findTF("main/resources"))
	slot0:initOptionsPanel(slot0:findTF("main/options"))
	slot0:initInterfacePreference(slot0:findTF("main/battle_ui"))
	slot0:initOtherPanel(slot0:findTF("main/other"))
	slot0:initResDownloadPanel(slot0:findTF("main/resources"))
	slot0:initHelpPanel(slot0:findTF("blur_panel/adapt/left_length/helpBtn"))
end

slot0.initResDownloadPanel = function (slot0, slot1)
	setActive(slot1, false)

	slot0.live2DDownloadBtn = slot0:findTF("main/resources/main_panel/live2d")
	slot0.live2DDownloadProgress = slot0:findTF("main/resources/main_panel/live2d/progress")
	slot0.live2DDownloadProgressHandle = slot0:findTF("main/resources/main_panel/live2d/progress/handle")
	slot0.live2DDownloadInfo1 = slot0:findTF("main/resources/main_panel/live2d/status")
	slot0.live2DDownloadInfo2 = slot0:findTF("main/resources/main_panel/live2d/version")
	slot0.live2DDownloadLabelNew = slot0:findTF("main/resources/main_panel/live2d/version/new")
	slot0.live2DDownloadDot = slot0:findTF("main/resources/main_panel/live2d/new")
	slot0.live2DDownloadLoading = slot0:findTF("main/resources/main_panel/live2d/loading")

	setSlider(slot0.live2DDownloadProgress, 0, 1, 0)
	setActive(slot0.live2DDownloadDot, false)
	setActive(slot0.live2DDownloadLoading, false)

	slot0.live2DDownloadTimer = Timer.New(function ()
		slot0:updateLive2DDownloadState()
	end, 0.5, -1)

	slot0.live2DDownloadTimer:Start()
	slot0:updateLive2DDownloadState()

	if Live2DUpdateMgr.Inst.state == DownloadState.None then
		slot2:CheckD()
	end

	onButton(slot0, slot0.live2DDownloadBtn, function ()
		if slot0.state == DownloadState.CheckFailure then
			slot0:CheckD()
		elseif slot0 == DownloadState.CheckToUpdate or slot0 == DownloadState.UpdateFailure then
			slot0:UpdateD(true)
		end
	end, SFX_PANEL)

	slot0.soundDownloadBtn = slot0:findTF("main/resources/main_panel/cv")
	slot0.soundDownloadProgress = slot0:findTF("main/resources/main_panel/cv/progress")
	slot0.soundDownloadProgressHandle = slot0:findTF("main/resources/main_panel/cv/progress/handle")
	slot0.soundDownloadInfo1 = slot0:findTF("main/resources/main_panel/cv/status")
	slot0.soundDownloadInfo2 = slot0:findTF("main/resources/main_panel/cv/version")
	slot0.soundDownloadLabelNew = slot0:findTF("main/resources/main_panel/cv/version/new")
	slot0.soundDownloadDot = slot0:findTF("main/resources/main_panel/cv/new")
	slot0.soundDownloadLoading = slot0:findTF("main/resources/main_panel/cv/loading")

	setSlider(slot0.soundDownloadProgress, 0, 1, 0)
	setActive(slot0.soundDownloadDot, false)
	setActive(slot0.soundDownloadLoading, false)
	CVUpdateMgr.Inst.CheckD(slot4)

	slot0.soundDownloadTimer = Timer.New(function ()
		slot0:updateSoundDownloadState()
	end, 0.5, -1)

	slot0.soundDownloadTimer:Start()
	slot0:updateSoundDownloadState()
	onButton(slot0, slot0.soundDownloadBtn, function ()
		if slot0.state == DownloadState.CheckFailure then
			slot0:CheckD()
		elseif slot0.state == DownloadState.CheckToUpdate or slot0.state == DownloadState.UpdateFailure then
			slot0:UpdateD(true)
		end
	end, SFX_PANEL)

	slot0.repairBtn = slot0:findTF("main/resources/main_panel/settings/buttons/repair")
	slot0.repairProgress = slot0.repairBtn:Find("progress")
	slot0.repairHashPath = Application.persistentDataPath .. "/hashes.csv"

	setActive(slot0.repairBtn, PLATFORM_CODE ~= PLATFORM_JP and PathMgr.FileExists(slot0.repairHashPath))
	onButton(slot0, slot0.repairBtn, function ()
		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			content = i18n("resource_verify_warn"),
			onYes = function ()
				slot0:resourceVerify()
			end
		})
	end, SFX_PANEL)
end

slot0.initSoundPanel = function (slot0, slot1)
	setActive(slot1, false)

	slot0.revertBtn = slot0:findTF("main/resources/main_panel/settings/buttons/reset")
	slot0.bgmSlider = slot0:findTF("main/resources/main_panel/settings/bgm/slider")

	setSlider(slot0.bgmSlider, 0, 1, pg.CriMgr.GetInstance():getBGMVolume())
	slot0:initSoundSlider(slot0.bgmSlider, function (slot0)
		pg.CriMgr.GetInstance():setBGMVolume(slot0)
	end)

	slot0.effectSlider = slot0:findTF("main/resources/main_panel/settings/sfx/slider")

	setSlider(slot0.effectSlider, 0, 1, pg.CriMgr.GetInstance():getSEVolume())
	slot0:initSoundSlider(slot0.effectSlider, function (slot0)
		pg.CriMgr.GetInstance():setSEVolume(slot0)
	end)

	slot0.mainSlider = slot0:findTF("main/resources/main_panel/settings/cv/slider")

	setSlider(slot0.mainSlider, 0, 1, pg.CriMgr.GetInstance():getCVVolume())
	slot0:initSoundSlider(slot0.mainSlider, function (slot0)
		pg.CriMgr.GetInstance():setCVVolume(slot0)
	end)
	onButton(slot0, slot0.revertBtn, function ()
		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			content = i18n("sure_resume_volume"),
			onYes = function ()
				pg.CriMgr.GetInstance():setBGMVolume(DEFAULT_BGMVOLUME)
				pg.CriMgr.GetInstance():setSEVolume(DEFAULT_SEVOLUME)
				pg.CriMgr.GetInstance():setCVVolume(DEFAULT_CVVOLUME)
				setSlider(slot0.bgmSlider, 0, 1, DEFAULT_BGMVOLUME)
				setSlider(slot0.effectSlider, 0, 1, DEFAULT_SEVOLUME)
				setSlider(slot0.mainSlider, 0, 1, DEFAULT_CVVOLUME)
			end
		})
	end, SFX_UI_CLICK)
end

slot0.initSoundSlider = function (slot0, slot1, slot2)
	slot3 = slot1:GetComponent("Slider")

	slot3.onValueChanged:RemoveAllListeners()
	pg.DelegateInfo.Add(slot0, slot3.onValueChanged)
	slot3.onValueChanged:AddListener(slot2)

	slot4 = (slot3.maxValue - slot3.minValue) * 0.1

	onButton(slot0, slot1:Find("up"), function ()
		slot0.value = math.clamp(slot0.value + slot1, slot0.minValue, slot0.maxValue)
	end, SFX_PANEL)
	onButton(slot0, slot1:Find("down"), function ()
		slot0.value = math.clamp(slot0.value - slot1, slot0.minValue, slot0.maxValue)
	end, SFX_PANEL)
end

slot0.initTransCodePanel = function (slot0, slot1)
	slot0.userProxy = getProxy(UserProxy)
	slot0.accountTwitterUI = slot0:findTF("page1", slot1)
	slot0.goTranscodeUIBtn = slot0:findTF("bind_account", slot0.accountTwitterUI)
	slot0.twitterBtn = slot0:findTF("bind_twitter", slot0.accountTwitterUI)
	slot0.twitterUnlinkBtn = slot0:findTF("unlink_twitter", slot0.accountTwitterUI)
	slot0.twitterLinkSign = slot0:findTF("twitter_status", slot0.accountTwitterUI)
	slot0.transcodeUI = slot0:findTF("page2", slot1)
	slot0.uidTxt = slot0:findTF("account_name/Text", slot0.transcodeUI)
	slot0.transcodeTxt = slot0:findTF("password/Text", slot0.transcodeUI)
	slot0.getCodeBtn = slot0:findTF("publish_transcode", slot0.transcodeUI)
	slot0.codeDesc = slot0:findTF("title_desc", slot0.transcodeUI)

	slot0:checkTranscodeView()
	slot0:checkAccountTwitterView()
end

slot0.showTranscode = function (slot0, slot1)
	pg.UIMgr.GetInstance():LoadingOff()
	slot0.userProxy:saveTranscode(slot1)
	slot0:checkTranscodeView()
end

slot0.checkTranscodeView = function (slot0)
	slot0.transcode = slot0.userProxy:getTranscode()

	setActive(slot0.codeDesc, slot0.transcode ~= "")
	setActive(slot0.getCodeBtn, slot0.transcode == "")

	if slot0.transcode ~= "" then
		setText(slot0.uidTxt, AiriSdkMgr.AiriSDKInst.Uid)
		setText(slot0.transcodeTxt, slot0.transcode)
	end
end

slot0.checkAccountTwitterView = function (slot0)
	setActive(slot0.twitterUnlinkBtn, AiriSdkMgr.AiriSDKInst.IsTwitterLinked)
	setActive(slot0.twitterLinkSign, AiriSdkMgr.AiriSDKInst.IsTwitterLinked)
	setActive(slot0.twitterBtn, not AiriSdkMgr.AiriSDKInst.IsTwitterLinked)

	if AiriSdkMgr.AiriSDKInst.IsTwitterLinked then
		setText(slot0.twitterLinkSign, i18n("twitter_link_title", AiriSdkMgr.AiriSDKInst.TwitterUsername))
	end
end

slot1 = {}
slot2 = {
	{
		title = i18n("words_show_ship_name_label")
	},
	{
		title = i18n("words_auto_battle_label"),
		name = AUTO_BATTLE_LABEL
	},
	{
		default = 1,
		title = i18n("words_rare_ship_vibrate"),
		name = RARE_SHIP_VIBRATE
	},
	{
		default = 1,
		title = i18n("words_display_ship_get_effect"),
		name = DISPLAY_SHIP_GET_EFFECT
	},
	{
		default = 1,
		title = i18n("words_show_touch_effect"),
		name = SHOW_TOUCH_EFFECT
	},
	{
		default = 0,
		title = i18n("words_bg_fit_mode"),
		name = BG_FIT_MODE
	}
}

slot0.initOptionsPanel = function (slot0, slot1)
	slot2 = slot1:Find("scroll_view/Viewport/content/fps_setting")

	onToggle(slot0, slot3, function (slot0)
		if slot0 then
			PlayerPrefs.SetInt("fps_limit", 30)
			PlayerPrefs.Save()

			Application.targetFrameRate = 30
		end
	end, SFX_UI_TAG, SFX_UI_TAG)
	onToggle(slot0, slot2:Find("options/60fps"), function (slot0)
		if slot0 then
			PlayerPrefs.SetInt("fps_limit", 60)
			PlayerPrefs.Save()

			Application.targetFrameRate = 60
		end
	end, SFX_UI_TAG, SFX_UI_TAG)
	triggerToggle(slot2:Find("options/30fps"), PlayerPrefs.GetInt("fps_limit", 30) == 30)
	triggerToggle(slot4, slot5 == 60)

	slot7 = slot0:findTF("scroll_view/Viewport/content/other_settings/options", slot1)
	slot8 = slot0:findTF("scroll_view/Viewport/content/notifications/options", slot1).Find(triggerToggle, "notify_tpl")

	for slot13, slot14 in ipairs(slot9) do
		slot15 = cloneTplTo(slot8, slot6)

		setText(slot0:findTF("Text", slot15), slot14.title)
		onToggle(slot0, slot15:Find("on"), function (slot0)
			pg.PushNotificationMgr.GetInstance():setSwitch(slot0.id, slot0)
		end, SFX_UI_TAG, SFX_UI_CANCEL)
		triggerToggle(slot15:Find("on"), slot16)
		triggerToggle(slot15:Find("off"), not pg.PushNotificationMgr.GetInstance():isEnabled(slot14.id))
	end

	slot8 = slot7:Find("notify_tpl")

	for slot13, slot14 in pairs(slot0) do
		setText(slot0:findTF("Text", cloneTplTo(slot8, slot7)), slot14.title)

		if slot13 == 1 then
			onToggle(slot0, slot15:Find("on"), function (slot0)
				pg.PushNotificationMgr.GetInstance():setSwitchShipName(slot0)
			end, SFX_UI_TAG, SFX_UI_CANCEL)
			triggerToggle(slot15:Find("on"), pg.PushNotificationMgr.GetInstance():isEnableShipName())
			triggerToggle(slot15:Find("off"), not pg.PushNotificationMgr.GetInstance():isEnableShipName())
		else
			slot0[slot14.name] = PlayerPrefs.GetInt(slot14.name, slot14.default or 0) > 0

			onToggle(slot0, slot15:Find("on"), function (slot0)
				if slot0[slot1.name] ~= slot0 then
					slot1(slot1.name, (slot0 and 1) or 0)
					PlayerPrefs.Save()

					slot0[slot1.name] = slot0
				end

				if slot1.name == SHOW_TOUCH_EFFECT and pg.UIMgr.GetInstance().OverlayEffect then
					setActive(slot1, slot0)
				end
			end, SFX_UI_TAG, SFX_UI_CANCEL)
			triggerToggle(slot15:Find("on"), slot0[slot14.name])
			triggerToggle(slot15:Find("off"), not slot0[slot14.name])
		end
	end
end

slot0.initInterfacePreference = function (slot0, slot1)
	setActive(slot1, false)

	slot0.editPanel = slot1:Find("editor")
	slot0.normalBtns = findTF(slot2, "normal")
	slot0.editBtns = findTF(slot2, "editing")
	slot0.saveBtn = findTF(slot0.editBtns, "save")
	slot0.cancelBtn = findTF(slot0.editBtns, "cancel")
	slot0.editBtn = findTF(slot0.normalBtns, "edit")
	slot0.revertBtn = findTF(slot0.normalBtns, "reset")

	onButton(slot0, slot0.editBtn, function ()
		slot0:editModeEnabled(true)
	end, SFX_PANEL)
	onButton(slot0, slot0.revertBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = false,
			content = i18n("setting_interface_revert_check"),
			onYes = function ()
				slot0:revertInterfaceSetting(true)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.cancelBtn, function ()
		if slot0._currentDrag then
			LuaHelper.triggerEndDrag(slot0._currentDrag)
		end

		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			hideNo = false,
			content = i18n("setting_interface_cancel_check"),
			onYes = function ()
				slot0:editModeEnabled(false)
				slot0.editModeEnabled:revertInterfaceSetting(false)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.saveBtn, function ()
		if slot0._currentDrag then
			LuaHelper.triggerEndDrag(slot0._currentDrag)
		end

		slot0:editModeEnabled(false)
		slot0.editModeEnabled:saveInterfaceSetting()
		pg.TipsMgr:GetInstance():ShowTips(i18n("setting_interface_save_success"))
	end, SFX_PANEL)

	slot0.interface = slot0:findTF("main/battle_ui/editor/editing_region")

	if rtf(slot0.interface).rect.width / rtf(slot0.interface).rect.height > rtf(slot0._tf).rect.width / rtf(slot0._tf).rect.height then
		slot8 = rtf(slot0.interface).sizeDelta.y
		slot0.scale = slot4 / slot6
		slot7 = rtf(slot0.interface).sizeDelta.x - (slot3 - (slot4 * slot5) / slot6)
	else
		slot7 = rtf(slot1).sizeDelta.x
		slot0.scale = slot3 / slot5
		slot8 = rtf(slot1).sizeDelta.y - (slot4 - (slot3 * slot6) / slot5)
	end

	slot7 = Vector3.New(slot0.scale, slot0.scale, 1)
	slot0.stick = findTF(slot0.interface, "Stick")
	slot0.skillBtn1 = findTF(slot0.interface, "Skill_1")
	slot0.skillBtn2 = findTF(slot0.interface, "Skill_2")
	slot0.skillBtn3 = findTF(slot0.interface, "Skill_3")
	slot0.skillBtn4 = findTF(slot0.interface, "Skill_4")
	slot0.mask = findTF(slot0.interface, "mask")

	slot0:initInterfaceComponent(slot0.stick, "joystick_anchorX", "joystick_anchorY", slot8)
	slot0:initInterfaceComponent(slot0.skillBtn1, "skill_1_anchorX", "skill_1_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[1])
	slot0:initInterfaceComponent(slot0.skillBtn2, "skill_2_anchorX", "skill_2_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[2])
	slot0:initInterfaceComponent(slot0.skillBtn3, "skill_3_anchorX", "skill_3_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[3])
	slot0:initInterfaceComponent(slot0.skillBtn4, "skill_4_anchorX", "skill_4_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[4])

	slot0.components = {
		findTF(slot0.interface, "top"),
		slot0.stick,
		slot0.skillBtn1,
		slot0.skillBtn2,
		slot0.skillBtn3,
		slot0.skillBtn4
	}

	for slot14 = 2, #slot0.components, 1 do
		setLocalScale(slot0.components[slot14], slot7)
	end

	slot0:editModeEnabled(false)
end

slot0.initInterfaceComponent = function (slot0, slot1, slot2, slot3, slot4)
	slot7 = rtf(slot0._tf).rect.width * 0.5 + slot0.interface.localPosition.x + slot0.interface.parent.localPosition.x + slot0.interface.parent.parent.localPosition.x
	slot8 = rtf(slot0._tf).rect.height * 0.5 + slot0.interface.localPosition.y + slot0.interface.parent.localPosition.y + slot0.interface.parent.parent.localPosition.y
	slot9 = GetOrAddComponent(slot1, "EventTriggerListener")
	slot0.eventTriggers[slot9] = true
	slot10, slot11, slot12, slot13 = nil

	slot9:AddBeginDragFunc(function (slot0, slot1)
		slot0._currentDrag = slot1
		slot2 = slot1 / UnityEngine.Screen.width
		slot4 = slot5 / UnityEngine.Screen.height

		for slot5 = 2, #slot0.components, 1 do
			if slot0.components[slot5] ~=  then
				GetOrAddComponent(slot6, "EventTriggerListener").enabled = false
			end
		end

		slot7 = slot6.localPosition.x
		slot8 = slot6.localPosition.y
	end)
	slot9:AddDragFunc(function (slot0, slot1)
		slot0.localPosition = Vector3(slot1.position.x * slot1 - slot2, slot1.position.y * slot3 - slot4, 0)

		slot5:checkInterfaceIntersect()
	end)
	slot9:AddDragEndFunc(function (slot0, slot1)
		slot0._currentDrag = nil

		if slot0:checkInterfaceIntersect() then
			slot1.localPosition = Vector3(slot2, slot1, 0)
		end

		for slot6 = 2, #slot0.components, 1 do
			GetOrAddComponent(slot0.components[slot6], "EventTriggerListener").enabled = true
		end

		slot0:checkInterfaceIntersect()
	end)
	slot0:setInterfaceAnchor(slot1, slot2, slot3, slot4)
end

slot0.initHelpPanel = function (slot0, slot1)
	onButton(slot0, slot1, function ()
		print("help:")
		pg.SDKMgr:GetInstance():bugReport()
	end, SFX_CANCEL)
end

slot0.editModeEnabled = function (slot0, slot1)
	setActive(slot0.normalBtns, not slot1)
	setActive(slot0.mask, not slot1)
	setActive(slot0.editBtns, slot1)

	for slot5, slot6 in ipairs(slot0.components) do
		setActive(findTF(slot6, "rect"), slot1)

		if slot5 > 1 then
			GetOrAddComponent(slot6, "EventTriggerListener").enabled = slot1
		end
	end

	slot0.backButton:GetComponent(typeof(Button)).interactable = not slot1
	slot0.otherToggle:GetComponent(typeof(Toggle)).interactable = not slot1
	slot0.optionsToggle:GetComponent(typeof(Toggle)).interactable = not slot1
	slot0.interfaceToggle:GetComponent(typeof(Toggle)).interactable = not slot1
	slot0.resToggle:GetComponent(typeof(Toggle)).interactable = not slot1
	slot0.logoutButton:GetComponent("ButtonExtend").interactable = not slot1
end

slot0.setInterfaceAnchor = function (slot0, slot1, slot2, slot3, slot4, slot5)
	slot6, slot7 = nil

	if slot5 then
		slot6 = slot4.x
		slot7 = slot4.y
	else
		slot6 = PlayerPrefs.GetFloat(slot2, slot4.x)
		slot7 = PlayerPrefs.GetFloat(slot3, slot4.y)
	end

	slot1.localPosition = Vector3((slot6 - 0.5) * rtf(slot0.interface).rect.width, (slot7 - 0.5) * rtf(slot0.interface).rect.height, 0)
end

function slot3(slot0)
	slot1 = rtf(slot0)

	return UnityEngine.Rect.New(slot1.position.x - (slot1.rect.width * slot1.lossyScale.x) / 2, slot1.position.y - (slot1.rect.height * slot1.lossyScale.y) / 2, slot1.rect.width * slot1.lossyScale.x, slot1.rect.height * slot1.lossyScale.y)
end

slot0.checkInterfaceIntersect = function (slot0)
	slot1 = {}
	slot2 = false
	slot3 = {}
	slot4 = slot0(slot0.interface)

	for slot8, slot9 in ipairs(slot0.components) do
		slot3[slot9] = slot0(slot9:Find("rect"))
	end

	for slot8, slot9 in ipairs(slot0.components) do
		for slot13, slot14 in ipairs(slot0.components) do
			if slot9 ~= slot14 and slot3[slot9]:Overlaps(slot3[slot14]) then
				slot1[slot14] = true
			end
		end

		if slot8 > 1 then
			slot11 = Vector2.New(slot3[slot9].xMax, slot3[slot9].yMax)

			if not slot4:Contains(Vector2.New(slot3[slot9].xMin, slot3[slot9].yMin)) or not slot4:Contains(slot11) then
				slot1[slot9] = true
			end
		end
	end

	for slot8, slot9 in ipairs(slot0.components) do
		slot10 = findTF(slot9, "rect"):GetComponent(typeof(Image))

		if slot1[slot9] then
			slot10.color = slot1.CLD_RED
			slot2 = true
		else
			slot10.color = slot1.DEFAULT_GREY
		end
	end

	return slot2
end

slot0.revertInterfaceSetting = function (slot0, slot1)
	slot0:setInterfaceAnchor(slot0.stick, "joystick_anchorX", "joystick_anchorY", slot2, slot1)
	slot0:setInterfaceAnchor(slot0.skillBtn1, "skill_1_anchorX", "skill_1_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[1], slot1)
	slot0:setInterfaceAnchor(slot0.skillBtn2, "skill_2_anchorX", "skill_2_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[2], slot1)
	slot0:setInterfaceAnchor(slot0.skillBtn3, "skill_3_anchorX", "skill_3_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[3], slot1)
	slot0:setInterfaceAnchor(slot0.skillBtn4, "skill_4_anchorX", "skill_4_anchorY", ys.Battle.BattleConfig.SKILL_BUTTON_DEFAULT_PREFERENCE[4], slot1)
	slot0:saveInterfaceSetting()
end

slot0.saveInterfaceSetting = function (slot0)
	slot0:overrideInterfaceSetting(slot0.stick, "joystick_anchorX", "joystick_anchorY")
	slot0:overrideInterfaceSetting(slot0.skillBtn1, "skill_1_anchorX", "skill_1_anchorY")
	slot0:overrideInterfaceSetting(slot0.skillBtn2, "skill_2_anchorX", "skill_2_anchorY")
	slot0:overrideInterfaceSetting(slot0.skillBtn3, "skill_3_anchorX", "skill_3_anchorY")
	slot0:overrideInterfaceSetting(slot0.skillBtn4, "skill_4_anchorX", "skill_4_anchorY")
end

slot0.overrideInterfaceSetting = function (slot0, slot1, slot2, slot3)
	PlayerPrefs.SetFloat(slot2, slot6)
	PlayerPrefs.SetFloat(slot3, (slot1.localPosition.y + rtf(slot0.interface).rect.height * 0.5) / rtf(slot0.interface).rect.height)
end

slot0.updateSoundDownloadState = function (slot0)
	slot3, slot4, slot5, slot6, slot7 = nil
	slot8 = false

	if CVUpdateMgr.Inst.state == DownloadState.None then
		slot3 = i18n("word_soundfiles_download_title")
		slot4 = i18n("word_soundfiles_download")
		slot5 = "DOWNLOAD"
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.Checking then
		slot3 = i18n("word_soundfiles_checking_title")
		slot4 = i18n("word_soundfiles_checking")
		slot5 = "CHECKING"
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.CheckToUpdate then
		slot3 = i18n("word_soundfiles_checkend_title")
		slot4 = i18n("word_soundfiles_checkend")
		slot5 = string.format("V.%d > V.%d", slot1.localVersion.Build, slot1.serverVersion.Build)
		slot6 = 0
		slot7 = true
	elseif slot2 == DownloadState.CheckOver then
		slot3 = i18n("word_soundfiles_checkend_title")
		slot4 = i18n("word_soundfiles_noneedupdate")
		slot5 = "V." .. slot1.currentVersion.Build
		slot6 = 1
		slot7 = false
	elseif slot2 == DownloadState.CheckFailure then
		slot3 = i18n("word_soundfiles_checkfailed")
		slot4 = i18n("word_soundfiles_retry")
		slot5 = string.format("ERROR(CODE:%d)", slot1.errorCode)
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.Updating then
		slot3 = i18n("word_soundfiles_update")
		slot4 = string.format("(%d/%d)", slot1.downloadCount, slot1.downloadTotal)
		slot5 = slot1.downPath
		slot6 = slot1.downloadCount / math.max(slot1.downloadTotal, 1)
		slot7 = false
		slot8 = true
	elseif slot2 == DownloadState.UpdateSuccess then
		slot3 = i18n("word_soundfiles_update_end_title")
		slot4 = i18n("word_soundfiles_update_end")
		slot5 = "V." .. slot1.currentVersion.Build
		slot6 = 1
		slot7 = false
	elseif slot2 == DownloadState.UpdateFailure then
		slot3 = i18n("word_soundfiles_update_failed")
		slot4 = i18n("word_soundfiles_update_retry")
		slot5 = string.format("ERROR(CODE:%d)", slot1.errorCode)
		slot6 = slot1.downloadCount / math.max(slot1.downloadTotal, 1)
		slot7 = true
	end

	if slot5:len() > 15 then
		slot5 = slot5:sub(1, 12) .. "..."
	end

	setText(slot0.soundDownloadInfo1, slot4)
	setText(slot0.soundDownloadInfo2, slot5)
	setAnchoredPosition(slot0.soundDownloadInfo2, {
		x = (slot2 == DownloadState.CheckToUpdate and 82.5) or 91.5
	})
	setSlider(slot0.soundDownloadProgress, 0, 1, slot6)
	setActive(slot0.soundDownloadProgressHandle, slot6 ~= 0 and slot6 ~= 1)
	setActive(slot0.soundDownloadDot, slot7)
	setActive(slot0.soundDownloadLoading, slot8)
	setActive(slot0.soundDownloadLabelNew, slot2 == DownloadState.CheckToUpdate)
end

slot0.updateLive2DDownloadState = function (slot0)
	slot3, slot4, slot5, slot6, slot7 = nil
	slot8 = false

	if Live2DUpdateMgr.Inst.state == DownloadState.None then
		slot3 = i18n("word_live2dfiles_download_title")
		slot4 = i18n("word_live2dfiles_download")
		slot5 = "DOWNLOAD"
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.Checking then
		slot3 = i18n("word_live2dfiles_checking_title")
		slot4 = i18n("word_live2dfiles_checking")
		slot5 = "CHECKING"
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.CheckToUpdate then
		if slot1.serverVersion.Build <= slot1.localVersion.Build then
			slot1.state = DownloadState.CheckOver

			slot0:updateLive2DDownloadState()

			return
		end

		slot3 = i18n("word_live2dfiles_checkend_title")
		slot4 = i18n("word_live2dfiles_checkend")
		slot5 = string.format("V.%d > V.%d", slot1.localVersion.Build, slot1.serverVersion.Build)
		slot6 = 0
		slot7 = true
	elseif slot2 == DownloadState.CheckOver then
		slot3 = i18n("word_live2dfiles_checkend_title")
		slot4 = i18n("word_live2dfiles_noneedupdate")
		slot5 = "V." .. slot1.currentVersion.Build
		slot6 = 1
		slot7 = false
	elseif slot2 == DownloadState.CheckFailure then
		slot3 = i18n("word_live2dfiles_checkfailed")
		slot4 = i18n("word_live2dfiles_retry")
		slot5 = string.format("ERROR(CODE:%d)", slot1.errorCode)
		slot6 = 0
		slot7 = false
	elseif slot2 == DownloadState.Updating then
		slot3 = i18n("word_live2dfiles_update")
		slot4 = string.format("(%d/%d)", slot1.downloadCount, slot1.downloadTotal)
		slot5 = slot1.downPath
		slot6 = slot1.downloadCount / math.max(slot1.downloadTotal, 1)
		slot7 = false
		slot8 = true
	elseif slot2 == DownloadState.UpdateSuccess then
		slot3 = i18n("word_live2dfiles_update_end_title")
		slot4 = i18n("word_live2dfiles_update_end")
		slot5 = "V." .. slot1.currentVersion.Build
		slot6 = 1
		slot7 = false
	elseif slot2 == DownloadState.UpdateFailure then
		slot3 = i18n("word_live2dfiles_update_failed")
		slot4 = i18n("word_live2dfiles_update_retry")
		slot5 = string.format("ERROR(CODE:%d)", slot1.errorCode)
		slot6 = slot1.downloadCount / math.max(slot1.downloadTotal, 1)
		slot7 = true
	end

	if slot5:len() > 15 then
		slot5 = slot5:sub(1, 12) .. "..."
	end

	setText(slot0.live2DDownloadInfo1, slot4)
	setText(slot0.live2DDownloadInfo2, slot5)
	setAnchoredPosition(slot0.live2DDownloadInfo2, {
		x = (slot2 == DownloadState.CheckToUpdate and 82.5) or 91.5
	})
	setSlider(slot0.live2DDownloadProgress, 0, 1, slot6)
	setActive(slot0.live2DDownloadProgressHandle, slot6 ~= 0 and slot6 ~= 1)
	setActive(slot0.live2DDownloadDot, slot7)
	setActive(slot0.live2DDownloadLoading, slot8)
	setActive(slot0.live2DDownloadLabelNew, slot2 == DownloadState.CheckToUpdate)
end

slot4 = nil

function slot5()
	return pg.SecondaryPWDMgr.GetInstance() or {
		[slot0.UNLOCK_SHIP] = {
			title = i18n("words_settings_unlock_ship")
		},
		[slot0.RESOLVE_EQUIPMENT] = {
			title = i18n("words_settings_resolve_equip")
		},
		[slot0.UNLOCK_COMMANDER] = {
			title = i18n("words_settings_unlock_commander")
		},
		[slot0.CREATE_INHERIT] = {
			title = i18n("words_settings_create_inherit")
		}
	}
end

slot0.initOtherPanel = function (slot0)
	if PlayerPrefs.GetFloat("firstIntoOtherPanel") == 0 then
		setActive(slot0.otherToggle:Find("tip"), true)
	end

	slot0.otherContent = slot0:findTF("main/other/scroll_view/Viewport/content")
	slot0.redeem = slot0:findTF("redeem", slot0.otherContent)
	slot1 = true

	setActive(slot0:findTF("account", slot0.otherContent), false)

	if PLATFORM_CODE == PLATFORM_CH and PLATFORM_CODE == PLATFORM_KR then
		if PLATFORM == PLATFORM_IPHONEPLAYER then
			slot1 = false
		end
	elseif PLATFORM_CODE == PLATFORM_JP then
		slot0.accountJP = slot0:findTF("account", slot0.otherContent)

		setActive(slot0.accountJP, true)
		slot0:initTransCodePanel(slot0.accountJP)

		slot1 = false
	elseif PLATFORM_CODE == PLATFORM_US then
		slot0.accountUS = slot0:findTF("account_us", slot0.otherContent)

		setActive(slot0.accountUS, true)
		slot0:initUSAccountPanel(slot0.accountUS)

		slot1 = false
	end

	if slot1 then
		setActive(slot0.redeem, true)

		slot0.codeInput = slot0:findTF("voucher", slot0.redeem)
		slot0.placeholder = slot0:findTF("Placeholder", slot0.codeInput)
		slot0.placeholder:GetComponent(typeof(Text)).text = i18n("exchangecode_use_placeholder")
		slot0.achieveBtn = slot0:findTF("submit", slot0.codeInput)

		onButton(slot0, slot0.achieveBtn, function ()
			pg.m02:sendNotification(GAME.EXCHANGECODE_USE, {
				key = slot0.codeInput:GetComponent(typeof(InputField)).text
			})
		end, SFX_CONFIRM)
		setGray(slot0.achieveBtn, getInputText(slot0.codeInput) == "")
		onInputChanged(slot0, slot0.codeInput, function ()
			slot0(slot0.achieveBtn, getInputText(slot0.codeInput) == "")
		end)
	else
		setActive(slot0.redeem, false)
	end

	onButton(slot0, slot2, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("secondary_password_help")
		})
	end)

	slot3 = slot0:findTF("secondpwd", slot0.otherContent)
	slot6 = pg.SecondaryPWDMgr.GetInstance()
	slot8 = getProxy(SecondaryPWDProxy).getRawData(slot7)

	onButton(slot0, slot4, function ()
		if slot0.state > 0 then
			slot1:ChangeSetting({}, function ()
				slot0:updateOtherPanel()
			end)
		end
	end, SFX_UI_TAG)
	onButton(slot0, slot5, function ()
		if slot0.state <= 0 then
			function slot0()
				slot0:SetPassword(function ()
					slot0:updateOtherPanel()
				end)
			end

			if PlayerPrefs.GetFloat("firstOpenSecondaryPassword") == 0 then
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					type = MSGBOX_TYPE_HELP,
					helps = i18n("secondary_password_help"),
					onYes = slot0,
					onClose = slot0
				})
				PlayerPrefs.SetFloat("firstOpenSecondaryPassword", 1)
				PlayerPrefs.Save()
			else
				slot0()
			end
		end
	end, SFX_UI_TAG)

	slot9 = slot0:findTF("limited_operations/options", slot0.otherContent)
	slot10 = slot0:findTF("notify_tpl")
	slot0.secPwdOpts = {}

	for slot14, slot15 in ipairs(slot0()) do
		if table.contains(slot6.LIMITED_OPERATION, slot14) then
			slot16 = cloneTplTo(slot10, slot9)
			slot0.secPwdOpts[slot14] = slot16

			setText(slot0:findTF("Text", slot16), slot15.title)
			onButton(slot0, slot16, function ()
				slot1 = nil

				if not table.contains(slot0.system_list, ) then
					Clone(slot0.system_list)[#Clone(slot0.system_list) + 1] = slot1

					table.sort(Clone(slot0.system_list), function (slot0, slot1)
						return slot0 < slot1
					end)
				elseif slot0 then
					for slot5 = #Clone(slot0.system_list), 1, -1 do
						if slot1[slot5] == slot1 then
							table.remove(slot1, slot5)
						end
					end
				end

				slot2:ChangeSetting(slot1, function ()
					slot0:updateOtherPanel()
				end)
			end, SFX_UI_TAG)
		end
	end

	slot0:updateOtherPanel()
end

slot0.updateOtherPanel = function (slot0)
	slot1 = slot0:findTF("secondpwd", slot0.otherContent)
	slot2 = slot1:Find("options/close")
	slot3 = slot1:Find("options/open")
	slot4 = pg.SecondaryPWDMgr.GetInstance()

	setActive(slot2:Find("on"), not (getProxy(SecondaryPWDProxy).getRawData(slot5).state > 0))
	setActive(slot2:Find("off"), getProxy(SecondaryPWDProxy).getRawData(slot5).state > 0)
	setActive(slot3:Find("on"), getProxy(SecondaryPWDProxy).getRawData(slot5).state > 0)
	setActive(slot3:Find("off"), not (getProxy(SecondaryPWDProxy).getRawData(slot5).state > 0))

	for slot11, slot12 in pairs(slot0.secPwdOpts) do
		slot13 = table.contains(slot6.system_list, slot11)
		slot12:GetComponent(typeof(Button)).interactable = slot7

		setActive(slot12:Find("on/on_on"), slot13)
		setActive(slot12:Find("off/off_off"), slot13)
		setActive(slot12:Find("on/on_off"), not slot13)
		setActive(slot12:Find("off/off_on"), not slot13)
	end
end

slot0.clearExchangeCode = function (slot0)
	slot0.codeInput:GetComponent(typeof(InputField)).text = ""
end

slot6 = true

slot0.onAddToggleEvent = function (slot0, slot1, slot2, slot3, slot4, slot5)
	pg.DelegateInfo.Add(slot1, slot7)
	GetComponent(slot2, typeof(Toggle)).onValueChanged.AddListener(slot7, function (slot0)
		if slot0 then
			if slot0 and slot1 and slot2.isOn == slot0 then
				slot1 = SFX_UI_TAG

				playSoundEffect(playSoundEffect)
			elseif not slot0 and slot3 then
				playSoundEffect(slot3)
			end
		end

		slot4(slot0)
	end)

	if not IsNil(GetComponent(slot2, typeof(UIToggleEvent))) then
		slot8:Rebind()
	end
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0.backButton, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_CANCEL)
	onButton(slot0, slot0.logoutButton, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("main_settingsScene_quest_exist"),
			onYes = function ()
				slot0:emit(SettingsMediator.ON_LOGOUT)
			end
		})
	end, SFX_PANEL)
	slot0:onAddToggleEvent(slot0, slot0.otherToggle, function (slot0)
		if slot0 and PlayerPrefs.GetFloat("firstIntoOtherPanel") == 0 then
			setActive(slot1, false)

			slot2 = slot0:findTF("main/other/scroll_view/Viewport/content")

			setAnchoredPosition(slot2, {
				x = slot2.anchoredPosition.x,
				y = -slot0:findTF("secondpwd", slot2).anchoredPosition.y
			})
			PlayerPrefs.SetFloat("firstIntoOtherPanel", 1)
			PlayerPrefs.Save()
		end
	end)
	triggerToggle(slot0.soundToggle, true)

	slot0._cvTest = slot0:findTF("cvTest")
	slot0._hpBtn = slot0:findTF("dungeon_hp")

	if PLATFORM_CODE == PLATFORM_JP then
		onButton(slot0, slot0.getCodeBtn, function ()
			if slot0.transcode == "" then
				pg.SecondaryPWDMgr:LimitedOperation(pg.SecondaryPWDMgr.CREATE_INHERIT, nil, function ()
					AiriSdkMgr.inst:TranscodeRequest()
					pg.UIMgr.GetInstance():LoadingOn()
				end)
			end
		end)
		onButton(slot0, slot0.twitterBtn, function ()
			pg.UIMgr.GetInstance():LoadingOn()
			AiriSdkMgr.inst:LinkTwitter()
		end)
		onButton(slot0, slot0.twitterUnlinkBtn, function ()
			pg.UIMgr.GetInstance():LoadingOn()
			AiriSdkMgr.inst:UnlinkTwitter()
		end)
		onButton(slot0, slot0.goTranscodeUIBtn, function ()
			setActive(slot0.accountTwitterUI, false)
			setActive(slot0.transcodeUI, true)
		end)
	end

	if SFX_TEST then
		setActive(slot0._cvTest, true)

		slot0._cvPanel = slot0:findTF("CVTestPanel")
		slot0._cvPanelBack = slot0:findTF("back", slot0._cvPanel)
		slot0._cvPlay = slot0:findTF("characterPlay", slot0._cvPanel)
		slot0._cvID = slot0:findTF("characterID", slot0._cvPanel)
		slot0._cvLabel = slot0:findTF("voiceLabel", slot0._cvPanel)
		slot0._cvPre = slot0:findTF("preVoice", slot0._cvPanel)
		slot0._cvPost = slot0:findTF("postVoice", slot0._cvPanel)
		slot0._cvChat = slot0:findTF("chat", slot0._cvPanel)
		slot0._cvNameList = {
			{
				"get",
				"unlock",
				1
			},
			{
				"login",
				"login",
				1
			},
			{
				"detail",
				"detail",
				1
			},
			{
				"main_1",
				"main",
				1
			},
			{
				"main_2",
				"main",
				2
			},
			{
				"main_3",
				"main",
				3
			},
			{
				"touch_1",
				"touch",
				1
			},
			{
				"touch_2",
				"touch2",
				1
			},
			{
				"task",
				"mission",
				1
			},
			{
				"headtouch",
				"touch_head",
				1
			},
			{
				"warcry",
				"battle",
				1
			},
			{
				"mvp",
				"win_mvp",
				1
			},
			{
				"lose",
				"lose",
				1
			},
			{
				"skill",
				"skill",
				1
			},
			{
				"mail",
				"mail"
			},
			{
				"home",
				"home"
			},
			{
				"mission_complete",
				"mission_complete"
			},
			{
				"profile",
				"profile"
			},
			{
				"feeling1",
				"feeling1"
			},
			{
				"feeling2",
				"feeling2"
			},
			{
				"feeling3",
				"feeling3"
			},
			{
				"feeling4",
				"feeling4"
			},
			{
				"feeling5",
				"feeling5"
			},
			{
				"expedition",
				"expedition"
			},
			{
				"profile",
				"profile"
			},
			{
				"propose",
				"propose"
			},
			{
				"upgrade",
				"upgrade"
			}
		}

		onButton(slot0, slot0._cvTest, function ()
			setActive(slot0._cvPanel, true)

			setActive._cvList = {}
			setActive._cvIndex = 1
		end)

		function slot1()
			if slot0._currentVoice then
				slot0._currentVoice:Stop(true)
			end

			slot0 = tonumber(slot0._cvID:GetComponent(typeof(InputField)).text)
			slot0._cvLabel:GetComponent(typeof(Text)).text = slot0._cvNameList[slot0._cvIndex][1]

			if slot0._cvNameList[slot0._cvIndex][1] == "skill" then
				slot0._cvChat:GetComponent(typeof(Text)).text = ""
				slot0._currentVoice = playSoundEffect(Ship.getCVPath(slot0, slot1[1]))
			else
				slot0._cvChat:GetComponent(typeof(Text)).text, slot6 = Ship.getWords(slot0, slot1[2], slot1[3])
				slot0._currentVoice = playSoundEffect(slot3)
			end
		end

		onButton(slot0, slot0._cvPlay, function ()
			function slot2()
				pg.CriMgr:LoadBattleCV(pg.CriMgr.LoadBattleCV, function ()
					slot0._cvList[slot1] = 
					-- Decompilation error in this vicinity:
					true


					-- Decompilation error in this vicinity:
					true()
				end)
			end

			if slot0._cvList[Ship.getCVKeyID(slot0)] then
				slot1()
			else
				pg.CriMgr:LoadCV(slot1, slot2)
			end
		end)
		onButton(slot0, slot0._cvPanelBack, function ()
			setActive(slot0._cvPanel, false)
			setActive:clearCV()
		end)
		onButton(slot0, slot0._cvPre, function ()
			slot0._cvIndex = slot0._cvIndex - 1

			if slot0._cvIndex <= 0 then
				slot0._cvIndex = #slot0._cvNameList
			end

			slot1()
		end)
		onButton(slot0, slot0._cvPost, function ()
			slot0._cvIndex = slot0._cvIndex + 1

			if slot0._cvIndex > #slot0._cvNameList then
				slot0._cvIndex = 1
			end

			slot1()
		end)
		onButton(slot0, slot0:findTF("CVTestPanel/play"), function ()
			pg.StoryMgr.GetInstance():Play(slot0:findTF("CVTestPanel/playid"):GetComponent(typeof(InputField)).text, nil, true)
		end)
		setActive(slot0._hpBtn, true)

		slot0._dungeonHPPanel = slot0:findTF("dungeonHPPanel")
		slot0._dungeonID = slot0:findTF("dungeonHPPanel/dungeonID")
		slot0._dungeonLV = slot0:findTF("dungeonHPPanel/dungeonLV")
		slot0._dungeonHP = slot0:findTF("dungeonHPPanel/DMG")

		onButton(slot0, slot0._hpBtn, function ()
			setActive(slot0._dungeonHPPanel, true)
		end)
		onButton(slot0, slot0:findTF("dungeonHPPanel/calcBtn"), function ()
			slot1 = tonumber(slot0._dungeonLV:GetComponent(typeof(InputField)).text)
			slot2 = 0
			slot3 = {}

			for slot8, slot9 in ipairs(ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot0).stages) do
				for slot13, slot14 in ipairs(slot9.waves) do
					if slot14.triggerType == ys.Battle.BattleConst.WaveTriggerType.NORMAL then
						for slot18, slot19 in ipairs(slot14.spawn) do
							slot3[#slot3 + 1] = slot19.monsterTemplateID
						end

						if slot14.reinforcement then
							for slot18, slot19 in ipairs(slot14.reinforcement) do
								slot3[#slot3 + 1] = slot19.monsterTemplateID
							end
						end
					end
				end
			end

			for slot8, slot9 in ipairs(slot3) do
				slot2 = slot2 + ys.Battle.BattleDataFunction.GetMonsterTmpDataFromID(slot9).durability + ys.Battle.BattleDataFunction.GetMonsterTmpDataFromID(slot9).durability_growth * (slot1 - 1) / 1000
			end

			setText(slot0._dungeonHP, slot2)
		end)

		return
	end

	setActive(slot0._cvTest, false)
	setActive(slot0._hpBtn, false)
end

slot0.onBackPressed = function (slot0)
	if isActive(slot0.repairMask) then
		return
	end

	playSoundEffect(SFX_CANCEL)

	if isActive(GameObject.Find("OverlayCamera/Overlay/UIMain/DialogPanel")) then
		triggerButton(slot1.transform:Find("dialog/title/back"))

		return
	end

	slot0:emit(slot0.ON_BACK)

	if BUTTON_SOUND_EFFECT then
		playSoundEffect(SFX_CANCEL)
	end
end

slot0.clearCV = function (slot0)
	if slot0._currentVoice then
		slot0._currentVoice:Stop(true)
	end

	slot0._currentVoice = nil

	if slot0._cvList then
		for slot4, slot5 in pairs(slot0._cvList) do
			pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(slot4))
			pg.CriMgr.UnloadCVBank(pg.CriMgr.GetBattleCVBankName(slot4))
		end
	end

	slot0._cvList = nil
end

slot0.willExit = function (slot0)
	if slot0.eventTriggers then
		for slot4, slot5 in pairs(slot0.eventTriggers) do
			ClearEventTrigger(slot4)
		end

		slot0.eventTriggers = nil
	end

	slot0:clearCV()
	slot0.soundDownloadTimer:Stop()

	slot0.soundDownloadTimer = nil

	slot0.live2DDownloadTimer:Stop()

	slot0.live2DDownloadTimer = nil
	slot0.userProxy = nil
end

slot0.resourceVerify = function (slot0)
	slot1 = nil
	slot3 = {}

	setActive(slot0.repairMask, true)

	function slot4()
		setActive(slot0.repairMask, false)
		print(slot0.repairMask)

		if slot0.repairMask then
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("resource_verify_fail", pg.MsgboxMgr.GetInstance()),
				onYes = function ()
					VersionMgr.Inst:DeleteCacheFiles()
					Application.Quit()
				end,
				onNo = function ()
					VersionMgr.Inst:DeleteCacheFiles()
				end
			})
		else
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("resource_verify_success")
			})
		end
	end

	slot6 = nil


	-- Decompilation error in this vicinity:
	function (slot0)
		if slot0 < 0 then
			slot0()

			return
		end

		setSlider(slot1.repairProgress, 0, , slot2 - slot0)

		slot3 = string.split(slot3[slot0], ",")[3]

		if PathMgr.FileExists(PathMgr.getAssetBundle(slot2)) and slot3 == HashUtil.CalcMD5(PathMgr.ReadAllBytes(PathMgr.getAssetBundle(slot2))) then
			onNextTick(function ()
				slot0(slot1 - 1)
			end)

			return
		end

		slot5 = slot2

		slot0()
	end(PathMgr.ReadAllLines(slot0.repairHashPath).Length - 1)
end

return slot0
