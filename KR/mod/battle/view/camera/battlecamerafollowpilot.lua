ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleCameraFollowPilot = class("BattleCameraFollowPilot")
ys.Battle.BattleCameraFollowPilot.__name = "BattleCameraFollowPilot"

ys.Battle.BattleCameraFollowPilot.Ctor = function (slot0)
	slot0.point = Vector3.zero
end

ys.Battle.BattleCameraFollowPilot.SetFleetVO = function (slot0, slot1)
	slot0._fleetMotion = slot1:GetMotion()
end

ys.Battle.BattleCameraFollowPilot.SetGoldenRation = function (slot0, slot1)
	slot0._cameraGoldenOffset = slot1
end

ys.Battle.BattleCameraFollowPilot.GetCameraPos = function (slot0)
	slot1 = slot0.point:Copy(slot0._fleetMotion:GetPos())
	slot1.x = slot1.x + slot0._cameraGoldenOffset
	slot1.y = slot1.y + slot0.CameraNormalHeight
	slot1.z = slot1.z - slot1.y / slot0._camera_radian_x_tan

	return slot1
end

ys.Battle.BattleCameraFollowPilot.Dispose = function (slot0)
	slot0._fleetMotion = nil
end

return
