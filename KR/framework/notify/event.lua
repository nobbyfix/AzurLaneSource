slot1 = setmetatable
slot2 = string
slot3 = error
slot4 = unpack
slot5 = slot0("Framework.notify.double-queue")
slot6 = ":"
slot9 = {
	__index = {
		connect = function (slot0, slot1, slot2)
			uv0(slot0, slot1).handlers:push_back(slot2)

			if not uv0(slot0, slot1).blocked_handlers[slot2] then
				slot3.blocked_handlers[slot2] = 0
			end
		end,
		disconnect = function (slot0, slot1, slot2)
			if uv0(slot0, slot1) then
				return
			end

			uv1(slot0, slot1).handlers:remove(slot2)

			uv1(slot0, slot1).blocked_handlers[slot2] = nil
		end,
		chectConnect = function (slot0, slot1)
			return not uv0(slot0, slot1)
		end,
		block = function (slot0, slot1, slot2)
			if uv0(slot0, slot1) then
				return
			end

			if uv1(slot0, slot1).blocked_handlers[slot2] then
				slot3.blocked_handlers[slot2] = slot4 + 1
			end
		end,
		unblock = function (slot0, slot1, slot2)
			if uv0(slot0, slot1) then
				return
			end

			if uv1(slot0, slot1).blocked_handlers[slot2] and slot3.blocked_handlers[slot2] > 0 then
				slot3.blocked_handlers[slot2] = slot3.blocked_handlers[slot2] - 1
			end
		end,
		emit = function (slot0, slot1, ...)
			slot0.stopped = false
			slot6.nodes, slot6 = uv0(slot0, slot1)

			uv1(slot0, {
				event_name = slot1,
				nodes = slot2,
				args = {
					...
				}
			})
			uv2(slot1, slot3)
		end,
		emit_with_accumulator = function (slot0, slot1, slot2, ...)
			slot0.stopped = false
			slot7.nodes, slot7 = uv0(slot0, slot1)

			uv1(slot0, {
				event_name = slot1,
				nodes = slot3,
				accumulator = slot2,
				args = {
					...
				}
			})
			uv2(slot1, slot4)
		end,
		add_pre_emit = function (slot0, slot1, slot2)
			uv0(slot0, slot1).pre_emits:push_back(slot2)
		end,
		remove_pre_emit = function (slot0, slot1, slot2)
			if uv0(slot0, slot1) then
				return
			end

			uv1(slot0, slot1).pre_emits:remove(slot2)
		end,
		add_post_emit = function (slot0, slot1, slot2)
			uv0(slot0, slot1).post_emits:push_front(slot2)
		end,
		remove_post_emit = function (slot0, slot1, slot2)
			if uv0(slot0, slot1) then
				return
			end

			uv1(slot0, slot1).post_emits:remove(slot2)
		end,
		stop = function (slot0)
			slot0.stopped = true
		end,
		clear = function (slot0, slot1)
			if not slot1 then
				slot0.events = {}

				return
			end
		end
	}
}

function slot10()
	return {
		handlers = uv0.New(),
		pre_emits = uv0.New(),
		post_emits = uv0.New(),
		blocked_handlers = {},
		subevents = {}
	}
end

function slot11(slot0)
	slot1 = {}

	for slot5 in uv0.gmatch(slot0, "[^" .. uv1 .. "]+") do
		slot1[#slot1 + 1] = slot5
	end

	return slot1
end

function slot12(slot0, slot1)
	slot0.events[slot2[1]] = slot0.events[uv0(slot1)[1]] or uv1()

	for slot7 = 2, #slot2, 1 do
		slot3.subevents[slot2[slot7]] = slot3.subevents[slot2[slot7]] or uv1()
		slot3 = slot3.subevents[slot2[slot7]] or uv1()
	end

	return slot3
end

function slot13(slot0, slot1)
	if not slot0.events[uv0(slot1)[1]] then
		return true
	end

	for slot7 = 2, #slot2, 1 do
		if not slot3.subevents[slot2[slot7]] then
			return true
		end

		slot3 = slot8
	end

	return false
end

function slot14(slot0, slot1)
	slot3 = 2
	slot4 = slot0.events[uv0(slot1)[1]]

	return function ()
		if not uv0 then
			return
		end

		slot0 = uv0

		if uv1[uv2] then
			uv0 = uv0.subevents[uv1[uv2]]
			uv2 = uv2 + 1
		else
			uv0 = nil
		end

		return slot0
	end
end

function slot15(slot0, slot1)
	slot2 = uv0.New()
	slot3 = uv0.New()

	for slot7 in uv1(slot0, slot1) do
		for slot11 in slot7.pre_emits:get_iterator() do
			slot11(slot1)
		end

		slot2:push_back(slot7)
		slot3:push_front(slot7)
	end

	return slot2, slot3
end

function slot16(slot0, slot1)
	for slot5 in slot1:get_iterator() do
		for slot9 in slot5.post_emits:get_iterator() do
			slot9(slot0)
		end
	end
end

function slot17(slot0, slot1)
	for slot5 in slot1.nodes:get_iterator() do
		for slot9 in slot5.handlers:get_iterator() do
			if slot0.stopped then
				return
			end

			if slot5.blocked_handlers[slot9] == 0 then
				if slot1.accumulator then
					slot1.accumulator(slot9(slot1.event_name, uv0(slot1.args)))
				else
					slot9(slot1.event_name, uv0(slot1.args))
				end
			end
		end
	end
end

slot18 = ({
	New = function ()
		return uv0({
			stopped = false,
			events = {}
		}, uv1)
	end,
	get_global_event = function ()
		return uv0
	end
})["New"]()

return 
