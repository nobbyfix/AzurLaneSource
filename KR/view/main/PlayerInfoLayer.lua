slot0 = class("PlayerInfoLayer", import("..base.BaseUI"))
slot0.MAX_MEDAL_DISPLAY = 5

function slot0.getUIName(slot0)
	return "AdmiralUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0:updatePlayerInfo(slot1)
end

function slot0.updatePlayerInfo(slot0, slot1)
	slot0.player = slot1
end

function slot0.setShipCount(slot0, slot1)
	slot0.shipCount = slot1 or 0
end

function slot0.setFleetGearScore(slot0, slot1)
	slot0.fleetGS = slot1
end

function slot0.setFlagShip(slot0, slot1)
	slot0.flagShip = slot1

	slot0:updatePainting(slot1)
	slot0:updateLive2DState()
	slot0:updateBGState()
	slot0:updateSwichSkinBtn(slot1)
end

function slot0.setCollectionRate(slot0, slot1)
	slot0.collectionRate = slot1
end

function slot0.setMilitaryExercise(slot0, slot1)
	slot0.seasonInfo = slot1
end

function slot0.setTrophyList(slot0, slot1)
	slot0.trophyList = slot1
end

function slot0.OffsetSource(slot0, slot1, slot2)
	slot8 = 0

	if GetComponent(slot0.rightPanel.parent, "AspectRatioFitter") and GetComponent(GetComponent(slot3, "Image").canvas, "RectTransform").rect.width > slot7.aspectRatio * GetComponent(GetComponent(slot3, "Image").canvas, "RectTransform").rect.height then
		slot8 = (GetComponent(GetComponent(slot3, "Image").canvas, "RectTransform").rect.width - slot10) / slot9
	end

	slot10 = GetComponent(slot1, "RectTransform")

	setAnchoredPosition(slot10, Vector3(-(slot3.rect.width * slot0.rightPanel.localScale.x + slot2 + slot8), slot10.localPosition.y, slot10.localPosition.z))
end

function slot0.init(slot0)
	slot0.topPanel = slot0:findTF("blur_panel/adapt/top")
	slot0.rightPanel = slot0:findTF("blur_panel/adapt/right_panel")
	slot0.leftPanel = slot0:findTF("blur_panel/adapt/left_panel")
	slot0.bottomPanel = slot0:findTF("blur_panel/adapt/bottom_panel")
	slot0.backBtn = slot0:findTF("title/back", slot0.topPanel)
	slot0.paintContain = slot0:findTF("paint", slot0.leftPanel)
	slot0.replaceBtn = slot0:findTF("replace_btn", slot0.leftPanel)
	slot0.swichSkinBtn = slot0:findTF("swichSkin_btn", slot0.leftPanel)
	slot0.live2dBtn = slot0:findTF("L2D_btn", slot0.bottomPanel)
	slot0.live2dToggle = slot0.live2dBtn:Find("toggle")
	slot0.live2dState = slot0.live2dBtn:Find("state")
	slot0.showBgBtn = slot0:findTF("BG_btn", slot0.bottomPanel)
	slot0.showBgToggle = slot0.showBgBtn:Find("toggle")
	slot0.addMedalBtn = slot0:findTF("medalList/appendBtn", slot0.topPanel)
	slot0.writeBtn = slot0:findTF("greet/write_btn", slot0.rightPanel)
	slot0.inputField = slot0:findTF("greet/InputField", slot0.rightPanel)
	slot0.medalList = slot0:findTF("medalList/container", slot0.topPanel)
	slot0.medalTpl = slot0:findTF("medal_tpl", slot0.topPanel)
	slot0.shareBtn = slot0:findTF("btn_share", slot0.rightPanel)
	slot0.modifyNameBtn = slot0:findTF("info_panel/title/name_bg/modify_btn", slot0.rightPanel)
	slot0.attireBtn = slot0:findTF("btn_attire", slot0.rightPanel)
end

function slot0.didEnter(slot0)
	slot0:uiStartAnimating()
	onButton(slot0, slot0.backBtn, function ()
		uv0:uiExitAnimating()
		uv0:emit(uv1.ON_BACK, nil, 0.5)
	end, SFX_CANCEL)
	onButton(slot0, slot0.attireBtn, function ()
		uv0:emit(PlayerInfoMediator.ON_ATTIRE)
	end, SFX_PANEL)
	onButton(slot0, slot0.replaceBtn, function ()
		uv0:emit(PlayerInfoMediator.CHANGE_PAINT, uv0.player.character)
	end, SFX_PANEL)
	onButton(slot0, slot0.swichSkinBtn, function ()
		uv0:emit(PlayerInfoMediator.CHANGE_SKIN, uv0.flagShip)
	end)
	onButton(slot0, slot0.writeBtn, function ()
		activateInputField(uv0.inputField)
	end, SFX_PANEL)
	onButton(slot0, slot0.shareBtn, function ()
		pg.ShareMgr.GetInstance():Share(pg.ShareMgr.TypeAdmira)
	end, SFX_PANEL)
	onInputEndEdit(slot0, slot0.inputField, function (slot0)
		if wordVer(slot0) > 0 then
			pg.TipsMgr:GetInstance():ShowTips(i18n("playerinfo_mask_word"))
			activateInputField(uv0.inputField)

			return
		end

		if not slot0 or uv0.manifesto == slot0 then
			return
		end

		uv0.manifesto = slot0

		uv0:emit(PlayerInfoMediator.CHANGE_MANIFESTO, slot0)
	end)
	onButton(slot0, slot0.modifyNameBtn, function ()
		slot0, slot1 = uv0.player:canModifyName()

		if not slot0 then
			pg.TipsMgr:GetInstance():ShowTips(slot1)

			return
		end

		uv0:openChangePlayerNamePanel()
	end, SFX_PANEL)

	slot0.medalList = slot0:findTF("medalList/container", slot0.topPanel)

	slot0:initPlayerInfo()
	slot0:updateManifesto()

	slot0.manifesto = slot0.player.manifesto
end

function slot0.initChangePlayerNamePanel(slot0, slot1)
	PoolMgr.GetInstance():GetUI("AdmiralUIChangeNamePanel", true, function (slot0)
		slot0.name = "changeName_panel"
		uv0.changeNamePanel = rtf(slot0)

		setParent(uv0.changeNamePanel, uv0._tf)
		setActive(uv0.changeNamePanel, false)

		uv0.changeNameTip = uv0:findTF("frame/border/tip", uv0.changeNamePanel):GetComponent(typeof(Text))
		uv0.changeNameConfirmBtn = uv0:findTF("frame/queren", uv0.changeNamePanel)
		uv0.changeNameCancelBtn = uv0:findTF("frame/cancel", uv0.changeNamePanel)
		uv0.changeNameInputField = uv0:findTF("frame/name_field", uv0.changeNamePanel)

		SetActive(uv0.changeNamePanel, false)
		onButton(uv0, uv0.changeNameConfirmBtn, function ()
			uv0:emit(PlayerInfoMediator.ON_CHANGE_PLAYER_NAME, getInputText(uv0.changeNameInputField))
			setInputText(uv0.changeNameInputField, "")
		end, SFX_PANEL)
		onButton(uv0, uv0.changeNameCancelBtn, function ()
			uv0:closeChangePlayerNamePanel()
		end, SFX_PANEL)
		onButton(uv0, uv0.changeNamePanel, function ()
			uv0:closeChangePlayerNamePanel()
		end, SFX_PANEL)

		uv0.isInitChangeNamePanel = true

		uv1()
	end)
end

function slot0.openChangePlayerNamePanel(slot0)
	if not slot0.changeNamePanel then
		slot0:initChangePlayerNamePanel(function ()
			uv0.isOpenChangeNamePanel = true

			SetActive(uv0.changeNamePanel, true)

			slot1 = nil
			slot2 = 0

			if uv0.player:getModifyNameComsume()[1] == DROP_TYPE_RESOURCE then
				slot1 = Item.New({
					id = id2ItemId(slot0[2]),
					type = DROP_TYPE_ITEM,
					count = slot0[3]
				})
				slot2 = uv0.player:getResById(slot0[2])
			elseif slot0[1] == DROP_TYPE_ITEM then
				slot1 = Item.New({
					id = slot0[2],
					type = DROP_TYPE_ITEM,
					count = slot0[3]
				})
				slot2 = getProxy(BagProxy):getItemCountById(slot0[2])
			end

			uv0.changeNameTip.text = i18n("player_name_change_windows_tip", slot1:getConfig("name"), slot2 .. "/" .. slot0[3])
		end)
	else
		slot1()
	end
end

function slot0.closeChangePlayerNamePanel(slot0)
	slot0.isOpenChangeNamePanel = nil

	SetActive(slot0.changeNamePanel, false)
end

function slot0.onBackPressed(slot0)
	if isActive(GameObject.Find("OverlayCamera/Overlay/UIMain/DialogPanel")) then
		triggerButton(slot1.transform:Find("dialog/title/back"))

		return
	end

	if slot0.isOpenChangeNamePanel then
		slot0:closeChangePlayerNamePanel()
	else
		playSoundEffect(SFX_CANCEL)
		triggerButton(slot0.backBtn)
	end
end

function slot0.updateAttireBtn(slot0, slot1)
	setActive(slot0.attireBtn:Find("tip"), slot1)
end

function slot0.uiStartAnimating(slot0)
	setAnchoredPosition(slot0.topPanel, {
		y = 100
	})
	setAnchoredPosition(slot0.leftPanel, {
		x = -1280
	})
	setAnchoredPosition(slot0.bottomPanel, {
		y = -248
	})
	shiftPanel(slot0.topPanel, nil, 0, nil, 0.3, true, true)
	shiftPanel(slot0.leftPanel, 0, nil, nil, 0.3, true, true)
	shiftPanel(slot0.bottomPanel, nil, 0, nil, 0.3, true, true)
	setAnchoredPosition(slot1, {
		x = 1000
	})
	setAnchoredPosition(slot2, {
		x = 1000
	})
	setAnchoredPosition(slot3, {
		x = 1000
	})
	setAnchoredPosition(slot4, {
		x = 1000
	})
	shiftPanel(slot2, 0, nil, nil, 0.2, true, true)
	shiftPanel(slot1, 0, nil, nil, 0.25, true, true)
	shiftPanel(slot3, 0, nil, nil, 0.3, true, true)
	shiftPanel(slot0:findTF("greet", slot0.rightPanel), 0, nil, nil, 0.35, true, true)
end

function slot0.uiExitAnimating(slot0)
	shiftPanel(slot0.leftPanel, -1280, nil, 0.4, 0.08, true, true)
	shiftPanel(slot0.rightPanel, 1280, nil, 0.4, 0.08, true, true)
	shiftPanel(slot0.topPanel, nil, 100, 0.2, 0.2, true, true)
	shiftPanel(slot0.bottomPanel, nil, -248, nil, 0.1, true, true)
end

function slot0.updateManifesto(slot0)
	setInputText(slot0.inputField, slot0.player.manifesto)
end

function slot0.updatePainting(slot0, slot1)
	setPaintingPrefabAsync(slot0.paintContain, slot1:getPainting(), "kanban")
end

function slot0.updateFashion(slot0)
	setPaintingPrefabAsync(slot0.paintContain, slot0.skin.painting, "kanban")
	slot0:updateLive2DState()
	slot0:updateBGState()
end

function slot0.updateLive2DState(slot0)
	slot1 = "live2d/" .. string.lower(slot0.flagShip:getPainting())
	slot3 = getProxy(SettingsProxy).IsLive2dEnable(slot2)

	if Live2DUpdateMgr.Inst.state == DownloadState.None or slot5 == DownloadState.CheckFailure then
		slot4:CheckD()
	end

	if slot4:CheckF(slot1) == DownloadState.CheckToUpdate or slot6 == DownloadState.UpdateFailure then
		setActive(slot0.live2dBtn, true)
		setActive(slot0.live2dState, false)
		setActive(slot0.live2dToggle, true)
		setActive(slot0.live2dToggle:Find("on"), false)
		setActive(slot0.live2dToggle:Find("off"), true)
		onButton(slot0, slot0.live2dBtn, function ()
			uv0:UpdateF(uv1, true)
		end, SFX_PANEL)
	elseif slot6 == DownloadState.Updating then
		setActive(slot0.live2dBtn, true)
		setActive(slot0.live2dToggle, false)
		setActive(slot0.live2dState, true)
		removeOnButton(slot0.live2dBtn)
	else
		setActive(slot0.live2dBtn, PathMgr.FileExists(PathMgr.getAssetBundle(slot1)))

		if PathMgr.FileExists(PathMgr.getAssetBundle(slot1)) then
			setActive(slot0.live2dState, false)
			setActive(slot0.live2dToggle, true)
			setActive(slot0.live2dToggle:Find("on"), slot8)
			setActive(slot0.live2dToggle:Find("off"), not slot3)
			onButton(slot0, slot0.live2dBtn, function ()
				uv0:SetLive2dEnable(not uv1)
				uv2:updateLive2DState()
			end, SFX_PANEL)
		end
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end

	if slot6 == DownloadState.CheckToUpdate or slot6 == DownloadState.UpdateFailure or slot6 == DownloadState.Updating then
		slot0.live2dTimer = Timer.New(function ()
			uv0:updateLive2DState()
		end, 0.5, 1)

		slot0.live2dTimer:Start()
	end
end

function slot0.updateSwichSkinBtn(slot0, slot1)
	if slot0:isCurrentShipExistSkin(slot1.groupId) then
		setActive(slot0.swichSkinBtn, true)
	else
		setActive(slot0.swichSkinBtn, false)
	end
end

function slot0.isCurrentShipExistSkin(slot0, slot1)
	if slot1 then
		if #slot0:getGroupSkinList(slot1) > 1 then
			return true
		elseif #slot2 == 1 then
			return false
		end
	end
end

function slot0.getGroupSkinList(slot0, slot1)
	slot2 = ShipGroup.getSkinList(slot1)

	if pg.ship_data_trans[slot1] and not slot0.flagShip:isRemoulded() then
		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].id == ShipGroup.GetGroupConfig(slot1).trans_skin then
				table.remove(slot2, slot7)

				break
			end
		end
	end

	for slot6 = #slot2, 1, -1 do
		if slot2[slot6].show_time and (type(slot7.show_time) == "string" and slot7.show_time == "stop" or type(slot7.show_time) == "table" and not pg.TimeMgr:GetInstance():inTime(slot7.show_time)) then
			table.remove(slot2, slot6)
		end
	end

	if PLATFORM_CODE == PLATFORM_CH then
		for slot7 = #slot2, 1, -1 do
			if slot2[slot7].skin_type == 3 and pg.gameset.big_seven_old_skin_timestamp.key_value < slot0.flagShip.createTime then
				table.remove(slot2, slot7)
			end
		end
	end

	if HXSet.isHx() then
		for slot6 = #slot2, 1, -1 do
			if pg.ship_skin_template[slot2[slot6].id].isHX == 1 then
				table.remove(slot2, slot6)
			end
		end
	end

	return slot2
end

function slot0.updateBGState(slot0)
	if slot0.flagShip:getShipBgPrint() ~= slot0.flagShip:rarity2bgPrintForGet() then
		setActive(slot0.showBgBtn, true)
		setActive(slot0.showBgToggle:Find("on"), getProxy(SettingsProxy).IsBGEnable(slot1))
		setActive(slot0.showBgToggle:Find("off"), not getProxy(SettingsProxy).IsBGEnable(slot1))
		removeOnButton(slot0.showBgBtn)
		onButton(slot0, slot0.showBgBtn, function ()
			uv0 = not uv0

			uv1:SetBGEnable(uv0)
			setActive(uv2.showBgToggle:Find("on"), uv0)
			setActive(uv2.showBgToggle:Find("off"), not uv0)
		end, SFX_PANEL)
	else
		setActive(slot0.showBgBtn, false)
	end
end

function slot0.updateFleetGSView(slot0)
	setText(slot0:findTF("basic/info_list/score/value", slot0.rightPanel), slot0.fleetGS)
end

function slot0.initPlayerInfo(slot0)
	if math.max(SeasonInfo.getEmblem(slot0.seasonInfo.score, slot0.seasonInfo.rank), math.max(slot0.player.maxRank, 1)) > 14 then
		slot3 = 14
	end

	slot7 = {
		slot1.shipCount,
		slot1.attackCount,
		string.format("%0.1f", slot1.winCount / math.max(slot1.attackCount, 1) * 100) .. "%",
		slot1.collect_attack_count,
		slot1.pvp_attack_count,
		string.format("%0.1f", slot1.pvp_win_count / math.max(slot1.pvp_attack_count, 1) * 100) .. "%"
	}
	slot8 = slot0:findTF("info_panel", slot0.rightPanel)
	slot9 = slot0:findTF("statistics/exp_panel", slot0.rightPanel)

	setText(findTF(slot8, "title/name_bg/Text"), slot1.name)
	setText(findTF(slot8, "title/name_bg/uid"), slot1.id)
	setText(findTF(slot8, "title/lv_bg/Text"), "LV." .. slot1.level)
	setText(findTF(slot8, "title/exp"), slot0.player.exp .. "/" .. slot10)

	for slot15, slot16 in ipairs(slot6) do
		setText(findTF(slot0:findTF("basic/info_list", slot0.rightPanel):GetChild(slot15 - 1), "value"), slot16 or 0)
	end

	LoadImageSpriteAsync("emblem/" .. slot14, slot12, true)
	LoadImageSpriteAsync("emblem/n_" .. slot14, slot13, true)

	if SeasonInfo.getMilitaryRank(slot0.seasonInfo.score, slot0.seasonInfo.rank) then
		slot16 = slot0:findTF("basic/medal/Text", slot0.rightPanel)
	end

	for slot19, slot20 in ipairs(slot7) do
		setText(findTF(slot9:GetChild(slot19 - 1), "value"), slot20 or 0)
	end

	slot0:updateMedalDisplay()
	slot0:setLanguages()
end

function slot0.updateMedalDisplay(slot0, slot1)
	slot0.selectedMedalList = slot0.player.displayTrophyList

	removeAllChildren(slot0.medalList)

	for slot6 = 1, math.min(#slot0.selectedMedalList, uv0.MAX_MEDAL_DISPLAY), 1 do
		LoadImageSpriteAsync("medal/s_" .. pg.medal_template[slot0.selectedMedalList[slot6]].icon, slot0:findTF("icon", cloneTplTo(slot0.medalTpl, slot0.medalList)), true)
	end

	setActive(slot0.addMedalBtn, false)
end

function slot0.updatePlayerName(slot0)
	slot0.selectedMedalList = Clone(slot0.player.displayTrophyList)

	setText(findTF(slot1, "title/name_bg/Text"), slot0.player.name)
end

function slot0.setLanguages(slot0)
	setText(slot0:findTF("info_panel/bg1/title_name", slot0.rightPanel), i18n("friend_resume_title"))
	setText(slot0:findTF("statistics/bg2/title_name", slot0.rightPanel), i18n("friend_resume_data_title"))
	setText(slot0:findTF("statistics/exp_panel/ship_count/name", slot0.rightPanel), i18n("friend_resume_ship_count"))
	setText(slot0:findTF("statistics/exp_panel/combat_count/name", slot0.rightPanel), i18n("friend_resume_attack_count"))
	setText(slot0:findTF("statistics/exp_panel/succeed_rate/name", slot0.rightPanel), i18n("friend_resume_attack_win_rate"))
	setText(slot0:findTF("statistics/exp_panel/action_count/name", slot0.rightPanel), i18n("friend_event_count"))
	setText(slot0:findTF("statistics/exp_panel/exercise_count/name", slot0.rightPanel), i18n("friend_resume_manoeuvre_count"))
	setText(slot0:findTF("statistics/exp_panel/exercise_rate/name", slot0.rightPanel), i18n("friend_resume_manoeuvre_win_rate"))
	setText(slot0:findTF("basic/info_list/collection_rate/name", slot0.rightPanel), i18n("friend_resume_collection_rate"))
	setText(slot0:findTF("basic/info_list/score/name", slot0.rightPanel), i18n("friend_resume_fleet_gs"))
end

function slot0.willExit(slot0)
	if slot0.tweens then
		cancelTweens(slot0.tweens)
	end

	if slot0.live2dTimer then
		slot0.live2dTimer:Stop()

		slot0.live2dTimer = nil
	end
end

return slot0
