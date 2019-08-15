slot0 = class("ShipSkin", import(".BaseVO"))

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
