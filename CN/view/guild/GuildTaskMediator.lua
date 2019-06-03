slot0 = class("GuildTaskMediator", import("..base.ContextMediator"))
slot0.ON_TASK_SUBMIT = "GuildTaskMediator:ON_TASK_SUBMIT"

function slot0.register(slot0)
	slot0.viewComponent:setTaskList(slot2)
	slot0:bind(uv0.ON_TASK_SUBMIT, function (slot0, slot1)
		uv0:sendNotification(GAME.SUBMIT_GUILD_TASK, {
			id = slot1.id
		})
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		GAME.SUBMIT_GUILD_TASK_DONE,
		GuildEvent.TASK_UPDATED
	}
end

function slot0.handleNotification(slot0, slot1)
	if slot1:getName() == GAME.SUBMIT_GUILD_TASK_DONE then
		if #slot1:getBody() > 0 then
			slot0.viewComponent:emit(BaseUI.ON_ACHIEVE, slot1.getBody())
		end
	elseif slot2 == GuildEvent.TASK_UPDATED then
		slot0.viewComponent:updateTask(slot3)
	end
end

return slot0
