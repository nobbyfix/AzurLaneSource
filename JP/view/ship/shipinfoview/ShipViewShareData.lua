slot0 = class("ShipViewShareData")

function slot0.Ctor(slot0)
	slot0.shipVO = nil
end

function slot0.SetShipVO(slot0, slot1)
	slot0.shipVO = slot1
end

function slot0.SetPlayer(slot0, slot1)
	slot0.player = slot1
end

function slot0.HasFashion(slot0)
	return #slot0:GetCurGroupSkinList() > 1
end

function slot0.GetCurGroupSkinList(slot0)
	return slot0:GetGroupSkinList(slot0.shipVO.groupId)
end

function slot0.GetGroupSkinList(slot0, slot1)
	slot2 = ShipGroup.getSkinList(slot1)

	if pg.ship_data_trans[slot1] and not slot0.shipVO:isRemoulded() then
		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].id == ShipGroup.GetGroupConfig(slot1).trans_skin then
				table.remove(slot2, slot7)

				break
			end
		end
	end

	for slot6 = #slot2, 1, -1 do
		if slot2[slot6].show_time and (type(slot7.show_time) == "string" and slot7.show_time == "stop" or type(slot7.show_time) == "table" and not pg.TimeMgr:GetInstance():inTime(slot7.show_time)) then
			table.remove(slot2, slot6)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].skin_type == 3 and pg.gameset.big_seven_old_skin_timestamp.key_value < slot0.shipVO.createTime then
				table.remove(slot2, slot7)
			end
		end
	end

	return slot2
end

return slot0
