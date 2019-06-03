ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.DivingOxyState = class("DivingOxyState", ys.Battle.IOxyState)
ys.Battle.DivingOxyState.__name = "DivingOxyState"

function ys.Battle.DivingOxyState.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.DivingOxyState.GetWeaponUseableList(slot0)
	return {}
end

function ys.Battle.DivingOxyState.GetDiveState(slot0)
	return uv0.OXY_STATE.DIVE
end

function ys.Battle.DivingOxyState.GetBubbleFlag(slot0)
	return false
end

function ys.Battle.DivingOxyState.IsVisible(slot0)
	return true
end

function ys.Battle.DivingOxyState.GetBarVisible(slot0)
	return true
end

function ys.Battle.DivingOxyState.RunMode(slot0)
	return false
end
