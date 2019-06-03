slot0 = setmetatable({}, {
	__mode = "kv"
})
slot2 = getmetatable(GameObject).__index

getmetatable(GameObject).__index = function (slot0, slot1)
	if slot1 == "transform" then
		if uv0[slot0] then
			return slot2
		end

		uv0[slot0] = uv1(slot0, slot1)

		return uv1(slot0, slot1)
	elseif slot1 == "gameObject" then
		return slot0
	else
		return uv1(slot0, slot1)
	end
end

slot3 = setmetatable({}, {
	__mode = "kv"
})
slot5 = getmetatable(Transform).__index

getmetatable(Transform).__index = function (slot0, slot1)
	if slot1 == "gameObject" then
		if uv0[slot0] then
			return slot2
		end

		uv0[slot0] = uv1(slot0, slot1)

		return uv1(slot0, slot1)
	elseif slot1 == "transform" then
		return slot0
	else
		return uv1(slot0, slot1)
	end
end

function gcAll(slot0)
	PoolMgr.GetInstance():ExcessPainting()
	ResourceMgr.Inst:unloadUnusedAssetBundles()

	if not slot0 then
		Resources.UnloadUnusedAssets()
	end

	GCThread.GetInstance():GC(slot0)
end

slot6 = print

function print(slot0, ...)
	if Application.isEditor then
		uv0(debug.traceback(tostring(slot0) .. table.concat(_.map({
			...
		}, function (slot0)
			return tostring(slot0)
		end), " "), 2))
	else
		uv0(slot0, ...)
	end
end

function traceback(slot0)
	return debug.traceback(slot0, 2)
end

function RemoveTableItem(slot0, slot1, slot2)
	for slot7 = 1, #slot0, 1 do
		if slot0[slot7 - 0] == slot1 then
			table.remove(slot0, slot7 - 0)

			if slot2 then
				slot3 = 0 + 1
			else
				break
			end
		end
	end
end

function IsNil(slot0)
	return slot0 == nil or slot0:Equals(nil)
end

function isnan(slot0)
	return slot0 ~= slot0
end

function string.split(slot0, slot1)
	slot0:gsub(string.format("([^%s]+)", slot1 or ","), function (slot0)
		table.insert(uv0, slot0)
	end)

	return {}
end

function GetDir(slot0)
	return string.match(slot0, ".*/")
end

function GetFileName(slot0)
	return string.match(slot0, ".*/(.*)")
end

function table.clear(slot0)
	if slot0 then
		for slot4, slot5 in pairs(slot0) do
			slot0[slot4] = nil
		end
	end
end

function table.contains(slot0, slot1)
	if slot0 == nil then
		return false
	end

	for slot5, slot6 in pairs(slot0) do
		if slot6 == slot1 then
			return true
		end
	end

	return false
end

function table.getCount(slot0)
	for slot5, slot6 in pairs(slot0) do
		slot1 = 0 + 1
	end

	return slot1
end

function table.merge(slot0, slot1, slot2)
	local function slot4(slot0)
		for slot4, slot5 in ipairs(slot0) do
			if uv0 then
				if not table.contains(uv1, slot5) then
					table.insert(uv1, slot5)
				end
			else
				table.insert(uv1, slot5)
			end
		end
	end

	slot4(slot0)
	slot4(slot1)

	return {}
end

function table.removebyvalue(slot0, slot1, slot2)
	slot3 = 0

	while 1 <= #slot0 do
		if slot0[slot4] == slot1 then
			table.remove(slot0, slot4)

			slot3 = slot3 + 1
			slot4 = slot4 - 1
			slot5 = slot5 - 1

			if not slot2 then
				break
			end
		end

		slot4 = slot4 + 1
	end

	return slot3
end

function table.clean(slot0)
	for slot4 = #slot0, 1, -1 do
		table.remove(slot0, slot4)
	end
end

function DumpTable(slot0)
	for slot4, slot5 in pairs(slot0) do
		if slot5 ~= nil then
			Debugger.Log("Key: {0}, Value: {1}", tostring(slot4), tostring(slot5))
		else
			Debugger.Log("Key: {0}, Value nil", tostring(slot4))
		end
	end
end

function PrintTable(slot0)
	slot2(slot0, slot1, "")

	return table.concat({}, "")
end

function PrintLua(slot0, slot1)
	slot2 = nil

	for slot6 in string.gmatch(slot0, "%w+") do
		slot1 = slot1 or _G[slot6]
	end

	if slot1 == nil then
		Debugger.Log("Lua Module {0} not exists", slot0)

		return
	end

	Debugger.Log("-----------------Dump Table {0}-----------------", slot0)

	if type(slot2) == "table" then
		for slot6, slot7 in pairs(slot2) do
			Debugger.Log("Key: {0}, Value: {1}", slot6, tostring(slot7))
		end
	end

	Debugger.Log("-----------------Dump meta {0}-----------------", slot0)

	if getmetatable(slot2) ~= nil then
		while getmetatable(slot2) ~= nil and slot3 ~= slot2 do
			for slot7, slot8 in pairs(slot3) do
				if slot7 ~= nil then
					Debugger.Log("Key: {0}, Value: {1}", tostring(slot7), tostring(slot8))
				end
			end

			slot3 = getmetatable(slot3)
		end
	end

	Debugger.Log("-----------------Dump meta Over-----------------")
	Debugger.Log("-----------------Dump Table Over-----------------")
end

function IsString(slot0)
	return type(slot0) == "string"
end

function IsNumber(slot0)
	return type(slot0) == "number"
end

function tobool(slot0)
	return slot0 and true or false
end

function warning(slot0)
	Debugger.LogWarning(slot0)
end

function BuildVector3(slot0)
	return Vector3(slot0[1], slot0[2], slot0[3])
end

function ShowFuncInfo(slot0)
	return string.format("file:%s#%d", debug.getinfo(slot0).source, debug.getinfo(slot0).linedefined)
end

slot7 = require("bit")

function unicode_to_utf8(slot0)
	if type(slot0) ~= "string" then
		return slot0
	end

	slot1 = ""

	while true do
		slot4 = nil

		if string.byte(slot0, 1) ~= nil and string.sub(slot0, 1, 1 + 1) == "\\u" then
			slot4 = tonumber("0x" .. string.sub(slot0, 1 + 2, 1 + 5))
			slot2 = 1 + 6
		elseif slot3 ~= nil then
			slot4 = slot3
			slot2 = slot2 + 1
		else
			break
		end

		if slot4 <= 127 then
			slot1 = slot1 .. string.char(uv0.band(slot4, 127))
		elseif slot4 >= 128 and slot4 <= 2047 then
			slot1 = slot1 .. string.char(uv0.bor(192, uv0.band(uv0.rshift(slot4, 6), 31))) .. string.char(uv0.bor(128, uv0.band(slot4, 63)))
		elseif slot4 >= 2048 and slot4 <= 65535 then
			slot1 = slot1 .. string.char(uv0.bor(224, uv0.band(uv0.rshift(slot4, 12), 15))) .. string.char(uv0.bor(128, uv0.band(uv0.rshift(slot4, 6), 63))) .. string.char(uv0.bor(128, uv0.band(slot4, 63)))
		end
	end

	return slot1 .. " "
end

function utf8_to_unicode(slot0)
	if type(slot0) ~= "string" then
		return slot0
	end

	slot1 = ""
	slot4 = 0

	while string.byte(slot0, 1) ~= nil do
		print(slot3)

		slot5, slot6 = nil

		if slot3 >= 0 and slot3 <= 127 then
			slot5 = slot3
			slot6 = 0
		elseif uv0.band(slot3, 224) == 192 then
			slot5 = uv0.bor(0, uv0.lshift(uv0.band(0, uv0.rshift(255, 6)), 6))
			slot6 = uv0.rshift(uv0.band(slot3, uv0.rshift(255, 3)), 2)
		elseif uv0.band(slot3, 240) == 224 then
			slot5 = uv0.bor(uv0.lshift(uv0.band(0, uv0.rshift(255, 6)), 6), 0)
			slot6 = uv0.bor(uv0.lshift(0, 4), uv0.rshift(uv0.band(slot3, uv0.rshift(255, 2)), 2))
		end

		slot1 = slot1 .. string.format("\\u%02x%02x", slot6, slot5)
		slot4 = slot6 == 0 and slot4 + 1 or slot4 + 2
		slot3 = string.byte(slot0, slot2 + 1)
	end

	return slot1, slot4
end
