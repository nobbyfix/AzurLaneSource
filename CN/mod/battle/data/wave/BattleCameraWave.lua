ys = ys or {}
slot1 = ys.Battle.BattleConfig
ys.Battle.BattleCameraWave = class("BattleCameraWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleCameraWave.__name = "BattleCameraWave"

function ys.Battle.BattleCameraWave.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.BattleCameraWave.SetWaveData(slot0, slot1)
	uv0.super.SetWaveData(slot0, slot1)

	slot0._pause = slot0._param.pause
	slot0._type = slot0._param.type or 0
	slot0._modelID = slot0._param.model or 900006
	slot0._duration = slot0._param.duration or 1
	slot0._zoomSize = slot0._param.zoomSize
	slot0._zoomBounce = slot0._param.zoomBounce
end

function ys.Battle.BattleCameraWave.DoWave(slot0)
	uv0.super.DoWave(slot0)

	slot1 = uv1.Battle.BattleCameraUtil:GetInstance()

	if slot0._type == 1 then
		slot3 = nil

		for slot7, slot8 in pairs(slot2) do
			if slot8:GetTemplateID() == slot0._modelID then
				slot3 = slot8

				break
			end
		end

		slot1:FocusCharacter(slot3, slot0._duration, 0, true, not slot0._zoomBounce)

		if slot0._zoomSize then
			if slot0._zoomBounce then
				slot1:ZoomCamara(nil, uv2.CAST_CAM_OVERLOOK_SIZE, slot0._duration * 0.5)
				LeanTween.delayedCall(slot0._duration * 0.5, System.Action(function ()
					uv0:ZoomCamara(uv1.CAST_CAM_OVERLOOK_SIZE, uv2._zoomSize, uv3)
				end))
			else
				slot1:ZoomCamara(nil, slot0._zoomSize, slot0._duration, true)
			end
		end
	elseif slot0._type == 0 then
		slot1:FocusCharacter(nil, slot0._duration, 0)
		slot1:ZoomCamara(nil, nil, slot0._duration)
	end

	slot1:BulletTime(uv2.SPEED_FACTOR_FOCUS_CHARACTER, nil)
	slot0:doPass()
end
