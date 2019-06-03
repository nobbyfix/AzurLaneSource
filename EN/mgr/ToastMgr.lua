pg = pg or {}
pg.ToastMgr = singletonClass("ToastMgr")
slot1 = require("Mgr/Pool/PoolPlural")
pg.ToastMgr.TYPE_ATTIRE = "Attire"
pg.ToastMgr.TYPE_TECPOINT = "Tecpoint"
pg.ToastMgr.TYPE_TROPHY = "Trophy"
pg.ToastMgr.ToastInfo = {
	[pg.ToastMgr.TYPE_ATTIRE] = {
		Attire = "attire_tpl"
	},
	[pg.ToastMgr.TYPE_TECPOINT] = {
		Buff = "buff_tpl",
		Point = "point_tpl"
	},
	[pg.ToastMgr.TYPE_TROPHY] = {
		Trophy = "trophy_tpl"
	}
}

function pg.ToastMgr.Init(slot0, slot1)
	PoolMgr.GetInstance():GetUI("ToastUI", true, function (slot0)
		uv0._go = slot0

		uv0._go:SetActive(false)

		uv0._tf = uv0._go.transform
		uv0.container = uv0._tf:Find("container")

		uv0._go.transform:SetParent(pg.UIMgr:GetInstance().OverlayMain.transform, false)

		uv0.pools = {}
		slot2 = {}

		for slot6, slot7 in pairs(uv1.ToastInfo) do
			for slot11, slot12 in pairs(slot7) do
				slot2[slot11 .. "Tpl"] = slot12
			end
		end

		for slot6, slot7 in pairs(slot2) do
			setActive(uv0._tf:Find("resources/" .. slot7), false)

			uv0.pools[slot6] = uv2.New(uv0._tf.Find("resources/" .. slot7).gameObject, 5)
		end

		uv0:ResetUIDandHistory()

		if uv3 then
			uv3()
		end
	end)
end

function pg.ToastMgr.ResetUIDandHistory(slot0)
	slot0.completedJob = 0
	slot0.actionJob = 0
	slot0.buffer = {}
end

function pg.ToastMgr.ShowToast(slot0, slot1, slot2)
	table.insert(slot0.buffer, {
		state = 0,
		type = slot1,
		info = slot2
	})
	setActive(slot0._tf, true)

	if #slot0.buffer == 1 or slot0.buffer[#slot0.buffer].state >= 2 then
		slot0:Toast()
	end
end

function pg.ToastMgr.Toast(slot0)
	if slot0.actionJob >= #slot0.buffer then
		return
	end

	if slot0.buffer[slot0.actionJob] and slot0.buffer[slot0.actionJob].state < 2 then
		return
	elseif slot0.buffer[slot0.actionJob] and slot0.buffer[slot0.actionJob].type ~= slot0.buffer[slot0.actionJob + 1].type and slot0.buffer[slot0.actionJob].state < 3 then
		return
	end

	slot0.actionJob = slot0.actionJob + 1
	slot2 = slot0.actionJob
	slot0.buffer[slot0.actionJob].state = 1

	slot0["Update" .. slot0.buffer[slot0.actionJob].type](slot0, slot0.buffer[slot0.actionJob], function ()
		uv0.state = 2

		uv1:Toast()
	end, function ()
		uv0.state = 3

		if uv1.buffer[uv2 + 1] and uv1.buffer[uv2 + 1].state < 1 then
			uv1:Toast()
		end

		uv1.completedJob = uv1.completedJob + 1

		if uv1.completedJob >= #uv1.buffer then
			uv1:ResetUIDandHistory()
			setActive(uv1._tf, false)

			for slot3, slot4 in pairs(uv1.pools) do
				slot4:ClearItems(false)
			end
		end
	end)
end

function pg.ToastMgr.GetAndSet(slot0, slot1, slot2)
	slot3 = slot0.pools[slot1 .. "Tpl"]:Dequeue()

	setActive(slot3, true)
	setParent(slot3, slot2)
	slot3.transform:SetAsLastSibling()

	return slot3
end

function pg.ToastMgr.UpdateAttire(slot0, slot1, slot2, slot3)
	slot4 = slot0:GetAndSet(slot1.type, slot0.container)
	slot5 = slot4:GetComponent(typeof(DftAniEvent))

	slot5:SetTriggerEvent(function (slot0)
		if uv0 then
			uv0()
		end

		uv1:SetTriggerEvent(nil)
	end)
	slot5:SetEndEvent(function (slot0)
		setActive(uv0, false)
		uv1.pools[uv2.type .. "Tpl"]:Enqueue(uv0)
		uv3:SetEndEvent(nil)

		if uv4 then
			uv4()
		end
	end)
	slot4:GetComponent(typeof(Animation)):Play("attire")
	setActive(slot4.transform:Find("bg/icon_frame"), slot1.info.getType(slot6) == AttireConst.TYPE_ICON_FRAME)
	setActive(slot4.transform:Find("bg/chat_frame"), slot7 == AttireConst.TYPE_CHAT_FRAME)
	setText(slot4.transform:Find("bg/Text"), slot6:getConfig("name"))
end

pg.ToastMgr.FADE_TIME = 0.4
pg.ToastMgr.FADE_OUT_TIME = 1
pg.ToastMgr.SHOW_TIME = 1.5
pg.ToastMgr.DELAY_TIME = 0.3

function pg.ToastMgr.UpdateTecpoint(slot0, slot1, slot2, slot3)
	slot7 = slot1.info.attr
	slot8 = slot1.info.value
	GetComponent(slot0:GetAndSet("Point", slot0.container).transform, "CanvasGroup").alpha = 0

	setText(findTF(slot9, "PointText"), "+" .. slot1.info.point)

	slot10 = {}

	if slot1.info.typeList then
		for slot14 = 1, #slot6, 1 do
			slot15 = slot0:GetAndSet("Buff", slot0.container)
			GetComponent(slot15.transform, "CanvasGroup").alpha = 0

			setImageSprite(slot15.transform:Find("TypeImg").transform, slot20)
			setText(slot15.transform:Find("AttrText").transform, AttributeType.Type2Name(pg.attribute_info_by_type[slot7].name))
			setText(slot15.transform:Find("ValueText").transform, "+" .. slot8)

			slot10[slot14] = go(slot15)
		end
	end

	function slot11()
		if uv0 then
			uv0()
		end

		if uv1 then
			uv1()
		end
	end

	slot13 = GetComponent(slot9, "CanvasGroup")

	function slot15()
		LeanTween.moveX(rtf(uv0), 0, uv1.FADE_OUT_TIME)
		LeanTween.value(uv0, 1, 0, uv1.FADE_OUT_TIME):setOnUpdate(System.Action_float(uv2)):setOnComplete(System.Action(function ()
			setActive(uv0, false)
			uv1.pools.PointTpl:Enqueue(uv0)

			if not uv2 then
				uv3()
			end
		end))
	end

	LeanTween.value(slot12, 0, 1, uv0.FADE_TIME):setOnUpdate(System.Action_float(slot14)):setOnComplete(System.Action(function ()
		LeanTween.delayedCall(uv0, uv1.SHOW_TIME, System.Action(uv2))
	end))

	function itemDisplay(slot0, slot1, slot2)
		slot3 = GetComponent(slot0.transform, "CanvasGroup")

		function slot5()
			LeanTween.moveX(rtf(uv0), 0, uv1.FADE_OUT_TIME)
			LeanTween.value(uv0, 1, 0, uv1.FADE_OUT_TIME):setOnUpdate(System.Action_float(uv2)):setOnComplete(System.Action(function ()
				setActive(uv0, false)
				uv1.pools.BuffTpl:Enqueue(uv0)

				if uv2 then
					uv3()
				end
			end))
		end

		LeanTween.value(slot0, 0, 1, uv0.FADE_TIME):setOnUpdate(System.Action_float(slot4)):setOnComplete(System.Action(function ()
			LeanTween.delayedCall(uv0, uv1.SHOW_TIME + (uv1.FADE_OUT_TIME - uv1.DELAY_TIME) * uv2, System.Action(uv3))
		end))
	end

	for slot19, slot20 in ipairs(slot10) do
		LeanTween.delayedCall(slot12, slot19 * uv0.DELAY_TIME, System.Action(function ()
			itemDisplay(uv0, uv1, uv1 == #uv2)
		end))
	end
end

function pg.ToastMgr.UpdateTrophy(slot0, slot1, slot2, slot3)
	playSoundEffect(slot1.info.sound or SFX_UI_TIP)

	slot4 = slot0:GetAndSet(slot1.type, slot0.container)

	LoadImageSpriteAsync("medal/s_" .. pg.medal_template[slot1.info.id].icon, slot4.transform:Find("content/icon"), true)
	setText(slot4.transform:Find("content/name"), pg.medal_template[slot1.info.id].name)
	setText(slot4.transform:Find("content/label"), i18n("trophy_achieved"))

	slot6 = slot4.transform:Find("content")
	slot6.anchoredPosition = Vector2(-550, 0)

	LeanTween.moveX(rtf(slot6), 0, 0.5)
	LeanTween.moveX(rtf(slot6), -550, 0.5):setDelay(5):setOnComplete(System.Action(function ()
		setActive(uv0, false)
		uv1.pools[uv2.type .. "Tpl"]:Enqueue(uv0)

		if uv3 then
			uv3()
		end
	end))

	if slot2 then
		slot2()
	end
end

function pg.ToastMgr.Dispose(slot0)
	setActive(slot0._tf, false)
	slot0:ResetUIDandHistory()

	for slot4, slot5 in paris(slot0.pools) do
		slot5:Clear(false)
	end
end
