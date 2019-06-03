class("GetChargeListCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()

	pg.ConnectionMgr.GetInstance():Send(16104, {
		type = 0
	}, 16105, function (slot0)
		slot1 = {
			[Goods.New(slot6, Goods.TYPE_CHARGE).id] = Goods.New(slot6, Goods.TYPE_CHARGE)
		}

		for slot5, slot6 in ipairs(slot0.pay_list) do
		end

		for slot6, slot7 in ipairs(slot0.first_pay_list) do
			table.insert({}, slot7)
		end

		for slot7, slot8 in ipairs(slot0.normal_list) do
			table.insert({
				[Goods.New(slot8, Goods.TYPE_GIFT_PACKAGE).id] = Goods.New(slot8, Goods.TYPE_GIFT_PACKAGE)
			}, slot8)
		end

		for slot8, slot9 in ipairs(slot0.normal_group_list) do
			table.insert({}, slot9)
		end

		slot5 = getProxy(ShopsProxy)

		slot5:setChargedList(slot1)
		slot5:setFirstChargeList(slot2)
		slot5:setNormalList(slot3)
		slot5:setNormalGroupList(slot4)
		uv0:sendNotification(GAME.GET_CHARGE_LIST_DONE, {
			chargedList = slot1,
			firstChargeIds = slot2,
			normalList = slot3,
			normalGroupList = slot4
		})
	end)
end

return class("GetChargeListCommand", pm.SimpleCommand)
