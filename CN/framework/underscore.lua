slot0 = {}
slot1 = {}
slot0.funcs = slot1
slot0.__index = slot0

function slot1(slot0, slot1)
	slot2 = slot0
	slot3 = slot2
	slot2 = slot2.new
	slot4 = slot1

	return slot2(slot3, slot4)
end

slot0.__call = slot1

function slot1(slot0, slot1, slot2)
	return setmetatable({
		_val = slot1,
		chained = slot2 or false
	}, slot0)
end

slot0.new = slot1

function slot1(slot0)
	slot1 = type
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 == "function" then
		return slot0
	end

	slot1 = coroutine
	slot1 = slot1.wrap

	function slot2()
		slot0 = 1
		slot1 = slot0
		slot1 = #slot1
		slot2 = 1

		for slot3 = slot0, slot1, slot2 do
			slot4 = coroutine
			slot4 = slot4.yield
			slot5 = slot0
			slot5 = slot5[slot3]

			slot4(slot5)
		end
	end

	return slot1(slot2)
end

slot0.iter = slot1

function slot1(slot0, slot1, slot2)
	if slot1 == nil then
		slot1 = slot0
		slot0 = 1
	end

	slot2 = slot2 or 1

	return slot0:new(coroutine.wrap(function ()
		slot0 = slot0
		slot1 = slot1
		slot2 = slot2

		for slot3 = slot0, slot1, slot2 do
			coroutine.yield(slot3)
		end
	end))
end

slot0.range = slot1

function slot1(slot0)
	return slot0
end

slot0.identity = slot1

function slot1(slot0)
	slot1 = true
	slot0.chained = slot1

	return slot0
end

slot0.chain = slot1

function slot1(slot0)
	slot1 = slot0._val

	return slot1
end

slot0.value = slot1
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.iter
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = slot1
		slot7 = slot5

		slot6(slot7)
	end

	return slot0
end

slot1.each = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = {}
	slot3 = slot0
	slot3 = slot3.iter
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6 in slot3, slot4, slot5 do
		slot7 = #slot2
		slot7 = slot7 + 1
		slot8 = slot1
		slot9 = slot6
		slot8 = slot8(slot9)
		slot2[slot7] = slot8
	end

	return slot2
end

slot1.map = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1, slot2)
	slot3 = slot0
	slot3 = slot3.iter
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6 in slot3, slot4, slot5 do
		slot7 = slot2
		slot8 = slot1
		slot9 = slot6
		slot7 = slot7(slot8, slot9)
		slot1 = slot7
	end

	return slot1
end

slot1.reduce = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.iter
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = slot1
		slot7 = slot5
		slot6 = slot6(slot7)

		if slot6 then
			return slot5
		end
	end

	slot2 = nil

	return slot2
end

slot1.detect = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = {}
	slot3 = slot0
	slot3 = slot3.iter
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6 in slot3, slot4, slot5 do
		slot7 = slot1
		slot8 = slot6
		slot7 = slot7(slot8)

		if slot7 then
			slot7 = #slot2
			slot7 = slot7 + 1
			slot2[slot7] = slot6
		end
	end

	return slot2
end

slot1.select = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = {}
	slot3 = slot0
	slot3 = slot3.iter
	slot4 = slot0
	slot3, slot4, slot5 = slot3(slot4)

	for slot6 in slot3, slot4, slot5 do
		slot7 = slot1
		slot8 = slot6
		slot7 = slot7(slot8)

		if not slot7 then
			slot7 = #slot2
			slot7 = slot7 + 1
			slot2[slot7] = slot6
		end
	end

	return slot2
end

slot1.reject = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	if not slot1 then
		slot2 = slot0
		slot1 = slot2.identity
	end

	slot2 = slot0
	slot2 = slot2.iter
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = slot1
		slot7 = slot5
		slot6 = slot6(slot7)

		if not slot6 then
			slot6 = false

			return slot6
		end
	end

	slot2 = true

	return slot2
end

slot1.all = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	if not slot1 then
		slot2 = slot0
		slot1 = slot2.identity
	end

	slot2 = slot0
	slot2 = slot2.iter
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = slot1
		slot7 = slot5
		slot6 = slot6(slot7)

		if slot6 then
			slot6 = true

			return slot6
		end
	end

	slot2 = false

	return slot2
end

slot1.any = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.iter
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		if slot5 == slot1 then
			slot6 = true

			return slot6
		end
	end

	slot2 = false

	return slot2
end

slot1.include = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1, ...)
	slot2 = {
		...
	}
	slot3 = slot0
	slot3 = slot3.funcs
	slot3 = slot3.each
	slot4 = slot0

	function slot5(slot0)
		slot1 = slot0
		slot1 = slot0[slot1]
		slot2 = slot0
		slot3 = unpack
		slot4 = slot1

		slot1(slot2, slot3(slot4))
	end

	slot3(slot4, slot5)

	return slot0
end

slot1.invoke = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = slot0
	slot2 = slot2.funcs
	slot2 = slot2.map
	slot3 = slot0

	function slot4(slot0)
		slot1 = slot0
		slot1 = slot0[slot1]

		return slot1
	end

	return slot2(slot3, slot4)
end

slot1.pluck = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	if not slot1 then
		slot2 = slot0
		slot1 = slot2.identity
	end

	slot2 = slot0
	slot2 = slot2.funcs
	slot2 = slot2.reduce
	slot3 = slot0
	slot4 = {}

	function slot5(slot0, slot1)
		slot2 = slot0.item

		if slot2 == nil then
			slot0.item = slot1
			slot2 = slot0
			slot3 = slot1
			slot2 = slot2(slot3)
			slot0.value = slot2
		else
			slot2 = slot0
			slot3 = slot1
			slot2 = slot2(slot3)
			slot3 = slot0.value

			if slot2 < slot3 then
				slot0.item = slot1
				slot0.value = slot2
			end
		end

		return slot0
	end

	slot2 = slot2(slot3, slot4, slot5)
	slot2 = slot2.item

	return slot2
end

slot1.min = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	if not slot1 then
		slot2 = slot0
		slot1 = slot2.identity
	end

	slot2 = slot0
	slot2 = slot2.funcs
	slot2 = slot2.reduce
	slot3 = slot0
	slot4 = {}

	function slot5(slot0, slot1)
		slot2 = slot0.item

		if slot2 == nil then
			slot0.item = slot1
			slot2 = slot0
			slot3 = slot1
			slot2 = slot2(slot3)
			slot0.value = slot2
		else
			slot2 = slot0
			slot3 = slot1
			slot2 = slot2(slot3)
			slot3 = slot0.value

			if slot3 < slot2 then
				slot0.item = slot1
				slot0.value = slot2
			end
		end

		return slot0
	end

	slot2 = slot2(slot3, slot4, slot5)
	slot2 = slot2.item

	return slot2
end

slot1.max = slot2
slot1 = slot0.funcs

function slot2(slot0)
	slot1 = {}
	slot2 = slot0
	slot2 = slot2.iter
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = #slot1
		slot6 = slot6 + 1
		slot1[slot6] = slot5
	end

	return slot1
end

slot1.to_array = slot2
slot1 = slot0.funcs

function slot2(slot0)
	slot1 = {}
	slot2 = slot0
	slot2 = slot2.iter
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot1
		slot8 = 1
		slot9 = slot5

		slot6(slot7, slot8, slot9)
	end

	return slot1
end

slot1.reverse = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = slot0
	slot3 = type
	slot4 = slot0
	slot3 = slot3(slot4)

	if slot3 == "function" then
		slot3 = slot0
		slot3 = slot3.funcs
		slot3 = slot3.to_array
		slot4 = slot0
		slot3 = slot3(slot4)
		slot2 = slot3
	end

	slot3 = table
	slot3 = slot3.sort
	slot4 = slot2
	slot5 = slot1

	slot3(slot4, slot5)

	return slot2
end

slot1.sort = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	if slot1 == nil then
		slot2 = slot0[1]

		return slot2
	else
		slot2 = {}
		slot3 = math
		slot3 = slot3.min
		slot4 = slot1
		slot5 = #slot0
		slot3 = slot3(slot4, slot5)
		slot1 = slot3
		slot3 = 1
		slot4 = slot1
		slot5 = 1

		for slot6 = slot3, slot4, slot5 do
			slot7 = slot0[slot6]
			slot2[slot6] = slot7
		end

		return slot2
	end
end

slot1.first = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = {}
	slot3 = slot1 or 2
	slot4 = #slot0
	slot5 = 1

	for slot6 = slot3, slot4, slot5 do
		slot7 = #slot2
		slot7 = slot7 + 1
		slot8 = slot0[slot6]
		slot2[slot7] = slot8
	end

	return slot2
end

slot1.rest = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1, slot2)
	slot3 = {}
	slot4 = math
	slot4 = slot4.max
	slot5 = slot1
	slot6 = 1
	slot4 = slot4(slot5, slot6)
	slot1 = slot4
	slot4 = math
	slot4 = slot4.min
	slot5 = slot1 + slot2
	slot5 = slot5 - 1
	slot6 = #slot0
	slot4 = slot4(slot5, slot6)
	slot5 = slot1
	slot6 = slot4
	slot7 = 1

	for slot8 = slot5, slot6, slot7 do
		slot9 = #slot3
		slot9 = slot9 + 1
		slot10 = slot0[slot8]
		slot3[slot9] = slot10
	end

	return slot3
end

slot1.slice = slot2
slot1 = slot0.funcs

function slot2(slot0)
	slot1 = {}
	slot2 = slot0
	slot2 = slot2.iter
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5 in slot2, slot3, slot4 do
		slot6 = type
		slot7 = slot5
		slot6 = slot6(slot7)

		if slot6 == "table" then
			slot6 = slot0
			slot6 = slot6.funcs
			slot6 = slot6.flatten
			slot7 = slot5
			slot6 = slot6(slot7)
			slot7 = slot0
			slot7 = slot7.funcs
			slot7 = slot7.each
			slot8 = slot6

			function slot9(slot0)
				slot1 = slot0
				slot2 = slot0
				slot2 = #slot2
				slot2 = slot2 + 1
				slot1[slot2] = slot0
			end

			slot7(slot8, slot9)
		else
			slot6 = #slot1
			slot6 = slot6 + 1
			slot1[slot6] = slot5
		end
	end

	return slot1
end

slot1.flatten = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = table
	slot2 = slot2.insert
	slot3 = slot0
	slot4 = slot1

	slot2(slot3, slot4)

	return slot0
end

slot1.push = slot2
slot1 = slot0.funcs

function slot2(slot0)
	slot1 = table
	slot1 = slot1.remove
	slot2 = slot0

	return slot1(slot2)
end

slot1.pop = slot2
slot1 = slot0.funcs

function slot2(slot0)
	slot1 = table
	slot1 = slot1.remove
	slot2 = slot0
	slot3 = 1

	return slot1(slot2, slot3)
end

slot1.shift = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = table
	slot2 = slot2.insert
	slot3 = slot0
	slot4 = 1
	slot5 = slot1

	slot2(slot3, slot4, slot5)

	return slot0
end

slot1.unshift = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = table
	slot2 = slot2.concat
	slot3 = slot0
	slot4 = slot1

	return slot2(slot3, slot4)
end

slot1.join = slot2
slot1 = slot0.funcs

function slot2(slot0)
	slot1 = {}
	slot2 = pairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = #slot1
		slot7 = slot7 + 1
		slot1[slot7] = slot5
	end

	return slot1
end

slot1.keys = slot2
slot1 = slot0.funcs

function slot2(slot0)
	slot1 = {}
	slot2 = pairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = #slot1
		slot7 = slot7 + 1
		slot1[slot7] = slot6
	end

	return slot1
end

slot1.values = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	slot2 = pairs
	slot3 = slot1
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot0[slot5] = slot6
	end

	return slot0
end

slot1.extend = slot2
slot1 = slot0.funcs

function slot2(slot0)
	return next(slot0) == nil
end

slot1.is_empty = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1, slot2)
	slot3 = type
	slot4 = slot0
	slot3 = slot3(slot4)
	slot4 = type
	slot5 = slot1
	slot4 = slot4(slot5)

	if slot3 ~= slot4 then
		slot5 = false

		return slot5
	end

	if slot3 ~= "table" then
		return slot0 == slot1
	end

	slot5 = getmetatable
	slot6 = slot0
	slot5 = slot5(slot6)

	if not slot2 and slot5 then
		slot6 = slot5.__eq

		if slot6 then
			return slot0 == slot1
		end
	end

	slot6 = slot0
	slot6 = slot6.funcs
	slot6 = slot6.is_equal
	slot7 = pairs
	slot8 = slot0
	slot7, slot8, slot9 = slot7(slot8)

	for slot10, slot11 in slot7, slot8, slot9 do
		slot12 = slot1[slot10]

		if slot12 ~= nil then
			slot13 = slot6
			slot14 = slot11
			slot15 = slot12
			slot16 = slot2
			slot13 = slot13(slot14, slot15, slot16)

			if not slot13 then
				slot13 = false

				return slot13
			end
		end
	end

	slot7 = pairs
	slot8 = slot1
	slot7, slot8, slot9 = slot7(slot8)

	for slot10, slot11 in slot7, slot8, slot9 do
		slot12 = slot0[slot10]

		if slot12 == nil then
			slot13 = false

			return slot13
		end
	end

	slot7 = true

	return slot7
end

slot1.is_equal = slot2
slot1 = slot0.funcs

function slot2(...)
	function slot0(slot0, ...)
		slot1 = #slot0
		slot2 = 1

		if slot1 > slot2 then
			slot1 = slot0[1]
			slot2 = slot0
			slot3 = _
			slot3 = slot3.rest
			slot4 = slot0
			slot3 = slot3(slot4)

			return slot1(slot2(slot3, ...))
		else
			slot1 = slot0[1]

			return slot1(...)
		end
	end

	slot1 = {
		...
	}

	function slot2(...)
		slot0 = slot0
		slot1 = slot1

		return slot0(slot1, ...)
	end

	return slot2
end

slot1.compose = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	function slot2(...)
		slot0 = slot0
		slot1 = slot1

		return slot0(slot1, ...)
	end

	return slot2
end

slot1.wrap = slot2
slot1 = slot0.funcs

function slot2(slot0, slot1)
	function slot2(...)
		slot0 = slot0
		slot1 = slot1

		return slot0(slot1, ...)
	end

	return slot2
end

slot1.curry = slot2

function slot1()
	slot0 = slot0
	slot0 = slot0.keys
	slot1 = slot0
	slot1 = slot1.funcs

	return slot0(slot1)
end

slot0.functions = slot1
slot1 = slot0.functions
slot0.methods = slot1
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.each
slot1.for_each = slot2
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.map
slot1.collect = slot2
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.reduce
slot1.inject = slot2
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.reduce
slot1.foldl = slot2
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.select
slot1.filter = slot2
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.all
slot1.every = slot2
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.any
slot1.some = slot2
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.first
slot1.head = slot2
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.rest
slot1.tail = slot2
slot1 = slot0.funcs
slot2 = slot0.funcs
slot2 = slot2.include
slot1.contains = slot2

function slot1()
	function slot0(slot0)
		slot1 = false
		slot2 = getmetatable
		slot3 = slot0
		slot2 = slot2(slot3)
		slot3 = slot0

		if slot2 == slot3 then
			slot1 = slot0.chained
			slot0 = slot0._val
		end

		slot2 = slot0
		slot3 = slot1

		return slot2, slot3
	end

	function slot1(slot0, slot1)
		if slot1 then
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.new
			slot4 = slot0
			slot5 = true
			slot2 = slot2(slot3, slot4, slot5)
			slot0 = slot2
		end

		return slot0
	end

	slot2 = pairs
	slot3 = slot0
	slot3 = slot3.funcs
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = slot0

		function slot8(slot0, ...)
			slot1 = slot0
			slot2 = slot0
			slot1, slot2 = slot1(slot2)
			slot3 = slot1
			slot4 = slot2
			slot5 = slot1
			slot4 = slot4(slot5, ...)
			slot5 = slot2

			return slot3(slot4, slot5)
		end

		slot7[slot5] = slot8
	end
end

slot2 = slot1

slot2()

slot3 = slot0
slot2 = slot0.new

return slot2(slot3)
