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

function slot0.getUIName(slot0)
	return "MainUI"
end

function slot0.getBGM(slot0)
	return "main"
end

function slot0.setShips(slot0, slot1)
	slot0.ships = slot1
end

function slot0.setBG(slot0)
	slot2 = ""

	for slot6, slot7 in ipairs(uv0.BG_TIMES) do
		if slot7[1] <= pg.TimeMgr.GetInstance():GetServerHour() and pg.TimeMgr.GetInstance().GetServerHour() < slot7[2] then
			slot2 = "commonbg/bg_main_" .. slot7[3]

			break
		end
	end

	if slot2 then
		PoolMgr.GetInstance():GetSprite(slot2, "", false, function (slot0)
			setImageSprite(uv0._bg:Find("bg"), slot0)
		end)
	end
end

function slot0.Ctor(slot0)
	uv0.super.Ctor(slot0)

	uv1 = pg.AssistantInfo
end

function slot0.init(slot0)
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
	slot0._bottomPanel = slot0:findTF("toTop/frame/bottomPanel")
	slot0._dockBtn = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/dockBtn")
	slot0._equipBtn = slot0:findTF("toTop/frame/bottomPanel/btm/buttons_container/equipButton")
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
	slot0._expBar = slot0:findTF("top/playerInfoBg2/playerInfoBg/expArea/expBar", slot0._commanderPanel):GetComponent(typeof(Slider))
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

function slot0.uiEnterAnim(slot0)
	slot1 = nil

	if slot0.contextData.isFromLogin or getProxy(PlayerProxy):getFlag("battle") then
		function slot1(...)
			uv0:enablePartialBlur()

			if uv0.tempFlagShip then
				uv1.blocksRaycasts = true
			else
				uv1.blocksRaycasts = true

				if not uv0._attachmentCount then
					uv0._attachmentCount = 0
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

	setAnchoredPosition(slot0._bottomPanel, Vector3(0, -128, 0))
	setAnchoredPosition(slot0._btmbg, Vector3(0, -128, 0))
	setAnchoredPosition(slot0._commanderPanel, Vector3(0, 141, 0))
	setAnchoredPosition(slot0._commanderPanelbg, Vector3(0, 141, 0))
	setAnchoredPosition(slot0._leftPanel, Vector3(-222, 0, 0))
	setAnchoredPosition(slot0._rightPanel, Vector3(847, 0, 0))
	setAnchoredPosition(slot0._rightTopPanel, Vector3(847, 0, 0))
	setAnchoredPosition(slot0._playerResOb, Vector3(0, 77, 0))
	slot0:ejectGimmick(slot0._bottomPanel, uv0.REVERT_VERTICAL, uv0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._btmbg, uv0.REVERT_VERTICAL, uv0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._playerResOb, uv0.REVERT_VERTICAL, uv0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._commanderPanel, uv0.REVERT_HERIZONTAL_VERTICAL, uv0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._commanderPanelbg, uv0.REVERT_HERIZONTAL_VERTICAL, uv0.EJECT_DURATION_ENTER, nil, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._rightTopPanel, uv0.REVERT_HERIZONTAL, uv0.EJECT_DURATION_ENTER, nil, 0.1, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._rightPanel, uv0.REVERT_HERIZONTAL, uv0.EJECT_DURATION_ENTER, nil, 0.2, {
		0,
		1
	})
	slot0:ejectGimmick(slot0._leftPanel, uv0.REVERT_HERIZONTAL, uv0.EJECT_DURATION_ENTER, slot1, 0.2, {
		0,
		1
	})
end

function slot0.openSecondaryPanel(slot0, slot1)
	function slot2()
		SetActive(uv0._academyBtn:Find("tip"), uv0.schoolTip)
		SetActive(uv0:findTF("tip", uv0._commanderBtn), uv0.commanderTip)
		SetActive(uv0:findTF("tip", uv0._haremBtn), uv0.backyardTip)

		uv0.isOpenSecondary = true

		pg.UIMgr.GetInstance():BlurPanel(uv0._secondaryPanel)
		setActive(uv0._secondaryPanel, true)
	end

	if not slot0._secondaryPanel then
		PoolMgr.GetInstance():GetUI("MainUISecondaryPanel", true, function (slot0)
			slot0.name = "secondary_panel"
			uv0._secondaryPanel = tf(slot0)

			SetActive(uv0._secondaryPanel, false)

			slot1 = uv0:findTF("frame/bg", uv0._secondaryPanel)
			uv0._academyBtn = uv0:findTF("school_btn", slot1)
			uv0._haremBtn = uv0:findTF("backyard_btn", slot1)
			uv0._commanderBtn = uv0:findTF("commander_btn", slot1)

			uv0._secondaryPanel:SetParent(uv0._tf, false)

			if not pg.SystemOpenMgr:GetInstance():isOpenSystem(uv0._player.level, "CommandRoomMediator") then
				uv0._commanderBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
			else
				uv0._commanderBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
			end

			if not pg.SystemOpenMgr:GetInstance():isOpenSystem(uv0._player.level, "BackYardMediator") then
				uv0._haremBtn:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
			else
				uv0._haremBtn:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
			end

			onButton(uv0, uv0._commanderBtn, function ()
				uv0:emit(MainUIMediator.OPEN_COMMANDER)
			end, SFX_MAIN)
			onButton(uv0, uv0._haremBtn, function ()
				uv0:emit(MainUIMediator.OPEN_BACKYARD)
			end, SFX_MAIN)
			onButton(uv0, uv0._academyBtn, function ()
				uv0:emit(MainUIMediator.OPEN_SCHOOLSCENE)
			end, SFX_MAIN)
			onButton(uv0, uv0._secondaryPanel, function ()
				uv0:closeSecondaryPanel(true)
			end)
			uv1()
		end)
	else
		slot2()
	end
end

function slot0.closeSecondaryPanel(slot0, slot1)
	if slot1 then
		slot0:enablePartialBlur()
	end

	slot0.isOpenSecondary = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0._secondaryPanel, slot0._tf)
	setActive(slot0._secondaryPanel, false)
end

function slot0.disableTraningCampAndRefluxTip(slot0)
	setActive(slot0.traingCampBtn:Find("xinshou01"), false)
	setActive(slot0.refluxBtn:Find("effect"), false)
end

function slot0.updateTraningCampBtn(slot0)
	slot3 = false
	slot4 = false

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_GUIDE_TASKS) and not slot1:isEnd() then
		slot3 = getProxy(ChapterProxy):getChapterById(slot1:getConfig("config_data")[1]) and slot6:isClear()
		slot8 = getProxy(TaskProxy)
		slot4 = _.any(_.flatten(slot1:getConfig("config_data")[3]), function (slot0)
			return uv0:getTaskById(slot0) and slot1:isFinish() and not slot1:isReceive()
		end)
	end

	setActive(slot0.traingCampBtn:Find("xinshou01"), slot4)

	slot0.openTraningCamp = slot2 and slot3

	setActive(slot0.traingCampBtn, slot0.openTraningCamp)
end

function slot0.updateRefluxBtn(slot0)
	setActive(slot0.refluxBtn, getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot2:isEnd())

	if getProxy(ActivityProxy).getActivityByType(ActivityConst.ACTIVITY_TYPE_REFLUX) and not slot2.isEnd() then
		setActive(slot0.refluxBtn:Find("effect"), slot1:existRefluxAwards())
	end
end

function slot0.disablePartialBlur(slot0)
	if slot0._tf then
		pg.UIMgr.GetInstance():UnOverlayPanel(slot0.toTopPanel, slot0._tf)
	end
end

function slot0.enablePartialBlur(slot0)
	if slot0._tf then
		table.insert(slot1, slot0.toTopPanel:Find("frame/rightTopPanel/bg"))
		table.insert(slot1, slot0.toTopPanel:Find("frame/rightPanel/eventPanel"))
		table.insert(slot1, slot0.toTopPanel:Find("frame/rightPanel/chatPreview"))
		pg.UIMgr.GetInstance():OverlayPanelPB(slot0.toTopPanel, {
			pbList = {}
		})
	end
end

function slot0.emit(slot0, ...)
	if slot0.event then
		slot0.event:emit(...)
	end
end

function slot0.didEnter(slot0)
	slot0:setBG()
	onButton(slot0, slot0.traingCampBtn, function ()
		uv0:emit(MainUIMediator.OPEN_TRANINGCAMP)
	end, SFX_PANEL)
	slot0:uiEnterAnim()

	slot0._attachmentCount = 0

	onButton(slot0, slot0.traingCampBtn, function ()
		uv0:emit(MainUIMediator.OPEN_TRANINGCAMP)
	end, SFX_PANEL)
	onButton(slot0, slot0.refluxBtn, function ()
		uv0:emit(MainUIMediator.GO_SCENE, {
			SCENE.REFLUX
		})
	end, SFX_PANEL)
	onButton(slot0, slot0._combatBtn, function ()
		uv0:emit(MainUIMediator.OPEN_LEVEL)
	end, SFX_UI_WEIGHANCHOR_BATTLE)
	onButton(slot0, slot0._dockBtn, function ()
		uv0:emit(MainUIMediator.OPEN_CHUANWUSTART, DockyardScene.MODE_OVERVIEW)
	end, SFX_MAIN)
	onButton(slot0, slot0._hideBtn, function ()
		uv0:switchForm(uv1.STATE_ALL_HIDE)
	end, SFX_MAIN)
	onButton(slot0, slot0._cameraBtn, function ()
		uv0:emit(MainUIMediator.OPEN_SNAPSHOT, {
			skinId = uv0.flagShip.skinId,
			live2d = uv0.live2dChar ~= nil
		})
	end, SFX_MAIN)
	onButton(slot0, slot0._mallBtn, function ()
		uv0:emit(MainUIMediator.GO_MALL)
	end, SFX_MAIN)
	onButton(slot0, slot0._commissionBtn, function ()
		if not LeanTween.isTweening(go(uv0._commissionBtn)) then
			LeanTween.moveX(uv0._commissionBtn, -1 * uv0._commissionBtn.rect.width, 0.2):setOnComplete(System.Action(function ()
				uv0:emit(MainUIMediator.OPEN_COMMISSION_INFO)
			end))
		end
	end, SFX_UI_INFO)
	onButton(slot0, slot0._friendBtn, function ()
		uv0:emit(MainUIMediator.OPEN_FRIEND)
	end, SFX_UI_MENU)
	onButton(slot0, slot0._buildBtn, function ()
		uv0:emit(MainUIMediator.GETBOAT)
	end, SFX_UI_BUILDING)
	onButton(slot0, slot0._taskBtn, function ()
		uv0:emit(MainUIMediator.OPEN_TASK)
	end, SFX_MAIN)
	onButton(slot0, slot0._equipBtn, function ()
		uv0:emit(MainUIMediator.OPEN_ARMORYSCENE)
	end, SFX_MAIN)
	onButton(slot0, slot0._formationBtn, function ()
		uv0:emit(MainUIMediator.OPEN_BIANDUI, defaultValue(uv0.contextData.fleetId, 1))
	end, SFX_UI_FORMATION)
	onButton(slot0, slot0._collectionBtn, function ()
		uv0:emit(MainUIMediator.OPEN_COLLECT_SHIP)
	end, SFX_UI_MENU)

	if not pg.SystemOpenMgr:GetInstance():isOpenSystem(slot0._player.level, "NewGuildMediator") then
		setActive(slot0:findTF("lock", slot0._guildButton), true)

		slot0._guildButton:GetComponent(typeof(Image)).color = Color(0.3, 0.3, 0.3, 1)
	else
		setActive(slot0:findTF("lock", slot0._guildButton), false)

		slot0._guildButton:GetComponent(typeof(Image)).color = Color(1, 1, 1, 1)
	end

	onButton(slot0, slot0._guildButton, function ()
		uv0:emit(MainUIMediator.OPEN_GUILD)
	end, SFX_MAIN)
	onButton(slot0, slot0._mailBtn, function ()
		if BATTLE_DEBUG then
			uv0:emit(MainUIMediator.TMP_DEBUG)
		else
			uv0:emit(MainUIMediator.OPEN_MAIL)
		end
	end, SFX_UI_MENU)
	onButton(slot0, slot0._chatBtn, function ()
		if not uv0.hideChatFlag or uv0.hideChatFlag ~= 1 then
			uv0:emit(MainUIMediator.OPEN_CHATVIEW)
		end
	end, SFX_UI_CHAT)
	onButton(slot0, slot0._chatBg, function ()
		if not LeanTween.isTweening(go(uv0._commissionBtn)) and (not uv0.hideChatFlag or uv0.hideChatFlag ~= 1) then
			uv0:emit(MainUIMediator.OPEN_CHATVIEW)
		end
	end, SFX_UI_CHAT)
	onButton(slot0, slot0._settingBtn, function ()
		uv0:emit(MainUIMediator.OPEN_SETTINGS)
	end, SFX_UI_MENU)
	onButton(slot0, slot0._chatActBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n(uv0.hideChatFlag and uv0.hideChatFlag == 1 and "show_chat_warning" or "hide_chat_warning"),
			onYes = function ()
				if uv0 then
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 0)
				else
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 1)
				end

				uv1.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)

				uv1:sethideChatBtn()
			end
		})
	end, SFX_UI_PANEL)
	onButton(slot0, slot0._chatActBtnDisable, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n(uv0.hideChatFlag and uv0.hideChatFlag == 1 and "show_chat_warning" or "hide_chat_warning"),
			onYes = function ()
				if uv0 then
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 0)
				else
					PlayerPrefs.SetInt(HIDE_CHAT_FLAG, 1)
				end

				uv1.hideChatFlag = PlayerPrefs.GetInt(HIDE_CHAT_FLAG)

				uv1:sethideChatBtn()
			end
		})
	end, SFX_UI_PANEL)
	slot0:sethideChatBtn()
	onButton(slot0, slot0._noticeBtn, function ()
		uv0:emit(MainUIMediator.OPEN_BULLETINBOARD)
	end, SFX_UI_MENU)
	SetActive(slot0._rankBtn, slot2)
	onButton(slot0, slot0._rankBtn, function ()
		uv0:emit(MainUIMediator.OPEN_RANK)
	end, SFX_UI_MENU)
	onButton(slot0, slot0._commanderInfoBtn, function ()
		uv0:emit(MainUIMediator.OPEN_PLAYER_INFO_LAYER)
	end, SFX_MAIN)
	onButton(slot0, slot0._bg, function ()
		if uv0._currentState == uv1.STATE_ALL_HIDE then
			uv0:switchForm(uv1.STATE_MAIN)
		end
	end, SFX_MAIN)
	onButton(slot0, slot0._paintingTF, function ()
		if uv0._currentState == uv1.STATE_ALL_HIDE then
			uv0:switchForm(uv1.STATE_MAIN)
		elseif uv0.live2dChar then
			uv0:AssistantEventEffect()
		else
			uv0:AssistantEventEffect(uv2.filterAssistantEvents(uv2.PaintingTouchEvents, uv0.flagShip.skinId)[math.ceil(math.random(#uv2.filterAssistantEvents(uv2.PaintingTouchEvents, uv0.flagShip.skinId)))])
			uv0:paintClimax(uv1.TOUCH_HEIGHT, uv1.TOUCH_DURATION, uv1.TOUCH_LOOP)
		end

		if uv0.flagShip then
			uv0:emit(MainUIMediator.ON_TOUCHSHIP, uv0.flagShip.groupId)
		end
	end)
	onButton(slot0, slot0._liveBtn, function ()
		uv0:openSecondaryPanel()
	end, SFX_PANEL)
	onButton(slot0, slot0._technologyBtn, function ()
		uv0:emit(MainUIMediator.OPEN_TECHNOLOGY)
	end, SFX_PANEL)
	pg.DelegateInfo.Add(slot0, slot3)
	GetOrAddComponent(slot0._paintingTF, "UILongPressTrigger").onLongPressed.RemoveAllListeners(slot3)
	GetOrAddComponent(slot0._paintingTF, "UILongPressTrigger").onLongPressed.AddListener(slot3, function ()
		if uv0.live2dChar then
			return
		end

		uv0:emit(MainUIMediator.ON_SHIP_DETAIL, uv0.flagShip)
	end)
	slot0:paintMove(uv0.PAINT_DEFAULT_POS_X, "mainNormal", false, 0)
end

function slot0.updateMonopolyBtn(slot0, slot1)
	setActive(slot0._monopolyBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._monopolyBtn, function ()
			uv0:emit(MainUIMediator.ON_MONOPOLY)
		end, SFX_PANEL)
	end
end

function slot0.updateBossBattleBtn(slot0, slot1)
	setActive(slot0._bossBattleBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._bossBattleBtn, function ()
			uv0:emit(MainUIMediator.ON_BOSS_BATTLE)
		end, SFX_PANEL)
	end
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if slot0.isOpenSecondary then
		slot0:closeSecondaryPanel(true)

		return
	end

	if slot0._currentState == uv0.STATE_ALL_HIDE then
		slot0:switchForm(uv0.STATE_MAIN)
	else
		pg.SDKMgr:GetInstance():onBackPressed()
		pg.PushNotificationMgr.GetInstance():PushAll()
	end
end

function slot0.updateActivityBtn(slot0, slot1)
	setActive(slot0._activityBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityBtn, function ()
			uv0:emit(MainUIMediator.ON_ACTIVITY, uv1.id)
		end, SFX_PANEL)
	end
end

function slot0.updateActivityMapBtn(slot0, slot1)
	setActive(slot0._activityMapBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityMapBtn, function ()
			uv0:emit(MainUIMediator.ON_ACTIVITY_MAP, uv1.id)
		end, SFX_PANEL)
	end
end

function slot0.updateActivityPtBtn(slot0, slot1)
	setActive(slot0._activityPtBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityPtBtn, function ()
			uv0:emit(MainUIMediator.ON_ACTIVITY_PT, uv1.id)
		end, SFX_PANEL)
	end
end

function slot0.updateAnniversaryBtn(slot0, slot1)
	setActive(slot0._anniversaryBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._anniversaryBtn, function ()
			uv0:emit(MainUIMediator.ON_ANNIVERSARY)
		end, SFX_PANEL)
	end
end

function slot0.updateBlackWhitBtn(slot0, slot1)
	setActive(slot0._blackWhitBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._blackWhitBtn, function ()
			uv0:emit(MainUIMediator.ON_BLACKWHITE)
		end, SFX_PANEL)
	end
end

function slot0.updateMemoryBookBtn(slot0, slot1)
	setActive(slot0._memoryBookBtn, slot1 and not slot1:isEnd() and not slot1:isShow())

	if slot1 and not slot1.isEnd() and not slot1.isShow() then
		onButton(slot0, slot0._memoryBookBtn, function ()
			uv0:emit(MainUIMediator.ON_MEMORYBOOK)
		end, SFX_PANEL)
	end
end

function slot0.updateVoteBtn(slot0, slot1)
	slot2 = nil

	if slot1 and not slot1:isEnd() then
		slot2 = _.detect(pg.activity_vote.all, function (slot0)
			return pg.TimeMgr.GetInstance():inTime(pg.activity_vote[slot0].time)
		end)
	end

	setActive(slot0._voteBtn, slot2 ~= nil)

	if slot2 then
		onButton(slot0, slot0._voteBtn, function ()
			uv0:emit(MainUIMediator.ON_VOTE)
		end, SFX_PANEL)
	end
end

function slot0.updateLotteryBtn(slot0, slot1)
	setActive(slot0._lotteryBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._lotteryBtn, function ()
			uv0:emit(MainUIMediator.ON_LOTTERY, uv1.id)
		end, SFX_PANEL)
	end
end

function slot0.updateActivityPtBtn(slot0, slot1)
	setActive(slot0._activityPtBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityPtBtn, function ()
			uv0:emit(MainUIMediator.ON_ACTIVITY_PT, uv1.id)
		end, SFX_PANEL)
	end

	setActive(slot0._activityPtBtn, false)
end

function slot0.updateActivityWowsBtn(slot0, slot1)
	setActive(slot0._activityTaskWowsBtn, slot1 and not slot1:isEnd())

	if slot1 and not slot1.isEnd() then
		onButton(slot0, slot0._activityTaskWowsBtn, function ()
			uv0:emit(MainUIMediator.ON_ACTIVITY_WOWS, uv1.id)
		end, SFX_PANEL)
	end
end

function slot0.fadeBG(slot0, slot1)
	slot0._newBG = Instantiate(slot0._bg:Find("bg"))

	PoolMgr.GetInstance():GetSprite("bg/bg_" .. slot1, "", false, function (slot0)
		if uv0._newBG then
			GetOrAddComponent(uv0._newBG, "Image").sprite = slot0

			uv0._newBG.transform:SetParent(uv0._bg.transform)

			uv0._newBG.transform.localScale = Vector3(1, 1, 1)
			uv0._newBG.transform.localPosition = Vector3(0, 0, 0)
			uv0._newBG.transform.anchoredPosition = Vector3(-5, 0, 0)

			LeanTween.alpha(rtf(uv0._newBG), 0, 5):setFrom(1):setOnComplete(System.Action(function ()
				Destroy(go(uv0._newBG))

				uv0._newBG = nil
			end))
		end
	end)
end

function slot0.switchForm(slot0, slot1)
	if slot0._currentState ~= slot1 then
		slot0._currentState = slot1

		if slot1 == uv0.STATE_MAIN then
			slot0:ejectGimmick(slot0._bottomPanel, uv0.REVERT_VERTICAL)
			slot0:ejectGimmick(slot0._btmbg, uv0.REVERT_VERTICAL)
			slot0:ejectGimmick(slot0._leftPanel, uv0.REVERT_HERIZONTAL)
			slot0:ejectGimmick(slot0._rightPanel, uv0.REVERT_HERIZONTAL)
			slot0:ejectGimmick(slot0._rightTopPanel, uv0.REVERT_HERIZONTAL)
			slot0:ejectGimmick(slot0._playerResOb, uv0.REVERT_VERTICAL)
			slot0:ejectGimmick(slot0._commanderPanel, uv0.REVERT_HERIZONTAL_VERTICAL)
			slot0:ejectGimmick(slot0._commanderPanelbg, uv0.REVERT_HERIZONTAL_VERTICAL)
			slot0:paintMove(uv0.PAINT_DEFAULT_POS_X, "mainNormal", true, 0)
			setActive(slot0:findTF("Sea/vert"), true)
		elseif slot1 == uv0.STATE_ALL_HIDE then
			slot0:concealGimmick(slot0._bottomPanel, uv0.DIRECTION_DOWN)
			slot0:concealGimmick(slot0._btmbg, uv0.DIRECTION_DOWN)
			slot0:concealGimmick(slot0._rightPanel, uv0.DIRECTION_RIGHT)
			slot0:concealGimmick(slot0._leftPanel, uv0.DIRECTION_LEFT)
			slot0:concealGimmick(slot0._playerResOb, uv0.DIRECTION_UP)
			slot0:concealGimmick(slot0._rightTopPanel, uv0.DIRECTION_RIGHT)
			slot0:concealGimmick(slot0._commanderPanel, uv0.DIRECTION_UP_LEFT)
			slot0:concealGimmick(slot0._commanderPanelbg, uv0.DIRECTION_UP_LEFT)
			slot0:paintMove(slot0._paintingOffset, "mainFullScreen", true, 0, 0)
			setActive(slot0:findTF("Sea/vert"), false)
		end
	end
end

function slot0.paintBreath(slot0)
	if slot0.live2dChar or slot0.paintMoving then
		return
	end

	LeanTween.cancel(go(slot0._paintingTF))
	LeanTween.moveY(rtf(slot0._paintingTF), uv0.BREATH_HEIGHT, uv0.BREATH_DURATION):setLoopPingPong():setEase(LeanTweenType.easeInOutCubic):setFrom(uv0.DEFAULT_HEIGHT)
end

function slot0.paintClimax(slot0, slot1, slot2, slot3)
	if slot0.live2dChar or slot0.paintMoving then
		return
	end

	if (slot3 or math.random(3) - 1) ~= 0 then
		LeanTween.cancel(go(slot0._paintingTF))
		LeanTween.moveY(rtf(slot0._paintingTF), slot1, slot2):setLoopPingPong(slot3):setOnComplete(System.Action(function ()
			uv0:paintBreath()
		end))
	end
end

function slot0.paintMove(slot0, slot1, slot2, slot3, slot4, slot5)
	LeanTween.cancel(go(slot0._paintingTF))
	LeanTween.moveY(rtf(slot0._paintingTF), 0, uv0.EJECT_DURATION)
	LeanTween.moveY(findTF(slot0._paintingTF, "live2d"), slot4 or 0, uv0.EJECT_DURATION)

	slot6 = GetOrAddComponent(findTF(slot0._paintingTF, "fitter"), "PaintingScaler")

	slot6:Snapshoot()

	slot6.FrameName = slot2

	if slot3 then
		slot7 = LeanTween.value(go(slot0._paintingTF), 0, 1, uv0.EJECT_DURATION):setOnUpdate(System.Action_float(function (slot0)
			uv0.Tween = slot0
		end)):setEase(LeanTweenType.easeInOutSine)
	end

	slot0._bg:GetComponent("Button").enabled = false
	slot0._paintingTF:GetComponent("Button").enabled = false
	slot0.paintMoving = true
	slot7 = LeanTween.moveX(rtf(slot0._paintingTF), slot1, uv0.EJECT_DURATION)

	slot7:setEase(LeanTweenType.easeInOutExpo)
	LeanTween.moveX(findTF(slot0._paintingTF, "live2d"), slot5 or 170, uv0.EJECT_DURATION).setEase(LeanTween.moveX, LeanTweenType.easeInOutExpo)
	slot7:setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-24, warpins: 1 ---
		uv0.paintMoving = false

		uv0:paintBreath()

		uv0._bg:GetComponent("Button").enabled = true
		uv0._paintingTF:GetComponent("Button").enabled = true

		return
		--- END OF BLOCK #0 ---



	end))
end

function slot0.displayShipWord(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-256, warpins: 1 ---
	if slot0.chatFlag then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.chatFlag = true

	if slot0.chatTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-15, warpins: 1 ---
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
		--- END OF BLOCK #0 ---



	end

	slot4, slot5, slot6, slot7 = nil

	if string.split(slot1, "_")[1] == "main" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-71, warpins: 1 ---
		slot4, slot5 = Ship.getWords(slot0.flagShip.skinId, slot3[1], tonumber(slot3[2]), nil, slot0.flagShip:getIntimacy() / 100 + (slot0.flagShip.propose and 1000 or 0))
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

	slot10 = slot0.CHAT_SHOW_TIME

	if findTF(slot0._paintingTF, "fitter").childCount > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 152-167, warpins: 1 ---
		Ship.SetExpression(findTF(slot0._paintingTF, "fitter"):GetChild(0), slot0.flagShip:getPainting(), slot1)
		--- END OF BLOCK #0 ---



	end

	function slot11()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-29, warpins: 1 ---
		LeanTween.scale(rtf(uv0._chat.gameObject), Vector3.New(1, 1, 1), uv0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-36, warpins: 1 ---
			LeanTween.scale(rtf(uv0._chat.gameObject), Vector3.New(0, 0, 1), uv0.CHAT_ANIMATION_TIME):setEase(LeanTweenType.easeInBack):setDelay(uv0.CHAT_ANIMATION_TIME + uv1):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				uv0.chatFlag = nil

				uv0:startChatTimer()

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
		--- BLOCK #0 172-177, warpins: 1 ---
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
		--- END OF BLOCK #0 ---



	end

	if slot0.live2dChar and slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 183-192, warpins: 1 ---
		slot0._delayL2dSeID = LeanTween.delayedCall(slot7[2], System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			playSoundEffect("event:/ui/" .. uv0[1])

			uv1._delayL2dSeID = nil

			return
			--- END OF BLOCK #0 ---



		end)).id
		--- END OF BLOCK #0 ---



	end

	slot12 = pg.StoryMgr:GetInstance():isActive()

	if getProxy(ContextProxy):getContextByMediator(NewShipMediator) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 210-210, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 211-212, warpins: 1 ---
		if slot5 and not slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 215-237, warpins: 1 ---
			if slot0.loadedCVBankName then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 219-221, warpins: 1 ---
				function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-50, warpins: 1 ---
					if uv0._currentVoice then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 5-10, warpins: 1 ---
						uv0._currentVoice:Stop(true)
						--- END OF BLOCK #0 ---



					end

					slot0 = nil

					function slot1()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-18, warpins: 1 ---
						uv0._currentVoice, uv1 = playSoundEffect(uv2)

						if uv1 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 10-15, warpins: 1 ---
							uv3 = long2int(uv1.length) * 0.001
							--- END OF BLOCK #0 ---



						end

						uv4()

						return
						--- END OF BLOCK #0 ---



					end

					if uv0._delayVoiceTweenID then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 17-24, warpins: 1 ---
						LeanTween.cancel(uv0._delayVoiceTweenID)

						uv0._delayVoiceTweenID = nil
						--- END OF BLOCK #0 ---



					end

					if uv0.live2dChar and uv4 and uv4 ~= 0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 35-46, warpins: 1 ---
						uv0._delayVoiceTweenID = LeanTween.delayedCall(uv4, System.Action(function ()

							-- Decompilation error in this vicinity:
							--- BLOCK #0 1-6, warpins: 1 ---
							uv0()

							uv1._delayVoiceTweenID = nil

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

					return
					--- END OF BLOCK #0 ---



				end()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 222-236, warpins: 1 ---
				pg.CriMgr:LoadCV(Ship.getCVKeyID(slot0.flagShip.skinId), function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-42, warpins: 1 ---
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

					uv0.loadingKey = nil

					if uv0.exited then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 28-33, warpins: 1 ---
						pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(uv1))
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 34-39, warpins: 1 ---
						uv2()

						if uv0._currentVoice then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 40-41, warpins: 1 ---
							uv0.loadedCVBankName = slot0
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					return
					--- END OF BLOCK #0 ---



				end)

				slot0.loadingKey = Ship.getCVKeyID(slot0.flagShip.skinId)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



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

	removeOnButton(slot0._chat)
	onButton(slot0, slot0._chat, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-33, warpins: 1 ---
		if uv0 == "mission_complete" or uv0 == "mission" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-13, warpins: 2 ---
			uv1:emit(MainUIMediator.OPEN_TASK)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-16, warpins: 1 ---
			if uv0 == "collection" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-23, warpins: 1 ---
				uv1:emit(MainUIMediator.OPEN_EVENT)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-26, warpins: 1 ---
				if uv0 == "event_complete" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 27-32, warpins: 1 ---
					uv1:emit(LevelMediator2.ON_OPEN_EVENT_SCENE)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_MAIN)

	return
	--- END OF BLOCK #0 ---



end

function slot0.stopCurVoice(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	if slot0.loadingKey then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		pg.CriMgr.UnloadCVBank(pg.CriMgr.GetCVBankName(slot0.loadingKey))
		--- END OF BLOCK #0 ---



	end

	if slot0._currentVoice then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-21, warpins: 1 ---
		slot0._currentVoice:Stop(true)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.startChatTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-31, warpins: 1 ---
	if slot0.chatFlag or slot0.exited then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	if slot0.chatTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-16, warpins: 1 ---
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
		--- END OF BLOCK #0 ---



	end

	slot0.chatTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-114, warpins: 1 ---
		uv0:paintClimax(uv1.CHAT_HEIGHT, uv1.CHAT_DURATION)

		if uv0.hasFinishedEvent and uv0.lastChatEvent ~= "event_complete" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-23, warpins: 1 ---
			table.insert({}, "event_complete")
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-60, warpins: 2 ---
			if go(uv0._taskBtn:Find("tip")).activeSelf and uv0.lastChatEvent ~= "mission_complete" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-43, warpins: 1 ---
				table.insert(slot0, "mission_complete")
				--- END OF BLOCK #0 ---



			end

			if uv0._attachmentCount > 0 and uv0.lastChatEvent ~= "mail" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-57, warpins: 1 ---
				table.insert(slot0, "mail")
				--- END OF BLOCK #0 ---



			end

			if #slot0 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 61-75, warpins: 1 ---
				if uv0._taskNotFinishCount and uv0._taskNotFinishCount > 0 and uv0.lastChatEvent ~= "mission" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 85-89, warpins: 1 ---
					table.insert(uv2.filterAssistantEvents(Clone(uv2.IdleEvents), uv0.flagShip.skinId), "mission")
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		uv0.chatTimer:Stop()

		uv0.chatTimer = nil
		uv0.lastChatEvent = slot0[math.ceil(math.random(#slot0))]

		uv0:AssistantEventEffect(uv0.lastChatEvent)

		return
		--- END OF BLOCK #0 ---



	end, uv0.CHAT_INTERVAL, 1)

	slot0.chatTimer:Start()

	return
	--- END OF BLOCK #0 ---



end

function slot0.initShipChat(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-60, warpins: 1 ---
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

	return
	--- END OF BLOCK #0 ---



end

function slot0.ShowAssistInfo(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-78, warpins: 1 ---
	slot3 = findTF(slot0._paintingTF, "live2d")
	slot4 = getProxy(SettingsProxy)

	if slot0.live2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-16, warpins: 1 ---
		slot0.live2dChar:Dispose()

		slot0.live2dChar = nil
		--- END OF BLOCK #0 ---



	end

	if not PathMgr.FileExists(PathMgr.getAssetBundle("live2d/" .. slot1)) or not slot4:IsLive2dEnable() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-46, warpins: 2 ---
		SetActive(slot3, false)
		setPaintingPrefabAsync(slot0._paintingTF, slot1, "mainNormal", function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-35, warpins: 1 ---
			if uv0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			if not findTF(findTF(uv0._paintingTF, "fitter"):GetChild(0), "Touch") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 20-20, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			setActive(slot0, true)
			eachChild(slot0, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				onButton(uv0, slot0, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-33, warpins: 1 ---
					if uv0._currentState == uv1.STATE_ALL_HIDE then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 7-13, warpins: 1 ---
						uv0:switchForm(uv1.STATE_MAIN)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 14-32, warpins: 1 ---
						uv0:AssistantEventEffect(uv2.getPaintingTouchEvents(uv3.name))
						uv0:paintClimax(uv1.TOUCH_HEIGHT, uv1.TOUCH_DURATION, uv1.TOUCH_LOOP)
						--- END OF BLOCK #0 ---



					end

					return
					--- END OF BLOCK #0 ---



				end)

				return
				--- END OF BLOCK #0 ---



			end)
			uv0:initShipChat()

			return
			--- END OF BLOCK #0 ---



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
			uv0:initShipChat()

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.AssistantEventEffect(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-78, warpins: 1 ---
	if not slot1 and slot0.live2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-17, warpins: 1 ---
		if not Input.mousePosition then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-10, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		slot1 = (slot0.live2dChar:GetTouchPart() <= 0 or uv0.filterAssistantEvents(uv0.getAssistantTouchEvents(slot3), slot0.flagShip.skinId)[math.ceil(math.random(#uv0.filterAssistantEvents(uv0.getAssistantTouchEvents(slot3), slot0.flagShip.skinId)))]) and uv0.filterAssistantEvents(uv0.IdleEvents, slot0.flagShip.skinId)[math.floor(math.Random(0, #uv0.filterAssistantEvents(uv0.IdleEvents, slot0.flagShip.skinId))) + 1]
		--- END OF BLOCK #0 ---



	end

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 55-55, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	if slot0.live2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-66, warpins: 1 ---
		slot0.live2dChar:TriggerAction(uv0.assistantEvents[slot1].action)
		--- END OF BLOCK #0 ---



	end

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

	return
	--- END OF BLOCK #0 ---



end

function slot0.tweenBG(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	LeanTween.moveX(rtf(slot0._bg), slot1, uv0.EJECT_DURATION):setEase(LeanTweenType.easeInOutExpo)

	return
	--- END OF BLOCK #0 ---



end

function slot0.ejectGimmick(slot0, slot1, slot2, slot3, slot4, slot5, slot6)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-70, warpins: 1 ---
	LeanTween.cancel(slot1.gameObject)
	SetActive(slot1, true)

	slot7 = GetOrAddComponent(slot1, "CanvasGroup")

	if not slot0.leans then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-17, warpins: 1 ---
		slot0.leans = {}
		--- END OF BLOCK #0 ---



	end

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-48, warpins: 2 ---
		table.insert(slot0.leans, slot1)
		slot0:generateGimmickLean(slot1, slot2, slot3).setOnComplete(slot8, System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			uv0.blocksRaycasts = true

			if uv1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-8, warpins: 1 ---
				uv1()
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)):setEase(LeanTweenType.easeInOutExpo):setDelay(slot5 or 0)
		--- END OF BLOCK #0 ---



	end

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 68-68, warpins: 2 ---
		slot7.alpha = slot6[1]

		LeanTween.alphaCanvas(slot7, slot6[2], slot3):setFrom(slot6[1]):setDelay(slot5 or 0)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.concealGimmick(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 30-32, warpins: 2 ---
	GetOrAddComponent(slot1, "CanvasGroup").blocksRaycasts = false

	slot0:generateGimmickLean(slot1, slot2, duration).setOnComplete(slot4, System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		SetActive(uv0, false)

		return
		--- END OF BLOCK #0 ---



	end)):setEase(LeanTweenType.easeInOutExpo):setDelay(slot3 or 0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.generateGimmickLean(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 5-152, warpins: 2 ---
	slot5 = nil

	if slot2 == uv0.DIRECTION_RIGHT then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-24, warpins: 1 ---
		slot5 = LeanTween.moveX(rtf(slot1), slot1:GetComponent("RectTransform").rect.width, slot3 or uv0.EJECT_DURATION)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-28, warpins: 1 ---
		if slot2 == uv0.DIRECTION_LEFT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-39, warpins: 1 ---
			slot5 = LeanTween.moveX(rtf(slot1), slot4.width * -1, slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-43, warpins: 1 ---
			if slot2 == uv0.DIRECTION_UP then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-53, warpins: 1 ---
				slot5 = LeanTween.moveY(rtf(slot1), slot4.height, slot3)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 54-57, warpins: 1 ---
				if slot2 == uv0.DIRECTION_DOWN then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 58-68, warpins: 1 ---
					slot5 = LeanTween.moveY(rtf(slot1), slot4.height * -1, slot3)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 69-72, warpins: 1 ---
					if slot2 == uv0.DIRECTION_DOWN_RIGHT then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 73-87, warpins: 1 ---
						slot5 = LeanTween.moveY(rtf(slot1), Vector3(slot4.width, slot4.height * -1, 0), slot3)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 88-91, warpins: 1 ---
						if slot2 == uv0.DIRECTION_UP_LEFT then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 92-106, warpins: 1 ---
							slot5 = LeanTween.move(rtf(slot1), Vector3(slot4.width * -1, slot4.height, 0), slot3)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 107-110, warpins: 1 ---
							if slot2 == uv0.REVERT_VERTICAL then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 111-120, warpins: 1 ---
								slot5 = LeanTween.moveY(rtf(slot1), 0, slot3)
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 121-124, warpins: 1 ---
								if slot2 == uv0.REVERT_HERIZONTAL then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 125-134, warpins: 1 ---
									slot5 = LeanTween.moveX(rtf(slot1), 0, slot3)
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 135-138, warpins: 1 ---
									if slot2 == uv0.REVERT_HERIZONTAL_VERTICAL then

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

	return slot5
	--- END OF BLOCK #0 ---



end

function slot0.updatePlayerInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot0._player = slot1

	slot0._resPanel:setResources(slot1)
	slot0:setProfileInfo(slot1, slot0.ships)

	return
	--- END OF BLOCK #0 ---



end

function slot0.setProfileInfo(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-41, warpins: 1 ---
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

	slot0:loadChar(slot2[slot1.character]:getPainting())

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateBuffList(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot2 = UIItemList.New(slot0._buffList, slot0._buffTpl)

	slot2:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-22, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-21, warpins: 1 ---
			LoadImageSpriteAsync(uv0[slot1 + 1].getConfig(slot3, "icon"), slot2)
			onButton(uv1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-42, warpins: 1 ---
				if uv0._buffTextTimer then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-9, warpins: 1 ---
					uv0._buffTextTimer:Stop()
					--- END OF BLOCK #0 ---



				end

				setActive(uv0._buffText, true)
				setText(uv0._buffText:Find("Text"), uv1:getConfig("desc"))

				uv0._buffTextTimer = Timer.New(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-6, warpins: 1 ---
					setActive(uv0._buffText, false)

					return
					--- END OF BLOCK #0 ---



				end, uv2.BUFFTEXT_SHOW_TIME, 1)

				uv0._buffTextTimer:Start()

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot2:align(#slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateFlagShip(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-161, warpins: 1 ---
	if not slot0.live2dChar and slot0.flagShip then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		retPaintingPrefab(slot0._paintingTF, slot0.flagShip:getPainting())
		--- END OF BLOCK #0 ---



	end

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

	setActive(slot0.effectTF, slot4 ~= nil)

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 120-131, warpins: 1 ---
		PoolMgr.GetInstance():GetPrefab("Effect/" .. slot4, slot4, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-24, warpins: 1 ---
			if not uv0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-23, warpins: 1 ---
				uv0._paintingFX = {
					name = uv1,
					obj = slot0
				}

				slot0.transform:SetParent(uv0.effectTF, true)

				slot0.transform.localPosition = Vector3.zero
				slot0.transform.localScale = Vector3.one
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	if slot0.flagShip then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 135-150, warpins: 1 ---
		if slot0.flagShip:getShipBgPrint() ~= slot0.flagShip:rarity2bgPrintForGet() and getProxy(SettingsProxy):IsBGEnable() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 153-159, warpins: 1 ---
			GetSpriteFromAtlasAsync("bg/star_level_bg_" .. slot7, "", function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-24, warpins: 1 ---
				if not uv0.exited then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-23, warpins: 1 ---
					uv0.defaultBgSprite = getImageSprite(uv0._bg:Find("bg"))

					setImageSprite(uv0._bg:Find("bg"), slot0)
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.setFlagShip(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0.tempFlagShip = slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateTaskNotices(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 13-15, warpins: 2 ---
	SetActive(slot0._taskBtn:Find("tip"), slot1 > 0)

	slot0._taskNotFinishCount = slot2

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateLessonNotices(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0.schoolTip = defaultValue(slot1, true)

	slot0:updateLiveBtn()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateBackYardNotices(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.backyardTip = slot1

	slot0:updateLiveBtn()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateCommanderNotices(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0.commanderTip = slot1

	slot0:updateLiveBtn()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateNotification(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 14-15, warpins: 2 ---
	SetActive(slot0:findTF("tip", slot0._chatBtn), slot1 > 0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.friendNotification(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	SetActive(slot0:findTF("tip", slot0._friendBtn), slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateBuildNotices(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 13-14, warpins: 2 ---
	SetActive(slot0:findTF("tip", slot0._buildBtn), slot1 > 0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateLiveBtn(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 14-15, warpins: 3 ---
	SetActive(slot0:findTF("tip", slot0._liveBtn), slot0.backyardTip or slot0.schoolTip or slot0.commanderTip)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateCollectNotices(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot0.hasCollectCanGetRes = slot1

	SetActive(findTF(slot0._collectionBtn, "tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateGuildNotices(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	setActive(findTF(slot0._guildButton, "tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateMailAttachmentCount(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-62, warpins: 1 ---
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

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateEvent(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0.hasFinishedEvent = slot1:hasFinishState()

	setActive(slot0._combatBtn:Find("tip"), slot0.hasFinishedEvent)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateCommissionNotices(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0._commissionTip, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateSeverNotices(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0._noticeBtn:Find("tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateSettingsNotice(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0._settingBtn:Find("tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.notifyTechnology(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0._technologyBtn:Find("tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.notifyActivitySummary(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 14-29, warpins: 2 ---
	setActive(slot0._activitySummaryBtn:Find("tip/Text").parent, slot1 > 0)

	if slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-21, warpins: 1 ---
		setText(slot3, slot1)
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot0._activitySummaryBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-23, warpins: 2 ---
		uv0:emit(MainUIMediator.GO_SCENE, {
			SCENE.ACTIVITY,
			{
				id = uv1 and uv1.id or ActivityConst.DEFAULT_JUMP_ID
			}
		})

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateAttireBtn(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0._commanderInfoBtn:Find("tip"), slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateChat(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-130, warpins: 1 ---
	if slot0.exited then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	if slot0.hideChatFlag and slot0.hideChatFlag == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	for slot6 = slot0._chatList.childCount, #slot1 - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-23, warpins: 2 ---
		cloneTplTo(slot0._chatItem, slot0._chatList)
		--- END OF BLOCK #0 ---



	end

	for slot6 = 0, slot0._chatList.childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 44-45, warpins: 2 ---
		slot0._chatList:GetChild(slot6).gameObject:SetActive(slot6 < #slot1)
		--- END OF BLOCK #0 ---



	end

	for slot6, slot7 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-129, warpins: 1 ---
		slot0:findTF("channel", slot8):GetComponent("Image").sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(slot7.type) .. "_1920", true)

		if slot7.type == ChatConst.ChannelPublic then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 89-96, warpins: 1 ---
			slot0:findTF("text", slot0._chatList:GetChild(slot6 - 1)):GetComponent("RichText").supportRichText = true

			ChatProxy.InjectPublic(slot0.findTF("text", slot0._chatList.GetChild(slot6 - 1)).GetComponent("RichText"), slot7)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 103-127, warpins: 2 ---
			slot10.supportRichText = slot7.emojiId ~= nil
			slot11 = false

			if not slot7.emojiId then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 113-119, warpins: 1 ---
				slot11, slot12 = contentWrap(slot7.player.name .. ": " .. slot7.content, 40, 1.65)
				--- END OF BLOCK #0 ---



			end

			slot10.text = slot12 .. (slot11 and "..." or "")
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.clearChat(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	childCount = slot0._chatList.childCount

	for slot5 = 0, childCount - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-19, warpins: 2 ---
		slot0._chatList:GetChild(slot5).gameObject:SetActive(false)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateBanner(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-110, warpins: 1 ---
	slot2 = slot0:findTF("eventPanel/mask/event", slot0._rightPanel):GetComponent("HScrollSnap")

	slot2:Init()

	slot3 = slot0:findTF("content", slot2)

	setActive(slot4, false)
	setActive(slot6, false)

	for slot10 = 0, #slot1 - 1, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-103, warpins: 2 ---
		cloneTplTo(slot6, slot0:findTF("eventPanel/dots", slot0._rightPanel))

		slot12 = Instantiate(slot4)

		LoadImageSpriteAsync("activitybanner/" .. slot1[slot10 + 1].pic, slot12)
		slot2:AddChild(slot12)
		onButton(slot0, slot12, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-75, warpins: 1 ---
			if uv0.type == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-10, warpins: 1 ---
				Application.OpenURL(uv0.param)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				if uv0.type == 2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-23, warpins: 1 ---
					uv1:emit(MainUIMediator.GO_SCENE, uv0.param)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-27, warpins: 1 ---
					if uv0.type == 3 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 28-38, warpins: 1 ---
						uv1:emit(MainUIMediator.OPEN_ACTIVITY_PANEL, tonumber(uv0.param))
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 39-42, warpins: 1 ---
						if uv0.type == 4 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 43-49, warpins: 1 ---
							uv1:emit(MainUIMediator.OPEN_SHOP_LAYER)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 50-53, warpins: 1 ---
							if uv0.type == 5 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 54-64, warpins: 1 ---
								uv1:emit(MainUIMediator.OPEN_SCROLL, tonumber(uv0.param))
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 65-68, warpins: 1 ---
								if uv0.type == 6 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 69-74, warpins: 1 ---
									uv1:emit(MainUIMediator.OPEN_TECHNOLOGY)
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

			return
			--- END OF BLOCK #0 ---



		end, SFX_MAIN)
		setActive(findTF(slot12, "red"), false)

		if slot1[slot10 + 1].type == 3 and tonumber(slot11.param) == nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 87-97, warpins: 1 ---
			setActive(slot13, getProxy(ActivityProxy):readyToAchieveByType(ActivityConst.ACTIVITY_TYPE_LEVELAWARD))
			--- END OF BLOCK #0 ---



		end

		slot12:SetActive(true)
		--- END OF BLOCK #0 ---



	end

	slot2.autoSnap = 5
	slot0.bannerSnap = slot2
	slot0.bannerContent = slot3
	slot0.bannerDots = slot5

	return
	--- END OF BLOCK #0 ---



end

function slot0.activeEffect(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	setActive(slot0._paintingTF, slot1)
	setActive(slot0._linkBtns, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.resetCommissionBtn(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	LeanTween.moveX(slot0._commissionBtn, 0, 0.2)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateExSkinBtn(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 10-52, warpins: 2 ---
	setActive(slot0.exSkinBtn, #slot1 > 0)

	if #slot1 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-20, warpins: 1 ---
		onButton(slot0, slot0.exSkinBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			uv0:showExSkinWindow(uv1)

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		--- END OF BLOCK #0 ---



	end

	slot0._buffList.localPosition = Vector3(#slot1 > 0 and 390 or 285, slot0._buffList.localPosition.y, slot0._buffList.localPosition.z)
	slot0._buffText.localPosition = Vector3(#slot1 > 0 and 339 or 234, -90, slot0._buffList.localPosition.z)

	return
	--- END OF BLOCK #0 ---



end

function slot0.showExSkinWindow(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-50, warpins: 1 ---
		setActive(slot0, true)

		slot1 = UIItemList.New(slot0:Find("window/list/content"), slot0:Find("window/list/content/tpl"))

		slot1:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-68, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-66, warpins: 1 ---
				setText(slot2:Find("name/Text"), uv0[slot1 + 1]:getConfig("name"))

				if uv1.skinTimers[uv0[slot1 + 1].id] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-30, warpins: 1 ---
					uv1.skinTimers[slot3.id]:Stop()
					--- END OF BLOCK #0 ---



				end

				uv1.skinTimers[slot3.id] = Timer.New(function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-15, warpins: 1 ---
					setText(uv1:Find("time/Text"), skinTimeStamp(uv0:getRemainTime()))

					return
					--- END OF BLOCK #0 ---



				end, 1, -1)

				uv1.skinTimers[slot3.id]:Start()
				uv1.skinTimers[slot3.id].func()

				slot4 = slot2:Find("icon_bg/icon")

				LoadSpriteAsync("qicon/" .. slot3:getIcon(), function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-15, warpins: 1 ---
					if not IsNil(uv0._tf) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 7-14, warpins: 1 ---
						uv1:GetComponent(typeof(Image)).sprite = slot0
						--- END OF BLOCK #0 ---



					end

					return
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		slot1:align(#uv0)
		onButton(uv1, slot0:Find("window/top/btnBack"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(uv0, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(uv1, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(uv0, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(uv1, slot0:Find("window/button_container/confirm_btn"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(uv0, false)

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
			--- BLOCK #0 1-17, warpins: 1 ---
			if uv0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			setParent(slot0, uv0.toTopPanel)
			uv1(slot0.transform)

			slot0.name = SkinShopScene.EXSKINNAME

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-23, warpins: 1 ---
		slot2(slot3)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.showOverDueExSkins(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-50, warpins: 1 ---
		setActive(slot0, true)

		slot1 = UIItemList.New(slot0:Find("window/list/scrollrect/content"), slot0:Find("window/list/scrollrect/content/tpl"))

		slot1:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-31, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-30, warpins: 1 ---
				setText(slot2:Find("name/Text"), uv0[slot1 + 1].getConfig(slot3, "name"))

				slot4 = slot2:Find("icon_bg/icon")

				LoadSpriteAsync("qicon/" .. uv0[slot1 + 1]:getIcon(), function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-15, warpins: 1 ---
					if not IsNil(uv0._tf) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 7-14, warpins: 1 ---
						uv1:GetComponent(typeof(Image)).sprite = slot0
						--- END OF BLOCK #0 ---



					end

					return
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		slot1:align(#uv0)
		onButton(uv1, slot0:Find("window/button_container/confirm_btn"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(uv0, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(uv1, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(uv0, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(uv1, slot0:Find("window/top/btnBack"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(uv0, false)

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
			--- BLOCK #0 1-17, warpins: 1 ---
			if uv0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			setParent(slot0, uv0.toTopPanel)
			uv1(slot0.transform)

			slot0.name = SkinShopScene.OVERDUENAME

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-23, warpins: 1 ---
		slot2(slot3)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.resumePaitingState(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).blocksRaycasts = true
	GetOrAddComponent(slot0._paintingTF, typeof(CanvasGroup)).alpha = 1

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-223, warpins: 1 ---
	slot0:disablePartialBlur()

	if slot0.leans then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-20, warpins: 1 ---
		for slot4, slot5 in ipairs(slot0.leans) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-18, warpins: 1 ---
			LeanTween.cancel(go(slot5))
			--- END OF BLOCK #0 ---



		end

		slot0.leans = {}
		--- END OF BLOCK #0 ---



	end

	LeanTween.cancel(go(slot0._paintingTF))
	slot0:resumePaitingState()
	LeanTween.cancel(slot0._chat.gameObject)

	if slot0._delayVoiceTweenID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-43, warpins: 1 ---
		LeanTween.cancel(slot0._delayVoiceTweenID)

		slot0._delayVoiceTweenID = nil
		--- END OF BLOCK #0 ---



	end

	if slot0._delayL2dSeID then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-52, warpins: 1 ---
		LeanTween.cancel(slot0._delayL2dSeID)

		slot0._delayL2dSeID = nil
		--- END OF BLOCK #0 ---



	end

	if slot0._newBG then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-68, warpins: 1 ---
		LeanTween.cancel(go(slot0._newBG))
		Destroy(go(slot0._newBG))

		slot0._newBG = nil
		--- END OF BLOCK #0 ---



	end

	if slot0._paintingFX then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-88, warpins: 1 ---
		PoolMgr.GetInstance():ReturnPrefab("Effect/" .. slot1, slot0._paintingFX.name, slot0._paintingFX.obj)

		slot0._paintingFX = nil
		--- END OF BLOCK #0 ---



	end

	if slot0.chatTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 92-97, warpins: 1 ---
		slot0.chatTimer:Stop()

		slot0.chatTimer = nil
		--- END OF BLOCK #0 ---



	end

	pg.TimeMgr.GetInstance():RemoveTimer(slot0._timeSchedule)

	slot0._timeSchedule = nil

	if slot0._resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 111-116, warpins: 1 ---
		slot0._resPanel:exit()

		slot0._resPanel = nil
		--- END OF BLOCK #0 ---



	end

	if slot0.flagShip then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 120-126, warpins: 1 ---
		retPaintingPrefab(slot0._paintingTF, slot0.flagShip:getPainting())
		--- END OF BLOCK #0 ---



	end

	if slot0.live2dChar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 130-135, warpins: 1 ---
		slot0.live2dChar:Dispose()

		slot0.live2dChar = nil
		--- END OF BLOCK #0 ---



	end

	for slot4 = slot0.bannerContent.childCount - 1, 0, -1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 142-156, warpins: 2 ---
		clearImageSprite(slot0.bannerContent:GetChild(slot4))
		Destroy(slot0.bannerSnap:RemoveChild(slot4))
		--- END OF BLOCK #0 ---



	end

	removeAllChildren(slot0.bannerDots)

	if slot0._currentVoice then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 163-167, warpins: 1 ---
		slot0._currentVoice:Stop(true)
		--- END OF BLOCK #0 ---



	end

	slot0._currentVoice = nil

	if slot0.loadedCVBankName then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 173-179, warpins: 1 ---
		pg.CriMgr.UnloadCVBank(slot0.loadedCVBankName)

		slot0.loadedCVBankName = nil
		--- END OF BLOCK #0 ---



	end

	if slot0.defaultBgSprite then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 183-192, warpins: 1 ---
		setImageSprite(slot0._bg:Find("bg"), slot0.defaultBgSprite)

		slot0.defaultBgSprite = nil
		--- END OF BLOCK #0 ---



	end

	if slot0._buffTextTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 196-201, warpins: 1 ---
		slot0._buffTextTimer:Stop()

		slot0._buffTextTimer = nil
		--- END OF BLOCK #0 ---



	end

	if slot0.isOpenSecondary then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 205-208, warpins: 1 ---
		slot0:closeSecondaryPanel(false)
		--- END OF BLOCK #0 ---



	end

	for slot4, slot5 in pairs(slot0.skinTimers) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 213-217, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---



	end

	slot0.skinTimers = nil

	slot0:recycleSpineChar()

	return
	--- END OF BLOCK #0 ---



end

function slot0.sethideChatBtn(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 10-41, warpins: 3 ---
	setActive(slot0._chatActBtn, slot0.hideChatFlag and slot0.hideChatFlag == 1)
	setActive(slot0._chatActBtnDisable, not (slot0.hideChatFlag and slot0.hideChatFlag == 1))

	if slot0.hideChatFlag and slot0.hideChatFlag == 1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-22, warpins: 1 ---
		slot0:clearChat()
		--- END OF BLOCK #0 ---



	end

	slot0._chatBg:GetComponent(typeof(Button)).enabled = not slot1
	slot0._chatBtn:GetComponent(typeof(Button)).enabled = not slot1

	return
	--- END OF BLOCK #0 ---



end

function slot0.showOverDueAttire(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	function slot2(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-50, warpins: 1 ---
		setActive(slot0, true)

		slot1 = UIItemList.New(slot0:Find("window/sliders/scrollrect/content"), slot0:Find("window/sliders/scrollrect/content/tpl"))

		slot1:make(function (slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-21, warpins: 1 ---
			if slot0 == UIItemList.EventUpdate then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-20, warpins: 1 ---
				updateDrop(slot2, {
					count = 1,
					id = uv0[slot1 + 1].getConfig(slot3, "id"),
					type = uv0[slot1 + 1]:getDropType()
				})
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		slot1:align(#uv0)
		onButton(uv1, slot0:Find("window/confirm_btn"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(uv0, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(uv1, slot0, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(uv0, false)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(uv1, slot0:Find("window/top/btnBack"), function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			setActive(uv0, false)

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
			--- BLOCK #0 1-17, warpins: 1 ---
			if uv0.exited then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			setParent(slot0, uv0.toTopPanel)
			uv1(slot0.transform)

			slot0.name = AttireConst.OverDueWindowName

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-23, warpins: 1 ---
		slot2(slot3)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.loadChar(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	if not slot0.shipPrefab then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-21, warpins: 1 ---
		slot0.shipPrefab = slot1

		pg.UIMgr:GetInstance():LoadingOn()
		PoolMgr.GetInstance():GetSpineChar(slot1, true, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-43, warpins: 1 ---
			pg.UIMgr:GetInstance():LoadingOff()

			uv0.shipModel = slot0
			tf(slot0).localScale = Vector3(0.75, 0.75, 1)
			tf(slot0).localPosition = Vector3(0, -130, 0)

			setParent(slot0, uv0._icon)
			slot0:GetComponent("SpineAnimUI"):SetAction("normal", 0)

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.recycleSpineChar(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	if slot0.shipPrefab and slot0.shipModel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-18, warpins: 1 ---
		PoolMgr.GetInstance():ReturnSpineChar(slot0.shipPrefab, slot0.shipModel)

		slot0.shipPrefab = nil
		slot0.shipModel = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

return slot0
