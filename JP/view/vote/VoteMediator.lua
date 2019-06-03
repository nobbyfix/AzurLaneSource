slot0 = class("VoteMediator", import("..base.ContextMediator"))
slot0.ON_INDEX = "VoteMediator.ON_INDEX"
slot0.ON_VOTE = "VoteMediator:ON_VOTE"

function slot0.register(slot0)
	slot1 = getProxy(VoteProxy)

	slot0.viewComponent:setVoteInfo(slot1.votes, slot1.loves, slot1:getVoteGroup())
	slot0:bind(uv0.ON_INDEX, function (slot0, slot1, slot2)
		uv0:addSubLayers(Context.New({
			mediator = IndexMediator,
			viewComponent = IndexLayer,
			data = slot1,
			onRemoved = slot2
		}))
	end)
	slot0:bind(uv0.ON_VOTE, function (slot0, slot1)
		uv0:sendNotification(GAME.ACTIVITY_OPERATION, slot1)
	end)
end

function slot0.listNotificationInterests(slot0)
	return {
		VoteProxy.VOTE_GROUP_UPDATE
	}
end

function slot0.handleNotification(slot0, slot1)
	slot3 = slot1:getBody()

	if slot1:getName() == VoteProxy.VOTE_GROUP_UPDATE then
		slot4 = getProxy(VoteProxy)

		slot0.viewComponent:setVoteInfo(slot4.votes, slot4.loves, slot4:getVoteGroup())
		slot0.viewComponent:onVoteGroupUpdate()
	end
end

return slot0
