slot0 = class("MonthlyShop", import(".BaseVO"))
slot1 = import(".Goods")

slot0.Ctor = function (slot0)
	slot0.goods = {}
end

slot0.GoodsType = nil

slot0.isOpen = function (slot0)
	if not slot0.id then
		return false
	end

	slot1 = false

	if slot0:bindConfigTable()[slot0.id] then
		slot3 = pg.TimeMgr.GetInstance()

		return slot3:STimeDescS(slot3:GetServerTime(), "*t").month == slot0.id
	end
end

slot0.getRestDays = function (slot0)
	if not slot0.id then
		return 0
	end

	slot1 = pg.TimeMgr.GetInstance()
	Clone(slot2).month = slot0.id

	if Clone(slot2).month >= 12 then
		slot3.month = 0
		slot3.year = slot3.year + 1
	end

	slot3.month = slot3.month + 1
	slot3.day = 0

	return math.max(os.date("%d", os.time(slot3)) - slot2.day + 1, 1)
end

slot0.GetRestTime = function (slot0)
	if not slot0.id then
		return 0
	end

	slot1 = pg.TimeMgr.GetInstance()
	Clone(slot2).month = slot0.id

	if Clone(slot2).month >= 12 then
		slot3.month = 0
		slot3.year = slot3.year + 1
	end

	slot3.month = slot3.month + 1
	slot3.day = 0
	slot3.hour = 23
	slot3.min = 59
	slot3.sec = 59
	slot3.isdst = false

	return math.max(os.time(slot3) - slot1:GetServerTime(), 0)
end

slot0.getSortGoods = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.goods) do
		table.insert(slot1, slot6)
	end

	table.sort(slot1, function (slot0, slot1)
		if ((slot0:canPurchase() and 1) or 0) == ((slot1:canPurchase() and 1) or 0) then
			if slot0:getConfig("order") == slot1:getConfig("order") then
				return slot0.id < slot1.id
			else
				return slot4 < slot5
			end
		else
			return slot3 < slot2
		end
	end)

	return slot1
end

slot0.getGoodsCfg = function (slot0, slot1)
	return pg.activity_shop_template[slot1]
end

slot0.getGoodsById = function (slot0, slot1)
	return slot0.goods[slot1]
end

slot0.bindConfigTable = function (slot0)
	return pg.month_shop_template
end

return slot0
