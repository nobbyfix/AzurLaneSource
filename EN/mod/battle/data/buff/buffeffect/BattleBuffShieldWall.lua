ys = ys or {}
slot1 = pg.effect_offset
ys.Battle.BattleBuffShieldWall = class("BattleBuffShieldWall", ys.Battle.BattleBuffEffect)
ys.Battle.BattleBuffShieldWall.__name = "BattleBuffShieldWall"

function ys.Battle.BattleBuffShieldWall.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)
end

function ys.Battle.BattleBuffShieldWall.SetArgs(slot0, slot1, slot2)
	slot0._dir = slot1:GetDirection()
	slot0._count = slot0._tempData.arg_list.count
	slot0._bulletType = slot0._tempData.arg_list.bulletType or uv0.Battle.BattleConst.BulletType.CANNON
	slot0._doWhenHit = slot3.do_when_hit
	slot0._unit = slot1
	slot0._dataProxy = uv0.Battle.BattleDataProxy:GetInstance()
	slot0._centerPos = slot1:GetPosition()
	slot0._startTime = pg.TimeMgr.GetInstance():GetCombatTime()

	function slot4(slot0)
		if slot0:GetType() == uv0._bulletType and uv0._count > 0 then
			uv0:DoWhenHit(slot0)

			if uv0._count <= 0 then
				uv0:Deactive()
			end
		end

		return uv0._count > 0
	end

	slot5 = slot1:GetTemplate().scale / 50
	slot7 = slot3.cld_list[1].box
	slot8 = Clone(slot3.cld_list[1].offset)

	if slot1:GetDirection() == uv0.Battle.BattleConst.UnitDir.LEFT then
		Clone(slot3.cld_list[1].offset)[1] = -Clone(slot3.cld_list[1].offset)[1] * slot1.GetTemplate().scale / 50
	else
		slot8[1] = slot8[1] * slot5
	end

	slot0._wall = slot0._dataProxy:SpawnWall(slot0, slot4, slot7, slot8)
	slot9 = nil

	if uv1[slot3.effect] then
		slot14 = Vector3(slot1:GetTemplate().fx_container[slot10.container_index][1], slot1.GetTemplate().fx_container[slot10.container_index][2], slot1.GetTemplate().fx_container[slot10.container_index][3])

		slot14:Add(Vector3(slot10.offset[1], slot10.offset[2], slot10.offset[3]))

		slot9 = slot14
	end

	if slot9 then
		function slot0._centerPosFun(slot0)
			slot1 = nil
			uv0.centerPosFun(slot0).Add(slot2, uv1).x = uv0.centerPosFun(slot0).Add(slot2, uv1).x * uv2._dir

			return uv0.centerPosFun(slot0).Add(slot2, uv1)
		end
	else
		slot0._centerPosFun = slot3.centerPosFun
	end

	slot0._currentTimeCount = 0

	if slot3.effect then
		slot0._effectIndex = "BattleBuffShieldWall" .. slot2:GetID() .. slot0._tempData.id
		slot11 = nil
		slot0._unit = slot1
		slot0._evtData = {
			effect = slot3.effect,
			posFun = (not slot9 or function (slot0)
				slot1 = nil

				return uv0.centerPosFun(slot0):Add(uv1)
			end) and slot3.centerPosFun,
			index = slot0._effectIndex,
			rotationFun = slot3.rotationFun
		}

		slot1:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.ADD_EFFECT, slot0._evtData))
	end
end

function ys.Battle.BattleBuffShieldWall.onStack(slot0, slot1, slot2)
	slot0._count = slot0._tempData.arg_list.count

	slot0._unit:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.ADD_EFFECT, slot0._evtData))
end

function ys.Battle.BattleBuffShieldWall.onUpdate(slot0, slot1, slot2, slot3)
	slot4 = slot1:GetPosition()
	slot5 = slot1:GetTemplate().scale * 0.02

	if slot0._centerPosFun then
		slot0._currentTimeCount = slot3 - slot0._startTime
		slot4 = slot0._centerPosFun(slot0._currentTimeCount):Mul(slot1.GetTemplate().scale * 0.02):Add(slot1.GetPosition())
	end

	slot0._centerPos = slot4
end

function ys.Battle.BattleBuffShieldWall.GetIFF(slot0)
	return slot0._unit:GetIFF()
end

function ys.Battle.BattleBuffShieldWall.GetPosition(slot0)
	return slot0._centerPos
end

function ys.Battle.BattleBuffShieldWall.IsWallActive(slot0)
	return slot0._count > 0
end

function ys.Battle.BattleBuffShieldWall.DoWhenHit(slot0, slot1)
	if slot0._doWhenHit == "intercept" then
		slot1:Intercepted()
		uv0.Battle.BattleDataProxy:GetInstance():RemoveBulletUnit(slot1:GetUniqueID())

		slot0._count = slot0._count - 1
	elseif slot0._doWhenHit == "reflect" and slot0:GetIFF() ~= slot1:GetIFF() then
		slot1:Reflected()

		slot0._count = slot0._count - 1
	end
end

function ys.Battle.BattleBuffShieldWall.Deactive(slot0)
	if slot0._effectIndex then
		slot0._unit:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.DEACTIVE_EFFECT, {
			index = slot0._effectIndex
		}))
	end

	slot0._unit:TriggerBuff(uv0.Battle.BattleConst.BuffEffectType.ON_SHIELD_BROKEN, {})
end

function ys.Battle.BattleBuffShieldWall.Clear(slot0)
	if slot0._effectIndex then
		slot0._unit:DispatchEvent(uv0.Event.New(uv0.Battle.BattleUnitEvent.CANCEL_EFFECT, {
			index = slot0._effectIndex
		}))
	end

	slot0._dataProxy:RemoveWall(slot0._wall:GetUniqueID())
end
