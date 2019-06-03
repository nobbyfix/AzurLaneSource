slot0 = class("BattleScene", import("..base.BaseUI"))
slot0.IN_VIEW_FRIEND_SKILL_OFFSET = Vector3(-5, 0, 6)
slot0.IN_VIEW_FOE_SKILL_OFFSET = Vector3(-15, 0, 6)
slot0.FOE_SIDE_X_OFFSET = 250
slot0.SKILL_FLOAT_SCALE = Vector3(1.5, 1.5, 0)
slot0.SIDE_ALIGNMENT = {
	{
		-120,
		-7.5,
		-232.5
	},
	{
		105,
		217.5,
		330
	},
	{
		-345,
		-457.5,
		-570
	}
}
slot1 = nil

function slot0.getUIName(slot0)
	return "CombatUI"
end

function slot0.getBGM(slot0)
	return ys.Battle.BattleDataFunction.GetDungeonTmpDataByID(slot1).bgm or "battle-1"
end

function slot0.init(slot0)
	uv0 = ys.Battle.BattleVariable
	slot1 = GameObject.Find("MainCamera")
	slot0.uiCanvas = findTF(slot2, "Canvas/UIMain")
	slot0.skillTips = slot0:findTF("Skill_Activation")
	slot0.skillRoot = slot0:findTF("Skill_Activation/Root")
	slot0.skillTpl = slot0:findTF("Skill_Activation/mask").gameObject
	slot0._skillFloatPool = pg.Pool.New(slot0.skillRoot, slot0.skillTpl, 4, 10, true, false):InitSize()
	slot0.skillCMDRoot = slot0:findTF("Skill_Activation/Root_cmd")
	slot0.skillCMDTpl = slot0:findTF("Skill_Activation/mask_cmd").gameObject
	slot0._skillFloatCMDPool = pg.Pool.New(slot0.skillCMDRoot, slot0.skillCMDTpl, 2, 4, true, false):InitSize()
	slot0.popupTpl = slot0:getTpl("popup")

	SetActive(slot0._go, false)

	slot0._skillPaintings = {}
	slot0._skillFloat = true
	slot0._cacheSkill = {}
	slot0._commanderSkillList = {}
	slot0._sideSkillFloatStateList = {
		[ys.Battle.BattleConfig.FRIENDLY_CODE] = {
			{},
			{},
			{}
		},
		[ys.Battle.BattleConfig.FOE_CODE] = {
			{},
			{},
			{}
		}
	}

	slot0:initPainting()
end

function slot0.initPainting(slot0)
	slot2 = ys.Battle.BattleResourceManager:GetInstance().InstSkillPaintingUI(slot1)

	setParent(slot2, slot0.uiCanvas, false)

	slot0._paintingUI = slot2
	slot0._paintingAnimator = slot2:GetComponent(typeof(Animator))
	slot0._paintingAnimator.enabled = false
	slot0._paintingParticleContainer = findTF(slot2, "particleContainer")
	slot0._paintingParticles = findTF(slot0._paintingParticleContainer, "effect")
	slot0._paintingParticleSystem = slot0._paintingParticles:GetComponent(typeof(ParticleSystem))

	slot0._paintingParticleSystem:Stop(true)

	slot0._paintingFitter = findTF(slot2, "hero/fitter")

	removeAllChildren(slot0._paintingFitter)

	GetOrAddComponent(slot0._paintingFitter, "PaintingScaler").FrameName = "lihuisha"
	GetOrAddComponent(slot0._paintingFitter, "PaintingScaler").Tween = 1

	slot2:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		setActive(uv0._currentPainting, false)

		uv0._currentPainting = nil
	end)
end

function slot0.EnableSkillFloat(slot0, slot1)
	if slot1 == slot0._skillFloat then
		return
	end

	slot0._skillFloat = slot1

	if slot0._skillFloat then
		for slot5, slot6 in ipairs(slot0._cacheSkill) do
			slot0:appendSkill(slot6.skillName, slot6.caster, slot6.commander, slot6.hrzIcon)
		end

		slot0._cacheSkill = {}
	else
		slot0._skillFloatPool:AllRecycle()
		slot0._skillFloatCMDPool:AllRecycle()

		slot0._preCommanderSkillTF = nil
		slot0._preSkillTF = nil
	end

	SetActive(slot0.skillTips, slot1)
end

function slot0.appendSkill(slot0, slot1, slot2, slot3, slot4)
	if not slot0._skillFloat then
		table.insert(slot0._cacheSkill, {
			skillName = slot1,
			caster = slot2,
			commander = slot3,
			hrzIcon = slot4
		})

		return
	end

	slot5 = ys.Battle.BattleResourceManager:GetInstance()
	slot6, slot7 = nil

	if slot3 then
		if slot0._commanderSkillList[slot3] and slot0._commanderSkillList[slot3][slot1] then
			return
		end

		slot6 = slot0._skillFloatCMDPool
		slot7 = slot5:GetCommanderHrzIcon(slot3)
	else
		slot6 = slot0._skillFloatPool
		slot7 = (slot2:GetUnitType() ~= ys.Battle.BattleConst.UnitType.PLAYER_UNIT or slot5:GetCharacterIcon(slot4 or slot2:GetTemplate().painting)) and slot5:GetCharacterIcon(pg.enemy_data_statistics[slot2:GetTemplateID()].icon)
	end

	slot6:GetObject().transform.localScale = uv0.SKILL_FLOAT_SCALE

	setText(findTF(slot9, "skill/skill_name/Text"), HXSet.hxLan(slot1))

	findTF(slot9, "skill/icon").GetComponent(slot10, typeof(Image)).sprite = slot7
	slot12, slot13 = slot2:GetIFF()
	findTF(slot9, "skill/skill_name"):GetComponent(typeof(Image)).color = (slot2:GetIFF() ~= ys.Battle.BattleConfig.FRIENDLY_CODE or Color.New(1, 1, 1, 1)) and Color.New(1, 0.33, 0.33, 1)
	findTF(slot9, "skill"):GetComponent(typeof(Image)).color = (slot2.GetIFF() ~= ys.Battle.BattleConfig.FRIENDLY_CODE or Color.New(1, 1, 1, 1)) and Color.New(1, 0.33, 0.33, 1)

	if slot3 then
		slot0:commanderSkillFloat(slot3, slot1, slot8)
	else
		slot16 = table.contains(TeamType.SubShipType, slot2:GetTemplate().type)
		slot17 = slot2:GetMainUnitIndex()

		if ys.Battle.BattleCameraUtil:GetInstance():GetCharacterArrowBarPosition(slot14) == nil or slot15 == nil and table.contains(TeamType.SubShipType, slot2.GetTemplate().type) and not slot2:IsMainFleetUnit() then
			slot9.position = Vector3((slot12 ~= ys.Battle.BattleConfig.FRIENDLY_CODE or uv1.CameraPosToUICamera(slot2:GetPosition():Clone():Add(uv0.IN_VIEW_FRIEND_SKILL_OFFSET))) and uv1.CameraPosToUICamera(slot2:GetPosition():Clone():Add(uv0.IN_VIEW_FOE_SKILL_OFFSET)).x, (slot12 ~= ys.Battle.BattleConfig.FRIENDLY_CODE or uv1.CameraPosToUICamera(slot2.GetPosition().Clone().Add(uv0.IN_VIEW_FRIEND_SKILL_OFFSET))) and uv1.CameraPosToUICamera(slot2.GetPosition().Clone().Add(uv0.IN_VIEW_FOE_SKILL_OFFSET)).y, -2)

			if slot0._preSkillTF then
				slot0.handleSkillFloatCld(slot0._preSkillTF, slot9)
			end

			slot0._preSkillTF = slot9

			slot9:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
				uv0._preSkillTF = nil

				uv1:Recycle(uv2)
			end)
		else
			slot18 = nil
			slot19 = uv0.SIDE_ALIGNMENT[slot17]

			for slot24 = 1, #slot0._sideSkillFloatStateList[slot12][slot17], 1 do
				if slot20[slot24] then
					slot18 = slot24

					break
				end
			end

			if slot18 == nil then
				slot18 = #slot20 + 1
			end

			slot20[slot18] = false
			slot9.position = slot15
			slot9.anchoredPosition.y = slot19[slot18]

			if slot12 == ys.Battle.BattleConfig.FOE_CODE then
				slot21.x = uv0.FOE_SIDE_X_OFFSET
			end

			slot9.anchoredPosition = slot21

			slot9:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
				uv0[uv1] = true

				uv2:Recycle(uv3)
			end)
		end
	end
end

function slot0.appendSkillCover(slot0, slot1, slot2, slot3)
	slot0:appendSkill(slot1, slot2, nil, slot3)
end

function slot0.handleSkillFloatCld(slot0, slot1)
	if math.floor(math.abs(slot1.anchoredPosition.y - slot0.anchoredPosition.y)) <= 112.5 then
		slot2.y = slot3 + 112.5
		slot1.anchoredPosition = slot2
	end
end

function slot0.handleSkillSinkCld(slot0, slot1)
end

function slot0.commanderSkillFloat(slot0, slot1, slot2, slot3)
	slot0._commanderSkillList[slot1] = slot0._commanderSkillList[slot1] or {}
	slot0._commanderSkillList[slot1][slot2] = true
	slot3.transform.anchoredPosition.x = 0
	slot3.transform.anchoredPosition.y = 0
	slot3.transform.anchoredPosition = slot3.transform.anchoredPosition

	if slot0._preCommanderSkillTF and math.floor(math.abs(slot5.y - slot0._preCommanderSkillTF.anchoredPosition.y)) <= 97.5 then
		slot5.y = slot6 - 97.5
	end

	slot4.anchoredPosition = slot5
	slot0._preCommanderSkillTF = slot4

	slot4:GetComponent(typeof(DftAniEvent)):SetEndEvent(function (slot0)
		uv0._commanderSkillList[uv1][uv2] = nil
		uv0._preCommanderSkillTF = nil

		uv0._skillFloatCMDPool:Recycle(uv3)
	end)
end

function slot0.painting(slot0, slot1, slot2, slot3)
	if slot0._currentPainting then
		slot0._paintingAnimator.enabled = false

		setActive(slot0._currentPainting, false)
	end

	if slot0._skillPaintings[slot1.id] == nil then
		slot4 = nil

		if not HXSet.isHx() then
			slot4 = slot1.painting
		elseif slot1.painting_hx == "" or not slot1.painting_hx then
			slot4 = slot1.painting
		end

		slot5 = ys.Battle.BattleResourceManager:GetInstance().InstPainting
		slot7 = slot4 or slot1.prefab
		slot0._skillPaintings[slot1.id] = ys.Battle.BattleResourceManager.GetInstance():InstPainting(slot7)

		setParent(ys.Battle.BattleResourceManager.GetInstance().InstPainting(slot7), slot0._paintingFitter, false)
	end

	slot0._currentPainting = slot0._skillPaintings[slot1.id]

	setActive(slot0._currentPainting, true)
	LuaHelper.SetParticleSpeed(slot0._paintingUI, slot2)

	slot0._paintingUI.transform.localScale = Vector3(slot3, 1, 1)
	slot0._paintingParticleContainer.transform.localScale = Vector3(slot3, 1, 1)
	slot0._paintingParticles.transform.localEulerAngles = Vector3(0, 90 * slot3, 0)

	slot0._paintingParticleSystem:Play(true)

	slot0._paintingAnimator.speed = slot2
	slot0._paintingAnimator.enabled = true

	slot0._paintingAnimator:Play("skill_painting", -1, 0)
end

function slot0.didEnter(slot0)
	setActive(slot0._tf, false)

	slot1 = ys.Battle.BattleState.GetInstance()

	slot1:SetBattleUI(slot0)
	onButton(slot0, slot0:findTF("PauseBtn"), function ()
		uv0:emit(BattleMediator.ON_PAUSE)
	end, SFX_CONFIRM)
	onButton(slot0, slot2, function ()
		uv0:emit(BattleMediator.ON_CHAT, uv0:findTF("chatContainer"))
		setActive(uv1, false)
	end)
	onToggle(slot0, slot0:findTF("AutoBtn"), function (slot0)
		uv0:emit(BattleMediator.ON_AUTO, {
			isOn = not slot0,
			toggle = uv0:findTF("AutoBtn")
		})
		uv1:ActiveBot(ys.Battle.BattleState.IsAutoBotActive())
		setActive(uv2, uv1:ChatUseable())
	end, SFX_PANEL, SFX_PANEL)
	slot1:ConfigBattleEndFunc(function (slot0)
		uv0:clear()
		uv0:emit(BattleMediator.ON_BATTLE_RESULT, slot0)
	end)
	slot0:emit(BattleMediator.ENTER)
	slot0:initPauseWindow()

	if slot0.contextData.prePause then
		triggerButton(slot0:findTF("PauseBtn"))
	end

	setActive(slot2, slot1:ChatUseable())
end

function slot0.onBackPressed(slot0)
	if isActive(slot0.pauseWindow) then
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0.continueBtn)
	end
end

function slot0.activeBotHelp(slot0, slot1)
	slot2 = getProxy(PlayerProxy)

	if not slot1 then
		if slot0.autoBotHelp then
			pg.MsgboxMgr.GetInstance():hide()
		end

		return
	end

	if slot2.botHelp then
		return
	end

	slot0.autoBotHelp = true

	pg.MsgboxMgr.GetInstance():ShowMsgBox({
		type = MSGBOX_TYPE_HELP,
		helps = i18n("help_battle_auto"),
		custom = {
			{
				text = "text_confirm",
				sound = SFX_CANCEL
			}
		},
		onClose = function ()
			uv0.autoBotHelp = false
		end
	})

	slot2.botHelp = true
end

function slot0.exitBattle(slot0, slot1)
	if not slot1 then
		slot0:emit(BattleMediator.ON_BACK_PRE_SCENE)
	elseif slot1 == "kick" then
		-- Nothing
	end
end

function slot0.setChapter(slot0, slot1)
	slot0._chapter = slot1
end

function slot0.setFleet(slot0, slot1, slot2)
	slot0._mainShipVOs = slot1
	slot0._vanShipVOs = slot2
end

function slot0.initPauseWindow(slot0)
	slot0.pauseWindow = slot0:findTF("Msgbox")
	slot0.LeftTimeContainer = slot0:findTF("window/LeftTime", slot0.pauseWindow)
	slot0.LeftTime = slot0:findTF("window/LeftTime/Text", slot0.pauseWindow)
	slot0.mainTFs = {}
	slot0.vanTFs = {}

	function slot1(slot0, slot1, slot2)
		for slot6 = 1, 3, 1 do
			slot8 = setActive
			slot9 = slot1:Find("ship_" .. slot6)

			if slot2 then
				if slot6 > #slot2 then
					slot10 = false
				else
					slot10 = true
				end
			end

			slot8(slot9, slot10)

			if slot2 and slot6 <= #slot2 then
				updateShip(slot7, slot2[slot6])
			end

			slot8 = table.insert

			if not slot0 or not uv0.mainTFs then
				slot9 = uv0.vanTFs
			end

			slot8(slot9, slot7)
		end

		if slot2 then
			slot3 = 0

			for slot7, slot8 in ipairs(slot2) do
				slot3 = slot3 + slot8:getShipCombatPower()
			end

			setText(slot1:Find("power/value"), math.floor(slot3))
		end
	end

	if slot0._mainShipVOs then
		slot1(true, slot0:findTF("window/main", slot0.pauseWindow), slot0._mainShipVOs)
		slot1(false, slot0:findTF("window/van", slot0.pauseWindow), slot0._vanShipVOs)
	end

	slot3 = findTF(slot0.pauseWindow, "window/Chapter")
	slot4 = findTF(slot0.pauseWindow, "window/Chapter/Text")

	if ys.Battle.BattleState.GetInstance().GetBattleType(slot2) == SYSTEM_SCENARIO then
		setText(slot3, slot0._chapter:getConfigTable().chapter_name)
		setText(slot4, string.split(slot0._chapter.getConfigTable().name, "|")[1])
	elseif slot5 == SYSTEM_SHAM then
		setText(slot3, "SP")
		setText(slot4, string.split(slot0._chapter:getConfig("name"), "|")[1])
	elseif slot5 == SYSTEM_ROUTINE or slot5 == SYSTEM_DUEL or slot5 == SYSTEM_HP_SHARE_ACT_BOSS or slot5 == SYSTEM_ACT_BOSS then
		setText(slot3, "SP")
		setText(slot4, pg.expedition_data_template[slot2:GetProxyByName(ys.Battle.BattleDataProxy.__name):GetInitData().StageTmpId].name)
	elseif slot5 == SYSTEM_DEBUG then
		setText(slot3, "??")
		setText(slot4, "碧蓝梦境")
	elseif slot5 == SYSTEM_CHALLENGE then
		setText(slot3, "SP")
		setText(slot4, pg.expedition_data_template[slot0._chapter:getChallengeStageID()].name)
		setActive(slot0.LeftTimeContainer, false)
	end

	onButton(slot0, slot0:findTF("window/button_container/leave", slot0.pauseWindow), function ()
		uv0:emit(BattleMediator.ON_LEAVE)
	end)

	slot0.continueBtn = slot0:findTF("window/button_container/continue", slot0.pauseWindow)

	onButton(slot0, slot0.continueBtn, function ()
		setActive(uv0.pauseWindow, false)
		pg.UIMgr.GetInstance():UnblurPanel(uv0.pauseWindow, uv0._tf)
		uv1:Resume()
	end)
	onButton(slot0, slot0:findTF("help", slot0.pauseWindow), function ()
		if BATTLE_DEBUG and PLATFORM == 7 then
			setActive(uv0.pauseWindow, false)
			pg.UIMgr.GetInstance():UnblurPanel(uv0.pauseWindow, uv0._tf)
			uv1:Resume()
			uv1:OpenConsole()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_HELP,
				helps = i18n("help_battle_rule")
			})
		end
	end)
	onButton(slot0, slot0:findTF("window/top/btnBack", slot0.pauseWindow), function ()
		triggerButton(uv0.continueBtn)
	end)
	onButton(slot0, slot0.pauseWindow, function ()
		triggerButton(uv0.continueBtn)
	end)
	setActive(slot0.pauseWindow, false)
end

function slot0.updatePauseWindow(slot0)
	if not slot0.pauseWindow then
		return
	end

	setActive(slot0.pauseWindow, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.pauseWindow)

	local function slot1(slot0, slot1, slot2)
		slot3 = 1

		for slot7 = 1, #slot0, 1 do
			if slot1[slot3] and slot8:GetAttrByName("id") == slot0[slot7].id then
				setSlider(slot2[slot7]:Find("blood"), 0, 1, slot8:GetHPRate())

				slot3 = slot3 + 1

				SetActive(slot2[slot7]:Find("mask"), false)
			else
				setSlider(slot2[slot7]:Find("blood"), 0, 1, 0)
				SetActive(slot2[slot7]:Find("mask"), true)
			end
		end
	end

	slot3 = ys.Battle.BattleState.GetInstance().GetProxyByName(slot2, ys.Battle.BattleDataProxy.__name)
	slot4 = slot3:GetFleetByIFF(ys.Battle.BattleConfig.FRIENDLY_CODE)

	slot1(slot0._mainShipVOs, slot5, slot0.mainTFs)
	slot1(slot0._vanShipVOs, slot6, slot0.vanTFs)
	setText(slot0.LeftTime, ys.Battle.BattleTimerView.formatTime(math.floor(slot3:GetCountDown())))
end

function slot0.OnCloseChat(slot0)
	setActive(slot0:findTF("chatBtn"), ys.Battle.BattleState.GetInstance():IsBotActive())
end

function slot0.clear(slot0)
	slot0._preSkillTF = nil
	slot0._preCommanderSkillTF = nil
	slot0._commanderSkillList = nil
	slot0._skillPaintings = nil
	slot0._currentPainting = nil

	Destroy(slot0._paintingUI)
end

function slot0.willExit(slot0)
	slot0._skillFloatPool:Dispose()
	slot0._skillFloatCMDPool:Dispose()
	ys.Battle.BattleState.GetInstance():ExitBattle()
	pg.UIMgr.GetInstance():UnblurPanel(slot0.pauseWindow, slot0._tf)
end

return slot0
