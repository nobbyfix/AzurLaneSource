slot0 = class("StaticCellView")
slot1 = import("view.util.LoadPrefabRequestPackage")
slot2 = import("view.util.LoadReferenceRequestPackage")
slot3 = import("view.util.LoadSpineRequestPackage")

slot0.Ctor = function (slot0, slot1)
	slot0.parent = slot1
	slot0.go = nil
	slot0.tf = nil
	slot0.info = nil
	slot0._loadingRequest = {}
end

slot0.SetTpl = function (slot0, slot1)
	slot0._tpl = slot1
end

slot0.UpdateGO = function (slot0)
	if slot0._tpl and slot0._currentTpl ~= slot1 then
		if not IsNil(slot0.go) then
			slot0:ClearRequests()
			Destroy(slot0.go)
		end

		slot0.go = Instantiate(slot1)

		setParent(slot0.go, slot0.parent)

		slot0.tf = slot0.go.transform
		slot0._currentTpl = slot1
	end
end

slot0.LoadPrefab = function (slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot2 = slot2 or ""
	slot0._loadingRequest[slot1 .. (slot2 or "" or "")] = 
	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2 or "", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-12, warpins: 2 ---
		slot1 = slot1._loadingRequest
		slot2 = slot2

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-13, warpins: 1 ---
			slot3 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-17, warpins: 2 ---
		slot1[slot2 .. slot3] = nil

		return
		--- END OF BLOCK #2 ---



	end)


	-- Decompilation error in this vicinity:
	slot0.New(slot1, slot2 or "", function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-12, warpins: 2 ---
		slot1 = slot1._loadingRequest
		slot2 = slot2

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-13, warpins: 1 ---
			slot3 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-17, warpins: 2 ---
		slot1[slot2 .. slot3] = nil

		return
		--- END OF BLOCK #2 ---



	end)()

	return

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 1 ---
	slot2 = ""
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-13, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #3 14-14, warpins: 1 ---
	slot7 = ""
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 15-20, warpins: 2 ---
	--- END OF BLOCK #4 ---



end

slot0.LoadSprite = function (slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3:GetComponent(typeof(Image)).enabled = false

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 1 ---
		slot2 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-21, warpins: 2 ---
	slot7 = slot0.New(slot1, slot2, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot0.enabled = true
		slot0.sprite = slot0

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-12, warpins: 1 ---
			slot0:SetNativeSize()
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 13-15, warpins: 2 ---
		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-18, warpins: 1 ---
			slot2(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 19-24, warpins: 2 ---
		slot1 = slot3._loadingRequest
		slot2 = slot4

		if not slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-25, warpins: 1 ---
			slot3 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 26-29, warpins: 2 ---
		slot1[slot2 .. slot3] = nil

		return
		--- END OF BLOCK #3 ---



	end)
	slot8 = slot0._loadingRequest
	slot9 = slot1

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 22-22, warpins: 1 ---
		slot10 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 23-28, warpins: 2 ---
	slot8[slot9 .. slot10] = slot7

	slot7()

	return
	--- END OF BLOCK #2 ---



end

slot0.LoadSpine = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 or #slot1 < 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 2 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-16, warpins: 1 ---
	slot3 = slot0.New(slot1, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-6, warpins: 1 ---
			slot0(slot0)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 7-12, warpins: 2 ---
		slot1 = slot1._loadingRequest

		if not "spine/" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-13, warpins: 1 ---
			slot3 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 14-17, warpins: 2 ---
		slot1[slot2 .. slot3] = nil

		return
		--- END OF BLOCK #2 ---



	end)
	slot4 = slot0._loadingRequest
	slot5 = "spine/"

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-17, warpins: 1 ---
		slot6 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-23, warpins: 2 ---
	slot4[slot5 .. slot6] = slot3

	slot3()

	return
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 24-24, warpins: 2 ---
	--- END OF BLOCK #3 ---



end

slot0.SetActive = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	setActive(slot0.go, slot1)

	return
	--- END OF BLOCK #0 ---



end

slot0.ClearRequests = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 0 ---
	for slot4, slot5 in pairs(slot0._loadingRequest) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-9, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 10-14, warpins: 1 ---
	table.clear(slot0._loadingRequest)

	return
	--- END OF BLOCK #2 ---



end

slot0.DestroyGO = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0:ClearRequests()

	if not IsNil(slot0.go) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-15, warpins: 1 ---
		Destroy(slot0.go)

		slot0.go = nil
		slot0.tf = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.Clear = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot0.parent = nil
	slot0._tpl = nil
	slot0._currentTpl = nil
	slot0.info = nil

	slot0:DestroyGO()
	slot0:ClearRequests()

	return
	--- END OF BLOCK #0 ---



end

return slot0
