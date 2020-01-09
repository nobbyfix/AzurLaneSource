slot0 = class("BeatMonsterPage", import("....base.BaseActivityPage"))

slot0.OnUpdateFlush = function (slot0)
	slot0:Show()

	slot2 = slot0:PacketData(slot0.activity)

	if not slot0.controller then
		slot0.controller = BeatMonsterController.New()

		slot0.controller.mediator:SetUI(slot0._go)
		slot0.controller:SetUp(slot2)
	else
		slot0.controller:NetData(slot2)
	end
end

slot0.PacketData = function (slot0, slot1)
	return {
		hp = math.max(slot1:GetDataConfig("hp") - slot1.data3, 0),
		maxHp = slot1.GetDataConfig("hp"),
		leftCount = slot1:GetCountForHitMonster(),
		storys = slot1:GetDataConfig("story")
	}
end

slot0.OnDestroy = function (slot0)
	slot0.controller:Dispose()
end

return slot0
