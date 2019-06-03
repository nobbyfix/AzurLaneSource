slot0 = class("NavalAcademyStudent")
slot0.ShipState = {
	Touch = "Touch",
	Idle = "Idle",
	Walk = "Walk"
}

function slot0.Ctor(slot0, slot1)
	slot0._go = slot1
	slot0._tf = slot1.transform

	slot0:init()
end

function slot0.init(slot0)
	slot0.chat = slot0._tf:Find("chat")
	slot0.chatFace = slot0.chat:Find("face")
	slot0.chatTask = slot0.chat:Find("task")
	slot0.chatFight = slot0.chat:Find("fight")
	slot0.clickArea = slot0._tf:Find("click")

	setActive(slot0.chat, true)
	setActive(slot0.clickArea, true)
end

function slot0.attach(slot0)
	slot0.exited = false

	setActive(slot0._go, true)
	pg.DelegateInfo.New(slot0)
end

function slot0.setPathFinder(slot0, slot1)
	slot0.pathFinder = slot1
end

function slot0.setCallBack(slot0, slot1, slot2)
	slot0.onStateChange = slot1
	slot0.onTask = slot2
end

function slot0.updateStudent(slot0, slot1, slot2)
	if slot1.hide then
		setActive(slot0._go, false)

		return
	end

	setActive(slot0._go, true)

	if slot0.shipVO == nil or slot0.shipVO.configId ~= slot1.configId then
		if not IsNil(slot0.model) then
			PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)
		end

		slot0.prefab = slot1:getPrefab()
		slot0.currentPoint = slot0.pathFinder:getRandomPoint()
		slot0.targetPoint = slot0.pathFinder:getPoint(slot4)
		slot0._tf.anchoredPosition = Vector2.New(slot0.currentPoint.x, slot0.currentPoint.y)

		PoolMgr.GetInstance():GetSpineChar(slot0.prefab, true, function (slot0)
			if uv0 ~= uv1.prefab then
				PoolMgr.GetInstance():ReturnSpineChar(uv0, slot0)

				return
			end

			uv1.model = slot0
			uv1.model.transform.localScale = Vector3(0.5, 0.5, 1)
			uv1.model.transform.localPosition = Vector3.zero

			uv1.model.transform:SetParent(uv1._tf, false)
			uv1.model.transform:SetSiblingIndex(1)

			uv1.anim = uv1.model:GetComponent(typeof(SpineAnimUI))

			uv1:updateState(uv2.ShipState.Idle)
			onButton(uv1, uv1.chat, function ()
				uv0:onClickShip()
			end)
		end)
	end

	onButton(slot0, slot0.clickArea, function ()
		if not IsNil(uv0.model) then
			uv0:updateState(uv1.ShipState.Touch)
		end
	end)

	slot0.shipVO = slot1
	slot0.args = slot2

	setActive(slot0.chatFace, false)
	setActive(slot0.chatTask, false)
	setActive(slot0.chatFight, false)

	if slot0.shipVO.withShipFace then
		if slot2.showTips then
			setActive(slot0.chatTask, true)
		elseif slot2.currentTask and not slot2.currentTask:isFinish() and slot2.currentTask:getConfig("sub_type") == 29 then
			setActive(slot0.chatFight, true)
		else
			setActive(slot0.chatFace, true)
		end
	end
end

function slot0.updateState(slot0, slot1)
	if slot0.state ~= slot1 then
		slot0.state = slot1

		slot0:updateAction()
		slot0:updateLogic()

		if slot0.onStateChange then
			slot0.onStateChange(slot0.state)
		end
	end
end

function slot0.updateAction(slot0)
	if not IsNil(slot0.anim) then
		if slot0.state == uv0.ShipState.Walk then
			slot0.anim:SetAction("walk", 0)
		elseif slot0.state == uv0.ShipState.Idle then
			slot0.anim:SetAction("stand2", 0)
		elseif slot0.state == uv0.ShipState.Touch then
			slot0.anim:SetAction("touch", 0)
			slot0.anim:SetActionCallBack(function (slot0)
				uv0:updateState(uv1.ShipState.Idle)
			end)
		end
	end
end

function slot0.updateLogic(slot0)
	slot0:clearLogic()

	if slot0.state == uv0.ShipState.Walk then
		LeanTween.value(slot0._go, 0, 1, Vector3.Distance(slot1, slot2) / 15):setOnUpdate(System.Action_float(function (slot0)
			uv0._tf.anchoredPosition3D = Vector3.Lerp(uv1, uv2, slot0)
			uv0._tf.localScale.x = uv0.currentPoint.x < uv0.targetPoint.x and 1 or -1
			uv0._tf.localScale = uv0._tf.localScale
			uv0.chat.localScale.x = uv0.currentPoint.x < uv0.targetPoint.x and 1 or -1
			uv0.chat.localScale = uv0.chat.localScale
			uv0.chat.anchoredPosition.x = (uv0.currentPoint.x < uv0.targetPoint.x and 1 or -1) * math.abs(uv0.chat.anchoredPosition.x)
			uv0.chat.anchoredPosition = uv0.chat.anchoredPosition
		end)):setOnComplete(System.Action(function ()
			uv0.currentPoint = uv0.targetPoint
			uv0.targetPoint = uv0.pathFinder:getPoint(uv0.currentPoint.nexts[math.random(1, #uv0.currentPoint.nexts)])

			uv0:updateState(uv1.ShipState.Idle)
		end))

		return
	end

	if slot0.state == uv0.ShipState.Idle then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-76, warpins: 1 ---
		slot0.idleTimer = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			uv0:updateState(uv1.ShipState.Walk)

			return
			--- END OF BLOCK #0 ---



		end, math.random(10, 20), 1)

		slot0.idleTimer:Start()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 77-82, warpins: 1 ---
		if slot0.state == uv0.ShipState.Touch then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 83-85, warpins: 1 ---
			slot0:onClickShip()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end
end

function slot0.onClickShip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	if slot0.onTask then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot0.onTask(slot0.acceptTaskId, slot0.currentTask)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.clearLogic(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	LeanTween.cancel(slot0._go)

	if slot0.idleTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot0.idleTimer:Stop()

		slot0.idleTimer = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.clear(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-38, warpins: 1 ---
	slot0:clearLogic()

	if not IsNil(slot0.model) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-21, warpins: 1 ---
		slot0.anim:SetActionCallBack(nil)
		PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)
		--- END OF BLOCK #0 ---



	end

	slot0.shipVO = nil
	slot0.prefab = nil
	slot0.model = nil
	slot0.anim = nil
	slot0.position = nil
	slot0.currentPoint = nil
	slot0.targetPoint = nil
	slot0.state = nil

	return
	--- END OF BLOCK #0 ---



end

function slot0.detach(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	if not slot0.exited then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-17, warpins: 1 ---
		setActive(slot0._go, false)
		pg.DelegateInfo.Dispose(slot0)
		slot0:clear()

		slot0.exited = true
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

return slot0
