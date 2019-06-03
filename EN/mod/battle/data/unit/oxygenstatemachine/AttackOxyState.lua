ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.AttackOxyState = class("AttackOxyState", ys.Battle.IOxyState)
ys.Battle.AttackOxyState.__name = "AttackOxyState"

function ys.Battle.AttackOxyState.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.AttackOxyState.GetWeaponUseableList(slot0)
	return {
		uv0.OXY_STATE.DIVE,
		uv0.OXY_STATE.FLOAT
	}
end

function ys.Battle.AttackOxyState.GetDiveState(slot0)
	return uv0.OXY_STATE.FLOAT
end

function ys.Battle.AttackOxyState.GetBubbleFlag(slot0)
	return false
end

function ys.Battle.AttackOxyState.IsVisible(slot0)
	return true
end
