ys = ys or {}
slot1 = ys.Battle.BattleConst
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleEnvironmentUnit")
ys.Battle.BattleEnvironmentUnit = slot3
slot3.__name = "BattleEnvironmentUnit"

slot3.Ctor = function (slot0, slot1, slot2)
	slot0.EventDispatcher.AttachEventDispatcher(slot0)

	slot0._uid = slot1
end

slot3.GetUniqueID = function (slot0)
	return slot0._uid
end

slot3.SetTemplate = function (slot0, slot1)
	slot0._template = slot1

	slot0:initBehaviours()
end

slot3.SetAOEData = function (slot0, slot1)
	slot0._expireTimeStamp = pg.TimeMgr.GetInstance():GetCombatTime() + slot0._template.life_time
	slot0._aoeData = slot1
end

slot3.GetAOEData = function (slot0)
	return slot0._aoeData
end

slot3.GetBehaviours = function (slot0)
	return slot0._behaviours
end

slot3.GetTemplate = function (slot0)
	return slot0._template
end

slot3.UpdateFrequentlyCollide = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._behaviours) do
		slot6:UpdateCollideUnitList(slot1)
	end
end

slot3.Update = function (slot0)
	for slot4, slot5 in ipairs(slot0._behaviours) do
		slot5:OnUpdate()
	end
end

slot3.IsExpire = function (slot0, slot1)
	return slot0._expireTimeStamp < slot1
end

slot3.Dispose = function (slot0)
	for slot4, slot5 in ipairs(slot0._behaviours) do
		slot5:Dispose()
	end
end

slot3.initBehaviours = function (slot0)
	slot0._behaviours = {}

	for slot5, slot6 in ipairs(slot1) do
		slot7 = slot0.Battle.BattleEnvironmentBehaviour.CreateBehaviour(slot6)

		slot7:SetTemplate(slot6)
		table.insert(slot0._behaviours, slot7)
	end
end

return
