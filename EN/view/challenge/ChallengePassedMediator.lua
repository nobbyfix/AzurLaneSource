slot0 = class("ChallengeMainMediator", import("..base.ContextMediator"))

slot0.register = function (slot0)
	slot0:bind(ChallengeConst.OPEN_CHALLENGE_MAIN_SCENE, function (slot0)
		slot0:sendNotification(GAME.GO_SCENE, SCENE.CHALLENGE_MAIN_SCENE)
	end)
end

slot0.listNotificationInterests = function (slot0)
	return {}
end

slot0.handleNotification = function (slot0, slot1)
	return
end

return slot0
