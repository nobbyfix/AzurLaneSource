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

function slot2(slot0, slot1)
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
		slot2 = slot1
		slot1 = slot1.GetInstance
		slot1 = slot1(slot2)
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
		slot2 = rtf
		slot3 = slot0
		slot3 = slot3._window
		slot2 = slot2(slot3)
		slot3 = slot0
		slot3 = slot3._defaultSize
		slot2.sizeDelta = slot3
		slot2 = rtf
		slot3 = slot0
		slot3 = slot3._helpPanel
		slot2 = slot2(slot3)
		slot3 = slot0
		slot3 = slot3._defaultHelpSize
		slot2.sizeDelta = slot3
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

slot1.Init = slot2

function slot2(slot0)
	slot1 = slot0._go

	return slot1
end

slot1.getMsgBoxOb = slot2

function slot2(slot0, slot1)
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

function slot3(slot0, slot1)
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

function slot4(slot0, slot1)
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

							slot4 = setText
							slot6 = slot0._tf
							slot5 = slot0._tf.Find
						end
					end
				end
			end
		end
	end

	slot7 = "window/exchange_ship_panel/name_mode/name/name"
	slot5 = slot5(slot6, slot7)
	slot6 = getText
	slot7 = slot0._tf
	slot8 = slot7
	slot7 = slot7.Find
	slot9 = "window/exchange_ship_panel/name_mode/name"

	slot4(slot5, slot6(slot7(slot8, slot9)))

	slot4 = slot0
	slot4 = slot4.ship_data_statistics
	slot5 = slot1.drop
	slot5 = slot5.id
	slot4 = slot4[slot5]
	slot4 = slot4.skin_id
	slot5 = Ship
	slot5 = slot5.getWords
	slot6 = slot4
	slot7 = "drop_descrip"
	slot5 = slot5(slot6, slot7)
	slot6 = setText
	slot7 = slot2

	if not slot5 then
		slot8 = i18n
		slot9 = "ship_drop_desc_default"
		slot8 = slot8(slot9)
	end

	slot6(slot7, slot8)

	slot6 = slot1.intro

	if slot6 then
		slot6 = setText
		slot7 = slot2
		slot8 = slot1.intro

		slot6(slot7, slot8)
	end

	slot6 = slot1.enabelYesBtn

	if slot6 ~= nil then
		slot6 = slot0._btnContainer
		slot7 = slot6
		slot6 = slot6.GetChild
		slot8 = 1
		slot6 = slot6(slot7, slot8)
		slot7 = setButtonEnabled
		slot8 = slot6
		slot9 = slot1.enabelYesBtn

		slot7(slot8, slot9)

		slot7 = eachChild
		slot8 = slot6

		function slot9(slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end

		slot7(slot8, slot9)
	end

	slot6 = slot1.show_medal

	if slot6 then
		slot7 = slot0
		slot6 = slot0.createBtn
		slot8 = {
			sibling = 0,
			hideEvent = true
		}
		slot9 = slot1.show_medal
		slot9 = slot9.desc
		slot8.text = slot9
		slot9 = slot1
		slot9 = slot9.BUTTON_MEDAL
		slot8.btnType = slot9
		slot9 = SFX_UI_BUILDING_EXCHANGE
		slot8.sound = slot9

		slot6(slot7, slot8)
	end

	slot7 = slot0
	slot6 = slot0.Loaded
	slot8 = slot1

	slot6(slot7, slot8)
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

	slot2 = findTF(slot0._sigleItemPanel, "name_mode/name")

	setText(slot6, "")
	SetActive(slot7, false)
	SetActive(slot2.parent, true)
	SetActive(slot2, true)
	SetActive(slot5, true)
	setFrame(slot4, slot1.frame or 1)
	setText(slot2, slot1.name or "")
	setText(findTF(slot0._sigleItemPanel, "name_mode/intro_view/Viewport/Content/intro"), slot1.content or "")

	slot8 = SetActive
	slot9 = findTF(slot0._sigleItemPanel, "icon_bg/icon").parent
	slot10 = slot1.sprite

	slot8(slot9, slot10)

	slot8 = slot1.sprite

	if slot8 then
		slot8 = setImageSprite
		slot9 = slot3
		slot10 = slot1.sprite
		slot11 = false

		slot8(slot9, slot10, slot11)
	end

	slot9 = slot0
	slot8 = slot0.Loaded
	slot10 = slot1

	slot8(slot9, slot10)
end

function slot7(slot0, slot1)
	slot2 = slot0.singleItemIntros
	slot2 = slot2[slot1]

	if not slot2 then
		slot2 = slot0.singleItemIntros
		slot3 = cloneTplTo
		slot4 = slot0.singleItemIntro
		slot5 = slot0.singleItemIntro
		slot5 = slot5.parent
		slot3 = slot3(slot4, slot5)
		slot2[slot1] = slot3
	end

	slot2 = slot0.singleItemIntros
	slot2 = slot2[slot1]

	return slot2
end

slot1.GetSingleItemIntro = slot7

function slot7(slot0, slot1)
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
		slot6, slot3 = GetOwnedpropCount(slot1.drop)

		setActive(findTF(slot0._sigleItemPanel, "icon_bg/own"), slot3 and slot1.showOwned)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/Text"), slot2)
		setText(findTF(slot0._sigleItemPanel, "icon_bg/own/label"), i18n("word_own1"))
	end

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
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.windowSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultSize
			slot4 = slot4.x
		end

		slot5 = slot1.windowSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultSize
			slot5 = slot5.y
		end

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
	end

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
		slot7 = slot1.drop
		slot7 = slot7.type
		slot8 = DROP_TYPE_RESOURCE

		if slot7 ~= slot8 then
			slot7 = slot1.drop
			slot7 = slot7.type
			slot8 = DROP_TYPE_ITEM

			if slot7 ~= slot8 then
				slot7 = slot1.drop
				slot7 = slot7.type
				slot8 = DROP_TYPE_FURNITURE

				if slot7 ~= slot8 then
					slot7 = slot1.drop
					slot7 = slot7.type
					slot8 = DROP_TYPE_STRATEGY

					if slot7 ~= slot8 then
						slot5(slot6, slot1.drop.type == DROP_TYPE_SKIN)
						setActive(slot0._countDescTxt, slot0.settings.numUpdate ~= nil)

						slot7 = setText
						slot8 = slot0._tf:Find("window/single_item_panel/name_mode/name")
						slot9 = HXSet.hxLan
						slot10 = slot1.name

						if not slot10 then
							slot7(slot8, slot9(slot1.drop.cfg.name or ""))

							slot9 = ScrollTxt:changeToScroll(slot6)
							slot8 = ScrollTxt.changeToScroll(slot6).setText
						end
					end
				end
			end
		end
	end

	slot10 = getText
	slot11 = slot6

	slot8(slot9, slot10(slot11))

	slot8 = table
	slot8 = slot8.insert
	slot9 = slot0._scrollTxts
	slot10 = slot7

	slot8(slot9, slot10)

	slot8 = -170
	slot9 = go
	slot10 = slot0._SingleItemshipTypeTF
	slot9 = slot9(slot10)
	slot9 = slot9.activeSelf

	if not slot9 then
		slot8 = -230
	end

	slot10 = setActive
	slot11 = slot0._SingleItemshipTypeBgTF
	slot12 = slot9

	slot10(slot11, slot12)

	slot10 = Vector2
	slot11 = slot8
	slot12 = slot6.localPosition
	slot12 = slot12.y
	slot10 = slot10(slot11, slot12)
	slot6.localPosition = slot10
	slot10 = slot0._tf
	slot11 = slot10
	slot10 = slot10.Find
	slot12 = "window/single_item_panel/detail"
	slot10 = slot10(slot11, slot12)
	slot11 = slot1.drop
	slot11 = slot11.type
	slot12 = DROP_TYPE_ITEM

	if slot11 == slot12 then
		setActive(slot10, slot1.drop.cfg.type == 11)

		if slot1.drop.cfg.type == 11 then
			slot13 = slot10
			slot12 = slot10.GetComponent
			slot14 = "RichText"
			slot12 = slot12(slot13, slot14)
			slot13 = slot12
			slot12 = slot12.AddListener

			function slot14(slot0, slot1)
				slot2 = {}
				slot3 = _
				slot3 = slot3.map
				slot4 = slot0
				slot4 = slot4.drop
				slot4 = slot4.cfg
				slot4 = slot4.display_icon

				function slot5(slot0)
					slot1 = {}
					slot2 = slot0[1]
					slot1.type = slot2
					slot2 = slot0[2]
					slot1.id = slot2

					return slot1
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
					slot1 = slot0
					slot2 = slot1
					slot3 = {
						drop = slot0
					}

					function slot4()
						slot0 = slot0
						slot1 = slot1
						slot2 = slot2

						slot0(slot1, slot2)
					end

					slot3.onYes = slot4

					function slot4()
						slot0 = slot0
						slot1 = slot1
						slot2 = slot2

						slot0(slot1, slot2)
					end

					slot3.onNo = slot4

					slot1(slot2, slot3)
				end

				slot2.itemFunc = slot3

				function slot3()
					slot0 = slot0
					slot1 = slot1
					slot2 = slot2

					slot0(slot1, slot2)
				end

				slot2.onYes = slot3
				slot3 = slot2.onYes
				slot2.onNo = slot3
				slot3 = slot3
				slot4 = slot2
				slot5 = slot2

				slot3(slot4, slot5)
			end

			slot12(slot13, slot14)
		end
	end

	slot12 = slot1.content

	if slot12 then
		slot12 = slot1.content

		if slot12 ~= "" then
			slot12 = slot0.singleItemIntroTF
			slot13 = slot1.content
			slot12.text = slot13
		end
	else
		slot12 = slot1.drop
		slot12 = slot12.type
		slot13 = DROP_TYPE_RESOURCE

		if slot12 == slot13 then
			slot12 = setText
			slot13 = slot3
			slot14 = slot1.drop
			slot14 = slot14.cfg
			slot14 = slot14.display

			slot12(slot13, slot14)
		else
			slot12 = slot1.drop
			slot12 = slot12.type
			slot13 = DROP_TYPE_ITEM

			if slot12 == slot13 then
				slot12 = setText
				slot13 = slot3
				slot14 = HXSet
				slot14 = slot14.hxLan
				slot15 = slot1.drop
				slot15 = slot15.cfg
				slot15 = slot15.display

				slot12(slot13, slot14(slot15))
			else
				slot12 = slot1.drop
				slot12 = slot12.type
				slot13 = DROP_TYPE_FURNITURE

				if slot12 == slot13 then
					slot12 = setText
					slot13 = slot3
					slot14 = slot1.drop
					slot14 = slot14.cfg
					slot14 = slot14.describe

					slot12(slot13, slot14)
				else
					slot12 = slot1.drop
					slot12 = slot12.type
					slot13 = DROP_TYPE_SHIP

					if slot12 == slot13 then
						slot12 = slot2
						slot12 = slot12.ship_data_statistics
						slot13 = slot1.drop
						slot13 = slot13.id
						slot12 = slot12[slot13]
						slot12 = slot12.skin_id
						slot13 = Ship
						slot13 = slot13.getWords
						slot14 = slot12
						slot15 = "drop_descrip"
						slot13 = slot13(slot14, slot15)
						slot14 = setText
						slot15 = slot3

						if not slot13 then
							slot16 = i18n
							slot17 = "ship_drop_desc_default"
							slot16 = slot16(slot17)
						end

						slot14(slot15, slot16)
					else
						slot12 = slot1.drop
						slot12 = slot12.type
						slot13 = DROP_TYPE_EQUIP

						if slot12 == slot13 then
							slot12 = 1
							slot13 = 4
							slot14 = 1

							for slot15 = slot12, slot13, slot14 do
								slot17 = slot2
								slot16 = slot2.GetChild
								slot18 = slot15 - 1
								slot16 = slot16(slot17, slot18)
								slot17 = slot1.drop
								slot17 = slot17.cfg
								slot18 = "attribute_"
								slot19 = slot15
								slot18 = slot18 .. slot19
								slot17 = slot17[slot18]
								slot18 = setActive
								slot20 = slot16
								slot19 = slot16.Find
								slot21 = "opend"
								slot19 = slot19(slot20, slot21)
								slot20 = slot17

								slot18(slot19, slot20)

								slot18 = setActive
								slot20 = slot16
								slot19 = slot16.Find
								slot21 = "attrLockTpl"
								slot19 = slot19(slot20, slot21)
								slot20 = not slot17

								slot18(slot19, slot20)

								if slot17 then
									slot18 = setText
									slot20 = slot16
									slot19 = slot16.Find
									slot21 = "opend/type_name"
									slot19 = slot19(slot20, slot21)
									slot20 = AttributeType
									slot20 = slot20.Type2Name
									slot21 = slot17

									slot18(slot19, slot20(slot21))

									slot18 = setText
									slot20 = slot16
									slot19 = slot16.Find
									slot21 = "opend/value"
									slot19 = slot19(slot20, slot21)
									slot20 = slot1.drop
									slot20 = slot20.cfg
									slot21 = "value_"
									slot22 = slot15
									slot21 = slot21 .. slot22
									slot20 = slot20[slot21]

									slot18(slot19, slot20)
								end
							end
						else
							slot12 = slot1.drop
							slot12 = slot12.type
							slot13 = DROP_TYPE_STRATEGY

							if slot12 == slot13 then
								slot12 = setText
								slot13 = slot3
								slot14 = slot1.drop
								slot14 = slot14.cfg
								slot14 = slot14.desc

								slot12(slot13, slot14)

								slot12 = slot1.extendDesc

								if slot12 then
									slot4 = slot4 + 1
									slot12 = setText
									slot14 = slot0
									slot13 = slot0.GetSingleItemIntro
									slot15 = slot4
									slot13 = slot13(slot14, slot15)
									slot14 = slot1.extendDesc

									slot12(slot13, slot14)
								end
							else
								slot12 = slot1.drop
								slot12 = slot12.type
								slot13 = DROP_TYPE_SKIN

								if slot12 == slot13 then
									slot12 = setText
									slot13 = slot3
									slot14 = slot1.drop
									slot14 = slot14.cfg
									slot14 = slot14.desc

									slot12(slot13, slot14)
								else
									slot12 = slot1.drop
									slot12 = slot12.type
									slot13 = DROP_TYPE_EQUIPMENT_SKIN

									if slot12 == slot13 then
										slot12 = slot1.drop
										slot12 = slot12.cfg
										slot12 = slot12.desc
										slot13 = _
										slot13 = slot13.map
										slot14 = slot1.drop
										slot14 = slot14.cfg
										slot14 = slot14.equip_type

										function slot15(slot0)
											slot1 = EquipType
											slot1 = slot1.Type2Name2
											slot2 = slot0

											return slot1(slot2)
										end

										slot13 = slot13(slot14, slot15)
										slot14 = setText
										slot15 = slot3
										slot16 = slot12
										slot17 = "\n\n"
										slot18 = i18n
										slot19 = "word_fit"
										slot18 = slot18(slot19)
										slot19 = ": "
										slot20 = table
										slot20 = slot20.concat
										slot21 = slot13
										slot22 = ","
										slot20 = slot20(slot21, slot22)
										slot16 = slot16 .. slot17 .. slot18 .. slot19 .. slot20

										slot14(slot15, slot16)
									else
										slot12 = slot1.drop
										slot12 = slot12.type
										slot13 = DROP_TYPE_VITEM

										if slot12 == slot13 then
											slot12 = setText
											slot13 = slot3
											slot14 = HXSet
											slot14 = slot14.hxLan
											slot15 = slot1.drop
											slot15 = slot15.cfg
											slot15 = slot15.display

											slot12(slot13, slot14(slot15))
										else
											slot12 = slot1.drop
											slot12 = slot12.type
											slot13 = DROP_TYPE_WORLD_ITEM

											if slot12 == slot13 then
												slot12 = setText
												slot13 = slot3
												slot14 = HXSet
												slot14 = slot14.hxLan
												slot15 = slot1.drop
												slot15 = slot15.cfg
												slot15 = slot15.display

												slot12(slot13, slot14(slot15))
											else
												slot12 = slot1.drop
												slot12 = slot12.type
												slot13 = DROP_TYPE_ICON_FRAME

												if slot12 == slot13 then
													slot12 = setText
													slot13 = slot3
													slot14 = slot1.drop
													slot14 = slot14.cfg
													slot14 = slot14.desc

													slot12(slot13, slot14)
												else
													slot12 = slot1.drop
													slot12 = slot12.type
													slot13 = DROP_TYPE_CHAT_FRAME

													if slot12 == slot13 then
														slot12 = setText
														slot13 = slot3
														slot14 = slot1.drop
														slot14 = slot14.cfg
														slot14 = slot14.desc

														slot12(slot13, slot14)
													else
														slot12 = slot1.drop
														slot12 = slot12.type
														slot13 = DROP_TYPE_EMOJI

														if slot12 == slot13 then
															slot12 = setText
															slot13 = slot3
															slot14 = slot1.drop
															slot14 = slot14.cfg
															slot14 = slot14.item_desc

															slot12(slot13, slot14)
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot12 = slot1.intro

	if slot12 then
		slot12 = setText
		slot13 = slot3
		slot14 = slot1.intro

		slot12(slot13, slot14)
	end

	slot12 = slot1.enabelYesBtn

	if slot12 ~= nil then
		slot12 = slot0._btnContainer
		slot13 = slot12
		slot12 = slot12.GetChild
		slot14 = 1
		slot12 = slot12(slot13, slot14)
		slot13 = setButtonEnabled
		slot14 = slot12
		slot15 = slot1.enabelYesBtn

		slot13(slot14, slot15)

		slot13 = eachChild
		slot14 = slot12

		function slot15(slot0)
			GetOrAddComponent(slot0, typeof(CanvasGroup)).alpha = (slot0.enabelYesBtn and 1) or 0.3
		end

		slot13(slot14, slot15)
	end

	slot12 = ipairs
	slot13 = slot0.singleItemIntros
	slot12, slot13, slot14 = slot12(slot13)

	for slot15, slot16 in slot12, slot13, slot14 do
		setActive(slot16, slot15 <= slot4 and slot5 == nil)
	end

	slot12 = slot1.show_medal

	if slot12 then
		slot13 = slot0
		slot12 = slot0.createBtn
		slot14 = {
			sibling = 0,
			hideEvent = true
		}
		slot15 = slot1.show_medal
		slot15 = slot15.desc
		slot14.text = slot15
		slot15 = slot3
		slot15 = slot15.BUTTON_MEDAL
		slot14.btnType = slot15
		slot15 = SFX_UI_BUILDING_EXCHANGE
		slot14.sound = slot15

		slot12(slot13, slot14)
	end

	slot13 = slot0
	slot12 = slot0.Loaded
	slot14 = slot1

	slot12(slot13, slot14)
end

function slot8(slot0, slot1)
	slot2 = true
	slot1.hideNo = slot2
	slot2 = true
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

	slot2 = print
	slot3 = slot1.helps
	slot3 = slot3.helpSize

	slot2(slot3)

	slot2 = slot1.helps
	slot2 = slot2.helpSize

	if slot2 then
		slot2 = rtf
		slot3 = slot0._helpPanel
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.helpSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultHelpSize
			slot4 = slot4.x
		end

		slot5 = slot1.helps
		slot5 = slot5.helpSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultHelpSize
			slot5 = slot5.y
		end

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
	end

	slot2 = slot1.helps
	slot2 = slot2.helpPos

	if slot2 then
		slot2 = setAnchoredPosition
		slot3 = slot0._helpPanel
		slot4 = {}
		slot5 = slot1.helps
		slot5 = slot5.helpPos
		slot5 = slot5.x

		if not slot5 then
			slot5 = slot0._defaultHelpPos
			slot5 = slot5.x
		end

		slot4.x = slot5
		slot5 = slot1.helps
		slot5 = slot5.helpPos
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultHelpPos
			slot5 = slot5.y
		end

		slot4.y = slot5

		slot2(slot3, slot4)
	end

	slot2 = slot1.helps
	slot2 = slot2.windowSize

	if slot2 then
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.windowSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultSize
			slot4 = slot4.x
		end

		slot5 = slot1.helps
		slot5 = slot5.windowSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultSize
			slot5 = slot5.y
		end

		slot3 = slot3(slot4, slot5)
		slot2.sizeDelta = slot3
	end

	slot2 = slot1.helps
	slot2 = slot2.windowPos

	if slot2 then
		slot2 = rtf
		slot3 = slot0._window
		slot2 = slot2(slot3)
		slot3 = Vector2
		slot4 = slot1.helps
		slot4 = slot4.windowSize
		slot4 = slot4.x

		if not slot4 then
			slot4 = slot0._defaultSize
			slot4 = slot4.x
		end

		slot5 = slot1.helps
		slot5 = slot5.windowSize
		slot5 = slot5.y

		if not slot5 then
			slot5 = slot0._defaultSize
			slot5 = slot5.y
		end

		slot2.sizeDelta = slot3(slot4, slot5)

		setAnchoredPosition(slot0._window, {
			x = slot1.helps.windowPos.x or 0,
			y = slot1.helps.windowPos.y or 0
		})
	else
		slot2 = setAnchoredPosition
		slot3 = slot0._window
		slot4 = {
			x = 0,
			y = 0
		}

		slot2(slot3, slot4)
	end

	slot2 = slot1.helps
	slot2 = slot2.disableScroll

	if slot2 then
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
	end

	slot2 = slot1.helps
	slot2 = slot2.ImageMode

	if slot2 then
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
	end

	slot2 = slot0.settings
	slot2 = slot2.helps
	slot3 = #slot2
	slot4 = slot0._helpList
	slot4 = slot4.childCount
	slot4 = slot4 - 1
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = Destroy
		slot8 = slot0._helpList
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot6

		slot7(slot8(slot9, slot10))
	end

	slot3 = slot0._helpList
	slot3 = slot3.childCount
	slot4 = #slot2
	slot4 = slot4 - 1
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = cloneTplTo
		slot8 = slot0._helpTpl
		slot9 = slot0._helpList

		slot7(slot8, slot9)
	end

	slot3 = ipairs
	slot4 = slot2
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot0._helpList:GetChild(slot6 - 1)

		setActive(slot8, true)
		setText(slot8, slot7.info or "")
		setActive(slot9, slot7.icon)
		setActive(findTF(slot8, "line"), slot7.line)

		slot10 = slot7.icon

		if slot10 then
			slot10 = 1
			slot11 = slot1.helps
			slot11 = slot11.ImageMode

			if slot11 then
				slot10 = 1.5
			end

			slot9.transform.localScale = Vector2(slot7.icon.scale or slot10, slot7.icon.scale or slot10)
			slot11 = slot7.icon.path
			slot12 = slot7.icon.posX

			if slot12 then
				slot12 = slot7.icon.posX or -20
				slot13 = slot7.icon.posY

				if slot13 then
					setImageSprite(slot9:GetComponent(typeof(Image)), slot14, true)
					setAnchoredPosition(slot9, {
						x = slot12,
						y = slot7.icon.posY or 0
					})
					setActive(slot9:Find("corner"), slot1.helps.pageMode)
				end
			end
		end
	end

	slot0.helpPage = slot1.helps.defaultpage or 1
	slot3 = slot1.helps
	slot3 = slot3.pageMode

	if slot3 then
		slot4 = slot0
		slot3 = slot0.switchHelpPage
		slot5 = slot0.helpPage

		slot3(slot4, slot5)
	end

	slot0:Loaded(slot1)
	setActive(slot0._btnContainer, slot0._btnContainer.transform.childCount > 0)
end

function slot9(slot0, slot1)
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
			slot9 = slot0.timers
			slot9 = slot9.secondaryUItimer
			slot10 = slot9
			slot9 = slot9.Stop

			slot9(slot10)
		end

		function slot9()
			slot0 = slot0
			slot0 = slot0.TimeMgr
			slot1 = slot0
			slot0 = slot0.GetInstance
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.GetServerTime
			slot0 = slot0(slot1)
			slot1 = slot1
			slot1 = slot1.fail_cd

			if slot1 then
				slot1 = slot1
				slot1 = slot1.fail_cd
				slot1 = slot1 - slot0

				if not slot1 then
					slot1 = 0
				end
			end

			slot2 = 0

			if slot1 < slot2 then
				slot1 = 0
			end

			slot2 = math
			slot2 = slot2.floor
			slot3 = slot1 / 86400
			slot2 = slot2(slot3)
			slot3 = 0

			if slot2 > slot3 then
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
			else
				slot3 = math
				slot3 = slot3.floor
				slot4 = slot1 / 3600
				slot3 = slot3(slot4)
				slot4 = 0

				if slot3 > slot4 then
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
				else
					slot4 = ""
					slot5 = math
					slot5 = slot5.floor
					slot6 = slot1 / 60
					slot5 = slot5(slot6)
					slot6 = 0

					if slot5 > slot6 then
						slot6 = slot4
						slot7 = slot5
						slot8 = i18n
						slot9 = "word_minute"
						slot8 = slot8(slot9)
						slot4 = slot6 .. slot7 .. slot8
					end

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
				end
			end
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
	elseif slot3 == "settips" then

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
		slot9 = slot9 or ""
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
				--- BLOCK #0 22-37, warpins: 2 ---
				slot3 = slot1
				slot3 = slot3.TipsMgr
				slot4 = slot3
				slot3 = slot3.GetInstance
				slot3 = slot3(slot4)
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
				--- BLOCK #0 38-39, warpins: 1 ---
				slot3 = false

				return slot3
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 40-40, warpins: 2 ---
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

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #1 122-122, warpins: 1 ---
		slot9 = ""
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 123-147, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	slot9 = slot0
	slot8 = slot0.Loaded
	slot10 = slot1

	slot8(slot9, slot10)
end

showSecondaryPassword = slot9

function slot9(slot0)

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

slot1.nextPage = slot9

function slot9(slot0)

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

slot1.prePage = slot9

function slot9(slot0, slot1)

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

slot1.switchHelpPage = slot9

function slot9(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-34, warpins: 1 ---
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
		--- BLOCK #0 35-35, warpins: 1 ---
		slot3 = slot0.stopRemindInitPos
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 36-40, warpins: 2 ---
	slot2.anchoredPosition = slot3
	slot2 = slot0.stopRemindText
	slot3 = slot1.stopRamindContent

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-43, warpins: 1 ---
		slot3 = i18n
		slot4 = "dont_remind_today"
		slot3 = slot3(slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 44-56, warpins: 2 ---
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
		--- BLOCK #0 57-57, warpins: 1 ---
		slot2 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 58-67, warpins: 2 ---
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
		--- BLOCK #0 68-68, warpins: 1 ---
		slot4 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 69-72, warpins: 2 ---
	slot5 = slot0.settings
	slot5 = slot5.maxNum

	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 73-73, warpins: 1 ---
		slot5 = -1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 74-77, warpins: 2 ---
	slot6 = slot0.settings
	slot6 = slot6.defaultNum

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 78-78, warpins: 1 ---
		slot6 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 79-102, warpins: 2 ---
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
		--- BLOCK #0 103-139, warpins: 1 ---
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
		--- BLOCK #0 140-151, warpins: 1 ---
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
	--- BLOCK #7 152-155, warpins: 2 ---
	slot7 = slot0.settings
	slot7 = slot7.hideNo

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 156-156, warpins: 1 ---
		slot7 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 157-160, warpins: 2 ---
	slot8 = slot0.settings
	slot8 = slot8.hideYes

	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 161-161, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 162-165, warpins: 2 ---
	slot9 = slot0.settings
	slot9 = slot9.modal

	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 166-166, warpins: 1 ---
		slot9 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 167-170, warpins: 2 ---
	slot10 = slot0.settings
	slot10 = slot10.onNo

	if not slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 171-171, warpins: 1 ---
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
	--- BLOCK #11 172-173, warpins: 2 ---
	if not slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 174-180, warpins: 1 ---
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
		--- BLOCK #0 181-183, warpins: 1 ---
		slot11 = removeOnButton
		slot12 = slot0._go

		slot11(slot12)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 184-185, warpins: 2 ---
	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 186-192, warpins: 1 ---
		slot12 = slot0
		slot11 = slot0.createBtn
		slot13 = {}
		slot14 = slot0.settings
		slot14 = slot14.noText

		if not slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 193-194, warpins: 1 ---
			slot14 = slot1
			slot14 = slot14.TEXT_CANCEL
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 195-199, warpins: 2 ---
		slot13.text = slot14
		slot14 = slot0.settings
		slot14 = slot14.noBtnType

		if not slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 200-201, warpins: 1 ---
			slot14 = slot1
			slot14 = slot14.BUTTON_GRAY
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 202-206, warpins: 2 ---
		slot13.btnType = slot14
		slot13.onCallback = slot10
		slot14 = slot1.noSound

		if not slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 207-207, warpins: 1 ---
			slot14 = SFX_CANCEL
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 208-209, warpins: 2 ---
		slot13.sound = slot14

		slot11(slot12, slot13)
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 210-211, warpins: 2 ---
	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 212-218, warpins: 1 ---
		slot12 = slot0
		slot11 = slot0.createBtn
		slot13 = {}
		slot14 = slot0.settings
		slot14 = slot14.yesText

		if not slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 219-220, warpins: 1 ---
			slot14 = slot1
			slot14 = slot14.TEXT_CONFIRM
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 221-225, warpins: 2 ---
		slot13.text = slot14
		slot14 = slot0.settings
		slot14 = slot14.yesBtnType

		if not slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 226-227, warpins: 1 ---
			slot14 = slot1
			slot14 = slot14.BUTTON_BLUE
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 228-232, warpins: 2 ---
		slot13.btnType = slot14
		slot14 = slot0.settings
		slot14 = slot14.onYes

		if not slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 233-233, warpins: 1 ---
			function slot14()

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
		--- BLOCK #3 234-237, warpins: 2 ---
		slot13.onCallback = slot14
		slot14 = slot1.yesSound

		if not slot14 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 238-238, warpins: 1 ---
			slot14 = SFX_CONFIRM
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 239-240, warpins: 2 ---
		slot13.sound = slot14

		slot11(slot12, slot13)
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #14



	-- Decompilation error in this vicinity:
	--- BLOCK #14 241-246, warpins: 2 ---
	slot11 = nil
	slot12 = slot0.settings
	slot12 = slot12.type
	slot13 = MSGBOX_TYPE_HELP

	if slot12 == slot13 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 247-251, warpins: 1 ---
		slot12 = slot0.settings
		slot12 = slot12.helps
		slot12 = slot12.pageMode

		if slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 252-257, warpins: 1 ---
			slot12 = slot0.settings
			slot12 = slot12.helps
			slot12 = #slot12
			slot13 = 1

			if slot12 > slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 258-271, warpins: 1 ---
				slot13 = slot0
				slot12 = slot0.createBtn
				slot14 = {
					noQuit = true
				}
				slot15 = slot1
				slot15 = slot15.BUTTON_PREPAGE
				slot14.btnType = slot15

				function slot15()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.prePage

					slot0(slot1)

					return
					--- END OF BLOCK #0 ---



				end

				slot14.onCallback = slot15
				slot15 = SFX_CANCEL
				slot14.sound = slot15

				slot12(slot13, slot14)

				slot12 = slot0.settings
				slot12 = slot12.helps
				slot11 = #slot12
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 272-275, warpins: 4 ---
	slot12 = slot0.settings
	slot12 = slot12.custom

	if slot12 ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 276-280, warpins: 1 ---
		slot12 = ipairs
		slot13 = slot0.settings
		slot13 = slot13.custom
		slot12, slot13, slot14 = slot12(slot13)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 281-286, warpins: 0 ---
		for slot15, slot16 in slot12, slot13, slot14 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 281-284, warpins: 1 ---
			slot18 = slot0
			slot17 = slot0.createBtn
			slot19 = slot16

			slot17(slot18, slot19)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 285-286, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 287-288, warpins: 2 ---
	if not slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 289-289, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 290-292, warpins: 1 ---
		slot12 = 1

		if slot11 > slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 293-303, warpins: 1 ---
			slot13 = slot0
			slot12 = slot0.createBtn
			slot14 = {
				noQuit = true
			}
			slot15 = slot1
			slot15 = slot15.BUTTON_NEXTPAGE
			slot14.btnType = slot15

			function slot15()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.nextPage

				slot0(slot1)

				return
				--- END OF BLOCK #0 ---



			end

			slot14.onCallback = slot15
			slot15 = SFX_CONFIRM
			slot14.sound = slot15

			slot12(slot13, slot14)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #17 304-318, warpins: 3 ---
	slot12 = setActive
	slot13 = slot0._closeBtn
	slot14 = slot1.hideClose
	slot14 = not slot14

	slot12(slot13, slot14)

	slot12 = onButton
	slot13 = slot0
	slot14 = slot0._closeBtn

	function slot15()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.settings
		slot0 = slot0.onClose
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.hide

		slot1(slot2)

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-12, warpins: 1 ---
			slot1 = slot0

			slot1()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-14, warpins: 1 ---
			slot1 = slot1

			slot1()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 15-15, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot16 = SFX_CANCEL

	slot12(slot13, slot14, slot15, slot16)

	slot12 = slot0.settings
	slot12 = slot12.title

	if not slot12 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 319-320, warpins: 1 ---
		slot12 = slot1
		slot12 = slot12.TITLE_INFORMATION
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #17 ---

	FLOW; TARGET BLOCK #18



	-- Decompilation error in this vicinity:
	--- BLOCK #18 321-324, warpins: 2 ---
	slot13 = 0
	slot14 = slot0._titleList
	slot14 = slot14.transform
	slot14 = slot14.childCount

	--- END OF BLOCK #18 ---

	FLOW; TARGET BLOCK #19



	-- Decompilation error in this vicinity:
	--- BLOCK #19 325-326, warpins: 2 ---
	--- END OF BLOCK #19 ---

	FLOW; TARGET BLOCK #20



	-- Decompilation error in this vicinity:
	--- BLOCK #20 327-345, warpins: 0 ---
	while slot13 < slot14 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 327-327, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 328-338, warpins: 1 ---
		slot15 = slot0._titleList
		slot15 = slot15.transform
		slot16 = slot15
		slot15 = slot15.GetChild
		slot17 = slot13
		slot15 = slot15(slot16, slot17)
		slot16 = SetActive
		slot17 = slot15
		slot18 = slot15.name

		if slot18 ~= slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 339-340, warpins: 1 ---
			slot18 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 341-341, warpins: 1 ---
			slot18 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 342-344, warpins: 2 ---
		slot16(slot17, slot18)

		slot13 = slot13 + 1
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 345-345, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #20 ---

	FLOW; TARGET BLOCK #21



	-- Decompilation error in this vicinity:
	--- BLOCK #21 345-356, warpins: 1 ---
	slot15 = slot0._go
	slot15 = slot15.transform
	slot15 = slot15.localPosition
	slot16 = slot0._go
	slot16 = slot16.transform
	slot17 = Vector3
	slot18 = slot15.x
	slot19 = slot15.y
	slot20 = slot0.settings
	slot20 = slot20.zIndex

	if not slot20 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 357-357, warpins: 1 ---
		slot20 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #21 ---

	FLOW; TARGET BLOCK #22



	-- Decompilation error in this vicinity:
	--- BLOCK #22 358-362, warpins: 2 ---
	slot17 = slot17(slot18, slot19, slot20)
	slot16.localPosition = slot17
	slot16 = slot0._helpPanel

	if slot16 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 363-367, warpins: 1 ---
		slot16 = setActive
		slot17 = slot0._helpPanel
		slot18 = slot0.settings
		slot18 = slot18.helps

		slot16(slot17, slot18)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #22 ---

	FLOW; TARGET BLOCK #23



	-- Decompilation error in this vicinity:
	--- BLOCK #23 368-370, warpins: 2 ---
	slot16 = slot0._sliders

	if slot16 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 371-374, warpins: 1 ---
		slot16 = setActive
		slot17 = slot0._sliders
		slot18 = true

		slot16(slot17, slot18)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #23 ---

	FLOW; TARGET BLOCK #24



	-- Decompilation error in this vicinity:
	--- BLOCK #24 375-376, warpins: 2 ---
	return
	--- END OF BLOCK #24 ---



end

slot1.commonSetting = slot9

function slot9(slot0, slot1)

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
	slot7 = slot7.BUTTON_RETREAT

	if slot2 ~= slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-60, warpins: 1 ---
		slot7 = slot0
		slot7 = slot7.BUTTON_PREPAGE

		if slot2 ~= slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 61-64, warpins: 1 ---
			slot7 = slot0
			slot7 = slot7.BUTTON_NEXTPAGE

			if slot2 ~= slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-69, warpins: 1 ---
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

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 70-72, warpins: 4 ---
	slot7 = slot1.hideEvent

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 73-79, warpins: 1 ---
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
			--- BLOCK #0 80-80, warpins: 1 ---
			slot11 = SFX_CONFIRM
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 81-81, warpins: 2 ---
		slot7(slot8, slot9, slot10, slot11)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 82-84, warpins: 2 ---
	slot7 = slot1.sibling

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-88, warpins: 1 ---
		slot8 = slot6
		slot7 = slot6.SetSiblingIndex
		slot9 = slot1.sibling

		slot7(slot8, slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 89-90, warpins: 2 ---
	return
	--- END OF BLOCK #7 ---



end

slot1.createBtn = slot9

function slot9(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	slot4 = slot1
	slot3 = slot1.Find
	slot5 = "text"
	slot3 = slot3(slot4, slot5)
	slot5 = slot1
	slot4 = slot1.Find
	slot6 = "pic"
	slot4 = slot4(slot5, slot6)
	slot5 = nil
	slot6 = slot0._textPics
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = slot2
	slot6 = slot6(slot7, slot8)
	slot7 = IsNil
	slot8 = slot6
	slot7 = slot7(slot8)

	if not slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-25, warpins: 1 ---
		slot7 = getImageSprite
		slot8 = slot6
		slot7 = slot7(slot8)
		slot5 = slot7

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-33, warpins: 1 ---
			slot7 = GetComponent
			slot8 = slot4
			slot9 = typeof
			slot10 = Text
			slot7 = slot7(slot8, slot9(slot10))

			if slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-36, warpins: 1 ---
				slot8 = slot7.text

				if slot8 ~= "" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-37, warpins: 1 ---
					slot5 = slot7
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
	--- BLOCK #1 38-39, warpins: 5 ---
	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-53, warpins: 1 ---
		slot7 = setActive
		slot8 = slot4
		slot9 = true

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot3
		slot9 = false

		slot7(slot8, slot9)

		slot7 = getImageSprite
		slot8 = slot4
		slot7 = slot7(slot8)
		slot5 = slot7

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 54-61, warpins: 1 ---
			slot7 = GetComponent
			slot8 = slot4
			slot9 = typeof
			slot10 = Text
			slot7 = slot7(slot8, slot9(slot10))

			if slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 62-64, warpins: 1 ---
				slot8 = slot7.text

				if slot8 ~= "" then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 65-72, warpins: 1 ---
					slot8 = i18n
					slot9 = slot2
					slot8 = slot8(slot9)
					slot9 = i18n_not_find
					slot10 = slot2
					slot9 = slot9(slot10)

					if slot8 == slot9 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 73-73, warpins: 1 ---
						slot8 = slot2
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 74-78, warpins: 2 ---
					slot9 = setText
					slot10 = slot7
					slot11 = slot8

					slot9(slot10, slot11)
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-94, warpins: 1 ---
		slot7 = setActive
		slot8 = slot4
		slot9 = false

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot3
		slot9 = true

		slot7(slot8, slot9)

		slot7 = i18n
		slot8 = slot2
		slot7 = slot7(slot8)
		slot8 = i18n_not_find
		slot9 = slot2
		slot8 = slot8(slot9)

		if slot7 == slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 95-95, warpins: 1 ---
			slot7 = slot2
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 96-99, warpins: 2 ---
		slot8 = setText
		slot9 = slot3
		slot10 = slot7

		slot8(slot9, slot10)
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 100-100, warpins: 5 ---
	return
	--- END OF BLOCK #2 ---



end

slot1.updateButton = slot9

function slot9(slot0, slot1)

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

slot1.Loaded = slot9

function slot9(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-56, warpins: 1 ---
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
	--- BLOCK #1 57-74, warpins: 0 ---
	for slot5 = slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 57-74, warpins: 2 ---
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
	--- BLOCK #2 75-79, warpins: 1 ---
	slot2 = slot0._scrollTxts
	slot2 = #slot2
	slot3 = 1
	slot4 = -1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 80-94, warpins: 0 ---
	for slot5 = slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 80-83, warpins: 2 ---
		slot6 = slot0._scrollTxts
		slot6 = slot6[slot5]

		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 84-93, warpins: 1 ---
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
		--- BLOCK #1 94-94, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 95-98, warpins: 1 ---
	slot2 = pairs
	slot3 = slot0.pools
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 99-110, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 99-100, warpins: 1 ---
		if slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 101-108, warpins: 1 ---
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
		--- BLOCK #1 109-110, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 111-116, warpins: 1 ---
	slot2 = {}
	slot0.pools = slot2
	slot2 = pairs
	slot3 = slot0.timers
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 117-121, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 117-119, warpins: 1 ---
		slot8 = slot6
		slot7 = slot6.Stop

		slot7(slot8)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 120-121, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 122-134, warpins: 1 ---
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
	--- BLOCK #9 135-143, warpins: 0 ---
	for slot6 = slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 135-143, warpins: 2 ---
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
	--- BLOCK #10 144-146, warpins: 1 ---
	slot3 = slot0.settings

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 147-150, warpins: 1 ---
		slot3 = slot0.settings
		slot3 = slot3.parent

		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 151-163, warpins: 1 ---
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
				--- BLOCK #0 164-172, warpins: 1 ---
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
		--- BLOCK #0 173-185, warpins: 2 ---
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
	--- BLOCK #11 186-188, warpins: 3 ---
	slot3 = slot0.contentText

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 189-192, warpins: 1 ---
		slot3 = slot0.contentText
		slot4 = slot3
		slot3 = slot3.RemoveAllListeners

		slot3(slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #12



	-- Decompilation error in this vicinity:
	--- BLOCK #12 193-197, warpins: 2 ---
	slot3 = nil
	slot0.settings = slot3
	slot3 = false
	slot0.enable = slot3

	return
	--- END OF BLOCK #12 ---



end

slot1.Clear = slot9

function slot9(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = true
	slot0.enable = slot2
	slot2 = slot1.type

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		slot2 = MSGBOX_TYPE_NORMAL
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-9, warpins: 2 ---
	slot3 = MSGBOX_TYPE_NORMAL

	if slot2 == slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-14, warpins: 1 ---
		slot3 = slot0
		slot4 = slot0
		slot5 = slot1

		slot3(slot4, slot5)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-17, warpins: 1 ---
		slot3 = MSGBOX_TYPE_INPUT

		if slot2 == slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-22, warpins: 1 ---
			slot3 = slot1
			slot4 = slot0
			slot5 = slot1

			slot3(slot4, slot5)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-25, warpins: 1 ---
			slot3 = MSGBOX_TYPE_SINGLE_ITEM

			if slot2 == slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 26-30, warpins: 1 ---
				slot3 = slot2
				slot4 = slot0
				slot5 = slot1

				slot3(slot4, slot5)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-33, warpins: 1 ---
				slot3 = MSGBOX_TYPE_EXCHANGE

				if slot2 == slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 34-38, warpins: 1 ---
					slot3 = slot3
					slot4 = slot0
					slot5 = slot1

					slot3(slot4, slot5)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 39-41, warpins: 1 ---
					slot3 = MSGBOX_TYPE_DROP_ITEM

					if slot2 == slot3 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 42-46, warpins: 1 ---
						slot3 = slot4
						slot4 = slot0
						slot5 = slot1

						slot3(slot4, slot5)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 47-49, warpins: 1 ---
						slot3 = MSGBOX_TYPE_ITEM_BOX

						if slot2 == slot3 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 50-54, warpins: 1 ---
							slot3 = slot5
							slot4 = slot0
							slot5 = slot1

							slot3(slot4, slot5)
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 55-57, warpins: 1 ---
							slot3 = MSGBOX_TYPE_HELP

							if slot2 == slot3 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 58-62, warpins: 1 ---
								slot3 = slot6
								slot4 = slot0
								slot5 = slot1

								slot3(slot4, slot5)
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 63-65, warpins: 1 ---
								slot3 = MSGBOX_TYPE_SECONDPWD

								if slot2 == slot3 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 66-74, warpins: 1 ---
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
	--- BLOCK #2 75-80, warpins: 9 ---
	slot3 = slot0._tf
	slot4 = slot3
	slot3 = slot3.SetAsLastSibling

	slot3(slot4)

	return
	--- END OF BLOCK #2 ---



end

slot1.ShowMsgBox = slot9

function slot9(slot0)

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

slot1.hide = slot9

return
