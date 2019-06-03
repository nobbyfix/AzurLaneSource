slot0 = class("TaskMediator", import("..base.ContextMediator"))
slot0.ON_TASK_SUBMIT = "TaskMediator:ON_TASK_SUBMIT"
slot0.ON_TASK_GO = "TaskMediator:ON_TASK_GO"
slot0.TASK_FILTER = "TaskMediator:TASK_FILTER"
slot0.CLICK_GET_ALL = "TaskMediator:CLICK_GET_ALL"

function slot0.register(slot0)
	slot0:bind(uv0.ON_TASK_SUBMIT, function (slot0, slot1)
		if getProxy(ActivityProxy):getActivityById(ActivityConst.JYHZ_ACTIVITY_ID) and slot1.id == _.flatten(slot4)[#_.flatten(slot4)] then
			pg.StoryMgr.GetInstance():Play("YIXIAN8", function ()
				uv0:sendNotification(GAME.SUBMIT_TASK, uv1.id)
			end)

			return
		end

		if slot1.index then
			uv0:sendNotification(GAME.SUBMIT_TASK, {
				taskId = slot1.id,
				index = slot1.index
			})
		else
			uv0:sendNotification(GAME.SUBMIT_TASK, slot1.id)
		end
	end)
	slot0:bind(uv0.ON_TASK_GO, function (slot0, slot1)
		uv0:sendNotification(GAME.TASK_GO, {
			taskVO = slot1
		})
	end)
	slot0:bind(uv0.CLICK_GET_ALL, function (slot0, slot1, slot2)
		slot3 = {}

		function slot4(slot0, slot1)
			slot3 = nil

			if uv0[slot0]:isSelectable() then
				slot3 = {
					type = slot2:getConfig("award_choice")[slot2.index][1],
					id = slot2.getConfig("award_choice")[slot2.index][2],
					number = slot2.getConfig("award_choice")[slot2.index][3]
				}
			end

			uv1[#uv1 + 1] = {
				id = slot2.id,
				award_choice = slot3
			}

			if slot0 <= #uv0 then
				slot1()
			end
		end

		function slot5(slot0, slot1, slot2)
			function slot1.overFlow.onYes()
				uv0(uv1, uv2)
			end

			function slot1.overFlow.onNo()
				uv0()
			end

			pg.MsgboxMgr:GetInstance():ShowMsgBox(slot1.overFlow)
		end

		function slot6(slot0, slot1, slot2)
			function slot1.choice.onYes()
				if not taskVO.index then
					pg.TipsMgr:GetInstance():ShowTips(i18n("no_item_selected_tip"))
					uv0()

					return
				end

				if uv1.overFlow then
					uv2()
				else
					uv3(uv4, uv0)
				end
			end

			function slot1.choice.onNo()
				uv0()
			end

			pg.MsgboxMgr:GetInstance():ShowMsgBox(slot1.choice)
		end

		function slot7(slot0, slot1, slot2)
			function slot1.sub.onYes()
				if uv0.choice then
					uv1()
				elseif uv0.overFlow then
					uv2()
				else
					uv3(uv4, uv5)
				end
			end

			function slot1.sub.onNo()
				uv0()
			end

			pg.MsgboxMgr:GetInstance():ShowMsgBox(slot1.sub)
		end

		slot8 = {
			[slot12] = function ()
				if uv0.sub then
					print("执行提交确认窗口")
					uv1(uv2, uv0, uv3[uv2 + 1])
				elseif uv0.choice then
					print("执行选择确认窗口")
					uv4(uv2, uv0, uv3[uv2 + 1])
				elseif uv0.overFlow then
					print("执行溢出确认窗口")
					uv5(uv2, uv0, uv3[uv2 + 1])
				else
					print("直接加入队列")
					uv6(uv2, uv3[uv2 + 1])
				end
			end
		}

		for slot12, slot13 in ipairs(slot1) do
		end

		slot8[#slot8 + 1] = function ()
			if #uv0 > 0 then
				uv1:sendNotification(GAME.SUBMIT_TASK_ONESTEP, uv0)
			end
		end

		slot8[1]()
	end)

	for slot7, slot8 in pairs(slot2) do
		if slot8:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot8.progress = getProxy(BagProxy):getItemCountById(tonumber(slot8:getConfig("target_id_for_client")))
		elseif slot8:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot8.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot8:getConfig("target_id_for_client"))
		end
	end

	slot0.viewComponent:setTaskVOs(slot2)
end

function slot0.enterLevel(slot0, slot1)
	if getProxy(ChapterProxy):getChapterById(slot1) then
		slot4 = {
			mapIdx = slot3:getConfig("map"),
			chapterId = slot3.id
		}

		if slot3.active then
		else
			slot4.openChapterId = slot1
		end

		slot0:sendNotification(GAME.GO_SCENE, SCENE.LEVEL, slot4)
	end
end

function slot0.remove(slot0)
end

function slot0.listNotificationInterests(slot0)
	return {
		TaskProxy.TASK_ADDED,
		TaskProxy.TASK_UPDATED,
		TaskProxy.TASK_REMOVED,
		GAME.SUBMIT_TASK_DONE,
		uv0.TASK_FILTER,
		GAME.BEGIN_STAGE_DONE,
		GAME.CHAPTER_OP_DONE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == TaskProxy.TASK_ADDED then
		if slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot3.progress = getProxy(BagProxy):getItemCountById(tonumber(slot3:getConfig("target_id_for_client")))
		elseif slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot3.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot3:getConfig("target_id_for_client"))
		end

		slot0.viewComponent:addTask(slot3)
	elseif slot2 == GAME.CHAPTER_OP_DONE then
		if slot0.chapterId then
			slot0:enterLevel(slot0.chapterId)

			slot0.chapterId = nil
		end
	elseif slot2 == TaskProxy.TASK_UPDATED then
		if slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_ITEM then
			slot3.progress = getProxy(BagProxy):getItemCountById(tonumber(slot3:getConfig("target_id_for_client")))
		elseif slot3:getConfig("sub_type") == TASK_SUB_TYPE_GIVE_VIRTUAL_ITEM then
			slot3.progress = getProxy(ActivityProxy):getVirtualItemNumber(slot3:getConfig("target_id_for_client"))
		end

		slot0.viewComponent:updateTask(slot3)
	elseif slot2 == TaskProxy.TASK_REMOVED then
		slot0.viewComponent:removeTask(slot3)
	elseif slot2 == uv0.TASK_FILTER then
		slot0.viewComponent:GoToFilter(slot3)
	else
		if slot2 == GAME.SUBMIT_TASK_DONE then
			getProxy(TaskProxy).setOnAchieved(slot4, true)

			slot0.viewComponent.onShowAwards = true

			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot3, function ()
				uv0:setOnAchieved(false)
				uv0:addTmpToTask()

				uv1.viewComponent.onShowAwards = nil

				uv1:accepetActivityTask()
				uv1.viewComponent:updateOneStepBtn()
			end)

			return
		end

		if slot2 == GAME.BEGIN_STAGE_DONE then
			slot0:sendNotification(GAME.GO_SCENE, SCENE.COMBATLOAD, slot3)
		end
	end
end

function slot0.accepetActivityTask(slot0)
	slot0:sendNotification(GAME.ACCEPT_ACTIVITY_TASK)
end

return slot0
