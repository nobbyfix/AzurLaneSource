slot0 = class("EnemyEggCellView", import("view.level.cell.StaticCellView"))
slot1 = import("view.util.LoadPrefabRequestPackage")
slot2 = import("view.util.LoadReferenceRequestPackage")

slot0.Ctor = function (slot0, slot1)
	slot0.super.Ctor(slot0, slot1)

	slot0.config = nil
	slot0.chapter = nil
	slot0._live2death = nil
	slot0._loadedSpine = nil
	slot0._loadedSpineName = nil
end

slot0.SetTpl = function (slot0, slot1, slot2)
	slot0._aliveTpl = slot1
	slot0._deadTpl = slot2
end

slot0.Update = function (slot0)
	slot2 = slot0.config
	slot3 = slot0.info.row
	slot4 = slot0.info.column

	if slot0.info.attachment == ChapterConst.AttachAmbush and slot1.flag == 2 then
	elseif slot1.flag == 0 then
		if slot0:UpdateGO(slot0._aliveTpl) then
			if slot2.add_icon and slot6 ~= "" then
				setActive(findTF(slot0.tf, "labels/" .. slot6), true)
			end

			if slot2.icon_type == 1 then
				slot0.tf.anchoredPosition = Vector2(0, 0)
				slot7 = slot0.tf:Find("icon")

				if slot2.effect_prefab and #slot8 > 0 then
					slot0:LoadPrefab("effect/" .. slot8, slot8, function (slot0)
						slot0.transform:SetParent(slot0, false)

						slot0.transform.localScale = slot0.transform.localScale
					end)
				end

				slot0:LoadSprite("enemies/" .. slot2.icon, nil, slot7)
				setText(findTF(slot0.tf, "lv/Text"), slot2.level)
				setActive(findTF(slot0.tf, "titleContain/bg_s"), ChapterConst.EnemySize[slot2.type] == 1 or not ChapterConst.EnemySize[slot2.type])
				setActive(findTF(slot0.tf, "titleContain/bg_m"), ChapterConst.EnemySize[slot2.type] == 2)
				setActive(findTF(slot0.tf, "titleContain/bg_h"), ChapterConst.EnemySize[slot2.type] == 3)
				setActive(findTF(slot0.tf, "titleContain/bg_boss"), ChapterConst.EnemySize[slot2.type] == 99)
			else
				slot0.tf.anchoredPosition = Vector2(0, 0)

				SetActive(findTF(slot0.tf, "icon"), false)
				slot0:LoadSpine(slot2.icon, function (slot0)
					slot0:ReturnSpine()

					slot0.transform.localScale = Vector3(0.4 * slot0.ReturnSpine.scale * 0.01, 0.4 * slot0.ReturnSpine.scale * 0.01, 1)

					slot0.transform:GetComponent("SpineAnimUI"):SetAction(ChapterConst.ShipIdleAction, 0)

					slot0.transform:GetComponent("SkeletonGraphic").raycastTarget = false

					slot0.transform:SetParent(slot0.tf, false)
					slot0.transform:SetAsFirstSibling()

					slot0._loadedSpine = slot0
					slot0._loadedSpineName = slot1.icon
				end)
				setActive(findTF(slot0.tf, "lv"), false)
				setActive(findTF(slot0.tf, "titleContain"), false)
			end

			if findTF(slot0.tf, "random_buff_container") and slot2 and #slot2.bufficon > 0 then
				setActive(slot7, true)
				slot0:AlignListContainer(slot7, #slot2.bufficon)

				slot8 = 1

				for slot12, slot13 in ipairs(slot2.bufficon) do
					if #slot13 > 0 then
						GetImageSpriteFromAtlasAsync("ui/levelmainscene_atlas", slot13, slot7:GetChild(slot8 - 1))

						slot8 = slot8 + 1
					end
				end
			elseif slot7 then
				setActive(slot7, false)
			end
		end

		setActive(findTF(slot0.tf, (slot1.attachment == ChapterConst.AttachBoss and "effect_found_boss") or "effect_found"), slot1.trait == ChapterConst.TraitVirgin)

		if slot1.trait == ChapterConst.TraitVirgin then
			playSoundEffect(SFX_UI_WEIGHANCHOR_ENEMY)
		end

		setActive(findTF(slot0.tf, "fighting"), slot0.chapter:existFleet(FleetType.Normal, slot3, slot4))

		if slot2.icon_type == 1 then
			slot0.tf:GetComponent("Animator").enabled = slot1.data > 0
		end

		setActive(findTF(slot0.tf, "damage_count"), slot1.data > 0)
	elseif slot1.flag == 1 and slot0:UpdateGO(slot0._deadTpl) and slot1.attachment ~= ChapterConst.AttachAmbush then
		if slot2.icon_type == 1 then
			slot0.tf.anchoredPosition = Vector2(0, 10)

			slot0:LoadSprite("enemies/" .. slot2.icon .. "_d_" .. slot6, "", slot0.tf:Find("icon"))
			setActive(slot0.tf:Find("effect_not_open"), false)
			setActive(slot0.tf:Find("effect_open"), false)
		end

		setActive(slot0.tf:Find("huoqiubaozha"), slot0._live2death)

		slot0._live2death = nil
	end
end

slot0.UpdateGO = function (slot0, slot1)
	if slot1 and slot0._currentTpl ~= slot1 then
		if slot0._currentTpl == slot0._aliveTpl and slot1 == slot0._deadTpl then
			slot0._live2death = true
		end

		slot0:DestroyGO()

		slot0._currentTpl = slot1

		if slot1 == slot0._deadTpl and (slot0.info.attachment == ChapterConst.AttachAmbush or slot0.info.icon_type == 2) then
			return true
		end

		slot0.go = Instantiate(slot1)
		slot0.go.name = "enemy_" .. slot0.info.attachmentId

		setActive(slot0.go, true)
		setParent(slot0.go, slot0.parent)

		slot0.tf = slot0.go.transform

		return true
	end

	return false
end

slot0.ReturnSpine = function (slot0)
	if slot0._loadedSpine then
		pg.PoolMgr.GetInstance():ReturnSpineChar(slot0._loadedSpineName, slot0._loadedSpine)

		slot0._loadedSpine = nil
		slot0._loadedSpineName = nil
	end
end

slot0.DestroyGO = function (slot0)
	slot0:ReturnSpine()
	slot0.super.DestroyGO(slot0)
end

slot0.Clear = function (slot0)
	slot0._aliveTpl = nil
	slot0._deadTpl = nil
	slot0._live2death = nil
	slot0.chapter = nil

	slot0.super.Clear(slot0)
end

return slot0
