slot0 = class("CommandRoomMediator", import("..base.ContextMediator"))
slot0.ON_GET = "CommandRoomMediator:ON_GET"
slot0.ON_BUILD = "CommandRoomMediator:ON_BUILD"
slot0.ON_DETAIL = "CommandRoomMediator:ON_DETAIL"
slot0.ON_FETCH = "CommandRoomMediator:ON_FETCH"
slot0.ON_RESERVE_BOX = "CommandRoomMediator:ON_RESERVE_BOX"
slot0.ON_REMARK = "CommandRoomMediator:ON_REMARK"
slot0.ON_RENAME = "CommanderInfoMediator:ON_RENAME"

function slot0.register(slot0)
	slot2 = getProxy(CommanderProxy)

	slot0:bind(uv0.ON_RENAME, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.COMMANDER_RENAME, {
			commanderId = slot1,
			name = slot2
		})
	end)
	slot0:bind(uv0.ON_REMARK, function ()
		uv0.viewComponent:setCommanders(uv0:markFleet())
	end)
	slot0:bind(uv0.ON_RESERVE_BOX, function (slot0, slot1, slot2)
		uv0:sendNotification(GAME.COMMANDER_RESERVE_BOX, {
			count = slot1
		})
	end)
	slot0:bind(uv0.ON_GET, function (slot0, slot1)
		uv0:sendNotification(GAME.COMMANDER_ON_OPEN_BOX, {
			id = slot1
		})
	end)
	slot0:bind(uv0.ON_BUILD, function (slot0, slot1)
		uv0:sendNotification(GAME.COMMANDER_ON_BUILD, {
			id = slot1
		})
	end)
	slot0:bind(uv0.ON_DETAIL, function (slot0, slot1)
		for slot7, slot8 in ipairs(uv0.viewComponent.disPlayCommanderVOs or {}) do
			table.insert({}, slot8.id)
		end

		uv0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDERINFO, {
			commanderId = slot1,
			mode = uv0.viewComponent.mode,
			displayIds = slot2
		})
	end)
	slot0:bind(uv0.ON_FETCH, function (slot0, slot1)
		if Application.isEditor then
			uv0:addSubLayers(Context.New({
				viewComponent = NewCommanderScene,
				mediator = NewCommanderMediator,
				data = {
					commander = getProxy(CommanderProxy).getCommanderById(slot2, slot1)
				}
			}))
		end
	end)
	slot0.viewComponent:setPlayer(getProxy(PlayerProxy).getData(slot1))
	slot0.viewComponent:setBoxes(slot2:getBoxes())
	slot0.viewComponent:setCommanders(slot3)
	slot0.viewComponent:setReserveBoxCnt(slot2:getBoxUseCnt())
	slot0.viewComponent:setPools(slot2:getPools())
end

function slot0.markFleet(slot0)
	slot2 = getProxy(CommanderProxy).getData(slot1)

	for slot8, slot9 in pairs(slot4) do
		for slot13, slot14 in pairs(slot9:getCommanders()) do
			slot15 = slot9.id

			if slot9.id > 10 then
				slot15 = slot9.id - 10
			end

			slot2[slot14.id].fleetId = slot15
			slot2[slot14.id].inFleet = true
		end
	end

	if getProxy(ChapterProxy):getActiveChapter() then
		_.each(slot5.fleets, function (slot0)
			slot1 = slot0:getCommanders()

			for slot5, slot6 in pairs(slot0:getCommanders()) do
				uv0[slot6.id].inBattle = true
			end
		end)
	end

	return slot2
end

function slot0.listNotificationInterests(slot0)
	return {
		CommanderProxy.COMMANDER_ADDED,
		CommanderProxy.COMMANDER_UPDATED,
		CommanderProxy.COMMANDER_DELETED,
		PlayerProxy.UPDATED,
		GAME.COMMANDER_ON_OPEN_BOX_DONE,
		GAME.COMMANDER_ON_BUILD_DONE,
		CommanderProxy.RESERVE_CNT_UPDATED,
		GAME.COMMANDER_RESERVE_BOX_DONE,
		GAME.COMMANDER_RENAME_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.COMMANDER_ON_BUILD_DONE then
		slot0.viewComponent:setBoxes(getProxy(CommanderProxy):getBoxes())
		slot0.viewComponent:updateBoxes()
		slot0.viewComponent:updateRes()
	elseif slot2 == CommanderProxy.COMMANDER_ADDED or slot2 == CommanderProxy.COMMANDER_UPDATED or slot2 == CommanderProxy.COMMANDER_DELETED then
		slot0.viewComponent:setCommanders(slot0:markFleet())
		slot0.viewComponent:updateCommanders()
	elseif slot2 == PlayerProxy.UPDATED then
		slot0.viewComponent:setPlayer(slot3)
	elseif slot2 == GAME.COMMANDER_ON_OPEN_BOX_DONE then
		if slot0.viewComponent.boxesPanel then
			slot0.viewComponent.boxesPanel:playFinshedAnim(slot3.boxId, function ()
				uv0:addSubLayers(Context.New({
					viewComponent = NewCommanderScene,
					mediator = NewCommanderMediator,
					data = {
						commander = uv1.commander
					}
				}))
				uv0.viewComponent:setBoxes(getProxy(CommanderProxy):getBoxes())
				uv0.viewComponent:updateBoxes()
			end)
		end
	elseif slot2 == CommanderProxy.RESERVE_CNT_UPDATED then
		if slot0.viewComponent.reservePanel then
			slot0.viewComponent:setReserveBoxCnt(slot3)
			slot0.viewComponent.reservePanel:update(slot3)
		end
	elseif slot2 == GAME.COMMANDER_RESERVE_BOX_DONE then
		slot0.viewComponent.reservePanel:setBlock(true)
		table.insert(slot4, function (slot0)
			uv0.viewComponent:playReserveAnim(uv1.awards, slot0)
		end)
		seriesAsync({}, function ()
			if #uv0.awards > 0 then
				uv1.viewComponent:emit(BaseUI.ON_AWARD, {
					items = uv0.awards
				})
			end

			uv1.viewComponent:updateRes()
			uv1.viewComponent.reservePanel:setBlock(false)
		end)
	elseif slot2 == GAME.COMMANDER_RENAME_DONE then
		pg.TipsMgr:GetInstance():ShowTips(i18n("commander_rename_success_tip"))
	end
end

return slot0
