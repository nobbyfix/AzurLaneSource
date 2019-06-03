class("ChargeSuccessCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.payId
	slot6 = slot2.gem_free
	slot7 = Goods.New({
		shop_id = slot2.shopId
	}, Goods.TYPE_CHARGE)

	if slot2.gem > 0 then
		getProxy(PlayerProxy).getData(slot8):addResources({
			chargeGem = slot5
		})
	end

	if slot6 > 0 then
		slot9:addResources({
			freeGem = slot6
		})
	end

	if slot7:isMonthCard() then
		slot11 = GetZeroTime() + 2419200

		if slot9:getCardById(VipCard.MONTH) and slot10.leftDate ~= 0 then
			slot10.leftDate = slot10.leftDate + 2592000
		else
			slot10 = VipCard.New({
				data = 0,
				type = VipCard.MONTH,
				left_date = slot11
			})
		end

		slot9:addVipCard(slot10)
	end

	slot8:updatePlayer(slot9)

	slot12 = false

	for slot16, slot17 in pairs(getProxy(ShopsProxy):getChargedList() or {}) do
		if slot17.id == slot3 then
			getProxy(ShopsProxy).getChargedList() or [slot16]:increaseBuyCount()

			slot12 = true

			break
		end
	end

	if not slot12 then
		slot11[slot3] = Goods.New({
			pay_count = 1,
			shop_id = slot3
		}, Goods.TYPE_CHARGE)
	end

	slot10:setChargedList(slot11)

	if slot7:firstPayDouble() then
		if not table.contains(slot10:getFirstChargeList() or {}, slot3) then
			table.insert(slot13, slot3)
		end

		slot10:setFirstChargeList(slot13)
	end

	if getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHARGEAWARD) and slot14.data1 == 0 then
		slot14.data1 = 1
	end

	pg.TipsMgr:GetInstance():ShowTips(i18n("charge_success"))
end

return class("ChargeSuccessCommand", pm.SimpleCommand)
