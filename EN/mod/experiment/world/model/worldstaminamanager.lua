slot0 = class("WorldStaminaManager", import("...BaseEntity"))
slot0.Fields = {
	staminaExchangeTimes = "number",
	staminaLastRecoverTime = "number",
	staminaExtra = "number",
	transform = "userdata",
	preSelectIndex = "number",
	updateTimer = "table",
	stamina = "number",
	UIMain = "userdata"
}
slot0.EventUpdateStamina = "WorldStaminaManager.EventUpdateStamina"

function slot0.Build(slot0)
	pg.DelegateInfo.New(slot0)

	slot0.UIMain = pg.UIMgr.GetInstance().OverlayMain

	PoolMgr.GetInstance():GetUI("WorldStaminaRecoverUI", true, function (slot0)
		if not slot0.UIMain then
			slot1:ReturnUI("WorldStaminaRecoverUI", slot0)
		else
			slot0.transform = tf(slot0)

			setParent(slot0.transform, slot0.UIMain, false)
			setActive(slot0.transform, false)
			onButton(slot0, slot0.transform:Find("bg"), function ()
				slot0:Hide()
			end, SFX_CANCEL)
			onButton(slot0, slot0.transform:Find("window/top/btnBack"), function ()
				slot0:Hide()
			end, SFX_CANCEL)
			onButton(slot0, slot0.transform:Find("window/button_container/custom_button_2"), function ()
				slot0:Hide()
			end, SFX_CANCEL)
		end
	end)
end

function slot0.Setup(slot0, slot1)
	slot0.stamina = slot1[1]
	slot0.staminaExtra = slot1[2]
	slot0.staminaLastRecoverTime = slot1[3]
	slot0.staminaExchangeTimes = slot1[4]

	if not slot0.updateTimer then
		slot0.updateTimer = Timer.New(function ()
			slot0:UpdateStamina()
		end, 1, -1)

		slot0.updateTimer:Start()
		slot0.updateTimer.func()
	end
end

function slot0.Dispose(slot0)
	pg.DelegateInfo.Dispose(slot0)

	if slot0.updateTimer then
		slot0.updateTimer:Stop()
	end

	if slot0.transform then
		PoolMgr.GetInstance():ReturnUI("WorldStaminaRecoverUI", go(slot0.transform))
	end

	slot0:Clear()
end

function slot0.Reset(slot0)
	slot0.stamina = slot0:GetMaxStamina()
end

function slot0.ChangeStamina(slot0, slot1, slot2)
	slot0.stamina = slot1
	slot0.staminaExtra = slot2

	slot0:DispatchEvent(slot0.EventUpdateStamina)
end

function slot0.UpdateStamina(slot0)
	if math.floor((pg.TimeMgr.GetInstance():GetServerTime() - slot0.staminaLastRecoverTime) / pg.gameset.world_movepower_recovery_interval.key_value) > 0 then
		slot0.staminaLastRecoverTime = slot0.staminaLastRecoverTime + slot3 * slot1

		if slot0.stamina < slot0:GetMaxStamina() then
			slot0.stamina = math.min(slot0.stamina + slot3, slot0:GetMaxStamina())

			slot0:DispatchEvent(slot0.EventUpdateStamina)
		end
	end
end

function slot0.CheckUpdateShow(slot0)
	if slot0:IsShowing() then
		slot0:Show()
	end
end

function slot0.Show(slot0)
	slot1 = slot0.transform:Find("window/world_stamina_panel")

	setText(slot1:Find("content/tip_bg/tip"), i18n("world_stamina_recover", slot3))
	setText(slot1:Find("content/tip_bg/stamina/value"), slot0:GetTotalStamina())
	setActive(slot5, false)

	slot6 = slot0.transform:Find("window/button_container/custom_button_1")

	removeAllChildren(slot4)

	for slot11, slot12 in ipairs(slot7) do
		slot13 = cloneTplTo(slot5, slot4)

		updateDrop(slot13:Find("IconTpl"), slot12.drop)
		setText(slot13:Find("IconTpl/icon_bg/count"), (slot12.drop.count and slot12.drop.count) or "")
		setText(slot13:Find("name/Text"), shortenString(getText(slot13:Find("IconTpl/name")), 5))
		onToggle(slot0, slot13, function (slot0)
			if slot0 then
				slot0.preSelectIndex = slot0

				if slot0 > 1 then
					setText(slot2:Find("content/Text"), i18n("world_stamina_text2", slot3.name, slot3.stamina))
					onButton(slot0, "world_stamina_text2", function ()
						if slot0.drop.count == 0 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_item_1"))
						else
							slot0 = {}
							slot1 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

							if nowWorld:CheckResetProgress() and PlayerPrefs.GetString("world_stamina_reset_tip", "") ~= slot1 and nowWorld:GetResetWaitingTime() < 259200 and slot1:GetMaxStamina() < slot1:GetTotalStamina() + slot0.stamina then
								PlayerPrefs.SetString("world_stamina_reset_tip", slot1)
								table.insert(slot0, function (slot0)
									pg.MsgboxMgr.GetInstance():ShowMsgBox({
										content = i18n("world_stamina_resetwarning", slot0:GetMaxStamina()),
										onYes = slot0
									})
								end)
							end

							seriesAsync(slot0, function ()
								pg.m02:sendNotification(GAME.WORLD_ITEM_USE, {
									count = 1,
									itemID = slot0.drop.id,
									args = {}
								})
							end)
						end
					end, SFX_CONFIRM)
				elseif slot1 == 1 then
					setText(slot2:Find("content/Text"), i18n("world_stamina_text", slot3.cost, slot3.stamina, slot3.times, slot3.limit))
					onButton(slot0, "world_stamina_text", function ()
						if slot0.drop.count < slot0.cost then
							pg.TipsMgr.GetInstance():ShowTips(i18n("common_no_oil"))
						elseif slot0.times == 0 then
							pg.TipsMgr.GetInstance():ShowTips(i18n("buy_countLimit"))
						else
							slot0 = {}
							slot1 = pg.TimeMgr.GetInstance():CurrentSTimeDesc("%Y/%m/%d")

							if nowWorld:CheckResetProgress() and PlayerPrefs.GetString("world_stamina_reset_tip", "") ~= slot1 and nowWorld:GetResetWaitingTime() < 259200 and slot1:GetMaxStamina() < slot1:GetTotalStamina() + slot0.stamina then
								PlayerPrefs.SetString("world_stamina_reset_tip", slot1)
								table.insert(slot0, function (slot0)
									pg.MsgboxMgr.GetInstance():ShowMsgBox({
										content = i18n("world_stamina_resetwarning", slot0:GetMaxStamina()),
										onYes = slot0
									})
								end)
							end

							seriesAsync(slot0, function ()
								pg.m02:sendNotification(GAME.WORLD_STAMINA_EXCHANGE)
							end)
						end
					end, SFX_CONFIRM)
				end
			end
		end, SFX_PANEL)
	end

	if slot0.preSelectIndex then
		triggerToggle(slot4:GetChild(slot0.preSelectIndex - 1), true)
	else
		slot8 = 1

		for slot12 = 2, #slot7, 1 do
			if slot7[slot12].drop.count > 0 then
				slot8 = slot12

				break
			end
		end

		triggerToggle(slot4:GetChild(slot8 - 1), true)
	end

	setActive(slot0.transform, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.transform, false, {
		blurLevelCamera = true
	})
end

function slot0.Hide(slot0)
	slot0.preSelectIndex = nil

	setActive(slot0.transform, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.transform, slot0.UIMain)
end

function slot0.IsShowing(slot0)
	return (slot0.transform and isActive(slot0.transform)) or false
end

function slot0.GetStamina(slot0)
	return slot0.stamina
end

function slot0.GetMaxStamina(slot0)
	return pg.gameset.world_movepower_maxvalue.key_value
end

function slot0.GetExtraStamina(slot0)
	return slot0.staminaExtra
end

function slot0.GetTotalStamina(slot0)
	return slot0:GetStamina() + slot0:GetExtraStamina()
end

function slot0.GetStepStaminaCost(slot0)
	return pg.gameset.world_cell_cost_movepower.key_value
end

function slot0.GetMaxMoveStep(slot0)
	return math.floor(slot0:GetTotalStamina() / slot0:GetStepStaminaCost())
end

function slot0.ConsumeStamina(slot0, slot1)
	slot0.staminaExtra = slot0.staminaExtra - slot1

	if slot0.staminaExtra < 0 then
		slot0.stamina = slot0.stamina + slot0.staminaExtra
		slot0.staminaExtra = 0
	end

	slot0:DispatchEvent(slot0.EventUpdateStamina)
end

function slot0.GetExchangeData(slot0)
	return pg.gameset.world_supply_value.description[math.min(#pg.gameset.world_supply_value.description, slot0.staminaExchangeTimes + 1)][1], pg.gameset.world_supply_price.description[math.min(#pg.gameset.world_supply_price.description, slot0.staminaExchangeTimes + 1)][3], #pg.gameset.world_supply_price.description - slot0.staminaExchangeTimes, #pg.gameset.world_supply_price.description
end

function slot0.GetExchangeItems(slot0)
	slot1 = nowWorld:GetInventoryProxy()
	slot7.stamina, slot7.cost, slot7.times, slot7.limit = slot0:GetExchangeData()
	slot6 = {
		{
			drop = {
				id = PlayerConst.ResOil,
				type = DROP_TYPE_RESOURCE,
				count = getProxy(PlayerProxy):getRawData().oil
			},
			cost = slot3,
			stamina = slot2,
			times = slot4,
			limit = slot5
		}
	}

	for slot10, slot11 in ipairs(pg.gameset.world_supply_itemlist.description) do
		slot12 = WorldItem.New({
			id = slot11,
			count = slot1:GetItemCount(slot11)
		})

		table.insert(slot6, {
			cost = 1,
			drop = slot12,
			name = HXSet.hxLan(slot12:getConfig("name")),
			stamina = slot12:getItemStaminaRecover()
		})
	end

	return slot6
end

function slot0.ExchangeStamina(slot0, slot1, slot2)
	slot0.stamina = slot0.stamina + slot1

	if slot2 then
		slot0.staminaExchangeTimes = slot0.staminaExchangeTimes + 1
	end

	slot0:DispatchEvent(slot0.EventUpdateStamina)
	slot0:CheckUpdateShow()
end

function slot0.GetDisplayStanima(slot0)
	return slot0:GetTotalStamina()
end

return slot0
