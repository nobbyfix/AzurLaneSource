pg = pg or {}
pg.MsgboxMgr = singletonClass("MsgboxMgr")
pg.MsgboxMgr.BUTTON_BLUE = 1
pg.MsgboxMgr.BUTTON_GRAY = 2
pg.MsgboxMgr.BUTTON_RED = 3
pg.MsgboxMgr.BUTTON_MEDAL = 4
pg.MsgboxMgr.BUTTON_RETREAT = 5
pg.MsgboxMgr.BUTTON_PREPAGE = 6
pg.MsgboxMgr.BUTTON_NEXTPAGE = 7
pg.MsgboxMgr.TITLE_GET_ITEMS = "get_items"
pg.MsgboxMgr.TITLE_INFORMATION = "infomation"
pg.MsgboxMgr.TEXT_CANCEL = "text_cancel"
pg.MsgboxMgr.TEXT_CONFIRM = "text_confirm"
MSGBOX_TYPE_NORMAL = 1
MSGBOX_TYPE_INPUT = 2
MSGBOX_TYPE_SINGLE_ITEM = 3
MSGBOX_TYPE_EXCHANGE = 4
MSGBOX_TYPE_DROP_ITEM = 5
MSGBOX_TYPE_ITEM_BOX = 6
MSGBOX_TYPE_HELP = 7
pg.MsgboxMgr.enable = false

function pg.MsgboxMgr.Init(slot0, slot1)
	print("initializing msgbox manager...")
	PoolMgr.GetInstance():GetUI("MsgBox", true, function (slot0)
		uv0._go = slot0

		uv0._go:SetActive(false)

		uv0._tf = uv0._go.transform

		uv0._go.transform:SetParent(uv1.UIMgr:GetInstance().OverlayMain.transform, false)

		uv0._window = uv0._go.transform:Find("window")

		setActive(uv0._window, true)

		uv0._btnContainer = uv0._go.transform:Find("window/button_container")
		uv0._msgPanel = uv0._go.transform:Find("window/content")
		uv0._itemPanel = uv0._go.transform:Find("window/items")
		uv0.itemsText = uv0._go.transform:Find("window/items/Text"):GetComponent(typeof(Text))
		uv0._sigleItemPanel = uv0._go.transform:Find("window/single_item_panel")
		uv0._exchangeShipPanel = uv0._go.transform:Find("window/exchange_ship_panel")
		uv0._SingleItemshipTypeTF = findTF(uv0._sigleItemPanel, "ship_type")
		uv0._SingleItemshipTypeBgTF = findTF(uv0._sigleItemPanel, "ship_type_bg")
		uv0._itemListItemTpl = uv0._go.transform:Find("window/items/scrollview/item")
		uv0._itemListItemContainer = uv0._go.transform:Find("window/items/scrollview/list")
		uv0._top = uv0._tf:Find("window/top")
		uv0._titleList = uv0._top:Find("bg")
		uv0._closeBtn = uv0._top:Find("btnBack")
		uv0.contentText = uv0._go.transform:Find("window/content"):GetComponent("RichText")
		uv0._res = uv0._go.transform:Find("res")

		uv0.contentText:AddSprite("diamond", uv0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		uv0.contentText:AddSprite("gold", uv0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		uv0.contentText:AddSprite("oil", uv0._res:Find("oil"):GetComponent(typeof(Image)).sprite)

		uv0.singleItemIntro = uv0._tf:Find("window/single_item_panel/name_mode/intro_view/Viewport/intro")
		uv0.singleItemIntroTF = uv0.singleItemIntro:GetComponent("RichText")

		uv0.singleItemIntroTF:AddSprite("diamond", uv0._res:Find("diamond"):GetComponent(typeof(Image)).sprite)
		uv0.singleItemIntroTF:AddSprite("gold", uv0._res:Find("gold"):GetComponent(typeof(Image)).sprite)
		uv0.singleItemIntroTF:AddSprite("oil", uv0._res:Find("oil"):GetComponent(typeof(Image)).sprite)

		uv0._inputPanel = uv0._go.transform:Find("window/input_panel")
		uv0._inputTitle = uv0._inputPanel:Find("label"):GetComponent(typeof(Text))
		uv0._inputTF = uv0._inputPanel:Find("InputField")
		uv0._inputField = uv0._inputTF:GetComponent(typeof(InputField))
		uv0._placeholderTF = uv0._inputTF:Find("Placeholder"):GetComponent(typeof(Text))
		uv0._inputConfirmBtn = uv0._inputPanel:Find("btns/confirm_btn")
		uv0._inputCancelBtn = uv0._inputPanel:Find("btns/cancel_btn")
		uv0._textPics = uv0._go.transform:Find("text")
		uv0._helpPanel = uv0._go.transform:Find("window/help_panel")
		uv0._helpBgTF = uv0._go.transform:Find("bg_help")
		uv0._helpList = uv0._helpPanel.transform:Find("list")
		uv0._helpTpl = uv0._helpPanel.transform:Find("list/help_tpl")
		uv0._sliders = uv0._go.transform:Find("window/sliders")
		uv0._defaultSize = Vector2(930, 620)
		uv0._defaultHelpSize = Vector2(870, 480)
		uv0._defaultHelpPos = Vector2(0, -40)
		rtf(uv0._window).sizeDelta = uv0._defaultSize
		rtf(uv0._helpPanel).sizeDelta = uv0._defaultHelpSize
		uv0._discountInfo = uv0._sliders.transform:Find("discountInfo")
		uv0._discountDate = uv0._sliders.transform:Find("discountDate")
		uv0._discount = uv0._sliders.transform:Find("discountInfo/discount")
		uv0._strike = uv0._go.transform:Find("window/strike")
		uv0._scrollTxts = {}
		uv0._countSelect = uv0._sigleItemPanel:Find("count_select")
		uv0._pageUtil = PageUtil.New(uv0._countSelect:Find("value_bg/left"), uv0._countSelect:Find("value_bg/right"), uv0._countSelect:Find("max"), uv0._countSelect:Find("value_bg/value"))
		uv0._countDescTxt = uv0._countSelect:Find("desc_txt")
		uv0.stopRemindInitPos = uv0._tf:Find("window/stopRemind").anchoredPosition
		uv0.stopRemindToggle = uv0._tf:Find("window/stopRemind"):GetComponent(typeof(Toggle))
		uv0.stopRemindText = tf(uv0.stopRemindToggle.gameObject):Find("Label"):GetComponent(typeof(Text))

		onButton(nil, uv0._inputCancelBtn, function ()
			uv0:hide()
		end, SFX_CANCEL)
		onButton(nil, uv0._closeBtn, function ()
			uv0:hide()
		end, SFX_CANCEL)
		onButton(nil, uv0._inputConfirmBtn, function ()
			if uv0.settings.onYes then
				uv0.settings.onYes(uv0._inputField.text)
			end

			uv0:hide()
		end, SFX_CONFIRM)
		uv2()
	end)
end

function pg.MsgboxMgr.getMsgBoxOb(slot0)
	return slot0._go
end

function slot2(slot0, slot1)
	if slot0._go.activeSelf then
		slot0:Clear()
	end

	rtf(slot0._window).sizeDelta = slot0._defaultSize
	rtf(slot0._helpPanel).sizeDelta = slot0._defaultHelpSize

	setAnchoredPosition(slot0._window, {
		x = 0,
		y = 0
	})
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, true)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)

	slot0.contentText.alignment = slot0.settings.alignment or TextAnchor.MiddleCenter
	slot0.contentText.fontSize = slot0.settings.fontSize or 36
	slot0.contentText.text = slot0.settings.content or ""

	slot0:Loaded(slot1)
end

function slot3(slot0, slot1)
	uv0.DelegateInfo.New(slot0)

	slot0.settings = slot1

	setActive(slot0._btnContainer, false)
	setActive(slot0.stopRemindToggle, false)
	SetActive(slot0._go, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._helpPanel, false)
	setActive(slot0._inputPanel, true)
	SetActive(slot0._discountDate, false)
	SetActive(slot0._strike, false)
	SetActive(slot0._discountInfo, false)
	slot0._inputPanel:SetAsLastSibling()

	slot0._inputTitle.text = slot1.title or ""
	slot0._placeholderTF.text = slot1.placeholder or ""
	slot0._inputField.characterLimit = slot1.limit or 0

	setActive(slot0._inputCancelBtn, not slot1.onNo)
	slot0:updateButton(slot0._inputCancelBtn, slot1.noText or uv1.TEXT_CANCEL)
	slot0:updateButton(slot0._inputConfirmBtn, slot1.yesText or uv1.TEXT_CONFIRM)
	slot0._tf:SetAsLastSibling()
	onButton(slot0, slot0._closeBtn, function ()
		uv0:hide()
	end, SFX_CANCEL)
	slot0:Loaded(slot1)
end

function slot4(slot0, slot1)
	rtf(slot0._window).sizeDelta = slot0._defaultSize

	slot0:commonSetting(slot1)
	SetActive(slot0._exchangeShipPanel, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)
	setActive(slot0._tf:Find("window/exchange_ship_panel/line_mode"), false)
	setActive(slot0._tf:Find("window/exchange_ship_panel/name_mode"), false)
	setActive(findTF(slot0._exchangeShipPanel, "icon_bg/own"), false)
	updateDrop(slot0._tf:Find("window/exchange_ship_panel"), slot1.drop)
	setActive(slot0._tf:Find("window/exchange_ship_panel/name_mode"), true)
	SetActive(slot0._tf:Find("window/exchange_ship_panel/name_mode/intro_view/Viewport/intro"), slot1.drop.type == DROP_TYPE_SHIP or slot1.drop.type == DROP_TYPE_RESOURCE or slot1.drop.type == DROP_TYPE_ITEM or slot1.drop.type == DROP_TYPE_FURNITURE or slot1.drop.type == DROP_TYPE_STRATEGY or slot1.drop.type == DROP_TYPE_SKIN)
	setActive(slot0.singleItemIntro, slot0.settings.numUpdate == nil)
	setActive(slot0._countDescTxt, SetActive ~= nil)
	setText(slot0._tf:Find("window/exchange_ship_panel/name_mode/name"), HXSet.hxLan(slot1.name or slot1.drop.cfg.name or ""))
	setText(slot0._tf:Find("window/exchange_ship_panel/name_mode/name/name"), getText(slot0._tf:Find("window/exchange_ship_panel/name_mode/name")))
	setText(slot2, Ship.getWords(setText, "drop_descrip") or i18n("ship_drop_desc_default"))

	if slot1.intro then
		setText(slot2, slot1.intro)
	end

	if slot1.enabelYesBtn ~= nil then
		setButtonEnabled(slot6, slot1.enabelYesBtn)
		eachChild(slot0._btnContainer:GetChild(1), function (slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = uv0.enabelYesBtn and 1 or 0.3
		end)
	end

	if slot1.show_medal then
		slot0:createBtn({
			sibling = 0,
			hideEvent = true,
			text = slot1.show_medal.desc,
			btnType = uv1.BUTTON_MEDAL,
			sound = SFX_UI_BUILDING_EXCHANGE
		})
	end

	slot0:Loaded(slot1)
end

function slot5(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, true)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)
	removeAllChildren(slot0._itemListItemContainer)
	setActive(slot0.itemsText, slot1.content)

	slot0.itemsText.text = slot1.content or ""
	slot3 = slot0.settings.itemFunc

	for slot7, slot8 in ipairs(slot2) do
		updateDrop(slot9, slot8, {
			anonymous = slot8.anonymous,
			hideName = slot8.hideName
		})

		slot10 = findTF(slot9, "name")

		if not slot8.hideName or isActive(slot10) and slot8.hideName then
			slot12 = ScrollTxt.New(slot11, findTF(slot9, "name_mask/name"))

			setActive(slot10, false)
			setActive(slot11, true)
			slot12:setText(getText(slot10))
			table.insert(slot0._scrollTxts, slot12)
		end

		if not slot8.anonymous then
			onButton(slot0, slot9, function ()
				if uv0 then
					uv0(uv1)
				end
			end, SFX_UI_CLICK)
		end
	end

	slot0:Loaded(slot1)
end

function slot6(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)
	SetActive(slot0._SingleItemshipTypeTF, false)
	SetActive(slot0._SingleItemshipTypeBgTF, false)
	SetActive(findTF(slot0._sigleItemPanel, "line_mode"), false)
	SetActive(findTF(slot0._sigleItemPanel, "count_select"), false)
	SetActive(findTF(slot0._sigleItemPanel, "detail"), false)
	setText(slot6, "")
	SetActive(slot7, false)
	SetActive(findTF(slot0._sigleItemPanel, "name_mode/name").parent, true)
	SetActive(slot2, true)
	SetActive(slot5, true)
	setFrame(findTF(slot0._sigleItemPanel, "icon_bg/frame"), slot1.frame or 1)
	setText(slot2, slot1.name or "")
	setText(slot5, slot1.content or "")
	SetActive(findTF(slot0._sigleItemPanel, "icon_bg/icon").parent, slot1.sprite)

	if slot1.sprite then
		setImageSprite(slot3, slot1.sprite, false)
	end

	slot0:Loaded(slot1)
end

function slot7(slot0, slot1)
	rtf(slot0._window).sizeDelta = slot0._defaultSize

	slot0:commonSetting(slot1)
	SetActive(slot0._sigleItemPanel, true)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	setActive(slot0._inputPanel, false)
	setActive(slot0._tf:Find("window/single_item_panel/line_mode"), false)
	setActive(slot0._tf:Find("window/single_item_panel/name_mode"), false)
	setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), false)

	if slot1.drop then
		slot2, slot3 = GetOwnedpropCount(slot1.drop)

		setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), slot3 and slot1.showOwned)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/Text"), slot2)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/label"), i18n("word_own1"))
	end

	updateDrop(slot0._tf:Find("window/single_item_panel"), slot1.drop)

	if slot1.windowSize then
		rtf(slot0._window).sizeDelta = Vector2(slot1.windowSize.x or slot0._defaultSize.x, slot1.windowSize.y or slot0._defaultSize.y)
	end

	setActive(slot0._tf:Find("window/single_item_panel/name_mode"), true)

	slot2 = slot0._tf:Find("window/single_item_panel/name_mode/attrs")

	SetActive(slot0._tf:Find("window/single_item_panel/name_mode/intro_view/Viewport/intro"), slot1.drop.type == DROP_TYPE_SHIP or slot1.drop.type == DROP_TYPE_RESOURCE or slot1.drop.type == DROP_TYPE_ITEM or slot1.drop.type == DROP_TYPE_FURNITURE or slot1.drop.type == DROP_TYPE_STRATEGY or slot1.drop.type == DROP_TYPE_SKIN)
	setActive(slot0.singleItemIntro, slot0.settings.numUpdate == nil)
	setActive(slot0._countDescTxt, SetActive ~= nil)
	setText(slot0._tf:Find("window/single_item_panel/name_mode/name"), HXSet.hxLan(slot1.name or slot1.drop.cfg.name or ""))

	slot6 = -170

	if not go(slot0._SingleItemshipTypeTF).activeSelf then
		slot6 = -230
	end

	setActive(slot0._SingleItemshipTypeBgTF, slot7)

	slot5.localPosition = Vector2(slot6, slot5.localPosition.y)

	setActive(slot0._tf:Find("window/single_item_panel/detail"), slot1.drop.type == DROP_TYPE_ITEM and slot1.drop.cfg.type == 11)

	if slot1.drop.type == DROP_TYPE_ITEM and slot1.drop.cfg.type == 11 then
		slot8:GetComponent("RichText"):AddListener(function (slot0, slot1)
			uv3(uv2, {
				items = _.map(uv0.drop.cfg.display_icon, function (slot0)
					return {
						type = slot0[1],
						id = slot0[2]
					}
				end),
				content = i18n("equip_skin_detail_tip"),
				item2Row = true,
				hideNo = true,
				itemFunc = function (slot0)
					uv0(uv1, {
						drop = slot0,
						onYes = function ()
							uv0(uv1, uv2)
						end,
						onNo = function ()
							uv0(uv1, uv2)
						end
					})
				end,
				onYes = function ()
					uv0(uv1, uv2)
				end,
				onNo = ()["onYes"]
			})
		end)
	end

	if slot1.content and slot1.content ~= "" then
		slot0.singleItemIntroTF.text = slot1.content
	elseif slot1.drop.type == DROP_TYPE_RESOURCE then
		setText(slot3, slot1.drop.cfg.display)
	elseif slot1.drop.type == DROP_TYPE_ITEM then
		setText(slot3, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_FURNITURE then
		setText(slot3, slot1.drop.cfg.describe)
	elseif slot1.drop.type == DROP_TYPE_SHIP then
		setText(slot3, Ship.getWords(slot10, "drop_descrip") or i18n("ship_drop_desc_default"))
	elseif slot1.drop.type == DROP_TYPE_EQUIP then
		for slot13 = 1, 4, 1 do
			slot14 = slot2:GetChild(slot13 - 1)

			setActive(slot14:Find("opend"), slot15)
			setActive(slot14:Find("attrLockTpl"), not slot1.drop.cfg["attribute_" .. slot13])

			if slot1.drop.cfg["attribute_" .. slot13] then
				setText(slot14:Find("opend/type_name"), AttributeType.Type2Name(slot15))
				setText(slot14:Find("opend/value"), slot1.drop.cfg["value_" .. slot13])
			end
		end
	elseif slot1.drop.type == DROP_TYPE_STRATEGY then
		setText(slot3, slot1.drop.cfg.desc)
	elseif slot1.drop.type == DROP_TYPE_SKIN then
		setText(slot3, slot1.drop.cfg.desc)
	elseif slot1.drop.type == DROP_TYPE_EQUIPMENT_SKIN then
		setText(slot3, slot10 .. "\n\n" .. i18n("word_fit") .. ": " .. table.concat(_.map(slot1.drop.cfg.equip_type, function (slot0)
			return EquipType.Type2Name2(slot0)
		end), ","))
	elseif slot1.drop.type == DROP_TYPE_VITEM then
		setText(slot3, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_WORLD_ITEM then
		setText(slot3, HXSet.hxLan(slot1.drop.cfg.display))
	elseif slot1.drop.type == DROP_TYPE_ICON_FRAME then
		setText(slot3, slot1.drop.cfg.desc)
	elseif slot1.drop.type == DROP_TYPE_CHAT_FRAME then
		setText(slot3, slot1.drop.cfg.desc)
	end

	if slot1.intro then
		setText(slot3, slot1.intro)
	end

	if slot1.enabelYesBtn ~= nil then
		setButtonEnabled(slot10, slot1.enabelYesBtn)
		eachChild(slot0._btnContainer:GetChild(1), function (slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = uv0.enabelYesBtn and 1 or 0.3
		end)
	end

	if slot1.show_medal then
		slot0:createBtn({
			sibling = 0,
			hideEvent = true,
			text = slot1.show_medal.desc,
			btnType = uv3.BUTTON_MEDAL,
			sound = SFX_UI_BUILDING_EXCHANGE
		})
	end

	slot0:Loaded(slot1)
end

function slot8(slot0, slot1)
	slot1.hideNo = true
	slot1.hideYes = true

	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, false)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)
	setActive(slot0._sliders, false)
	setActive(findTF(slot0._helpPanel, "bg"), not slot1.helps.pageMode)
	setActive(slot0._helpBgTF, slot1.helps.pageMode)
	print(slot1.helps.helpSize)

	if slot1.helps.helpSize then
		rtf(slot0._helpPanel).sizeDelta = Vector2(slot1.helps.helpSize.x or slot0._defaultHelpSize.x, slot1.helps.helpSize.y or slot0._defaultHelpSize.y)
	end

	if slot1.helps.helpPos then
		setAnchoredPosition(slot0._helpPanel, {
			x = slot1.helps.helpPos.x or slot0._defaultHelpPos.x,
			y = slot1.helps.helpPos.y or slot0._defaultHelpPos.y
		})
	end

	if slot1.helps.windowSize then
		rtf(slot0._window).sizeDelta = Vector2(slot1.helps.windowSize.x or slot0._defaultSize.x, slot1.helps.windowSize.y or slot0._defaultSize.y)
	end

	if slot1.helps.windowPos then
		rtf(slot0._window).sizeDelta = Vector2(slot1.helps.windowSize.x or slot0._defaultSize.x, slot1.helps.windowSize.y or slot0._defaultSize.y)

		setAnchoredPosition(slot0._window, {
			x = slot1.helps.windowPos.x or 0,
			y = slot1.helps.windowPos.y or 0
		})
	else
		setAnchoredPosition(slot0._window, {
			x = 0,
			y = 0
		})
	end

	if slot1.helps.disableScroll then
		GetComponent(slot0._helpPanel, typeof(ScrollRect)).enabled = not slot1.helps.disableScroll

		setAnchoredPosition(findTF(slot0._helpPanel, "list"), {
			x = 0,
			y = 0
		})
		setActive(findTF(slot0._helpPanel, "Scrollbar"), false)
	end

	if slot1.helps.ImageMode then
		setActive(slot0._top, false)
		setActive(findTF(slot0._window, "bg"), false)
	end

	for slot6 = #slot0.settings.helps, slot0._helpList.childCount - 1, 1 do
		Destroy(slot0._helpList:GetChild(slot6))
	end

	for slot6 = slot0._helpList.childCount, #slot2 - 1, 1 do
		cloneTplTo(slot0._helpTpl, slot0._helpList)
	end

	for slot6, slot7 in ipairs(slot2) do
		setActive(slot8, true)
		setText(slot0._helpList:GetChild(slot6 - 1), slot7.info or "")
		setActive(setText, slot7.icon)
		setActive(findTF(slot8, "line"), slot7.line)

		if slot7.icon then
			slot10 = 1

			if slot1.helps.ImageMode then
				slot10 = 1.5
			end

			slot9.transform.localScale = Vector2(slot7.icon.scale or slot10, slot7.icon.scale or slot10)
			slot11 = slot7.icon.path

			setImageSprite(slot9:GetComponent(typeof(Image)), slot7.icon.scale or slot10, true)
			setAnchoredPosition(slot9, {
				x = slot7.icon.posX and slot7.icon.posX or -20,
				y = slot7.icon.posY and slot7.icon.posY or 0
			})
			setActive(slot9:Find("corner"), slot1.helps.pageMode)
		end
	end

	slot0.helpPage = slot1.helps.defaultpage or 1

	if slot1.helps.pageMode then
		slot0:switchHelpPage(slot0.helpPage)
	end

	slot0:Loaded(slot1)
	setActive(slot0._btnContainer, slot0._btnContainer.transform.childCount > 0)
end

function pg.MsgboxMgr.nextPage(slot0)
	slot0.helpPage = slot0.helpPage + 1

	if slot0.helpPage < 1 then
		slot0.helpPage = 1
	end

	if slot0._helpList.childCount < slot0.helpPage then
		slot0.helpPage = 1
	end

	slot0:switchHelpPage(slot0.helpPage)
end

function pg.MsgboxMgr.prePage(slot0)
	slot0.helpPage = slot0.helpPage - 1

	if slot0.helpPage < 1 then
		slot0.helpPage = slot0._helpList.childCount
	end

	if slot0._helpList.childCount < slot0.helpPage then
		slot0.helpPage = slot0._helpList.childCount
	end

	slot0:switchHelpPage(slot0.helpPage)
end

function pg.MsgboxMgr.switchHelpPage(slot0, slot1)
	for slot5 = 1, slot0._helpList.childCount, 1 do
		setActive(slot0._helpList:GetChild(slot5 - 1), slot1 == slot5)
		setText(slot6:Find("icon/corner/Text"), slot5)
	end
end

function pg.MsgboxMgr.commonSetting(slot0, slot1)
	uv0.DelegateInfo.New(slot0)
	setActive(slot0._exchangeShipPanel, false)
	setActive(slot0._helpBgTF, false)
	setActive(slot0._btnContainer, true)

	slot0.stopRemindToggle.isOn = false

	setActive(go(slot0.stopRemindToggle), slot1.showStopRemind)

	tf(go(slot0.stopRemindToggle)).anchoredPosition = slot1.showStopRamindPos or slot0.stopRemindInitPos
	slot0.stopRemindText.text = slot1.stopRamindContent or i18n("dont_remind_today")

	removeAllChildren(slot0._btnContainer)

	slot0.settings = slot1

	slot0._go.transform:SetAsLastSibling()
	SetActive(slot0._go, true)

	slot3 = slot0.settings.numUpdate

	setActive(slot0._countSelect, slot0.settings.needCounter or false)
	slot0._pageUtil:setNumUpdate(function (slot0)
		if uv0 ~= nil then
			uv0(uv1._countDescTxt, slot0)
		end
	end)
	slot0._pageUtil:setAddNum(slot0.settings.addNum or 1)
	slot0._pageUtil:setMaxNum(slot0.settings.maxNum or -1)
	slot0._pageUtil:setDefaultNum(slot0.settings.defaultNum or 1)

	if slot0.settings.discount ~= nil then
		slot0._discount:GetComponent(typeof(Text)).text = slot0.settings.discount.discount .. "%OFF"
		slot0._discountDate:GetComponent(typeof(Text)).text = slot0.settings.discount.date

		SetActive(slot0._discountDate, true)
		SetActive(slot0._strike, true)
		SetActive(slot0._discountInfo, true)
	else
		SetActive(slot0._discountDate, false)
		SetActive(slot0._strike, false)
		SetActive(slot0._discountInfo, false)
	end

	slot7 = slot0.settings.hideNo or false
	slot8 = slot0.settings.hideYes or false
	slot10 = slot0.settings.onNo or function ()
	end

	if not (slot0.settings.modal or false) then
		onButton(slot0, slot0._go, function ()
			if uv0.settings.onClose then
				uv0.settings.onClose()
			else
				uv1()
			end

			uv0:hide()
		end, SFX_CANCEL)
	else
		removeOnButton(slot0._go)
	end

	if not slot7 then
		slot0:createBtn({
			text = slot0.settings.noText or uv1.TEXT_CANCEL,
			btnType = slot0.settings.noBtnType or uv1.BUTTON_GRAY,
			onCallback = slot10,
			sound = slot1.noSound or SFX_CANCEL
		})
	end

	if not slot8 then
		slot11 = {}

		slot0:createBtn({
			text = slot0.settings.yesText or uv1.TEXT_CONFIRM,
			btnType = slot0.settings.yesBtnType or uv1.BUTTON_BLUE,
			onCallback = slot0.settings.onYes or function ()
			end,
			sound = slot1.yesSound or SFX_CONFIRM
		})
	end

	slot11 = nil

	if slot0.settings.type == MSGBOX_TYPE_HELP and slot0.settings.helps.pageMode and #slot0.settings.helps > 1 then
		slot0:createBtn({
			noQuit = true,
			btnType = uv1.BUTTON_PREPAGE,
			onCallback = function ()
				uv0:prePage()
			end,
			sound = SFX_CANCEL
		})

		slot11 = #slot0.settings.helps
	end

	if slot0.settings.custom ~= nil then
		for slot15, slot16 in ipairs(slot0.settings.custom) do
			slot0:createBtn(slot16)
		end
	end

	if not slot11 then
		-- Nothing
	elseif slot11 > 1 then
		slot0:createBtn({
			noQuit = true,
			btnType = uv1.BUTTON_NEXTPAGE,
			onCallback = function ()
				uv0:nextPage()
			end,
			sound = SFX_CONFIRM
		})
	end

	setActive(slot0._closeBtn, not slot1.hideClose)
	onButton(slot0, slot0._closeBtn, function ()
		uv0:hide()

		if uv0.settings.onClose then
			slot0()
		else
			uv1()
		end
	end, SFX_CANCEL)

	slot12 = slot0.settings.title or uv1.TITLE_INFORMATION

	while 0 < slot0._titleList.transform.childCount do
		SetActive(slot0._titleList.transform:GetChild(slot13), slot0._titleList.transform:GetChild(slot13).name == slot12)

		slot13 = slot13 + 1
	end

	slot0._go.transform.localPosition = Vector3(slot0._go.transform.localPosition.x, slot0._go.transform.localPosition.y, slot0.settings.zIndex or -2)

	if slot0._helpPanel then
		setActive(slot0._helpPanel, slot0.settings.helps)
	end

	if slot0._sliders then
		setActive(slot0._sliders, true)
	end
end

function pg.MsgboxMgr.createBtn(slot0, slot1)
	slot2 = slot1.btnType or uv0.BUTTON_BLUE
	slot3 = slot1.onCallback or function ()
	end
	slot4 = slot1.noQuit

	if slot1.label then
		go(cloneTplTo(slot5, slot0._btnContainer)).name = slot1.label
	end

	SetActive(slot6, true)

	if slot1.scale then
		slot6.localScale = Vector2(slot1.scale.x or 1, slot1.scale.y or 1)
	end

	if slot2 ~= uv0.BUTTON_RETREAT and slot2 ~= uv0.BUTTON_PREPAGE and slot2 ~= uv0.BUTTON_NEXTPAGE then
		slot0:updateButton(slot6, slot1.text)
	end

	if not slot1.hideEvent then
		onButton(slot0, slot6, function ()
			if not uv0 then
				SetActive(uv1._go, false)
				uv1:Clear()
			end

			uv2()
		end, slot1.sound or SFX_CONFIRM)
	end

	if slot1.sibling then
		slot6:SetSiblingIndex(slot1.sibling)
	end
end

function pg.MsgboxMgr.updateButton(slot0, slot1, slot2)
	slot3 = slot1:Find("text")
	slot5 = nil

	if not IsNil(slot0._textPics:Find(slot2)) and not getImageSprite(slot6) and GetComponent(slot1:Find("pic"), typeof(Text)) and slot7.text ~= "" then
		slot5 = slot7
	end

	if slot5 then
		setActive(slot4, true)
		setActive(slot3, false)

		if not getImageSprite(slot4) and GetComponent(slot4, typeof(Text)) and slot7.text ~= "" then
			if i18n(slot2) == i18n_not_find(slot2) then
				slot8 = slot2
			end

			setText(slot7, slot8)
		end
	else
		setActive(slot4, false)
		setActive(slot3, true)

		if i18n(slot2) == i18n_not_find(slot2) then
			slot7 = slot2
		end

		setText(slot3, slot7)
	end
end

function pg.MsgboxMgr.Loaded(slot0, slot1)
	if slot1.parent then
		setParent(slot0._tf, slot1.parent)
	else
		uv0.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
			groupName = slot1.groupName,
			weight = slot1.weight,
			blurLevelCamera = slot1.blurLevelCamera
		})
	end

	uv0.m02:sendNotification(GAME.OPEN_MSGBOX_DONE)
end

function pg.MsgboxMgr.Clear(slot0)
	rtf(slot0._window).sizeDelta = slot0._defaultSize
	rtf(slot0._helpPanel).sizeDelta = slot0._defaultHelpSize

	setAnchoredPosition(slot0._window, {
		x = 0,
		y = 0
	})
	setAnchoredPosition(slot0._helpPanel, {
		x = slot0._defaultHelpPos.x,
		y = slot0._defaultHelpPos.y
	})

	GetComponent(slot0._helpPanel, typeof(ScrollRect)).enabled = true

	setActive(slot0._top, true)
	setActive(findTF(slot0._window, "bg"), true)
	setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), false)

	for slot5 = 0, slot0._helpList.childCount - 1, 1 do
		slot0._helpList:GetChild(slot5):Find("icon"):GetComponent(typeof(Image)).sprite = nil
	end

	for slot5 = #slot0._scrollTxts, 1, -1 do
		if slot0._scrollTxts[slot5] then
			slot0._scrollTxts[slot5]:destroy()
			table.remove(slot0._scrollTxts, slot5)
		end
	end

	uv0.DelegateInfo.Dispose(slot0)

	for slot6 = 1, slot0._btnContainer.childCount, 1 do
		Destroy(slot0._btnContainer:GetChild(0))
	end

	if slot0.settings and slot0.settings.parent then
		setParent(slot0._tf, uv0.UIMgr.GetInstance().OverlayMain, false)
	else
		uv0.UIMgr.GetInstance():UnblurPanel(slot0._tf, uv0.UIMgr.GetInstance().OverlayMain)
	end

	if slot0.contentText then
		slot0.contentText:RemoveAllListeners()
	end

	slot0.settings = nil
	slot0.enable = false
end

function pg.MsgboxMgr.ShowMsgBox(slot0, slot1)
	slot0.enable = true

	if (slot1.type or MSGBOX_TYPE_NORMAL) == MSGBOX_TYPE_NORMAL then
		uv0(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_INPUT then
		uv1(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_SINGLE_ITEM then
		uv2(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_EXCHANGE then
		uv3(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_DROP_ITEM then
		uv4(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_ITEM_BOX then
		uv5(slot0, slot1)
	elseif slot2 == MSGBOX_TYPE_HELP then
		uv6(slot0, slot1)
	end

	slot0._tf:SetAsLastSibling()
end

function pg.MsgboxMgr.hide(slot0)
	if not slot0.enable then
		return
	end

	slot0._go:SetActive(false)
	slot0:Clear()
	uv0.m02:sendNotification(GAME.CLOSE_MSGBOX_DONE)
end
