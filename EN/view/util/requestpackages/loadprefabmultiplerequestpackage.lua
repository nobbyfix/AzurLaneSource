slot0 = class("LoadPrefabMultipleRequestPackage", import(".RequestPackage"))

slot0.__call = function (slot0)
	if slot0.stopped then
		return
	end

	ResourceMgr.Inst:getAssetAsync(slot0.path, slot0.name, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
		if slot0.stopped then
			return
		end

		if next(slot0.onLoaded) then
			for slot4, slot5 in ipairs(slot0.onLoaded) do
				slot5(Object.Instantiate(slot0))
			end
		end
	end), true, false)

	return slot0
end

slot0.Ctor = function (slot0, slot1, slot2, slot3)
	slot0.path = slot1
	slot0.name = slot2
	slot0.onFinish = slot3
	slot0.onLoaded = {}
end

slot0.AddRequest = function (slot0, slot1)
	table.insert(slot0.onLoaded, slot1)
end

slot0.RemoveRequest = function (slot0, slot1)
	table.removebyvalue(slot0.onLoaded, slot1)
end

return slot0
