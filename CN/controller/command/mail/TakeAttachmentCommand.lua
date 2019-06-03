class("TakeAttachmentCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if getProxy(MailProxy):getMailById(slot1:getBody()) == nil then
		pg.TipsMgr:GetInstance():ShowTips(i18n("mail_takeAttachment_error_noMail", slot2))

		return
	end

	if slot4.attachFlag ~= slot4.ATTACHMENT_EXIST then
		pg.TipsMgr:GetInstance():ShowTips(i18n("mail_takeAttachment_error_noAttach"))

		return
	end

	slot9 = getProxy(BayProxy).getShipCount(slot7)
	slot10 = getProxy(EquipmentProxy).getCapacity(slot8)
	slot11 = getConfigFromLevel1(pg.user_level, getProxy(PlayerProxy).getData(slot5).level)

	if slot4:getAttatchmentsCount(DROP_TYPE_RESOURCE, 1) > 0 and slot6:GoldMax(slot12) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("gold_max_tip_title") .. i18n("resource_max_tip_mail"))

		return
	end

	if slot4:getAttatchmentsCount(DROP_TYPE_RESOURCE, 2) > 0 and slot6:OilMax(slot13) then
		pg.TipsMgr:GetInstance():ShowTips(i18n("oil_max_tip_title") .. i18n("resource_max_tip_mail"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(30004, {
		id = {
			slot4.id
		}
	}, 30005, function (slot0)
		if uv0.readFlag == 0 then
			uv1:removeMail(uv0)
		else
			uv0.readFlag = 2
			uv0.attachFlag = uv0.ATTACHMENT_TAKEN

			uv1:updateMail(uv0)
		end

		for slot4, slot5 in ipairs(slot0.attachment_list) do
			uv2:sendNotification(GAME.ADD_ITEM, MailAttachment.New(slot5))
		end

		uv2:sendNotification(GAME.OPEN_MAIL_ATTACHMENT, {
			items = slot0.attachment_list
		})
		uv2:sendNotification(GAME.TAKE_ATTACHMENT_DONE)
		uv1:unpdateExistAttachment(uv1:GetAttachmentCount() - 1)
	end)
end

return class("TakeAttachmentCommand", pm.SimpleCommand)
