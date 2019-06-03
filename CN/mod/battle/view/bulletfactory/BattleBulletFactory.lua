ys = ys or {}
slot1 = ys.Battle.BattleConst
ys.Battle.BattleBulletFactory = singletonClass("BattleBulletFactory")
ys.Battle.BattleBulletFactory.__name = "BattleBulletFactory"

function ys.Battle.BattleBulletFactory.Ctor(slot0)
end

function ys.Battle.BattleBulletFactory.RecyleTempModel(slot0, slot1)
	slot0._tempGOPool:Recycle(slot1)
end

function ys.Battle.BattleBulletFactory.Clear(slot0)
	if slot0._tempGOPool then
		slot0._tempGOPool:Dispose()

		slot0._tempGOPool = nil
	end
end

function ys.Battle.BattleBulletFactory.CreateBullet(slot0, slot1, slot2, slot3, slot4, slot5)
	slot2:SetOutRangeCallback(slot0.OutRangeFunc)

	slot6 = slot0:MakeBullet()

	slot6:SetFactory(slot0)
	slot6:SetBulletData(slot2)
	slot0:MakeModel(slot6, slot3, slot4, slot5)

	if slot4 and slot4 ~= "" then
		slot0:PlayFireFX(slot1, slot2, slot3, slot4, slot5, nil)
	end

	return slot6
end

function ys.Battle.BattleBulletFactory.GetSceneMediator(slot0)
	return uv0.Battle.BattleState:GetInstance():GetSceneMediator()
end

function ys.Battle.BattleBulletFactory.GetDataProxy(slot0)
	return uv0.Battle.BattleDataProxy:GetInstance()
end

function ys.Battle.BattleBulletFactory.GetFXPool(slot0)
	return uv0.Battle.BattleFXPool:GetInstance()
end

function ys.Battle.BattleBulletFactory.GetBulletPool(slot0)
	return uv0.Battle.BattleResourceManager:GetInstance()
end

function ys.Battle.BattleBulletFactory.OutRangeFunc(slot0)
	uv0.GetDataProxy():RemoveBulletUnit(slot0:GetUniqueID())
end

function ys.Battle.BattleBulletFactory.GetTempGOPool(slot0)
	if slot0._tempGOPool == nil then
		slot1 = GameObject("temp_bullet_OBJ")

		SetActive(slot1, false)
		LuaHelper.SetGOParentTF(slot1, slot2, false)

		slot0._tempGOPool = pg.Pool.New(slot2, slot1, 1, 15, false, false):InitSize()
	end

	return slot0._tempGOPool
end

function ys.Battle.BattleBulletFactory.PlayFireFX(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot7 = slot2:GetWeaponTempData().effect_move == 1

	if slot4 == "" or slot4 == nil then
		if slot6 then
			slot6()
		end
	else
		slot8, slot9 = nil

		if slot7 then
			slot8, slot9 = slot0:GetFXPool():GetFX(slot4, slot1)
		else
			slot8, slot9 = slot0:GetFXPool():GetFX(slot4)
			slot9 = slot11:Add(slot3)
		end

		if slot5 == uv0.UnitDir.LEFT then
			slot8.transform.localEulerAngles.y = 180
			slot8.transform.localEulerAngles = slot8.transform.localEulerAngles
		end

		pg.EffectMgr.GetInstance():PlayBattleEffect(slot8, slot9, true, slot6, true)
	end
end

function ys.Battle.BattleBulletFactory.MakeBullet(slot0)
	return nil
end

function ys.Battle.BattleBulletFactory.MakeModel(slot0, slot1, slot2)
	return nil
end

function ys.Battle.BattleBulletFactory.MakeBombPreCastAlter(slot0, slot1, slot2)
	return slot0:MakeModel(slot1, slot2)
end

function ys.Battle.BattleBulletFactory.MakeModelAfterBombPreCastAlert(slot0, slot1)
	return nil
end

function ys.Battle.BattleBulletFactory.MakeTrack(slot0, slot1, slot2, slot3)
	slot1:AddTrack(slot2)
	pg.EffectMgr.GetInstance():PlayBattleEffect(slot2, slot3, true)
end

function ys.Battle.BattleBulletFactory.RemoveBullet(slot0, slot1)
	slot1:Dispose()
end

function ys.Battle.BattleBulletFactory.GetFactoryList()
	if uv0._factoryList == nil then
		uv0._factoryList = {
			[uv1.BulletType.CANNON] = uv2.Battle.BattleCannonBulletFactory.GetInstance(),
			[uv1.BulletType.BOMB] = uv2.Battle.BattleBombBulletFactory.GetInstance(),
			[uv1.BulletType.TORPEDO] = uv2.Battle.BattleTorpedoBulletFactory.GetInstance(),
			[uv1.BulletType.DIRECT] = uv2.Battle.BattleDirectBulletFactory.GetInstance(),
			[uv1.BulletType.SHRAPNEL] = uv2.Battle.BattleShrapnelBulletFactory.GetInstance(),
			[uv1.BulletType.ANTI_AIR] = uv2.Battle.BattleAntiAirBulletFactory.GetInstance(),
			[uv1.BulletType.ANTI_SEA] = uv2.Battle.BattleAntiSeaBulletFactory.GetInstance(),
			[uv1.BulletType.STRAY] = uv2.Battle.BattleStrayBulletFactory.GetInstance(),
			[uv1.BulletType.EFFECT] = uv2.Battle.BattleEffectBulletFactory.GetInstance(),
			[uv1.BulletType.BEAM] = uv2.Battle.BattleBeamBulletFactory.GetInstance(),
			[uv1.BulletType.G_BULLET] = uv2.Battle.BattleGravitationBulletFactory.GetInstance()
		}
	end

	return uv0._factoryList
end

function ys.Battle.BattleBulletFactory.DestroyFactory()
	uv0._factoryList = nil
end

function ys.Battle.BattleBulletFactory.NeutralizeBullet()
	uv0.Battle.BattleAntiAirBulletFactory.GetInstance():NeutralizeBullet()
	uv0.Battle.BattleAntiSeaBulletFactory.GetInstance():NeutralizeBullet()
end

function ys.Battle.BattleBulletFactory.GetRandomBone(slot0)
	return slot0[math.floor(math.Random(0, #slot0)) + 1]
end
