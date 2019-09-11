slot0 = class("MainUI", import("..base.BaseUI"))
slot1 = Mathf
slot0.EJECT_DURATION = 0.5
slot0.EJECT_DURATION_ENTER = 0.4
slot0.DIRECTION_RIGHT = 1
slot0.DIRECTION_DOWN = 2
slot0.DIRECTION_LEFT = 3
slot0.DIRECTION_UP = 4
slot0.DIRECTION_DOWN_RIGHT = 5
slot0.DIRECTION_UP_LEFT = 6
slot0.REVERT_VERTICAL = -1
slot0.REVERT_HERIZONTAL = -2
slot0.REVERT_HERIZONTAL_VERTICAL = -3
slot0.STATE_MAIN = 1
slot0.STATE_SECONDARY = 2
slot0.STATE_ALL_HIDE = 3
slot0.TOUCH_HEIGHT = 20
slot0.TOUCH_LOOP = 1
slot0.TOUCH_DURATION = 0.1
slot0.BREATH_HEIGHT = -20
slot0.DEFAULT_HEIGHT = -10
slot0.BREATH_DURATION = 2.3
slot0.CHAT_HEIGHT = 15
slot0.CHAT_DURATION = 0.3
slot0.PAINT_DEFAULT_POS_X = -600
slot0.CHAT_SHOW_TIME = 3
slot0.CHAT_INTERVAL = 30
slot0.CHAT_ANIMATION_TIME = 0.3
slot0.BG_DAY = "day"
slot0.BG_NIGHT = "night"
slot0.BG_TIMELINE_DAY = 5
slot0.BG_TIMELINE_NIGHT = 18
slot0.BG_TIMES = {
	{
		0,
		5,
		"night"
	},
	{
		5,
		8,
		"twilight"
	},
	{
		5,
		16,
		"day"
	},
	{
		16,
		19,
		"twilight"
	},
	{
		19,
		24,
		"night"
	}
}
slot0.BUFFTEXT_SHOW_TIME = 7
slot2 = nil
slot3 = pg.ship_spine_shift

slot0.getUIName = function (slot0)
	return "MainUI"
end

slot0.getBGM = function (slot0)
	return "main"
end

slot0.setShips = function (slot0, slot1)
	slot0.ships = slot1
end

slot0.setBG = function (slot0)
	slot1 = pg.TimeMgr.GetInstance():GetServerHour()
	slot2 = ""

	for slot6, slot7 in ipairs(slot0.BG_TIMES) do
		if slot7[1] <= slot1 and slot1 < slot7[2] then
			slot2 = "commonbg/bg_main_" .. slot7[3]

			break
		end
	end

	if slot2 then
		PoolMgr.GetInstance():GetSprite(slot2, "", false, function (slot0)
			setImageSprite(slot0._bg:Find("bg"), slot0)
		end)
	end
end

slot0.Ctor = function (slot0)
	slot0.super.Ctor(slot0)

	slot1 = pg.AssistantInfo
end

slot0.init = function (slot0)
	slot0._guiderLoaded = true
	slot0._leftPanel = slot0:findTF("toTop/frame/leftPanel")
	slot0._hideBtn = slot0:findTF("toTop/frame/leftPanel/hideButton")
	slot0._cameraBtn = slot0:findTF("toTop/frame/leftPanel/cameraButton")
	slot0._chatBtn = slot0:findTF("toTop/frame/leftPanel/chatButton")
	slot0._monthCardBtn = slot0:findTF("toTop/frame/leftPanel/monthCardButton")
	slot0._commissionBtn = slot0:findTF("toTop/frame/leftPanel/commissionButton")
	slot0._commissionBtn.localPosition = Vector3(0, slot0._commissionBtn.localPosition.y, 0)
	slot0._commissionTip = slot0:findTF("toTop/frame/leftPanel/commissionButton/tip")
	slot0._rightPanel = slot0:findTF("toTop/frame/rightPanel")
	slot0._combatBtn = slot0:findTF("toTop/frame/rightPanel/eventPanel/combatBtn")
	slot0._formationBtn = slot0:findTF("toTop/frame/rightPanel/eventPanel/formationButton")
	slot0._rightTopPanel = slot0:findTF("toTop/frame/rightTopPanel")
	slot0._friendBtn = slot0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/friendButton")
	slot0._mailBtn = slot0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/mailButton")
	slot0._mailMsg = slot0:findTF("unread", slot0._mailBtn)
	slot0._mailEmpty = slot0:findTF("read", slot0._mailBtn)
	slot0._attachmentHint = slot0:findTF("attachmentLabel", slot0._mailBtn)
	slot0._attachmentCountText = slot0:findTF("attachmentCountText", slot0._attachmentHint):GetComponent(typeof(Text))
	slot0._noticeBtn = slot0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/noticeButton")
	slot0._settingBtn = slot0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/settingButton")
	slot0._rankBtn = slot0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/rankButton")
	slot0._collectionBtn = slot0:findTF("toTop/frame/rightTopPanel/bg/btnsArea/collectionButton")
	slot0._monopolyBtn = slot0:findTF("rightPanel/linkBtns/monopoly_btn")
	slot0._blackWhitBtn = slot0:findTF("rightPanel/linkBtns/blackwhite_btn")
	slot0._memoryBookBtn = slot0:findTF("rightPanel/linkBtns/memorybook_btn")
	slot0._ActivityBtns = slot0:findTF("linkBtns", slot0._rightPanel)
	slot0._activitySummaryBtn = slot0:findTF("activityButton", slot0._ActivityBtns)
	slot0._activityMapBtn = slot0:findTF("activity_map_btn", slot0._ActivityBtns)
	slot0._activityMiniGameBtn = slot0:findTF("activity_minigame", slot0._ActivityBtns)
	slot0._acitivtyEscortBtn = slot0:findTF("activity_escort", slot0._ActivityBtns)
	slot0._bottomPanel = slot0:findTF("toTop/frame/bottomPanel")
	slot0._dockBtn = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/dockBtn")
	slot0._equipBtn = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/equipButton")
	slot0._voteBtn = slot0:findTF("vote_btn", slot0._ActivityBtns)
	slot0._voteBookBtn = slot0:findTF("btm/vote_book_btn", slot0._bottomPanel)
	slot0._buildBtn = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/buildButton")
	slot0._taskBtn = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/taskButton")
	slot0._guildButton = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/guildButton")
	slot0._mallBtn = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/mallBtn")
	slot0._liveBtn = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/liveButton")
	slot0._technologyBtn = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/technologyButton")

	if not LOCK_SECONDARY then
		slot0._academyBtn = slot0:findTF("secondary_panel/frame/bg/school_btn")
		slot0._haremBtn = slot0:findTF("secondary_panel/frame/bg/backyard_btn")
	else
		slot0._academyBtn = slot0:findTF("bottomPanel/buttons_container/academyButton")
		slot0._haremBtn = slot0:findTF("bottomPanel/buttons_container/haremButton")
	end

	slot0._bottomBlur = slot0._bottomPanel:Find("btm")
	slot0._rightTopBlur = slot0._rightTopPanel:Find("bg")
	slot0._playerResOb = slot0:findTF("toTop/frame/playerRes")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0._commanderPanel = slot0:findTF("toTop/frame/commanderPanel")
	slot0._commanderPanelbg = slot0:findTF("toTop/top")
	slot0._commanderInfoBtn = slot0:findTF("top/iconBack", slot0._commanderPanel)
	slot0._nameLabel = slot0:findTF("top/playerInfoBg2/playerInfoBg/nameLabel", slot0._commanderPanel)
	slot0._levelLabel = slot0:findTF("top/playerInfoBg2/playerInfoBg/levelLabel", slot0._commanderPanel)
	slot0._expBar = slot0:findTF("top/playerInfoBg2/playerInfoBg/expArea", slot0._commanderPanel):GetComponent(typeof(Slider))
	slot0._icon = slot0:findTF("top/iconBack/icon", slot0._commanderPanel)
	slot0._buffList = slot0:findTF("buffList", slot0._commanderPanel)
	slot0._buffTpl = slot0:findTF("buff", slot0._buffList)
	slot0._buffText = slot0:findTF("buffText", slot0._commanderPanel)
	slot0._linkBtns = slot0:findTF("link_btns", slot0._commanderPanel)
	slot0.traingCampBtn = slot0:findTF("traningcamp", slot0._linkBtns)
	slot0.refluxBtn = slot0:findTF("return", slot0._linkBtns)
	slot0.exSkinBtn = slot0:findTF("ex_skin_btn", slot0._commanderPanel)

	setActive(slot0.exSkinBtn, false)
	setActive(slot0._buffText, false)

	slot0._btmbg = slot0:findTF("toTop/btm")
	slot0._paintingTF = slot0:findTF("paint")
	slot0._paintingContainer = slot0:findTF("paint/fitter")
	slot0._chatTextBg = slot0:findTF("chat/chatbgtop", slot0._paintingTF)
	slot0._chatText = slot0:findTF("chat/Text", slot0._paintingTF)
	slot0._chat = slot0:findTF("chat", slot0._paintingTF)
	slot0.initChatBgH = slot0._chatTextBg.sizeDelta.y
	slot0.effectTF = slot0:findTF("effect", slot0._paintingTF)
	slot0._chatBg = slot0:findTF("chatPreview", slot0._rightPanel)
	slot0._chatEmptySign = slot0:findTF("EmptySign", slot0._chatBg)

	setActive(slot0._chatEmptySign, false)

	slot0._chatList = slot0:findTF("list", slot0._chatBg)
	slot0._chatItem = slot0:findTF("item", slot0._chatBg).gameObject

	slot0._chatItem:SetActive(false)

	slot0._chatActBtn = slot0:findTF("ActivityBtn", slot0._chatBg)
	slot0._chatActBtnDisable = slot0:findTF("ActivityBtnDisable", slot0._chatBg)
	slot0.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)

	setActive(slot0._chatActBtn, slot0.hideChatFlag)
	setActive(slot0._chatActBtnDisable, not slot0.hideChatFlag)

	if LOCK_HIDE_CHAT then
		SetActive(slot0._chatActBtn, false)
	end

	slot0._bg = slot0:findTF("Sea")
	slot0._chat.localScale = Vector3(0, 0)
	slot0._paintingOffset = 0
	slot0.toTopPanel = slot0:findTF("toTop")
	slot0.skinTimers = {}
end

slot0.uiEnterAnim = function (slot0)
	slot1 = nil

	if slot0.contextData.isFromLogin or getProxy(PlayerProxy):getFlag("battle") then
		function slot1(...)
			slot0:enablePartialBlur()

			if slot0.enablePartialBlur.tempFlagShip then
				slot1.blocksRaycasts = true
			else
				slot1.blocksRaycasts = true

				if not slot1._attachmentCount then
					slot0._attachmentCount = 0
				end
			end
		end

		GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).blocksRaycasts = false
	else
		slot0:enablePartialBlur()
	end

	if slot0.tempFlagShip then
		slot0:updateFlagShip(slot0.tempFlagShip)
	end

	setAnchoredPosition(slot0._bottomPanel, Vector2(0, -128))
	setAnchoredPosition(slot0._btmbg, Vector2(0, -128))
	setAnchoredPosition(slot0._commanderPanel, Vector2(0, 141))
	setAnchoredPosition(slot0._commanderPanelbg, Vector2(0, 141))
	setAnchoredPosition(slot0._leftPanel, Vector2(-222, 0))
	setAnchoredPosition(slot0._rightPanel, Vector2(847, 0))
	setAnchoredPosition(slot0._rightTopPanel, Vector2(847, 0))
	setAnchoredPosition(slot0._playerResOb, Vector2(0, 77))
	slot0:ejectGimmick(slot0._bottomPanel, slot0.REVERT_VERTICAL, slot0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._btmbg, slot0.REVERT_VERTICAL, slot0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._playerResOb, slot0.REVERT_VERTICAL, slot0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._commanderPanel, slot0.REVERT_HERIZONTAL_VERTICAL, slot0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._commanderPanelbg, slot0.REVERT_HERIZONTAL_VERTICAL, slot0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._rightTopPanel, slot0.REVERT_HERIZONTAL, slot0.EJECT_DURATION_ENTER, nil, 0.1, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._rightPanel, slot0.REVERT_HERIZONTAL, slot0.EJECT_DURATION_ENTER, nil, 0.2, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._leftPanel, slot0.REVERT_HERIZONTAL, slot0.EJECT_DURATION_ENTER, slot1, 0.2, {
		0,
		1
	})
end

slot0.openSecondaryPanel = function (slot0, slot1)
	function slot2()
		SetActive(slot0._academyBtn:Find("tip"), slot0.schoolTip)
		SetActive(slot0:findTF("tip", slot0._commanderBtn), slot0.commanderTip)
		SetActive(slot0:findTF("tip", slot0._haremBtn), slot0.backyardTip)

		SetActive.isOpenSecondary = true

		pg.UIMgr.GetInstance():BlurPanel(slot0._secondaryPanel)
		setActive(slot0._secondaryPanel, true)
	end

	if not slot0._secondaryPanel then
		PoolMgr.GetInstance():GetUI("MainUISecondaryPanel", true, function (slot0)
			slot0.name = "secondary_panel"
			slot0._secondaryPanel = tf(slot0)

			SetActive(slot0._secondaryPanel, false)

			slot1 = slot0:findTF("frame/bg", slot0._secondaryPanel)
			slot0._academyBtn = slot0:findTF("school_btn", slot1)
			slot0._haremBtn = slot0:findTF("backyard_btn", slot1)
			slot0._commanderBtn = slot0:findTF("commander_btn", slot1)

			slot0._secondaryPanel:SetParent(slot0._tf, false)

			if not pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0._player.level, "CommandRoomMediator") then
				slot0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
			else
				slot0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
			end

			if not pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0._player.level, "BackYardMediator") then
				slot0._haremBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
			else
				slot0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
			end

			onButton(slot0, slot0._commanderBtn, function ()
				slot0:emit(MainUIMediator.OPEN_COMMANDER)
			end, SFX_MAIN)
			onButton(slot0, slot0._haremBtn, function ()
				slot0:emit(MainUIMediator.OPEN_BACKYARD)
			end, SFX_MAIN)
			onButton(slot0, slot0._academyBtn, function ()
				slot0:emit(MainUIMediator.OPEN_SCHOOLSCENE)
			end, SFX_MAIN)
			onButton(slot0, slot0._secondaryPanel, function ()
				slot0:closeSecondaryPanel(true)
			end)
			slot1()
		end)
	else
		slot2()
	end
end

slot0.closeSecondaryPanel = function (slot0, slot1)
	if slot1 then
		slot0:enablePartialBlur()
	end

	slot0.isOpenSecondary = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0._secondaryPanel, slot0._tf)
	setActive(slot0._secondaryPanel, false)
end

slot0.disableTraningCampAndRefluxTip = function (slot0)
	setActive(slot0.traingCampBtn:Find("xinshou01"), false)
	setActive(slot0.refluxBtn:Find("effect"), false)
end

slot0.updateTraningCampBtn = function (slot0)
	slot3 = false
	slot4 = false

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_GUIDE_TASKS) and not slot1:isEnd() then
		slot3 = getProxy(ChapterProxy):getChapterById(slot1:getConfig("config_data")[1]) and slot6:isClear()
		slot8 = getProxy(TaskProxy)
		slot4 = _.any(_.flatten(slot1:getConfig("config_data")[3]), function (slot0)
			return slot0:getTaskById(slot0) and slot1:isFinish() and not slot1:isReceive()
		end)
	end

	setActive(slot0.traingCampBtn:Find("xinshou01"), slot4)

	slot0.openTraningCamp = slot2 and slot3

	setActive(slot0.traingCampBtn, slot0.openTraningCamp)
end

slot0.updateRefluxBtn = function (slot0)
	setActive(slot0.refluxBtn, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot2:isEnd())

	if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot2.isEnd() then
		setActive(slot0.refluxBtn:Find("effect"), slot1:existRefluxAwards())
	end
end

slot0.disablePartialBlur = function (slot0)
	if slot0._tf then
		pg.UIMgr.GetInstance():UnOverlayPanel(slot0.toTopPanel, slot0._tf)
	end
end

slot0.enablePartialBlur = function (slot0)
	if slot0._tf then
		table.insert(slot1, slot0.toTopPanel:Find("frame/rightTopPanel/bg"))
		table.insert(slot1, slot0.toTopPanel:Find("frame/rightPanel/eventPanel"))
		table.insert(slot1, slot0.toTopPanel:Find("frame/rightPanel/chatPreview"))
		pg.UIMgr.GetInstance():OverlayPanelPB(slot0.toTopPanel, {
			pbList = {}
		})
	end
end

slot0.emit = function (slot0, ...)
	if slot0.event then
		slot0.event:emit(...)
	end
end

slot0.didEnter = function (slot0)
	slot0:setBG()
	onButton(slot0, slot0.traingCampBtn, function ()
		slot0:emit(MainUIMediator.OPEN_TRANINGCAMP)
	end, SFX_PANEL)
	slot0:uiEnterAnim()

	slot0._attachmentCount = 0

	onButton(slot0, slot0.traingCampBtn, function ()
		slot0:emit(MainUIMediator.OPEN_TRANINGCAMP)
	end, SFX_PANEL)
	onButton(slot0, slot0.refluxBtn, function ()
		slot0:emit(MainUIMediator.GO_SCENE, {
			SCENE.REFLUX
		})
	end, SFX_PANEL)
	onButton(slot0, slot0._combatBtn, function ()
		slot0:emit(MainUIMediator.OPEN_LEVEL)
	end, SFX_UI_WEIGHANCHOR_BATTLE)
	onButton(slot0, slot0._dockBtn, function ()
		slot0:emit(MainUIMediator.OPEN_CHUANWUSTART, DockyardScene.MODE_OVERVIEW)
	end, SFX_MAIN)
	onButton(slot0, slot0._hideBtn, function ()
		slot0:switchForm(slot1.STATE_ALL_HIDE)
	end, SFX_MAIN)
	onButton(slot0, slot0._cameraBtn, function ()
		if CheckPermissionGranted(ANDROID_CAMERA_PERMISSION) then
			slot0:openSnapShot()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("apply_permission_camera_tip1"),
				onYes = function ()
					ApplyPermission({
						ANDROID_CAMERA_PERMISSION
					})
				end
			})
		end
	end, SFX_MAIN)
	onButton(slot0, slot0._mallBtn, function ()
		slot0:emit(MainUIMediator.GO_MALL)
	end, SFX_MAIN)
	onButton(slot0, slot0._commissionBtn, function ()
		if not LeanTween.isTweening(go(slot0._commissionBtn)) then
			LeanTween.moveX(slot0._commissionBtn, -1 * slot0._commissionBtn.rect.width, 0.2):setOnComplete(System.Action(function ()
				slot0:emit(MainUIMediator.OPEN_COMMISSION_INFO)
			end))
		end
	end, SFX_UI_INFO)
	onButton(slot0, slot0._friendBtn, function ()
		slot0:emit(MainUIMediator.OPEN_FRIEND)
	end, SFX_UI_MENU)
	onButton(slot0, slot0._buildBtn, function ()
		slot0:emit(MainUIMediator.GETBOAT)
	end, SFX_UI_BUILDING)
	onButton(slot0, slot0._taskBtn, function ()
		slot0:emit(MainUIMediator.OPEN_TASK)
	end, SFX_MAIN)
	onButton(slot0, slot0._equipBtn, function ()
		slot0:emit(MainUIMediator.OPEN_ARMORYSCENE)
	end, SFX_MAIN)
	onButton(slot0, slot0._formationBtn, function ()
		slot0:emit(MainUIMediator.OPEN_BIANDUI, defaultValue(slot0.contextData.fleetId, 1))
	end, SFX_UI_FORMATION)
	onButton(slot0, slot0._collectionBtn, function ()
		slot0:emit(MainUIMediator.OPEN_COLLECT_SHIP)
	end, SFX_UI_MENU)

	if not pg.SystemOpenMgr.GetInstance():isOpenSystem(slot0._player.level, "NewGuildMediator") then
		setActive(slot0:findTF("lock", slot0._guildButton), true)

		slot0._guildButton:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		setActive(slot0:findTF("lock", slot0._guildButton), false)

		slot0._guildButton:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	onButton(slot0, slot0._guildButton, function ()
		slot0:emit(MainUIMediator.OPEN_GUILD)
	end, SFX_MAIN)
	onButton(slot0, slot0._mailBtn, function ()
		if BATTLE_DEBUG then
			slot0:emit(MainUIMediator.TMP_DEBUG)
		else
			slot0:emit(MainUIMediator.OPEN_MAIL)
		end
	end, SFX_UI_MENU)
	onButton(slot0, slot0._chatBtn, function ()
		if not slot0.hideChatFlag or slot0.hideChatFlag ~= 1 then
			slot0:emit(MainUIMediator.OPEN_CHATVIEW)
		end
	end, SFX_UI_CHAT)
	onButton(slot0, slot0._chatBg, function ()
		if not LeanTween.isTweening(go(slot0._commissionBtn)) and (not slot0.hideChatFlag or slot0.hideChatFlag ~= 1) then
			slot0:emit(MainUIMediator.OPEN_CHATVIEW)
		end
	end, SFX_UI_CHAT)
	onButton(slot0, slot0._settingBtn, function ()
		slot0:emit(MainUIMediator.OPEN_SETTINGS)
	end, SFX_UI_MENU)
	onButton(slot0, slot0._chatActBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n((slot0.hideChatFlag and slot0.hideChatFlag == 1 and "show_chat_warning") or "hide_chat_warning"),
			onYes = function ()
				if slot0 then
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 0)
				else
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 1)
				end

				slot1.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)

				PlayerPrefs.GetInt(HIDE_CHAT_FLAG):sethideChatBtn()
			end
		})
	end, SFX_UI_PANEL)
	onButton(slot0, slot0._chatActBtnDisable, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n((slot0.hideChatFlag and slot0.hideChatFlag == 1 and "show_chat_warning") or "hide_chat_warning"),
			onYes = function ()
				if slot0 then
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 0)
				else
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 1)
				end

				slot1.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)

				PlayerPrefs.GetInt(HIDE_CHAT_FLAG):sethideChatBtn()
			end
		})
	end, SFX_UI_PANEL)
	slot0:sethideChatBtn()
	onButton(slot0, slot0._noticeBtn, function ()
		slot0:emit(MainUIMediator.OPEN_BULLETINBOARD)
	end, SFX_UI_MENU)
	SetActive(slot0._rankBtn, slot2)
	onButton(slot0, slot0._rankBtn, function ()
		slot0:emit(MainUIMediator.OPEN_RANK)
	end, SFX_UI_MENU)
	onButton(slot0, slot0._commanderInfoBtn, function ()
		slot0:emit(MainUIMediator.OPEN_PLAYER_INFO_LAYER)
	end, SFX_MAIN)
	onButton(slot0, slot0._bg, function ()
		if slot0._currentState == slot1.STATE_ALL_HIDE then
			slot0:switchForm(slot1.STATE_MAIN)
		end
	end, SFX_MAIN)
	onButton(slot0, slot0._paintingTF, function ()
		if slot0._currentState == slot1.STATE_ALL_HIDE then
			slot0:switchForm(slot1.STATE_MAIN)
		elseif slot0.live2dChar then
			slot0:AssistantEventEffect()
		else
			slot0 = slot2.filterAssistantEvents(slot2.PaintingTouchEvents, slot0.flagShip.skinId)

			slot0:AssistantEventEffect(slot0[math.ceil(math.random(#slot0))])
			slot0:paintClimax(slot1.TOUCH_HEIGHT, slot1.TOUCH_DURATION, slot1.TOUCH_LOOP)
		end

		if slot0.flagShip then
			slot0:emit(MainUIMediator.ON_TOUCHSHIP, slot0.flagShip.groupId)
		end
	end)
	onButton(slot0, slot0._liveBtn, function ()
		slot0:openSecondaryPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0._technologyBtn, function ()
		slot0:emit(MainUIMediator.OPEN_TECHNOLOGY)
	end, SFX_PANEL)
	pg.DelegateInfo.Add(slot0, slot3)
	GetOrAddComponent(slot0._paintingTF, "UILongPressTrigger").onLongPressed.RemoveAllListeners(slot3)
	GetOrAddComponent(slot0._paintingTF, "UILongPressTrigger").onLongPressed.AddListener(slot3, function ()
		if slot0.live2dChar then
			return
		end

		slot0:emit(MainUIMediator.ON_SHIP_DETAIL, slot0.flagShip)
	end)
	slot0:paintMove(slot0.PAINT_DEFAULT_POS_X, "mainNormal", false, 0)
end

slot0.openSnapShot = function (slot0)
	slot0:emit(MainUIMediator.OPEN_SNAPSHOT, {
		skinId = slot0.flagShip.skinId,
		live2d = slot0.Live2dChar ~= nil
	})
end

slot0.updateMonopolyBtn = function (slot0, slot1)
	setActive(slot0._monopolyBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._monopolyBtn, function ()
			slot0:emit(MainUIMediator.ON_MONOPOLY)
		end, SFX_PANEL)
	end
end

slot0.updateBossBattleBtn = function (slot0, slot1)
	setActive(slot0._bossBattleBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._bossBattleBtn, function ()
			slot0:emit(MainUIMediator.ON_BOSS_BATTLE)
		end, SFX_PANEL)
	end
end

slot0.onBackPressed = function (slot0)
	playSoundEffect(SFX_CANCEL)

	if slot0.isOpenSecondary then
		slot0:closeSecondaryPanel(true)

		return
	end

	if slot0._currentState == slot0.STATE_ALL_HIDE then
		slot0:switchForm(slot0.STATE_MAIN)
	else
		pg.SdkMgr.GetInstance():OnAndoridBackPress()
		pg.PushNotificationMgr.GetInstance():PushAll()
	end
end

slot0.updateActivityBtn = function (slot0, slot1)
	setActive(slot0._activityBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityBtn, function ()
			slot0:emit(MainUIMediator.ON_ACTIVITY, slot1.id)
		end, SFX_PANEL)
	end
end

slot0.updateActivityMapBtn = function (slot0, slot1)
	setActive(slot0._activityMapBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityMapBtn, function ()
			slot0:emit(MainUIMediator.ON_ACTIVITY_MAP, slot1.id)
		end, SFX_PANEL)
	end
end

slot0.updateActivityEscort = function (slot0)
	setActive(slot0._acitivtyEscortBtn, OPEN_ESCORT)

	if OPEN_ESCORT then
		onButton(slot0, slot0._acitivtyEscortBtn, function ()
			slot0:emit(MainUIMediator.OPEN_ESCORT)
		end)
	end
end

slot0.updateActivityMiniGameBtn = function (slot0, slot1)
	setActive(slot0._activityMiniGameBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		slot4 = getProxy(MiniGameProxy):GetHubByHubId(slot3)

		setText(slot0._activityMiniGameBtn:Find("tip/Text"), (slot4:getConfig("reward_need") <= slot4.usedtime and slot4.ultimate == 0 and "!") or slot4.count)
		setActive(slot7.parent, slot4.count > 0 or (slot4.getConfig("reward_need") <= slot4.usedtime and slot4.ultimate == 0))
		onButton(slot0, slot0._activityMiniGameBtn, function ()
			if not pg.StoryMgr:IsPlayed("TIANHOUYUYI1") then
				pg.StoryMgr.GetInstance():Play("TIANHOUYUYI1", function ()
					pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SUMMER_FEAST)
				end, true)
			else
				pg.m02:sendNotification(GAME.GO_SCENE, SCENE.SUMMER_FEAST)
			end
		end, SFX_PANEL)
	end
end

slot0.updateActivityPtBtn = function (slot0, slot1)
	setActive(slot0._activityPtBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityPtBtn, function ()
			slot0:emit(MainUIMediator.ON_ACTIVITY_PT, slot1.id)
		end, SFX_PANEL)
	end
end

slot0.updateAnniversaryBtn = function (slot0, slot1)
	setActive(slot0._anniversaryBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._anniversaryBtn, function ()
			slot0:emit(MainUIMediator.ON_ANNIVERSARY)
		end, SFX_PANEL)
	end
end

slot0.updateBlackWhitBtn = function (slot0, slot1)
	setActive(slot0._blackWhitBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._blackWhitBtn, function ()
			slot0:emit(MainUIMediator.ON_BLACKWHITE)
		end, SFX_PANEL)
	end
end

slot0.updateMemoryBookBtn = function (slot0, slot1)
	setActive(slot0._memoryBookBtn, slot1 and not slot1:isEnd() and not slot1:isShow())

	if slot1 and not slot1.isEnd() and not slot1.isShow() then
		onButton(slot0, slot0._memoryBookBtn, function ()
			slot0:emit(MainUIMediator.ON_MEMORYBOOK)
		end, SFX_PANEL)
	end
end

slot0.updateVoteBtn = function (slot0, slot1, slot2)
	slot0:updateVoteBookBtn(slot2)
end

slot0.updateVoteBookBtn = function (slot0, slot1)
	setActive(slot0._voteBookBtn, slot1 and not slot1:IsExpired())
	slot0:RemoveVoteBookTimer()

	if slot1 and not slot1.IsExpired() then
		onButton(slot0, slot0._voteBookBtn, function ()
			slot0:emit(MainUIMediator.ON_VOTE_BOOK)
		end, SFX_PANEL)

		slot3 = slot0._voteBookBtn:Find("tip/Text"):GetComponent(typeof(Text))
		slot0.voteBookTimer = Timer.New(function ()
			slot0.text = slot1:GetCDTime("#9BB8FFFF")
		end, 1, -1)

		slot0.voteBookTimer:Start()
		slot0.voteBookTimer.func()
	end
end

slot0.RemoveVoteBookTimer = function (slot0)
	if slot0.voteBookTimer then
		slot0.voteBookTimer:Stop()

		slot0.voteBookTimer = nil
	end
end

slot0.updateLotteryBtn = function (slot0, slot1)
	setActive(slot0._lotteryBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._lotteryBtn, function ()
			slot0:emit(MainUIMediator.ON_LOTTERY, slot1.id)
		end, SFX_PANEL)
	end
end

slot0.updateActivityPtBtn = function (slot0, slot1)
	setActive(slot0._activityPtBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityPtBtn, function ()
			slot0:emit(MainUIMediator.ON_ACTIVITY_PT, slot1.id)
		end, SFX_PANEL)
	end

	setActive(slot0._activityPtBtn, false)
end

slot0.updateActivityWowsBtn = function (slot0, slot1)
	setActive(slot0._activityTaskWowsBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityTaskWowsBtn, function ()
			slot0:emit(MainUIMediator.ON_ACTIVITY_WOWS, slot1.id)
		end, SFX_PANEL)
	end
end

slot0.fadeBG = function (slot0, slot1)
	slot0._newBG = Instantiate(slot0._bg:Find("bg"))

	PoolMgr.GetInstance():GetSprite("bg/bg_" .. slot1, "", false, function (slot0)
		if slot0._newBG then
			GetOrAddComponent(slot0._newBG, "Image").sprite = slot0

			slot0._newBG.transform:SetParent(slot0._bg.transform)

			slot0._newBG.transform.localScale = Vector3(1, 1, 1)
			slot0._newBG.transform.localPosition = Vector3(0, 0, 0)
			slot0._newBG.transform.anchoredPosition = Vector3(-5, 0, 0)

			LeanTween.alpha(rtf(slot0._newBG), 0, 5):setFrom(1):setOnComplete(System.Action(function ()
				Destroy(go(slot0._newBG))

				Destroy._newBG = nil
			end))
		end
	end)
end

slot0.switchForm = function (slot0, slot1)
	if slot0._currentState ~= slot1 then
		slot0._currentState = slot1

		if slot1 == slot0.STATE_MAIN then
			slot0:ejectGimmick(slot0._bottomPanel, slot0.REVERT_VERTICAL)
			slot0:ejectGimmick(slot0._btmbg, slot0.REVERT_VERTICAL)
			slot0:ejectGimmick(slot0._leftPanel, slot0.REVERT_HERIZONTAL)
			slot0:ejectGimmick(slot0._rightPanel, slot0.REVERT_HERIZONTAL)
			slot0:ejectGimmick(slot0._rightTopPanel, slot0.REVERT_HERIZONTAL)
			slot0:ejectGimmick(slot0._playerResOb, slot0.REVERT_VERTICAL)
			slot0:ejectGimmick(slot0._commanderPanel, slot0.REVERT_HERIZONTAL_VERTICAL)
			slot0:ejectGimmick(slot0._commanderPanelbg, slot0.REVERT_HERIZONTAL_VERTICAL)
			slot0:paintMove(slot0.PAINT_DEFAULT_POS_X, "mainNormal", true, 0)
		elseif slot1 == slot0.STATE_ALL_HIDE then
			slot0:concealGimmick(slot0._bottomPanel, slot0.DIRECTION_DOWN)
			slot0:concealGimmick(slot0._btmbg, slot0.DIRECTION_DOWN)
			slot0:concealGimmick(slot0._rightPanel, slot0.DIRECTION_RIGHT)
			slot0:concealGimmick(slot0._leftPanel, slot0.DIRECTION_LEFT)
			slot0:concealGimmick(slot0._playerResOb, slot0.DIRECTION_UP)
			slot0:concealGimmick(slot0._rightTopPanel, slot0.DIRECTION_RIGHT)
			slot0:concealGimmick(slot0._commanderPanel, slot0.DIRECTION_UP_LEFT)
			slot0:concealGimmick(slot0._commanderPanelbg, slot0.DIRECTION_UP_LEFT)
			slot0:paintMove(slot0._paintingOffset, "mainFullScreen", true, 0, 0)
		end
	end
end

slot0.paintBreath = function (slot0)
	if slot0.live2dChar or slot0.paintMoving then
		return
	end

	LeanTween.cancel(go(slot0._paintingTF))
	LeanTween.moveY(rtf(slot0._paintingTF), slot0.BREATH_HEIGHT, slot0.BREATH_DURATION):setLoopPingPong():setEase(LeanTweenType.easeInOutCubic):setFrom(slot0.DEFAULT_HEIGHT)
end

slot0.paintClimax = function (slot0, slot1, slot2, slot3)
	if slot0.live2dChar or slot0.paintMoving then
		return
	end

	if (slot3 or math.random(3) - 1) ~= 0 then
		LeanTween.cancel(go(slot0._paintingTF))
		LeanTween.moveY(rtf(slot0._paintingTF), slot1, slot2):setLoopPingPong(slot3):setOnComplete(System.Action(function ()
			slot0:paintBreath()
		end))
	end
end

slot0.paintMove = function (slot0, slot1, slot2, slot3, slot4, slot5)
	LeanTween.cancel(go(slot0._paintingTF))
	LeanTween.moveY(rtf(slot0._paintingTF), 0, slot0.EJECT_DURATION)
	LeanTween.moveY(findTF(slot0._paintingTF, "live2d"), slot4 or 0, slot0.EJECT_DURATION)

	slot6 = GetOrAddComponent(findTF(slot0._paintingTF, "fitter"), "PaintingScaler")

	slot6:Snapshoot()

	slot6.FrameName = slot2

	if slot3 then
		slot7 = LeanTween.value(go(slot0._paintingTF), 0, 1, slot0.EJECT_DURATION):setOnUpdate(System.Action_float(function (slot0)
			slot0.Tween = slot0
		end)):setEase(LeanTweenType.easeInOutSine)
	end

	slot0._bg:GetComponent("Button").enabled = false
	slot0._paintingTF:GetComponent("Button").enabled = false
	slot0.paintMoving = true
	slot7 = LeanTween.moveX(rtf(slot0._paintingTF), slot1, slot0.EJECT_DURATION)

	slot7:setEase(LeanTweenType.easeInOutExpo)
	LeanTween.moveX(findTF(slot0._paintingTF, "live2d"), slot5 or 170, slot0.EJECT_DURATION).setEase(LeanTween.moveX, LeanTweenType.easeInOutExpo)
	slot7:setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-24, warpins: 1 ---
		slot0.paintMoving = false

		slot0:paintBreath()

		slot0.paintBreath._bg:GetComponent("Button").enabled = true
		slot0.paintBreath._bg.GetComponent("Button")._paintingTF:GetComponent("Button").enabled = true

		return
		--- END OF BLOCK #0 ---



	end))
end

slot0.displayShipWord = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.chatFlag then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 1 ---
	slot0.chatFlag = true

	if slot0.chatTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-24, warpins: 2 ---
	slot2 = slot0.flagShip:getIntimacy() / 100 + ((slot0.flagShip.propose and 1000) or 0)
	slot4, slot5, slot6, slot7 = nil

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 28-37, warpins: 2 ---
	if string.split(slot1, "_")[1] == "main" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-71, warpins: 1 ---
		slot4, slot5 = Ship.getWords(slot0.flagShip.skinId, slot3[1], tonumber(slot3[2]), nil, slot2)
		slot6 = Ship.getCVCalibrate(slot0.flagShip.skinId, slot3[1], tonumber(slot3[2]))
		slot7 = Ship.getL2dSoundEffect(slot0.flagShip.skinId, slot3[1], tonumber(slot3[2]))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-95, warpins: 1 ---
		slot4, slot5 = Ship.getWords(slot0.flagShip.skinId, slot1, nil, nil, slot2)
		slot6 = Ship.getCVCalibrate(slot0.flagShip.skinId, slot1)
		slot7 = Ship.getL2dSoundEffect(slot0.flagShip.skinId, slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 96-111, warpins: 2 ---
	setText(slot0._chatText, slot4)

	if CHAT_POP_STR_LEN < #slot0._chatText:GetComponent(typeof(Text)).text then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 112-115, warpins: 1 ---
		slot8.alignment = TextAnchor.MiddleLeft
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 116-118, warpins: 1 ---
		slot8.alignment = TextAnchor.MiddleCenter
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 119-123, warpins: 2 ---
	if slot0.initChatBgH < slot8.preferredHeight + 26 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 124-133, warpins: 1 ---
		slot0._chatTextBg.sizeDelta = Vector2.New(slot0._chatTextBg.sizeDelta.x, slot9)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 134-142, warpins: 1 ---
		slot0._chatTextBg.sizeDelta = Vector2.New(slot0._chatTextBg.sizeDelta.x, slot0.initChatBgH)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 143-151, warpins: 2 ---
	slot10 = slot0.CHAT_SHOW_TIME

	if findTF(slot0._paintingTF, "fitter").childCount > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 152-168, warpins: 1 ---
		Ship.SetExpression(findTF(slot0._paintingTF, "fitter"):GetChild(0), slot0.flagShip:getPainting(), slot1, slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 169-172, warpins: 2 ---
	function slot11()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-29, warpins: 1 ---
		LeanTween.scale(rtf(slot0._chat.gameObject), Vector3.New(1, 1, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-36, warpins: 1 ---
			LeanTween.scale(rtf(slot0._chat.gameObject), Vector3.New(0, 0, 1), slot0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeInBack):setDelay(slot0.CHAT_ANIMATION_TIME + LeanTween.scale(rtf(slot0._chat.gameObject), Vector3.New(0, 0, 1), slot0.CHAT_ANIMATION_TIME).setEase(LeanTweenType.easeInBack)):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0.chatFlag = nil

				slot0:startChatTimer()

				return
				--- END OF BLOCK #0 ---



			end))

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end

	if slot0._delayL2dSeID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 173-178, warpins: 1 ---
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 179-181, warpins: 2 ---
	if slot0.live2dChar and slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 184-193, warpins: 1 ---
		slot0._delayL2dSeID = LeanTween.delayedCall(slot7[2], System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			playSoundEffect("event:/ui/" .. slot0[1])

			"event:/ui/" .. slot0[1]._delayL2dSeID = nil

			return
			--- END OF BLOCK #0 ---



		end)).id
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 194-209, warpins: 3 ---
	slot12 = pg.StoryMgr.GetInstance():isActive()

	if getProxy(ContextProxy):getContextByMediator(NewShipMediator) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 210-210, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 211-212, warpins: 1 ---
		if slot5 and not slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 215-218, warpins: 1 ---
			function slot13()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if slot0._currentVoice then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-10, warpins: 1 ---
					slot0._currentVoice:Stop(true)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 11-16, warpins: 2 ---
				function slot1()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-9, warpins: 1 ---
					slot1, slot1 = playSoundEffect(slot2)
					slot0._currentVoice = slot2

					if slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 10-15, warpins: 1 ---
						slot3 = long2int(slot1.length) * 0.001
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 16-18, warpins: 2 ---
					slot4()

					return
					--- END OF BLOCK #1 ---



				end

				if slot0._delayVoiceTweenID then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-24, warpins: 1 ---
					LeanTween.cancel(slot0._delayVoiceTweenID)

					slot0._delayVoiceTweenID = nil
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 25-28, warpins: 2 ---
				if slot0.live2dChar and slot4 and slot4 ~= 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 35-46, warpins: 1 ---
					slot0._delayVoiceTweenID = LeanTween.delayedCall(slot4, System.Action(function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-6, warpins: 1 ---
						slot0()

						slot1._delayVoiceTweenID = nil

						return
						--- END OF BLOCK #0 ---



					end)).id
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 47-48, warpins: 3 ---
					slot1()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 49-50, warpins: 2 ---
				return
				--- END OF BLOCK #3 ---



			end

			if slot0.loadedCVBankName then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 219-221, warpins: 1 ---
				slot13()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 222-236, warpins: 1 ---
				pg.CriMgr:LoadCV(Ship.getCVKeyID(slot0.flagShip.skinId), function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-7, warpins: 1 ---
					if pg.CriMgr.GetInstance().onStopCV then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 8-12, warpins: 1 ---
						print("CV track --> onStopCV true")

						return
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 13-15, warpins: 1 ---
						print("CV track --> onStopCV false")
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 16-27, warpins: 2 ---
					slot0.loadingKey = nil

					if slot0.exited then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 28-33, warpins: 1 ---
						pg.CriMgr.UnloadCVBank(slot0)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 34-39, warpins: 1 ---
						slot2()

						if slot0._currentVoice then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 40-41, warpins: 1 ---
							slot0.loadedCVBankName = slot0
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 42-42, warpins: 3 ---
					return
					--- END OF BLOCK #2 ---



				end)

				slot0.loadingKey = Ship.getCVKeyID(slot0.flagShip.skinId)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 237-237, warpins: 2 ---
			--- END OF BLOCK #1 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 238-239, warpins: 2 ---
			if slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 240-242, warpins: 1 ---
				slot11()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 243-244, warpins: 1 ---
				slot0.chatFlag = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 245-255, warpins: 4 ---
	removeOnButton(slot0._chat)
	onButton(slot0, slot0._chat, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 == "mission_complete" or slot0 == "mission" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-13, warpins: 2 ---
			slot1:emit(MainUIMediator.OPEN_TASK)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-16, warpins: 1 ---
			if slot0 == "collection" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-23, warpins: 1 ---
				slot1:emit(MainUIMediator.OPEN_EVENT)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-26, warpins: 1 ---
				if slot0 == "event_complete" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 27-32, warpins: 1 ---
					slot1:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-33, warpins: 4 ---
		return
		--- END OF BLOCK #1 ---



	end, SFX_MAIN)

	return
	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 256-256, warpins: 2 ---
	--- END OF BLOCK #11 ---



end

slot0.stopCurVoice = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.loadingKey then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(slot0.loadingKey))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-16, warpins: 2 ---
	if slot0._currentVoice then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-21, warpins: 1 ---
		slot0._currentVoice:Stop(true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-22, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.startChatTimer = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.chatFlag or slot0.exited then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-10, warpins: 1 ---
	if slot0.chatTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-16, warpins: 1 ---
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-30, warpins: 2 ---
	slot0.chatTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0:paintClimax(slot1.CHAT_HEIGHT, slot1.CHAT_DURATION)

		if slot0.hasFinishedEvent and slot0.lastChatEvent ~= "event_complete" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-23, warpins: 1 ---
			table.insert(slot0, "event_complete")
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-34, warpins: 2 ---
			if go(slot0._taskBtn:Find("tip")).activeSelf and slot0.lastChatEvent ~= "mission_complete" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-43, warpins: 1 ---
				table.insert(slot0, "mission_complete")
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 44-48, warpins: 3 ---
			if slot0._attachmentCount > 0 and slot0.lastChatEvent ~= "mail" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-57, warpins: 1 ---
				table.insert(slot0, "mail")
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 58-60, warpins: 3 ---
			if #slot0 == 0 and slot0._taskNotFinishCount and slot0._taskNotFinishCount > 0 and slot0.lastChatEvent ~= "mission" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-89, warpins: 1 ---
				table.insert(slot0, "mission")
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 90-114, warpins: 6 ---
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
		slot0.lastChatEvent = slot0[math.ceil(math.random(#slot0))]

		slot0:AssistantEventEffect(slot0.lastChatEvent)

		return
		--- END OF BLOCK #1 ---



	end, slot0.CHAT_INTERVAL, 1)

	slot0.chatTimer:Start()

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-31, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

slot0.initShipChat = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0.contextData.isFromLogin then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-12, warpins: 1 ---
		slot0.contextData.isFromLogin = nil

		slot0:AssistantEventEffect("event_login")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-21, warpins: 1 ---
		if getProxy(PlayerProxy):getFlag("battle") then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-34, warpins: 1 ---
			getProxy(PlayerProxy):setFlag("battle", nil)
			slot0:AssistantEventEffect("home")
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-43, warpins: 1 ---
			if getProxy(PlayerProxy):getFlag("battle") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-56, warpins: 1 ---
				getProxy(PlayerProxy):setFlag("battle", nil)
				slot0:AssistantEventEffect("home")
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 57-59, warpins: 1 ---
				slot0:startChatTimer()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 60-60, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.ShowAssistInfo = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = findTF(slot0._paintingTF, "live2d")
	slot4 = getProxy(SettingsProxy)

	if slot0.live2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-16, warpins: 1 ---
		slot0.live2dChar:Dispose()

		slot0.live2dChar = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-27, warpins: 2 ---
	if not PathMgr.FileExists(PathMgr.getAssetBundle("live2d/" .. slot1)) or not slot4:IsLive2dEnable() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-46, warpins: 2 ---
		SetActive(slot3, false)
		setPaintingPrefabAsync(slot0._paintingTF, slot1, "mainNormal", function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-19, warpins: 1 ---
			if not findTF(findTF(slot0._paintingTF, "fitter"):GetChild(0), "Touch") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-20, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 21-33, warpins: 1 ---
			setActive(slot0, true)
			eachChild(slot0, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				onButton(slot0, slot0, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-6, warpins: 1 ---
					if slot0._currentState == slot1.STATE_ALL_HIDE then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 7-13, warpins: 1 ---
						slot0:switchForm(slot1.STATE_MAIN)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 14-32, warpins: 1 ---
						slot0:AssistantEventEffect(slot2.getPaintingTouchEvents(slot3.name))
						slot0.AssistantEventEffect:paintClimax(slot1.TOUCH_HEIGHT, slot1.TOUCH_DURATION, slot1.TOUCH_LOOP)
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 33-33, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end)

				return
				--- END OF BLOCK #0 ---



			end)
			slot0:initShipChat()

			return
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 34-34, warpins: 2 ---
			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 35-35, warpins: 2 ---
			--- END OF BLOCK #4 ---



		end)
		slot0:paintBreath()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-76, warpins: 1 ---
		LeanTween.cancel(go(slot0._paintingTF))

		slot0.live2dChar = Live2D.New(Live2D.live2dData({
			ship = slot2,
			scale = Vector3(52, 52, 52),
			position = Vector3(0, 0, 100),
			parent = slot3
		}), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			slot0:initShipChat()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 77-78, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.AssistantEventEffect = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 and slot0.live2dChar and not Input.mousePosition then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 53-54, warpins: 4 ---
	if not ((slot0.live2dChar:GetTouchPart() <= 0 or slot0.filterAssistantEvents(slot0.getAssistantTouchEvents(slot3), slot0.flagShip.skinId)[math.ceil(math.random(#slot0.filterAssistantEvents(slot0.getAssistantTouchEvents(slot3), slot0.flagShip.skinId)))]) and slot0.filterAssistantEvents(slot0.IdleEvents, slot0.flagShip.skinId)[math.floor(math.Random(0, #slot0.filterAssistantEvents(slot0.IdleEvents, slot0.flagShip.skinId))) + 1]) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-55, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 56-61, warpins: 2 ---
	slot2 = slot0.assistantEvents[slot1]

	if slot0.live2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-66, warpins: 1 ---
		slot0.live2dChar:TriggerAction(slot2.action)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 67-69, warpins: 2 ---
	if slot2.dialog ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-74, warpins: 1 ---
		slot0:displayShipWord(slot2.dialog)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 75-77, warpins: 1 ---
		slot0:startChatTimer()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 78-78, warpins: 2 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.tweenBG = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	LeanTween.moveX(rtf(slot0._bg), slot1, slot0.EJECT_DURATION):setEase(LeanTweenType.easeInOutExpo)

	return
	--- END OF BLOCK #0 ---



end

slot0.ejectGimmick = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	LeanTween.cancel(slot1.gameObject)
	SetActive(slot1, true)

	slot7 = GetOrAddComponent(slot1, "CanvasGroup")

	if not slot0.leans then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-17, warpins: 1 ---
		slot0.leans = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-19, warpins: 2 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-46, warpins: 1 ---
		table.insert(slot0.leans, slot1)
		slot0:generateGimmickLean(slot1, slot2, slot3).setOnComplete(slot8, System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0.blocksRaycasts = true

			if true then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-8, warpins: 1 ---
				slot1()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 9-9, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)):setEase(LeanTweenType.easeInOutExpo):setDelay(slot5 or 0)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 48-48, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 49-50, warpins: 2 ---
	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-66, warpins: 1 ---
		slot7.alpha = slot6[1]

		LeanTween.alphaCanvas(slot7, slot6[2], slot3):setFrom(slot6[1]):setDelay(slot5 or 0)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 68-68, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 69-70, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.concealGimmick = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	GetOrAddComponent(slot1, "CanvasGroup").blocksRaycasts = false

	slot0:generateGimmickLean(slot1, slot2, duration).setOnComplete(slot4, System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		SetActive(SetActive, false)

		return
		--- END OF BLOCK #0 ---



	end)):setEase(LeanTweenType.easeInOutExpo):setDelay(slot3 or 0)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-32, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

slot0.generateGimmickLean = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot3 = slot3 or slot0.EJECT_DURATION
	slot4 = slot1:GetComponent("RectTransform").rect
	slot5 = nil

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-14, warpins: 2 ---
	if slot2 == slot0.DIRECTION_RIGHT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-24, warpins: 1 ---
		slot5 = LeanTween.moveX(rtf(slot1), slot4.width, slot3)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-28, warpins: 1 ---
		if slot2 == slot0.DIRECTION_LEFT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-39, warpins: 1 ---
			slot5 = LeanTween.moveX(rtf(slot1), slot4.width * -1, slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-43, warpins: 1 ---
			if slot2 == slot0.DIRECTION_UP then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-53, warpins: 1 ---
				slot5 = LeanTween.moveY(rtf(slot1), slot4.height, slot3)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 54-57, warpins: 1 ---
				if slot2 == slot0.DIRECTION_DOWN then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 58-68, warpins: 1 ---
					slot5 = LeanTween.moveY(rtf(slot1), slot4.height * -1, slot3)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 69-72, warpins: 1 ---
					if slot2 == slot0.DIRECTION_DOWN_RIGHT then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 73-87, warpins: 1 ---
						slot5 = LeanTween.moveY(rtf(slot1), Vector3(slot4.width, slot4.height * -1, 0), slot3)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 88-91, warpins: 1 ---
						if slot2 == slot0.DIRECTION_UP_LEFT then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 92-106, warpins: 1 ---
							slot5 = LeanTween.move(rtf(slot1), Vector3(slot4.width * -1, slot4.height, 0), slot3)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 107-110, warpins: 1 ---
							if slot2 == slot0.REVERT_VERTICAL then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 111-120, warpins: 1 ---
								slot5 = LeanTween.moveY(rtf(slot1), 0, slot3)
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 121-124, warpins: 1 ---
								if slot2 == slot0.REVERT_HERIZONTAL then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 125-134, warpins: 1 ---
									slot5 = LeanTween.moveX(rtf(slot1), 0, slot3)
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 135-138, warpins: 1 ---
									if slot2 == slot0.REVERT_HERIZONTAL_VERTICAL then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 139-151, warpins: 1 ---
										slot5 = LeanTween.move(rtf(slot1), Vector3(0, 0, 0), slot3)
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 152-152, warpins: 10 ---
	return slot5
	--- END OF BLOCK #2 ---



end

slot0.updatePlayerInfo = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot0._player = slot1

	slot0._resPanel:setResources(slot1)
	slot0:setProfileInfo(slot1, slot0.ships)

	return
	--- END OF BLOCK #0 ---



end

slot0.setProfileInfo = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	setText(slot0._nameLabel, slot1.name)
	setText(slot0._levelLabel, "LV." .. slot1.level)

	slot3 = getConfigFromLevel1(pg.user_level, slot1.level)

	if slot1.level == slot0._player:getMaxLevel() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-26, warpins: 1 ---
		slot0._expBar.value = 1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-31, warpins: 1 ---
		slot0._expBar.value = slot1.exp / slot3.exp_interval
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 32-41, warpins: 2 ---
	slot0:loadChar(slot2[slot1.character]:getPainting())

	return
	--- END OF BLOCK #1 ---



end

slot0.updateBuffList = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot2 = UIItemList.New(slot0._buffList, slot0._buffTpl)

	slot2:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-21, warpins: 1 ---
			LoadImageSpriteAsync(slot0[slot1 + 1].getConfig(slot3, "icon"), slot2)
			onButton(slot1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if slot0._buffTextTimer then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-9, warpins: 1 ---
					slot0._buffTextTimer:Stop()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 10-27, warpins: 2 ---
				setActive(slot0._buffText, true)

				slot0 = slot0._buffText:getConfig("desc")

				if slot0._buffText:getConfig("max_time") > 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 28-39, warpins: 1 ---
					slot2 = pg.TimeMgr:GetInstance():GetServerTime()

					if slot1.timestamp then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 40-79, warpins: 1 ---
						setText(slot0._buffText:Find("Text"), string.gsub(slot0, "$" .. 1, pg.TimeMgr.GetInstance():DescCDTime(slot4)))

						slot0._buffTimeCountDownTimer = Timer.New(function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-4, warpins: 1 ---
							if slot0 > 0 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 5-32, warpins: 1 ---
								slot0 = slot0 - 1

								setText(slot1._buffText:Find("Text"), string.gsub(slot1._buffText.Find("Text"), "$" .. 1, pg.TimeMgr.GetInstance():DescCDTime(pg.TimeMgr.GetInstance().DescCDTime)))
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 33-46, warpins: 1 ---
								slot1._buffTimeCountDownTimer:Stop()
								setActive(slot1._buffTimeCountDownTimer._buffText, false)
								setActive(slot3, false)
								--- END OF BLOCK #0 ---



							end

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 47-47, warpins: 2 ---
							return
							--- END OF BLOCK #1 ---



						end, 1, -1)

						slot0._buffTimeCountDownTimer:Start()
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 80-88, warpins: 1 ---
					setText(slot0._buffText:Find("Text"), slot0)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 89-104, warpins: 3 ---
				slot0._buffTextTimer = Timer.New(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-9, warpins: 1 ---
					setActive(slot0._buffText, false)

					if setActive._buffTimeCountDownTimer ~= nil then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 10-14, warpins: 1 ---
						slot0._buffTimeCountDownTimer:Stop()
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 15-15, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end, slot3.BUFFTEXT_SHOW_TIME, 1)

				slot0._buffTextTimer:Start()

				return
				--- END OF BLOCK #2 ---



			end, SFX_PANEL)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-23, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot2:align(#slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateFlagShip = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.live2dChar and slot0.flagShip then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		retPaintingPrefab(slot0._paintingTF, slot0.flagShip:getPainting())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 44-45, warpins: 3 ---
	slot0.flagShip = slot1

	slot0:ShowAssistInfo(slot1:getPainting(), slot1)

	if not (getProxy(SettingsProxy):IsLive2dEnable() and (slot2 == "biaoqiang" or slot2 == "z23" or slot2 == "lafei" or slot2 == "lingbo" or slot2 == "mingshi")) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-70, warpins: 1 ---
		rtf(slot0._paintingTF).anchorMin = Vector2(0.5, 0.5)
		rtf(slot0._paintingTF).anchorMax = Vector2(0.5, 0.5)
		rtf(slot0._paintingTF).pivot = Vector2(0.5, 0.5)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-94, warpins: 1 ---
		rtf(slot0._paintingTF).anchorMin = Vector2(0.5, 0)
		rtf(slot0._paintingTF).anchorMax = Vector2(0.5, 0)
		rtf(slot0._paintingTF).pivot = Vector2(0.5, 0)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 95-103, warpins: 2 ---
	slot4 = nil

	if pg.ship_skin_template[slot0.flagShip.skinId].main_UI_FX ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 104-105, warpins: 1 ---
		slot4 = slot5
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 106-108, warpins: 1 ---
		if slot1.propose then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 109-109, warpins: 1 ---
			slot4 = "jiehuntexiao"
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 110-113, warpins: 3 ---
	setActive(slot0.effectTF, slot4 ~= nil)

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 117-119, warpins: 2 ---
	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 120-131, warpins: 1 ---
		PoolMgr.GetInstance():GetPrefab("Effect/" .. slot4, slot4, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if not slot0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-23, warpins: 1 ---
				slot0._paintingFX = {
					name = slot0,
					obj = slot0
				}

				slot0.transform:SetParent(slot0.effectTF, true)

				slot0.transform.localPosition = Vector3.zero
				slot0.transform.localScale = Vector3.one
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 24-24, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 132-134, warpins: 2 ---
	if slot0.flagShip then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 135-150, warpins: 1 ---
		slot6 = getProxy(SettingsProxy):IsBGEnable()

		if slot0.flagShip:getShipBgPrint() ~= slot0.flagShip:rarity2bgPrintForGet() and slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 153-159, warpins: 1 ---
			GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot7, "", function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				if not slot0.exited then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-23, warpins: 1 ---
					slot0.defaultBgSprite = getImageSprite(slot0._bg:Find("bg"))

					setImageSprite(slot0._bg:Find("bg"), slot0)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 24-24, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 160-161, warpins: 4 ---
	return
	--- END OF BLOCK #6 ---



end

slot0.setFlagShip = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0.tempFlagShip = slot1

	return
	--- END OF BLOCK #0 ---



end

slot0.updateTaskNotices = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	SetActive(slot0._taskBtn:Find("tip"), slot1 > 0)

	slot0._taskNotFinishCount = slot2

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-15, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

slot0.updateLessonNotices = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0.schoolTip = defaultValue(slot1, true)

	slot0:updateLiveBtn()

	return
	--- END OF BLOCK #0 ---



end

slot0.updateBackYardNotices = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.backyardTip = slot1

	slot0:updateLiveBtn()

	return
	--- END OF BLOCK #0 ---



end

slot0.updateCommanderNotices = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.commanderTip = slot1

	slot0:updateLiveBtn()

	return
	--- END OF BLOCK #0 ---



end

slot0.updateNotification = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	SetActive(slot0:findTF("tip", slot0._chatBtn), slot1 > 0)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-15, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

slot0.friendNotification = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	SetActive(slot0:findTF("tip", slot0._friendBtn), slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateBuildNotices = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	SetActive(slot0:findTF("tip", slot0._buildBtn), slot1 > 0)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-14, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

slot0.updateLiveBtn = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	SetActive(slot0:findTF("tip", slot0._liveBtn), slot0.backyardTip or slot0.schoolTip or slot0.commanderTip)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-15, warpins: 3 ---
	--- END OF BLOCK #1 ---



end

slot0.updateCollectNotices = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0.hasCollectCanGetRes = slot1

	SetActive(findTF(slot0._collectionBtn, "tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateGuildNotices = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	setActive(findTF(slot0._guildButton, "tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateMailAttachmentCount = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0._attachmentCount = slot1

	if slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-34, warpins: 1 ---
		SetActive(slot0._attachmentHint, true)
		SetActive(slot0._mailEmpty, false)
		SetActive(slot0._mailMsg, true)

		slot0._mailBtn:GetComponent(typeof(Button)).targetGraphic = slot0._mailMsg:GetComponent(typeof(Image))
		slot0._attachmentCountText.text = slot1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-61, warpins: 1 ---
		SetActive(slot0._mailEmpty, true)
		SetActive(slot0._mailMsg, false)
		SetActive(slot0._attachmentHint, false)

		slot0._mailBtn:GetComponent(typeof(Button)).targetGraphic = slot0._mailEmpty:GetComponent(typeof(Image))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 62-62, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.updateEvent = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0.hasFinishedEvent = slot1:hasFinishState()

	setActive(slot0._combatBtn:Find("tip"), slot0.hasFinishedEvent)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateCommissionNotices = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0._commissionTip, slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateSeverNotices = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0._noticeBtn:Find("tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.UpdateBtnTips = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = false

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-10, warpins: 0 ---
	for slot7, slot8 in pairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot3 = slot3 or slot8
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-10, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 11-15, warpins: 1 ---
	setActive(slot1, slot3)

	return
	--- END OF BLOCK #2 ---



end

slot4 = {}

slot0.updateSettingsNotice = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-5, warpins: 1 ---
		slot0[slot2] = slot1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-13, warpins: 0 ---
		for slot6, slot7 in pairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-11, warpins: 1 ---
			slot0[slot6] = slot1
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-13, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-23, warpins: 2 ---
	slot0:UpdateBtnTips(slot0._settingBtn:Find("tip"), slot0)

	return
	--- END OF BLOCK #1 ---



end

slot0.notifyTechnology = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0._technologyBtn:Find("tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.notifyActivitySummary = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	setActive(slot0._activitySummaryBtn:Find("tip/Text").parent, slot1 > 0)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-17, warpins: 2 ---
	if slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-21, warpins: 1 ---
		setText(slot3, slot1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-29, warpins: 2 ---
	onButton(slot0, slot0._activitySummaryBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot0.emit(slot1, MainUIMediator.GO_SCENE, {
			SCENE.ACTIVITY,
			{
				id = slot0.emit and slot1.id
			}
		})

		return
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-19, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #2 ---



end

slot0.updateVoteNotices = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

slot0.updateAttireBtn = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0._commanderInfoBtn:Find("tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateChat = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.exited then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-7, warpins: 2 ---
	if slot0.hideChatFlag and slot0.hideChatFlag == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-18, warpins: 3 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-23, warpins: 0 ---
	for slot6 = slot0._chatList.childCount, #slot1 - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-23, warpins: 2 ---
		cloneTplTo(slot0._chatItem, slot0._chatList)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 24-31, warpins: 1 ---
	setActive(slot0._chatEmptySign, PLATFORM_CODE == PLATFORM_JP and slot0._chatList.childCount <= 0)

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 38-42, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 43-58, warpins: 0 ---
	for slot6 = 0, slot2 - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-53, warpins: 2 ---
		slot0._chatList:GetChild(slot6).gameObject:SetActive(slot6 < #slot1)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 57-58, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 59-62, warpins: 1 ---
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 63-142, warpins: 0 ---
	for slot6, slot7 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-101, warpins: 1 ---
		slot0:findTF("channel", slot8):GetComponent("Image").sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(slot7.type) .. "_1920", true)
		slot10 = slot0:findTF("text", slot0._chatList:GetChild(slot6 - 1)):GetComponent("RichText")

		if slot7.type == ChatConst.ChannelPublic then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 102-109, warpins: 1 ---
			slot10.supportRichText = true

			ChatProxy.InjectPublic(slot10, slot7)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 110-112, warpins: 1 ---
			slot10.supportRichText = slot7.emojiId ~= nil
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 116-125, warpins: 2 ---
			slot11 = false
			slot12 = slot7.player.name .. ": " .. slot7.content

			if not slot7.emojiId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 126-132, warpins: 1 ---
				slot11, slot12 = contentWrap(slot12, 40, 1.65)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 133-135, warpins: 2 ---
			slot10.text = slot12 .. ((slot11 and "...") or "")
			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 139-140, warpins: 2 ---
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 141-142, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 143-143, warpins: 1 ---
	return
	--- END OF BLOCK #9 ---



end

slot0.clearChat = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	childCount = slot0._chatList.childCount

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-19, warpins: 0 ---
	for slot5 = 0, childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-19, warpins: 2 ---
		slot0._chatList:GetChild(slot5).gameObject:SetActive(false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-20, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.updateBanner = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-45, warpins: 1 ---
	slot2 = slot0:findTF("eventPanel/mask/event", slot0._rightPanel):GetComponent("HScrollSnap")

	slot2:Init()

	slot3 = slot0:findTF("content", slot2)
	slot5 = slot0:findTF("eventPanel/dots", slot0._rightPanel)

	setActive(slot4, false)
	setActive(slot6, false)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 46-103, warpins: 0 ---
	for slot10 = 0, #slot1 - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-81, warpins: 2 ---
		cloneTplTo(slot6, slot5)

		slot12 = Instantiate(slot4)

		LoadImageSpriteAsync("activitybanner/" .. slot1[slot10 + 1].pic, slot12)
		slot2:AddChild(slot12)
		onButton(slot0, slot12, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0.type == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-10, warpins: 1 ---
				Application.OpenURL(slot0.param)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				if slot0.type == 2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-23, warpins: 1 ---
					slot1:emit(MainUIMediator.GO_SCENE, slot0.param)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-27, warpins: 1 ---
					if slot0.type == 3 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 28-38, warpins: 1 ---
						slot1:emit(MainUIMediator.OPEN_ACTIVITY_PANEL, tonumber(slot0.param))
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 39-42, warpins: 1 ---
						if slot0.type == 4 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 43-51, warpins: 1 ---
							slot1:emit(MainUIMediator.OPEN_SHOP_LAYER, slot0.param)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 52-55, warpins: 1 ---
							if slot0.type == 5 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 56-66, warpins: 1 ---
								slot1:emit(MainUIMediator.OPEN_SCROLL, tonumber(slot0.param))
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 67-70, warpins: 1 ---
								if slot0.type == 6 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 71-76, warpins: 1 ---
									slot1:emit(MainUIMediator.OPEN_TECHNOLOGY)
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 77-77, warpins: 7 ---
			return
			--- END OF BLOCK #1 ---



		end, SFX_MAIN)
		setActive(findTF(slot12, "red"), false)

		if slot1[slot10 + 1].type == 3 and tonumber(slot11.param) == nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 87-97, warpins: 1 ---
			setActive(slot13, getProxy(ActivityProxy):readyToAchieveByType(ActivityConst.ACTIVITY_TYPE_LEVELAWARD))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 98-103, warpins: 3 ---
		slot12:SetActive(true)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 104-110, warpins: 1 ---
	slot2.autoSnap = 5
	slot0.bannerSnap = slot2
	slot0.bannerContent = slot3
	slot0.bannerDots = slot5

	return
	--- END OF BLOCK #2 ---



end

slot0.activeEffect = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0._paintingTF, slot1)
	setActive(slot0._linkBtns, slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.resetCommissionBtn = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	LeanTween.moveX(slot0._commissionBtn, 0, 0.2)

	return
	--- END OF BLOCK #0 ---



end

slot0.updateExSkinBtn = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	setActive(slot0.exSkinBtn, #slot1 > 0)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-14, warpins: 2 ---
	if #slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-20, warpins: 1 ---
		onButton(slot0, slot0.exSkinBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0:showExSkinWindow(slot0)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-28, warpins: 2 ---
	slot0._buffList.localPosition = Vector3((#slot1 > 0 and 390) or 285, slot0._buffList.localPosition.y, slot0._buffList.localPosition.z)
	slot0._buffText.localPosition = Vector3((#slot1 > 0 and 339) or 234, -90, slot0._buffList.localPosition.z)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 32-43, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 47-52, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

slot0.showExSkinWindow = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-50, warpins: 1 ---
		setActive(slot0, true)

		slot1 = UIItemList.New(slot0:Find("window/list/content"), slot0:Find("window/list/content/tpl"))

		slot1:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-23, warpins: 1 ---
				setText(slot2:Find("name/Text"), slot0[slot1 + 1]:getConfig("name"))

				if slot1.skinTimers[slot0[slot1 + 1].id] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-30, warpins: 1 ---
					slot1.skinTimers[slot3.id]:Stop()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 31-66, warpins: 2 ---
				slot1.skinTimers[slot3.id] = Timer.New(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-15, warpins: 1 ---
					setText(slot1:Find("time/Text"), skinTimeStamp(slot0:getRemainTime()))

					return
					--- END OF BLOCK #0 ---



				end, 1, -1)

				slot1.skinTimers[slot3.id]:Start()
				slot1.skinTimers[slot3.id].func()

				slot4 = slot2:Find("icon_bg/icon")

				LoadSpriteAsync("qicon/" .. slot3:getIcon(), function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-6, warpins: 1 ---
					if not IsNil(slot0._tf) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 7-14, warpins: 1 ---
						slot1:GetComponent(typeof(Image)).sprite = slot0
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 15-15, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end)
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 67-68, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot1:align(#slot0)
		onButton(slot1, slot0:Find("window/top/btnBack"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(slot1, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(slot1, slot0:Find("window/button_container/confirm_btn"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0:findTF(SkinShopScene.EXSKINNAME, slot0.toTopPanel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-20, warpins: 1 ---
		PoolMgr.GetInstance():GetUI(SkinShopScene.EXSKINNAME, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-17, warpins: 2 ---
			setParent(slot0, slot0.toTopPanel)
			setParent(slot0.transform)

			slot0.name = SkinShopScene.EXSKINNAME

			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-23, warpins: 1 ---
		slot2(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-25, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.showOverDueExSkins = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-50, warpins: 1 ---
		setActive(slot0, true)

		slot1 = UIItemList.New(slot0:Find("window/list/scrollrect/content"), slot0:Find("window/list/scrollrect/content/tpl"))

		slot1:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-30, warpins: 1 ---
				setText(slot2:Find("name/Text"), slot0[slot1 + 1].getConfig(slot3, "name"))

				slot4 = slot2:Find("icon_bg/icon")

				LoadSpriteAsync("qicon/" .. slot0[slot1 + 1]:getIcon(), function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-6, warpins: 1 ---
					if not IsNil(slot0._tf) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 7-14, warpins: 1 ---
						slot1:GetComponent(typeof(Image)).sprite = slot0
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 15-15, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 31-31, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot1:align(#slot0)
		onButton(slot1, slot0:Find("window/button_container/confirm_btn"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(slot1, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(slot1, slot0:Find("window/top/btnBack"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0:findTF(SkinShopScene.OVERDUENAME, slot0.toTopPanel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-20, warpins: 1 ---
		PoolMgr.GetInstance():GetUI(SkinShopScene.OVERDUENAME, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-17, warpins: 2 ---
			setParent(slot0, slot0.toTopPanel)
			setParent(slot0.transform)

			slot0.name = SkinShopScene.OVERDUENAME

			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-23, warpins: 1 ---
		slot2(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-25, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.resumePaitingState = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).blocksRaycasts = true
	GetOrAddComponent(slot0._paintingTF, typeof(CanvasGroup)).alpha = 1

	return
	--- END OF BLOCK #0 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0:RemoveVoteBookTimer()
	slot0:disablePartialBlur()

	if slot0.leans then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-13, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-21, warpins: 0 ---
		for slot4, slot5 in ipairs(slot0.leans) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-19, warpins: 1 ---
			LeanTween.cancel(go(slot5))
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 20-21, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 22-23, warpins: 1 ---
		slot0.leans = {}
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-40, warpins: 2 ---
	LeanTween.cancel(go(slot0._paintingTF))
	slot0:resumePaitingState()
	LeanTween.cancel(slot0._chat.gameObject)

	if slot0._delayVoiceTweenID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-46, warpins: 1 ---
		LeanTween.cancel(slot0._delayVoiceTweenID)

		slot0._delayVoiceTweenID = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 47-49, warpins: 2 ---
	if slot0._delayL2dSeID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-55, warpins: 1 ---
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 56-58, warpins: 2 ---
	if slot0._newBG then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 59-71, warpins: 1 ---
		LeanTween.cancel(go(slot0._newBG))
		Destroy(go(slot0._newBG))

		slot0._newBG = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 72-74, warpins: 2 ---
	if slot0._paintingFX then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 75-91, warpins: 1 ---
		PoolMgr.GetInstance():ReturnPrefab("Effect/" .. slot1, slot0._paintingFX.name, slot0._paintingFX.obj)

		slot0._paintingFX = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 92-94, warpins: 2 ---
	if slot0.chatTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 95-100, warpins: 1 ---
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 101-113, warpins: 2 ---
	pg.TimeMgr.GetInstance():RemoveTimer(slot0._timeSchedule)

	slot0._timeSchedule = nil

	if slot0._resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 114-119, warpins: 1 ---
		slot0._resPanel:exit()

		slot0._resPanel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 120-122, warpins: 2 ---
	if slot0.flagShip then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 123-129, warpins: 1 ---
		retPaintingPrefab(slot0._paintingTF, slot0.flagShip:getPainting())
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 130-132, warpins: 2 ---
	if slot0.live2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 133-138, warpins: 1 ---
		slot0.live2dChar:Dispose()

		slot0.live2dChar = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 139-144, warpins: 2 ---
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 145-159, warpins: 0 ---
	for slot4 = slot0.bannerContent.childCount - 1, 0, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 145-159, warpins: 2 ---
		clearImageSprite(slot0.bannerContent:GetChild(slot4))
		Destroy(slot0.bannerSnap:RemoveChild(slot4))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 160-165, warpins: 1 ---
	removeAllChildren(slot0.bannerDots)

	if slot0._currentVoice then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 166-170, warpins: 1 ---
		slot0._currentVoice:Stop(true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 171-175, warpins: 2 ---
	slot0._currentVoice = nil

	if slot0.loadedCVBankName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 176-182, warpins: 1 ---
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 183-185, warpins: 2 ---
	if slot0.defaultBgSprite then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 186-195, warpins: 1 ---
		setImageSprite(slot0._bg:Find("bg"), slot0.defaultBgSprite)

		slot0.defaultBgSprite = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 196-198, warpins: 2 ---
	if slot0._buffTextTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 199-204, warpins: 1 ---
		slot0._buffTextTimer:Stop()

		slot0._buffTextTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 205-207, warpins: 2 ---
	if slot0._buffTimeCountDownTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 208-213, warpins: 1 ---
		slot0._buffTimeCountDownTimer:Stop()

		slot0._buffTimeCountDownTimer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 214-216, warpins: 2 ---
	if slot0.isOpenSecondary then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 217-220, warpins: 1 ---
		slot0:closeSecondaryPanel(false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #17 221-223, warpins: 2 ---
	if slot0._secondaryPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 224-235, warpins: 1 ---
		PoolMgr.GetInstance():ReturnUI("MainUISecondaryPanel", go(slot0._secondaryPanel))

		slot0._secondaryPanel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 236-239, warpins: 2 ---
	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 240-244, warpins: 0 ---
	for slot4, slot5 in pairs(slot0.skinTimers) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 240-242, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 243-244, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #19 ---

	FLOW; TARGET BLOCK #20



	-- Decompilation error in this vicinity:
	--- BLOCK #20 245-250, warpins: 1 ---
	slot0.skinTimers = nil

	slot0:recycleSpineChar()

	return
	--- END OF BLOCK #20 ---



end

slot0.sethideChatBtn = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 10-19, warpins: 3 ---
	setActive(slot0._chatActBtn, slot0.hideChatFlag and slot0.hideChatFlag == 1)
	setActive(slot0._chatActBtnDisable, not (slot0.hideChatFlag and slot0.hideChatFlag == 1))

	if slot0.hideChatFlag and slot0.hideChatFlag == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-22, warpins: 1 ---
		slot0:clearChat()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-41, warpins: 2 ---
	slot0._chatBg:GetComponent(typeof(Button)).enabled = not slot1
	slot0._chatBtn:GetComponent(typeof(Button)).enabled = not slot1

	return
	--- END OF BLOCK #1 ---



end

slot0.showOverDueAttire = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-50, warpins: 1 ---
		setActive(slot0, true)

		slot1 = UIItemList.New(slot0:Find("window/sliders/scrollrect/content"), slot0:Find("window/sliders/scrollrect/content/tpl"))

		slot1:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-20, warpins: 1 ---
				updateDrop(slot2, {
					count = 1,
					id = slot0[slot1 + 1].getConfig(slot3, "id"),
					type = slot0[slot1 + 1]:getDropType()
				})
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-21, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot1:align(#slot0)
		onButton(slot1, slot0:Find("window/confirm_btn"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(slot1, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(slot1, slot0:Find("window/top/btnBack"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(setActive, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)

		return
		--- END OF BLOCK #0 ---



	end

	if not slot0:findTF(AttireConst.OverDueWindowName, slot0.toTopPanel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-20, warpins: 1 ---
		PoolMgr.GetInstance():GetUI(AttireConst.OverDueWindowName, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-17, warpins: 2 ---
			setParent(slot0, slot0.toTopPanel)
			setParent(slot0.transform)

			slot0.name = AttireConst.OverDueWindowName

			return
			--- END OF BLOCK #1 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-23, warpins: 1 ---
		slot2(slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-25, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.loadChar = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0.shipPrefab then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-20, warpins: 1 ---
		slot0.shipPrefab = slot1

		pg.UIMgr.GetInstance():LoadingOn()
		PoolMgr.GetInstance():GetSpineChar(slot1, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-23, warpins: 1 ---
			pg.UIMgr.GetInstance():LoadingOff()

			slot0.shipModel = slot0
			tf(slot0).localScale = Vector3(0.75, 0.75, 1)
			tf(slot0).localPosition = Vector3((tf(slot0)[Vector3(0.75, 0.75, 1)] and slot1.mainui_shift[1]) or 0, (slot1 and slot1.mainui_shift[2]) or 0, 0)

			setParent(slot0, slot0._icon)
			slot0:GetComponent("SpineAnimUI"):SetAction("normal", 0)

			return
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 29-30, warpins: 2 ---
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 36-60, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 21-22, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.recycleSpineChar = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.shipPrefab and slot0.shipModel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-18, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(slot0.shipPrefab, slot0.shipModel)

		slot0.shipPrefab = nil
		slot0.shipModel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-19, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

return slot0
