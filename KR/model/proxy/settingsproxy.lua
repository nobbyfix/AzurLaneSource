slot0 = class("SettingsProxy", pm.Proxy)

slot0.onRegister = function (slot0)
	slot0._ShowBg = PlayerPrefs.GetInt("disableBG", 1) > 0
	slot0._ShowLive2d = PlayerPrefs.GetInt("disableLive2d", 1) > 0
	slot0._selectedShipId = PlayerPrefs.GetInt("playerShipId")
	slot0._backyardFoodRemind = PlayerPrefs.GetString("backyardRemind")
	slot0._userAgreement = PlayerPrefs.GetInt("userAgreement", 0) > 0
	slot0._showMaxLevelHelp = PlayerPrefs.GetInt("maxLevelHelp", 0) > 0
	slot0.nextTipAoutBattleTime = PlayerPrefs.GetInt("AutoBattleTip", 0)

	slot0:resetEquipSceneIndex()

	slot0._everyplayInited = false
end

slot0.SetLive2dEnable = function (slot0, slot1)
	if slot0._ShowLive2d ~= slot1 then
		slot0._ShowLive2d = slot1

		PlayerPrefs.SetInt("disableLive2d", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

slot0.SetBGEnable = function (slot0, slot1)
	if slot0._ShowBg ~= slot1 then
		slot0._ShowBg = slot1

		PlayerPrefs.SetInt("disableBG", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

slot0.getUserAgreement = function (slot0)
	return slot0._userAgreement
end

slot0.setUserAgreement = function (slot0)
	if not slot0._userAgreement then
		PlayerPrefs.SetInt("userAgreement", 1)
		PlayerPrefs.Save()

		slot0._userAgreement = true
	end
end

slot0.deleteUserAreement = function (slot0)
	if slot0._userAgreement then
		PlayerPrefs.DeleteKey("userAgreement")
		PlayerPrefs.Save()

		slot0._userAgreement = nil
	end
end

slot0.IsLive2dEnable = function (slot0)
	return slot0._ShowLive2d
end

slot0.IsBGEnable = function (slot0)
	return slot0._ShowBg
end

slot0.SetSelectedShipId = function (slot0, slot1)
	if slot0._selectedShipId ~= slot1 then
		slot0._selectedShipId = slot1

		PlayerPrefs.SetInt("playerShipId", slot1)
		PlayerPrefs.Save()
	end
end

slot0.GetSelectedShipId = function (slot0)
	return slot0._selectedShipId
end

slot0.setEquipSceneIndex = function (slot0, slot1)
	slot0._equipSceneIndex = slot1
end

slot0.getEquipSceneIndex = function (slot0)
	return slot0._equipSceneIndex
end

slot0.resetEquipSceneIndex = function (slot0)
	slot0._equipSceneIndex = StoreHouseConst.WARP_TO_MATERIAL
end

slot0.setActivityLayerIndex = function (slot0, slot1)
	slot0._activityLayerIndex = slot1
end

slot0.getActivityLayerIndex = function (slot0)
	return slot0._activityLayerIndex
end

slot0.resetActivityLayerIndex = function (slot0)
	slot0._activityLayerIndex = 1
end

slot0.setBackyardRemind = function (slot0)
	if slot0._backyardFoodRemind ~= tostring(GetZeroTime()) then
		PlayerPrefs.SetString("backyardRemind", slot1)
		PlayerPrefs.Save()

		slot0._backyardFoodRemind = slot1
	end
end

slot0.getBackyardRemind = function (slot0)
	if not slot0._backyardFoodRemind or slot0._backyardFoodRemind == "" then
		return 0
	else
		return tonumber(slot0._backyardFoodRemind)
	end
end

slot0.getMaxLevelHelp = function (slot0)
	return slot0._showMaxLevelHelp
end

slot0.setMaxLevelHelp = function (slot0, slot1)
	if slot0._showMaxLevelHelp ~= slot1 then
		slot0._showMaxLevelHelp = slot1

		PlayerPrefs.SetInt("maxLevelHelp", (slot1 and 1) or 0)
		PlayerPrefs.Save()
	end
end

slot0.setStopBuildSpeedupRemind = function (slot0)
	slot0.isStopBuildSpeedupReamind = true
end

slot0.getStopBuildSpeedupRemind = function (slot0)
	return slot0.isStopBuildSpeedupReamind
end

slot0.checkReadHelp = function (slot0, slot1)
	if not getProxy(PlayerProxy):getData() then
		return true
	end

	if slot1 == "help_backyard" then
		return true
	elseif pg.SeriesGuideMgr:GetInstance():isEnd() then
		slot4 = PlayerPrefs.GetInt(slot1, 0)

		return PlayerPrefs.GetInt(slot1, 0) > 0
	end

	return true
end

slot0.recordReadHelp = function (slot0, slot1)
	PlayerPrefs.SetInt(slot1, 1)
	PlayerPrefs.Save()
end

slot0.clearAllReadHelp = function (slot0)
	PlayerPrefs.DeleteKey("tactics_lesson_system_introduce")
	PlayerPrefs.DeleteKey("help_shipinfo_equip")
	PlayerPrefs.DeleteKey("help_shipinfo_detail")
	PlayerPrefs.DeleteKey("help_shipinfo_intensify")
	PlayerPrefs.DeleteKey("help_shipinfo_upgrate")
	PlayerPrefs.DeleteKey("help_backyard")
	PlayerPrefs.DeleteKey("has_entered_class")
	PlayerPrefs.DeleteKey("help_commander_info")
	PlayerPrefs.DeleteKey("help_commander_play")
	PlayerPrefs.DeleteKey("help_commander_ability")
end

slot0.setAoutBattleTip = function (slot0)
	slot0.nextTipAoutBattleTime = GetZeroTime()

	PlayerPrefs.SetInt("AutoBattleTip", GetZeroTime())
	PlayerPrefs.Save()
end

slot0.isTipAutoBattle = function (slot0)
	return slot0.nextTipAoutBattleTime < pg.TimeMgr.GetInstance():GetServerTime()
end

slot0.initEveryPlay = function (slot0)
	if PLATFORM_CODE ~= PLATFORM_CH then
		return
	end

	if not slot0._everyplayInited then
		print("Init Everyplay")
		Everyplay.Initialize()

		slot0._everyplayInited = true
	else
		print("Everyplay had inited")
	end
end

return slot0
