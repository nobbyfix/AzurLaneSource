slot0 = class("BundleLoaderPort")
slot1 = ResourceMgr.Inst

slot0.Ctor = function (slot0, slot1)
	slot0.pool = slot1 or BundlePool.New()

	slot0.pool:Bind(slot0)

	slot0._returnRequest = {}
end

slot0.GetPrefab = function (slot0, slot1, slot2, slot3, slot4)
	slot2 = slot2 or ""

	if slot4 and slot0._returnRequest[slot4] then
		slot0:ClearRequest(slot4)
	end

	slot5 = slot0.pool:GetPrefab(slot1, slot2, true, function (slot0)
		if slot0 then
			slot1._returnRequest[slot0] = nil
		end

		if slot2 and not slot1.stopped then
			slot2(slot0)
		end
	end)

	if slot4 then
		slot0._returnRequest[slot4] = slot5
	end
end

slot0.ReturnPrefab = function (slot0, slot1, slot2, slot3, slot4)
	slot0.pool:ReturnPrefab(slot1, slot2, slot3, slot4)
end

slot0.GetSpine = function (slot0, slot1, slot2, slot3)
	if not slot1 or #slot1 < 0 then
		return
	end

	if slot3 and slot0._returnRequest[slot3] then
		slot0:ClearRequest(slot3)
	end

	slot4 = slot0.pool:GetSpineChar(slot1, true, function (slot0)
		if slot0 then
			slot1._returnRequest[slot0] = nil
		end

		if slot2 and not slot1.stopped then
			slot2(slot0)
		end
	end)

	if slot3 then
		slot0._returnRequest[slot3] = slot4
	end
end

slot0.ReturnSpine = function (slot0, slot1, slot2)
	slot0.pool:ReturnSpineChar(slot1, go(slot2))
end

slot0.GetPainting = function (slot0, slot1, slot2, slot3)
	if not slot1 or #slot1 < 0 then
		return
	end

	if slot3 and slot0._returnRequest[slot3] then
		slot0:ClearRequest(slot3)
	end

	slot4 = slot0.pool:GetPainting(slot1, true, function (slot0)
		if slot0 then
			slot1._returnRequest[slot0] = nil
		end

		if slot2 and not slot1.stopped then
			slot2(slot0)
		end
	end)

	if slot3 then
		slot0._returnRequest[slot3] = slot4
	end
end

slot0.ReturnPainting = function (slot0, slot1, slot2)
	slot0.pool:ReturnPainting(slot1, go(slot2))
end

slot0.GetSprite = function (slot0, slot1, slot2, slot3, slot4)
	slot3:GetComponent(typeof(Image)).enabled = false
	slot2 = slot2 or ""

	if slot0._returnRequest[tf(slot3)] then
		slot0:ClearRequest(slot6)
	end

	slot0._returnRequest[slot6] = slot0.pool:GetSprite(slot1, slot2, true, function (slot0)
		slot0._returnRequest[] = nil
		slot0._returnRequest.enabled = true
		slot2.sprite = slot0

		if nil then
			slot2:SetNativeSize()
		end
	end)
end

slot0.DestroyPlural = function (slot0, slot1, slot2)
	slot0.pool:DestroyPlural(slot1, slot2)
end

slot0.DestroyAtlas = function (slot0, slot1)
	slot0.pool:DestroyPack(slot1)
end

slot0.GetOffSpriteRequest = function (slot0, slot1)
	slot0:ClearRequest(tf(slot1))
end

slot0.LoadPrefab = function (slot0, slot1, slot2, slot3, slot4)
	slot2 = slot2 or ""
	slot5 = false

	if slot3 then
		if slot0._returnRequest[slot3] then
			slot0:ClearRequest(slot3)
		end

		slot0._returnRequest[slot3] = function ()
			slot0 = true
		end
	end

	slot0:getAssetAsync(slot1, slot2, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
		if slot0 or slot1.stopped then
			return
		end

		slot0(Object.Instantiate(slot0))
	end), true, false)
end

slot0.LoadSprite = function (slot0, slot1, slot2, slot3, slot4)
	slot3:GetComponent(typeof(Image)).enabled = false
	slot2 = slot2 or ""

	if slot0._returnRequest[tf(slot3)] then
		slot0:ClearRequest(slot6)
	end

	slot7 = false

	slot0._returnRequest[slot6] = function ()
		slot0 = true
	end

	slot0:getAssetAsync(slot1, slot2, typeof(Sprite), UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
		if slot0 then
			return
		end

		slot1._returnRequest[slot2] = nil
		slot3.enabled = true
		slot3.sprite = slot0

		if slot4 then
			slot3:SetNativeSize()
		end
	end), true, false)
end

slot0.ClearRequest = function (slot0, slot1)
	if slot0._returnRequest[slot1] then
		slot0._returnRequest[slot1]()

		slot0._returnRequest[slot1] = nil
	end
end

slot0.ClearRequests = function (slot0)
	for slot4, slot5 in pairs(slot0._returnRequest) do
		slot5()

		slot0._returnRequest[slot4] = nil
	end
end

slot0.Clear = function (slot0)
	slot0:ClearRequests()
	slot0.pool:UnBind()
	table.clear(slot0)

	slot0.stopped = true
end

return slot0
