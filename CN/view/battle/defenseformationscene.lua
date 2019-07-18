slot0 = class("DefenseFormationScene", import("..base.BaseUI"))
slot0.RADIUS = 60
slot0.LONGPRESS_Y = 30
slot0.INTERVAL = math.pi / 2 / 6
slot0.MAX_FLEET_NUM = 6
slot0.MAX_SHIPP_NUM = 5
slot0.TOGGLE_DETAIL = "_detailToggle"
slot0.TOGGLE_FORMATION = "_formationToggle"
slot0.BUFF_TYEP = {
	blue = "blue",
	pink = "pink",
	cyan = "cyan"
}

slot0.getUIName = function (slot0)
	return "ExerciseFormationUI"
end

slot0.init = function (slot0)
	slot0.eventTriggers = {}
	slot0._blurLayer = slot0:findTF("blur_panel")
	slot0.backBtn = slot0:findTF("top/back_btn", slot0._blurLayer)
	slot0._bottomPanel = slot0:findTF("bottom", slot0._blurLayer)
	slot0._detailToggle = slot0:findTF("toggle_list/detail_toggle", slot0._bottomPanel)
	slot0._formationToggle = slot0:findTF("toggle_list/formation_toggle", slot0._bottomPanel)
	slot0._starTpl = slot0:findTF("star_tpl")
	slot0._heroInfoTpl = slot0:findTF("heroInfo")
	slot0._gridTFs = {
		vanguard = {},
		main = {}
	}
	slot0._gridFrame = slot0:findTF("GridFrame")

	for slot4 = 1, 3, 1 do
		slot0._gridTFs[Fleet.MAIN][slot4] = slot0._gridFrame:Find("main_" .. slot4)
		slot0._gridTFs[Fleet.VANGUARD][slot4] = slot0._gridFrame:Find("vanguard_" .. slot4)
	end

	slot0._heroContainer = slot0:findTF("HeroContainer")
	slot0._fleetInfo = slot0:findTF("fleet_info", slot0._blurLayer)
	slot0._fleetNameText = slot0:findTF("fleet_name/Text", slot0._fleetInfo)
	slot0._buffPanel = slot0:findTF("buff_list")
	slot0._buffGroup = slot0:findTF("buff_group", slot0._buffPanel)
	slot0._buffModel = slot0:getTpl("buff_model", slot0._buffPanel)
	slot0._propertyFrame = slot0:findTF("property_frame", slot0._blurLayer)
	slot0._cannonPower = slot0:findTF("cannon/Text", slot0._propertyFrame)
	slot0._torpedoPower = slot0:findTF("torpedo/Text", slot0._propertyFrame)
	slot0._AAPower = slot0:findTF("antiaircraft/Text", slot0._propertyFrame)
	slot0._airPower = slot0:findTF("air/Text", slot0._propertyFrame)
	slot0._cost = slot0:findTF("cost/Text", slot0._propertyFrame)
	slot0._mainGS = slot0:findTF("gear_score/main/Text")
	slot0._vanguardGS = slot0:findTF("gear_score/vanguard/Text")
	slot0._airDominanceFrame = slot0:findTF("ac", slot0._propertyFrame)

	if slot0._airDominanceFrame then
		setActive(slot0._airDominanceFrame, false)
	end

	slot0._attrFrame = slot0:findTF("attr_frame", slot0._blurLayer)
	slot0._cardTpl = slot0._tf:GetComponent(typeof(ItemList)).prefabItem[0]
	slot0._cards = {
		[Fleet.MAIN] = {},
		[Fleet.VANGUARD] = {}
	}

	setActive(slot0._attrFrame, false)
	setActive(slot0._cardTpl, false)
	setAnchoredPosition(slot0._bottomPanel, {
		y = -90
	})
end

slot0.setShips = function (slot0, slot1)
	slot0.shipVOs = slot1
end

slot0.SetFleet = function (slot0, slot1)
	slot0._currentFleetVO = slot1
end

slot0.UpdateFleetView = function (slot0, slot1)
	slot0:displayFleetInfo()
	slot0:resetGrid(Fleet.VANGUARD)
	slot0:resetGrid(Fleet.MAIN)
	slot0:resetFormationComponent()
	slot0:updateAttrFrame()

	if slot1 then
		slot0:loadAllCharacter()
	else
		slot0:setAllCharacterPos()
	end
end

slot0.SetFleetNameLabel = function (slot0)
	setText(slot0._fleetNameText, i18n("exercise_formation_title"))
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0.backBtn, function ()
		if slot0._currentDragDelegate then
			LuaHelper.triggerEndDrag(slot0._currentDragDelegate)
		end

		if slot0._attrFrame.gameObject.activeSelf then
			triggerToggle(slot0._formationToggle, true)
		else
			local function slot0()
				slot0:emit(slot1.ON_BACK)
			end

			slot0:emit(DefenseFormationMedator.COMMIT_FLEET, slot0)
		end
	end, SOUND_BACK)
	onToggle(slot0, slot0._detailToggle, function (slot0)
		if slot0._currentDragDelegate then
			LuaHelper.triggerEndDrag(slot0._currentDragDelegate)
		end

		if slot0 then
			slot0:displayAttrFrame()
		end
	end, SFX_PANEL)
	onToggle(slot0, slot0._formationToggle, function (slot0)
		if slot0._currentDragDelegate then
			LuaHelper.triggerEndDrag(slot0._currentDragDelegate)
		end

		if slot0 then
			slot0:hideAttrFrame()
		end
	end, SFX_PANEL)
	onButton(slot0, slot0._attrFrame, function ()
		triggerToggle(slot0._formationToggle, true)
	end, SFX_PANEL)
	slot0:UpdateFleetView(true)

	if slot0.contextData.toggle ~= nil then
		triggerToggle(slot0[slot0.contextData.toggle], true)
	end

	shiftPanel(slot0._bottomPanel, nil, 0, nil, 0.5, true, true)
	PoolMgr.GetInstance():GetUI("al_bg01", true, function (slot0)
		slot0:SetActive(true)
		setParent(slot0, slot0._tf)
		slot0.transform:SetAsFirstSibling()
	end)
end

slot0.loadAllCharacter = function (slot0)
	removeAllChildren(slot0._heroContainer)

	slot0._characterList = {
		vanguard = {},
		main = {}
	}

	function slot1(slot0, slot1, slot2, slot3)
		if slot0.exited then
			return
		end

		slot5 = tf(Instantiate(slot0._heroInfoTpl))
		slot5.name = slot0.name

		slot5:SetParent(slot0._heroContainer, false)
		SetActive(slot5, true)

		slot6 = slot0.shipVOs[slot1].getConfigTable(slot4)
		slot7 = pg.ship_data_template[slot0.shipVOs[slot1].configId]
		slot9 = findTF(slot8, "stars")

		for slot14 = 1, slot0.shipVOs[slot1].getStar(slot4), 1 do
			cloneTplTo(slot0._starTpl, slot9)
		end

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot4:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot4.configId)
		end

		setImageSprite(findTF(slot8, "type"), slot11, true)
		setText(findTF(slot8, "frame/lv_contain/lv"), slot4.level)

		slot12 = tf(slot0)

		slot12:SetParent(slot5, false)

		slot0.name = "model"
		slot0:GetComponent("SkeletonGraphic").raycastTarget = false
		slot12.localScale = Vector3(0.8, 0.8, 1)

		pg.ViewUtils.SetLayer(slot12, Layer.UI)
		slot8:SetSiblingIndex(2)

		slot0._characterList[slot2][slot3] = slot5
		slot14 = GameObject("mouseChild")

		tf(slot14):SetParent(tf(slot0))

		tf(slot14).localPosition = Vector3.zero
		slot15 = GetOrAddComponent(slot14, "ModelDrag")
		slot16 = GetOrAddComponent(slot14, "UILongPressTrigger")
		slot17 = GetOrAddComponent(slot14, "EventTriggerListener")
		slot0.eventTriggers[slot17] = true

		slot15:Init()

		slot18 = slot14:GetComponent(typeof(RectTransform))
		slot18.sizeDelta = Vector2(3, 3)
		slot18.pivot = Vector2(0.5, 0)
		slot18.anchoredPosition = Vector2(0, 0)

		pg.DelegateInfo.Add(slot0, slot16.onLongPressed)

		slot16.longPressThreshold = 1

		slot16.onLongPressed:RemoveAllListeners()
		slot16.onLongPressed:AddListener(function ()
			slot0:emit(DefenseFormationMedator.OPEN_SHIP_INFO, slot1.id, slot0._currentFleetVO, slot2.TOGGLE_FORMATION)
			playSoundEffect(SFX_PANEL)
		end)

		slot19, slot20, slot21, slot22, slot23 = nil

		pg.DelegateInfo.Add(slot0, slot15.onModelClick)
		slot15.onModelClick:AddListener(function ()
			slot0:emit(DefenseFormationMedator.CHANGE_FLEET_SHIP, slot0, )
			playSoundEffect(SFX_PANEL)
		end)
		slot17:AddBeginDragFunc(function ()
			setButtonEnabled(slot0.backBtn, false)
			setToggleEnabled(slot0._detailToggle, false)

			setToggleEnabled._currentDragDelegate = slot0._detailToggle
			slot2 = rtf(slot0._tf).rect.width / UnityEngine.Screen.width
			slot3 = rtf(slot0._tf).rect.height / UnityEngine.Screen.height
			slot4 = rtf(slot0._heroContainer).rect.width / 2
			slot5 = rtf(slot0._heroContainer).rect.height / 2

			LeanTween.cancel(slot6)
			slot7:SetAsLastSibling()
			slot7.SetAsLastSibling:switchToShiftMode(slot7, slot8)
			SetAction(go(slot6), "tuozhuai")
			SetActive(slot9, false)
		end)
		slot17:AddDragFunc(function (slot0, slot1)
			slot0.localPosition = Vector3(slot1.position.x * slot1 - slot2, slot1.position.y * slot3 - slot4, -22)
		end)
		slot17:AddDragEndFunc(function (slot0, slot1)
			setButtonEnabled(slot0.backBtn, true)
			setToggleEnabled(slot0._detailToggle, true)

			slot0._currentDragDelegate = nil

			SetAction(slot1, "stand")
			SetActive(SetActive, true)

			function slot2()
				slot0:switchToDisplayMode()
				slot0.switchToDisplayMode:sortSiblingIndex()
				slot0.switchToDisplayMode.sortSiblingIndex:emit(DefenseFormationMedator.CHANGE_FLEET_SHIPS_ORDER, slot0._currentFleetVO)
			end

			function slot3()
				for slot3, slot4 in ipairs(ipairs) do
					if slot4 == slot1 then
						Object.Destroy(slot2.gameObject)
						PoolMgr.GetInstance():ReturnSpineChar(slot3:getPrefab(), slot4)
						table.remove(slot0, slot3)

						break
					end
				end

				slot5:switchToDisplayMode()
				slot5:sortSiblingIndex()
				slot5:emit(DefenseFormationMedator.REMOVE_SHIP, slot3, slot5._currentFleetVO)
			end

			slot4, slot5 = slot0._currentFleetVO:getShipPos(slot0._currentFleetVO)

			if slot1.position.x < UnityEngine.Screen.width * 0.15 or slot1.position.x > UnityEngine.Screen.width * 0.87 or slot1.position.y < UnityEngine.Screen.height * 0.18 or slot1.position.y > UnityEngine.Screen.height * 0.7 then
				if not slot0._currentFleetVO:canRemove(slot5) then
					pg.TipsMgr:GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", slot5:getName(), "", Fleet.C_TEAM_NAME[slot5]))
					slot2()
				elseif (table.getCount(slot0._currentFleetVO.mainShips) == 1 and slot5 == Fleet.MAIN) or (table.getCount(slot0._currentFleetVO.vanguardShips) == 1 and slot5 == Fleet.VANGUARD) then
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						content = i18n("exercise_clear_fleet_tip"),
						onYes = slot3,
						onNo = slot2
					})
				else
					pg.MsgboxMgr.GetInstance():ShowMsgBox({
						hideNo = false,
						zIndex = -30,
						content = i18n("ship_formationUI_quest_remove", slot5:getName()),
						onYes = slot3,
						onNo = slot2
					})
				end
			else
				slot2()
			end
		end)
		slot0:setCharacterPos(slot2, slot3, slot5)
	end

	local function slot3(slot0, slot1)
		for slot5, slot6 in ipairs(slot0) do
			slot7 = slot0.shipVOs[slot6]:getPrefab()

			table.insert(slot1, function (slot0)
				PoolMgr.GetInstance():GetSpineChar(slot0, true, function (slot0)
					slot0(slot0, slot0, , )
					slot0()
				end)
			end)
		end
	end

	slot3(slot0._currentFleetVO.vanguardShips, Fleet.VANGUARD)
	slot3(slot0._currentFleetVO.mainShips, Fleet.MAIN)
	pg.UIMgr:GetInstance():LoadingOn()
	parallelAsync({}, function (slot0)
		pg.UIMgr:GetInstance():LoadingOff()

		if slot0.exited then
			return
		end

		slot0:sortSiblingIndex()
	end)
end

slot0.setAllCharacterPos = function (slot0)
	for slot4, slot5 in ipairs(slot0._characterList.vanguard) do
		slot0:setCharacterPos(Fleet.VANGUARD, slot4, slot5)
	end

	for slot4, slot5 in ipairs(slot0._characterList.main) do
		slot0:setCharacterPos(Fleet.MAIN, slot4, slot5)
	end
end

slot0.setCharacterPos = function (slot0, slot1, slot2, slot3)
	slot4 = findTF(slot3, "model")

	SetActive(slot4, true)
	LeanTween.cancel(go(slot4))

	slot3.localPosition = Vector3(slot0._gridTFs[slot1][slot2].localPosition.x, slot0._gridTFs[slot1][slot2].localPosition.y, -15 + slot0._gridTFs[slot1][slot2].localPosition.z + slot2)
	slot4.localPosition = Vector3(0, 20, 0)

	LeanTween.moveY(slot4, 0, 0.5):setDelay(0.5)
	SetActive(slot0._gridTFs[slot1][slot2].Find(slot5, "shadow"), true)
	SetAction(slot4, "stand")
end

slot0.resetGrid = function (slot0, slot1)
	slot2 = slot0._currentFleetVO:getTeamByName(slot1)

	for slot7, slot8 in ipairs(slot3) do
		SetActive(slot8:Find("shadow"), false)
		SetActive(slot8:Find("tip"), false)
	end

	if slot1 == Fleet.MAIN and #slot0._currentFleetVO:getTeamByName(Fleet.VANGUARD) == 0 then
		return
	end

	if #slot2 < 3 then
		slot6 = slot3[slot4 + 1].Find(slot5, "tip")
		slot6:GetComponent("Button").enabled = true

		onButton(slot0, slot6, function ()
			slot0:emit(DefenseFormationMedator.CHANGE_FLEET_SHIP, nil, slot0)
		end, SFX_PANEL)

		slot6.localScale = Vector3(0, 0, 1)

		SetActive(slot6, true)
		LeanTween.value(go(slot6), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
			slot0.localScale = Vector3(slot0, slot0, 1)
		end)):setEase(LeanTweenType.easeOutBack)
	end
end

slot0.resetFormationComponent = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	removeAllChildren(slot0._buffGroup)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-41, warpins: 0 ---
	for slot5, slot6 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-39, warpins: 1 ---
		slot7 = cloneTplTo(slot0._buffModel, slot0._buffGroup)

		tf(slot7):SetAsFirstSibling()
		SetActive(slot7:Find("dot_list/" .. slot6.type), true)

		slot7:Find("buff_describe"):GetComponent(typeof(Text)).text = slot6.describe
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 40-41, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 42-58, warpins: 1 ---
	SetActive(slot0._gridTFs.main[1]:Find("flag"), #slot0._currentFleetVO:getTeamByName(Fleet.MAIN) ~= 0)

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 62-63, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

slot0.switchToShiftMode = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-39, warpins: 0 ---
	for slot6 = 1, 3, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-39, warpins: 2 ---
		setActive(slot0._gridTFs[Fleet.VANGUARD][slot6].Find(slot7, "tip"), false)
		setActive(slot0._gridTFs[Fleet.MAIN][slot6].Find(slot8, "tip"), false)
		setActive(slot0._gridTFs[slot2][slot6]:Find("shadow"), false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 40-45, warpins: 1 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 46-103, warpins: 0 ---
	for slot7, slot8 in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-51, warpins: 1 ---
		slot9 = findTF(slot8, "model")

		if slot8 ~= slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-80, warpins: 1 ---
			LeanTween.moveY(rtf(slot9), slot9.localPosition.y + 20, 0.5)

			slot10 = tf(slot9):Find("mouseChild"):GetComponent("EventTriggerListener")
			slot0.eventTriggers[slot10] = true

			slot10:AddPointEnterFunc(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-4, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 5-18, warpins: 0 ---
				for slot3, slot4 in ipairs(ipairs) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 5-7, warpins: 1 ---
					if slot4 == slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 8-16, warpins: 1 ---
						slot2:shift(slot2._shiftIndex, slot3, slot3)

						--- END OF BLOCK #0 ---

						FLOW; TARGET BLOCK #1



						-- Decompilation error in this vicinity:
						--- BLOCK #1 17-17, warpins: 1 ---
						break
						--- END OF BLOCK #1 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 17-18, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 19-19, warpins: 2 ---
				return
				--- END OF BLOCK #2 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 81-96, warpins: 1 ---
			slot0._shiftIndex = slot7
			tf(slot9):Find("mouseChild"):GetComponent(typeof(Image)).enabled = false
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 97-101, warpins: 2 ---
		SetAction(slot9, "normal")
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 102-103, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 104-105, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.switchToDisplayMode = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	local function slot1(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-44, warpins: 0 ---
		for slot4, slot5 in ipairs(slot0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-17, warpins: 1 ---
			if tf(slot6):Find("mouseChild") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-27, warpins: 1 ---
				slot0.eventTriggers[slot7:GetComponent("EventTriggerListener")] = true

				if slot7.GetComponent("EventTriggerListener") then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 28-30, warpins: 1 ---
					slot8:RemovePointEnterFunc()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 31-34, warpins: 2 ---
				if slot4 == slot0._shiftIndex then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 35-42, warpins: 1 ---
					slot7:GetComponent(typeof(Image)).enabled = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 43-44, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 45-45, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end

	slot1(slot0._characterList[Fleet.VANGUARD])
	slot1(slot0._characterList[Fleet.MAIN])

	slot0._shiftIndex = nil

	return
	--- END OF BLOCK #0 ---



end

slot0.shift = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-45, warpins: 1 ---
	slot6 = slot0._currentFleetVO:getTeamByName(slot3)
	slot0._characterList[slot3][slot2].localPosition = Vector3(slot0._gridTFs[slot3][slot1].localPosition.x, slot0._gridTFs[slot3][slot1].localPosition.y + 20, -15 + slot0._gridTFs[slot3][slot1].localPosition.z + slot1)

	LeanTween.cancel(go(slot8))

	slot0._characterList[slot3][slot2] = slot0._characterList[slot3][slot1]
	slot0._characterList[slot3][slot1] = slot0._characterList[slot3][slot2]
	slot6[slot2] = slot6[slot1]
	slot6[slot1] = slot6[slot2]

	if #slot0._cards[slot3] > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-49, warpins: 1 ---
		slot11[slot2] = slot11[slot1]
		slot11[slot1] = slot11[slot2]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 50-51, warpins: 2 ---
	slot0._shiftIndex = slot2

	return
	--- END OF BLOCK #1 ---



end

slot0.sortSiblingIndex = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = 0

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-23, warpins: 0 ---
	for slot6, slot7 in ipairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-13, warpins: 1 ---
		if slot0._characterList[Fleet.MAIN][slot7] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-21, warpins: 1 ---
			tf(slot8):SetSiblingIndex(slot1)

			slot1 = slot1 + 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 22-23, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 24-24, warpins: 1 ---
	slot3 = 3

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 25-27, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 28-46, warpins: 0 ---
	while slot3 > 0 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-28, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-35, warpins: 1 ---
		if slot0._characterList[Fleet.VANGUARD][slot3] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 36-43, warpins: 1 ---
			tf(slot4):SetSiblingIndex(slot1)

			slot1 = slot1 + 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 44-45, warpins: 2 ---
		slot3 = slot3 - 1
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 46-46, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 46-57, warpins: 1 ---
	slot5 = slot0._cards[Fleet.VANGUARD]

	if #slot0._cards[Fleet.MAIN] > 0 or #slot5 > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 62-65, warpins: 2 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 66-72, warpins: 0 ---
		for slot9 = 1, #slot4, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 66-72, warpins: 2 ---
			slot4[slot9].tr:SetSiblingIndex(slot9)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 73-76, warpins: 1 ---
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 77-83, warpins: 0 ---
		for slot9 = 1, #slot5, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 77-83, warpins: 2 ---
			slot5[slot9].tr:SetSiblingIndex(slot9)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 84-84, warpins: 2 ---
	return
	--- END OF BLOCK #6 ---



end

slot0.displayFleetInfo = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-59, warpins: 1 ---
	slot1 = slot0._currentFleetVO:GetPropertiesSum()

	slot0.tweenNumText(slot0._cannonPower, slot1.cannon)
	slot0.tweenNumText(slot0._torpedoPower, slot1.torpedo)
	slot0.tweenNumText(slot0._AAPower, slot1.antiAir)
	slot0.tweenNumText(slot0._airPower, slot1.air)
	slot0.tweenNumText(slot0._cost, slot0._currentFleetVO:GetCostSum().oil)
	slot0.tweenNumText(slot0._vanguardGS, slot2)
	slot0.tweenNumText(slot0._mainGS, slot3)
	setActive(slot0:findTF("gear_score"), true)
	slot0:SetFleetNameLabel()

	return
	--- END OF BLOCK #0 ---



end

slot0.hideAttrFrame = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	SetActive(slot0._attrFrame, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0._blurLayer, slot0._tf)

	return
	--- END OF BLOCK #0 ---



end

slot0.displayAttrFrame = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	pg.UIMgr.GetInstance():BlurPanel(slot0._blurLayer, false)
	SetActive(slot0._attrFrame, true)
	slot0:initAttrFrame()

	return
	--- END OF BLOCK #0 ---



end

slot0.initAttrFrame = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	slot1 = {
		[Fleet.MAIN] = "main",
		[Fleet.VANGUARD] = "vanguard"
	}
	slot3 = false

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 26-58, warpins: 0 ---
	for slot7, slot8 in pairs(slot2) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-30, warpins: 1 ---
		if #slot0._cards[slot7] == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-41, warpins: 1 ---
			slot10 = slot0:findTF(slot1[slot7] .. "/list", slot0._attrFrame)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 42-55, warpins: 0 ---
			for slot14 = 1, 3, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-55, warpins: 2 ---
				table.insert(slot9, FormationCard.New(cloneTplTo(slot0._cardTpl, slot10).gameObject))
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 56-56, warpins: 1 ---
			slot3 = true
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 57-58, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 59-60, warpins: 1 ---
	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-63, warpins: 1 ---
		slot0:updateAttrFrame()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 64-64, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.updateAttrFrame = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-58, warpins: 0 ---
	for slot5, slot6 in pairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-21, warpins: 1 ---
		if #slot0._cards[slot5] > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-25, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 26-56, warpins: 0 ---
			for slot11 = 1, 3, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 26-28, warpins: 2 ---
				if slot11 <= #slot6 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 29-45, warpins: 1 ---
					slot7[slot11]:update(slot12)
					slot7[slot11]:updateProps(slot0:getCardAttrProps(slot0.shipVOs[slot6[slot11]]))
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 46-50, warpins: 1 ---
					slot7[slot11]:update(nil)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 51-56, warpins: 2 ---
				slot0:attachOnCardButton(slot7[slot11], slot5)
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 57-58, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 59-71, warpins: 1 ---
	slot0:updateUltimateTitle()
	setActive(slot0:findTF(Fleet.SUBMARINE, slot0._attrFrame), false)

	return
	--- END OF BLOCK #2 ---



end

slot0.updateUltimateTitle = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if #slot0._cards[Fleet.MAIN] > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-12, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-22, warpins: 0 ---
		for slot5 = 1, #slot1, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-17, warpins: 2 ---
			setActive(slot1[slot5].shipState, slot5 == 1)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 21-22, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-30, warpins: 2 ---
	if #slot0._cards[Fleet.VANGUARD] > 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-34, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 35-40, warpins: 0 ---
		for slot6 = 1, #slot2, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-40, warpins: 2 ---
			setActive(slot2[slot6].shipState, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-41, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.getCardAttrProps = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-53, warpins: 1 ---
	return {
		{
			i18n("word_attr_durability"),
			tostring(math.floor(slot1:getProperties().durability))
		},
		{
			i18n("word_attr_luck"),
			"" .. tostring(math.floor(slot1:getBattleTotalExpend()))
		},
		{
			i18n("word_synthesize_power"),
			"<color=#ffff00>" .. math.floor(slot3) .. "</color>"
		}
	}
	--- END OF BLOCK #0 ---



end

slot0.attachOnCardButton = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	slot3 = GetOrAddComponent(slot1.go, "EventTriggerListener")
	slot0.eventTriggers[slot3] = true

	slot3:RemovePointDownFunc()
	slot3:RemovePointUpFunc()
	slot3:RemoveBeginDragFunc()
	slot3:RemoveDragFunc()
	slot3:RemoveDragEndFunc()

	slot4 = Vector2.zero

	slot3:AddPointDownFunc(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0 = slot1.position

		return
		--- END OF BLOCK #0 ---



	end)
	slot3:AddPointUpFunc(function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		if slot0 == slot0.go and Vector2.Magnitude(slot1 - slot1.position) < 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			if slot0.shipVO then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-31, warpins: 1 ---
				slot2:emit(DefenseFormationMedator.OPEN_SHIP_INFO, slot0.shipVO.id, slot2._currentFleetVO, slot3.TOGGLE_DETAIL)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 32-40, warpins: 1 ---
				slot2:emit(DefenseFormationMedator.CHANGE_FLEET_SHIP, slot0.shipVO, )
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-43, warpins: 2 ---
			playSoundEffect(SFX_PANEL)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 44-47, warpins: 3 ---
		slot1 = Vector2.zero

		return
		--- END OF BLOCK #1 ---



	end)

	if slot1.shipVO then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-77, warpins: 1 ---
		slot5 = slot0._cards[slot2]
		slot6 = slot1.tr.parent:GetComponent("ContentSizeFitter")
		slot7 = slot1.tr.parent:GetComponent("HorizontalLayoutGroup")
		slot8 = slot1.tr.rect.width * 0.5
		slot9 = nil
		slot10 = 0
		slot11 = {}

		function slot13()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-12, warpins: 0 ---
			for slot3 = 1, #slot0, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-12, warpins: 2 ---
				slot0[slot3].tr.anchoredPosition = slot1[slot3]
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 13-13, warpins: 1 ---
			return
			--- END OF BLOCK #2 ---



		end

		slot14 = Timer.New(slot12, 0.03333333333333333, -1)

		slot3:AddBeginDragFunc(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			if slot0.carddrag then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 6-29, warpins: 2 ---
			slot0._currentDragDelegate = slot1
			slot0.carddrag = slot2
			slot3.enabled = false
			slot4.enabled = false

			slot2.tr:SetSiblingIndex(#slot5)

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 30-43, warpins: 0 ---
			for slot3 = 1, #slot5, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-34, warpins: 2 ---
				if slot5[slot3] == slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 35-36, warpins: 1 ---
					slot0._shiftIndex = slot3
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 37-43, warpins: 2 ---
				slot6[slot3] = slot5[slot3].tr.anchoredPosition
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 44-59, warpins: 1 ---
			slot7:Start()
			LeanTween.scale(slot2.paintingTr, Vector3(1.1, 1.1, 0), 0.3)

			return
			--- END OF BLOCK #3 ---



		end)
		slot3:AddDragFunc(function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			if slot0.carddrag ~= slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-6, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 7-27, warpins: 2 ---
			slot1.tr.localPosition.x = slot0:change2ScrPos(slot1.tr.parent, slot1.position).x
			slot1.tr.localPosition = slot1.tr.localPosition

			if Time.realtimeSinceStartup < slot1.tr.localPosition then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 28-29, warpins: 1 ---
				slot3 = slot1

				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 30-35, warpins: 2 ---
			slot3 = 1

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 36-68, warpins: 0 ---
			for slot7 = 1, #slot4, 1 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 36-40, warpins: 2 ---
				if slot4[slot7] ~= slot1 and slot4[slot7].shipVO and slot1.tr.localPosition.x > slot4[slot7].tr.localPosition.x + ((slot3 < slot0._shiftIndex and 1.1) or -1.1) * slot5 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 67-67, warpins: 1 ---
					slot3 = slot3 + 1
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 68-68, warpins: 4 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #3 ---

			FLOW; TARGET BLOCK #4



			-- Decompilation error in this vicinity:
			--- BLOCK #4 69-72, warpins: 1 ---
			if slot0._shiftIndex ~= slot3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 73-84, warpins: 1 ---
				slot0:shift(slot0._shiftIndex, slot3, )

				slot2 = Time.realtimeSinceStartup + 0.15
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #4 ---

			FLOW; TARGET BLOCK #5



			-- Decompilation error in this vicinity:
			--- BLOCK #5 85-85, warpins: 2 ---
			return
			--- END OF BLOCK #5 ---



		end)
		slot3:AddDragEndFunc(function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-5, warpins: 1 ---
			if slot0.carddrag ~= slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 6-6, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 7-66, warpins: 1 ---
			slot0._currentDragDelegate = nil
			slot0.enabled = false

			LeanTween.value(slot1.go, slot1.tr.anchoredPosition.x, slot3[slot0._shiftIndex].x, math.min(math.abs(slot1.tr.anchoredPosition.x - slot3[slot0._shiftIndex].x) / 200, 1) * 0.3):setEase(LeanTweenType.easeOutCubic):setOnUpdate(System.Action_float(function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0.tr.anchoredPosition.x = slot0
				slot0.tr.anchoredPosition = slot0.tr.anchoredPosition

				return
				--- END OF BLOCK #0 ---



			end)):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-49, warpins: 1 ---
				slot0()

				slot1.enabled = true
				slot2.enabled = true
				slot3._shiftIndex = nil

				slot4:Stop()
				slot3:updateUltimateTitle()
				slot3:sortSiblingIndex()
				slot3:emit(DefenseFormationMedator.CHANGE_FLEET_SHIPS_ORDER, slot3._currentFleetVO)
				LeanTween.scale(slot5.paintingTr, Vector3(1, 1, 0), 0.3)

				slot6.enabled = true
				0.3.carddrag = nil

				return
				--- END OF BLOCK #0 ---



			end))

			return
			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 67-67, warpins: 2 ---
			--- END OF BLOCK #2 ---



		end)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 78-79, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.change2ScrPos = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	return LuaHelper.ScreenToLocal(slot1, slot2, GameObject.Find("OverlayCamera"):GetComponent("Camera"))
	--- END OF BLOCK #0 ---



end

slot0.tweenNumText = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot3 = LeanTween.value
	slot4 = go(slot0)
	slot5 = 0
	slot6 = math.floor(slot1)
	slot7 = slot2 or 0.7

	LeanTween.value(slot4, slot5, slot6, slot7):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		setText(slot0, math.floor(slot0))

		return
		--- END OF BLOCK #0 ---



	end))

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-13, warpins: 1 ---
	slot7 = 0.7
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-23, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

slot0.GetFleetCount = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return 1
	--- END OF BLOCK #0 ---



end

slot0.recycleCharacterList = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-30, warpins: 0 ---
	for slot6, slot7 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		if slot2[slot6] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-13, warpins: 1 ---
			if findTF(slot2[slot6], "model") then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-26, warpins: 1 ---
				PoolMgr.GetInstance():ReturnSpineChar(slot0.shipVOs[slot7]:getPrefab(), slot8.gameObject)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 27-28, warpins: 2 ---
			slot2[slot6] = nil
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 29-30, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 31-31, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.recyclePainting = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-15, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._cards) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 9-13, warpins: 0 ---
		for slot9, slot10 in ipairs(slot5) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot10:clear()
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-13, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-15, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-16, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.willExit = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.eventTriggers then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-12, warpins: 0 ---
		for slot4, slot5 in pairs(slot0.eventTriggers) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-10, warpins: 1 ---
			ClearEventTrigger(slot4)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-12, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 13-14, warpins: 1 ---
		slot0.eventTriggers = nil
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 15-19, warpins: 2 ---
	if slot0._attrFrame.gameObject.activeSelf then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-28, warpins: 1 ---
		pg.UIMgr.GetInstance():UnblurPanel(slot0._blurLayer, slot0._tf)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-72, warpins: 2 ---
	pg.TimeMgr:GetInstance():RemoveTimer(slot0.ActiveToggletimer1)

	slot0.ActiveToggletimer1 = nil

	pg.TimeMgr:GetInstance():RemoveTimer(slot0.ActiveToggletimer)

	slot0.ActiveToggletimer = nil

	slot0:recycleCharacterList(slot0._currentFleetVO.mainShips, slot0._characterList[Fleet.MAIN])
	slot0:recycleCharacterList(slot0._currentFleetVO.vanguardShips, slot0._characterList[Fleet.VANGUARD])
	slot0:recyclePainting()

	return
	--- END OF BLOCK #2 ---



end

return slot0
