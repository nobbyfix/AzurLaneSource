slot0 = class("FlowNode")
slot1 = TryCall

slot0.Ctor = function (slot0)
	slot0.childs = nil
	slot0.active = true
end

slot0.Update = function (slot0, slot1)
	if not slot0.active then
		return
	end

	slot0(slot0.OnUpdate(), nil, slot0, slot1)

	if slot0.childs then
		for slot5, slot6 in pairs(slot0.childs) do
			slot6:Update(slot1)
		end
	end
end

slot0.AddChild = function (slot0, slot1)
	slot0.childs = slot0.childs or {}

	table.insert(slot0.childs, slot1)
end

slot0.RemoveChild = function (slot0, slot1)
	if slot0.childs and slot1 then
		table.removebyvalue(slot0.childs, slot1)

		if #slot0.childs <= 0 then
			slot0.childs = nil
		end
	end
end

slot0.SetActive = function (slot0, slot1)
	slot0.active = slot1
end

slot0.OnUpdate = function (slot0, slot1)
	return
end

return slot0
