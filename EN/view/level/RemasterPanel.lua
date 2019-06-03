slot0 = class("RemasterPanel", import("..base.BasePanel"))

function slot0.init(slot0)
	uv0.super.init(slot0)

	slot0.bg = slot0:findTF("bg")
	slot0.content = slot0:findTF("list/content")
	slot0.item = slot0.content:Find("item")
	slot0.numsTxt = slot0:findTF("nums/text")
	slot0.helpBtn = slot0:findTF("help")

	setActive(slot0.item, false)

	slot0.onItem = nil
	slot0.onCancel = nil
	slot0.exToggle = slot0:findTF("toggles/EX")
	slot0.spToggle = slot0:findTF("toggles/SP")
	slot0.getRemasterTF = slot0:findTF("getBtn/state_before")
	slot0.gotRemasterTF = slot0:findTF("getBtn/state_after")
end

function slot0.set(slot0, slot1, slot2, slot3)
	slot0.templates = slot1
	slot0.tickets = slot2

	slot0:flush(slot3)
end

function slot0.flush(slot0, slot1)
	slot2 = pg.TimeMgr.GetInstance()

	UIItemList.New(slot0.content, slot0.item).make(slot3, function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			local function slot3(slot0, slot1)
				setActive(slot3, false)
				setActive(slot4, false)
				setActive(slot0:Find("wait"), false)

				if not uv0.temp[slot1] then
					setActive(slot5, true)
					onButton(uv0, slot5, function ()
						pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_do_not_open"))
					end, SFX_PANEL)
				elseif uv1:GetServerTime() < uv1:parseTimeFromConfig(slot2.time[2], true) or uv1:parseTimeFromConfig(slot2.time[3], true) < uv1:GetServerTime() then
					setActive(slot4, true)
					onButton(uv0, slot4, function ()
						pg.TipsMgr.GetInstance():ShowTips(i18n("levelScene_remaster_do_not_open"))
					end, SFX_PANEL)
				else
					setActive(slot3, true)
					GetImageSpriteFromAtlasAsync("activitybanner/" .. slot2.bg, "", slot3)
					setSlider(slot3:Find("progress"), 0, 1, #_.filter(pg.memory_group[slot2.memory_group].memories, function (slot0)
						return pg.StoryMgr.GetInstance():IsPlayed(pg.memory_template[slot0].story)
					end) / #pg.memory_group[slot2.memory_group].memories)
					setText(slot3:Find("progress_text"), math.floor(#_.filter(pg.memory_group[slot2.memory_group].memories, function (slot0)
						return pg.StoryMgr.GetInstance().IsPlayed(pg.memory_template[slot0].story)
					end) / #pg.memory_group[slot2.memory_group].memories * 100) .. "%")
					setText(slot3:Find("index"), slot1 < 10 and "0" .. slot1 or slot1)
					onButton(uv0, slot3, function ()
						uv0.onItem(uv1)
					end, SFX_PANEL)
				end
			end

			slot3(slot2:Find("left"), slot1 * 2 + 1)
			slot3(slot2:Find("right"), slot1 * 2 + 2)
		end
	end)
	setText(slot0.numsTxt, slot0.tickets .. "/" .. pg.gameset.reactivity_ticket_max.key_value)
	onButton(slot0, slot0.bg, function ()
		uv0.onCancel()
	end, SFX_CANCEL)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = i18n("levelScene_remaster_help_tip")
		})
	end, SFX_PANEL)

	for slot8, slot9 in ipairs(slot4) do
		onToggle(slot0, slot9, function (slot0)
			if slot0 then
				uv0.temp = _.filter(uv0.templates, function (slot0)
					return slot0.activity_type == uv0
				end)

				uv2:align(math.max(math.ceil(#uv0.temp / 2), 2))
			end
		end, SFX_PANEL)
	end

	triggerToggle(slot4[slot1 or 1], true)

	if getProxy(ChapterProxy).remasterDailyCount > 1 then
		SetActive(slot0.getRemasterTF, false)
		SetActive(slot0.gotRemasterTF, true)
	else
		SetActive(slot0.getRemasterTF, true)
		SetActive(slot0.gotRemasterTF, false)
		onButton(slot0, slot0.getRemasterTF, function ()
			if pg.gameset.reactivity_ticket_max.key_value < uv0.remasterTickets + pg.gameset.reactivity_ticket_daily.key_value then
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					content = i18n("tack_tickets_max_warning", math.max(pg.gameset.reactivity_ticket_max.key_value - uv0.remasterTickets, 0)),
					onYes = function ()
						uv0:emit(LevelMediator2.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN)
					end
				})

				return
			end

			uv1:emit(LevelMediator2.ON_CLICK_RECEIVE_REMASTER_TICKETS_BTN)
		end, SFX_PANEL)
	end
end

return slot0
