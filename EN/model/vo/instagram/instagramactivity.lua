slot0 = class("InstagramActivity", import("..Activity"))

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.messages = {}

	for slot5, slot6 in ipairs(slot1.ins_message_list) do
		slot0.messages[Instagram.New(slot6).id] = Instagram.New(slot6)
	end

	slot0.messageIds = pg.activity_ins_template.all
end

slot0.ExistMessage = function (slot0)
	return table.getCount(slot0.messages) > 0
end

slot0.GetMessages = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.messages) do
		table.insert(slot1, slot6)
	end

	return slot1
end

slot0.GetData = function (slot0)
	return Clone(slot0.messages)
end

slot0.UpdateActiveCnt = function (slot0)
	slot0.data1 = slot0.data1 - 1
end

slot0.UpdateNextPushTime = function (slot0, slot1)
	slot0.data2 = slot1
end

slot0.GetNextPustTime = function (slot0)
	return slot0.data2
end

slot0.GetCanActiveCnt = function (slot0)
	return slot0.data1
end

slot0.CanBeActivated = function (slot0)
	return slot0.data1 > 0
end

slot0.ShouldFetchNewMessage = function (slot0)
	return slot0:GetNextPustTime() <= pg.TimeMgr.GetInstance():GetServerTime()
end

slot0.GetNextId = function (slot0)
	return slot0.messageIds[table.getCount(slot0.messages) + 1]
end

slot0.GetMessageById = function (slot0, slot1)
	return slot0.messages[slot1]
end

slot0.AddMessage = function (slot0, slot1)
	slot0.messages[slot1.id] = slot1
end

slot0.UpdateMessage = function (slot0, slot1)
	if not slot0.messages[slot1.id] then
		slot0:AddMessage(slot1)
	else
		slot0.messages[slot1.id] = slot1
	end
end

slot0.ShouldShowTip = function (slot0)
	return _.any(slot0:GetMessages(), function (slot0)
		return slot0:ShouldShowTip()
	end)
end

return slot0
