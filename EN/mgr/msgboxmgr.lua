pg = pg or {}
slot0 = pg
slot1 = singletonClass
slot2 = "MsgboxMgr"
slot1 = slot1(slot2)
slot0.MsgboxMgr = slot1
slot1 = slot0.MsgboxMgr
slot2 = 1
slot1.BUTTON_BLUE = slot2
slot2 = 2
slot1.BUTTON_GRAY = slot2
slot2 = 3
slot1.BUTTON_RED = slot2
slot2 = 4
slot1.BUTTON_MEDAL = slot2
slot2 = 5
slot1.BUTTON_RETREAT = slot2
slot2 = 6
slot1.BUTTON_PREPAGE = slot2
slot2 = 7
slot1.BUTTON_NEXTPAGE = slot2
slot2 = 8
slot1.BUTTON_BLUE_WITH_ICON = slot2
slot2 = "get_items"
slot1.TITLE_GET_ITEMS = slot2
slot2 = "infomation"
slot1.TITLE_INFORMATION = slot2
slot2 = "text_cancel"
slot1.TEXT_CANCEL = slot2
slot2 = "text_confirm"
slot1.TEXT_CONFIRM = slot2
slot2 = 1
MSGBOX_TYPE_NORMAL = slot2
slot2 = 2
MSGBOX_TYPE_INPUT = slot2
slot2 = 3
MSGBOX_TYPE_SINGLE_ITEM = slot2
slot2 = 4
MSGBOX_TYPE_EXCHANGE = slot2
slot2 = 5
MSGBOX_TYPE_DROP_ITEM = slot2
slot2 = 6
MSGBOX_TYPE_ITEM_BOX = slot2
slot2 = 7
MSGBOX_TYPE_HELP = slot2
slot2 = 8
MSGBOX_TYPE_SECONDPWD = slot2
slot2 = false
slot1.enable = slot2
slot2 = require
slot3 = "Mgr.const.MsgboxBtnNameMap"
slot2 = slot2(slot3)

function slot3(slot0, slot1)
	slot2 = print
	slot3 = "initializing msgbox manager..."

	slot2(slot3)

	slot2 = PoolMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.GetUI
	slot4 = "MsgBox"
	slot5 = true

	function slot6(slot0)
		slot1 = slot0
		slot1._go = slot0
		slot1 = slot0
		slot1 = slot1._go
		slot2 = slot1
		slot1 = slot1.SetActive
		slot3 = false

		slot1(slot2, slot3)

		slot1 = slot0
		slot2 = slot0
		slot2 = slot2._go
		slot2 = slot2.transform
		slot1._tf = slot2
		slot1 = slot1
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot1 = slot1.OverlayMain
		slot2 = slot0
		slot2 = slot2._go
		slot2 = slot2.transform
		slot3 = slot2
		slot2 = slot2.SetParent
		slot4 = slot1.transform
		slot5 = false

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window"
		slot3 = slot3(slot4, slot5)
		slot2._window = slot3
		slot2 = setActive
		slot3 = slot0
		slot3 = slot3._window
		slot4 = true

		slot2(slot3, slot4)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/button_container"
		slot3 = slot3(slot4, slot5)
		slot2._btnContainer = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/content"
		slot3 = slot3(slot4, slot5)
		slot2._msgPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/items"
		slot3 = slot3(slot4, slot5)
		slot2._itemPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/items/Text"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2.itemsText = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/single_item_panel"
		slot3 = slot3(slot4, slot5)
		slot2._sigleItemPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/exchange_ship_panel"
		slot3 = slot3(slot4, slot5)
		slot2._exchangeShipPanel = slot3
		slot2 = slot0
		slot3 = findTF
		slot4 = slot0
		slot4 = slot4._sigleItemPanel
		slot5 = "ship_type"
		slot3 = slot3(slot4, slot5)
		slot2._SingleItemshipTypeTF = slot3
		slot2 = slot0
		slot3 = findTF
		slot4 = slot0
		slot4 = slot4._sigleItemPanel
		slot5 = "ship_type_bg"
		slot3 = slot3(slot4, slot5)
		slot2._SingleItemshipTypeBgTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/items/scrollview/item"
		slot3 = slot3(slot4, slot5)
		slot2._itemListItemTpl = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/items/scrollview/list"
		slot3 = slot3(slot4, slot5)
		slot2._itemListItemContainer = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/top"
		slot3 = slot3(slot4, slot5)
		slot2._top = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._top
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "bg"
		slot3 = slot3(slot4, slot5)
		slot2._titleList = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._top
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "btnBack"
		slot3 = slot3(slot4, slot5)
		slot2._closeBtn = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/content"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = "RichText"
		slot3 = slot3(slot4, slot5)
		slot2.contentText = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "res"
		slot3 = slot3(slot4, slot5)
		slot2._res = slot3
		slot2 = slot0
		slot2 = slot2.contentText
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "diamond"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "diamond"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.contentText
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "gold"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "gold"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.contentText
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "oil"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "oil"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot3 = {}
		slot2.singleItemIntros = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/single_item_panel/name_mode/intro_view/Viewport/Content/intro"
		slot3 = slot3(slot4, slot5)
		slot2.singleItemIntro = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3.singleItemIntro
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = "RichText"
		slot3 = slot3(slot4, slot5)
		slot2.singleItemIntroTF = slot3
		slot2 = slot0
		slot2 = slot2.singleItemIntroTF
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "diamond"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "diamond"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.singleItemIntroTF
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "gold"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "gold"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = slot0
		slot2 = slot2.singleItemIntroTF
		slot3 = slot2
		slot2 = slot2.AddSprite
		slot4 = "oil"
		slot5 = slot0
		slot5 = slot5._res
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "oil"
		slot5 = slot5(slot6, slot7)
		slot6 = slot5
		slot5 = slot5.GetComponent
		slot7 = typeof
		slot8 = Image
		slot5 = slot5(slot6, slot7(slot8))
		slot5 = slot5.sprite

		slot2(slot3, slot4, slot5)

		slot2 = table
		slot2 = slot2.insert
		slot3 = slot0
		slot3 = slot3.singleItemIntros
		slot4 = slot0
		slot4 = slot4.singleItemIntro

		slot2(slot3, slot4)

		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/input_panel"
		slot3 = slot3(slot4, slot5)
		slot2._inputPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "label"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2._inputTitle = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "InputField"
		slot3 = slot3(slot4, slot5)
		slot2._inputTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputTF
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = InputField
		slot3 = slot3(slot4, slot5(slot6))
		slot2._inputField = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputTF
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "Placeholder"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2._placeholderTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "btns/confirm_btn"
		slot3 = slot3(slot4, slot5)
		slot2._inputConfirmBtn = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._inputPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "btns/cancel_btn"
		slot3 = slot3(slot4, slot5)
		slot2._inputCancelBtn = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "text"
		slot3 = slot3(slot4, slot5)
		slot2._textPics = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/help_panel"
		slot3 = slot3(slot4, slot5)
		slot2._helpPanel = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "bg_help"
		slot3 = slot3(slot4, slot5)
		slot2._helpBgTF = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._helpPanel
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "list"
		slot3 = slot3(slot4, slot5)
		slot2._helpList = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._helpPanel
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "list/help_tpl"
		slot3 = slot3(slot4, slot5)
		slot2._helpTpl = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/sliders"
		slot3 = slot3(slot4, slot5)
		slot2._sliders = slot3
		slot2 = slot0
		slot3 = Vector2
		slot4 = 930
		slot5 = 620
		slot3 = slot3(slot4, slot5)
		slot2._defaultSize = slot3
		slot2 = slot0
		slot3 = Vector2
		slot4 = 870
		slot5 = 480
		slot3 = slot3(slot4, slot5)
		slot2._defaultHelpSize = slot3
		slot2 = slot0
		slot3 = Vector2
		slot4 = 0
		slot5 = -40
		slot3 = slot3(slot4, slot5)
		slot2._defaultHelpPos = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "discountInfo"
		slot3 = slot3(slot4, slot5)
		slot2._discountInfo = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "discountDate"
		slot3 = slot3(slot4, slot5)
		slot2._discountDate = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sliders
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "discountInfo/discount"
		slot3 = slot3(slot4, slot5)
		slot2._discount = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._go
		slot3 = slot3.transform
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/strike"
		slot3 = slot3(slot4, slot5)
		slot2._strike = slot3
		slot2 = slot0
		slot3 = {}
		slot2._scrollTxts = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._sigleItemPanel
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "count_select"
		slot3 = slot3(slot4, slot5)
		slot2._countSelect = slot3
		slot2 = slot0
		slot3 = PageUtil
		slot3 = slot3.New
		slot4 = slot0
		slot4 = slot4._countSelect
		slot5 = slot4
		slot4 = slot4.Find
		slot6 = "value_bg/left"
		slot4 = slot4(slot5, slot6)
		slot5 = slot0
		slot5 = slot5._countSelect
		slot6 = slot5
		slot5 = slot5.Find
		slot7 = "value_bg/right"
		slot5 = slot5(slot6, slot7)
		slot6 = slot0
		slot6 = slot6._countSelect
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "max"
		slot6 = slot6(slot7, slot8)
		slot7 = slot0
		slot7 = slot7._countSelect
		slot8 = slot7
		slot7 = slot7.Find
		slot9 = "value_bg/value"
		slot3 = slot3(slot4, slot5, slot6, slot7(slot8, slot9))
		slot2._pageUtil = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._countSelect
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "desc_txt"
		slot3 = slot3(slot4, slot5)
		slot2._countDescTxt = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/stopRemind"
		slot3 = slot3(slot4, slot5)
		slot3 = slot3.anchoredPosition
		slot2.stopRemindInitPos = slot3
		slot2 = slot0
		slot3 = slot0
		slot3 = slot3._tf
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "window/stopRemind"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Toggle
		slot3 = slot3(slot4, slot5(slot6))
		slot2.stopRemindToggle = slot3
		slot2 = slot0
		slot3 = tf
		slot4 = slot0
		slot4 = slot4.stopRemindToggle
		slot4 = slot4.gameObject
		slot3 = slot3(slot4)
		slot4 = slot3
		slot3 = slot3.Find
		slot5 = "Label"
		slot3 = slot3(slot4, slot5)
		slot4 = slot3
		slot3 = slot3.GetComponent
		slot5 = typeof
		slot6 = Text
		slot3 = slot3(slot4, slot5(slot6))
		slot2.stopRemindText = slot3
		slot2 = onButton
		slot3 = nil
		slot4 = slot0
		slot4 = slot4._inputCancelBtn

		function slot5()
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)
		end

		slot6 = SFX_CANCEL

		slot2(slot3, slot4, slot5, slot6)

		slot2 = onButton
		slot3 = nil
		slot4 = slot0
		slot4 = slot4._closeBtn

		function slot5()
			slot0 = print
			slot1 = "点击1"

			slot0(slot1)

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)
		end

		slot6 = SFX_CANCEL

		slot2(slot3, slot4, slot5, slot6)

		slot2 = onButton
		slot3 = nil
		slot4 = slot0
		slot4 = slot4._inputConfirmBtn

		function slot5()
			slot0 = slot0
			slot0 = slot0.settings
			slot0 = slot0.onYes

			if slot0 then
				slot0 = slot0
				slot0 = slot0.settings
				slot0 = slot0.onYes
				slot1 = slot0
				slot1 = slot1._inputField
				slot1 = slot1.text

				slot0(slot1)
			end

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)
		end

		slot6 = SFX_CONFIRM

		slot2(slot3, slot4, slot5, slot6)

		slot2 = slot0
		slot3 = {}
		slot2.pools = slot3
		slot2 = slot0
		slot3 = {}
		slot2.timers = slot3
		slot2 = slot2

		slot2()
	end

	slot2(slot3, slot4, slot5, slot6)
end

slot1.Init = slot3

function slot3(slot0)
	slot1 = slot0._go

	return slot1
end

slot1.getMsgBoxOb = slot3

function slot3(slot0, slot1)
	slot2 = slot0._go
	slot2 = slot2.activeSelf

	if slot2 then
		slot3 = slot0
		slot2 = slot0.Clear

		slot2(slot3)
	end

	slot2 = rtf
	slot3 = slot0._window
	slot2 = slot2(slot3)
	slot3 = slot0._defaultSize
	slot2.sizeDelta = slot3
	slot2 = rtf
	slot3 = slot0._helpPanel
	slot2 = slot2(slot3)
	slot3 = slot0._defaultHelpSize
	slot2.sizeDelta = slot3
	slot2 = setAnchoredPosition
	slot3 = slot0._window
	slot4 = {
		x = 0,
		y = 0
	}

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot0.contentText
	slot3 = slot0.settings
	slot3 = slot3.alignment

	if not slot3 then
		slot3 = TextAnchor
		slot3 = slot3.MiddleCenter
	end

	slot2.alignment = slot3
	slot0.contentText.fontSize = slot0.settings.fontSize or 36
	slot0.contentText.text = slot0.settings.content or ""
	slot3 = slot0
	slot2 = slot0.Loaded
	slot4 = slot1

	slot2(slot3, slot4)
end

function slot4(slot0, slot1)
	slot0.enable = true

	slot0:commonSetting(slot1)
	slot0.DelegateInfo.New(slot0)

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
	slot2 = setActive
	slot3 = slot0._inputCancelBtn
	slot4 = slot1.onNo
	slot4 = not slot4

	slot2(slot3, slot4)

	slot3 = slot0
	slot2 = slot0.updateButton
	slot4 = slot0._inputCancelBtn
	slot5 = slot1.noText

	if not slot5 then
		slot5 = slot1
		slot5 = slot5.TEXT_CANCEL
	end

	slot2(slot3, slot4, slot5)

	slot3 = slot0
	slot2 = slot0.updateButton
	slot4 = slot0._inputConfirmBtn
	slot5 = slot1.yesText

	if not slot5 then
		slot5 = slot1
		slot5 = slot5.TEXT_CONFIRM
	end

	slot2(slot3, slot4, slot5)

	slot2 = slot0._tf
	slot3 = slot2
	slot2 = slot2.SetAsLastSibling

	slot2(slot3)

	slot2 = onButton
	slot3 = slot0
	slot4 = slot0._closeBtn

	function slot5()
		slot0 = print
		slot1 = "点击2"

		slot0(slot1)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hide

		slot0(slot1)
	end

	slot6 = SFX_CANCEL

	slot2(slot3, slot4, slot5, slot6)

	slot3 = slot0
	slot2 = slot0.Loaded
	slot4 = slot1

	slot2(slot3, slot4)
end

function slot5(slot0, slot1)
	slot2 = rtf
	slot3 = slot0._window
	slot2 = slot2(slot3)
	slot3 = slot0._defaultSize
	slot2.sizeDelta = slot3
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._exchangeShipPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/exchange_ship_panel/line_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/exchange_ship_panel/name_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._exchangeShipPanel
	slot5 = "icon_bg/own"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = updateDrop
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/exchange_ship_panel"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1.drop

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/exchange_ship_panel/name_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0._tf
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "window/exchange_ship_panel/name_mode/intro_view/Viewport/intro"
	slot2 = slot2(slot3, slot4)
	slot3 = SetActive
	slot4 = slot2
	slot5 = slot1.drop
	slot5 = slot5.type
	slot6 = DROP_TYPE_SHIP

	if slot5 ~= slot6 then
		slot5 = slot1.drop
		slot5 = slot5.type
		slot6 = DROP_TYPE_RESOURCE

		if slot5 ~= slot6 then
			slot5 = slot1.drop
			slot5 = slot5.type
			slot6 = DROP_TYPE_ITEM

			if slot5 ~= slot6 then
				slot5 = slot1.drop
				slot5 = slot5.type
				slot6 = DROP_TYPE_FURNITURE

				if slot5 ~= slot6 then
					slot5 = slot1.drop
					slot5 = slot5.type
					slot6 = DROP_TYPE_STRATEGY

					if slot5 ~= slot6 then
						slot3(slot4, slot1.drop.type == DROP_TYPE_SKIN)
						setActive(slot0.singleItemIntro, slot0.settings.numUpdate == nil)
						setActive(slot0._countDescTxt, slot0.settings.numUpdate ~= nil)

						slot4 = setText
						slot5 = slot0._tf
						slot6 = slot5
						slot5 = slot5.Find
						slot7 = "window/exchange_ship_panel/name_mode/name"
						slot5 = slot5(slot6, slot7)
						slot6 = HXSet
						slot6 = slot6.hxLan
						slot7 = slot1.name

						if not slot7 then
							slot4(slot5, slot6(slot1.drop.cfg.name or ""))
							setText(slot0._tf:Find("window/exchange_ship_panel/name_mode/name/name"), getText(slot0._tf:Find("window/exchange_ship_panel/name_mode/name")))
						end
					end
				end
			end
		end
	end

	slot5, slot6, slot7 = ShipWordHelper.GetWordAndCV(slot4, ShipWordHelper.WORD_TYPE_DROP, nil, PLATFORM_CODE ~= PLATFORM_US)
	slot8 = setText
	slot9 = slot2

	if not slot7 then
		slot10 = i18n
		slot11 = "ship_drop_desc_default"
		slot10 = slot10(slot11)
	end

	slot8(slot9, slot10)

	slot8 = slot1.intro

	if slot8 then
		slot8 = setText
		slot9 = slot2
		slot10 = slot1.intro

		slot8(slot9, slot10)
	end

	slot8 = slot1.enabelYesBtn

	if slot8 ~= nil then
		slot8 = slot0._btnContainer
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = 1
		slot8 = slot8(slot9, slot10)
		slot9 = setButtonEnabled
		slot10 = slot8
		slot11 = slot1.enabelYesBtn

		slot9(slot10, slot11)

		slot9 = eachChild
		slot10 = slot8

		function slot11(slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end

		slot9(slot10, slot11)
	end

	slot8 = slot1.show_medal

	if slot8 then
		slot9 = slot0
		slot8 = slot0.createBtn
		slot10 = {
			sibling = 0,
			hideEvent = true
		}
		slot11 = slot1.show_medal
		slot11 = slot11.desc
		slot10.text = slot11
		slot11 = slot1
		slot11 = slot11.BUTTON_MEDAL
		slot10.btnType = slot11
		slot11 = SFX_UI_BUILDING_EXCHANGE
		slot10.sound = slot11

		slot8(slot9, slot10)
	end

	slot9 = slot0
	slot8 = slot0.Loaded
	slot10 = slot1

	slot8(slot9, slot10)
end

function slot6(slot0, slot1)
	slot0:commonSetting(slot1)
	SetActive(slot0._itemPanel, true)
	SetActive(slot0._msgPanel, false)
	SetActive(slot0._sigleItemPanel, false)
	setActive(slot0._inputPanel, false)
	removeAllChildren(slot0._itemListItemContainer)
	setActive(slot0.itemsText, slot1.content)

	slot0.itemsText.text = slot1.content or ""
	slot2 = slot0.settings.items
	slot3 = slot0.settings.itemFunc
	slot4 = ipairs
	slot5 = slot2
	slot4, slot5, slot6 = slot4(slot5)

	for slot7, slot8 in slot4, slot5, slot6 do
		slot9 = cloneTplTo
		slot10 = slot0._itemListItemTpl
		slot11 = slot0._itemListItemContainer
		slot9 = slot9(slot10, slot11)
		slot10 = updateDrop
		slot11 = slot9
		slot12 = slot8
		slot13 = {}
		slot14 = slot8.anonymous
		slot13.anonymous = slot14
		slot14 = slot8.hideName
		slot13.hideName = slot14

		slot10(slot11, slot12, slot13)

		slot10 = findTF
		slot11 = slot9
		slot12 = "name"
		slot10 = slot10(slot11, slot12)
		slot11 = slot8.hideName

		if not slot11 then
			slot11 = findTF
			slot12 = slot9
			slot13 = "name_mask"
			slot11 = slot11(slot12, slot13)
			slot12 = setActive
			slot13 = slot10
			slot14 = false

			slot12(slot13, slot14)

			slot12 = setActive
			slot13 = slot11
			slot14 = true

			slot12(slot13, slot14)

			slot12 = ScrollTxt
			slot12 = slot12.New
			slot13 = slot11
			slot14 = findTF
			slot15 = slot9
			slot16 = "name_mask/name"
			slot12 = slot12(slot13, slot14(slot15, slot16))
			slot14 = slot12
			slot13 = slot12.setText
			slot15 = getText
			slot16 = slot10

			slot13(slot14, slot15(slot16))

			slot13 = table
			slot13 = slot13.insert
			slot14 = slot0._scrollTxts
			slot15 = slot12

			slot13(slot14, slot15)
		end

		slot11 = slot8.anonymous

		if not slot11 then
			slot11 = onButton
			slot12 = slot0
			slot13 = slot9

			function slot14()
				slot0 = slot0

				if slot0 then
					slot0 = slot0
					slot1 = slot1

					slot0(slot1)
				end
			end

			slot15 = SFX_UI_CLICK

			slot11(slot12, slot13, slot14, slot15)
		end
	end

	slot5 = slot0
	slot4 = slot0.Loaded
	slot6 = slot1

	slot4(slot5, slot6)
end

function slot7(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-86, warpins: 1 ---
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot0:commonSetting(slot1)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = true

	SetActive(slot0._sigleItemPanel, true)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	SetActive(slot0._itemPanel, false)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	SetActive(slot0._msgPanel, false)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	setActive(slot0._inputPanel, false)

	slot2 = SetActive
	slot3 = slot0._SingleItemshipTypeTF
	slot4 = false

	SetActive(slot0._SingleItemshipTypeTF, false)

	slot2 = SetActive
	slot3 = slot0._SingleItemshipTypeBgTF
	slot4 = false

	SetActive(slot0._SingleItemshipTypeBgTF, false)

	slot2 = SetActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "line_mode"
	slot3 = findTF(slot0._sigleItemPanel, "line_mode")
	slot4 = false

	SetActive(findTF(slot0._sigleItemPanel, "line_mode"), false)

	slot2 = SetActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "count_select"
	slot3 = findTF(slot0._sigleItemPanel, "count_select")
	slot4 = false

	SetActive(findTF(slot0._sigleItemPanel, "count_select"), false)

	slot2 = SetActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "detail"
	slot3 = findTF(slot0._sigleItemPanel, "detail")
	slot4 = false

	SetActive(findTF(slot0._sigleItemPanel, "detail"), false)

	slot2 = findTF
	slot3 = slot0._sigleItemPanel
	slot4 = "icon_bg/icon"
	slot2 = findTF(slot0._sigleItemPanel, "icon_bg/icon")
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "icon_bg/frame"
	slot3 = findTF(slot0._sigleItemPanel, "icon_bg/frame")
	slot4 = findTF
	slot5 = slot0._sigleItemPanel
	slot6 = "name_mode/intro_view/Viewport/Content/intro"
	slot4 = findTF(slot0._sigleItemPanel, "name_mode/intro_view/Viewport/Content/intro")
	slot5 = findTF
	slot6 = slot0._sigleItemPanel
	slot7 = "icon_bg/count"
	slot5 = findTF(slot0._sigleItemPanel, "icon_bg/count")
	slot6 = findTF
	slot7 = slot0._sigleItemPanel
	slot8 = "icon_bg/startpl"
	slot6 = findTF(slot0._sigleItemPanel, "icon_bg/startpl")
	slot7 = setText
	slot8 = findTF(slot0._sigleItemPanel, "icon_bg/count")
	slot9 = ""

	setText(slot5, "")

	slot7 = SetActive
	slot8 = findTF(slot0._sigleItemPanel, "icon_bg/startpl")
	slot9 = false

	SetActive(slot6, false)

	slot7 = SetActive
	slot8 = findTF(slot0._sigleItemPanel, "name_mode/intro_view/Viewport/Content/intro")
	slot9 = true

	SetActive(slot4, true)

	slot7 = setFrame
	slot8 = findTF(slot0._sigleItemPanel, "icon_bg/frame")
	slot9 = slot1.frame
	slot9 = slot1.frame or 1

	setFrame(findTF(slot0._sigleItemPanel, "icon_bg/frame"), slot9)

	slot7 = findTF(slot0._sigleItemPanel, "name_mode/name_mask")

	SetActive(slot7.parent, true)
	SetActive(slot7, true)
	ScrollTxt.New(slot7, findTF(slot0._sigleItemPanel, "icon_bg/frame")).setText(slot9, slot1.name or "")

	slot7.localPosition = Vector2(ScrollTxt.New(slot7, findTF(slot0._sigleItemPanel, "icon_bg/frame")).setText, slot7.localPosition.y)

	setText(findTF(slot0._sigleItemPanel, "name_mode/intro_view/Viewport/Content/intro"), slot1.content or "")
	SetActive(findTF(slot0._sigleItemPanel, "icon_bg/icon").parent, slot1.sprite)

	slot11 = slot1.sprite
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 87-87, warpins: 1 ---
	slot9 = 1
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 88-114, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 115-115, warpins: 1 ---
	slot12 = ""
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 116-128, warpins: 2 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #5 129-129, warpins: 1 ---
	slot13 = ""

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 130-137, warpins: 2 ---
	if slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 138-142, warpins: 1 ---
		slot11 = setImageSprite
		slot12 = slot2
		slot13 = slot1.sprite
		slot14 = false

		slot11(slot12, slot13, slot14)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 143-147, warpins: 2 ---
	slot12 = slot0
	slot11 = slot0.Loaded
	slot13 = slot1

	slot11(slot12, slot13)

	return
	--- END OF BLOCK #7 ---



end

function slot8(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = slot0.singleItemIntros
	slot2 = slot2[slot1]

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-11, warpins: 1 ---
		slot2 = slot0.singleItemIntros
		slot3 = cloneTplTo
		slot4 = slot0.singleItemIntro
		slot5 = slot0.singleItemIntro
		slot5 = slot5.parent
		slot3 = slot3(slot4, slot5)
		slot2[slot1] = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-14, warpins: 2 ---
	slot2 = slot0.singleItemIntros
	slot2 = slot2[slot1]

	return slot2
	--- END OF BLOCK #1 ---



end

slot1.GetSingleItemIntro = slot8

function slot8(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-51, warpins: 1 ---
	slot2 = rtf
	slot3 = slot0._window
	slot2 = slot2(slot3)
	slot3 = slot0._defaultSize
	slot2.sizeDelta = slot3
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel/line_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel/name_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "icon_bg/own"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = slot1.drop

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-61, warpins: 1 ---
		slot2 = GetOwnedpropCount
		slot3 = slot1.drop
		slot2, slot3 = slot2(slot3)
		slot4 = setActive
		slot5 = findTF
		slot6 = slot0._sigleItemPanel
		slot7 = "icon_bg/own"
		slot5 = slot5(slot6, slot7)

		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-62, warpins: 1 ---
			slot6 = slot1.showOwned
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 63-79, warpins: 2 ---
		slot4(slot5, slot6)

		slot4 = setText
		slot5 = findTF
		slot6 = slot0._sigleItemPanel
		slot7 = "icon_bg/own/Text"
		slot5 = slot5(slot6, slot7)
		slot6 = slot2

		slot4(slot5, slot6)

		slot4 = setText
		slot5 = findTF
		slot6 = slot0._sigleItemPanel
		slot7 = "icon_bg/own/label"
		slot5 = slot5(slot6, slot7)
		slot6 = i18n
		slot7 = "word_own1"

		slot4(slot5, slot6(slot7))
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 80-90, warpins: 2 ---
	slot2 = updateDrop
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1.drop

	slot2(slot3, slot4)

	slot2 = slot1.windowSize

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-98, warpins: 1 ---
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.windowSize
		slot4 = slot4.x

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 99-100, warpins: 1 ---
			slot4 = slot0._defaultSize
			slot4 = slot4.x
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 101-104, warpins: 2 ---
		slot5 = slot1.windowSize
		slot5 = slot5.y

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 105-106, warpins: 1 ---
			slot5 = slot0._defaultSize
			slot5 = slot5.y
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 107-108, warpins: 2 ---
		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 109-134, warpins: 2 ---
	slot2 = setActive
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel/name_mode"
	slot3 = slot3(slot4, slot5)
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0._tf
	slot3 = slot2
	slot2 = slot2.Find
	slot4 = "window/single_item_panel/name_mode/attrs"
	slot2 = slot2(slot3, slot4)
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "window/single_item_panel/name_mode/intro_view/Viewport/Content/intro"
	slot3 = slot3(slot4, slot5)
	slot4 = 1
	slot5 = SetActive
	slot6 = slot3
	slot7 = slot1.drop
	slot7 = slot7.type
	slot8 = DROP_TYPE_SHIP

	if slot7 ~= slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 135-139, warpins: 1 ---
		slot7 = slot1.drop
		slot7 = slot7.type
		slot8 = DROP_TYPE_RESOURCE

		if slot7 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 140-144, warpins: 1 ---
			slot7 = slot1.drop
			slot7 = slot7.type
			slot8 = DROP_TYPE_ITEM

			if slot7 ~= slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 145-149, warpins: 1 ---
				slot7 = slot1.drop
				slot7 = slot7.type
				slot8 = DROP_TYPE_FURNITURE

				if slot7 ~= slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 150-154, warpins: 1 ---
					slot7 = slot1.drop
					slot7 = slot7.type
					slot8 = DROP_TYPE_STRATEGY

					if slot7 ~= slot8 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 155-159, warpins: 1 ---
						slot7 = slot1.drop
						slot7 = slot7.type
						slot8 = DROP_TYPE_SKIN

						if slot7 ~= slot8 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 160-161, warpins: 1 ---
							slot7 = false
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



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 162-162, warpins: 6 ---
		slot7 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 163-169, warpins: 2 ---
	slot5(slot6, slot7)

	slot5 = slot0.settings
	slot5 = slot5.numUpdate
	slot6 = setActive
	slot7 = slot0._countDescTxt

	if slot5 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 170-171, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 172-172, warpins: 1 ---
		slot8 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 173-188, warpins: 2 ---
	slot6(slot7, slot8)

	slot6 = slot0._tf
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "window/single_item_panel/name_mode/name_mask"
	slot6 = slot6(slot7, slot8)
	slot7 = slot0._tf
	slot8 = slot7
	slot7 = slot7.Find
	slot9 = "window/single_item_panel/name_mode/name_mask/name"
	slot7 = slot7(slot8, slot9)
	slot8 = HXSet
	slot8 = slot8.hxLan
	slot9 = slot1.name

	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 189-193, warpins: 1 ---
		slot9 = slot1.drop
		slot9 = slot9.cfg
		slot9 = slot9.name

		if not slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 194-194, warpins: 1 ---
			slot9 = ""
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 195-216, warpins: 3 ---
	slot8 = slot8(slot9)
	slot9 = ScrollTxt
	slot9 = slot9.New
	slot10 = slot6
	slot11 = slot7
	slot9 = slot9(slot10, slot11)
	slot11 = slot9
	slot10 = slot9.setText
	slot12 = slot8

	slot10(slot11, slot12)

	slot10 = table
	slot10 = slot10.insert
	slot11 = slot0._scrollTxts
	slot12 = slot9

	slot10(slot11, slot12)

	slot10 = -170
	slot11 = go
	slot12 = slot0._SingleItemshipTypeTF
	slot11 = slot11(slot12)
	slot11 = slot11.activeSelf

	if not slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 217-217, warpins: 1 ---
		slot10 = -230
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 218-237, warpins: 2 ---
	slot12 = setActive
	slot13 = slot0._SingleItemshipTypeBgTF
	slot14 = slot11

	slot12(slot13, slot14)

	slot12 = Vector2
	slot13 = slot10
	slot14 = slot6.localPosition
	slot14 = slot14.y
	slot12 = slot12(slot13, slot14)
	slot6.localPosition = slot12
	slot12 = slot0._tf
	slot13 = slot12
	slot12 = slot12.Find
	slot14 = "window/single_item_panel/detail"
	slot12 = slot12(slot13, slot14)
	slot13 = slot1.drop
	slot13 = slot13.type
	slot14 = DROP_TYPE_ITEM

	if slot13 == slot14 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 238-242, warpins: 1 ---
		slot13 = slot1.drop
		slot13 = slot13.cfg
		slot13 = slot13.type

		if slot13 ~= 11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 243-244, warpins: 2 ---
			slot13 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 245-245, warpins: 1 ---
			slot13 = true
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 246-251, warpins: 2 ---
	slot14 = setActive
	slot15 = slot12
	slot16 = slot13

	slot14(slot15, slot16)

	if slot13 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 252-259, warpins: 1 ---
		slot15 = slot12
		slot14 = slot12.GetComponent
		slot16 = "RichText"
		slot14 = slot14(slot15, slot16)
		slot15 = slot14
		slot14 = slot14.AddListener

		function slot16(slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-30, warpins: 1 ---
			slot2 = {}
			slot3 = _
			slot3 = slot3.map
			slot4 = slot0
			slot4 = slot4.drop
			slot4 = slot4.cfg
			slot4 = slot4.display_icon

			function slot5(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				slot1 = {}
				slot2 = slot0[1]
				slot1.type = slot2
				slot2 = slot0[2]
				slot1.id = slot2

				return slot1
				--- END OF BLOCK #0 ---



			end

			slot3 = slot3(slot4, slot5)
			slot2.items = slot3
			slot3 = i18n
			slot4 = "equip_skin_detail_tip"
			slot3 = slot3(slot4)
			slot2.content = slot3
			slot3 = true
			slot2.item2Row = slot3
			slot3 = true
			slot2.hideNo = slot3

			function slot3(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-10, warpins: 1 ---
				slot1 = slot0
				slot2 = slot1
				slot3 = {}
				slot3.drop = slot0

				function slot4()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0 = slot0
					slot1 = slot1
					slot2 = slot2

					slot0(slot1, slot2)

					return
					--- END OF BLOCK #0 ---



				end

				slot3.onYes = slot4

				function slot4()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0 = slot0
					slot1 = slot1
					slot2 = slot2

					slot0(slot1, slot2)

					return
					--- END OF BLOCK #0 ---



				end

				slot3.onNo = slot4

				slot1(slot2, slot3)

				return
				--- END OF BLOCK #0 ---



			end

			slot2.itemFunc = slot3

			function slot3()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				slot0 = slot0
				slot1 = slot1
				slot2 = slot2

				slot0(slot1, slot2)

				return
				--- END OF BLOCK #0 ---



			end

			slot2.onYes = slot3
			slot3 = slot2.onYes
			slot2.onNo = slot3
			slot3 = slot3
			slot4 = slot2
			slot5 = slot2

			slot3(slot4, slot5)

			return
			--- END OF BLOCK #0 ---



		end

		slot14(slot15, slot16)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 260-262, warpins: 2 ---
	slot14 = slot1.content

	if slot14 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 263-265, warpins: 1 ---
		slot14 = slot1.content

		if slot14 ~= "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 266-269, warpins: 1 ---
			slot14 = slot0.singleItemIntroTF
			slot15 = slot1.content
			slot14.text = slot15
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 270-274, warpins: 2 ---
		slot14 = slot1.drop
		slot14 = slot14.type
		slot15 = DROP_TYPE_RESOURCE

		if slot14 == slot15 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 275-281, warpins: 1 ---
			slot14 = setTextEN
			slot15 = slot3
			slot16 = slot1.drop
			slot16 = slot16.cfg
			slot16 = slot16.display

			slot14(slot15, slot16)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 282-286, warpins: 1 ---
			slot14 = slot1.drop
			slot14 = slot14.type
			slot15 = DROP_TYPE_ITEM

			if slot14 == slot15 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 287-296, warpins: 1 ---
				slot14 = setTextEN
				slot15 = slot3
				slot16 = HXSet
				slot16 = slot16.hxLan
				slot17 = slot1.drop
				slot17 = slot17.cfg
				slot17 = slot17.display

				slot14(slot15, slot16(slot17))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 297-301, warpins: 1 ---
				slot14 = slot1.drop
				slot14 = slot14.type
				slot15 = DROP_TYPE_FURNITURE

				if slot14 == slot15 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 302-308, warpins: 1 ---
					slot14 = setTextEN
					slot15 = slot3
					slot16 = slot1.drop
					slot16 = slot16.cfg
					slot16 = slot16.describe

					slot14(slot15, slot16)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 309-313, warpins: 1 ---
					slot14 = slot1.drop
					slot14 = slot14.type
					slot15 = DROP_TYPE_SHIP

					if slot14 == slot15 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 314-329, warpins: 1 ---
						slot14 = slot2
						slot14 = slot14.ship_data_statistics
						slot15 = slot1.drop
						slot15 = slot15.id
						slot14 = slot14[slot15]
						slot14 = slot14.skin_id
						slot15 = ShipWordHelper
						slot15 = slot15.GetWordAndCV
						slot16 = slot14
						slot17 = ShipWordHelper
						slot17 = slot17.WORD_TYPE_DROP
						slot18 = nil
						slot19 = PLATFORM_CODE
						slot20 = PLATFORM_US

						if slot19 == slot20 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 330-331, warpins: 1 ---
							slot19 = false
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 332-332, warpins: 1 ---
							slot19 = true
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 333-337, warpins: 2 ---
						slot15, slot16, slot17 = slot15(slot16, slot17, slot18, slot19)
						slot18 = setText
						slot19 = slot3

						if not slot17 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 338-340, warpins: 1 ---
							slot20 = i18n
							slot21 = "ship_drop_desc_default"
							slot20 = slot20(slot21)
							--- END OF BLOCK #0 ---



						end

						--- END OF BLOCK #1 ---

						FLOW; TARGET BLOCK #2



						-- Decompilation error in this vicinity:
						--- BLOCK #2 341-342, warpins: 2 ---
						slot18(slot19, slot20)
						--- END OF BLOCK #2 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 343-347, warpins: 1 ---
						slot14 = slot1.drop
						slot14 = slot14.type
						slot15 = DROP_TYPE_EQUIP

						if slot14 == slot15 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 348-351, warpins: 1 ---
							slot14 = 1
							slot15 = 4
							slot16 = 1

							--- END OF BLOCK #0 ---

							FLOW; TARGET BLOCK #1



							-- Decompilation error in this vicinity:
							--- BLOCK #1 352-400, warpins: 0 ---
							for slot17 = slot14, slot15, slot16 do

								-- Decompilation error in this vicinity:
								--- BLOCK #0 352-377, warpins: 2 ---
								slot19 = slot2
								slot18 = slot2.GetChild
								slot20 = slot17 - 1
								slot18 = slot18(slot19, slot20)
								slot19 = slot1.drop
								slot19 = slot19.cfg
								slot20 = "attribute_"
								slot21 = slot17
								slot20 = slot20 .. slot21
								slot19 = slot19[slot20]
								slot20 = setActive
								slot22 = slot18
								slot21 = slot18.Find
								slot23 = "opend"
								slot21 = slot21(slot22, slot23)
								slot22 = slot19

								slot20(slot21, slot22)

								slot20 = setActive
								slot22 = slot18
								slot21 = slot18.Find
								slot23 = "attrLockTpl"
								slot21 = slot21(slot22, slot23)
								slot22 = not slot19

								slot20(slot21, slot22)

								if slot19 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 378-399, warpins: 1 ---
									slot20 = setText
									slot22 = slot18
									slot21 = slot18.Find
									slot23 = "opend/type_name"
									slot21 = slot21(slot22, slot23)
									slot22 = AttributeType
									slot22 = slot22.Type2Name
									slot23 = slot19

									slot20(slot21, slot22(slot23))

									slot20 = setText
									slot22 = slot18
									slot21 = slot18.Find
									slot23 = "opend/value"
									slot21 = slot21(slot22, slot23)
									slot22 = slot1.drop
									slot22 = slot22.cfg
									slot23 = "value_"
									slot24 = slot17
									slot23 = slot23 .. slot24
									slot22 = slot22[slot23]

									slot20(slot21, slot22)
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 400-400, warpins: 2 ---
								--- END OF BLOCK #1 ---



							end
							--- END OF BLOCK #1 ---

							FLOW; TARGET BLOCK #2



							-- Decompilation error in this vicinity:
							--- BLOCK #2 401-401, warpins: 1 ---
							--- END OF BLOCK #2 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 402-406, warpins: 1 ---
							slot14 = slot1.drop
							slot14 = slot14.type
							slot15 = DROP_TYPE_STRATEGY

							if slot14 == slot15 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 407-415, warpins: 1 ---
								slot14 = setTextEN
								slot15 = slot3
								slot16 = slot1.drop
								slot16 = slot16.cfg
								slot16 = slot16.desc

								slot14(slot15, slot16)

								slot14 = slot1.extendDesc

								if slot14 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 416-424, warpins: 1 ---
									slot4 = slot4 + 1
									slot14 = setTextEN
									slot16 = slot0
									slot15 = slot0.GetSingleItemIntro
									slot17 = slot4
									slot15 = slot15(slot16, slot17)
									slot16 = slot1.extendDesc

									slot14(slot15, slot16)
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 425-429, warpins: 1 ---
								slot14 = slot1.drop
								slot14 = slot14.type
								slot15 = DROP_TYPE_SKIN

								if slot14 == slot15 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 430-439, warpins: 1 ---
									slot14 = setTextEN
									slot15 = slot3
									slot16 = HXSet
									slot16 = slot16.hxLan
									slot17 = slot1.drop
									slot17 = slot17.cfg
									slot17 = slot17.desc

									slot14(slot15, slot16(slot17))
									--- END OF BLOCK #0 ---



								else

									-- Decompilation error in this vicinity:
									--- BLOCK #0 440-444, warpins: 1 ---
									slot14 = slot1.drop
									slot14 = slot14.type
									slot15 = DROP_TYPE_EQUIPMENT_SKIN

									if slot14 == slot15 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 445-470, warpins: 1 ---
										slot14 = slot1.drop
										slot14 = slot14.cfg
										slot14 = slot14.desc
										slot15 = _
										slot15 = slot15.map
										slot16 = slot1.drop
										slot16 = slot16.cfg
										slot16 = slot16.equip_type

										function slot17(slot0)

											-- Decompilation error in this vicinity:
											--- BLOCK #0 1-4, warpins: 1 ---
											slot1 = EquipType
											slot1 = slot1.Type2Name2
											slot2 = slot0

											return slot1(slot2)
											--- END OF BLOCK #0 ---



										end

										slot15 = slot15(slot16, slot17)
										slot16 = setTextEN
										slot17 = slot3
										slot18 = slot14
										slot19 = "\n\n"
										slot20 = i18n
										slot21 = "word_fit"
										slot20 = slot20(slot21)
										slot21 = ": "
										slot22 = table
										slot22 = slot22.concat
										slot23 = slot15
										slot24 = ","
										slot22 = slot22(slot23, slot24)
										slot18 = slot18 .. slot19 .. slot20 .. slot21 .. slot22

										slot16(slot17, slot18)
										--- END OF BLOCK #0 ---



									else

										-- Decompilation error in this vicinity:
										--- BLOCK #0 471-475, warpins: 1 ---
										slot14 = slot1.drop
										slot14 = slot14.type
										slot15 = DROP_TYPE_VITEM

										if slot14 == slot15 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 476-485, warpins: 1 ---
											slot14 = setTextEN
											slot15 = slot3
											slot16 = HXSet
											slot16 = slot16.hxLan
											slot17 = slot1.drop
											slot17 = slot17.cfg
											slot17 = slot17.display

											slot14(slot15, slot16(slot17))
											--- END OF BLOCK #0 ---



										else

											-- Decompilation error in this vicinity:
											--- BLOCK #0 486-490, warpins: 1 ---
											slot14 = slot1.drop
											slot14 = slot14.type
											slot15 = DROP_TYPE_WORLD_ITEM

											if slot14 == slot15 then

												-- Decompilation error in this vicinity:
												--- BLOCK #0 491-500, warpins: 1 ---
												slot14 = setTextEN
												slot15 = slot3
												slot16 = HXSet
												slot16 = slot16.hxLan
												slot17 = slot1.drop
												slot17 = slot17.cfg
												slot17 = slot17.display

												slot14(slot15, slot16(slot17))
												--- END OF BLOCK #0 ---



											else

												-- Decompilation error in this vicinity:
												--- BLOCK #0 501-505, warpins: 1 ---
												slot14 = slot1.drop
												slot14 = slot14.type
												slot15 = DROP_TYPE_ICON_FRAME

												if slot14 == slot15 then

													-- Decompilation error in this vicinity:
													--- BLOCK #0 506-512, warpins: 1 ---
													slot14 = setTextEN
													slot15 = slot3
													slot16 = slot1.drop
													slot16 = slot16.cfg
													slot16 = slot16.desc

													slot14(slot15, slot16)
													--- END OF BLOCK #0 ---



												else

													-- Decompilation error in this vicinity:
													--- BLOCK #0 513-517, warpins: 1 ---
													slot14 = slot1.drop
													slot14 = slot14.type
													slot15 = DROP_TYPE_CHAT_FRAME

													if slot14 == slot15 then

														-- Decompilation error in this vicinity:
														--- BLOCK #0 518-524, warpins: 1 ---
														slot14 = setTextEN
														slot15 = slot3
														slot16 = slot1.drop
														slot16 = slot16.cfg
														slot16 = slot16.desc

														slot14(slot15, slot16)
														--- END OF BLOCK #0 ---



													else

														-- Decompilation error in this vicinity:
														--- BLOCK #0 525-529, warpins: 1 ---
														slot14 = slot1.drop
														slot14 = slot14.type
														slot15 = DROP_TYPE_EMOJI

														if slot14 == slot15 then

															-- Decompilation error in this vicinity:
															--- BLOCK #0 530-536, warpins: 1 ---
															slot14 = setTextEN
															slot15 = slot3
															slot16 = slot1.drop
															slot16 = slot16.cfg
															slot16 = slot16.item_desc

															slot14(slot15, slot16)
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

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 537-539, warpins: 16 ---
	slot14 = slot1.intro

	if slot14 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 540-543, warpins: 1 ---
		slot14 = setTextEN
		slot15 = slot3
		slot16 = slot1.intro

		slot14(slot15, slot16)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 544-546, warpins: 2 ---
	slot14 = slot1.enabelYesBtn

	if slot14 ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 547-559, warpins: 1 ---
		slot14 = slot0._btnContainer
		slot15 = slot14
		slot14 = slot14.GetChild
		slot16 = 1
		slot14 = slot14(slot15, slot16)
		slot15 = setButtonEnabled
		slot16 = slot14
		slot17 = slot1.enabelYesBtn

		slot15(slot16, slot17)

		slot15 = eachChild
		slot16 = slot14

		function slot17(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			slot1 = slot0
			slot1 = slot1.enabelYesBtn

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-6, warpins: 1 ---
				slot1 = 1
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-7, warpins: 1 ---
				slot1 = 0.3
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 8-15, warpins: 2 ---
			slot2 = GetOrAddComponent
			slot3 = slot0
			slot4 = typeof
			slot5 = CanvasGroup
			slot2 = slot2(slot3, slot4(slot5))
			slot2.alpha = slot1

			return
			--- END OF BLOCK #1 ---



		end

		slot15(slot16, slot17)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 560-563, warpins: 2 ---
	slot14 = ipairs
	slot15 = slot0.singleItemIntros
	slot14, slot15, slot16 = slot14(slot15)

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 564-575, warpins: 0 ---
	for slot17, slot18 in slot14, slot15, slot16 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 564-567, warpins: 1 ---
		slot19 = setActive
		slot20 = slot18

		if slot17 > slot4 or slot5 ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 570-571, warpins: 2 ---
			slot21 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 572-572, warpins: 1 ---
			slot21 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 573-573, warpins: 2 ---
		slot19(slot20, slot21)
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 574-575, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 576-578, warpins: 1 ---
	slot14 = slot1.show_medal

	if slot14 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 579-590, warpins: 1 ---
		slot15 = slot0
		slot14 = slot0.createBtn
		slot16 = {
			sibling = 0,
			hideEvent = true
		}
		slot17 = slot1.show_medal
		slot17 = slot17.desc
		slot16.text = slot17
		slot17 = slot3
		slot17 = slot17.BUTTON_MEDAL
		slot16.btnType = slot17
		slot17 = SFX_UI_BUILDING_EXCHANGE
		slot16.sound = slot17

		slot14(slot15, slot16)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 591-596, warpins: 2 ---
	slot15 = slot0
	slot14 = slot0.Loaded
	slot16 = slot1

	slot14(slot15, slot16)

	return
	--- END OF BLOCK #14 ---



end

function slot9(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-52, warpins: 1 ---
	slot2 = defaultValue
	slot3 = slot1.hideNo
	slot4 = true
	slot2 = slot2(slot3, slot4)
	slot1.hideNo = slot2
	slot2 = defaultValue
	slot3 = slot1.hideYes
	slot4 = true
	slot2 = slot2(slot3, slot4)
	slot1.hideYes = slot2
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._sliders
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._helpPanel
	slot5 = "bg"
	slot3 = slot3(slot4, slot5)
	slot4 = slot1.helps
	slot4 = slot4.pageMode
	slot4 = not slot4

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._helpBgTF
	slot4 = slot1.helps
	slot4 = slot4.pageMode

	slot2(slot3, slot4)

	slot2 = slot1.helps
	slot2 = slot2.helpSize

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-61, warpins: 1 ---
		slot2 = rtf
		slot3 = slot0._helpPanel
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.helpSize
		slot4 = slot4.x

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-63, warpins: 1 ---
			slot4 = slot0._defaultHelpSize
			slot4 = slot4.x
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 64-68, warpins: 2 ---
		slot5 = slot1.helps
		slot5 = slot5.helpSize
		slot5 = slot5.y

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 69-70, warpins: 1 ---
			slot5 = slot0._defaultHelpSize
			slot5 = slot5.y
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 71-72, warpins: 2 ---
		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 73-76, warpins: 2 ---
	slot2 = slot1.helps
	slot2 = slot2.helpPos

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 77-84, warpins: 1 ---
		slot2 = setAnchoredPosition
		slot3 = slot0._helpPanel
		slot4 = {}
		slot5 = slot1.helps
		slot5 = slot5.helpPos
		slot5 = slot5.x

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 85-86, warpins: 1 ---
			slot5 = slot0._defaultHelpPos
			slot5 = slot5.x
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 87-92, warpins: 2 ---
		slot4.x = slot5
		slot5 = slot1.helps
		slot5 = slot5.helpPos
		slot5 = slot5.y

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 93-94, warpins: 1 ---
			slot5 = slot0._defaultHelpPos
			slot5 = slot5.y
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 95-96, warpins: 2 ---
		slot4.y = slot5

		slot2(slot3, slot4)
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 97-100, warpins: 2 ---
	slot2 = slot1.helps
	slot2 = slot2.windowSize

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 101-109, warpins: 1 ---
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.windowSize
		slot4 = slot4.x

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 110-111, warpins: 1 ---
			slot4 = slot0._defaultSize
			slot4 = slot4.x
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 112-116, warpins: 2 ---
		slot5 = slot1.helps
		slot5 = slot5.windowSize
		slot5 = slot5.y

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 117-118, warpins: 1 ---
			slot5 = slot0._defaultSize
			slot5 = slot5.y
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 119-120, warpins: 2 ---
		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 121-124, warpins: 2 ---
	slot2 = slot1.helps
	slot2 = slot2.windowPos

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 125-133, warpins: 1 ---
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.windowSize
		slot4 = slot4.x

		if not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 134-135, warpins: 1 ---
			slot4 = slot0._defaultSize
			slot4 = slot4.x
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 136-140, warpins: 2 ---
		slot5 = slot1.helps
		slot5 = slot5.windowSize
		slot5 = slot5.y

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 141-142, warpins: 1 ---
			slot5 = slot0._defaultSize
			slot5 = slot5.y
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 143-152, warpins: 2 ---
		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
		slot2 = setAnchoredPosition
		slot3 = slot0._window
		slot4 = {}
		slot5 = slot1.helps
		slot5 = slot5.windowPos
		slot5 = slot5.x

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 153-153, warpins: 1 ---
			slot5 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 154-159, warpins: 2 ---
		slot4.x = slot5
		slot5 = slot1.helps
		slot5 = slot5.windowPos
		slot5 = slot5.y

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 160-160, warpins: 1 ---
			slot5 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 161-163, warpins: 2 ---
		slot4.y = slot5

		slot2(slot3, slot4)
		--- END OF BLOCK #4 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 164-167, warpins: 1 ---
		slot2 = setAnchoredPosition
		slot3 = slot0._window
		slot4 = {
			x = 0,
			y = 0
		}

		slot2(slot3, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 168-171, warpins: 2 ---
	slot2 = slot1.helps
	slot2 = slot2.buttonsHeight

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 172-178, warpins: 1 ---
		slot2 = setAnchoredPosition
		slot3 = slot0._btnContainer
		slot4 = {
			x = 0
		}
		slot5 = slot1.helps
		slot5 = slot5.buttonsHeight
		slot4.y = slot5

		slot2(slot3, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 179-182, warpins: 2 ---
	slot2 = slot1.helps
	slot2 = slot2.disableScroll

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 183-206, warpins: 1 ---
		slot2 = GetComponent
		slot3 = slot0._helpPanel
		slot4 = typeof
		slot5 = ScrollRect
		slot2 = slot2(slot3, slot4(slot5))
		slot3 = slot1.helps
		slot3 = slot3.disableScroll
		slot3 = not slot3
		slot2.enabled = slot3
		slot3 = setAnchoredPosition
		slot4 = findTF
		slot5 = slot0._helpPanel
		slot6 = "list"
		slot4 = slot4(slot5, slot6)
		slot5 = {
			x = 0,
			y = 0
		}

		slot3(slot4, slot5)

		slot3 = setActive
		slot4 = findTF
		slot5 = slot0._helpPanel
		slot6 = "Scrollbar"
		slot4 = slot4(slot5, slot6)
		slot5 = false

		slot3(slot4, slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 207-210, warpins: 2 ---
	slot2 = slot1.helps
	slot2 = slot2.ImageMode

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 211-221, warpins: 1 ---
		slot2 = setActive
		slot3 = slot0._top
		slot4 = false

		slot2(slot3, slot4)

		slot2 = setActive
		slot3 = findTF
		slot4 = slot0._window
		slot5 = "bg"
		slot3 = slot3(slot4, slot5)
		slot4 = false

		slot2(slot3, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 222-229, warpins: 2 ---
	slot2 = slot0.settings
	slot2 = slot2.helps
	slot3 = #slot2
	slot4 = slot0._helpList
	slot4 = slot4.childCount
	slot4 = slot4 - 1
	slot5 = 1

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 230-237, warpins: 0 ---
	for slot6 = slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 230-237, warpins: 2 ---
		slot7 = Destroy
		slot8 = slot0._helpList
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot6

		slot7(slot8(slot9, slot10))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 238-243, warpins: 1 ---
	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot4 = #slot2
	slot4 = slot4 - 1
	slot5 = 1

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 244-248, warpins: 0 ---
	for slot6 = slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 244-248, warpins: 2 ---
		slot7 = cloneTplTo
		slot8 = slot0._helpTpl
		slot9 = slot0._helpList

		slot7(slot8, slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 249-252, warpins: 1 ---
	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 253-358, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 253-266, warpins: 1 ---
		slot8 = slot0._helpList
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot6 - 1
		slot8 = slot8(slot9, slot10)
		slot9 = setActive
		slot10 = slot8
		slot11 = true

		slot9(slot10, slot11)

		slot9 = setText
		slot10 = slot8
		slot11 = slot7.info

		if not slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 267-267, warpins: 1 ---
			slot11 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 268-286, warpins: 2 ---
		slot9(slot10, slot11)

		slot10 = slot8
		slot9 = slot8.Find
		slot11 = "icon"
		slot9 = slot9(slot10, slot11)
		slot10 = setActive
		slot11 = slot9
		slot12 = slot7.icon

		slot10(slot11, slot12)

		slot10 = setActive
		slot11 = findTF
		slot12 = slot8
		slot13 = "line"
		slot11 = slot11(slot12, slot13)
		slot12 = slot7.line

		slot10(slot11, slot12)

		slot10 = slot7.icon

		if slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 287-291, warpins: 1 ---
			slot10 = 1
			slot11 = slot1.helps
			slot11 = slot11.ImageMode

			if slot11 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 292-292, warpins: 1 ---
				slot10 = 1.5
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 293-298, warpins: 2 ---
			slot11 = slot9.transform
			slot12 = Vector2
			slot13 = slot7.icon
			slot13 = slot13.scale

			if not slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 299-299, warpins: 1 ---
				slot13 = slot10
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 300-303, warpins: 2 ---
			slot14 = slot7.icon
			slot14 = slot14.scale

			if not slot14 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 304-304, warpins: 1 ---
				slot14 = slot10
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 305-312, warpins: 2 ---
			slot12 = slot12(slot13, slot14)
			slot11.localScale = slot12
			slot11 = slot7.icon
			slot11 = slot11.path
			slot12 = slot7.icon
			slot12 = slot12.posX

			if slot12 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 313-316, warpins: 1 ---
				slot12 = slot7.icon
				slot12 = slot12.posX

				if not slot12 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 317-317, warpins: 2 ---
					slot12 = -20
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 318-321, warpins: 2 ---
			slot13 = slot7.icon
			slot13 = slot13.posY

			if slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 322-325, warpins: 1 ---
				slot13 = slot7.icon
				slot13 = slot13.posY

				if not slot13 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 326-326, warpins: 2 ---
					slot13 = 0
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 327-356, warpins: 2 ---
			slot14 = LoadSprite
			slot15 = slot7.icon
			slot15 = slot15.atlas
			slot16 = slot7.icon
			slot16 = slot16.path
			slot14 = slot14(slot15, slot16)
			slot15 = setImageSprite
			slot17 = slot9
			slot16 = slot9.GetComponent
			slot18 = typeof
			slot19 = Image
			slot16 = slot16(slot17, slot18(slot19))
			slot17 = slot14
			slot18 = true

			slot15(slot16, slot17, slot18)

			slot15 = setAnchoredPosition
			slot16 = slot9
			slot17 = {}
			slot17.x = slot12
			slot17.y = slot13

			slot15(slot16, slot17)

			slot15 = setActive
			slot17 = slot9
			slot16 = slot9.Find
			slot18 = "corner"
			slot16 = slot16(slot17, slot18)
			slot17 = slot1.helps
			slot17 = slot17.pageMode

			slot15(slot16, slot17)
			--- END OF BLOCK #5 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 357-358, warpins: 3 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 359-362, warpins: 1 ---
	slot3 = slot1.helps
	slot3 = slot3.defaultpage

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 363-363, warpins: 1 ---
		slot3 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 364-368, warpins: 2 ---
	slot0.helpPage = slot3
	slot3 = slot1.helps
	slot3 = slot3.pageMode

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 369-372, warpins: 1 ---
		slot4 = slot0
		slot3 = slot0.switchHelpPage
		slot5 = slot0.helpPage

		slot3(slot4, slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 373-384, warpins: 2 ---
	slot4 = slot0
	slot3 = slot0.Loaded
	slot5 = slot1

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0._btnContainer
	slot5 = slot0._btnContainer
	slot5 = slot5.transform
	slot5 = slot5.childCount
	slot6 = 0

	if slot5 <= slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 385-386, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 387-387, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 388-389, warpins: 2 ---
	slot3(slot4, slot5)

	return
	--- END OF BLOCK #16 ---



end

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-53, warpins: 1 ---
	slot3 = slot0
	slot2 = slot0.commonSetting
	slot4 = slot1

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._sigleItemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._itemPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = SetActive
	slot3 = slot0._msgPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._inputPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = tf
	slot3 = slot1.secondaryUI
	slot2 = slot2(slot3)
	slot3 = rtf
	slot4 = slot0._window
	slot3 = slot3(slot4)
	slot4 = Vector2
	slot5 = 960
	slot6 = slot0._defaultSize
	slot6 = slot6.y
	slot4 = slot4(slot5, slot6)
	slot3.sizeDelta = slot4
	slot3 = setActive
	slot4 = slot2
	slot5 = true

	slot3(slot4, slot5)

	slot3 = slot1.mode
	slot4 = getProxy
	slot5 = SecondaryPWDProxy
	slot4 = slot4(slot5)
	slot6 = slot4
	slot5 = slot4.getRawData
	slot5 = slot5(slot6)
	slot7 = slot2
	slot6 = slot2.Find
	slot8 = "showresttime"
	slot6 = slot6(slot7, slot8)
	slot8 = slot2
	slot7 = slot2.Find
	slot9 = "settips"
	slot7 = slot7(slot8, slot9)

	if slot3 == "showresttime" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-75, warpins: 1 ---
		slot8 = setActive
		slot9 = slot6
		slot10 = true

		slot8(slot9, slot10)

		slot8 = setActive
		slot9 = slot7
		slot10 = false

		slot8(slot9, slot10)

		slot9 = slot6
		slot8 = slot6.Find
		slot10 = "desc"
		slot8 = slot8(slot9, slot10)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Text
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot0.timers
		slot9 = slot9.secondaryUItimer

		if slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 76-80, warpins: 1 ---
			slot9 = slot0.timers
			slot9 = slot9.secondaryUItimer
			slot10 = slot9
			slot9 = slot9.Stop

			slot9(slot10)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 81-95, warpins: 2 ---
		function slot9()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			slot0 = slot0
			slot0 = slot0.TimeMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.GetServerTime
			slot0 = slot0(slot1)
			slot1 = slot1
			slot1 = slot1.fail_cd

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-16, warpins: 1 ---
				slot1 = slot1
				slot1 = slot1.fail_cd
				slot1 = slot1 - slot0

				if not slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-17, warpins: 2 ---
					slot1 = 0
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 18-20, warpins: 2 ---
			slot2 = 0

			if slot1 < slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-22, warpins: 1 ---
				slot1 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 23-29, warpins: 2 ---
			slot2 = math
			slot2 = slot2.floor
			slot3 = slot1 / 86400
			slot2 = slot2(slot3)
			slot3 = 0

			if slot2 > slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-43, warpins: 1 ---
				slot3 = slot2
				slot4 = string
				slot4 = slot4.format
				slot5 = i18n
				slot6 = "tips_fail_secondarypwd_much_times"
				slot5 = slot5(slot6)
				slot6 = slot2
				slot7 = i18n
				slot8 = "word_date"
				slot7 = slot7(slot8)
				slot6 = slot6 .. slot7
				slot4 = slot4(slot5, slot6)
				slot3.text = slot4
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-50, warpins: 1 ---
				slot3 = math
				slot3 = slot3.floor
				slot4 = slot1 / 3600
				slot3 = slot3(slot4)
				slot4 = 0

				if slot3 > slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 51-64, warpins: 1 ---
					slot4 = slot2
					slot5 = string
					slot5 = slot5.format
					slot6 = i18n
					slot7 = "tips_fail_secondarypwd_much_times"
					slot6 = slot6(slot7)
					slot7 = slot3
					slot8 = i18n
					slot9 = "word_hour"
					slot8 = slot8(slot9)
					slot7 = slot7 .. slot8
					slot5 = slot5(slot6, slot7)
					slot4.text = slot5
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 65-72, warpins: 1 ---
					slot4 = ""
					slot5 = math
					slot5 = slot5.floor
					slot6 = slot1 / 60
					slot5 = slot5(slot6)
					slot6 = 0

					if slot5 > slot6 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 73-78, warpins: 1 ---
						slot6 = slot4
						slot7 = slot5
						slot8 = i18n
						slot9 = "word_minute"
						slot8 = slot8(slot9)
						slot4 = slot6 .. slot7 .. slot8
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 79-98, warpins: 2 ---
					slot6 = math
					slot6 = slot6.max
					slot7 = slot5 * 60
					slot7 = slot1 - slot7
					slot8 = 0
					slot6 = slot6(slot7, slot8)
					slot7 = slot2
					slot8 = string
					slot8 = slot8.format
					slot9 = i18n
					slot10 = "tips_fail_secondarypwd_much_times"
					slot9 = slot9(slot10)
					slot10 = slot4
					slot11 = slot6
					slot12 = i18n
					slot13 = "word_second"
					slot12 = slot12(slot13)
					slot10 = slot10 .. slot11 .. slot12
					slot8 = slot8(slot9, slot10)
					slot7.text = slot8
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 99-99, warpins: 3 ---
			return
			--- END OF BLOCK #3 ---



		end

		slot10 = slot9

		slot10()

		slot10 = Timer
		slot10 = slot10.New
		slot11 = slot9
		slot12 = 1
		slot13 = -1
		slot10 = slot10(slot11, slot12, slot13)
		slot12 = slot10
		slot11 = slot10.Start

		slot11(slot12)

		slot11 = slot0.timers
		slot11.secondaryUItimer = slot10
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 96-97, warpins: 1 ---
		if slot3 == "settips" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 98-121, warpins: 1 ---
			slot8 = setActive
			slot9 = slot6
			slot10 = false

			slot8(slot9, slot10)

			slot8 = setActive
			slot9 = slot7
			slot10 = true

			slot8(slot9, slot10)

			slot9 = slot7
			slot8 = slot7.Find
			slot10 = "InputField"
			slot8 = slot8(slot9, slot10)
			slot9 = slot8
			slot8 = slot8.GetComponent
			slot10 = typeof
			slot11 = InputField
			slot8 = slot8(slot9, slot10(slot11))
			slot9 = slot1.references
			slot9.inputfield = slot8
			slot9 = slot1.references
			slot9 = slot9.lasttext

			if not slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 122-122, warpins: 1 ---
				slot9 = ""
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 123-147, warpins: 2 ---
			slot8.text = slot9
			slot9 = 20
			slot10 = slot8.onValueChanged
			slot11 = slot10
			slot10 = slot10.AddListener

			function slot12()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0 = utf8_to_unicode
				slot1 = slot0
				slot1 = slot1.text
				slot0, slot1 = slot0(slot1)
				slot2 = slot1

				if slot2 < slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 8-15, warpins: 1 ---
					slot2 = slot0
					slot3 = SecondaryPasswordMediator
					slot3 = slot3.ClipUnicodeStr
					slot4 = slot0
					slot4 = slot4.text
					slot5 = slot1
					slot3 = slot3(slot4, slot5)
					slot2.text = slot3
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 16-16, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end

			slot10(slot11, slot12)

			function slot10()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				slot0 = PLATFORM_CODE
				slot1 = PLATFORM_JP

				if slot0 ~= slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-8, warpins: 1 ---
					slot0 = PLATFORM_CODE
					slot1 = PLATFORM_US

					if slot0 == slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 9-10, warpins: 2 ---
						slot0 = false

						return slot0
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 11-19, warpins: 2 ---
				slot0 = slot0
				slot0 = slot0.text
				slot1 = wordVer
				slot2 = slot0
				slot3 = {
					isReplace = true
				}
				slot1, slot2 = slot1(slot2, slot3)
				slot3 = 0

				if slot1 > slot3 or slot2 ~= slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 22-36, warpins: 2 ---
					slot3 = slot1
					slot3 = slot3.TipsMgr
					slot3 = slot3.GetInstance
					slot3 = slot3()
					slot4 = slot3
					slot3 = slot3.ShowTips
					slot5 = i18n
					slot6 = "secondarypassword_illegal_tip"

					slot3(slot4, slot5(slot6))

					slot3 = slot0
					slot3.text = slot2
					slot3 = true

					return slot3
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-38, warpins: 1 ---
					slot3 = false

					return slot3
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 39-39, warpins: 2 ---
				return
				--- END OF BLOCK #2 ---



			end

			slot12 = slot0
			slot11 = slot0.createBtn
			slot13 = {}
			slot14 = slot1
			slot14 = slot14.TEXT_CONFIRM
			slot13.text = slot14
			slot14 = slot1
			slot14 = slot14.BUTTON_BLUE
			slot13.btnType = slot14
			slot14 = slot0.settings
			slot14 = slot14.onYes
			slot13.onCallback = slot14
			slot14 = SFX_CONFIRM
			slot13.sound = slot14
			slot13.noQuit = slot10

			slot11(slot12, slot13)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 148-153, warpins: 3 ---
	slot9 = slot0
	slot8 = slot0.Loaded
	slot10 = slot1

	slot8(slot9, slot10)

	return
	--- END OF BLOCK #1 ---



end

showSecondaryPassword = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = slot0.helpPage
	slot1 = slot1 + 1
	slot0.helpPage = slot1
	slot1 = slot0.helpPage
	slot2 = 1

	if slot1 < slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-9, warpins: 1 ---
		slot1 = 1
		slot0.helpPage = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-14, warpins: 2 ---
	slot1 = slot0.helpPage
	slot2 = slot0._helpList
	slot2 = slot2.childCount

	if slot2 < slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		slot1 = 1
		slot0.helpPage = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-21, warpins: 2 ---
	slot2 = slot0
	slot1 = slot0.switchHelpPage
	slot3 = slot0.helpPage

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #2 ---



end

slot1.nextPage = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = slot0.helpPage
	slot1 = slot1 - 1
	slot0.helpPage = slot1
	slot1 = slot0.helpPage
	slot2 = 1

	if slot1 < slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		slot1 = slot0._helpList
		slot1 = slot1.childCount
		slot0.helpPage = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-15, warpins: 2 ---
	slot1 = slot0.helpPage
	slot2 = slot0._helpList
	slot2 = slot2.childCount

	if slot2 < slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-18, warpins: 1 ---
		slot1 = slot0._helpList
		slot1 = slot1.childCount
		slot0.helpPage = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-23, warpins: 2 ---
	slot2 = slot0
	slot1 = slot0.switchHelpPage
	slot3 = slot0.helpPage

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #2 ---



end

slot1.prePage = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = 1
	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot4 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-26, warpins: 0 ---
	for slot5 = slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-14, warpins: 2 ---
		slot6 = slot0._helpList
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = slot5 - 1
		slot6 = slot6(slot7, slot8)
		slot7 = setActive
		slot8 = slot6

		if slot1 ~= slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 1 ---
			slot9 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 1 ---
			slot9 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-26, warpins: 2 ---
		slot7(slot8, slot9)

		slot7 = setText
		slot9 = slot6
		slot8 = slot6.Find
		slot10 = "icon/corner/Text"
		slot8 = slot8(slot9, slot10)
		slot9 = slot5

		slot7(slot8, slot9)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-27, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot1.switchHelpPage = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-36, warpins: 1 ---
	slot2 = true
	slot0.enable = slot2
	slot2 = slot0
	slot2 = slot2.DelegateInfo
	slot2 = slot2.New
	slot3 = slot0

	slot2(slot3)

	slot2 = setActive
	slot3 = slot0._exchangeShipPanel
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._helpBgTF
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0._btnContainer
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.stopRemindToggle
	slot3 = false
	slot2.isOn = slot3
	slot2 = setActive
	slot3 = go
	slot4 = slot0.stopRemindToggle
	slot3 = slot3(slot4)
	slot4 = slot1.showStopRemind

	slot2(slot3, slot4)

	slot2 = tf
	slot3 = go
	slot4 = slot0.stopRemindToggle
	slot2 = slot2(slot3(slot4))
	slot3 = slot1.showStopRamindPos

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-37, warpins: 1 ---
		slot3 = slot0.stopRemindInitPos
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-42, warpins: 2 ---
	slot2.anchoredPosition = slot3
	slot2 = slot0.stopRemindText
	slot3 = slot1.stopRamindContent

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-45, warpins: 1 ---
		slot3 = i18n
		slot4 = "dont_remind_today"
		slot3 = slot3(slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 46-58, warpins: 2 ---
	slot2.text = slot3
	slot2 = removeAllChildren
	slot3 = slot0._btnContainer

	slot2(slot3)

	slot0.settings = slot1
	slot2 = SetActive
	slot3 = slot0._go
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.settings
	slot2 = slot2.needCounter

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 59-59, warpins: 1 ---
		slot2 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 60-69, warpins: 2 ---
	slot3 = slot0.settings
	slot3 = slot3.numUpdate
	slot4 = setActive
	slot5 = slot0._countSelect
	slot6 = slot2

	slot4(slot5, slot6)

	slot4 = slot0.settings
	slot4 = slot4.addNum

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 70-70, warpins: 1 ---
		slot4 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 71-74, warpins: 2 ---
	slot5 = slot0.settings
	slot5 = slot5.maxNum

	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 75-75, warpins: 1 ---
		slot5 = -1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 76-79, warpins: 2 ---
	slot6 = slot0.settings
	slot6 = slot6.defaultNum

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 80-80, warpins: 1 ---
		slot6 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 81-104, warpins: 2 ---
	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setNumUpdate

	function slot9(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot1 = slot0

		if slot1 ~= nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-8, warpins: 1 ---
			slot1 = slot0
			slot2 = slot1
			slot2 = slot2._countDescTxt
			slot3 = slot0

			slot1(slot2, slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-9, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot7(slot8, slot9)

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setAddNum
	slot9 = slot4

	slot7(slot8, slot9)

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setMaxNum
	slot9 = slot5

	slot7(slot8, slot9)

	slot7 = slot0._pageUtil
	slot8 = slot7
	slot7 = slot7.setDefaultNum
	slot9 = slot6

	slot7(slot8, slot9)

	slot7 = slot0.settings
	slot7 = slot7.discount

	if slot7 ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 105-141, warpins: 1 ---
		slot7 = slot0._discount
		slot8 = slot7
		slot7 = slot7.GetComponent
		slot9 = typeof
		slot10 = Text
		slot7 = slot7(slot8, slot9(slot10))
		slot8 = slot0.settings
		slot8 = slot8.discount
		slot8 = slot8.discount
		slot9 = "%OFF"
		slot8 = slot8 .. slot9
		slot7.text = slot8
		slot7 = slot0._discountDate
		slot8 = slot7
		slot7 = slot7.GetComponent
		slot9 = typeof
		slot10 = Text
		slot7 = slot7(slot8, slot9(slot10))
		slot8 = slot0.settings
		slot8 = slot8.discount
		slot8 = slot8.date
		slot7.text = slot8
		slot7 = SetActive
		slot8 = slot0._discountDate
		slot9 = true

		slot7(slot8, slot9)

		slot7 = SetActive
		slot8 = slot0._strike
		slot9 = true

		slot7(slot8, slot9)

		slot7 = SetActive
		slot8 = slot0._discountInfo
		slot9 = true

		slot7(slot8, slot9)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 142-153, warpins: 1 ---
		slot7 = SetActive
		slot8 = slot0._discountDate
		slot9 = false

		slot7(slot8, slot9)

		slot7 = SetActive
		slot8 = slot0._strike
		slot9 = false

		slot7(slot8, slot9)

		slot7 = SetActive
		slot8 = slot0._discountInfo
		slot9 = false

		slot7(slot8, slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 154-157, warpins: 2 ---
	slot7 = slot0.settings
	slot7 = slot7.hideNo

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 158-158, warpins: 1 ---
		slot7 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 159-162, warpins: 2 ---
	slot8 = slot0.settings
	slot8 = slot8.hideYes

	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 163-163, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 164-167, warpins: 2 ---
	slot9 = slot0.settings
	slot9 = slot9.modal

	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 168-168, warpins: 1 ---
		slot9 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 169-172, warpins: 2 ---
	slot10 = slot0.settings
	slot10 = slot10.onNo

	if not slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 173-173, warpins: 1 ---
		function slot10()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-1, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 174-175, warpins: 2 ---
	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 176-182, warpins: 1 ---
		slot11 = onButton
		slot12 = slot0
		slot13 = slot0._go

		function slot14()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			slot0 = slot0
			slot0 = slot0.settings
			slot0 = slot0.onClose

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-10, warpins: 1 ---
				slot0 = slot0
				slot0 = slot0.settings
				slot0 = slot0.onClose

				slot0()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-12, warpins: 1 ---
				slot0 = slot1

				slot0()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 13-17, warpins: 2 ---
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hide

			slot0(slot1)

			return
			--- END OF BLOCK #1 ---



		end

		slot15 = SFX_CANCEL

		slot11(slot12, slot13, slot14, slot15)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 183-185, warpins: 1 ---
		slot11 = removeOnButton
		slot12 = slot0._go

		slot11(slot12)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 186-188, warpins: 2 ---
	slot11, slot12 = nil

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 189-195, warpins: 1 ---
		slot14 = slot0
		slot13 = slot0.createBtn
		slot15 = {}
		slot16 = slot0.settings
		slot16 = slot16.noText

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 196-197, warpins: 1 ---
			slot16 = slot1
			slot16 = slot16.TEXT_CANCEL
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 198-202, warpins: 2 ---
		slot15.text = slot16
		slot16 = slot0.settings
		slot16 = slot16.noBtnType

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 203-204, warpins: 1 ---
			slot16 = slot1
			slot16 = slot16.BUTTON_GRAY
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 205-209, warpins: 2 ---
		slot15.btnType = slot16
		slot15.onCallback = slot10
		slot16 = slot1.noSound

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 210-210, warpins: 1 ---
			slot16 = SFX_CANCEL
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 211-213, warpins: 2 ---
		slot15.sound = slot16
		slot13 = slot13(slot14, slot15)
		slot11 = slot13
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 214-215, warpins: 2 ---
	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 216-222, warpins: 1 ---
		slot14 = slot0
		slot13 = slot0.createBtn
		slot15 = {}
		slot16 = slot0.settings
		slot16 = slot16.yesText

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 223-224, warpins: 1 ---
			slot16 = slot1
			slot16 = slot16.TEXT_CONFIRM
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 225-229, warpins: 2 ---
		slot15.text = slot16
		slot16 = slot0.settings
		slot16 = slot16.yesBtnType

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 230-231, warpins: 1 ---
			slot16 = slot1
			slot16 = slot16.BUTTON_BLUE
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 232-236, warpins: 2 ---
		slot15.btnType = slot16
		slot16 = slot0.settings
		slot16 = slot16.onYes

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 237-237, warpins: 1 ---
			function slot16()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-1, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 238-241, warpins: 2 ---
		slot15.onCallback = slot16
		slot16 = slot1.yesSound

		if not slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 242-242, warpins: 1 ---
			slot16 = SFX_CONFIRM
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 243-245, warpins: 2 ---
		slot15.sound = slot16
		slot13 = slot13(slot14, slot15)
		slot12 = slot13
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 246-249, warpins: 2 ---
	slot13 = slot0.settings
	slot13 = slot13.yseBtnLetf

	if slot13 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 250-252, warpins: 1 ---
		slot14 = slot12
		slot13 = slot12.SetAsFirstSibling

		slot13(slot14)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 253-258, warpins: 2 ---
	slot13 = nil
	slot14 = slot0.settings
	slot14 = slot14.type
	slot15 = MSGBOX_TYPE_HELP

	if slot14 == slot15 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 259-263, warpins: 1 ---
		slot14 = slot0.settings
		slot14 = slot14.helps
		slot14 = slot14.pageMode

		if slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 264-269, warpins: 1 ---
			slot14 = slot0.settings
			slot14 = slot14.helps
			slot14 = #slot14
			slot15 = 1

			if slot14 > slot15 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 270-283, warpins: 1 ---
				slot15 = slot0
				slot14 = slot0.createBtn
				slot16 = {
					noQuit = true
				}
				slot17 = slot1
				slot17 = slot17.BUTTON_PREPAGE
				slot16.btnType = slot17

				function slot17()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.prePage

					slot0(slot1)

					return
					--- END OF BLOCK #0 ---



				end

				slot16.onCallback = slot17
				slot17 = SFX_CANCEL
				slot16.sound = slot17

				slot14(slot15, slot16)

				slot14 = slot0.settings
				slot14 = slot14.helps
				slot13 = #slot14
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 284-287, warpins: 4 ---
	slot14 = slot0.settings
	slot14 = slot14.custom

	if slot14 ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 288-292, warpins: 1 ---
		slot14 = ipairs
		slot15 = slot0.settings
		slot15 = slot15.custom
		slot14, slot15, slot16 = slot14(slot15)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 293-298, warpins: 0 ---
		for slot17, slot18 in slot14, slot15, slot16 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 293-296, warpins: 1 ---
			slot20 = slot0
			slot19 = slot0.createBtn
			slot21 = slot18

			slot19(slot20, slot21)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 297-298, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #17 299-300, warpins: 2 ---
	if not slot13 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 301-301, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 302-304, warpins: 1 ---
		slot14 = 1

		if slot13 > slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 305-315, warpins: 1 ---
			slot15 = slot0
			slot14 = slot0.createBtn
			slot16 = {
				noQuit = true
			}
			slot17 = slot1
			slot17 = slot17.BUTTON_NEXTPAGE
			slot16.btnType = slot17

			function slot17()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.nextPage

				slot0(slot1)

				return
				--- END OF BLOCK #0 ---



			end

			slot16.onCallback = slot17
			slot17 = SFX_CONFIRM
			slot16.sound = slot17

			slot14(slot15, slot16)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 316-330, warpins: 3 ---
	slot14 = setActive
	slot15 = slot0._closeBtn
	slot16 = slot1.hideClose
	slot16 = not slot16

	slot14(slot15, slot16)

	slot14 = onButton
	slot15 = slot0
	slot16 = slot0._closeBtn

	function slot17()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.settings
		slot0 = slot0.onClose
		slot1 = print
		slot2 = "点击3"

		slot1(slot2)

		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.hide

		slot1(slot2)

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-15, warpins: 1 ---
			slot1 = slot0

			slot1()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-17, warpins: 1 ---
			slot1 = slot1

			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-18, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot18 = SFX_CANCEL

	slot14(slot15, slot16, slot17, slot18)

	slot14 = slot0.settings
	slot14 = slot14.title

	if not slot14 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 331-332, warpins: 1 ---
		slot14 = slot1
		slot14 = slot14.TITLE_INFORMATION
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 333-336, warpins: 2 ---
	slot15 = 0
	slot16 = slot0._titleList
	slot16 = slot16.transform
	slot16 = slot16.childCount

	--- END OF BLOCK #19 ---

	FLOW; TARGET BLOCK #20



	-- Decompilation error in this vicinity:
	--- BLOCK #20 337-338, warpins: 2 ---
	--- END OF BLOCK #20 ---

	FLOW; TARGET BLOCK #21



	-- Decompilation error in this vicinity:
	--- BLOCK #21 339-357, warpins: 0 ---
	while slot15 < slot16 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 339-339, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 340-350, warpins: 1 ---
		slot17 = slot0._titleList
		slot17 = slot17.transform
		slot18 = slot17
		slot17 = slot17.GetChild
		slot19 = slot15
		slot17 = slot17(slot18, slot19)
		slot18 = SetActive
		slot19 = slot17
		slot20 = slot17.name

		if slot20 ~= slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 351-352, warpins: 1 ---
			slot20 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 353-353, warpins: 1 ---
			slot20 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 354-356, warpins: 2 ---
		slot18(slot19, slot20)

		slot15 = slot15 + 1
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 357-357, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #21 ---

	FLOW; TARGET BLOCK #22



	-- Decompilation error in this vicinity:
	--- BLOCK #22 357-368, warpins: 1 ---
	slot17 = slot0._go
	slot17 = slot17.transform
	slot17 = slot17.localPosition
	slot18 = slot0._go
	slot18 = slot18.transform
	slot19 = Vector3
	slot20 = slot17.x
	slot21 = slot17.y
	slot22 = slot0.settings
	slot22 = slot22.zIndex

	if not slot22 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 369-369, warpins: 1 ---
		slot22 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #22 ---

	FLOW; TARGET BLOCK #23



	-- Decompilation error in this vicinity:
	--- BLOCK #23 370-374, warpins: 2 ---
	slot19 = slot19(slot20, slot21, slot22)
	slot18.localPosition = slot19
	slot18 = slot0._helpPanel

	if slot18 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 375-379, warpins: 1 ---
		slot18 = setActive
		slot19 = slot0._helpPanel
		slot20 = slot0.settings
		slot20 = slot20.helps

		slot18(slot19, slot20)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #23 ---

	FLOW; TARGET BLOCK #24



	-- Decompilation error in this vicinity:
	--- BLOCK #24 380-382, warpins: 2 ---
	slot18 = slot0._sliders

	if slot18 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 383-386, warpins: 1 ---
		slot18 = setActive
		slot19 = slot0._sliders
		slot20 = true

		slot18(slot19, slot20)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #24 ---

	FLOW; TARGET BLOCK #25



	-- Decompilation error in this vicinity:
	--- BLOCK #25 387-388, warpins: 2 ---
	return
	--- END OF BLOCK #25 ---



end

slot1.commonSetting = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot1.btnType

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		slot2 = slot0
		slot2 = slot2.BUTTON_BLUE
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-8, warpins: 2 ---
	slot3 = slot1.onCallback

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-9, warpins: 1 ---
		function slot3()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-1, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-25, warpins: 2 ---
	slot4 = slot1.noQuit
	slot5 = slot0._go
	slot5 = slot5.transform
	slot6 = slot5
	slot5 = slot5.Find
	slot7 = "window/custom_button_"
	slot8 = slot2
	slot7 = slot7 .. slot8
	slot5 = slot5(slot6, slot7)
	slot6 = cloneTplTo
	slot7 = slot5
	slot8 = slot0._btnContainer
	slot6 = slot6(slot7, slot8)
	slot7 = slot1.label

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-30, warpins: 1 ---
		slot7 = go
		slot8 = slot6
		slot7 = slot7(slot8)
		slot8 = slot1.label
		slot7.name = slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-37, warpins: 2 ---
	slot7 = SetActive
	slot8 = slot6
	slot9 = true

	slot7(slot8, slot9)

	slot7 = slot1.scale

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-41, warpins: 1 ---
		slot7 = slot1.scale
		slot7 = slot7.x

		if not slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-42, warpins: 1 ---
			slot7 = 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 43-46, warpins: 2 ---
		slot8 = slot1.scale
		slot8 = slot8.y

		if not slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-47, warpins: 1 ---
			slot8 = 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 48-52, warpins: 2 ---
		slot9 = Vector2
		slot10 = slot7
		slot11 = slot8
		slot9 = slot9(slot10, slot11)
		slot6.localScale = slot9
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 53-56, warpins: 2 ---
	slot7 = slot0
	slot7 = slot7.BUTTON_MEDAL

	if slot2 == slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-64, warpins: 1 ---
		slot7 = setText
		slot9 = slot6
		slot8 = slot6.Find
		slot10 = "text"
		slot8 = slot8(slot9, slot10)
		slot9 = slot1.text

		slot7(slot8, slot9)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 65-68, warpins: 1 ---
		slot7 = slot0
		slot7 = slot7.BUTTON_RETREAT

		if slot2 ~= slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 69-72, warpins: 1 ---
			slot7 = slot0
			slot7 = slot7.BUTTON_PREPAGE

			if slot2 ~= slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 73-76, warpins: 1 ---
				slot7 = slot0
				slot7 = slot7.BUTTON_NEXTPAGE

				if slot2 ~= slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 77-81, warpins: 1 ---
					slot8 = slot0
					slot7 = slot0.updateButton
					slot9 = slot6
					slot10 = slot1.text

					slot7(slot8, slot9, slot10)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 82-84, warpins: 5 ---
	slot7 = slot1.hideEvent

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-91, warpins: 1 ---
		slot7 = onButton
		slot8 = slot0
		slot9 = slot6

		function slot10()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			slot0 = type
			slot1 = slot0
			slot0 = slot0(slot1)

			if slot0 == "function" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-9, warpins: 1 ---
				slot0 = slot0
				slot0 = slot0()

				if not slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 10-19, warpins: 1 ---
					slot0 = SetActive
					slot1 = slot1
					slot1 = slot1._go
					slot2 = false

					slot0(slot1, slot2)

					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.Clear

					slot0(slot1)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-21, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 22-24, warpins: 1 ---
				slot0 = slot0

				if not slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 25-33, warpins: 1 ---
					slot0 = SetActive
					slot1 = slot1
					slot1 = slot1._go
					slot2 = false

					slot0(slot1, slot2)

					slot0 = slot1
					slot1 = slot0
					slot0 = slot0.Clear

					slot0(slot1)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 34-36, warpins: 4 ---
			slot0 = slot2

			slot0()

			return
			--- END OF BLOCK #1 ---



		end

		slot11 = slot1.sound

		if not slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 92-92, warpins: 1 ---
			slot11 = SFX_CONFIRM
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 93-93, warpins: 2 ---
		slot7(slot8, slot9, slot10, slot11)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 94-96, warpins: 2 ---
	slot7 = slot1.sibling

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 97-100, warpins: 1 ---
		slot8 = slot6
		slot7 = slot6.SetSiblingIndex
		slot9 = slot1.sibling

		slot7(slot8, slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 101-102, warpins: 2 ---
	return slot6
	--- END OF BLOCK #7 ---



end

slot1.createBtn = slot10

function slot10(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot3 = slot0
	slot3 = slot3[slot2]
	slot5 = slot1
	slot4 = slot1.Find
	slot6 = "pic"
	slot4 = slot4(slot5, slot6)
	slot5 = IsNil
	slot6 = slot4
	slot5 = slot5(slot6)

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-12, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-14, warpins: 2 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-21, warpins: 1 ---
		slot5 = setText
		slot6 = slot4
		slot7 = i18n
		slot8 = slot3

		slot5(slot6, slot7(slot8))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-28, warpins: 1 ---
		slot5 = string
		slot5 = slot5.len
		slot6 = slot2
		slot5 = slot5(slot6)
		slot6 = 12

		if slot5 > slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-36, warpins: 1 ---
			slot5 = GetComponent
			slot6 = slot4
			slot7 = typeof
			slot8 = Text
			slot5 = slot5(slot6, slot7(slot8))
			slot6 = true
			slot5.resizeTextForBestFit = slot6
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 37-40, warpins: 2 ---
		slot5 = setText
		slot6 = slot4
		slot7 = slot2

		slot5(slot6, slot7)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-41, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot1.updateButton = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot1.parent

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-10, warpins: 1 ---
		slot2 = setParent
		slot3 = slot0._tf
		slot4 = slot1.parent

		slot2(slot3, slot4)

		slot2 = slot1.canvasOrder

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-21, warpins: 1 ---
			slot2 = GetComponent
			slot3 = slot0._tf
			slot4 = typeof
			slot5 = Canvas
			slot2 = slot2(slot3, slot4(slot5))
			slot3 = slot2.sortingOrder
			slot0.originCanvasOrder = slot3
			slot3 = slot1.canvasOrder
			slot2.sortingOrder = slot3
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-37, warpins: 1 ---
		slot2 = slot0
		slot2 = slot2.UIMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.BlurPanel
		slot4 = slot0._tf
		slot5 = false
		slot6 = {}
		slot7 = slot1.groupName
		slot6.groupName = slot7
		slot7 = slot1.weight
		slot6.weight = slot7
		slot7 = slot1.blurLevelCamera
		slot6.blurLevelCamera = slot7

		slot2(slot3, slot4, slot5, slot6)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 38-45, warpins: 3 ---
	slot2 = slot0
	slot2 = slot2.m02
	slot3 = slot2
	slot2 = slot2.sendNotification
	slot4 = GAME
	slot4 = slot4.OPEN_MSGBOX_DONE

	slot2(slot3, slot4)

	return
	--- END OF BLOCK #1 ---



end

slot1.Loaded = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-60, warpins: 1 ---
	slot1 = rtf
	slot2 = slot0._window
	slot1 = slot1(slot2)
	slot2 = slot0._defaultSize
	slot1.sizeDelta = slot2
	slot1 = rtf
	slot2 = slot0._helpPanel
	slot1 = slot1(slot2)
	slot2 = slot0._defaultHelpSize
	slot1.sizeDelta = slot2
	slot1 = setAnchoredPosition
	slot2 = slot0._window
	slot3 = {
		x = 0,
		y = 0
	}

	slot1(slot2, slot3)

	slot1 = setAnchoredPosition
	slot2 = slot0._btnContainer
	slot3 = {
		x = 0,
		y = 0
	}

	slot1(slot2, slot3)

	slot1 = setAnchoredPosition
	slot2 = slot0._helpPanel
	slot3 = {}
	slot4 = slot0._defaultHelpPos
	slot4 = slot4.x
	slot3.x = slot4
	slot4 = slot0._defaultHelpPos
	slot4 = slot4.y
	slot3.y = slot4

	slot1(slot2, slot3)

	slot1 = GetComponent
	slot2 = slot0._helpPanel
	slot3 = typeof
	slot4 = ScrollRect
	slot1 = slot1(slot2, slot3(slot4))
	slot2 = true
	slot1.enabled = slot2
	slot2 = setActive
	slot3 = slot0._top
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._window
	slot5 = "bg"
	slot3 = slot3(slot4, slot5)
	slot4 = true

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = findTF
	slot4 = slot0._sigleItemPanel
	slot5 = "icon_bg/own"
	slot3 = slot3(slot4, slot5)
	slot4 = false

	slot2(slot3, slot4)

	slot2 = 0
	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot3 = slot3 - 1
	slot4 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 61-78, warpins: 0 ---
	for slot5 = slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-78, warpins: 2 ---
		slot6 = slot0._helpList
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = slot5
		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.Find
		slot8 = "icon"
		slot6 = slot6(slot7, slot8)
		slot7 = slot6
		slot6 = slot6.GetComponent
		slot8 = typeof
		slot9 = Image
		slot6 = slot6(slot7, slot8(slot9))
		slot7 = nil
		slot6.sprite = slot7
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 79-83, warpins: 1 ---
	slot2 = slot0._scrollTxts
	slot2 = #slot2
	slot3 = 1
	slot4 = -1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 84-98, warpins: 0 ---
	for slot5 = slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 84-87, warpins: 2 ---
		slot6 = slot0._scrollTxts
		slot6 = slot6[slot5]

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 88-97, warpins: 1 ---
			slot6 = slot0._scrollTxts
			slot6 = slot6[slot5]
			slot7 = slot6
			slot6 = slot6.destroy

			slot6(slot7)

			slot6 = table
			slot6 = slot6.remove
			slot7 = slot0._scrollTxts
			slot8 = slot5

			slot6(slot7, slot8)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 98-98, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 99-102, warpins: 1 ---
	slot2 = pairs
	slot3 = slot0.pools
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 103-114, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 103-104, warpins: 1 ---
		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 105-112, warpins: 1 ---
			slot7 = PoolMgr
			slot7 = slot7.GetInstance
			slot7 = slot7()
			slot8 = slot7
			slot7 = slot7.ReturnUI
			slot9 = slot6.name
			slot10 = slot6

			slot7(slot8, slot9, slot10)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 113-114, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 115-120, warpins: 1 ---
	slot2 = {}
	slot0.pools = slot2
	slot2 = pairs
	slot3 = slot0.timers
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 121-125, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 121-123, warpins: 1 ---
		slot8 = slot6
		slot7 = slot6.Stop

		slot7(slot8)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 124-125, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 126-138, warpins: 1 ---
	slot2 = {}
	slot0.timers = slot2
	slot2 = slot0
	slot2 = slot2.DelegateInfo
	slot2 = slot2.Dispose
	slot3 = slot0

	slot2(slot3)

	slot2 = slot0._btnContainer
	slot2 = slot2.childCount
	slot3 = 1
	slot4 = slot2
	slot5 = 1

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 139-147, warpins: 0 ---
	for slot6 = slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 139-147, warpins: 2 ---
		slot7 = slot0._btnContainer
		slot8 = slot7
		slot7 = slot7.GetChild
		slot9 = 0
		slot7 = slot7(slot8, slot9)
		slot8 = Destroy
		slot9 = slot7

		slot8(slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 148-150, warpins: 1 ---
	slot3 = slot0.settings

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 151-154, warpins: 1 ---
		slot3 = slot0.settings
		slot3 = slot3.parent

		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 155-167, warpins: 1 ---
			slot3 = setParent
			slot4 = slot0._tf
			slot5 = slot0
			slot5 = slot5.UIMgr
			slot5 = slot5.GetInstance
			slot5 = slot5()
			slot5 = slot5.OverlayMain
			slot6 = false

			slot3(slot4, slot5, slot6)

			slot3 = slot0.settings
			slot3 = slot3.canvasOrder

			if slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 168-176, warpins: 1 ---
				slot3 = GetComponent
				slot4 = slot0._tf
				slot5 = typeof
				slot6 = Canvas
				slot3 = slot3(slot4, slot5(slot6))
				slot4 = slot0.originCanvasOrder
				slot3.sortingOrder = slot4
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 177-189, warpins: 2 ---
		slot3 = slot0
		slot3 = slot3.UIMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.UnblurPanel
		slot5 = slot0._tf
		slot6 = slot0
		slot6 = slot6.UIMgr
		slot6 = slot6.GetInstance
		slot6 = slot6()
		slot6 = slot6.OverlayMain

		slot3(slot4, slot5, slot6)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 190-192, warpins: 3 ---
	slot3 = slot0.contentText

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 193-196, warpins: 1 ---
		slot3 = slot0.contentText
		slot4 = slot3
		slot3 = slot3.RemoveAllListeners

		slot3(slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 197-201, warpins: 2 ---
	slot3 = nil
	slot0.settings = slot3
	slot3 = false
	slot0.enable = slot3

	return
	--- END OF BLOCK #12 ---



end

slot1.Clear = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot1.type

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot2 = MSGBOX_TYPE_NORMAL
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-7, warpins: 2 ---
	slot3 = MSGBOX_TYPE_NORMAL

	if slot2 == slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-12, warpins: 1 ---
		slot3 = slot0
		slot4 = slot0
		slot5 = slot1

		slot3(slot4, slot5)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-15, warpins: 1 ---
		slot3 = MSGBOX_TYPE_INPUT

		if slot2 == slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-20, warpins: 1 ---
			slot3 = slot1
			slot4 = slot0
			slot5 = slot1

			slot3(slot4, slot5)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-23, warpins: 1 ---
			slot3 = MSGBOX_TYPE_SINGLE_ITEM

			if slot2 == slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-28, warpins: 1 ---
				slot3 = slot2
				slot4 = slot0
				slot5 = slot1

				slot3(slot4, slot5)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 29-31, warpins: 1 ---
				slot3 = MSGBOX_TYPE_EXCHANGE

				if slot2 == slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 32-36, warpins: 1 ---
					slot3 = slot3
					slot4 = slot0
					slot5 = slot1

					slot3(slot4, slot5)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-39, warpins: 1 ---
					slot3 = MSGBOX_TYPE_DROP_ITEM

					if slot2 == slot3 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 40-44, warpins: 1 ---
						slot3 = slot4
						slot4 = slot0
						slot5 = slot1

						slot3(slot4, slot5)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 45-47, warpins: 1 ---
						slot3 = MSGBOX_TYPE_ITEM_BOX

						if slot2 == slot3 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 48-52, warpins: 1 ---
							slot3 = slot5
							slot4 = slot0
							slot5 = slot1

							slot3(slot4, slot5)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 53-55, warpins: 1 ---
							slot3 = MSGBOX_TYPE_HELP

							if slot2 == slot3 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 56-60, warpins: 1 ---
								slot3 = slot6
								slot4 = slot0
								slot5 = slot1

								slot3(slot4, slot5)
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 61-63, warpins: 1 ---
								slot3 = MSGBOX_TYPE_SECONDPWD

								if slot2 == slot3 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 64-72, warpins: 1 ---
									slot3 = PoolMgr
									slot3 = slot3.GetInstance
									slot3 = slot3()
									slot4 = slot3
									slot3 = slot3.GetUI
									slot5 = "Msgbox4SECPWD"
									slot6 = true

									function slot7(slot0)

										-- Decompilation error in this vicinity:
										--- BLOCK #0 1-7, warpins: 1 ---
										slot1 = slot0
										slot1 = slot1.pools
										slot1.SedondaryUI = slot0
										slot1 = slot1
										slot1 = slot1.onPreShow

										if slot1 then

											-- Decompilation error in this vicinity:
											--- BLOCK #0 8-10, warpins: 1 ---
											slot1 = slot1
											slot1 = slot1.onPreShow

											slot1()
											--- END OF BLOCK #0 ---



										end

										--- END OF BLOCK #0 ---

										FLOW; TARGET BLOCK #1



										-- Decompilation error in this vicinity:
										--- BLOCK #1 11-23, warpins: 2 ---
										slot1 = slot1
										slot1.secondaryUI = slot0
										slot1 = SetParent
										slot2 = slot0
										slot3 = slot0
										slot3 = slot3._sliders
										slot4 = false

										slot1(slot2, slot3, slot4)

										slot1 = showSecondaryPassword
										slot2 = slot0
										slot3 = slot1

										slot1(slot2, slot3)

										return
										--- END OF BLOCK #1 ---



									end

									slot3(slot4, slot5, slot6, slot7)
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
	--- BLOCK #2 73-78, warpins: 9 ---
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.SetAsLastSibling

	slot3(slot4)

	return
	--- END OF BLOCK #2 ---



end

slot1.ShowMsgBox = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.enable

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-20, warpins: 2 ---
	slot1 = slot0._go
	slot2 = slot1
	slot1 = slot1.SetActive
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.Clear

	slot1(slot2)

	slot1 = slot0
	slot1 = slot1.m02
	slot2 = slot1
	slot1 = slot1.sendNotification
	slot3 = GAME
	slot3 = slot3.CLOSE_MSGBOX_DONE

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #1 ---



end

slot1.hide = slot10

return
