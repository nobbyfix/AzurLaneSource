ys = ys or {}
slot1 = ys.Battle.BattleConfig
ys.Battle.BattleAidWave = class("BattleAidWave", ys.Battle.BattleWaveInfo)
ys.Battle.BattleAidWave.__name = "BattleAidWave"

function ys.Battle.BattleAidWave.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.BattleAidWave.SetWaveData(slot0, slot1)
	uv0.super.SetWaveData(slot0, slot1)

	slot0._vanguardUnitList = slot0._param.vanguard_unitList
	slot0._mainUnitList = slot0._param.main_unitList
	slot0._killList = slot0._param.kill_list
end

function ys.Battle.BattleAidWave.DoWave(slot0)
	uv0.super.DoWave(slot0)

	if slot0._killList ~= nil then
		slot2 = uv1.Battle.BattleDataProxy:GetInstance():GetFriendlyShipList()

		for slot6, slot7 in ipairs(slot0._killList) do
			for slot11, slot12 in pairs(slot2) do
				if slot12:GetTemplateID() == slot7 then
					slot12:Retreat()
				end
			end
		end
	end

	if slot0._vanguardUnitList ~= nil then
		for slot5, slot6 in ipairs(slot0._vanguardUnitList) do
			for slot11, slot12 in ipairs(slot6.equipment) do
			end

			Clone(slot6).equipment = slot7

			slot1.InitUnitWeaponCD(slot9)
			slot1:InitAidUnitStatistics(slot1:SpawnVanguard(slot8, uv2.FRIENDLY_CODE))
		end
	end

	if slot0._mainUnitList ~= nil then
		for slot5, slot6 in ipairs(slot0._mainUnitList) do
			for slot11, slot12 in ipairs(slot6.equipment) do
			end

			Clone(slot6).equipment = slot7

			slot1.InitUnitWeaponCD(slot9)
			slot1:InitAidUnitStatistics(slot1:SpawnMain(slot8, uv2.FRIENDLY_CODE))
		end
	end

	slot0:doPass()
end
