slot0 = class("StackGameView", import("..BaseMiniGameView"))

slot0.getUIName = function (slot0)
	return "PileGameUI"
end

slot0.init = function (slot0)
	slot0.backBtn = slot0:findTF("overview/back")
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0.backBtn, function ()
		slot0:emit(slot1.ON_BACK)
	end, SFX_PANEL)

	slot0.controller = PileGameController.New()

	slot0.controller.view:SetUI(slot0._go)
	slot0.controller:SetUp(slot0:PackData(), function (slot0, slot1)
		if slot1 < slot0 then
			slot0:StoreDataToServer({
				slot0
			})
		end

		if slot0:GetMGHubData().count > 0 then
			slot0:SendSuccess(0)
		end
	end)
end

slot0.PackData = function (slot0)
	return {
		highestScore = (slot0:GetMGData():GetRuntimeData("elements") and slot1[1]) or 0,
		screen = Vector2(slot0._tf.rect.width, slot0._tf.rect.height)
	}
end

slot0.onBackPressed = function (slot0)
	if slot0.controller:onBackPressed() then
		return
	end

	slot0:emit(slot0.ON_BACK)
end

slot0.willExit = function (slot0)
	slot0.controller:Dispose()
end

return slot0
