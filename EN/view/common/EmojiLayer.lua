slot0 = class("EmojiLayer", import("..base.BaseUI"))
slot0.PageEmojiNums = 8

function slot0.getUIName(slot0)
	return "EmojiUI"
end

function slot0.init(slot0)
	slot0.emojiGroup = slot0:findTF("frame/group")
	slot0.emojiType = slot0:findTF("type", slot0.emojiGroup)
	slot0.emojiSnap = slot0:findTF("frame/bg/mask/event"):GetComponent("HScrollSnap")

	slot0.emojiSnap:Init()

	slot0.emojiContent = slot0:findTF("content", slot0.emojiSnap)
	slot0.emojiItem = slot0:findTF("item", slot0.emojiSnap)
	slot0.emojiDots = slot0:findTF("frame/dots")
	slot0.emojiDot = slot0:findTF("dot", slot0.emojiSnap)

	setActive(slot0.emojiItem, false)
	setActive(slot0.emojiDot, false)

	slot0.resource = slot0:findTF("frame/resource")
	slot0.frame = slot0:findTF("frame")
	slot0.frame.position = slot0.contextData.pos or Vector3(0, 0, 0)
	slot0.frame.localPosition = Vector3(slot0.frame.localPosition.x, slot0.frame.localPosition.y, 0)
end

function slot0.didEnter(slot0)
	onButton(slot0, slot0._tf, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SFX_CANCEL)
	slot0:display()
	pg.UIMgr.GetInstance():OverlayPanel(slot0._tf, {
		groupName = slot0:getGroupNameFromData()
	})
end

function slot0.display(slot0)
	slot1 = UIItemList.New(slot0.emojiGroup, slot0.emojiType)

	slot1:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setText(slot2:Find("Text"), i18n("emoji_type_" .. slot3))
			onToggle(uv0, slot2, function (slot0)
				if slot0 then
					uv0:filter(uv1)
				end
			end, SFX_PANEL)
		end
	end)
	slot1:align(#ChatConst.EmojiTypes)
	triggerToggle(slot0.emojiGroup:GetChild(0), true)
end

function slot0.filter(slot0, slot1)
	table.sort(_.map(pg.emoji_template.all, function (slot0)
		return pg.emoji_template[slot0]
	end), function (slot0, slot1)
		if slot0.index == slot1.index then
			return slot0.id < slot1.id
		end

		return slot0.index < slot1.index
	end)

	if slot1 == ChatConst.EmojiCommon then
		for slot9, slot10 in pairs(slot4) do
			table.insert({}, {
				id = slot9,
				count = slot10
			})
		end

		table.sort(slot5, function (slot0, slot1)
			if slot0.count == slot1.count then
				return slot0.id < slot1.id
			end

			return slot1.count < slot0.count
		end)

		slot2 = _.map(slot5, function (slot0)
			return pg.emoji_template[slot0.id]
		end)
	else
		slot2 = _.filter(slot2, function (slot0)
			return slot0.achieve == 0 and table.contains(slot0.type, uv0)
		end)
	end

	slot0.tplCaches = slot0.tplCaches or {}

	for slot7 = slot0.emojiContent.childCount - 1, math.ceil(#slot2 / uv0.PageEmojiNums), -1 do
		Destroy(slot0.emojiDots:GetChild(slot7))

		slot8 = slot0.emojiSnap:RemoveChild(slot7)
		slot8.transform.localScale = Vector3.one

		slot8.transform:SetParent(slot0._tf, false)
		setActive(slot8, false)
		slot0:clearItem(slot8)
		table.insert(slot0.tplCaches, slot8)
	end

	for slot7 = slot0.emojiContent.childCount + 1, slot3, 1 do
		slot8 = nil

		setActive((#slot0.tplCaches <= 0 or table.remove(slot0.tplCaches)) and Instantiate(slot0.emojiItem), true)
		slot0.emojiSnap:AddChild((#slot0.tplCaches <= 0 or table.remove(slot0.tplCaches)) and Instantiate(slot0.emojiItem))
		cloneTplTo(slot0.emojiDot, slot0.emojiDots)
	end

	for slot7 = 0, slot0.emojiContent.childCount - 1, 1 do
		slot8 = slot0.emojiContent:GetChild(slot7)

		slot0:clearItem(slot8)

		slot10 = UIItemList.New(slot8, slot8:Find("face"))

		slot10:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				PoolMgr.GetInstance():GetPrefab("emoji/" .. uv0[slot1 + 1].pic, uv0[slot1 + 1].pic, true, function (slot0)
					if uv0 then
						slot0.name = uv1.pic

						if slot0:GetComponent("Animator") then
							slot1.enabled = false
						end

						if slot0:GetComponent("CriManaEffectUI") then
							slot1:Pause(true)
						end

						setParent(slot0, uv0, false)
					else
						PoolMgr.GetInstance():ReturnPrefab("emoji/" .. uv1.pic, uv1.pic, slot0)
					end
				end)
				onButton(uv1, slot2, function ()
					getProxy(ChatProxy).addUsedEmoji(slot0, uv0.id)
					uv1.contextData.callback(uv0.id)
					triggerButton(uv1._tf)
				end, SFX_PANEL)
			end
		end)
		slot10:align(#_.slice(slot2, slot7 * uv0.PageEmojiNums + 1, uv0.PageEmojiNums))
	end
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0._tf)
end

function slot0.clearItem(slot0, slot1)
	eachChild(slot1, function (slot0)
		if slot0.childCount > 0 then
			PoolMgr.GetInstance():ReturnPrefab("emoji/" .. slot0:GetChild(0).gameObject.name, slot0.GetChild(0).gameObject.name, slot0.GetChild(0).gameObject)
		end
	end)
end

function slot0.willExit(slot0)
	eachChild(slot0.emojiContent, function (slot0)
		uv0:clearItem(slot0)
	end)
	_.each(slot0.tplCaches, function (slot0)
		uv0:clearItem(slot0)
	end)
end

return slot0
