slot0 = class("CommaderMsgBox")

function slot0.Ctor(slot0, slot1)
	pg.DelegateInfo.New(slot0)

	slot0._go = slot1
	slot0._tf = tf(slot1)
	slot0.msgbox = slot0._tf
end

function slot0.openMsgBox(slot0, slot1)
	slot0.isShowMsgBox = true

	setActive(slot0.msgbox, true)
	setText(slot0.msgbox:Find("frame/bg/content/Text"), slot1.content)
	onButton(slot0, slot0.msgbox:Find("frame/cancel_btn"), function ()
		uv0:closeMsgBox()

		if uv1.onNo then
			uv1.onNo()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.msgbox:Find("frame/confirm_btn"), function ()
		if uv0.onYes then
			uv0.onYes()
		end

		uv1:closeMsgBox()
	end, SFX_PANEL)
	onButton(slot0, slot0.msgbox:Find("frame/close_btn"), function ()
		uv0:closeMsgBox()

		if uv1.onClose then
			uv1.onClose()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.msgbox, function ()
		uv0:closeMsgBox()
	end, SFX_PANEL)
	slot0._tf:SetAsLastSibling()
end

function slot0.closeMsgBox(slot0)
	slot0.isShowMsgBox = nil

	setActive(slot0.msgbox, false)
end

function slot0.clear(slot0)
	slot0:closeMsgBox()
	pg.DelegateInfo.Dispose(slot0)
end

return slot0
