class("CancelLearnTacticsCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot4 = slot2.type
	slot6 = getProxy(NavalAcademyProxy).getStudentById(slot5, slot3)
	slot7 = slot2.callback
	slot8 = slot2.onConfirm

	if not getProxy(BayProxy).getShipById(slot9, slot6.shipId).skills[slot6:getSkillId(getProxy(BayProxy).getShipById(slot9, slot6.shipId))] then
		pg.TipsMgr:GetInstance():ShowTips(i18n("tactics_noskill_erro"))

		return
	end

	pg.ConnectionMgr.GetInstance():Send(22203, {
		room_id = slot3,
		type = slot4
	}, 22204, function (slot0)
		if slot0.result == 0 then
			uv0:addSkillExp(Clone(uv0.skills[uv1]).id, slot0.exp)
			uv2:updateShip(uv0)
			uv3:deleteStudent(uv4)
			uv5:sendNotification(GAME.CANCEL_LEARN_TACTICS_DONE, {
				id = uv4,
				shipId = uv6.shipId,
				totalExp = slot0.exp,
				oldSkill = Clone(uv0.skills[uv1]),
				newSkill = uv0.skills[uv1],
				onConfirm = uv7,
				newShipVO = uv0
			})
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("lesson_endToLearn", slot0.result))
		end

		if uv8 ~= nil then
			uv8()
		end
	end)
end

return class("CancelLearnTacticsCommand", pm.SimpleCommand)
