slot0 = class("PreCombatLayer", import("..base.BaseUI"))
slot1 = import("..ship.FormationUI")
slot0.FORM_EDIT = "EDIT"
slot0.FORM_PREVIEW = "PREVIEW"
slot0.ObjectiveList = {
	"battle_preCombatLayer_victory",
	"battle_preCombatLayer_undefeated",
	"battle_preCombatLayer_sink_limit",
	"battle_preCombatLayer_time_hold",
	"battle_preCombatLayer_time_limit",
	"battle_preCombatLayer_boss_destruct",
	"battle_preCombatLayer_damage_before_end",
	"battle_result_defeat_all_enemys"
}

slot0.getUIName = function (slot0)
	return "PreCombatUI"
end

slot0.init = function (slot0)
	slot0.eventTriggers = {}
	slot0._startBtn = slot0:findTF("right/start")
	slot0._popup = slot0:findTF("right/start/popup")
	slot0._costText = slot0:findTF("right/start/popup/Text")
	slot0._moveLayer = slot0:findTF("moveLayer")
	slot1 = slot0:findTF("middle")
	slot0._autoToggle = slot0:findTF("auto_toggle")
	slot0._fleetInfo = slot1:Find("fleet_info")
	slot0._fleetNameText = slot1:Find("fleet_info/fleet_name/Text")
	slot0._fleetNumText = slot1:Find("fleet_info/fleet_number")

	setActive(slot0._fleetInfo, slot0.contextData.system ~= SYSTEM_DUEL)

	slot0._mainGS = slot1:Find("gear_score/main/Text")
	slot0._vanguardGS = slot1:Find("gear_score/vanguard/Text")
	slot0._gridTFs = {
		vanguard = {},
		main = {}
	}
	slot0._gridFrame = slot1:Find("mask/GridFrame")

	for slot5 = 1, 3, 1 do
		slot0._gridTFs[Fleet.VANGUARD][slot5] = slot0._gridFrame:Find("vanguard_" .. slot5)
		slot0._gridTFs[Fleet.MAIN][slot5] = slot0._gridFrame:Find("main_" .. slot5)
	end

	slot0._nextPage = slot0:findTF("middle/nextPage")
	slot0._prevPage = slot0:findTF("middle/prevPage")
	slot0._heroContainer = slot1:Find("HeroContainer")
	slot0._checkBtn = slot1:Find("checkBtn")
	slot0._blurPanel = slot0:findTF("blur_panel")
	slot0.topPanel = slot0:findTF("top", slot0._blurPanel)
	slot0.topPanelBg = slot0:findTF("top_bg", slot0._blurPanel)
	slot0._backBtn = slot0:findTF("back_btn", slot0.topPanel)
	slot0._playerResOb = slot0:findTF("playerRes", slot0.topPanel)
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0._spoilsContainer = slot0:findTF("right/infomation/atlasloot/spoils/items/items_container")
	slot0._item = slot0:getTpl("right/infomation/atlasloot/spoils/items/item_tpl")
	slot0._goals = slot0:findTF("right/infomation/target/goal")
	slot0._heroInfo = slot0:getTpl("heroInfo")
	slot0._starTpl = slot0:getTpl("star_tpl")
	slot0._middle = slot0:findTF("middle")
	slot0._right = slot0:findTF("right")

	setAnchoredPosition(slot0._middle, {
		x = -840
	})
	setAnchoredPosition(slot0._right, {
		x = 470
	})

	slot0.guideDesc = slot0:findTF("guideDesc", slot0._middle)

	if slot0.contextData.stageId then
		slot0:SetStageID(slot0.contextData.stageId)
	end

	slot0._attachmentList = {}
end

slot0.SetPlayerInfo = function (slot0, slot1)
	slot0._resPanel:setResources(slot1)
end

slot0.SetShips = function (slot0, slot1)
	slot0._shipVOs = slot1
end

slot0.SetStageID = function (slot0, slot1)
	removeAllChildren(slot0._spoilsContainer)

	slot0._stageID = slot1

	for slot7, slot8 in ipairs(slot3) do
		updateDrop(cloneTplTo(slot0._item, slot0._spoilsContainer), {
			id = slot8[2],
			type = slot8[1]
		})
	end

	function slot4(slot0, slot1)
		if type(slot0) == "table" then
			setActive(slot1, true)
			setWidgetText(slot1, i18n(slot0.ObjectiveList[slot0[1]], slot0[2]))
		else
			setActive(slot1, false)
		end
	end

	slot5 = {
		findTF(slot0._goals, "goal_tpl"),
		findTF(slot0._goals, "goal_sink"),
		findTF(slot0._goals, "goal_time")
	}
	slot7 = 1

	for slot11, slot12 in ipairs(slot6) do
		if type(slot12) ~= "string" then
			slot4(slot12, slot5[slot7])

			slot7 = slot7 + 1
		end
	end

	for slot11 = slot7, #slot5, 1 do
		slot4("", slot5[slot11])
	end

	setActive(slot0.guideDesc, slot2.guide_desc and #slot2.guide_desc > 0)

	if slot2.guide_desc and #slot2.guide_desc > 0 then
		setText(slot0.guideDesc, slot2.guide_desc)
	end
end

slot0.SetFleets = function (slot0, slot1)
	slot0._fleetVOs = {}

	_.each(slot2, function (slot0)
		slot0._fleetVOs[slot0.id] = slot0
	end)
	slot0:CheckLegalFleet()
end

slot0.SetCurrentFleet = function (slot0, slot1)
	slot0._currentFleetVO = slot0._fleetVOs[slot1]

	slot0:CheckLegalFleet()

	for slot5, slot6 in ipairs(slot0._legalFleetIdList) do
		if slot0._currentFleetVO.id == slot6 then
			slot0._curFleetIndex = slot5

			break
		end
	end
end

slot0.CheckLegalFleet = function (slot0)
	slot0._legalFleetIdList = {}

	for slot4, slot5 in pairs(slot0._fleetVOs) do
		if #slot5.ships > 0 and slot5.id ~= FleetProxy.PVP_FLEET_ID then
			table.insert(slot0._legalFleetIdList, slot5.id)
		end
	end

	table.sort(slot0._legalFleetIdList)
end

slot0.MarkEdited = function (slot0)
	slot0._editedFlag = true
end

slot0.UpdateFleetView = function (slot0, slot1)
	slot0:displayFleetInfo()
	slot0:resetGrid(Fleet.VANGUARD)
	slot0:resetGrid(Fleet.MAIN)
	SetActive(slot0._gridTFs[TeamType.Main][1]:Find("flag"), true)

	if slot1 then
		slot0:loadAllCharacter()
	else
		slot0:setAllCharacterPos(true)
	end
end

slot0.uiStartAnimating = function (slot0)
	shiftPanel(slot0._middle, 0, nil, slot2, slot1, true, true)
	shiftPanel(slot0._right, 0, nil, 0.3, 0, true, true)
end

slot0.uiExitAnimating = function (slot0)
	shiftPanel(slot0._middle, -840, nil, nil, nil, true, true)
	shiftPanel(slot0._right, 470, nil, nil, nil, true, true)
end

slot0.didEnter = function (slot0)
	onButton(slot0, slot0._backBtn, function ()
		if slot0._currentForm == slot1.FORM_EDIT and slot0._editedFlag then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = false,
				zIndex = -100,
				content = i18n("battle_preCombatLayer_save_confirm"),
				onYes = function ()
					local function slot0()
						pg.TipsMgr:GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))

						GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

						slot0:uiExitAnimating()
						LeanTween.delayedCall(0.3, System.Action(function ()
							slot0:emit(slot1.ON_CLOSE)
						end))
					end

					slot0:emit(PreCombatMediator.ON_COMMIT_EDIT, slot0)
				end,
				onNo = function ()
					slot0:emit(PreCombatMediator.ON_ABORT_EDIT)

					GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

					slot0:uiExitAnimating()
					LeanTween.delayedCall(0.3, System.Action(function ()
						slot0:emit(slot1.ON_CLOSE)
					end))
				end
			})
		else
			GetOrAddComponent(slot0._tf, typeof(CanvasGroup)).interactable = false

			slot0:uiExitAnimating()
			LeanTween.delayedCall(0.3, System.Action(function ()
				slot0:emit(slot1.ON_CLOSE)
			end))
		end
	end, SFX_CANCEL)
	onButton(slot0, slot0._startBtn, function ()
		if slot0._currentForm == slot1.FORM_EDIT and slot0._editedFlag then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = false,
				zIndex = -100,
				content = i18n("battle_preCombatLayer_save_march"),
				onYes = function ()
					local function slot0()
						pg.TipsMgr:GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
						pg.TipsMgr.GetInstance().ShowTips:emit(PreCombatMediator.ON_START, slot0._currentFleetVO.id)
					end

					slot0:emit(PreCombatMediator.ON_COMMIT_EDIT, slot0)
				end
			})
		else
			slot0:emit(PreCombatMediator.ON_START, slot0._currentFleetVO.id)
		end
	end, SFX_UI_WEIGHANCHOR)
	onButton(slot0, slot0._nextPage, function ()
		slot0:emit(PreCombatMediator.ON_CHANGE_FLEET, slot0._legalFleetIdList[slot0._curFleetIndex + 1])
	end, SFX_PANEL)
	onButton(slot0, slot0._prevPage, function ()
		slot0:emit(PreCombatMediator.ON_CHANGE_FLEET, slot0._legalFleetIdList[slot0._curFleetIndex - 1])
	end, SFX_PANEL)
	slot0:UpdateFleetView(true)

	if slot0.contextData.form == slot0.FORM_EDIT then
		slot0._editedFlag = true

		slot0:switchToEditMode()

		if slot0._characterList then
			slot0:enabledTeamCharacter(Fleet.VANGUARD, true)
			slot0:enabledTeamCharacter(Fleet.MAIN, true)
		end

		slot0:setAllCharacterPos(false)
	else
		slot0:swtichToPreviewMode()
	end

	slot0.contextData.form = nil

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)

	if slot0.contextData.system == SYSTEM_DUEL then
		setActive(slot0._autoToggle, false)
	else
		setActive(slot0._autoToggle, true)
		onToggle(slot0, slot0._autoToggle, function (slot0)
			slot0:emit(PreCombatMediator.ON_AUTO, {
				isOn = not slot0,
				toggle = slot0._autoToggle
			})
		end, SFX_PANEL, SFX_PANEL)
		triggerToggle(slot0._autoToggle, ys.Battle.BattleState.IsAutoBotActive())
	end

	onNextTick(function ()
		slot0:uiStartAnimating()
	end)

	if slot0.contextData.system == SYSTEM_ACT_BOSS then
		PoolMgr.GetInstance():GetUI("al_bg01", true, function (slot0)
			slot0:SetActive(true)
			setParent(slot0, slot0._tf)
			slot0.transform:SetAsFirstSibling()
		end)
	end

	if slot0._currentForm == slot0.FORM_PREVIEW and slot0.contextData.system == SYSTEM_DUEL and #slot0._currentFleetVO.mainShips <= 0 then
		triggerButton(slot0._checkBtn)
	end
end

slot0.onBackPressed = function (slot0)
	playSoundEffect(SFX_CANCEL)
	triggerButton(slot0._backBtn)
end

slot0.swtichToPreviewMode = function (slot0)
	slot0._editedFlag = nil
	slot0._currentForm = slot0.FORM_PREVIEW
	slot0._checkBtn:GetComponent("Button").interactable = true

	setActive(slot0._checkBtn:Find("save"), false)
	setActive(slot0._checkBtn:Find("edit"), true)
	slot0:resetGrid(Fleet.VANGUARD)
	slot0:resetGrid(Fleet.MAIN)
	slot0:setAllCharacterPos(false)
	onButton(slot0, slot0._checkBtn, function ()
		slot0:switchToEditMode()

		if slot0.switchToEditMode._characterList then
			slot0:enabledTeamCharacter(Fleet.VANGUARD, true)
			slot0.enabledTeamCharacter:enabledTeamCharacter(Fleet.MAIN, true)
		end

		slot0:setAllCharacterPos(false)
	end, SFX_PANEL)
	slot0:disableAllStepper()
	slot0:SetFleetStepper()

	if slot0._characterList then
		slot0:enabledTeamCharacter(Fleet.VANGUARD, false)
		slot0:enabledTeamCharacter(Fleet.MAIN, false)
	end
end

slot0.switchToEditMode = function (slot0)
	slot0._currentForm = slot0.FORM_EDIT
	slot0._checkBtn:GetComponent("Button").interactable = true

	setActive(slot0._checkBtn:Find("save"), true)
	setActive(slot0._checkBtn:Find("edit"), false)
	onButton(slot0, slot0._checkBtn, function ()
		local function slot0()
			if slot0._editedFlag then
				pg.TipsMgr:GetInstance():ShowTips(i18n("battle_preCombatLayer_save_success"))
			end

			slot0:swtichToPreviewMode()
		end

		slot0:emit(PreCombatMediator.ON_COMMIT_EDIT, slot0)
	end, SFX_CONFIRM)

	if slot0.contextData.system ~= SYSTEM_HP_SHARE_ACT_BOSS then
		slot0:EnableAddGrid(Fleet.MAIN)
		slot0:EnableAddGrid(Fleet.VANGUARD)
	end

	local function slot1(slot0)
		for slot4, slot5 in ipairs(slot0) do
			if tf(slot5):Find("mouseChild") then
				if slot6:GetComponent("EventTriggerListener") then
					slot0.eventTriggers[slot7] = true

					slot7:RemovePointEnterFunc()
				end

				if slot4 == slot0._shiftIndex then
					slot6:GetComponent(typeof(Image)).enabled = true
				end
			end
		end
	end

	slot1(slot0._characterList.vanguard)
	slot1(slot0._characterList.main)

	slot0._shiftIndex = nil

	slot0:disableAllStepper()
end

slot0.switchToShiftMode = function (slot0, slot1, slot2)
	slot0:disableAllStepper()

	slot0._checkBtn:GetComponent("Button").interactable = false

	for slot6 = 1, 3, 1 do
		setActive(slot0._gridTFs[Fleet.VANGUARD][slot6].Find(slot7, "tip"), false)
		setActive(slot0._gridTFs[Fleet.MAIN][slot6].Find(slot8, "tip"), false)
		setActive(slot0._gridTFs[slot2][slot6]:Find("shadow"), false)
	end

	for slot7, slot8 in ipairs(slot3) do
		if slot8 ~= slot1 then
			LeanTween.moveLocalY(go(slot8), slot0._gridTFs[slot2][slot7].localPosition.y - 80, 0.5)

			slot10 = tf(slot8):Find("mouseChild"):GetComponent("EventTriggerListener")
			slot0.eventTriggers[slot10] = true

			slot10:AddPointEnterFunc(function ()
				for slot3, slot4 in ipairs(ipairs) do
					if slot4 == slot1 then
						slot2:shift(slot2._shiftIndex, slot3, slot3)

						break
					end
				end
			end)
		else
			slot0._shiftIndex = slot7
			tf(slot8):Find("mouseChild"):GetComponent(typeof(Image)).enabled = false
		end

		slot8:GetComponent("SpineAnimUI"):SetAction("normal", 0)
	end
end

slot0.loadAllCharacter = function (slot0)
	removeAllChildren(slot0._heroContainer)

	slot0._characterList = {
		vanguard = {},
		main = {}
	}
	slot0._infoList = {
		vanguard = {},
		main = {}
	}

	function slot1(slot0, slot1, slot2, slot3)
		slot5 = slot0._shipVOs[slot1].getConfigTable(slot4)

		if slot0.exited then
			PoolMgr.GetInstance():ReturnSpineChar(slot4:getPrefab(), slot0)

			return
		end

		for slot10, slot11 in pairs(slot6) do
			if slot11.attachment_combat_ui[1] ~= "" then
				ResourceMgr.Inst:getAssetAsync("Effect/" .. slot12, slot12, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
					if slot0.exited then
					else
						slot1 = Object.Instantiate(slot0)
						slot0._attachmentList[#slot0._attachmentList + 1] = slot1

						tf(slot1):SetParent(tf(slot1))

						tf(slot1).localPosition = BuildVector3(slot2.attachment_combat_ui[2])
					end
				end), true, true)
			end
		end

		slot0._characterList[slot2][slot3] = slot0

		tf(slot0):SetParent(slot0._heroContainer, false)

		tf(slot0).localScale = Vector3(0.65, 0.65, 1)

		pg.ViewUtils.SetLayer(tf(slot0), Layer.UI)

		slot0:GetComponent("SkeletonGraphic").raycastTarget = false

		slot0:enabledCharacter(slot0, true, slot7, slot2)
		slot0:setCharacterPos(slot2, slot3, slot0)
		slot0:sortSiblingIndex()

		slot8 = cloneTplTo(slot0._heroInfo, slot0)

		setAnchoredPosition(slot8, {
			x = 0,
			y = 0
		})

		slot8.localScale = Vector3(2, 2, 1)

		SetActive(slot8, true)

		slot8.name = "info"
		slot10 = findTF(slot9, "stars")
		slot11 = slot0._shipVOs[slot1].energy <= Ship.ENERGY_MID
		slot12 = findTF(slot9, "energy")

		if slot11 then
			slot17, slot14 = slot7:getEnergyPrint()

			if not GetSpriteFromAtlas("energy", slot13) then
				warning("找不到疲劳")
			end

			setImageSprite(slot12, slot15)
		end

		setActive(slot12, slot11 and slot0.contextData.system ~= SYSTEM_DUEL)

		for slot17 = 1, slot7:getStar(), 1 do
			cloneTplTo(slot0._starTpl, slot10)
		end

		if not GetSpriteFromAtlas("shiptype", shipType2print(slot7:getShipType())) then
			warning("找不到船形, shipConfigId: " .. slot7.configId)
		end

		setImageSprite(findTF(slot9, "type"), slot14, true)
		setText(findTF(slot9, "frame/lv_contain/lv"), slot7.level)
	end

	local function slot3(slot0, slot1)
		for slot5, slot6 in ipairs(slot0) do
			slot7 = slot0._shipVOs[slot6]:getPrefab()

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
	end)
end

slot0.setAllCharacterPos = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot0._characterList.vanguard) do
		slot0:setCharacterPos(Fleet.VANGUARD, slot5, slot6, slot1)
	end

	for slot5, slot6 in ipairs(slot0._characterList.main) do
		slot0:setCharacterPos(Fleet.MAIN, slot5, slot6, slot1)
	end

	slot0:sortSiblingIndex()
end

slot0.setCharacterPos = function (slot0, slot1, slot2, slot3, slot4)
	SetActive(slot3, true)

	slot6 = slot0._gridTFs[slot1][slot2].localPosition

	LeanTween.cancel(go(slot3))

	if slot4 then
		tf(slot3).localPosition = Vector3(slot6.x + 2, slot6.y - 80, slot6.z)

		LeanTween.moveLocalY(go(slot3), slot6.y - 110, 0.5):setDelay(0.5)
	else
		tf(slot3).localPosition = Vector3(slot6.x + 2, slot6.y - 110, slot6.z)
	end

	SetActive(slot5:Find("shadow"), true)
	slot3:GetComponent("SpineAnimUI"):SetAction("stand", 0)
end

slot0.resetGrid = function (slot0, slot1)
	slot2 = slot0._currentFleetVO:getTeamByName(slot1)

	for slot7, slot8 in ipairs(slot3) do
		SetActive(slot8:Find("shadow"), false)
		SetActive(slot8:Find("tip"), false)
	end
end

slot0.EnableAddGrid = function (slot0, slot1)
	slot3 = slot0._gridTFs[slot1]

	if #slot0._currentFleetVO:getTeamByName(slot1) < 3 then
		slot6 = slot3[slot4 + 1].Find(slot5, "tip")
		slot6:GetComponent("Button").enabled = true

		onButton(slot0, slot6, function ()
			slot0:emit(PreCombatMediator.CHANGE_FLEET_SHIP, nil, slot0._currentFleetVO, slot0)
		end, SFX_UI_FORMATION_ADD)

		slot6.localScale = Vector3(0, 0, 1)

		SetActive(slot6, true)
		LeanTween.value(go(slot6), 0, 1, 1):setOnUpdate(System.Action_float(function (slot0)
			slot0.localScale = Vector3(slot0, slot0, 1)
		end)):setEase(LeanTweenType.easeOutBack)
	end
end

slot0.shift = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-42, warpins: 1 ---
	slot6 = slot0._currentFleetVO:getTeamByName(slot3)
	tf(slot7).localPosition = Vector3(slot0._gridTFs[slot3][slot1].localPosition.x + 2, slot0._gridTFs[slot3][slot1].localPosition.y - 80, slot0._gridTFs[slot3][slot1].localPosition.z)

	LeanTween.cancel(go(slot0._characterList[slot3][slot2]))

	slot0._characterList[slot3][slot2] = slot0._characterList[slot3][slot1]
	slot0._characterList[slot3][slot1] = slot0._characterList[slot3][slot2]
	slot6[slot2] = slot6[slot1]
	slot6[slot1] = slot6[slot2]
	slot0._shiftIndex = slot2

	slot0:sortSiblingIndex()

	return
	--- END OF BLOCK #0 ---



end

slot0.sortSiblingIndex = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot1 = 3
	slot2 = 0

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-5, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 6-39, warpins: 0 ---
	while slot1 > 0 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-18, warpins: 1 ---
		slot4 = slot0._characterList[Fleet.VANGUARD][slot1]

		if slot0._characterList[Fleet.MAIN][slot1] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-26, warpins: 1 ---
			tf(slot3):SetSiblingIndex(slot2)

			slot2 = slot2 + 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 27-28, warpins: 2 ---
		if slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-36, warpins: 1 ---
			tf(slot4):SetSiblingIndex(slot2)

			slot2 = slot2 + 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 37-38, warpins: 2 ---
		slot1 = slot1 - 1
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 39-39, warpins: 2 ---
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 39-39, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.enabledTeamCharacter = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot4 = slot0._currentFleetVO:getTeamByName(slot1)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-22, warpins: 0 ---
	for slot8, slot9 in ipairs(slot3) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-20, warpins: 1 ---
		slot0:enabledCharacter(slot9, slot2, slot0._shipVOs[slot4[slot8]], slot1)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-22, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-23, warpins: 1 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.enabledCharacter = function (slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-11, warpins: 1 ---
		slot5, slot6, slot7, slot8 = tf(slot1):Find("mouseChild")

		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-16, warpins: 1 ---
			SetActive(slot5, true)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-114, warpins: 1 ---
			tf(slot5):SetParent(tf(slot1))

			tf(slot5).localPosition = Vector3.zero
			slot0.eventTriggers[GetOrAddComponent(slot5, "EventTriggerListener")] = true

			GetOrAddComponent(slot5, "ModelDrag").Init(slot6)

			slot9 = GameObject("mouseChild").GetComponent(slot5, typeof(RectTransform))
			slot9.sizeDelta = Vector2(2.5, 2.5)
			slot9.pivot = Vector2(0.5, 0)
			slot9.anchoredPosition = Vector2(0, 0)
			GetOrAddComponent(slot5, "UILongPressTrigger").longPressThreshold = 1

			pg.DelegateInfo.Add(slot0, GetOrAddComponent(slot5, "UILongPressTrigger").onLongPressed)
			GetOrAddComponent(slot5, "UILongPressTrigger").onLongPressed:AddListener(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				if slot0.contextData.system ~= SYSTEM_HP_SHARE_ACT_BOSS then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 7-16, warpins: 1 ---
					slot0:emit(PreCombatMediator.OPEN_SHIP_INFO, slot1.id, slot0._currentFleetVO)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 17-17, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)
			pg.DelegateInfo.Add(slot0, GetOrAddComponent(slot5, "ModelDrag").onModelClick)
			GetOrAddComponent(slot5, "ModelDrag").onModelClick:AddListener(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				if slot0.contextData.system ~= SYSTEM_HP_SHARE_ACT_BOSS then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 7-19, warpins: 1 ---
					playSoundEffect(SFX_UI_CLICK)
					playSoundEffect:emit(PreCombatMediator.CHANGE_FLEET_SHIP, playSoundEffect, slot0._currentFleetVO, )
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 20-20, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end)
			GetOrAddComponent(slot5, "EventTriggerListener").AddBeginDragFunc(slot8, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-61, warpins: 1 ---
				screenWidth = UnityEngine.Screen.width
				screenHeight = UnityEngine.Screen.height
				widthRate = rtf(slot0._tf).rect.width / screenWidth
				heightRate = rtf(slot0._tf).rect.height / screenHeight

				LeanTween.cancel(go(go))
				LeanTween.cancel:switchToShiftMode(LeanTween.cancel, )
				LeanTween.cancel:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)
				tf(LeanTween.cancel.GetComponent("SpineAnimUI")):SetParent(slot0._moveLayer, false)
				playSoundEffect(SFX_UI_HOME_DRAG)

				return
				--- END OF BLOCK #0 ---



			end)
			GetOrAddComponent(slot5, "EventTriggerListener").AddDragFunc(slot8, function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-23, warpins: 1 ---
				rtf(slot0).anchoredPosition = Vector2((slot1.position.x - screenWidth / 2) * widthRate + 20, (slot1.position.y - screenHeight / 2) * heightRate - 20)

				return
				--- END OF BLOCK #0 ---



			end)
			GetOrAddComponent(slot5, "EventTriggerListener"):AddDragEndFunc(function (slot0, slot1)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-17, warpins: 1 ---
				slot0:GetComponent("SpineAnimUI"):SetAction("tuozhuai", 0)

				function slot2()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-26, warpins: 1 ---
					tf(tf):SetParent(slot1._heroContainer, false)
					tf(tf):emit(PreCombatMediator.CHANGE_FLEET_SHIPS_ORDER, slot1._currentFleetVO)
					tf(tf):switchToEditMode()
					tf(tf):sortSiblingIndex()

					return
					--- END OF BLOCK #0 ---



				end

				if slot1.contextData.system ~= SYSTEM_HP_SHARE_ACT_BOSS and (slot1.position.x > UnityEngine.Screen.width * 0.65 or slot1.position.y < UnityEngine.Screen.height * 0.25) then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 34-41, warpins: 2 ---
					if not slot1._currentFleetVO:canRemove(slot2) then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 42-72, warpins: 1 ---
						slot3, slot4 = slot1._currentFleetVO:getShipPos(slot2)

						pg.TipsMgr:GetInstance():ShowTips(i18n("ship_formationUI_removeError_onlyShip", slot2:getConfigTable().name, slot1._currentFleetVO.name, Fleet.C_TEAM_NAME[slot4]))
						slot2()
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 73-93, warpins: 1 ---
						pg.MsgboxMgr.GetInstance():ShowMsgBox({
							hideNo = false,
							zIndex = -100,
							content = i18n("battle_preCombatLayer_quest_leaveFleet", slot2:getConfigTable().name),
							onYes = function ()

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-8, warpins: 1 ---
								--- END OF BLOCK #0 ---

								FLOW; TARGET BLOCK #1



								-- Decompilation error in this vicinity:
								--- BLOCK #1 9-30, warpins: 0 ---
								for slot4, slot5 in ipairs(slot0) do

									-- Decompilation error in this vicinity:
									--- BLOCK #0 9-11, warpins: 1 ---
									if slot5 == slot2 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 12-28, warpins: 1 ---
										PoolMgr.GetInstance():ReturnSpineChar(slot3:getPrefab(), slot2)
										table.remove(slot0, slot4)

										--- END OF BLOCK #0 ---

										FLOW; TARGET BLOCK #1



										-- Decompilation error in this vicinity:
										--- BLOCK #1 29-29, warpins: 1 ---
										break
										--- END OF BLOCK #1 ---



									end
									--- END OF BLOCK #0 ---

									FLOW; TARGET BLOCK #1



									-- Decompilation error in this vicinity:
									--- BLOCK #1 29-30, warpins: 2 ---
									--- END OF BLOCK #1 ---



								end

								--- END OF BLOCK #1 ---

								FLOW; TARGET BLOCK #2



								-- Decompilation error in this vicinity:
								--- BLOCK #2 31-48, warpins: 2 ---
								slot0:emit(PreCombatMediator.REMOVE_SHIP, , slot0._currentFleetVO)
								slot0:switchToEditMode()
								slot0:sortSiblingIndex()

								return
								--- END OF BLOCK #2 ---



							end,
							onNo = slot2
						})
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 94-95, warpins: 2 ---
					slot2()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 96-99, warpins: 3 ---
				playSoundEffect(SFX_UI_HOME_PUT)

				return
				--- END OF BLOCK #1 ---



			end)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 115-126, warpins: 1 ---
		if not IsNil(tf(slot1):Find("mouseChild")) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 127-130, warpins: 1 ---
			setActive(slot5, false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 131-132, warpins: 4 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.displayFleetInfo = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	slot1 = slot0._currentFleetVO:GetPropertiesSum()

	setActive(slot0._popup, slot0.contextData.system ~= SYSTEM_DUEL)
	slot0.tweenNumText(slot0._costText, slot0._currentFleetVO:GetCostSum().oil)
	slot0.tweenNumText(slot0._vanguardGS, slot0._currentFleetVO:GetGearScoreSum(Fleet.VANGUARD))
	slot0.tweenNumText(slot0._mainGS, slot0._currentFleetVO:GetGearScoreSum(Fleet.MAIN))
	setText(slot0._fleetNameText, slot0.defaultFleetName(slot0._currentFleetVO))
	setText(slot0._fleetNumText, slot0._currentFleetVO.id)

	return
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-59, warpins: 2 ---
	--- END OF BLOCK #1 ---



end

slot0.SetFleetStepper = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	if slot0.contextData.system ~= SYSTEM_DUEL and slot0.contextData.system ~= SYSTEM_HP_SHARE_ACT_BOSS then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-17, warpins: 1 ---
		SetActive(slot0._nextPage, slot0._curFleetIndex < #slot0._legalFleetIdList)
		SetActive(slot0._prevPage, slot0._curFleetIndex > 1)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-27, warpins: 2 ---
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 31-32, warpins: 2 ---
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-40, warpins: 2 ---
		SetActive(slot0._nextPage, false)
		SetActive(slot0._prevPage, false)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 41-41, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.disableAllStepper = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	SetActive(slot0._nextPage, false)
	SetActive(slot0._prevPage, false)

	return
	--- END OF BLOCK #0 ---



end

slot0.recycleCharacterList = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-24, warpins: 0 ---
	for slot6, slot7 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		if slot2[slot6] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-22, warpins: 1 ---
			PoolMgr.GetInstance():ReturnSpineChar(slot0._shipVOs[slot7]:getPrefab(), slot2[slot6])

			slot2[slot6] = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-24, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 25-25, warpins: 1 ---
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
	--- BLOCK #1 15-17, warpins: 2 ---
	if slot0.tweens then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-20, warpins: 1 ---
		cancelTweens(slot0.tweens)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-49, warpins: 2 ---
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)
	slot0:recycleCharacterList(slot0._currentFleetVO.mainShips, slot0._characterList[Fleet.MAIN])
	slot0:recycleCharacterList(slot0._currentFleetVO.vanguardShips, slot0._characterList[Fleet.VANGUARD])

	if slot0._resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-55, warpins: 1 ---
		slot0._resPanel:exit()

		slot0._resPanel = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 56-59, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 60-65, warpins: 0 ---
	for slot4, slot5 in ipairs(slot0._attachmentList) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 60-63, warpins: 1 ---
		Object.Destroy(slot5)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 64-65, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 66-68, warpins: 1 ---
	slot0._attachmentList = nil

	return
	--- END OF BLOCK #5 ---



end

return slot0
