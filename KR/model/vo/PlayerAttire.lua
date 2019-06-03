class("PlayerAttire", import(".BaseVO")).Ctor = function (slot0, slot1)
	slot0.icon = slot1.icon or slot1.display or {}.icon
	slot0.character = slot1.character or slot1.display or .character
	slot0.skinId = slot1.skin_id or slot1.display or .skin or 0

	if slot0.skinId == 0 and pg.ship_data_statistics[slot0.icon] then
		slot0.skinId = slot3.skin_id
	end

	slot0.remoulded = false

	if slot1.remoulded and slot1.remoulded == 1 or slot2.transform_flag and slot2.transform_flag == 1 then
		slot0.remoulded = true
	end

	slot0.propose = slot1.propose and slot1.propose > 0 or slot2.marry_flag and slot2.marry_flag > 0
	slot0.proposeTime = slot1.propose or slot2.marry_flag
	slot0.iconFrame = slot1.icon_frame or slot2.icon_frame or 0
	slot0.chatFrame = slot1.chat_frame or slot2.chat_frame or 0
	slot0.iconTheme = slot1.icon_theme or slot2.icon_theme or 0
end

return class("PlayerAttire", import(".BaseVO"))
