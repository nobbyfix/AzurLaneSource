ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleEvent
slot3 = ys.Battle.BattleDataFunction
slot4 = class("BattleSingleChallengeCommand", ys.Battle.BattleSingleDungeonCommand)
ys.Battle.BattleSingleChallengeCommand = slot4
slot4.__name = "BattleSingleChallengeCommand"

function slot4.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function slot4.ConfigBattleData(slot0, slot1)
	slot0._challengeInfo = slot1.ChallengeInfo
end

function slot4.initWaveModule(slot0)
	slot0._waveUpdater = uv0.Battle.BattleWaveUpdater.New(function (slot0, slot1, slot2)
		uv0._dataProxy:SpawnMonster(slot0, slot1, slot2, uv1.Battle.BattleConfig.FOE_CODE)
	end, function (slot0)
		uv0._dataProxy:SpawnAirFighter(slot0)
	end, function ()
		if uv0._vertifyFail then
			pg.m02:sendNotification(GAME.CHEATER_MARK, {
				reason = uv0._vertifyFail
			})

			return
		end

		uv0._dataProxy:CalcChallengeScore(true)
		uv0._state:BattleEnd()
	end, function (slot0, slot1, slot2, slot3, slot4)
		uv0._dataProxy:SpawnCubeArea(uv1.Battle.BattleConst.AOEField.SURFACE, -1, slot0, slot1, slot2, slot3, slot4)
	end)
end

function slot4.DoPrologue(slot0)
	pg.UIMgr:GetInstance():Marching()
	slot0._uiMediator:SeaSurfaceShift(45, 0, nil, function ()
		uv0._uiMediator:OpeningEffect(function ()
			slot0 = getProxy(PlayerProxy)

			uv0._uiMediator:ShowAutoBtn()
			uv0._state:ChangeState(uv1.Battle.BattleState.BATTLE_STATE_FIGHT)
			uv0._waveUpdater:Start()
		end)
		uv0._dataProxy:GetFleetByIFF(uv1.Battle.BattleConfig.FRIENDLY_CODE).FleetWarcry(slot0)
		uv0._dataProxy:TirggerBattleStartBuffs()
		uv0._dataProxy:InitAllFleetUnitsWeaponCD()

		for slot5, slot6 in ipairs(slot1) do
			slot6:AddBuff(uv1.Battle.BattleBuffUnit.New(uv1.Battle.BattleConfig.CHALLENGE_INVINCIBLE_BUFF))
		end

		uv0._challengeStartTime = pg.TimeMgr.GetInstance():GetCombatTime()
	end)
end

function slot4.onPlayerShutDown(slot0, slot1)
	if slot0._state:GetState() ~= slot0._state.BATTLE_STATE_FIGHT then
		return
	end

	if #slot0._userFleet:GetScoutList() == 0 then
		slot0._dataProxy:CalcChallengeScore(false)
		slot0._state:BattleEnd()
	end
end

function slot4.onUpdateCountDown(slot0, slot1)
end

function slot4.onInitBattle(slot0)
	uv0.super.onInitBattle(slot0)
	slot0._dataProxy:SetDungeonLevel(slot1)
	slot0._dataProxy:SetRepressReduce(uv1.Battle.BattleDataFunction.GetRateTemplate(slot0._challengeInfo:getDamageRateID()).content)
end
