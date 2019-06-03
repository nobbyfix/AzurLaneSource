ys = ys or {}
slot1 = ys.Battle.BattleFormulas
slot3 = Vector3.zero
slot4 = ys.Battle.BattleConst.OXY_STATE
slot5 = ys.Battle.BattleConst.BulletType
slot6 = class("BattleCldSystem")
ys.Battle.BattleCldSystem = slot6
slot6.__name = "BattleCldSystem"

function slot6.Ctor(slot0, slot1)
	slot0._proxy = slot1

	slot0:InitCldTree()

	slot0._friendlyCode = slot1:GetFriendlyCode()
	slot0._foeCode = slot1:GetFoeCode()
end

function slot6.Dispose(slot0)
	slot0._proxy = nil
	slot0._shipTree = nil
	slot0._foeShipTree = nil
	slot0._aircraftTree = nil
	slot0._surfaceBulletTree = nil
	slot0._airBulletTree = nil
	slot0._bulletTreeList = nil
	slot0._foeSurafceBulletTree = nil
	slot0._foeAirbulletTree = nil
	slot0._foeBulleetTreeList = nil
	slot0._surfaceAOETree = nil
	slot0._airAOETree = nil
	slot0._AOETreeList = nil
	slot0._wallTree = nil
end

function slot6.InitCldTree(slot0)
	slot9, slot8, slot6, slot7 = slot0._proxy:GetTotalBounds()
	slot5 = Vector3(slot3, 0, slot2)
	slot6 = Vector3(slot4, 0, slot1)
	slot0._shipTree = pg.ColliderTree.New("shipTree", slot5, slot6, 2)
	slot0._foeShipTree = pg.ColliderTree.New("foeShipTree", slot5, slot6, 2)
	slot0._aircraftTree = pg.ColliderTree.New("aircraftTree", slot5, slot6, 2)
	slot0._surfaceBulletTree = pg.ColliderTree.New("surfaceBullets", slot5, slot6, 4)
	slot0._airBulletTree = pg.ColliderTree.New("airBullets", slot5, slot6, 3)
	slot0._bulletTreeList = {
		[uv0.BulletField.SURFACE] = slot0._surfaceBulletTree,
		[uv0.BulletField.AIR] = slot0._airBulletTree
	}
	slot0._foeSurafceBulletTree = pg.ColliderTree.New("foeSurfaceBullets", slot5, slot6, 3)
	slot0._foeAirbulletTree = pg.ColliderTree.New("foeAirBullets", slot5, slot6, 3)
	slot0._foeBulleetTreeList = {
		[uv0.BulletField.SURFACE] = slot0._foeSurafceBulletTree,
		[uv0.BulletField.AIR] = slot0._foeAirbulletTree
	}
	slot0._surfaceAOETree = pg.ColliderTree.New("surfaceAOE", slot5, slot6, 2)
	slot0._airAOETree = pg.ColliderTree.New("airAOE", slot5, slot6, 2)
	slot0._AOETreeList = {
		[uv0.AOEField.SURFACE] = slot0._surfaceAOETree,
		[uv0.AOEField.AIR] = slot0._airAOETree
	}
	slot0._wallTree = pg.ColliderTree.New("wall", slot5, slot6, 2)
end

function slot6.UpdateShipCldTree(slot0, slot1)
	slot2 = slot1:GetSpeed()
	slot3 = slot1:GetCldBox()
	slot4 = nil
	slot5 = true

	if slot1:GetCldData().Surface == uv0.OXY_STATE.DIVE then
		slot5 = false
	end

	if slot1:GetIFF() == slot0._foeCode then
		if slot1:GetCldData().FriendlyCld and slot5 then
			slot1:GetCldData().distList = {}

			if #slot0._foeShipTree:GetCldList(slot3, slot2) > 1 then
				slot0:HandleEnemyShipCld(slot6, slot1)
			end
		end

		if slot5 then
			slot0._proxy:HandleShipCrashDecelerate(slot1, slot7)
			slot0:HandlePlayerShipCld(slot0._shipTree:GetCldList(slot3, slot2), slot1)
		end

		slot4 = slot0._foeShipTree
	elseif slot1:GetIFF() == slot0._friendlyCode then
		if slot5 then
			slot0._proxy:HandleShipCrashDecelerate(slot1, slot0.surfaceFilterCount(slot1, slot6))
		end

		slot4 = slot0._shipTree
	end

	slot4:Update(slot3)
end

function slot6.HandlePlayerShipCld(slot0, slot1, slot2)
	if slot2:GetCldData().Active == false then
		return
	end

	slot5 = {}

	for slot9 = 1, #slot1, 1 do
		if slot1[slot9].data.Active == false then
			-- Nothing
		elseif slot10.UID == slot2:GetUniqueID() then
			-- Nothing
		elseif slot3.IFF == slot10.IFF then
			-- Nothing
		elseif slot3.Surface ~= slot10.Surface then
			-- Nothing
		else
			slot5[#slot5 + 1] = slot10.UID
		end
	end

	slot0._proxy:HandleShipCrashDamageList(slot2, slot5)
end

function slot6.HandleEnemyShipCld(slot0, slot1, slot2)
	if slot2:GetCldData().Active == false then
		return
	end

	slot4 = slot2:GetPosition()
	slot5 = {}

	for slot10 = 1, #slot1, 1 do
		if slot1[slot10].data.Active == false then
			-- Nothing
		elseif slot11.UID == slot2:GetUniqueID() then
			-- Nothing
		elseif slot3.IFF ~= slot11.IFF then
			-- Nothing
		elseif not slot11.FriendlyCld then
			-- Nothing
		elseif slot3.Surface ~= slot11.Surface then
			-- Nothing
		else
			slot5[#slot5 + 1] = slot4 - slot0:GetShip(slot11.UID).GetPosition(slot12)
		end
	end

	slot3.distList = slot5
end

function slot6.surfaceFilterCount(slot0, slot1)
	for slot8 = 1, #slot1, 1 do
		if slot1[slot8].data.Active == true and slot9.UID ~= slot0:GetUniqueID() and slot0:GetCldData().IFF ~= slot9.IFF and slot0.GetCldData().Surface == slot9.Surface then
			slot3 = 0 + 1
		end
	end

	return slot3
end

function slot6.UpdateAircraftCld(slot0, slot1)
	slot2 = slot1:GetSpeed()
	slot3 = slot1:GetCldBox()
	slot4 = nil

	if slot1:GetIFF() == slot0._foeCode then
		slot4 = slot0:GetBulletTree(uv0.BulletField.AIR)
	elseif slot1:GetIFF() == slot0._friendlyCode then
		slot4 = slot0:GetFoeBulletTree(uv0.BulletField.AIR)
	end

	slot0:HandleBulletCldWithAircraft(slot5, slot1)
	slot0._aircraftTree:Update(slot1:GetCldBox())
end

function slot6.HandleBulletCldWithAircraft(slot0, slot1, slot2)
	for slot7 = 1, #slot1, 1 do
		if slot1[slot7].data.type == uv0.CldType.BULLET and slot8.Active == true then
			slot0._proxy:HandleBulletHit(slot0:GetBullet(slot8.UID), slot2)
		end
	end
end

function slot6.UpdateBulletCld(slot0, slot1)
	slot3 = slot1:GetCldBox()
	slot5, slot6 = nil

	if slot1:GetCldData().IFF == slot0._friendlyCode then
		slot5 = slot0:GetBulletTree(slot1:GetEffectField())
	elseif slot4 == slot0._foeCode then
		slot5 = slot0:GetFoeBulletTree(slot2)
	end

	if slot2 == uv0.BulletField.SURFACE then
		if slot4 == slot0._friendlyCode then
			slot6 = slot0:GetFoeShipTree()
		elseif slot4 == slot0._foeCode then
			slot6 = slot0:GetShipTree()
		end

		slot0:HandleBulletCldWithShip(slot6:GetCldList(slot3, uv1), slot1)
	end

	slot5:Update(slot3)
end

function slot6.HandleBulletCldWithShip(slot0, slot1, slot2)
	slot4 = slot2:GetType()

	for slot8 = 1, #slot1, 1 do
		if slot1[slot8].data.type == uv0.CldType.SHIP and slot9.Active == true then
			if slot0:GetShip(slot9.UID):GetOxyState() and slot11:GetCurrentDiveState() == uv1.DIVE and slot2:GetCldData().Surface ~= uv0.OXY_STATE.DIVE then
				-- Nothing
			elseif slot0._proxy:HandleBulletHit(slot2, slot10) then
				break
			end
		end
	end
end

function slot6.UpdateAOECld(slot0, slot1)
	slot5 = nil

	slot1:ClearCLDList()
	slot0:HandleAreaCldWithVehicle(slot1, (slot1:GetFieldType() ~= uv0.BulletField.SURFACE or (math.abs(math.cos(slot1:GetAngle() * math.deg2Rad)) == 1 or slot8:GetCldListGradient(slot1.GetAngle() * math.deg2Rad, slot1:GetHeight(), slot1:GetWidth(), slot1:GetPosition())) and slot8:GetCldList(slot1:GetCldBox(), uv1)) and slot0._aircraftTree:GetCldList(slot1.GetCldBox(), uv1))
end

function slot6.HandleAreaCldWithVehicle(slot0, slot1, slot2)
	for slot9 = 1, #slot2, 1 do
		if slot1:OpponentAffected() and slot2[slot9].data.IFF ~= slot1:GetCldData().IFF or not slot1.OpponentAffected() and slot2[slot9].data.IFF == slot1.GetCldData().IFF then
			slot1:AppendCldObj(slot2[slot9].data)
		end
	end
end

function slot6.UpdateWallCld(slot0, slot1)
	slot3 = nil

	slot0:HandleWallCldWithBullet(slot1, (slot1:GetIFF() ~= slot0._friendlyCode or slot0._foeSurafceBulletTree:GetCldList(slot1:GetCldBox(), uv0)) and slot0._surfaceBulletTree:GetCldList(slot1.GetCldBox(), uv0))
end

function slot6.HandleWallCldWithBullet(slot0, slot1, slot2)
	for slot7 = 1, #slot2, 1 do
		if slot2[slot7].data.type == uv0.CldType.BULLET and slot8.Active == true and not slot0._proxy:HandleWallHitByBullet(slot1, slot0:GetBullet(slot8.UID)) then
			return
		end
	end
end

function slot6.InsertToBulletCldTree(slot0, slot1, slot2)
	slot3 = nil

	if slot2:GetCldData().IFF == slot0._foeCode then
		slot3 = slot0:GetFoeBulletTree(slot1)
	elseif slot4.IFF == slot0._friendlyCode then
		slot3 = slot0:GetBulletTree(slot1)
	end

	slot3:Insert(slot2:GetCldBox())
end

function slot6.InsertToAOECldTree(slot0, slot1, slot2)
	slot0:GetAOETree(slot1):Insert(slot2:GetCldBox())
end

function slot6.InsertToWallCldTree(slot0, slot1)
	slot0:GetWallTree():Insert(slot1:GetCldBox())
end

function slot6.InsertToShipCldTree(slot0, slot1)
	slot3 = nil

	if slot1:GetCldData().IFF == slot0._foeCode then
		slot3 = slot0:GetFoeShipTree()
	elseif slot2.IFF == slot0._friendlyCode then
		slot3 = slot0:GetShipTree()
	end

	slot3:Insert(slot1:GetCldBox())
end

function slot6.InsertToAircraftCldTree(slot0, slot1)
	slot0._aircraftTree:Insert(slot1:GetCldBox())
end

function slot6.GetBulletTree(slot0, slot1)
	return slot0._bulletTreeList[slot1]
end

function slot6.GetFoeBulletTree(slot0, slot1)
	return slot0._foeBulleetTreeList[slot1]
end

function slot6.GetAOETree(slot0, slot1)
	return slot0._AOETreeList[slot1]
end

function slot6.GetWallTree(slot0, slot1)
	return slot0._wallTree
end

function slot6.GetShipTree(slot0)
	return slot0._shipTree
end

function slot6.GetFoeShipTree(slot0)
	return slot0._foeShipTree
end

function slot6.GetAircraftTree(slot0)
	return slot0._aircraftTree
end

function slot6.DeleteShipLeaf(slot0, slot1)
	if slot1:GetCldData().IFF == slot0._foeCode then
		slot0.DeleteCldLeaf(slot0:GetFoeShipTree(), slot1)
	elseif slot2 == slot0._friendlyCode then
		slot0.DeleteCldLeaf(slot0:GetShipTree(), slot1)
	end
end

function slot6.DeleteBulletLeaf(slot0, slot1)
	if slot1:GetCldData().IFF == slot0._foeCode then
		slot0.DeleteCldLeaf(slot0:GetFoeBulletTree(slot1:GetEffectField()), slot1)
	elseif slot2 == slot0._friendlyCode then
		slot0.DeleteCldLeaf(slot0:GetBulletTree(slot1:GetEffectField()), slot1)
	end
end

function slot6.DeleteCldLeaf(slot0, slot1)
	slot0:Remove(slot1:GetCldBox())
end

function slot6.GetShip(slot0, slot1)
	return slot0._proxy:GetUnitList()[slot1]
end

function slot6.GetAircraft(slot0, slot1)
	return slot0._proxy:GetAircraftList()[slot1]
end

function slot6.GetBullet(slot0, slot1)
	return slot0._proxy:GetBulletList()[slot1]
end

function slot6.GetAOE(slot0, slot1)
	return slot0._proxy:GetAOEList()[slot1]
end

function slot6.InitShipCld(slot0, slot1)
	slot0:InsertToShipCldTree(slot1)
end

function slot6.DeleteShipCld(slot0, slot1)
	slot1:DeactiveCldBox()
	slot0:DeleteShipLeaf(slot1)
end

function slot6.InitAircraftCld(slot0, slot1)
	slot0:InsertToAircraftCldTree(slot1)
end

function slot6.DeleteAircraftCld(slot0, slot1)
	slot1:DeactiveCldBox()
	slot0.DeleteCldLeaf(slot0:GetAircraftTree(), slot1)
end

function slot6.InitBulletCld(slot0, slot1)
	slot0:InsertToBulletCldTree(slot1:GetEffectField(), slot1)
end

function slot6.DeleteBulletCld(slot0, slot1)
	slot1:DeactiveCldBox()
	slot0:DeleteBulletLeaf(slot1)
end

function slot6.ShiftBulletCld(slot0, slot1)
end

function slot6.InitAOECld(slot0, slot1)
	slot0:InsertToAOECldTree(slot1:GetFieldType(), slot1)
end

function slot6.DeleteAOECld(slot0, slot1)
	slot1:DeactiveCldBox()
	slot0.DeleteCldLeaf(slot0:GetAOETree(slot1:GetFieldType()), slot1)
end

function slot6.InitWallCld(slot0, slot1)
	slot0:InsertToWallCldTree(slot1)
end

function slot6.DeleteWallCld(slot0, slot1)
	slot1:DeactiveCldBox()

	if slot0:GetWallTree() then
		slot0.DeleteCldLeaf(slot2, slot1)
	end
end
