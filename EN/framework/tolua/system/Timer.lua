slot0 = setmetatable
slot1 = UpdateBeat
slot2 = CoUpdateBeat
slot3 = Time
Timer = {
	loop = 1,
	running = false,
	time = 0,
	duration = 1,
	scale = false
}
slot5 = {
	__index = Timer
}

Timer.New = function (slot0, slot1, slot2, slot3)
	return slot0({
		running = false,
		func = slot0,
		duration = slot1,
		time = slot1,
		loop = slot2 or 1,
		scale = slot3 or false
	}, slot1)
end

Timer.Start = function (slot0)
	slot0.running = true
	slot0.paused = nil

	if not slot0.handle then
		slot0.handle = slot0:CreateListener(slot0.Update, slot0)
	end

	slot0:AddListener(slot0.handle)
end

Timer.Reset = function (slot0, slot1, slot2, slot3, slot4)
	slot0.duration = slot2 or slot0.duration
	slot0.loop = slot3 or slot0.loop
	slot0.scale = slot4 or slot0.scale
	slot0.func = slot1 or slot0.func
	slot0.time = slot2 or slot0.time
	slot0.running = false
	slot0.paused = nil
end

Timer.SetScale = function (slot0, slot1)
	slot0.scale = slot1
end

Timer.Stop = function (slot0)
	if not slot0.running then
		return
	end

	slot0.running = false
	slot0.paused = nil
	slot0.time = 0

	if slot0.handle then
		slot0:RemoveListener(slot0.handle)
	end
end

Timer.Pause = function (slot0)
	slot0.paused = true
end

Timer.Resume = function (slot0)
	slot0.paused = nil
end

Timer.Update = function (slot0)
	if not slot0.running or slot0.paused then
		return
	end

	slot0.time = slot0.time - ((slot0.scale and slot0.deltaTime) or slot0.unscaledDeltaTime)
	slot2 = 0

	while slot0.time <= 0 and slot2 < 6 do
		slot2 = slot2 + 1

		slot0:func()

		if slot0.loop > 0 then
			slot0.loop = slot0.loop - 1
			slot0.time = slot0.time + slot0.duration
		end

		if slot0.loop == 0 then
			slot0:Stop()

			return
		end
	end
end

FrameTimer = {}
slot7 = {
	__index = FrameTimer
}

FrameTimer.New = function (slot0, slot1, slot2)
	return slot1({
		running = false,
		func = slot0,
		loop = slot2 or 1,
		duration = slot1,
		count = slot0.frameCount + slot1
	}, slot2 or 1)
end

FrameTimer.Reset = function (slot0, slot1, slot2, slot3)
	slot0.func = slot1
	slot0.duration = slot2
	slot0.loop = slot3
	slot0.count = slot0.frameCount + slot2
end

FrameTimer.Start = function (slot0)
	if not slot0.handle then
		slot0.handle = slot0:CreateListener(slot0.Update, slot0)
	end

	slot0:AddListener(slot0.handle)

	slot0.running = true
end

FrameTimer.Stop = function (slot0)
	slot0.running = false

	if slot0.handle then
		slot0:RemoveListener(slot0.handle)
	end
end

FrameTimer.Update = function (slot0)
	if not slot0.running then
		return
	end

	if slot0.count <= slot0.frameCount then
		slot0.func()

		if slot0.loop > 0 then
			slot0.loop = slot0.loop - 1
		end

		if slot0.loop == 0 then
			slot0:Stop()
		else
			slot0.count = slot0.frameCount + slot0.duration
		end
	end
end

CoTimer = {}
slot9 = {
	__index = CoTimer
}

CoTimer.New = function (slot0, slot1, slot2)
	return slot0({
		running = false,
		duration = slot1,
		loop = slot2 or 1,
		func = slot0,
		time = slot1
	}, slot1)
end

CoTimer.Start = function (slot0)
	if not slot0.handle then
		slot0.handle = slot0:CreateListener(slot0.Update, slot0)
	end

	slot0.running = true

	slot0:AddListener(slot0.handle)
end

CoTimer.Reset = function (slot0, slot1, slot2, slot3)
	slot0.duration = slot2
	slot0.loop = slot3 or 1
	slot0.func = slot1
	slot0.time = slot2
end

CoTimer.Stop = function (slot0)
	slot0.running = false

	if slot0.handle then
		slot0:RemoveListener(slot0.handle)
	end
end

CoTimer.Update = function (slot0)
	if not slot0.running then
		return
	end

	if slot0.time <= 0 then
		slot0.func()

		if slot0.loop > 0 then
			slot0.loop = slot0.loop - 1
			slot0.time = slot0.time + slot0.duration
		end

		if slot0.loop == 0 then
			slot0:Stop()
		elseif slot0.loop < 0 then
			slot0.time = slot0.time + slot0.duration
		end
	end

	slot0.time = slot0.time - slot0.deltaTime
end

return
