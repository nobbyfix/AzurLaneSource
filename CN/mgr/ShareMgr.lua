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
pg.ShareMgr.TypeNewShipDesignSSR = 11
pg.ShareMgr.PANEL_TYPE_BLACK = 1
pg.ShareMgr.PANEL_TYPE_PINK = 2

function pg.ShareMgr.Init(slot0)
	PoolMgr.GetInstance():GetUI("ShareUI", false, function (slot0)
		uv0.go = slot0

		uv0.go:SetActive(false)

		uv0.tr = slot0.transform
		uv0.panelBlack = uv0.tr:Find("panel")
		uv0.panelPink = uv0.tr:Find("panel_pink")
		uv0.decks = {
			uv0.tr:Find("deck"),
			uv0.tr:Find("deck_right"),
			uv0.tr:Find("deck_blue")
		}

		setActive(uv0.panelBlack, false)
		setActive(uv0.panelPink, false)

		for slot4, slot5 in pairs(uv0.decks) do
			setActive(slot5, false)
		end
	end)

	slot0.screenshot = Application.persistentDataPath .. "/screen_scratch/last_picture_for_share.jpg"
	slot0.cacheComps = {}
	slot0.cacheShowComps = {}
	slot0.cacheMoveComps = {}
end

function pg.ShareMgr.Share(slot0, slot1, slot2)
	if not isAiriJP() and not WBManager.IsSupportShare() then
		uv0.TipsMgr:GetInstance():ShowTips("指挥官，当前平台暂不支持分享功能哦")

		return
	end

	if IsNil(slot0.go) then
		slot0:Init()
	end

	if (slot2 or uv1.PANEL_TYPE_BLACK) == uv1.PANEL_TYPE_BLACK then
		slot0.panel = slot0.panelBlack
	elseif slot2 == uv1.PANEL_TYPE_PINK then
		slot0.panel = slot0.panelPink
	end

	setActive(slot0.panelBlack, slot2 == uv1.PANEL_TYPE_BLACK)
	setActive(slot0.panelPink, slot2 == uv1.PANEL_TYPE_PINK)

	slot4 = getProxy(PlayerProxy):getRawData()

	SetActive(slot0.decks, true)
	setText(slot0.decks[uv0.share_template[slot1].deck or 1].Find(slot0.decks, "name"), slot4 and slot4.name or "")
	setText(slot0.decks[uv0.share_template[slot1].deck or 1].Find(slot0.decks, "server"), "所在服务器：" .. (getProxy(ServerProxy):getRawData()[getProxy(UserProxy):getRawData() and slot2 == uv1.PANEL_TYPE_PINK.server or 0] and getProxy(ServerProxy).getRawData()[getProxy(UserProxy).getRawData() and slot2 == uv1.PANEL_TYPE_PINK.server or 0].name or ""))
	setText(slot0.decks[uv0.share_template[slot1].deck or 1].Find(slot0.decks, "lv"), slot4.level)

	slot0.decks[uv0.share_template[slot1].deck or 1].anchoredPosition3D = Vector3(uv0.share_template[slot1].qrcode_location[1], uv0.share_template[slot1].qrcode_location[2], -100)
	slot0.decks[uv0.share_template[slot1].deck or 1].anchoredPosition = Vector2(uv0.share_template[slot1].qrcode_location[1], uv0.share_template[slot1].qrcode_location[2])

	setParent(slot0.decks, slot11, false)
	slot0.decks[uv0.share_template[slot1].deck or 1].SetAsLastSibling(slot0.decks)
	_.each(uv0.share_template[slot1].hidden_comps, function (slot0)
		if not IsNil(GameObject.Find(slot0)) and slot1.activeSelf then
			table.insert(uv0.cacheComps, slot1)
			slot1:SetActive(false)
		end
	end)
	_.each(uv0.share_template[slot1].show_comps, function (slot0)
		print("showpath:" .. slot0)

		if not IsNil(GameObject.Find(slot0)) and not slot1.activeSelf then
			print("showpath111:" .. slot0)
			table.insert(uv0.cacheShowComps, slot1)
			slot1:SetActive(true)
		end
	end)
	_.each(uv0.share_template[slot1].move_comps, function (slot0)
		print("movepath:" .. slot0.path)

		if not IsNil(GameObject.Find(slot0.path)) then
			print("movepath:" .. slot0.path, slot4, slot0.y)
			table.insert(uv0.cacheMoveComps, {
				slot1,
				slot1.transform.anchoredPosition.x,
				slot1.transform.anchoredPosition.y
			})
			setAnchoredPosition(slot1, {
				x = slot0.x,
				y = slot0.y
			})
		end
	end)

	slot14 = nil

	if isAiriJP() then
		slot15 = (1.7777777777777777 >= Screen.width / Screen.height or ScreenShooter.New(math.floor(Screen.height * slot12), Screen.height, TextureFormat.ARGB32)) and ScreenShooter.New(Screen.width, math.floor(Screen.width / slot12), TextureFormat.ARGB32):TakePhoto(slot10)

		slot15:LoadImage(slot16)
		AiriSdkMgr.inst:ShareCustomScreenshot(slot3.description, slot15)
		uv0.UIMgr.GetInstance():LoadingOn()

		time = Timer.New(function ()
			uv0.UIMgr.GetInstance():LoadingOff()
		end, 2, 0, 1)

		time:Start()
	elseif slot14:Take(slot10, slot0.screenshot) then
		print("截图位置: " .. slot0.screenshot)
		slot0:Show(slot3)
	else
		uv0.TipsMgr:GetInstance():ShowTips("截图失败")
	end

	setParent(slot9, slot0.tr, false)
	_.each(slot0.cacheComps, function (slot0)
		slot0:SetActive(true)
	end)

	slot0.cacheComps = {}

	_.each(slot0.cacheShowComps, function (slot0)
		slot0:SetActive(false)
	end)

	slot0.cacheShowComps = {}

	_.each(slot0.cacheMoveComps, function (slot0)
		setAnchoredPosition(slot0[1], {
			x = slot0[2],
			y = slot0[3]
		})
	end)

	slot0.cacheMoveComps = {}
end

function pg.ShareMgr.Show(slot0, slot1)
	slot0.go:SetActive(true)
	uv0.UIMgr.GetInstance():BlurPanel(slot0.panel)
	uv0.DelegateInfo.New(slot0)
	onButton(slot0, slot0.panel:Find("main/top/btnBack"), slot2)
	onButton(slot0, slot0.panel:Find("main/buttons/weibo"), function ()
		WBManager.Inst:Share(uv0.description, uv1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				uv0.TipsMgr:GetInstance():ShowTips("分享成功")
			end
		end)
		uv3()
	end)
	onButton(slot0, slot0.panel:Find("main/buttons/weixin"), function ()
		WXManager.Inst:Share(uv0.description, uv1.screenshot, function (slot0, slot1)
			if slot0 and slot1 == 0 then
				uv0.TipsMgr:GetInstance():ShowTips("分享成功")
			elseif slot1 == 99 then
				uv0.TipsMgr:GetInstance():ShowTips("指挥官，你没有安装微信客户端哦")
			end
		end)
		uv3()
	end)
end
