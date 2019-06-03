slot0 = rawget
slot4 = tolua.initget(slot3)
UnityEngine.Ray = {
	direction = Vector3.zero,
	origin = Vector3.zero,
	__index = function (slot0, slot1)
		if uv0(uv1, slot1) == nil and uv0(uv2, slot1) ~= nil then
			return slot2(slot0)
		end

		return slot2
	end,
	__call = function (slot0, slot1, slot2)
		return uv0.New(slot1, slot2)
	end,
	New = function (slot0, slot1)
		uv0({
			direction = slot0:Normalize(),
			origin = slot1
		}, uv1)

		return 
	end,
	GetPoint = function (slot0, slot1)
		slot0.direction * slot1:Add(slot0.origin)

		return slot0.direction * slot1
	end,
	Get = function (slot0)
		return slot0.origin.x, slot0.origin.y, slot0.origin.z, slot0.direction.x, slot0.direction.y, slot0.direction.z
	end,
	__tostring = function (slot0)
		return string.format("Origin:(%f,%f,%f),Dir:(%f,%f, %f)", slot0.origin.x, slot0.origin.y, slot0.origin.z, slot0.direction.x, slot0.direction.y, slot0.direction.z)
	end
}

setmetatable(, )

return 
