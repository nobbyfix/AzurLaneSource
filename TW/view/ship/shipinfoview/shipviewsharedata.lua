slot0 = class("ShipViewShareData")

slot0.Ctor = function (slot0)
	slot0.shipVO = nil
end

slot0.SetShipVO = function (slot0, slot1)
	slot0.shipVO = slot1
end

slot0.SetPlayer = function (slot0, slot1)
	slot0.player = slot1
end

slot0.HasFashion = function (slot0)
	return #slot0:GetCurGroupSkinList() > 1
end

slot0.GetCurGroupSkinList = function (slot0)
	return slot0:GetGroupSkinList(slot0.shipVO.groupId)
end

slot0.GetGroupSkinList = function (slot0, slot1)
	slot2 = ShipGroup.getSkinList(slot1)

	if pg.ship_data_trans[slot1] and not slot0.shipVO:isRemoulded() then
		slot3 = ShipGroup.GetGroupConfig(slot1).trans_skin

		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].id == slot3 then
				table.remove(slot2, slot7)

				break
			end
		end
	end

	for slot6 = #slot2, 1, -1 do
		if slot2[slot6].show_time and ((type(slot7.show_time) == "string" and slot7.show_time == "stop") or (type(slot7.show_time) == "table" and not pg.TimeMgr.GetInstance():inTime(slot7.show_time))) then
			table.remove(slot2, slot6)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		slot3 = pg.gameset.big_seven_old_skin_timestamp.key_value

		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].skin_type == 3 and slot3 < slot0.shipVO.createTime then
				table.remove(slot2, slot7)
			end
		end
	end

	return slot2
end

return slot0
