slot0 = class("BundlePackage")
slot1 = ResourceMgr.Inst

slot0.Ctor = function (slot0, slot1)
	slot0.path = slot1
	slot0.items = {}
	slot0.requests = {}
end

slot0.Get = function (slot0, slot1)
	return slot0.items[slot1]
end

slot0.Set = function (slot0, slot1, slot2)
	slot0.items[slot1] = slot2
end

slot0.Add = function (slot0, slot1, slot2, slot3, slot4)
	if not slot0.items[slot1] then
		if slot2 then
			if not slot0.requests[slot1] then
				slot0.requests[slot1] = {
					slot4
				}

				slot0:getAssetAsync(slot0.path, slot1, slot3, UnityEngine.Events.UnityAction_UnityEngine_Object(function (slot0)
					if not slot0.stopped then
						slot0.items[] = slot0

						for slot4, slot5 in ipairs(slot0.requests[ipairs]) do
							slot5(slot0)
						end

						slot0.requests[] = nil
					else
						slot2:ClearBundleRef(slot3, true, false)
					end
				end), false, false)

				return
			end

			table.insert(slot0.requests[slot1], slot4)
		else
			slot0.items[slot1] = slot0:getAssetSync(slot0.path, slot1, slot3, false, false)

			slot4(slot0.items[slot1])
		end
	else
		slot4(slot0.items[slot1])
	end
end

slot0.Remove = function (slot0, slot1)
	if table.removebyvalue(slot0.items, slot1) then
		slot0:ClearBundleRef(slot0.path, true, false)
	end

	return slot2
end

slot0.GetAmount = function (slot0)
	return table.nums(slot0.items)
end

slot0.Clear = function (slot0)
	for slot4, slot5 in pairs(slot0.items) do
		slot0:ClearBundleRef(slot0.path, true, false)
	end

	table.clear(slot0)

	slot0.stopped = true
end

return slot0
