pg = pg or {}
pg.TipsMgr = singletonClass("TipsMgr")

function pg.TipsMgr.Ctor(slot0)
	slot0._go = nil
end

function pg.TipsMgr.Init(slot0, slot1)
	print("initializing tip manager...")

	slot0._count = 0
	slot0._tipTable = {}

	PoolMgr.GetInstance():GetUI("TipPanel", true, function (slot0)
		uv0._go = slot0

		uv0._go:SetActive(false)
		uv0._go.transform:SetParent(GameObject.Find("Overlay/UIOverlay").transform, false)

		uv0._tips = uv0._go.transform:Find("toolTip")
		uv0._picTips = uv0._go.transform:Find("toolPicTip")
		uv0._grid = uv0._go.transform:Find("Grid")

		uv1()
	end)
end

function pg.TipsMgr.ShowTips(slot0, slot1, slot2, slot3)
	playSoundEffect(slot3 or SFX_UI_TIP)
	slot0._go.transform:SetAsLastSibling()
	SetActive(slot0._go, true)

	slot0._count = slot0._count + 1
	slot4 = cloneTplTo(slot0._tips, slot0._grid)

	setText(slot4.transform:Find("Text"), "<color=" .. (slot2 or "white") .. ">" .. slot1 .. "</color>")

	slot4.transform.localScale = Vector3(0, 0.1, 1)

	LeanTween.scale(slot4, Vector3(1.8, 0.1, 1), 0.1):setUseEstimatedTime(true)
	LeanTween.scale(slot4, Vector3(1.1, 1.1, 1), 0.1):setDelay(0.1):setUseEstimatedTime(true)

	if slot0._count <= 3 then
		slot0._tipTable[slot0._count] = slot4

		function (slot0, slot1)
			slot2 = GetOrAddComponent(slot0, "CanvasGroup")

			Timer.New(function ()
				if IsNil(uv0) then
					return
				end

				LeanTween.scale(uv0, Vector3(0.1, 1.5, 1), 0.1):setUseEstimatedTime(true):setOnComplete(System.Action(function ()
					LeanTween.scale(uv0, Vector3.zero, 0.1):setUseEstimatedTime(true):setOnComplete(System.Action(function ()
						Destroy(uv0)

						for slot3, slot4 in pairs(uv1._tipTable) do
							if slot4 == uv0 then
								table.remove(uv1._tipTable, slot3)
							end
						end

						uv1._count = uv1._count - 1

						if uv1._count == 0 then
							SetActive(uv1._go, false)
						end
					end))
				end))
			end, 3):Start()
		end(slot4, slot0._count)
	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-106, warpins: 1 ---
		Destroy(slot0._tipTable[1])
		table.remove(slot0._tipTable, 1)

		slot0._count = 3
		slot0._tipTable[3] = slot4

		slot6(slot4, slot0._count)
		--- END OF BLOCK #0 ---



	end
end

function pg.TipsMgr.ShowPicTips(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 25-69, warpins: 2 ---
	playSoundEffect(slot4 or SFX_UI_TIP)
	slot0._go.transform:SetAsLastSibling()
	SetActive(slot0._go, true)

	slot0._count = slot0._count + 1

	setText(cloneTplTo(slot0._picTips, slot0._grid).transform:Find("Text"), "<color=" .. (slot3 or "white") .. ">\"" .. slot1 .. "\" x" .. slot2 .. "</color>")

	if slot0._count <= 3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-51, warpins: 1 ---
		slot0._tipTable[slot0._count] = slot5

		function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-25, warpins: 1 ---
			GetOrAddComponent(slot0, "CanvasGroup").alpha = 1
			slot2 = LeanTween.alphaCanvas(slot1, 0, 5):setUseEstimatedTime(true):setOnComplete(System.Action(function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-34, warpins: 1 ---
				Destroy(uv0)

				for slot3, slot4 in pairs(uv1._tipTable) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 9-19, warpins: 1 ---
					if slot4 == uv0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 12-17, warpins: 1 ---
						table.remove(uv1._tipTable, slot3)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				uv1._count = uv1._count - 1

				if uv1._count == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 29-33, warpins: 1 ---
					SetActive(uv1._go, false)
					--- END OF BLOCK #0 ---



				end

				return
				--- END OF BLOCK #0 ---



			end))

			return
			--- END OF BLOCK #0 ---



		end(slot5)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-67, warpins: 1 ---
		Destroy(slot0._tipTable[1])
		table.remove(slot0._tipTable, 1)

		slot0._count = 3
		slot0._tipTable[3] = slot5

		slot7(slot5)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end
