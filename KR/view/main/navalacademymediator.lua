slot0 = class("NavalAcademyMediator", import("..base.ContextMediator"))
slot0.OPEN_DOCK = "NavalAcademyMediator:OPEN_DOCK"
slot0.START_TO_LEARN = "NavalAcademyMediator:START_TO_LEARN"
slot0.GET_REWARD = "NavalAcademyMediator:GET_REWARD"
slot0.TRUANT = "NavalAcademyMediator:TRUANT"
slot0.TIMES_UP = "NavalAcademyMediator:TIMES_UP"
slot0.GET_RES = "NavalAcademyMediator:GET_RES"
slot0.UPGRADE_FIELD = "NavalAcademyMediator:UPGRADE_FIELD"
slot0.UPGRADE_TIMES_UP = "NavalAcademyMediator:UPGRADE_TIMES_UP"
slot0.OPEN_TACTIC = "NavalAcademyMediator:OPEN_TACTIC"
slot0.GO_SHOP = "NavalAcademyMediator:GO_SHOP"
slot0.ACTIVITY_OP = "NavalAcademyMediator:ACTIVITY_OP"
slot0.TASK_GO = "NavalAcademyMediator:TASK_GO"
slot0.GO_TASK_SCENE = "NavalAcademyMediator:GO_TASK_SCENE"
slot0.OPEN_CLASS = "NavalAcademyMediator:OPEN_CLASS"
slot0.GO_SCENE = "NavalAcademyMediator:OPEN_SCENE"
slot0.OPEN_ACTIVITY_PANEL = "NavalAcademyMediator:OPEN_ACTIVITY_PANEL"
slot0.OPEN_ACTIVITY_SHOP = "NavalAcademyMediator:OPEN_ACTIVITY_SHOP"
slot0.OPEN_SCROLL = "NavalAcademyMediator:OPEN_SCROLL"
slot0.OPEN_COMMANDER = "NavalAcademyMediator:OPEN_COMMANDER"
slot0.OPEN_TROPHY_GALLERY = "NavalAcademyMediator:OPEN_TROPHY_GALLERY"

slot0.register = function (slot0)
	slot1 = getProxy(NavalAcademyProxy)

	slot0.viewComponent:SetCourseInfo(slot2)

	slot0.player = getProxy(PlayerProxy).getData(slot6)

	slot0.viewComponent:SetPlayerInfo(slot0.player, slot1:GetOilVO(), slot1:GetGoldVO(), slot1:GetClassVO())

	if getProxy(ShopsProxy):getShopStreet() then
		slot0.viewComponent:SetMerchantInfo(slot7)
	end

	slot0.viewComponent:SetUnclaimTrophyCount(slot9)
	slot0.viewComponent:SetTacticInfo(slot1:getStudents())
	slot0:bind(slot0.OPEN_TACTIC, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = NavalTacticsMediator,
			viewComponent = NavalTacticsLayer,
			data = {
				shipToLesson = slot0.contextData.shipToLesson
			},
			onRemoved = slot1
		}))

		slot0.contextData.shipToLesson = nil
	end)
	slot0:bind(slot0.OPEN_TROPHY_GALLERY, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = TrophyGalleryMediator,
			viewComponent = TrophyGalleryLayer,
			onRemoved = slot1
		}))
	end)
	slot0:bind(slot0.GO_SHOP, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = ShopsMediator,
			viewComponent = ShopsLayer,
			data = {
				fromCharge = false,
				warp = ShopsLayer.TYPE_SHOP_STREET
			},
			onRemoved = function ()
				slot0.viewComponent:activeSakura(true)
			end
		}))
	end)
	slot0:bind(slot0.GET_RES, function (slot0, slot1)
		slot0:sendNotification(GAME.HARVEST_RES, slot1)
	end)
	slot0:bind(slot0.UPGRADE_FIELD, function (slot0, slot1)
		if slot0:getData().level < slot1:bindConfigTable()[slot1:GetLevel()].user_level then
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_limit_level", slot4))

			return
		end

		if slot5.gold < slot3.use[2] then
			GoShoppingMsgBox(i18n("switch_to_shop_tip_2", i18n("word_gold")), ChargeScene.TYPE_ITEM, {
				{
					59001,
					slot3.use[2] - slot5.gold,
					slot3.use[2]
				}
			})

			return
		end

		slot1:sendNotification(GAME.SHOPPING, {
			count = 1,
			id = slot1:GetUpgradeType()
		})
		slot0:setFlag("blockResourceUpgrade", false)
	end)
	slot0:bind(slot0.UPGRADE_TIMES_UP, function (slot0, slot1)
		slot0:UpgradeFinish()
		slot1.viewComponent:SetPlayerInfo(slot2:getData(), slot0:GetOilVO(), slot0:GetGoldVO(), slot0:GetClassVO())

		if slot1 then
			slot1.viewComponent:OpenResourcePanel(slot1)
		end
	end)
	slot0:bind(slot0.ACTIVITY_OP, function (slot0, slot1)
		slot0:sendNotification(GAME.ACTIVITY_OPERATION, slot1)
	end)
	slot0:bind(slot0.TASK_GO, function (slot0, slot1)
		slot0:sendNotification(GAME.TASK_GO, slot1)
	end)
	slot0:bind(slot0.GO_TASK_SCENE, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.TASK, slot1)
	end)
	slot0:bind(slot0.OPEN_CLASS, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.CLASS)
	end)
	slot0:bind(slot0.GO_SCENE, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, slot1[1], slot1[2])
	end)
	slot0:bind(slot0.OPEN_ACTIVITY_PANEL, function (slot0, slot1)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.ACTIVITY, {
			id = slot1
		})
	end)
	slot0:bind(slot0.OPEN_ACTIVITY_SHOP, function (slot0)
		slot0:addSubLayers(Context.New({
			mediator = ShopsMediator,
			viewComponent = ShopsLayer,
			data = {
				warp = ShopsLayer.TYPE_ACTIVITY
			}
		}))
	end)
	slot0:bind(slot0.OPEN_SCROLL, function (slot0, slot1)
		slot0:addSubLayers(Context.New({
			mediator = InvestigationMediator,
			viewComponent = InvestigationLayer,
			data = {
				activityId = slot1
			}
		}))
	end)
	slot0:bind(slot0.OPEN_COMMANDER, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.COMMANDROOM)
	end)
	slot1:UpgradeFinish()
	slot6:setFlag("blockResourceUpgrade", true)
end

slot0.listNotificationInterests = function (slot0)
	return {
		NavalAcademyProxy.RESOURCE_UPGRADE,
		NavalAcademyProxy.START_LEARN_TACTICS,
		NavalAcademyProxy.CANCEL_LEARN_TACTICS,
		GAME.HARVEST_RES_DONE,
		PlayerProxy.UPDATED,
		GAME.REMOVE_LAYERS,
		ShopsMediator.OPEN,
		ActivityProxy.ACTIVITY_OPERATION_DONE,
		GAME.BEGIN_STAGE_DONE,
		CollectionProxy.TROPHY_UPDATE
	}
end

slot0.handleNotification = function (slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == GAME.HARVEST_RES_DONE then
		slot0.viewComponent:GetResourceDone(slot3.type, slot3.outPut)
		pg.TipsMgr:GetInstance():ShowTips(i18n("battle_levelMediator_ok_takeResource"))
	elseif slot2 == PlayerProxy.UPDATED then
		slot4 = getProxy(NavalAcademyProxy)

		slot0.viewComponent:SetPlayerInfo(getProxy(PlayerProxy).getData(slot5), slot4:GetOilVO(), slot4:GetGoldVO(), slot4:GetClassVO())
	elseif slot2 == NavalAcademyProxy.RESOURCE_UPGRADE then
		slot4 = getProxy(NavalAcademyProxy)

		slot0.viewComponent:SetPlayerInfo(getProxy(PlayerProxy).getData(slot5), slot4:GetOilVO(), slot4:GetGoldVO(), slot4:GetClassVO())
		slot0.viewComponent:OpenResourcePanel(slot3.resVO)
	elseif slot2 == ShopsMediator.OPEN then
		slot0.viewComponent:activeSakura(false)
	elseif slot2 ~= NavalAcademyProxy.START_LEARN_TACTICS then
		if slot2 == NavalAcademyProxy.CANCEL_LEARN_TACTICS then
		elseif slot2 == ActivityProxy.ACTIVITY_OPERATION_DONE then
			if getProxy(ActivityProxy).getActivityById(slot4, slot3).getConfig(slot5, "type") == ActivityConst.ACTIVITY_TYPE_TASK_LIST then
				slot0.viewComponent:updateStudents()
			end
		elseif slot2 == GAME.BEGIN_STAGE_DONE then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
		elseif slot2 == CollectionProxy.TROPHY_UPDATE then
			slot0.viewComponent:SetUnclaimTrophyCount(getProxy(CollectionProxy).unclaimTrophyCount(slot4))
			slot0.viewComponent:updateTrophyReminder()
		end
	end
end

return slot0
