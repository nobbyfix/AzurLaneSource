pg = pg or {}
pg.ShareMgr = singletonClass("ShareMgr")
pg.ShareMgr.TypeAdmira = 1
pg.ShareMgr.TypeShipProfile = 2
pg.ShareMgr.TypeNewShip = 3
pg.ShareMgr.TypeBackyard = 4
pg.ShareMgr.TypeNewSkin = 5
pg.ShareMgr.TypeSummary = 6
pg.ShareMgr.TypePhoto = 7
pg.ShareMgr.TypeReflux = 8
pg.ShareMgr.TypeCommander = 9
pg.ShareMgr.TypeColoring = 10
pg.ShareMgr.TypeChallenge = 11
pg.ShareMgr.PANEL_TYPE_BLACK = 1
pg.ShareMgr.PANEL_TYPE_PINK = 2

pg.ShareMgr.Init = function (slot0)
	PoolMgr.GetInstance():GetUI("ShareUI", false, function (slot0)
		slot0.go = slot0

		slot0.go:SetActive(false)

		slot0.tr = slot0.transform
		slot0.panelBlack = slot0.tr:Find("panel")
		slot0.panelPink = slot0.tr:Find("panel_pink")
		slot0.decks = {
			slot0.tr:Find("deck"),
			slot0.tr:Find("deck_right"),
			slot0.tr:Find("deck_blue")
		}

		setActive(slot0.panelBlack, false)
		setActive(slot0.panelPink, false)

		for slot4, slot5 in pairs(slot0.decks) do
			setActive(slot5, false)
		end
	end)

	slot0.screenshot = Application.persistentDataPath .. "/screen_scratch/last_picture_for_share.jpg"
	slot0.cacheComps = {}
	slot0.cacheShowComps = {}
	slot0.cacheMoveComps = {}
end

pg.ShareMgr.Share = function (slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 20-24, warpins: 2 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-29, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 32-35, warpins: 2 ---
	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 45-50, warpins: 3 ---
	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 54-60, warpins: 2 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 64-87, warpins: 2 ---
	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 92-94, warpins: 2 ---
	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 99-100, warpins: 2 ---
	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 105-108, warpins: 2 ---
	if not isAiriJP() and not WBManager.IsSupportShare() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-19, warpins: 1 ---
		slot0.TipsMgr:GetInstance():ShowTips("指挥官，当前平台暂不支持分享功能哦")

		return
		--- END OF BLOCK #0 ---



	end

	if IsNil(slot0.go) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-27, warpins: 1 ---
		slot0:Init()
		--- END OF BLOCK #0 ---



	end

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-31, warpins: 1 ---
		slot2 = slot1.PANEL_TYPE_BLACK
		--- END OF BLOCK #0 ---



	end

	if slot2 == slot1.PANEL_TYPE_BLACK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-38, warpins: 1 ---
		slot0.panel = slot0.panelBlack
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-42, warpins: 1 ---
		if slot2 == slot1.PANEL_TYPE_PINK then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-44, warpins: 1 ---
			slot0.panel = slot0.panelPink
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot3 = setActive
	slot4 = slot0.panelBlack

	if slot2 ~= slot1.PANEL_TYPE_BLACK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-52, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-53, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.panelPink

	if slot2 ~= slot1.PANEL_TYPE_PINK then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 61-62, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 63-63, warpins: 1 ---
		slot5 = true
		--- END OF BLOCK #0 ---



	end

	slot3(slot4, slot5)

	slot3 = slot0.share_template[slot1]
	slot4 = getProxy(PlayerProxy):getRawData()
	slot6 = getProxy(ServerProxy):getRawData()

	if not getProxy(UserProxy):getRawData() or not slot5.server then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-91, warpins: 2 ---
		slot7 = 0
		--- END OF BLOCK #0 ---



	end

	slot6 = slot6[slot7]

	if not slot4 or not slot4.name then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 98-98, warpins: 2 ---
		slot7 = ""
		--- END OF BLOCK #0 ---



	end

	if not slot6 or not slot6.name then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 104-104, warpins: 2 ---
		slot8 = ""
		--- END OF BLOCK #0 ---



	end

	slot9 = slot0.decks
	slot10 = slot3.deck or 1

	SetActive(slot0.decks, true)
	slot10(slot0.decks[setActive].Find(slot0.decks, "code"), PLATFORM_CODE == PLATFORM_CH)
	setText(slot0.decks:Find("name"), slot7)
	setText(slot0.decks:Find("server"), "サーバー：" .. slot8)
	setText(slot0.decks:Find("lv"), slot4.level)

	slot0.decks.anchoredPosition3D = Vector3(slot3.qrcode_location[1], slot3.qrcode_location[2], -100)
	slot0.decks.anchoredPosition = Vector2(slot3.qrcode_location[1], slot3.qrcode_location[2])

	setParent(slot0.decks, slot0.decks[setActive].Find(slot0.decks, "code"), false)
	slot9:SetAsLastSibling()
	_.each(slot3.hidden_comps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		if not IsNil(GameObject.Find(slot0)) and slot1.activeSelf then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-22, warpins: 1 ---
			table.insert(slot0.cacheComps, slot1)
			slot1:SetActive(false)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 23-23, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)
	_.each(slot3.show_comps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		print("showpath:" .. slot0)

		if not IsNil(GameObject.Find(slot0)) and not slot1.activeSelf then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 18-32, warpins: 1 ---
			print("showpath111:" .. slot0)
			table.insert(slot0.cacheShowComps, slot1)
			slot1:SetActive(true)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-33, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end)
	_.each(slot3.move_comps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-14, warpins: 1 ---
		print("movepath:" .. slot0.path)

		if not IsNil(GameObject.Find(slot0.path)) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-44, warpins: 1 ---
			print("movepath:" .. slot0.path, slot4, slot0.y)
			table.insert(slot0.cacheMoveComps, {
				slot1,
				slot1.transform.anchoredPosition.x,
				slot1.transform.anchoredPosition.y
			})
			setAnchoredPosition(slot1, {
				x = slot0.x,
				y = slot0.y
			})
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-45, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end)

	slot14 = nil
	slot14 = (1.7777777777777777 >= Screen.width / Screen.height or ScreenShooter.New(math.floor(Screen.height * (PLATFORM_CODE == PLATFORM_CH)), Screen.height, TextureFormat.ARGB32)) and ScreenShooter.New(Screen.width, math.floor(Screen.width / (PLATFORM_CODE == PLATFORM_CH)), TextureFormat.ARGB32)
	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #10 109-109, warpins: 1 ---
	slot10 = 1
	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 110-123, warpins: 2 ---
	--- END OF BLOCK #11 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #12 124-125, warpins: 1 ---
	slot12 = false

	if false then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 126-126, warpins: 1 ---
		slot12 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #12 ---

	FLOW; TARGET BLOCK #13



	-- Decompilation error in this vicinity:
	--- BLOCK #13 127-212, warpins: 2 ---
	--- END OF BLOCK #13 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #14 213-227, warpins: 1 ---
	slot14 = ScreenShooter.New(math.floor(Screen.height * (PLATFORM_CODE == PLATFORM_CH)), Screen.height, TextureFormat.ARGB32)

	if ScreenShooter.New(math.floor(Screen.height * (PLATFORM_CODE == PLATFORM_CH)), Screen.height, TextureFormat.ARGB32) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 228-241, warpins: 1 ---
		slot14 = ScreenShooter.New(Screen.width, math.floor(Screen.width / (PLATFORM_CODE == PLATFORM_CH)), TextureFormat.ARGB32)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #14 ---

	FLOW; TARGET BLOCK #15



	-- Decompilation error in this vicinity:
	--- BLOCK #15 242-245, warpins: 2 ---
	if isAiriJP() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 246-280, warpins: 1 ---
		slot15 = slot14:TakePhoto(slot10)

		slot15:LoadImage(slot16)
		GameShare(slot3.description, slot15)
		slot0.UIMgr.GetInstance():LoadingOn()

		time = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-8, warpins: 1 ---
			slot0.UIMgr.GetInstance():LoadingOff()

			return
			--- END OF BLOCK #0 ---



		end, 2, 0, 1)

		time:Start()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 281-287, warpins: 1 ---
		if slot14:Take(slot10, slot0.screenshot) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 288-297, warpins: 1 ---
			print("截图位置: " .. slot0.screenshot)
			slot0:Show(slot3)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 298-306, warpins: 1 ---
			slot0.TipsMgr:GetInstance():ShowTips("截图失败")
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #15 ---

	FLOW; TARGET BLOCK #16



	-- Decompilation error in this vicinity:
	--- BLOCK #16 307-334, warpins: 3 ---
	setParent(slot9, slot0.tr, false)
	_.each(slot0.cacheComps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:SetActive(true)

		return
		--- END OF BLOCK #0 ---



	end)

	slot0.cacheComps = {}

	_.each(slot0.cacheShowComps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0:SetActive(false)

		return
		--- END OF BLOCK #0 ---



	end)

	slot0.cacheShowComps = {}

	_.each(slot0.cacheMoveComps, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		setAnchoredPosition(slot0[1], {
			x = slot0[2],
			y = slot0[3]
		})

		return
		--- END OF BLOCK #0 ---



	end)

	slot0.cacheMoveComps = {}

	return
	--- END OF BLOCK #16 ---

	FLOW; TARGET BLOCK #17



	-- Decompilation error in this vicinity:
	--- BLOCK #17 335-335, warpins: 2 ---
	--- END OF BLOCK #17 ---



end

pg.ShareMgr.Show = function (slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-48, warpins: 1 ---
	slot0.go:SetActive(true)
	slot0.UIMgr.GetInstance():BlurPanel(slot0.panel)
	slot0.DelegateInfo.New(slot0)
	onButton(slot0, slot0.panel:Find("main/top/btnBack"), slot2)
	onButton(slot0, slot0.panel:Find("main/buttons/weibo"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		WBManager.Inst:Share(slot0.description, slot1.screenshot, function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if slot0 and slot1 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-13, warpins: 1 ---
				slot0.TipsMgr:GetInstance():ShowTips("分享成功")
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 14-14, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot1.screenshot()

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.panel:Find("main/buttons/weixin"), function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		WXManager.Inst:Share(slot0.description, slot1.screenshot, function (slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-2, warpins: 1 ---
			if slot0 and slot1 == 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-14, warpins: 1 ---
				slot0.TipsMgr:GetInstance():ShowTips("分享成功")
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-16, warpins: 2 ---
				if slot1 == 99 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 17-25, warpins: 1 ---
					slot0.TipsMgr:GetInstance():ShowTips("指挥官，你没有安装微信客户端哦")
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 26-26, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end)
		slot1.screenshot()

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

return
