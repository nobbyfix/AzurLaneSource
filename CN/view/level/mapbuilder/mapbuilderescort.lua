slot1 = class("MapBuilderEscort", import(".MapBuilder"))

slot1.Ctor = function (slot0, ...)
	slot0.super.Ctor(slot0, ...)

	slot0.itemList = nil
end

slot1.GetType = function (slot0)
	return slot0.TYPEESCORT
end

slot1.OnInit = function (slot0)
	slot0.tpl = slot0.tf:Find("level_tpl")
	slot0.itemHolder = slot0.tf:Find("items")
end

slot1.Update = function (slot0)
	slot0.map.pivot = Vector2(0.5, 0.5)
	slot0.float.pivot = Vector2(0.5, 0.5)
	slot3 = 1

	if slot0.map.rect.width / slot0.map.rect.height < slot0.tfParent.rect.width / slot0.tfParent.rect.height then
		slot0.tf.localScale = Vector3(slot0.tfParent.rect.width / 1280, , 1)
	else
		slot0.tf.localScale = Vector3(slot0.tfParent.rect.height / 720, , 1)
	end
end

slot1.UpdateEscortInfo = function (slot0)
	slot1 = slot0.data
	slot2 = getProxy(ChapterProxy)

	setText(slot0.sceneParent.escortBar:Find("times/text"), slot2:getMaxEscortChallengeTimes() - slot2.escortChallengeTimes .. "/" .. slot3)
	onButton(slot0.sceneParent, slot0.sceneParent.mapHelpBtn, function ()
		slot0:InvokeParent("HandleShowMsgBox", {
			type = MSGBOX_TYPE_HELP,
			helps = i18n("levelScene_escort_help_tip")
		})
	end, SFX_PANEL)
end

slot1.UpdateMapItems = function (slot0)
	slot0.super.UpdateMapItems(slot0)
	slot0:UpdateEscortInfo()
	setActive(slot0.sceneParent.escortBar, true)
	setActive(slot0.sceneParent.mapHelpBtn, true)

	slot3 = _.detect(getProxy(ChapterProxy).escortMaps, function (slot0)
		return slot0.id == map.id
	end).chapters

	if not slot0.itemList then
		UIItemList.New(slot0.itemHolder, slot0.tpl):make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot1:UpdateEscortItem(slot2, slot0[slot1 + 1].escortId, slot0[slot1 + 1].chapter)
			end
		end)

		slot0.itemList = UIItemList.New(slot0.itemHolder, slot0.tpl)
	end

	slot4:align(#slot3)
end

slot1.UpdateEscortItem = function (slot0, slot1, slot2, slot3)
	slot1.name = "chapter_" .. slot3.id
	slot1.anchoredPosition = Vector2(GetComponent(slot0.map, "Image").preferredWidth * (tonumber(pg.escort_template[slot2].pos_x) - 0.5), GetComponent(slot0.map, "Image").preferredHeight * (tonumber(pg.escort_template[slot2].pos_y) - 0.5))

	setActive(slot1:Find("fighting"), getProxy(ChapterProxy).getActiveChapter(slot5) and slot6.id == slot3.id)
	slot0:DeleteTween("fighting" .. slot3.id)

	if slot9 then
		setImageAlpha(slot8, 1)
		slot0:RecordTween("fighting" .. slot3.id, LeanTween.alpha(slot8, 0, 0.5):setEase(LeanTweenType.easeInOutSine):setLoopPingPong().uniqueId)
	end

	GetImageSpriteFromAtlasAsync("levelmap/mapquad/" .. slot4.pic, "", slot1, true)

	slot10 = slot1:Find("anim")
	slot13 = ({
		Color.green,
		Color.yellow,
		Color.red
	})[table.indexof(pg.gameset.gardroad_count.description[1], slot2) or 1]

	for slot18 = 0, slot10:GetComponentsInChildren(typeof(Image)).Length - 1, 1 do
		slot14[slot18].color = slot13
	end

	setImageColor(slot1, slot13)
	onButton(slot0.sceneParent, slot1, function ()
		slot0:InvokeParent("TrySwitchChapter", slot0)
	end, SFX_PANEL)
end

slot1.OnHide = function (slot0)
	setActive(slot0.sceneParent.escortBar, false)
	setActive(slot0.sceneParent.mapHelpBtn, false)
end

slot1.OnDestroy = function (slot0)
	slot0.itemList = nil
end

return slot1
