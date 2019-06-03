ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.FloatOxyState = class("FloatOxyState", ys.Battle.IOxyState)
ys.Battle.FloatOxyState.__name = "FloatOxyState"

function ys.Battle.FloatOxyState.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.FloatOxyState.GetWeaponUseableList(slot0)
	return {
		uv0.OXY_STATE.DIVE,
		uv0.OXY_STATE.FLOAT
	}
end

function ys.Battle.FloatOxyState.GetDiveState(slot0)
	return uv0.OXY_STATE.FLOAT
end

function ys.Battle.FloatOxyState.GetBubbleFlag(slot0)
	return false
end

function ys.Battle.FloatOxyState.IsVisible(slot0)
	return true
end

function ys.Battle.FloatOxyState.GetBarVisible(slot0)
	return false
end

function ys.Battle.FloatOxyState.RunMode(slot0)
	return false
end
