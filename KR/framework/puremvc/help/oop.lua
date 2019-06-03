function string.split(slot0, slot1)
	slot0 = tostring(slot0)

	if tostring(slot1) == "" then
		return false
	end

	for slot7, slot8 in function ()
		return string.find(uv0, uv1, uv2, true)
	end do
		table.insert({}, string.sub(slot0, 0, slot7 - 1))

		slot2 = slot8 + 1
	end

	table.insert(slot3, string.sub(slot0, slot2))

	return slot3
end

function import(slot0, slot1)
	slot3 = slot0

	while true do
		if string.byte(slot0, 1) ~= 46 then
			if nil and #nil > 0 then
				slot3 = table.concat(nil, ".") .. "." .. string.sub(slot0, 1)
			end

			break
		end

		slot4 = slot4 + 1

		table.remove(slot2 or string.split(slot1, "."), #(slot2 or string.split(slot1, ".")))
	end

	return require(slot3)
end
