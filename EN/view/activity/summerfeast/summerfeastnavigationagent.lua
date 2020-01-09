slot0 = class("SummerFeastNavigationAgent", require("view.main.NavalAcademyStudent"))

slot0.Ctor = function (slot0, slot1)
	slot0.onTransEdge = nil

	slot0.super.Ctor(slot0, slot1)
end

slot0.init = function (slot0)
	return
end

slot0.normalSpeed = 150

slot0.SetOnTransEdge = function (slot0, slot1)
	slot0.onTransEdge = slot1
end

slot0.updateStudent = function (slot0, slot1)
	if slot1 == nil or slot1 == "" then
		setActive(slot0._go, false)

		return
	end

	setActive(slot0._go, true)

	if slot0.prefabName ~= slot1 then
		if not IsNil(slot0.model) then
			PoolMgr.GetInstance():ReturnSpineChar(slot0.prefab, slot0.model)
		end

		slot0.prefab = slot1
		slot0.currentPoint = slot0.pathFinder:getRandomPoint()
		slot0.targetPoint = slot0.pathFinder:getPoint(slot3)
		slot0._tf.anchoredPosition = Vector2.New(slot0.currentPoint.x, slot0.currentPoint.y)

		if slot0.onTransEdge and slot3 then
			slot0:onTransEdge(table.indexof(slot0.pathFinder.points, slot0.currentPoint), slot3)
		end

		PoolMgr.GetInstance():GetSpineChar(slot0.prefab, true, function (slot0)
			if slot0 ~= slot1.prefab then
				PoolMgr.GetInstance():ReturnSpineChar(slot0, slot0)

				return
			end

			slot1.model = slot0
			slot1.model.transform.localScale = Vector3(0.5, 0.5, 1)
			slot1.model.transform.model.transform.localPosition = Vector3.zero

			slot1.model.transform.model.transform.model.transform:SetParent(slot1._tf, false)
			slot1.model.transform.model.transform.model.transform.SetParent.model.transform:SetSiblingIndex(1)

			slot1.model.transform.model.transform.model.transform.SetParent.model.transform.SetSiblingIndex.anim = slot1.model:GetComponent(typeof(SpineAnimUI))

			slot1.model.transform.model.transform.model.transform.SetParent.model.transform.SetSiblingIndex:updateState(slot2.ShipState.Idle)
		end)
	end

	slot0.prefabName = slot1
end

slot0.updateLogic = function (slot0)
	slot0:clearLogic()

	if slot0.state == slot0.ShipState.Walk then
		LeanTween.value(slot0._go, 0, 1, Vector3.Distance(slot1, slot2) / 15):setOnUpdate(System.Action_float(function (slot0)
			slot0._tf.anchoredPosition3D = Vector3.Lerp(slot0._tf, Vector3.Lerp, slot0)
			slot0._tf.localScale.x = (slot0.currentPoint.x < slot0.targetPoint.x and 1) or -1
			slot0._tf.localScale = slot0._tf.localScale
		end)):setOnComplete(System.Action(function ()
			slot0.currentPoint = slot0.targetPoint
			slot0.targetPoint = slot0.pathFinder:getPoint(slot0.currentPoint.nexts[math.random(1, #slot0.currentPoint.nexts)])

			if slot0.onTransEdge then
				slot0:onTransEdge(table.indexof(slot0.pathFinder.points, slot0.currentPoint), slot1)
			end

			slot0:updateState(slot1.ShipState.Idle)
		end))

		return
	end

	if slot0.state == slot0.ShipState.Idle then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-64, warpins: 1 ---
		if not slot0.currentPoint.isBan then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 65-80, warpins: 1 ---
			slot0.idleTimer = Timer.New(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:updateState(slot1.ShipState.Walk)

				return
				--- END OF BLOCK #0 ---



			end, math.random(10, 20), 1)

			slot0.idleTimer:Start()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 81-92, warpins: 1 ---
			slot0.idleTimer = Timer.New(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0:updateState(slot1.ShipState.Walk)

				return
				--- END OF BLOCK #0 ---



			end, 0.001, 1)

			slot0.idleTimer:Start()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 93-98, warpins: 1 ---
		if slot0.state == slot0.ShipState.Touch then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 99-101, warpins: 1 ---
			slot0:onClickShip()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end
end

return slot0
