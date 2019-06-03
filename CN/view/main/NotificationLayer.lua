slot0 = class("NotificationLayer", import("..base.BaseUI"))
slot0.InitCount = 10
slot0.MaxCount = 100
slot0.FORM_COMMON = 0
slot0.FORM_BATTLE = 1
slot0.ChannelBits = {
	send = ChatConst.ChannelWorld,
	recv = IndexConst.Flags2Bits({
		ChatConst.ChannelAll
	})
}

function slot0.getUIName(slot0)
	return "NotificationUI"
end

function slot0.getGroupName(slot0)
	return "group_NotificationUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.setInGuild(slot0, slot1)
	slot0.inGuild = slot1
end

function slot0.setMessages(slot0, slot1)
	slot0.messages = slot1
end

function slot0.init(slot0)
	slot0.close = slot0:findTF("close")
	slot0.frame = slot0:findTF("frame")
	slot0.contain = slot0.frame:Find("contain")
	slot1 = slot0.contain:Find("list")
	slot0.content = slot1:Find("content")
	slot0.prefabSelf = slot1:Find("popo_self").gameObject
	slot0.prefabOthers = slot1:Find("popo_other").gameObject
	slot0.prefabPublic = slot1:Find("popo_public").gameObject
	slot0.input = slot0.frame:Find("inputbg/input"):GetComponent("InputField")
	slot0.send = slot0.frame:Find("send")
	slot0.channelSend = slot0.frame:Find("channel_send")
	slot0.channelSendPop = slot0.frame:Find("channel_pop")
	slot0.scroll = slot1:GetComponent("ScrollRect")
	slot0.topMsg = slot0.contain:Find("topmsg")

	SetActive(slot0.topMsg, false)

	slot0.topPublic = slot0:findTF("popo_public", slot0.topMsg)
	slot0.emoji = slot0.frame:Find("inputbg/emoji")
	slot0.changeRoomPanel = slot0:findTF("change_room_Panel")
	slot0.roomSendBtns = slot0:findTF("frame/bg/type_send", slot0.changeRoomPanel)
	slot0.roomRecvBtns = slot0:findTF("frame/bg/type_recv", slot0.changeRoomPanel)
	slot0.enterRoomTip = slot0.frame:Find("enter_room_tip")
	slot0.enterRoomCG = slot0.enterRoomTip:GetComponent(typeof(CanvasGroup))
	slot0.roomBtn = slot0.contain:Find("top/room")
	slot0.typeBtns = slot0.contain:Find("top/type")
	slot0.inputTF = slot0:findTF("frame/bg/InputField", slot0.changeRoomPanel):GetComponent(typeof(InputField))
	slot0.resource = slot0:findTF("resource")
	slot0.typeTpl = slot0:findTF("type_tpl", slot0.resource)
	slot0.normalSprite = slot0:findTF("normal", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.selectedSprite = slot0:findTF("selected", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.bottomChannelTpl = slot0:findTF("channel_tpl", slot0.resource)
	slot0.bottomChannelNormalSprite = slot0:findTF("channel_normal", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.bottomChannelSelectedSprite = slot0:findTF("channel_selected", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.switchTpl = slot0:findTF("switch_tpl", slot0.resource)
	slot0.switchNormalSprite = slot0:findTF("switch_normal", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.switchSelectedSprite = slot0:findTF("switch_selected", slot0.resource):GetComponent(typeof(Image)).sprite
	slot0.textSprites = {}
	slot0.textSelectedSprites = {}
	slot0.bottomChannelTextSprites = {}
	slot0.switchTextSprites = {}

	for slot6, slot7 in pairs(slot2) do
		slot8 = ChatConst.GetChannelSprite(slot6)
		slot0.textSprites[slot6] = slot0:findTF("text_" .. slot8, slot0.resource):GetComponent(typeof(Image)).sprite
		slot0.textSelectedSprites[slot6] = slot0:findTF("text_" .. slot8 .. "_selected", slot0.resource):GetComponent(typeof(Image)).sprite
		slot0.switchTextSprites[slot6] = slot0:findTF("text_" .. slot8 .. "_switch", slot0.resource):GetComponent(typeof(Image)).sprite

		if table.contains(ChatConst.SendChannels, slot6) then
			slot0.bottomChannelTextSprites[slot6] = slot0:findTF("channel_" .. slot8, slot0.resource):GetComponent(typeof(Image)).sprite
		end
	end

	slot0.prefabSelf:SetActive(false)
	slot0.prefabOthers:SetActive(false)
	slot0.prefabPublic:SetActive(false)

	slot0.bubbleCards = {}
	slot0.poolBubble = {
		self = {},
		public = {},
		others = {}
	}
end

function slot0.didEnter(slot0)
	slot0.currentForm = slot0.contextData.form
	slot0.escFlag = false

	onButton(slot0, slot0.close, function ()
		if uv0.escFlag then
			return
		end

		uv0.escFlag = true

		LeanTween.moveX(uv0._tf, 700, 0.3):setFrom(uv0._tf.localPosition.x):setEase(LeanTweenType.easeInOutQuad):setUseEstimatedTime(true)

		slot0 = uv0._tf:GetComponent(typeof(CanvasGroup))

		LeanTween.value(go(uv0._tf), 1, 0, 0.3):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)
			uv0.alpha = slot0
		end)):setOnComplete(System.Action(function ()
			if uv0.currentForm == uv1.FORM_BATTLE then
				uv0:emit(NotificationMediator.BATTLE_CHAT_CLOSE)
			end

			uv0:emit(BaseUI.ON_CLOSE)
		end))
	end, SFX_CANCEL)
	onButton(slot0, slot0.emoji, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:displayEmojiPanel()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.send, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-32, warpins: 1 ---
		if uv0.input.text == "" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-17, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("main_notificationLayer_sendButton"))

			return
			--- END OF BLOCK #0 ---



		end

		uv0.input.text = ""

		uv0:emit(NotificationMediator.ON_SEND_PUBLIC, uv1.ChannelBits.send, slot0)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.roomBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:showChangeRoomPanel()

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, findTF(slot0.changeRoomPanel, "frame/cancel"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:closeChangeRoomPanel()

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, findTF(slot0.changeRoomPanel, "frame/confirm"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		uv0:emit(NotificationMediator.CHANGE_ROOM, tonumber(uv0.inputTF.text))

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	onButton(slot0, slot0.channelSend, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-20, warpins: 1 ---
		setActive(uv0.channelSendPop, not isActive(uv0.channelSendPop))

		if isActive(uv0.channelSendPop) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-19, warpins: 1 ---
			uv0:updateChannelSendPop()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		if isActive(uv0.channelSendPop) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-11, warpins: 1 ---
			setActive(uv0.channelSendPop, false)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	pg.DelegateInfo.Add(slot0, slot0.scroll.onValueChanged)
	slot0.scroll.onValueChanged:AddListener(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-72, warpins: 1 ---
		if uv0.index > 1 and slot0.y >= 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-71, warpins: 1 ---
			slot1 = uv0.content.sizeDelta.y * slot0.y
			slot2 = uv0.scroll.velocity

			for slot8 = uv0.index - 1, math.max(1, uv0.index - uv1.InitCount), -1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-43, warpins: 2 ---
				uv0:append(uv0.filteredMessages[slot8], 0)
				--- END OF BLOCK #0 ---



			end

			Canvas.ForceUpdateCanvases()

			uv0.scroll.normalizedPosition = Vector2(0, slot1 / uv0.content.sizeDelta.y)

			uv0.scroll.onValueChanged:Invoke(uv0.scroll.normalizedPosition)

			uv0.scroll.velocity = slot2
			uv0.index = slot3
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot0:updateRoom()
	slot0:updateChatChannel()
	slot0:initFilter()
	slot0:updateFilter()
	slot0:updateAll()

	if slot0.currentForm == uv0.FORM_BATTLE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 92-108, warpins: 1 ---
		slot0._tf:SetParent(slot0.contextData.chatViewParent, true)

		rtf(slot0.frame.transform).offsetMax = Vector2(0, -120)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 109-122, warpins: 1 ---
		pg.UIMgr.GetInstance():BlurPanel(slot0._tf, false, {
			groupName = slot0:getGroupName()
		})
		--- END OF BLOCK #0 ---



	end

	LeanTween.moveX(slot0._tf, slot0._tf.localPosition.x, 0.3):setFrom(700):setEase(LeanTweenType.easeInOutQuad):setUseEstimatedTime(true)

	slot1 = slot0._tf:GetComponent(typeof(CanvasGroup))

	LeanTween.value(go(slot0._tf), 0, 1, 0.3):setUseEstimatedTime(true):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		uv0.alpha = slot0

		return
		--- END OF BLOCK #0 ---



	end))

	rtf(slot0._tf).offsetMax = Vector2(0, 0)
	rtf(slot0._tf).offsetMin = Vector2(0, 0)
end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	playSoundEffect(SFX_CANCEL)

	if isActive(slot0.changeRoomPanel) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 1 ---
		slot0:closeChangeRoomPanel()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-15, warpins: 1 ---
		triggerButton(slot0.close)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.initFilter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-20, warpins: 1 ---
	slot0.recvTypes = UIItemList.New(slot0.typeBtns, slot0.typeTpl)

	slot0.recvTypes:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-35, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-34, warpins: 1 ---
			setImageSprite(slot2:Find("text"), uv1.textSprites[uv0[slot1 + 1]], true)
			setImageSprite(slot2:Find("text_selected"), uv1.textSelectedSprites[uv0[slot1 + 1]], true)
			onButton(uv1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-27, warpins: 1 ---
				uv2.ChannelBits.recv = IndexConst.ToggleBits(uv2.ChannelBits.recv, _.filter(uv0, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 11-11, warpins: 3 ---
					return slot0 ~= ChatConst.ChannelGuild or uv0.inGuild
					--- END OF BLOCK #0 ---



				end), ChatConst.ChannelAll, uv3)

				uv1:updateFilter()
				uv1:updateAll()

				return
				--- END OF BLOCK #0 ---



			end, SFX_UI_TAG)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot0.recvTypes:align(#ChatConst.RecvChannels)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateFilter(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-37, warpins: 1 ---
	slot1 = ChatConst.RecvChannels

	slot0.recvTypes:each(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-55, warpins: 1 ---
		if uv0[slot0 + 1] == ChatConst.ChannelGuild and not uv1.inGuild then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-15, warpins: 1 ---
			setButtonEnabled(slot1, false)
			--- END OF BLOCK #0 ---



		end

		if bit.band(uv2.ChannelBits.recv, bit.lshift(1, slot2)) > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-42, warpins: 1 ---
			setImageSprite(slot1, uv1.selectedSprite)
			setActive(slot1:Find("text_selected"), true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-54, warpins: 1 ---
			setImageSprite(slot1, uv1.normalSprite)
			setActive(slot1:Find("text_selected"), false)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	slot2 = uv0.ChannelBits.recv
	slot3 = bit.lshift(1, ChatConst.ChannelAll)
	slot0.filteredMessages = _.filter(slot0.messages, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-20, warpins: 2 ---
		return uv0 == uv1 or bit.band(uv0, bit.lshift(1, slot0.type)) > 0
		--- END OF BLOCK #0 ---



	end)
	slot0.filteredMessages = _.slice(slot0.filteredMessages, #slot0.filteredMessages - uv0.MaxCount + 1, uv0.MaxCount)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateChatChannel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	setImageSprite(slot0.channelSend:Find("Text"), slot0.bottomChannelTextSprites[uv0.ChannelBits.send], true)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateChannelSendPop(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-24, warpins: 1 ---
	slot2 = UIItemList.New(slot0.channelSendPop:Find("type_send"), slot0.bottomChannelTpl)

	slot2:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-24, warpins: 1 ---
			setImageSprite(slot2:Find("text"), uv1.bottomChannelTextSprites[uv0[slot1 + 1]], true)
			onButton(uv1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-16, warpins: 1 ---
				setActive(uv0.channelSendPop, false)

				uv1.ChannelBits.send = uv2

				uv3()
				uv0:updateChatChannel()

				return
				--- END OF BLOCK #0 ---



			end, SFX_UI_TAG)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot2:align(#ChatConst.SendChannels)
	function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0:each(function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-40, warpins: 1 ---
			if uv0[slot0 + 1] == ChatConst.ChannelGuild and not uv1.inGuild then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-15, warpins: 1 ---
				setButtonEnabled(slot1, false)
				--- END OF BLOCK #0 ---



			end

			if uv2.ChannelBits.send == slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-30, warpins: 1 ---
				setImageSprite(slot1:Find("bottom"), uv1.bottomChannelSelectedSprite, true)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-39, warpins: 1 ---
				setImageSprite(slot1:Find("bottom"), uv1.bottomChannelNormalSprite, true)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateRoom(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 36-40, warpins: 2 ---
	setText(slot0.enterRoomTip:Find("text"), i18n("main_notificationLayer_enter_room", slot0.player.chatRoomId == 0 and "" or slot0.player.chatRoomId))
	setText(slot0:findTF("Text", slot0.roomBtn), slot0.player.chatRoomId == 0 and i18n("common_not_enter_room") or slot0.player.chatRoomId)
	slot0:showEnterRommTip()

	return
	--- END OF BLOCK #0 ---



end

function slot0.showChangeRoomPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-72, warpins: 1 ---
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
	pg.UIMgr.GetInstance():BlurPanel(slot0.changeRoomPanel)

	slot0.inputTF.text = tostring(slot0.player.chatRoomId)
	slot0.tempRoomSendBits = uv0.ChannelBits.send
	slot2 = UIItemList.New(slot0.roomSendBtns, slot0.switchTpl)

	slot2:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-24, warpins: 1 ---
			setImageSprite(slot2:Find("text"), uv1.switchTextSprites[uv0[slot1 + 1]], true)
			onButton(uv1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				uv0.tempRoomSendBits = uv1

				uv2()

				return
				--- END OF BLOCK #0 ---



			end, SFX_UI_TAG)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot2:align(#ChatConst.SendChannels)
	slot3()

	slot0.tempRoomRecvBits = uv0.ChannelBits.recv
	slot5 = UIItemList.New(slot0.roomRecvBtns, slot0.switchTpl)

	slot5:make(function (slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		if slot0 == UIItemList.EventUpdate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-24, warpins: 1 ---
			setImageSprite(slot2:Find("text"), uv1.switchTextSprites[uv0[slot1 + 1]], true)
			onButton(uv1, slot2, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-19, warpins: 1 ---
				uv1.tempRoomRecvBits = IndexConst.ToggleBits(uv1.tempRoomRecvBits, _.filter(uv0, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 11-11, warpins: 3 ---
					return slot0 ~= ChatConst.ChannelGuild or uv0.inGuild
					--- END OF BLOCK #0 ---



				end), ChatConst.ChannelAll, uv2)

				uv3()

				return
				--- END OF BLOCK #0 ---



			end, SFX_UI_TAG)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)
	slot5:align(#ChatConst.RecvChannels)
	slot6()
	setActive(slot0.changeRoomPanel, true)

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeChangeRoomPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-44, warpins: 1 ---
	pg.UIMgr.GetInstance():UnblurPanel(slot0.changeRoomPanel, slot0._tf)

	if slot0.currentForm == uv0.FORM_BATTLE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-31, warpins: 1 ---
		slot0._tf:SetParent(slot0.contextData.chatViewParent, true)

		rtf(slot0.frame.transform).offsetMax = Vector2(0, -120)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-39, warpins: 1 ---
		pg.UIMgr.GetInstance():BlurPanel(slot0._tf)
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.changeRoomPanel, false)

	return
	--- END OF BLOCK #0 ---



end

function slot0.removeAllBubble(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 6-48, warpins: 2 ---
	for slot4, slot5 in ipairs(slot0.bubbleCards or {}) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-45, warpins: 1 ---
		setActive(slot5.tf, false)

		slot6 = slot0.poolBubble.others

		if slot5.__cname == "ChatBubblePublic" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-19, warpins: 1 ---
			slot6 = slot0.poolBubble.public
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-22, warpins: 1 ---
			if slot5.__cname == "ChatBubble" and slot5.data.player and slot5.data.player.id == slot0.player.id then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-35, warpins: 1 ---
				slot6 = slot0.poolBubble.self
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		slot5:dispose()
		table.insert(slot6, slot5)
		--- END OF BLOCK #0 ---



	end

	slot0.bubbleCards = {}

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateAll(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	slot0:removeAllBubble()

	slot0.index = math.max(1, #slot0.filteredMessages - uv0.InitCount)

	for slot4 = slot0.index, #slot0.filteredMessages, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-25, warpins: 2 ---
		slot0:append(slot0.filteredMessages[slot4], -1)
		--- END OF BLOCK #0 ---



	end

	scrollToBottom(slot0.content.parent)

	return
	--- END OF BLOCK #0 ---



end

function slot0.append(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-56, warpins: 1 ---
	if #slot0.filteredMessages >= uv0.MaxCount * 2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-14, warpins: 1 ---
		slot0:updateFilter()
		slot0:updateAll()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-51, warpins: 3 ---
		slot3 = slot3 and slot0.scroll.normalizedPosition.y < 0.1

		if slot1.type == ChatConst.ChannelPublic then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-33, warpins: 1 ---
			if slot1.id == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-38, warpins: 1 ---
				slot0:appendTopPublic(slot1)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-44, warpins: 1 ---
				slot0:appendPublic(slot1, slot2)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-49, warpins: 1 ---
			slot0:appendOthers(slot1, slot2)
			--- END OF BLOCK #0 ---



		end

		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-55, warpins: 1 ---
			scrollToBottom(slot0.content.parent)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.appendOthers(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-73, warpins: 1 ---
	slot4 = slot0.poolBubble.others
	slot5 = slot0.prefabOthers

	if slot1.player.id == slot0.player.id then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-23, warpins: 1 ---
		slot4 = slot0.poolBubble.self
		slot5 = slot0.prefabSelf
		slot1.isSelf = true
		slot1.player = setmetatable(Clone(slot0.player), {
			__index = slot1.player
		})
		--- END OF BLOCK #0 ---



	end

	slot6 = nil

	if #slot4 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-39, warpins: 1 ---
		setActive(slot4[1].tf, true)
		table.remove(slot4, 1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-48, warpins: 1 ---
		slot6 = ChatBubble.New(cloneTplTo(slot5, slot0.content))
		--- END OF BLOCK #0 ---



	end

	slot6.tf:SetSiblingIndex(slot2)
	table.insert(slot0.bubbleCards, slot6)
	slot6:update(slot1)
	removeOnButton(slot6.headTF)
	onButton(slot0, slot6.headTF, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		uv0:emit(NotificationMediator.OPEN_INFO, uv2, uv0:findTF("shipicon/icon", uv1.tf).position, uv3.content)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.appendPublic(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-42, warpins: 1 ---
	slot4 = nil

	if #slot0.poolBubble.public > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-18, warpins: 1 ---
		setActive(slot3[1].tf, true)
		table.remove(slot3, 1)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-27, warpins: 1 ---
		slot4 = ChatBubblePublic.New(cloneTplTo(slot0.prefabPublic, slot0.content))
		--- END OF BLOCK #0 ---



	end

	slot4.tf:SetSiblingIndex(slot2)
	table.insert(slot0.bubbleCards, slot4)
	slot4:update(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.appendTopPublic(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-73, warpins: 1 ---
	if 120 - (pg.TimeMgr.GetInstance():GetServerTime() - slot1.timestamp) <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	SetActive(slot0.topMsg, true)
	ChatProxy.InjectPublic(findTF(slot0.topPublic, "text"):GetComponent("RichText"), slot1)

	findTF(slot0.topPublic, "channel"):GetComponent(typeof(Image)).sprite = GetSpriteFromAtlas("channel", ChatConst.GetChannelSprite(slot1.type) .. "_1920")

	if slot0._topTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-59, warpins: 1 ---
		slot0._topTimer:Stop()

		slot0._topTimer = nil
		--- END OF BLOCK #0 ---



	end

	slot0._topTimer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		SetActive(uv0.topMsg, false)

		uv0._topTimer = nil

		return
		--- END OF BLOCK #0 ---



	end, slot2, 1)

	slot0._topTimer:Start()

	return
	--- END OF BLOCK #0 ---



end

function slot0.showEnterRommTip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-48, warpins: 1 ---
	if slot0.player.chatRoomId == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	if not LeanTween.isTweening(go(slot0.enterRoomTip)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-45, warpins: 1 ---
		LeanTween.value(go(slot0.enterRoomTip), 1, 0, 2):setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			uv0.enterRoomCG.alpha = slot0

			return
			--- END OF BLOCK #0 ---



		end)):setEase(LeanTweenType.easeInSine):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-12, warpins: 1 ---
			uv0.enterRoomCG.alpha = 0

			LeanTween.cancel(go(uv0.enterRoomTip))

			return
			--- END OF BLOCK #0 ---



		end)):setDelay(0.5)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.getPos(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function slot0.displayEmojiPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0:emit(NotificationMediator.OPEN_EMOJI, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		uv0:emit(NotificationMediator.ON_SEND_PUBLIC, uv1.ChannelBits.send, string.gsub(ChatConst.EmojiCode, "code", slot0))

		return
		--- END OF BLOCK #0 ---



	end, Vector3(slot0.emoji.position.x, slot0.emoji.position.y, 0))

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-69, warpins: 1 ---
	if slot0.currentForm == uv0.FORM_BATTLE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		if isActive(slot0.changeRoomPanel) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-14, warpins: 1 ---
			slot0:closeChangeRoomPanel()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-22, warpins: 1 ---
		pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
		--- END OF BLOCK #0 ---



	end

	LeanTween.cancel(slot0._go)
	LeanTween.cancel(go(slot0.enterRoomTip))

	if slot0._topTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-41, warpins: 1 ---
		slot0._topTimer:Stop()

		slot0._topTimer = nil
		--- END OF BLOCK #0 ---



	end

	for slot4, slot5 in ipairs(slot0.bubbleCards or {}) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-53, warpins: 1 ---
		slot5:dispose()
		--- END OF BLOCK #0 ---



	end

	for slot4, slot5 in pairs(slot0.poolBubble) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 58-68, warpins: 1 ---
		for slot9, slot10 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-66, warpins: 1 ---
			slot10:dispose()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

return slot0
