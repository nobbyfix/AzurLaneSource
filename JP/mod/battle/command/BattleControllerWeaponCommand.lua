ys = ys or {}
slot1 = ys.Battle.BattleEvent
ys.Battle.BattleControllerWeaponCommand = class("BattleControllerWeaponCommand", ys.MVC.Command)
ys.Battle.BattleControllerWeaponCommand.__name = "BattleControllerWeaponCommand"

function ys.Battle.BattleControllerWeaponCommand.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.BattleControllerWeaponCommand.Initialize(slot0)
	uv0.super.Initialize(slot0)

	slot0._dataProxy = slot0._state:GetProxyByName(uv1.Battle.BattleDataProxy.__name)

	slot0:InitBattleEvent()

	slot0._focusBlockCast = false
end

function ys.Battle.BattleControllerWeaponCommand.ActiveBot(slot0, slot1, slot2)
	slot0._manualWeaponAutoBot:SetActive(slot1, slot2)
	slot0._joyStickAutoBot:SetActive(slot1)
end

function ys.Battle.BattleControllerWeaponCommand.TryAutoSub(slot0)
	if uv0.Battle.BattleState.IsAutoSubActive() and slot0._dataProxy:GetFleetByIFF(uv0.Battle.BattleConfig.FRIENDLY_CODE)._submarineVO:GetUseable() and slot2:GetCount() > 0 then
		slot0._dataProxy:SubmarineStrike(uv0.Battle.BattleConfig.FRIENDLY_CODE)
		slot2:Cast()
	end
end

function ys.Battle.BattleControllerWeaponCommand.GetWeaponBot(slot0)
	return slot0._manualWeaponAutoBot
end

function ys.Battle.BattleControllerWeaponCommand.GetBotActiveDuration(slot0)
	return slot0._manualWeaponAutoBot:GetTotalActiveDuration()
end

function ys.Battle.BattleControllerWeaponCommand.GetStickBot(slot0)
	return slot0._joyStickAutoBot
end

function ys.Battle.BattleControllerWeaponCommand.InitBattleEvent(slot0)
	slot0._dataProxy:RegisterEventListener(slot0, uv0.COMMON_DATA_INIT_FINISH, slot0.onUnitInitFinish)
	slot0._dataProxy:RegisterEventListener(slot0, uv0.KIZUNA_JAMMING, slot0.onKizunaJamming)
	slot0._dataProxy:RegisterEventListener(slot0, uv0.KIZUNA_JAMMING_ELIMINATE, slot0.onKizunaJammingEliminate)
end

function ys.Battle.BattleControllerWeaponCommand.Update(slot0, slot1)
	if slot0._jammingFlag then
		return
	end

	if not slot0._focusBlockCast then
		slot0._manualWeaponAutoBot:Update()
	end

	for slot5, slot6 in pairs(slot0._fleetList) do
		slot6:UpdateManualWeaponVO(slot1)
	end
end

function ys.Battle.BattleControllerWeaponCommand.onKizunaJamming(slot0)
	slot0._jammingFlag = true
end

function ys.Battle.BattleControllerWeaponCommand.onKizunaJammingEliminate(slot0)
	slot0._jammingFlag = false
end

function ys.Battle.BattleControllerWeaponCommand.onUnitInitFinish(slot0, slot1)
	slot0._fleetList = slot0._dataProxy:GetFleetList()
	slot2 = slot0._dataProxy:GetFleetByIFF(uv0.Battle.BattleConfig.FRIENDLY_CODE)

	slot2:RegisterEventListener(slot0, uv1.REFRESH_FLEET_FORMATION, slot0.onFleetFormationUpdate)
	slot2:RegisterEventListener(slot0, uv1.OVERRIDE_AUTO_BOT, slot0.onOverrideAutoBot)

	slot0._manualWeaponAutoBot = uv0.Battle.BattleManualWeaponAutoBot.New(slot2)
	slot0._joyStickAutoBot = uv0.Battle.BattleJoyStickAutoBot.New(slot0._dataProxy, slot2)

	uv0.Battle.BattleCameraUtil:GetInstance():RegisterEventListener(slot0, uv1.CAMERA_FOCUS, slot0.onCameraFocus)
end

function ys.Battle.BattleControllerWeaponCommand.onFleetFormationUpdate(slot0, slot1)
	slot0._joyStickAutoBot:FleetFormationUpdate()
end

function ys.Battle.BattleControllerWeaponCommand.onOverrideAutoBot(slot0, slot1)
	slot0._joyStickAutoBot:SwitchStrategy(uv0.Battle.BattleJoyStickAutoBot.AUTO_PILOT)
end

function ys.Battle.BattleControllerWeaponCommand.onCameraFocus(slot0, slot1)
	if slot1.Data.unit ~= nil then
		slot0._focusBlockCast = true
	else
		LeanTween.delayedCall(slot2.duration + slot2.extraBulletTime, System.Action(function ()
			uv0._focusBlockCast = false
		end))
	end
end

function ys.Battle.BattleControllerWeaponCommand.Dispose(slot0)
	slot1 = slot0._dataProxy:GetFleetByIFF(uv0.Battle.BattleConfig.FRIENDLY_CODE)

	slot1:UnregisterEventListener(slot0, uv1.REFRESH_FLEET_FORMATION)
	slot1:UnregisterEventListener(slot0, uv1.OVERRIDE_AUTO_BOT)
	slot0._dataProxy:UnregisterEventListener(slot0, uv1.COMMON_DATA_INIT_FINISH)
	slot0._dataProxy:UnregisterEventListener(slot0, uv1.KIZUNA_JAMMING)
	slot0._dataProxy:UnregisterEventListener(slot0, uv1.KIZUNA_JAMMING_ELIMINATE)
	uv0.Battle.BattleCameraUtil:GetInstance():UnregisterEventListener(slot0, uv1.CAMERA_FOCUS)
	slot0._joyStickAutoBot:Dispose()

	slot0._joyStickAutoBot = nil

	slot0._manualWeaponAutoBot:Dispose()

	slot0._manualWeaponAutoBot = nil

	slot0.super.Dispose(slot0)
end
