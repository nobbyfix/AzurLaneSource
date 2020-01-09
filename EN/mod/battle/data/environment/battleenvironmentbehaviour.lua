ys = ys or {}
slot2 = ys.Battle.BattleConfig
slot3 = class("BattleEnvironmentBehaviour")
ys.Battle.BattleEnvironmentBehaviour = slot3
slot3.__name = "BattleEnvironmentBehaviour"
slot3.STATE_READY = "STATE_READY"
slot3.STATE_OVERHEAT = "STATE_OVERHEAT"

slot3.Ctor = function (slot0, slot1, slot2)
	slot0._cldUnitList = {}
end

slot3.SetTemplate = function (slot0, slot1)
	slot0._tmpData = slot1
	slot0._state = slot0.STATE_READY
end

slot3.UpdateCollideUnitList = function (slot0, slot1)
	slot0._cldUnitList = slot1
end

slot3.OnUpdate = function (slot0)
	slot0:UpdateReload()

	if slot0._state == slot0.STATE_READY then
		slot0:doBehaviour()
	end
end

slot3.Dispose = function (slot0)
	slot0._cldUnitList = nil
	slot0._tmpData = nil
	slot0._CDstartTime = nil
end

slot3.OnCollide = function (slot0, slot1)
	return
end

slot3.GetCurrentState = function (slot0)
	return slot0._state
end

slot3.UpdateReload = function (slot0)
	if slot0._CDstartTime then
		if slot0:getReloadFinishTimeStamp() <= pg.TimeMgr.GetInstance():GetCombatTime() then
			slot0:handleCoolDown()
		else
			return
		end
	end
end

slot3.getReloadFinishTimeStamp = function (slot0)
	return slot0._tmpData.reload_time + slot0._CDstartTime
end

slot3.handleCoolDown = function (slot0)
	slot0._state = slot0.STATE_READY
end

slot3.doBehaviour = function (slot0)
	if slot0._tmpData.reload_time then
		slot0._CDstartTime = pg.TimeMgr.GetInstance():GetCombatTime()
		slot0._state = slot0.STATE_OVERHEAT
	end
end

slot3.BehaviourClassEnum = {
	[ys.Battle.BattleConst.EnviroumentBehaviour.PLAY_FX] = nil,
	[ys.Battle.BattleConst.EnviroumentBehaviour.DAMAGE] = "BattleEnvironmentBehaviourDamage",
	[ys.Battle.BattleConst.EnviroumentBehaviour.BUFF] = "BattleEnvironmentBehaviourBuff"
}

slot3.CreateBehaviour = function (slot0)
	return slot0.Battle[slot1.BehaviourClassEnum[slot0.type]].New()
end

return
