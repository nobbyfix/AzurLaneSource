pg = pg or {}
pg.MessageCache = class("MessageCache")
pg.MessageCache.DEFAULT_QUEUE_LENGTH = 10000
pg.MessageCache.CMD_KILL = "CMD_KILL"
pg.MessageCache.CMD_PUSH = "CMD_PUSH"
pg.MessageCache.CMD_POP = "CMD_POP"
pg.MessageCache.CMD_FLUSH = "CMD_FLUSH"
pg.MessageCache.OK = "OK"
pg.MessageCache.QUEUE_FULL = "QUEUE_FULL"
pg.MessageCache.EXCEPTION = "EXCEPTION"

function slot1(...)
	return coroutine.yield(...)
end

function slot2(slot0, slot1, slot2)
	if slot1 == slot0.MessageCache.CMD_PUSH then
		if slot0.cacheQueueLenLimit_ <= #slot0.cacheQueue_ + slot0.curRQLen_ - slot0.curRQPos_ then
			return slot1(slot0, slot2(slot0.MessageCache.QUEUE_FULL, string.format("                    the cache limit length is set with %s, the coming message will be ignored.\n                ", slot0.cacheQueueLenLimit_)))
		else
			table.insert(slot0.cacheQueue_, slot2)

			return slot1(slot0, slot2(slot0.MessageCache.OK, slot3 + 1))
		end
	elseif slot1 == slot0.MessageCache.CMD_POP then
		if slot0.curRQPos_ < slot0.curRQLen_ then
			slot0.curRQPos_ = slot0.curRQPos_ + 1
			slot0.retrieveQueue_[slot0.curRQPos_] = nil

			return slot1(slot0, slot2(slot0.MessageCache.OK, slot0.retrieveQueue_[slot0.curRQPos_]))
		elseif slot0.cacheQueue_[1] then
			slot0.retrieveQueue_ = slot0.cacheQueue_
			slot0.cacheQueue_ = slot0.retrieveQueue_
			slot0.curRQPos_ = 1
			slot0.curRQLen_ = #slot0.retrieveQueue_
			slot0.retrieveQueue_[slot0.curRQPos_] = nil

			return slot1(slot0, slot2(slot0.MessageCache.OK, slot0.retrieveQueue_[slot0.curRQPos_]))
		else
			return slot1(slot0, slot2(slot0.MessageCache.OK))
		end
	elseif slot1 == slot0.MessageCache.CMD_KILL then
		slot3 = slot0.curRQPos_
		slot4 = slot0.curRQLen_
		slot5 = 1

		while slot3 < slot4 do
			table.insert(slot0.cacheQueue_, slot5, slot0.retrieveQueue_[slot3])

			slot0.retrieveQueue_[slot3] = nil
			slot5 = slot5 + 1
			slot3 = slot3 + 1
		end

		slot0.curRQPos_ = 0
		slot0.curRQLen_ = 0

		return slot0.MessageCache.OK, slot0.cacheQueue_
	elseif slot1 == slot0.MessageCache.CMD_FLUSH then
		slot3 = slot0.curRQPos_
		slot4 = slot0.curRQLen_
		slot5 = 1

		while slot3 < slot4 do
			table.insert(slot0.cacheQueue_, slot5, slot0.retrieveQueue_[slot3])

			slot0.retrieveQueue_[slot3] = nil
			slot5 = slot5 + 1
			slot3 = slot3 + 1
		end

		slot0.curRQPos_ = 0
		slot0.curRQLen_ = 0
		slot0.cacheQueue_ = {}

		return slot1(slot0, slot2(slot0.MessageCache.OK, slot0.cacheQueue_))
	else
		return slot1(slot0, slot2(slot0.MessageCache.EXCEPTION, string.format("unknown cmd type received %s", tostring(slot1))))
	end
end

function slot3(slot0)
	return 
	-- Decompilation error in this vicinity:
	{
		curRQPos_ = 0,
		curRQLen_ = 0,
		cacheQueue_ = {},
		retrieveQueue_ = {},
		cacheQueueLenLimit_ = slot0 or slot0.MessageCache.DEFAULT_QUEUE_LENGTH
	}(
	-- Decompilation error in this vicinity:
	, 
	-- Decompilation error in this vicinity:
	(slot0.MessageCache.OK))
end

pg.MessageCache.Ctor = function (slot0, slot1, slot2)
	slot0._name = slot1
	slot0._thread = coroutine.create(slot0)
	slot3, slot4 = coroutine.resume(slot0._thread, slot2)
end

pg.MessageCache.Push = function (slot0, ...)
	if coroutine.status(slot0._thread) == "suspended" then
		slot2, slot3, slot4 = coroutine.resume(slot0._thread, slot0.MessageCache.CMD_PUSH, {
			...
		})

		if slot2 then
			return slot3, slot4
		else
			return slot0.MessageCache.EXCEPTION, slot3
		end
	else
		return slot0.MessageCache.EXCEPTION, string.format("current thread status %s,\n            maybe the MessageCache:Destroy() is called before the Push operation.", slot1)
	end
end

pg.MessageCache.Pop = function (slot0)
	if coroutine.status(slot0._thread) == "suspended" then
		slot2, slot3, slot4 = coroutine.resume(slot0._thread, slot0.MessageCache.CMD_POP)

		if slot2 then
			if slot3 == slot0.MessageCache.OK and slot4 ~= nil then
				return slot3, unpack(slot4)
			else
				return slot3, slot4
			end
		else
			return slot0.MessageCache.EXCEPTION, slot3
		end
	else
		return slot0.MessageCache.EXCEPTION, string.format("current thread status %s,\n            maybe the MessageCache:Destroy() is called before the Pop operation.", slot1)
	end
end

pg.MessageCache.Flush = function (slot0)
	if coroutine.status(slot0._thread) == "suspended" then
		slot2, slot3, slot4 = coroutine.resume(slot0._thread, slot0.MessageCache.CMD_FLUSH)

		if slot2 then
			return slot3, slot4
		else
			return slot0.MessageCache.EXCEPTION, slot3
		end
	else
		return slot0.MessageCache.EXCEPTION, string.format("current thread status %s,\n            maybe the MessageCache:Destroy() is called before the Destroy operation.", slot1)
	end
end

pg.MessageCache.Destroy = function (slot0)
	if coroutine.status(slot0._thread) == "suspended" then
		slot2, slot3, slot4 = coroutine.resume(slot0._thread, slot0.MessageCache.CMD_KILL)

		if slot2 then
			return slot3, slot4
		else
			return slot0.MessageCache.EXCEPTION, slot3
		end
	else
		return slot0.MessageCache.EXCEPTION, string.format("current thread status %s,\n            maybe the MessageCache:Destroy() is called before the Destroy operation.", slot1)
	end
end

return
