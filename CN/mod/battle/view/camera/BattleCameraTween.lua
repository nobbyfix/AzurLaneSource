ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = ys.Battle.BattleVariable
ys.Battle.BattleCameraTween = class("BattleCameraTween")
ys.Battle.BattleCameraTween.__name = "BattleCameraTween"

function ys.Battle.BattleCameraTween.Ctor(slot0)
	slot0._point = Vector3.zero
end

function ys.Battle.BattleCameraTween.SetFromTo(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot0._point:Set(slot2.x, slot2.y, slot2.z)

	if slot5 and slot5 ~= 0 then
		LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdateVector3(System.Action_UnityEngine_Vector3(function (slot0)
			uv0._point:Set(slot0.x, slot0.y, slot0.z)
		end)):setDelay(slot5)
	end

	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-38, warpins: 1 ---
		slot8:setEase(LeanTweenType.easeOutExpo)
		--- END OF BLOCK #0 ---



	end

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-47, warpins: 1 ---
		slot8:setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			uv0()

			return
			--- END OF BLOCK #0 ---



		end))
		--- END OF BLOCK #0 ---



	end
end

function ys.Battle.BattleCameraTween.GetCameraPos(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	return slot0._point
	--- END OF BLOCK #0 ---



end

function ys.Battle.BattleCameraTween.Dispose(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot0._point = nil

	return
	--- END OF BLOCK #0 ---



end
