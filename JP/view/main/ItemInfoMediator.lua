slot0 = class("ItemInfoMediator", import("..base.ContextMediator"))
slot0.USE_ITEM = "ItemInfoMediator:USE_ITEM"
slot0.COMPOSE_ITEM = "ItemInfoMediator:COMPOSE_ITEM"
slot0.ON_BLUEPRINT_SCENE = "ItemInfoMediator:ON_BLUEPRINT_SCENE"

function slot0.register(slot0)
	slot0:bind(uv0.ON_BLUEPRINT_SCENE, function ()
		uv0:sendNotification(GAME.GO_SCENE, SCENE.SHIPBLUEPRINT)
	end)

	slot2 = slot0.contextData.mine

	if slot0.contextData.info.type == DROP_TYPE_SHIP then
		slot0.viewComponent:setShipId(slot1.id)
	elseif slot1.type == DROP_TYPE_ITEM then
		slot0:updateItem()

		if slot2 then
			slot0:bind(uv0.USE_ITEM, function (slot0, slot1, slot2)
				if getProxy(BagProxy):getItemById(slot1).getTempCfgTable(slot3).usage == ItemUsage.DROP and slot3:getConfig("type") ~= Item.EQUIPMENT_SKIN_BOX then
					if not skipCheck and getProxy(PlayerProxy).getData(slot7).equip_bag_max < getProxy(EquipmentProxy).getCapacity(slot5) + slot2 then
						NoPosMsgBox(i18n("switch_to_shop_tip_noPos"), openDestroyEquip, gotoChargeScene)
						uv0.viewComponent:doClose()

						return
					end
				end

				uv0.viewComponent:PlayOpenBox(slot3:getTempConfig("display_effect"), function ()
					if table.contains(ITEM_ID_FUDAIS, uv0) then
						uv1:sendNotification(GAME.OPEN_MAIL_ATTACHMENT, {
							items = {
								{
									id = uv0,
									type = DROP_TYPE_ITEM,
									number = uv2
								}
							}
						})
					else
						uv1:sendNotification(GAME.USE_ITEM, {
							id = uv0,
							count = uv2
						})
					end
				end)
			end)
			slot0:bind(uv0.COMPOSE_ITEM, function (slot0, slot1, slot2)
				uv0:sendNotification(GAME.COMPOSE_ITEM, {
					id = slot1,
					count = slot2
				})
			end)
		end
	end
end

function slot0.listNotificationInterests(slot0)
	return {
		BagProxy.ITEM_UPDATED,
		GAME.USE_ITEM_DONE,
		GAME.OPEN_MAIL_ATTACHMENT_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == BagProxy.ITEM_UPDATED then
		if slot0.contextData.mine and slot0:updateItem().count <= 0 then
			slot0.viewComponent:doClose()
		end
	elseif slot2 == GAME.USE_ITEM_DONE then
		slot0.viewComponent:setComposeCount(1)
	elseif slot2 == GAME.OPEN_MAIL_ATTACHMENT_DONE and slot3.items and #slot4 > 0 then
		slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot4, function ()
			if uv0.callback then
				uv0.callback()
			end
		end)
	end
end

function slot0.updateItem(slot0)
	slot4 = nil

	slot0.viewComponent:setItem(slot0.contextData.mine and (getProxy(BagProxy):getItemById(slot0.contextData.info.id) or Item.New({
		count = 0,
		id = slot0.contextData.info.id
	})) or Item.New({
		id = slot0.contextData.info.id,
		count = defaultValue(slot0.contextData.info.count, 0)
	}))

	return slot0.contextData.mine and (getProxy(BagProxy).getItemById(slot0.contextData.info.id) or Item.New()) or Item.New()
end

return slot0
