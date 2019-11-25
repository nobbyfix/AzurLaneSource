slot0 = class("SpineCellView")

slot0.Ctor = function (slot0, slot1)
	slot0.go = slot1
	slot0.tf = slot0.go.transform
	slot0.tfShip = slot0.tf:Find("ship")
	slot0.validate = true
	slot0._attachmentList = {}
end

slot0.getOrder = function (slot0)
	return 0
end

slot0.getLine = function (slot0)
	return slot0.line
end

slot0.setLine = function (slot0, slot1)
	slot0.line = {
		row = slot1.row,
		column = slot1.column
	}
end

slot0.getPrefab = function (slot0)
	return slot0.prefab
end

slot0.setPrefab = function (slot0, slot1)
	slot0.prefab = slot1
end

slot0.getAction = function (slot0)
	return slot0.action
end

slot0.setAction = function (slot0, slot1)
	slot0.action = slot1

	if slot0.anim then
		slot0.anim:SetAction(slot1, 0)
	end
end

slot0.getModel = function (slot0)
	return slot0.model
end

slot0.setModel = function (slot0, slot1)
	slot1.transform.name = "model"
	slot1.transform.GetComponent(slot2, "SkeletonGraphic").raycastTarget = false

	slot1.transform.SetParent(slot2, slot0.tfShip, false)

	slot1.transform.localPosition = Vector3.zero
	slot1.transform.localScale = Vector3(0.4, 0.4, 1)

	pg.ViewUtils.SetLayer(slot2, Layer.UI)

	slot0.model = slot1
	slot0.anim = slot1.transform.GetComponent(slot2, "SpineAnimUI")

	slot0:setAction(slot0:getAction())
end

slot0.setAttachment = function (slot0, slot1)
	slot0._attachmentInfo = slot1
end

slot0.loadSpine = function (slot0, slot1)
	if slot0.lastPrefab == slot0:getPrefab() then
		if not IsNil(slot0.model) and slot1 then
			slot1()
		end

		return
	end

	slot0:unloadSpine()

	function slot3()
		for slot3, slot4 in pairs(slot0._attachmentInfo) do
			if slot4.attachment_combat_ui[1] ~= "" then
				ResourceMgr.Inst:getAssetAsync("Effect/" .. slot5, slot5, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
					if slot0 ~= slot1:getPrefab() or not slot1.validate then
						Object.Destroy(slot0)

						return
					end

					slot1 = Object.Instantiate(slot0)
					slot1._attachmentList[] = slot1

					tf(slot1):SetParent(tf(model))

					tf(slot1).localPosition = BuildVector3(slot3.attachment_combat_ui[2])
				end), true, true)
			end
		end
	end

	PoolMgr.GetInstance():GetSpineChar(slot0:getPrefab(), true, function (slot0)
		if slot0 ~= slot1:getPrefab() or not slot1.validate then
			PoolMgr.GetInstance():ReturnSpineChar(slot0, slot0)

			return
		end

		slot1:setModel(slot0)

		if slot1 then
			slot2()
		end

		if slot1._attachmentInfo then
			slot3()
		end

		slot1:OnLoadSpine()
	end)

	slot0.lastPrefab = slot0.getPrefab()
end

slot0.OnLoadSpine = function (slot0)
	return
end

slot0.unloadSpine = function (slot0)
	if slot0.prefab and slot0.model then
		slot0:SetSpineVisible(true)
		slot0:setAction(ChapterConst.ShipIdleAction)
		slot0:ClearAttachments()
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)

		slot0.model = nil
	end
end

slot0.ClearAttachments = function (slot0)
	for slot4, slot5 in pairs(slot0._attachmentList) do
		Object.Destroy(slot5)
	end

	slot0._attachmentList = {}
end

slot0.SetSpineVisible = function (slot0, slot1)
	if not slot0.model then
		return
	end

	slot2:GetComponent("SkeletonGraphic").color = Color.New(1, 1, 1, (slot1 and 1) or 0)
end

slot0.clear = function (slot0)
	slot0:unloadSpine()

	slot0.prefab = nil
	slot0.anim = nil
	slot0.validate = nil
end

return slot0
