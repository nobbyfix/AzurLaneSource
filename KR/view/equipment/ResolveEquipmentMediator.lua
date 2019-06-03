slot0 = class("ResolveEquipmentMediator", import("..base.ContextMediator"))
slot0.ON_RESOLVE = "ResolveEquipmentMediator:ON_RESOLVE"

function slot0.register(slot0)
	slot0:bind(uv0.ON_RESOLVE, function (slot0, slot1)
		uv0:sendNotification(GAME.DESTROY_EQUIPMENTS, {
			equipments = slot1
		})
	end)
	slot0.viewComponent:setPlayer(slot1)
	slot0.viewComponent:setEquipments(slot0.contextData.Equipments)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.DESTROY_EQUIPMENTS_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.DESTROY_EQUIPMENTS_DONE and table.getCount(slot1:getBody()) ~= 0 then
		slot0.viewComponent:emit(BaseUI.ON_AWARD, {
			items = slot1.getBody()
		}, AwardInfoLayer.TITLE.ITEM, function ()
			uv0.viewComponent:emit(BaseUI.ON_CLOSE)
		end)
	end
end

return slot0
