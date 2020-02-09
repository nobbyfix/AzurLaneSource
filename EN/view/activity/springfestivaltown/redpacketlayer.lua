slot0 = class("RedPacketLayer", import("...base.BaseUI"))

slot0.getUIName = function (slot0)
	return "RedPacketUI"
end

slot0.init = function (slot0)
	slot0:initData()
	slot0:findUI()
	slot0:addListener()
end

slot0.didEnter = function (slot0)
	slot0:updateUI()
end

slot0.willExit = function (slot0)
	return
end

slot0.initData = function (slot0)
	slot0.activityProxy = getProxy(ActivityProxy)
	slot1 = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)
	slot0.activityID = slot1.id
	slot0.countToStory = {}

	if slot1:getConfig("config_client").story then
		for slot6, slot7 in ipairs(slot2) do
			slot0.countToStory[slot7[1]] = slot7[2]
		end
	end
end

slot0.findUI = function (slot0)
	slot0.packetBtn = slot0:findTF("Container/PacketBtn")
	slot0.packetMask = slot0:findTF("Container/PacketBtnMask")
	slot0.helpBtn = slot0:findTF("Container/HelpBtn")
	slot0.tagTF = slot0:findTF("tag", slot0.packetBtn)
	slot0.countTF = slot0:findTF("Container/Count")
	slot0.specialTF = slot0:findTF("Container/Count/Special")
	slot0.specialCountText = slot0:findTF("Text", slot0.specialTF)
	slot0.normalTF = slot0:findTF("Container/Count/Normal")
	slot0.normalCountText = slot0:findTF("Text", slot0.normalTF)
	slot0.backBtn = slot0:findTF("Top/BackBtn")
end

slot0.addListener = function (slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:closeView()
	end, SFX_PANEL)
	onButton(slot0, slot0.packetBtn, function ()
		pg.m02:sendNotification(GAME.ACTIVITY_OPERATION, {
			cmd = 1,
			activity_id = slot0.activityID
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.help_chunjie_jiulou.tip
		})
	end, SFX_PANEL)
end

slot0.updateUI = function (slot0)
	slot1 = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)
	slot2 = slot1.data3

	setActive(slot0.tagTF, math.min(slot1.data1, slot1.data2) > 0)
	setActive(slot0.normalTF, slot1.data1 - math.min(slot1.data1, slot1.data2) > 0)
	setActive(slot0.specialTF, slot4 > 0)
	setActive(slot0.countTF, slot3 > 0)
	setText(slot0.normalCountText, slot1.data1 - math.min(slot1.data1, slot1.data2))
	setText(slot0.specialCountText, slot4)
	setActive(slot0.packetBtn, slot3 > 0)
	setActive(slot0.packetMask, slot3 <= 0)
end

slot0.tryPlayStory = function (slot0)
	slot1 = slot0.activityProxy:getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS)
	slot5 = slot1.data1 - math.min(slot1.data1, slot1.data2)

	if slot0.countToStory[slot1.data3 - slot1.data2] and not pg.StoryMgr.GetInstance():IsPlayed(slot7) then
		slot8:Play(slot7)
	end
end

slot0.onSubmitFinished = function (slot0)
	slot0:updateUI()
	slot0:tryPlayStory()
end

slot0.isShowRedPoint = function ()
	return getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RED_PACKETS).data1 > 0
end

return slot0
