ys = ys or {}
ys.Battle.BattleChargeWeaponVO = class("BattleChargeWeaponVO", ys.Battle.BattlePlayerWeaponVO)
ys.Battle.BattleChargeWeaponVO.__name = "BattleChargeWeaponVO"
ys.Battle.BattleChargeWeaponVO.GCD = ys.Battle.BattleConfig.ChargeWeaponConfig.GCD

function ys.Battle.BattleChargeWeaponVO.Ctor(slot0)
	uv0.super.Ctor(slot0, uv0.GCD)
end

function ys.Battle.BattleChargeWeaponVO.AppendWeapon(slot0, slot1)
	uv0.super.AppendWeapon(slot0, slot1)
	slot1:SetPlayerChargeWeaponVO(slot0)
end

function ys.Battle.BattleChargeWeaponVO.Deduct(slot0, slot1)
	uv0.super.Deduct(slot0, slot1)
	slot0:ResetFocus()
end

function ys.Battle.BattleChargeWeaponVO.ResetFocus(slot0)
	if slot0._focus then
		slot1 = uv0.Battle.BattleCameraUtil:GetInstance()

		slot1:FocusCharacter(nil, uv1.CAST_CAM_ZOOM_OUT_DURATION_CANNON, uv1.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_CANNON)
		slot1:ZoomCamara(uv1.CAST_CAM_ZOOM_SIZE, uv1.CAST_CAM_OVERLOOK_SIZE, uv1.CAST_CAM_ZOOM_OUT_DURATION_CANNON)
		LeanTween.delayedCall(uv1.CAST_CAM_ZOOM_OUT_DURATION_CANNON + uv1.CAST_CAM_ZOOM_OUT_EXTRA_DELAY_CANNON, System.Action(function ()
			uv0._focus = false

			uv1:BulletTime(uv2.SPEED_FACTOR_FOCUS_CHARACTER, nil)
			uv1:ZoomCamara(nil, nil, uv2.CAST_CAM_OVERLOOK_REVERT_DURATION)
		end))
	end
end
