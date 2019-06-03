slot0 = class("ShipUpgradeMediator2", import("..base.ContextMediator"))
slot0.UPGRADE_SHIP = "ShipUpgradeMediator2:UPGRADE_SHIP"
slot0.ON_SELECT_SHIP = "ShipUpgradeMediator2:ON_SELECT_SHIP"
slot0.NEXTSHIP = "ShipUpgradeMediator2:NEXTSHIP"

function slot0.register(slot0)
	slot0.bayProxy = getProxy(BayProxy)

	slot0.viewComponent:setPlayer(slot2)
	slot0:sendNotification(GAME.SET_SHIP_FLAG, {
		shipsById = slot0.bayProxy:getRawData()
	})
	slot0.viewComponent:setShips(slot3)
	slot0.viewComponent:setItems(getProxy(BagProxy).getData(slot4))
	slot0.viewComponent:setShip(slot5)
	slot0:bind(uv0.UPGRADE_SHIP, function (slot0, slot1)
		uv0:sendNotification(GAME.UPGRADE_STAR, {
			shipId = uv0.contextData.shipId,
			shipIds = slot1
		})
	end)
	slot0:bind(uv0.ON_SELECT_SHIP, function (slot0, slot1, slot2)
		for slot10, slot11 in pairs(uv1) do
			if pg.ship_data_template[slot11.configId].group_type ~= pg.ship_data_template[slot1.configId].group_type and not slot11:isTestShip() or slot1.id == slot11.id or slot11:isTestShip() and not slot11:canUseTestShip(slot1:getRarity()) or table.contains(uv0.bayProxy:fileterShips(ShipStatus.FILTER_SHIPS_FLAGS_1), slot11.id) then
				table.insert({}, slot11.id)
			end
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.DOCKYARD, {
			skipSelect = true,
			leftTopInfo = i18n("word_upgrade"),
			flags = {
				inSham = true,
				inActivity = true
			},
			selectedMax = slot2 or 1,
			selectedMin = slot2 or 1,
			ignoredIds = slot3,
			selectedIds = uv0.contextData.materialShipIds or {},
			onShip = Ship.canDestroyShip,
			onSelected = function (slot0)
				uv0.contextData.materialShipIds = slot0
			end,
			confirmSelect = function (slot0, slot1, slot2)
				if not _.all(slot3(slot0, uv0), function (slot0)
					return slot0 == ""
				end) then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("destroy_eliteship_tip", string.gsub(table.concat(slot4, ""), "$1", slot4[1] == "" and "" or "、")),
						onYes = slot1
					})
				else
					slot1()
				end
			end
		})
	end)
	slot0:bind(uv0.NEXTSHIP, function (slot0, slot1)
		uv0:sendNotification(uv1.NEXTSHIP, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.UPGRADE_STAR_DONE,
		BagProxy.ITEM_UPDATED,
		BayProxy.SHIP_REMOVED,
		GAME.SET_SHIP_FLAG_DONE,
		PlayerProxy.UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.SET_SHIP_FLAG_DONE then
		slot0.viewComponent:setShips(slot1:getBody().shipsById)
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.UPGRADE_STAR_DONE then
		slot0.contextData.materialShipIds = nil

		slot0:sendNotification(GAME.SET_SHIP_FLAG, {
			shipsById = slot0.bayProxy:getRawData()
		})
		slot0.viewComponent:setShip(slot3.newShip)
		slot0.viewComponent:updateStagesScrollView()
		slot0:addSubLayers(Context.New({
			viewComponent = ShipBreakResultLayer,
			mediator = ShipBreakResultMediator,
			data = {
				newShip = slot3.newShip,
				oldShip = slot3.oldShip
			}
		}))
	elseif slot2 == BagProxy.ITEM_UPDATED then
		slot0.viewComponent:setItems(getProxy(BagProxy):getRawData())
	end
end

return slot0
