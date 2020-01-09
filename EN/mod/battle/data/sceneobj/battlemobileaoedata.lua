ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = class("BattleMobileAOEData", ys.Battle.BattleLastingAOEData)
ys.Battle.BattleMobileAOEData = slot2
slot2.__name = "BattleMobileAOEData"

slot2.Ctor = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.super.Ctor(slot0, slot1, slot2, slot3, slot5)

	slot0._host = slot6
end

slot2.Dispose = function (slot0)
	slot0._host = nil

	slot0.super.Dispose(slot0)
end

slot2.Settle = function (slot0)
	slot0:SetPosition(setmetatable({}, {
		__index = slot0._host:GetPosition()
	}))
	slot0.super.Settle(slot0)
end

return
