slot0 = class("ChatRoomLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "ChatRoomUI"
end

function slot0.setFriendVO(slot0, slot1)
	slot0.friendVO = slot1
end

function slot0.setFriends(slot0, slot1)
	slot0.friendVOs = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.setCacheMsgs(slot0, slot1)
	slot0.cacheMsgsVOs = slot1
end

function slot0.init(slot0)
	slot0.frame = slot0:findTF("frame")
	slot0.friendView = slot0:findTF("left_length/scrollView", slot0.frame)
	slot0.chatPanel = slot0:findTF("notification_panel", slot0.frame)
	slot0.chatPanelTitle = slot0:findTF("notification_panel/frame/top/name", slot0.frame)
	slot0.sendBtn = slot0:findTF("frame/bottom/send", slot0.chatPanel)
	slot0.inputTF = slot0:findTF("frame/bottom/input", slot0.chatPanel)
	slot0.chatsRect = slot0:findTF("frame/list", slot0.chatPanel)
	slot0.chatsContainer = slot0:findTF("frame/list/content", slot0.chatPanel)
	slot0.closeBtn = slot0:findTF("frame/notification_panel/frame/top/close_btn")
	slot0.otherPopTpl = slot0:getTpl("frame/list/popo_other", slot0.chatPanel)
	slot0.selfPopTpl = slot0:getTpl("frame/list/popo_self", slot0.chatPanel)

	pg.UIMgr.GetInstance():BlurPanel(slot0.frame, false, {
		groupName = LayerWeightConst.GROUP_CHATROOM
	})

	slot0.mainPanel = pg.UIMgr:GetInstance().UIMain
end

function slot0.didEnter(slot0)
	onButton(slot0, slot1, function ()
		uv1:emit(ChatRoomMediator.OPEN_EMOJI, Vector3(uv0.position.x, uv0.position.y, 0), function (slot0)
			uv0:sendMessage(string.gsub(ChatConst.EmojiCode, "code", slot0))
		end)
	end, SFX_PANEL)
	onButton(slot0, slot0._tf, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SOUND_BACK)
	onButton(slot0, slot0.closeBtn, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SOUND_BACK)
	slot0:initFriends()
end

function slot0.initFriends(slot0)
	slot0.friendItems = {}
	slot0.friendRect = slot0.friendView:GetComponent("LScrollRect")

	function slot0.friendRect.onInitItem(slot0)
		uv0:initFriend(slot0)
	end

	function slot0.friendRect.onUpdateItem(slot0, slot1)
		uv0:updateFriend(slot0, slot1)
	end

	slot0:sortFriend()
end

function slot0.createFriendItem(slot0, slot1)
	slot3 = slot0.friendVO

	return {
		tf = tf(slot1),
		nameTF = ()["tf"]:Find("name"):GetComponent(typeof(Text)),
		iconTF = ()["tf"]:Find("shipicon/icon"):GetComponent(typeof(Image)),
		maryyFrame = ()["tf"]:Find("shipicon/frame_marry"),
		commonFrame = ()["tf"]:Find("shipicon/frame_common"),
		toggle = ()["tf"]:GetComponent(typeof(Toggle)),
		tipTF = ()["tf"]:Find("tip"),
		dateTF = ()["tf"]:Find("lv_bg/date"):GetComponent(typeof(Text)),
		onlineTF = ()["tf"]:Find("lv_bg/online"),
		levelTF = ()["tf"]:Find("lv_bg/Text"):GetComponent(typeof(Text)),
		update = function (slot0, slot1, slot2)
			setActive(uv0.tipTF, false)

			slot0.friendVO = slot1
			uv0.nameTF.text = slot1.name
			uv0.levelTF.text = "LV." .. slot1.level
			slot3 = pg.ship_data_statistics[slot1.icon]
			slot4 = Ship.New({
				configId = slot1.icon,
				skin_id = slot1.skinId
			})

			LoadSpriteAsync("qicon/" .. slot4:getPainting(), function (slot0)
				if not slot0 then
					uv0.iconTF.sprite = GetSpriteFromAtlas("heroicon/unknown", "")
				else
					uv0.iconTF.sprite = slot0
				end
			end)
			setActive(slot0.maryyFrame, slot4.skinId and slot4.skinId ~= 0)
			setActive(slot0.commonFrame, not slot4.skinId or slot4.skinId == 0)

			if uv1.id == slot1.id and uv0.toggle.isOn == false then
				triggerToggle(uv0.tf, true)
			end

			setActive(slot0.onlineTF, slot1.online == Friend.ONLINE)
			setActive(uv0.dateTF, slot1.online == Friend.OFFLINE)

			uv0.dateTF.text = pg.TimeMgr.GetInstance():DescTime(slot1.preOnLineTime, "%Y/%m/%d")
		end
	}
end

function slot0.updateFriend(slot0, slot1, slot2)
	if not slot0.friendItems[slot2] then
		slot0:initFriend(slot2)

		slot3 = slot0.friendItems[slot2]
	end

	slot3:update(slot0.friendVOs[slot1 + 1])
end

function slot0.initFriend(slot0, slot1)
	onToggle(slot0, slot0:createFriendItem(slot1).tf, function (slot0)
		if slot0 and uv0.friendVO then
			uv1:openChatPanel(uv0.friendVO)

			uv1.contextData.friendVO = friendVO

			uv1:setFriendVO(uv0.friendVO)
			uv1:emit(ChatRoomMediator.CLEAR_UNREADCOUNT, uv0.friendVO.id)
		end
	end)

	slot0.friendItems[slot1] = slot0.createFriendItem(slot1)
end

function slot0.updateFriendVO(slot0, slot1)
	for slot5, slot6 in ipairs(slot0.friendVOs) do
		if slot6.id == slot1.id then
			slot0.friendVOs[slot5] = slot1

			break
		end
	end

	if slot1.id == slot0.friendVO.id then
		slot0.friendVO = slot1
	end

	slot0:sortFriend()
end

function slot0.sortFriend(slot0)
	table.sort(slot0.friendVOs, function (slot0, slot1)
		if (slot0.id == uv0.friendVO.id and 1 or 0) == (slot1.id == uv0.friendVO.id and 1 or 0) then
			if slot0.online == slot1.online then
				if slot0.level == slot1.level then
					return slot0.id < slot1.id
				else
					return slot1.level < slot0.level
				end
			else
				return slot1.online < slot0.online
			end
		else
			return slot3 < slot2
		end
	end)
	slot0.friendRect:SetTotalCount(#slot0.friendVOs, -1)
end

function slot0.openChatPanel(slot0, slot1)
	slot0.friendVO = slot1

	removeAllChildren(slot0.chatsContainer)

	for slot6, slot7 in pairs(slot0.cacheMsgsVOs[slot1.id] or {}) do
		slot0:appendMsg(slot7)
	end

	setText(slot0.chatPanelTitle, slot0.friendVO.name)
	setActive(slot0.chatPanel, true)
	onButton(slot0, slot0.sendBtn, function ()
		setInputText(uv0.inputTF, "")
		uv0:sendMessage(getInputText(uv0.inputTF))
	end)
end

function slot0.sendMessage(slot0, slot1)
	if slot1 == "" then
		pg.TipsMgr:GetInstance():ShowTips(i18n("friend_send_msg_null_tip"))

		return
	end

	slot0:emit(ChatRoomMediator.SEND_FRIEND_MSG, slot0.friendVO.id, slot1)
end

function slot0.getPlayer(slot0, slot1)
	if slot1 == slot0.playerVO.id then
		return slot0.playerVO
	end

	for slot5, slot6 in ipairs(slot0.friendVOs) do
		if slot6.id == slot1 then
			return slot6
		end
	end
end

function slot0.appendMsg(slot0, slot1)
	if slot1.playerId ~= slot0.playerVO.id and slot1.playerId ~= slot0.friendVO.id then
		return
	end

	slot0:emit(ChatRoomMediator.CLEAR_UNREADCOUNT, slot0.friendVO.id)

	slot2 = slot0.otherPopTpl

	if slot1.playerId == slot0.playerVO.id then
		slot2 = slot0.selfPopTpl
		slot1.player = setmetatable(Clone(slot0.playerVO), {
			__index = slot0:getPlayer(slot1.playerId)
		})
		slot1.isSelf = true
	end

	ChatRoomBubble.New(slot4).update(slot5, slot1)
	scrollToBottom(slot0.chatsRect)
end

function slot0.closeChatPanel(slot0)
	setActive(slot0.chatPanel, false)
end

function slot0.willExit(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.frame, slot0._tf)
	eachChild(slot0.chatsContainer, function (slot0)
		if uv0:findTF("face", slot0).childCount > 0 then
			PoolMgr.GetInstance():ReturnPrefab("emoji/" .. slot1:GetChild(0).gameObject.name, slot1.GetChild(0).gameObject.name, slot1.GetChild(0).gameObject)
		end
	end)
end

return slot0
