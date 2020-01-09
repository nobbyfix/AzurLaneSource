slot0 = class("ShipSkin", import(".BaseVO"))
slot0.SKIN_TYPE_DEFAULT = -1
slot0.SKIN_TYPE_COMMON_FASHION = 0
slot0.SKIN_TYPE_PROPOSE = 1
slot0.SKIN_TYPE_REMAKE = 2
slot0.SKIN_TYPE_OLD = 3
slot0.SKIN_TYPE_NOT_HAVE_HIDE = 4
slot0.WITH_BGM = 5
slot1 = pg.ship_skin_template.get_id_list_by_ship_group

slot0.GetSkinByType = function (slot0, slot1)
	slot2 = slot0[slot0] or {}

	for slot6, slot7 in ipairs(slot2) do
		if pg.ship_skin_template[slot7].skin_type == slot1 then
			return slot8
		end
	end
end

slot0.GetAllSkinByGroup = function (slot0)
	slot1 = {}
	slot2 = slot0[slot0] or {}

	for slot6, slot7 in ipairs(slot2) do
		if pg.ship_skin_template[slot7].no_showing ~= "1" then
			table.insert(slot1, slot8)
		end
	end

	return slot1
end

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.id
	slot0.endTime = slot1.end_time or slot1.time or 0
end

slot0.bindConfigTable = function (slot0)
	return pg.ship_skin_template
end

slot0.isExpireType = function (slot0)
	return slot0.endTime > 0
end

slot0.getExpireTime = function (slot0)
	return slot0.endTime
end

slot0.isExpired = function (slot0)
	return slot0.endTime <= pg.TimeMgr.GetInstance():GetServerTime()
end

slot0.getRemainTime = function (slot0)
	return slot0:getExpireTime() - pg.TimeMgr.GetInstance():GetServerTime()
end

slot0.getIcon = function (slot0)
	return slot0:getConfig("painting")
end

return slot0
