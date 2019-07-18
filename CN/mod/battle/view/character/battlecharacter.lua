ys = ys or {}
slot1 = ys.Battle.BattleUnitEvent
slot2 = ys.Battle.BattleConst
slot3 = ys.Battle.BattleConfig
slot4 = ys.Battle.BattleResourceManager
slot5 = class("BattleCharacter", ys.Battle.BattleSceneObject)
ys.Battle.BattleCharacter = slot5
slot5.__name = "BattleCharacter"
slot6 = Vector2(-1200, 0)
slot7 = Vector3.New(0.3, -1.8, 0)

slot5.Ctor = function (slot0)
	slot0.super.Ctor(slot0)
	slot0:Init()
end

slot5.Init = function (slot0)
	slot0.EventListener.AttachEventListener(slot0)
	slot0:InitBulletFactory()
	slot0:InitEffectView()

	slot0._tagFXList = {}
	slot0._cacheFXList = {}
	slot0._allFX = {}
	slot0._bulletCache = {}
	slot0._attachWeaponList = {}
	slot0._characterPos = Vector3.zero
	slot0._inViewArea = false
	slot0._alwaysHideArrow = false
	slot0._hideHP = false
	slot0._referenceVector = Vector3.zero
	slot0._referenceVectorTemp = Vector3.zero
	slot0._hpBarPos = Vector3.zero
	slot0._arrowVector = Vector3.zero
	slot0._arrowAngleVector = Vector3.zero
end

slot5.InitBulletFactory = function (slot0)
	slot0._bulletFactoryList = slot0.Battle.BattleBulletFactory.GetFactoryList()
end

slot5.SetUnitData = function (slot0, slot1)
	slot0._unitData = slot1

	slot0:AddUnitEvent()
end

slot5.SetBoneList = function (slot0)
	slot0._boneList = {}
	slot0._bonePosTable = nil
	slot0._posMatrix = nil
	slot1 = slot0:GetInitScale()

	for slot5, slot6 in pairs(slot0._unitData:GetTemplate().bound_bone) do
		slot7 = {}

		for slot11, slot12 in ipairs(slot6) do
			if type(slot12) == "table" then
				slot7[#slot7 + 1] = Vector3(slot12[1], slot12[2], slot12[3])
			else
				slot7[#slot7 + 1] = Vector3.zero
			end
		end

		slot0._boneList[slot5] = slot7
	end
end

slot5.SpawnBullet = function (slot0, slot1, slot2, slot3)
	slot0._bulletFactoryList[slot1:GetTemplate().type]:CreateBullet(slot0._tf, slot1, slot0:GetBonePos(slot2), slot3, slot0._unitData:GetDirection())
end

slot5.GetBonePos = function (slot0, slot1)
	if slot0._boneList[slot1] == nil or #slot2 == 0 then
		return Vector3.zero
	end

	slot3 = nil

	if not slot0._posMatrix then
		slot0._posMatrix = slot0._tf.localToWorldMatrix
		slot0._bonePosTable = {}
	else
		slot3 = slot0._posMatrix
	end

	if slot0._bonePosTable[slot1] == nil then
		slot4 = {}

		for slot8, slot9 in ipairs(slot2) do
			slot4[#slot4 + 1] = slot3:MultiplyPoint3x4(slot9)
		end

		slot0._bonePosTable[slot1] = slot4
	end

	if #slot4 == 1 then
		return slot4[1]
	else
		return slot4[math.floor(math.Random(0, #slot4)) + 1]
	end
end

slot5.AddFXOffsets = function (slot0, slot1, slot2)
	slot0._FXAttachPoint = slot1
	slot0._FXOffset = slot2
end

slot5.GetFXOffsets = function (slot0, slot1)
	return slot0._FXOffset[slot1 or 1]
end

slot5.GetAttachPoint = function (slot0)
	return slot0._FXAttachPoint
end

slot5.GetSpecificFXScale = function (slot0)
	return {}
end

slot5.PlayFX = function (slot0, slot1)
	pg.EffectMgr.GetInstance():PlayBattleEffect(slot0:GetFactory():GetFXPool():GetFX(slot1), slot0:GetPosition(), true)
end

slot5.AddFX = function (slot0, slot1, slot2, slot3, slot4)
	slot5 = slot0:GetFactory():GetFXPool():GetCharacterFX(slot1, slot0, not slot2, function (slot0)
		if slot0 then
			slot0()
		end

		slot1._allFX[slot0] = nil
	end, slot3)

	if slot2 then
		slot0._cacheFXList[slot1] = slot5
	end

	slot0._allFX[slot5] = true

	return slot5
end

slot5.RemoveFX = function (slot0, slot1)
	if slot0._allFX and slot0._allFX[slot1] then
		slot0._allFX[slot1] = nil

		slot0:GetInstance():DestroyOb(slot1)
	end
end

slot5.RemoveCacheFX = function (slot0, slot1)
	if slot0._cacheFXList[slot1] ~= nil then
		slot0._allFX[slot2] = nil

		slot0:GetInstance():DestroyOb(slot2)

		slot0._cacheFXList[slot1] = nil
	end
end

slot5.AddWaveFX = function (slot0, slot1)
	slot0._waveFX = slot0:AddFX(slot1)
end

slot5.AddBlink = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	if slot0._unitData:GetDiveInvisible() then
		return nil
	end

	slot8 = nil

	return SpineAnim.CharBlink(slot0._go, slot1, slot2, slot3, slot7 or 0.18, slot4 or 0.1, slot5 or 0.1, slot6 or false)
end

slot5.RemoveBlink = function (slot0, slot1)
	SpineAnim.RemoveBlink(slot0._go, slot1)
end

slot5.AddShaderColor = function (slot0, slot1)
	slot0._animator:ShiftShader(slot0:GetTf():GetComponent(typeof(Renderer)).material.shader, slot1 or Color.New(0, 0, 0, 0))
end

slot5.GetPosition = function (slot0)
	return slot0._characterPos
end

slot5.GetUnitData = function (slot0)
	return slot0._unitData
end

slot5.GetDestroyFXID = function (slot0)
	return slot0:GetUnitData():GetTemplate().bomb_fx
end

slot5.GetOffsetPos = function (slot0)
	return BuildVector3(slot0._unitData:GetTemplate().position_offset)
end

slot5.GetReferenceVector = function (slot0, slot1)
	if slot1 == nil then
		return slot0._referenceVector
	else
		slot0._referenceVectorTemp:Set(slot0._characterPos.x, slot0._characterPos.y, slot0._characterPos.z)
		slot0._referenceVectorTemp:Sub(slot1)
		slot0.Battle.BattleVariable.CameraPosToUICameraByRef(slot0._referenceVectorTemp)

		slot0._referenceVectorTemp.z = 2

		return slot0._referenceVectorTemp
	end
end

slot5.GetInitScale = function (slot0)
	return slot0._unitData:GetTemplate().scale / 50
end

slot5.AddUnitEvent = function (slot0)
	slot0._unitData:RegisterEventListener(slot0, slot0.SPAWN_CACHE_BULLET, slot0.onSpawnCacheBullet)
	slot0._unitData:RegisterEventListener(slot0, slot0.CREATE_TEMPORARY_WEAPON, slot0.onNewWeapon)
	slot0._unitData:RegisterEventListener(slot0, slot0.ADD_TAG, slot0.onAddTag)
	slot0._unitData:RegisterEventListener(slot0, slot0.REMOVE_TAG, slot0.onRemoveTag)
	slot0._unitData:RegisterEventListener(slot0, slot0.POP_UP, slot0.onPopup)
	slot0._unitData:RegisterEventListener(slot0, slot0.VOICE, slot0.onVoice)
	slot0._unitData:RegisterEventListener(slot0, slot0.PLAY_FX, slot0.onPlayFX)
	slot0._unitData:RegisterEventListener(slot0, slot0.REMOVE_WEAPON, slot0.onRemoveWeapon)
	slot0._unitData:RegisterEventListener(slot0, slot0.ADD_BLINK, slot0.onBlink)
	slot0._unitData:RegisterEventListener(slot0, slot0.SUBMARINE_VISIBLE, slot0.onUpdateDiveInvisible)
	slot0._unitData:RegisterEventListener(slot0, slot0.SUBMARINE_DETECTED, slot0.onDetected)
	slot0._unitData:RegisterEventListener(slot0, slot0.INIT_ANIT_SUB_VIGILANCE, slot0.onInitVigilantState)
	slot0._unitData:RegisterEventListener(slot0, slot1.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE, slot0.onChangeSize)
	slot0._unitData:RegisterEventListener(slot0, slot1.Battle.BattleBuffEvent.BUFF_EFFECT_NEW_WEAPON, slot0.onNewWeapon)
	slot0._unitData:RegisterEventListener(slot0, slot0.UPDATE_SCORE, slot0.onUpdateScore)

	for slot5, slot6 in ipairs(slot1) do
		slot0:RegisterWeaponListener(slot6)
	end

	slot0._effectOb:SetUnitDataEvent(slot0._unitData)
end

slot5.RemoveUnitEvent = function (slot0)
	slot0._unitData:UnregisterEventListener(slot0, slot0.UPDATE_HP)
	slot0._unitData:UnregisterEventListener(slot0, slot0.CREATE_TEMPORARY_WEAPON)
	slot0._unitData:UnregisterEventListener(slot0, slot0.CHANGE_ACTION)
	slot0._unitData:UnregisterEventListener(slot0, slot0.SPAWN_CACHE_BULLET)
	slot0._unitData:UnregisterEventListener(slot0, slot0.ADD_TAG)
	slot0._unitData:UnregisterEventListener(slot0, slot0.REMOVE_TAG)
	slot0._unitData:UnregisterEventListener(slot0, slot0.POP_UP)
	slot0._unitData:UnregisterEventListener(slot0, slot0.VOICE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.PLAY_FX)
	slot0._unitData:UnregisterEventListener(slot0, slot0.REMOVE_WEAPON)
	slot0._unitData:UnregisterEventListener(slot0, slot0.ADD_BLINK)
	slot0._unitData:UnregisterEventListener(slot0, slot0.SUBMARINE_VISIBLE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.UPDATE_SCORE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.CHANGE_ANTI_SUB_VIGILANCE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.INIT_ANIT_SUB_VIGILANCE)
	slot0._unitData:UnregisterEventListener(slot0, slot0.ANTI_SUB_VIGILANCE_SONAR_CHECK)
	slot0._unitData:UnregisterEventListener(slot0, slot1.Battle.BattleBuffEvent.BUFF_EFFECT_CHNAGE_SIZE)
	slot0._unitData:UnregisterEventListener(slot0, slot1.Battle.BattleBuffEvent.BUFF_EFFECT_NEW_WEAPON)

	for slot5, slot6 in ipairs(slot1) do
		slot0:UnregisterWeaponListener(slot6)
	end

	for slot6, slot7 in ipairs(slot2) do
		slot0:UnregisterWeaponListener(slot7)
	end
end

slot5.Update = function (slot0)
	slot0._bonePosSet = nil

	slot0:UpdateUIComponentPosition()
	slot0:UpdateHPPop()
	slot0:UpdateAniEffect(slot1)
	slot0:UpdateTagEffect(pg.TimeMgr.GetInstance():GetCombatTime())
	slot0:UpdateHPBarPostition()
	slot0:UpdateChatPosition()
	slot0:UpdateHpBar()
	slot0:updateSomkeFX()
end

slot5.RegisterWeaponListener = function (slot0, slot1)
	slot1:RegisterEventListener(slot0, slot0.CREATE_BULLET, slot0.onCreateBullet)
	slot1:RegisterEventListener(slot0, slot0.FIRE, slot0.onCannonFire)
end

slot5.UnregisterWeaponListener = function (slot0, slot1)
	slot1:UnregisterEventListener(slot0, slot0.CREATE_BULLET)
	slot1:UnregisterEventListener(slot0, slot0.FIRE)
end

slot5.onCreateBullet = function (slot0, slot1)
	slot0:SpawnBullet(slot1.Data.bullet, slot1.Data.spawnBound, slot1.Data.fireFxID)
end

slot5.onCannonFire = function (slot0, slot1)
	slot2 = slot1.Dispatcher
	slot3 = slot1.Data.target
	slot4 = slot1.Data.actionIndex or "attack"
	slot6 = nil

	if not slot0._unitData:NeedWeaponCache() then
		if slot0._cacheWeapon == nil then
			slot6 = false
		else
			slot6 = true
		end
	else
		slot0._cacheWeapon = {}
		slot6 = true

		slot0._unitData:StateChange(slot0.Battle.UnitState.STATE_ATTACK, slot4)
	end

	if slot6 == true then
		slot0._cacheWeapon[#slot0._cacheWeapon + 1] = {
			weapon = slot2,
			target = slot3,
			weapon = slot2,
			target = slot3
		}
	else
		slot2:DoAttack(slot3)
	end
end

slot5.onSpawnCacheBullet = function (slot0)
	if slot0._cacheWeapon then
		for slot4, slot5 in ipairs(slot0._cacheWeapon) do
			slot5.weapon:DoAttack(slot5.target)

			if not slot0._unitData:IsAlive() then
				break
			end
		end

		slot0._cacheWeapon = nil
	end
end

slot5.onNewWeapon = function (slot0, slot1)
	table.insert(slot0._attachWeaponList, slot2)
	slot0:RegisterWeaponListener(slot1.Data.weapon)
end

slot5.onAddTag = function (slot0, slot1)
	slot3 = slot0:GetFactory():MakeTag(slot1.Data.tagID)

	slot3:SetTagCount(slot4)
	slot3:Mark(slot1.Data.requiredTime)

	slot0._tagFXList[slot1.Data.tagID] = slot3
end

slot5.onRemoveTag = function (slot0, slot1)
	slot0._tagFXList[slot1.Data.tagID] = nil

	slot0._tagFXList[slot1.Data.tagID]:Dispose()
end

slot5.onPopup = function (slot0, slot1)
	slot0:SetPopup(slot1.Data.content, slot1.Data.duration, slot1.Data.key)
end

slot5.onVoice = function (slot0, slot1)
	slot0:Voice(slot1.Data.content, slot1.Data.key)
end

slot5.onPlayFX = function (slot0, slot1)
	slot2 = slot1.Data.fxName

	if slot1.Data.notAttach then
		slot0:PlayFX(slot2)
	else
		slot0:AddFX(slot2)
	end
end

slot5.onRemoveWeapon = function (slot0, slot1)
	slot2 = slot1.Data.weapon

	if slot0._cacheWeapon then
		for slot6, slot7 in ipairs(slot0._cacheWeapon) do
			if slot7.weapon == slot2 then
				table.remove(slot0._cacheWeapon, slot6)

				break
			end
		end
	end

	slot0:UnregisterWeaponListener(slot2)
end

slot5.onBlink = function (slot0, slot1)
	slot0:AddBlink(slot1.Data.blink.red, slot1.Data.blink.green, slot1.Data.blink.blue, slot1.Data.blink.peroid, slot1.Data.blink.duration, true, slot1.Data.blink.alpha)
end

slot5.onUpdateDiveInvisible = function (slot0, slot1)
	slot0:UpdateDiveInvisible()
end

slot5.UpdateDiveInvisible = function (slot0)
	slot1 = slot0._unitData:GetDiveInvisible()
	slot2 = slot0._unitData:GetIFF() == slot0.FOE_CODE

	if slot1 then
		if slot0._waveFX then
			SetActive(slot0._waveFX.transform, false)
		end

		slot3 = slot0:GetFactory():GetDivingFilterColor()

		if slot2 then
			slot0:SwitchShader(slot1:GetInstance():GetShader("GRID_TRANSPARENT"), slot3)
			slot0:updateComponentDiveInvisible()
		else
			slot0:SwitchShader(slot1:GetInstance():GetShader("SEMI_TRANSPARENT"), slot3)
		end

		slot0._animator:ChangeRenderQueue(2999)
	else
		if slot0._waveFX then
			SetActive(slot0._waveFX.transform, true)
		end

		if slot2 then
			slot0:SwitchShader()
			slot0:updateComponentDiveInvisible()
		else
			slot0:SwitchShader()
			slot0:AddShaderColor()
		end

		slot0._animator:ChangeRenderQueue(3000)
	end
end

slot5.onDetected = function (slot0, slot1)
	slot3 = slot1.Data.duration

	if slot0._unitData:GetDiveDetected() and slot0._unitData:GetIFF() == slot0.FOE_CODE then
		SpineAnim.CharFade(slot0._go, slot3, slot3, 0.7, true)

		slot0._shockFX = slot0:AddFX("shock", true, true)
	else
		slot0:RemoveCacheFX(slot0._shockFX)
	end

	slot0:updateComponentDiveInvisible()
end

slot5.updateComponentDiveInvisible = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = slot0._unitData:GetDiveDetected() and slot0._unitData:GetIFF() == slot0.FOE_CODE
	slot3 = nil

	SetActive(slot0._arrowBarTf, not (not (slot0._unitData.GetDiveDetected() and slot0._unitData.GetIFF() == slot0.FOE_CODE) and slot0._unitData:GetDiveInvisible()))
	SetActive(slot0._HPBarTf, not (not (slot0._unitData.GetDiveDetected() and slot0._unitData.GetIFF() == slot0.FOE_CODE) and slot0._unitData.GetDiveInvisible()))
	SetActive(slot0._FXAttachPoint, not (not (slot0._unitData.GetDiveDetected() and slot0._unitData.GetIFF() == slot0.FOE_CODE) and slot0._unitData.GetDiveInvisible()))

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-14, warpins: 1 ---
	if slot0._unitData:GetIFF() ~= slot0.FOE_CODE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		slot1 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-17, warpins: 1 ---
		slot1 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-24, warpins: 3 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 25-26, warpins: 1 ---
	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-28, warpins: 2 ---
		slot3 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-29, warpins: 1 ---
		slot3 = true
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 30-42, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

slot5.onInitVigilantState = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-40, warpins: 1 ---
	slot0._factory:MakeVigilantBar(slot0)

	range = slot1.Data.sonarRange * 0.5
	slot0:AddFX("AntiSubArea", true).transform.localScale = Vector3(range, 0, range)

	slot0._unitData:RegisterEventListener(slot0, slot0.CHANGE_ANTI_SUB_VIGILANCE, slot0.onVigilantStateChange)
	slot0._unitData:RegisterEventListener(slot0, slot0.ANTI_SUB_VIGILANCE_SONAR_CHECK, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-20, warpins: 1 ---
		slot0 = slot0:Find("Quad"):GetComponent(typeof(Animator))
		slot0.enabled = true

		slot0:Play("antiSubZoom", -1, 0)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

slot5.onVigilantStateChange = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0:updateVigilantMark()

	return
	--- END OF BLOCK #0 ---



end

slot5.updateVigilantMark = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._vigilantBar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0._vigilantBar:UpdateVigilantMark()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-8, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot5.OnActionChange = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0:PlayAction(slot1.Data.actionType)

	return
	--- END OF BLOCK #0 ---



end

slot5.PlayAction = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0._animator:SetAction(slot1, 0, slot0.ActionLoop[slot1])

	return
	--- END OF BLOCK #0 ---



end

slot5.SetAnimaSpeed = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0._skeleton then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-10, warpins: 1 ---
		slot2 = slot0:GetTf():GetComponent("SkeletonAnimation")
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-13, warpins: 2 ---
	slot0._skeleton = slot2

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-14, warpins: 1 ---
		slot1 = 1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-17, warpins: 2 ---
	slot0._skeleton.timeScale = slot1

	return
	--- END OF BLOCK #2 ---



end

slot5.UpdatePosition = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0._go then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-12, warpins: 2 ---
	slot0._characterPos = slot0._unitData:GetPosition()
	slot0._tf.localPosition = slot0._unitData.GetPosition()

	return
	--- END OF BLOCK #1 ---



end

slot5.UpdateMatrix = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0._bonePosTable = nil
	slot0._posMatrix = nil

	return
	--- END OF BLOCK #0 ---



end

slot5.UpdateUIComponentPosition = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot1 = slot0._unitData:GetPosition()

	slot0._referenceVector:Set(slot1.x, slot1.y, slot1.z)
	slot0.Battle.BattleVariable.CameraPosToUICameraByRef(slot0._referenceVector)

	slot0._referenceVector.z = 10

	return
	--- END OF BLOCK #0 ---



end

slot5.UpdateHPBarPostition = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0._hideHP then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-15, warpins: 1 ---
		slot0._hpBarPos:Copy(slot0._referenceVector):Add(slot0._hpBarOffset)

		slot0._HPBarTf.position = slot0._hpBarPos
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot5.SetBarHidden = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0._alwaysHideArrow = slot1
	slot0._hideHP = slot2

	if slot0._arrowBar then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-8, warpins: 1 ---
		if slot0._alwaysHideArrow then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-12, warpins: 1 ---
			slot0._arrowBarTf.anchoredPosition = slot0
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-15, warpins: 1 ---
			slot0._arrowBarTf.position = slot0._arrowVector
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot5.SetSkeletonAutoCalcComplex = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

slot5.UpdateCastClockPosition = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0._castClock:UpdateCastClockPosition(slot0._referenceVector)

	return
	--- END OF BLOCK #0 ---



end

slot5.SetArrowPoint = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0._arrowVector:Set()

	slot0._cameraUtil = slot0.Battle.BattleCameraUtil:GetInstance()
	slot0._arrowCenterPos = slot0._cameraUtil:GetArrowCenterPos()

	return
	--- END OF BLOCK #0 ---



end

slot8 = Vector3(-1, 1, 1)
slot9 = Vector3(1, 1, 1)

slot5.UpdateArrowBarPostition = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if not slot0._cameraUtil:GetCharacterArrowBarPosition(slot0._referenceVector, slot0._arrowVector) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-11, warpins: 1 ---
		if not slot0._inViewArea then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-17, warpins: 1 ---
			slot0._inViewArea = true
			slot0._arrowBarTf.anchoredPosition = slot0
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-23, warpins: 1 ---
		slot0._arrowVector = slot1
		slot0._inViewArea = false

		if not slot0._alwaysHideArrow then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-31, warpins: 1 ---
			slot0._arrowBarTf.position = slot0._arrowVector

			if slot0._arrowVector.x > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 32-35, warpins: 1 ---
				slot0._arrowBarTf.localScale = slot1
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-38, warpins: 1 ---
				slot0._arrowBarTf.localScale = slot0._arrowBarTf
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 39-39, warpins: 5 ---
	return
	--- END OF BLOCK #1 ---



end

slot5.UpdateArrowBarRotation = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._inViewArea then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-26, warpins: 2 ---
	slot0._arrowAngleVector.z = math.rad2Deg * math.atan2(slot0._arrowVector.y - slot0._arrowCenterPos.y, slot0._arrowVector.x - slot0._arrowCenterPos.x)
	slot0._arrowBarTf.eulerAngles = slot0._arrowAngleVector

	return
	--- END OF BLOCK #1 ---



end

slot5.UpdateChatPosition = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if not slot0._popGO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-7, warpins: 2 ---
	if slot0._inViewArea then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot0._popTF.position = slot0:GetReferenceVector()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		slot0._popTF.position = slot0._arrowVector + slot0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot5.Dispose = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._popGO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		LeanTween.cancel(slot0._popGO)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-14, warpins: 2 ---
	Object.Destroy(slot0._popGO)

	if slot0._voice then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-19, warpins: 1 ---
		slot0._voice:Stop(true)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 20-33, warpins: 2 ---
	slot0._voice = nil
	slot0._popGO = nil
	slot0._popTF = nil
	slot0._cacheWeapon = nil
	slot0._popNumPool = nil

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 34-43, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._allFX) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-41, warpins: 1 ---
		slot0:GetInstance():DestroyOb(slot4)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 42-43, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 44-106, warpins: 1 ---
	pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._voiceTimer)

	slot0._voiceTimer = nil

	slot0._effectOb:RemoveUnitEvent(slot0._unitData)
	slot0._effectOb:Dispose()

	slot0._HPProgressBar = nil
	slot0._HPProgress = nil

	slot0._factory:GetHPBarPool():DestroyObj(slot0._HPBar)

	slot0._HPBar = nil
	slot0._HPBarTf = nil
	slot0._arrowBar = nil
	slot0._arrowBarTf = nil
	slot0._animator = nil
	slot0._skeleton = nil
	slot0._posMatrix = nil
	slot0._shockFX = nil
	slot0._waveFX = nil

	slot0:RemoveUnitEvent()
	slot0.RemoveUnitEvent.EventListener.DetachEventListener(slot0)

	slot0._bulletFactoryList = nil

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 107-111, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._tagFXList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 107-109, warpins: 1 ---
		slot5:Dispose()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 110-111, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 112-121, warpins: 1 ---
	slot0._tagFXList = nil
	slot0._attachWeaponList = {}

	slot2.super.Dispose(slot0)

	return
	--- END OF BLOCK #6 ---



end

slot5.AddModel = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	slot0:SetGO(slot1)

	slot0._hpBarOffset = Vector3(0, slot0._unitData:GetBoxSize().y, 0)
	slot0._animator = slot0:GetTf():GetComponent(typeof(SpineAnim))

	if slot0._animator then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-34, warpins: 1 ---
		slot0._animator.autoCalcComplex = true

		slot0._animator:Start()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 35-70, warpins: 2 ---
	slot0:SetBoneList()

	slot0._tf.position = slot0._unitData:GetPosition()

	slot0:UpdateMatrix()
	slot0._unitData:ActiveCldBox()

	slot2 = slot0:GetInitScale()
	slot0._tf.localScale = Vector3(slot2 * slot0._unitData:GetDirection(), slot2, slot2)

	if slot0._unitData:GetOxyState() and slot3:GetCurrentDiveState() == slot0.Battle.BattleConst.OXY_STATE.DIVE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 81-89, warpins: 1 ---
		slot0:PlayAction(slot0.Battle.BattleConst.ActionName.DIVE)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-97, warpins: 2 ---
		slot0:PlayAction(slot0.Battle.BattleConst.ActionName.MOVE)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 98-112, warpins: 2 ---
	slot0._animator:SetActionCallBack(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-2, warpins: 1 ---
		if slot0 == "finish" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 3-7, warpins: 1 ---
			slot0:OnAnimatorEnd()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-9, warpins: 1 ---
			if slot0 == "action" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-13, warpins: 1 ---
				slot0:OnAnimatorTrigger()
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 14-14, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)
	slot0._unitData:RegisterEventListener(slot0, slot1.CHANGE_ACTION, slot0.OnActionChange)

	return
	--- END OF BLOCK #2 ---



end

slot5.AddSmokeFXs = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0._smokeList = slot1

	slot0:updateSomkeFX()

	return
	--- END OF BLOCK #0 ---



end

slot5.AddShadow = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0._shadow = slot1

	return
	--- END OF BLOCK #0 ---



end

slot5.AddHPBar = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-31, warpins: 1 ---
	slot0._HPBar = slot1
	slot0._HPBarTf = slot1.transform
	slot0._HPProgressBar = slot0._HPBarTf:Find("blood")
	slot0._HPProgress = slot0._HPProgressBar:GetComponent(typeof(Image))

	slot0._unitData:RegisterEventListener(slot0, slot0.UPDATE_HP, slot0.OnUpdateHP)

	slot0._HPBarTf.position = slot0._referenceVector + slot0._hpBarOffset

	return
	--- END OF BLOCK #0 ---



end

slot5.AddUIComponentContainer = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot0:UpdateUIComponentPosition()

	return
	--- END OF BLOCK #0 ---



end

slot5.AddPopNumPool = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot0._popNumPool = slot1
	slot0._hpPopIndex_put = 1
	slot0._hpPopIndex_get = 1
	slot0._hpPopCount = 0
	slot0._hpPopCatch = {}

	return
	--- END OF BLOCK #0 ---



end

slot5.AddArrowBar = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot0._arrowBar = slot1
	slot0._arrowBarTf = slot1.transform

	slot0:SetArrowPoint()

	return
	--- END OF BLOCK #0 ---



end

slot5.AddCastClock = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	SetActive(slot2, false)

	slot0._castClock = slot0.Battle.BattleCastBar.New(slot2)

	slot0:UpdateCastClockPosition()

	return
	--- END OF BLOCK #0 ---



end

slot5.AddVigilantBar = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot0._vigilantBar = slot0.Battle.BattleVigilantBar.New(slot1.transform)

	slot0._vigilantBar:ConfigVigilant(slot0._unitData:GetAntiSubState())
	slot0._vigilantBar:UpdateVigilantProgress()
	slot0:updateVigilantMark()

	return
	--- END OF BLOCK #0 ---



end

slot5.UpdateVigilantBarPosition = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0._vigilantBar:UpdateVigilantBarPosition(slot0._hpBarPos)

	return
	--- END OF BLOCK #0 ---



end

slot5.OnUpdateHP = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:_DealHPPop(slot1.Data)

	return
	--- END OF BLOCK #0 ---



end

slot5._DealHPPop = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._hpPopIndex_put == slot0._hpPopIndex_get and slot0._hpPopCount == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-14, warpins: 1 ---
		slot0:_PlayHPPop(slot1)

		slot0._hpPopCount = 1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-20, warpins: 2 ---
		if slot0._unitData:IsAlive() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-27, warpins: 1 ---
			slot0._hpPopCatch[slot0._hpPopIndex_put] = slot1
			slot0._hpPopIndex_put = slot0._hpPopIndex_put + 1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-31, warpins: 1 ---
			slot0:_PlayHPPop(slot1)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 32-32, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot5.UpdateHPPop = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	if slot0._hpPopIndex_put == slot0._hpPopIndex_get then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-15, warpins: 1 ---
		slot0._hpPopCount = slot0._hpPopCount + 1

		if slot0:_CalcHPPopCount() <= slot0._hpPopCount then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-30, warpins: 1 ---
			slot0:_PlayHPPop(slot0._hpPopCatch[slot0._hpPopIndex_get])

			slot0._hpPopCatch[slot0._hpPopIndex_get] = nil
			slot0._hpPopIndex_get = slot0._hpPopIndex_get + 1
			slot0._hpPopCount = 0
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-31, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot5._PlayHPPop = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot2 = slot1.dHP
	slot3 = slot1.isCri
	slot4 = slot1.isMiss
	slot5 = slot1.isHeal

	if not slot1.posOffset then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-9, warpins: 1 ---
		slot6 = Vector3.zero
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-28, warpins: 2 ---
	slot8 = slot0._popNumPool:GetPop(slot5, slot3, slot4, slot2, slot1.font)

	slot8:SetReferenceCharacter(slot0, slot6)
	slot8:Play()

	return
	--- END OF BLOCK #1 ---



end

slot5._CalcHPPopCount = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	if slot0._hpPopIndex_put - slot0._hpPopIndex_get > 5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-9, warpins: 1 ---
		return 1
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-11, warpins: 1 ---
		return 5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-12, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot5.onUpdateScore = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot3 = slot0._popNumPool:GetScorePop(slot2)

	slot3:SetReferenceCharacter(slot0, Vector3.zero)
	slot3:Play()

	return
	--- END OF BLOCK #0 ---



end

slot5.UpdateHpBar = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = slot0._unitData:GetCurrentHP()

	if slot0._HPProgress and slot0._cacheHP ~= slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-17, warpins: 1 ---
		slot0._HPProgress.fillAmount = slot0._unitData:GetHPRate()
		slot0._cacheHP = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-18, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

slot5.onChangeSize = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot0:doChangeSize(slot1)

	return
	--- END OF BLOCK #0 ---



end

slot5.updateSomkeFX = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot1 = slot0._unitData:GetHPRate()

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-68, warpins: 0 ---
	for slot5, slot6 in ipairs(slot0._smokeList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-11, warpins: 1 ---
		if slot1 < slot6.rate then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-14, warpins: 1 ---
			if slot6.active == false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-21, warpins: 1 ---
				slot6.active = true

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 22-45, warpins: 0 ---
				for slot11, slot12 in pairs(slot7) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 22-24, warpins: 1 ---
					if slot11.unInitialize then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 25-39, warpins: 1 ---
						slot13 = slot0:AddFX(slot11.resID)
						slot13.transform.localPosition = slot11.pos
						slot7[slot11] = slot13

						SetActive(slot13, true)

						slot11.unInitialize = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 40-43, warpins: 1 ---
						SetActive(slot12, true)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 44-45, warpins: 3 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 46-46, warpins: 1 ---
				--- END OF BLOCK #2 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 47-49, warpins: 1 ---
			if slot6.active == true then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 50-56, warpins: 1 ---
				slot6.active = false

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 57-66, warpins: 0 ---
				for slot11, slot12 in pairs(slot7) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 57-59, warpins: 1 ---
					if slot11.unInitialize then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 60-60, warpins: 1 ---
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 61-64, warpins: 1 ---
						SetActive(slot12, false)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 65-66, warpins: 3 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 67-68, warpins: 5 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 69-69, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot5.doChangeSize = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0._tf.localScale = slot0._tf.localScale * slot1.Data.size_ratio

	return
	--- END OF BLOCK #0 ---



end

slot5.InitEffectView = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0._effectOb = slot0.Battle.BattleEffectComponent.New(slot0)

	return
	--- END OF BLOCK #0 ---



end

slot5.UpdateAniEffect = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0._effectOb:Update(slot1)

	return
	--- END OF BLOCK #0 ---



end

slot5.UpdateTagEffect = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot2 = slot0._unitData:GetBoxSize().y * 0.5

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-26, warpins: 0 ---
	for slot6, slot7 in pairs(slot0._tagFXList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-24, warpins: 1 ---
		slot7:Update(slot1)
		slot7:SetPosition(slot0._referenceVector + Vector3(0, slot2, 0))
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-26, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-27, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot5.SetPopup = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._voiceTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-6, warpins: 1 ---
		if slot0._voiceKey == slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-9, warpins: 1 ---
			slot0._voiceKey = nil
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-10, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-13, warpins: 2 ---
	if slot0._popGO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-44, warpins: 1 ---
		LeanTween.cancel(slot0._popGO)
		LeanTween.scale(rtf(slot0._popGO.gameObject), Vector3.New(0, 0, 1), 0.1):setEase(LeanTweenType.easeInBack):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot0:chatPop(slot0, )

			return
			--- END OF BLOCK #0 ---



		end))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-64, warpins: 1 ---
		slot0._popGO = slot0._factory:MakePopup()
		slot0._popTF = slot0._popGO.transform
		slot0._popTF.localScale = Vector3(0, 0, 0)

		slot0:chatPop(slot1, slot2)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 65-70, warpins: 2 ---
	SetActive(slot0._popGO, true)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 71-71, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

slot5.chatPop = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot2 = 2.5
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-25, warpins: 2 ---
	findTF(slot0._popGO, "Text"):GetComponent(typeof(Text)).text = slot1:gsub("%s", " ")

	if CHAT_POP_STR_LEN < #findTF(slot0._popGO, "Text").GetComponent(typeof(Text)).text then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-29, warpins: 1 ---
		slot3.alignment = TextAnchor.MiddleLeft
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-32, warpins: 1 ---
		slot3.alignment = TextAnchor.MiddleCenter
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 33-60, warpins: 2 ---
	LeanTween.scale(rtf(slot0._popGO.gameObject), Vector3.New(1, 1, 1), 0.3):setEase(LeanTweenType.easeOutBack):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-32, warpins: 1 ---
		LeanTween.scale(rtf(slot0._popGO.gameObject), Vector3.New(0, 0, 1), 0.3):setEase(LeanTweenType.easeInBack):setDelay(LeanTween.scale(rtf(slot0._popGO.gameObject), Vector3.New(0, 0, 1), 0.3).setEase(LeanTweenType.easeInBack)):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			SetActive(slot0._popGO, false)

			return
			--- END OF BLOCK #0 ---



		end))

		return
		--- END OF BLOCK #0 ---



	end))

	return
	--- END OF BLOCK #2 ---



end

slot5.Voice = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0._voiceTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-12, warpins: 1 ---
	slot3 = nil
	slot0._voice, slot3 = playSoundEffect(slot1)

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-28, warpins: 1 ---
		slot0._voiceKey = slot2
		slot0._voiceTimer = pg.TimeMgr.GetInstance():AddBattleTimer("", 0, long2int(slot3.length) * 0.001, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			pg.TimeMgr.GetInstance():RemoveBattleTimer(slot0._voiceTimer)

			pg.TimeMgr.GetInstance().RemoveBattleTimer._voiceKey = nil
			pg.TimeMgr.GetInstance().RemoveBattleTimer._voiceTimer = nil

			return
			--- END OF BLOCK #0 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-30, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 31-31, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

slot5.SonarAcitve = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

slot5.SwitchShader = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-10, warpins: 1 ---
		slot2 = Color.New(1, 0, 0, 1)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-12, warpins: 2 ---
	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-19, warpins: 1 ---
		slot0._animator:ShiftShader(slot1, slot2)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-23, warpins: 1 ---
		slot0._animator:ClearOverrideMaterial()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-24, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot5.GetFactory = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._factory
	--- END OF BLOCK #0 ---



end

slot5.SetFactory = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot0._factory = slot1

	return
	--- END OF BLOCK #0 ---



end

return
