slot0 = {}

function Clone_Copy(slot0, slot1)
	if type(slot0) ~= "table" then
		return slot0
	elseif slot1[slot0] then
		return slot1[slot0]
	end

	slot1[slot0] = {}
	slot3 = type(slot0) == "table" and slot0.__ctype == 2

	for slot7, slot8 in pairs(slot0) do
		if slot3 and slot7 == "class" then
			slot2[slot7] = slot8
		else
			slot2[Clone_Copy(slot7, slot1)] = Clone_Copy(slot8, slot1)
		end
	end

	return setmetatable(slot2, getmetatable(slot0))
end

function Clone(slot0)
	for slot4, slot5 in pairs(slot0) do
		slot0[slot4] = nil
	end

	return Clone_Copy(slot0, slot0)
end

function class(slot0, slot1)
	slot3 = nil

	if type(slot1) ~= "function" and slot2 ~= "table" then
		slot2 = nil
		slot1 = nil
	end

	if slot2 == "function" or (slot1 and slot1.__ctype == 1) then
		slot3 = {}

		if slot2 == "table" then
			for slot7, slot8 in pairs(slot1) do
				slot3[slot7] = slot8
			end

			slot3.__create = slot1.__create
			slot3.super = slot1
		else
			slot3.__create = slot1
		end

		slot3.Ctor = function ()
			return
		end

		slot3.__cname = slot0
		slot3.__ctype = 1

		slot3.New = function (...)
			for slot4, slot5 in pairs(slot0) do
				slot0[slot4] = slot5
			end

			slot0.class = slot0

			slot0:Ctor(...)

			return slot0
		end
	else
		if slot1 then
			setmetatable({}, slot1).super = slot1
		else
			slot3 = {
				Ctor = function ()
					return
				end
			}
		end

		slot3.__cname = slot0
		slot3.__ctype = 2
		slot3.__index = slot3

		slot3.New = function (...)
			slot0 = setmetatable({}, setmetatable)
			slot0.class = slot0

			slot0:Ctor(...)

			return slot0
		end
	end

	return slot3
end

function isa(slot0, slot1)
	slot2 = getmetatable(slot0)

	while slot2 ~= nil do
		if slot2 == slot1 then
			return true
		else
			slot2 = getmetatable(slot2)
		end
	end

	return false
end

function instanceof(slot0, slot1)
	slot2 = slot0.class

	while slot2 ~= nil do
		if slot2 == slot1 then
			return true
		end

		slot2 = slot2.super
	end

	return false
end

function singletonClass(slot0, slot1)
	slot2 = class(slot0, slot1)
	slot2._new = slot2.New

	rawset(slot2, "_singletonInstance", nil)

	slot2.New = function ()
		if not slot0._singletonInstance then
			return slot0.GetInstance()
		end

		error("singleton class can not new. Please use " ..  .. ".GetInstance() to get it", 2)
	end

	slot2.GetInstance = function ()
		if rawget(rawget, "_singletonInstance") == nil then
			rawset(rawset, "_singletonInstance", slot0._new())
		end

		return slot0._singletonInstance
	end

	return slot2
end

function removeSingletonInstance(slot0)
	if slot0 and rawget(slot0, "_singletonInstance") then
		rawset(slot0, "_singletonInstance", nil)

		return true
	end

	return false
end

function tracebackex()
	slot1 = 2
	slot0 = "" .. "stack traceback:\n"

	while true do
		if not debug.getinfo(slot1, "Sln") then
			break
		end

		if slot2.what == "C" then
			slot0 = slot0 .. tostring(slot1) .. "\tC function\n"
		else
			slot0 = slot0 .. string.format("\t[%s]:%d in function `%s`\n", slot2.short_src, slot2.currentline, slot2.name or "")
		end

		slot3 = 1

		while true do
			slot4, slot5 = debug.getlocal(slot1, slot3)

			if not slot4 then
				break
			end

			slot0 = slot0 .. "\t\t" .. slot4 .. " =\t" .. tostringex(slot5, 3) .. "\n"
			slot3 = slot3 + 1
		end

		slot1 = slot1 + 1
	end

	return slot0
end

function tostringex(slot0, slot1)

	-- Decompilation error in this vicinity:
	if slot1 == nil then
		slot1 = 0
	end

	slot2 = string.rep("\t", slot1)
	slot3 = ""

	if slot1 > 5 then
		return "\t{ ... }"
	end

	slot4 = ""

	for slot8, slot9 in pairs(slot0) do
		slot4 = slot4 .. "\n\t" .. slot2 .. tostring(slot8) .. ":" .. tostringex(slot9, slot1 + 1)
	end

	return (slot4 == "" and slot3 .. slot2 .. "{ }\t(" .. tostring(slot0) .. ")") or slot3 .. slot2 .. "{" .. slot4 .. "\n" .. slot2 .. "}" or slot3 .. slot2 .. tostring(slot0) .. "\t(" .. type(slot0) .. ")"
end

return
