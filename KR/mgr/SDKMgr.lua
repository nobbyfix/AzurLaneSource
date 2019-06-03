pg = pg or {}
pg.SDKMgr = singletonClass("SDKMgr")
slot2 = nil

function pg.SDKMgr.Init(slot0, slot1)
	print("initializing sdk manager...")

	uv0 = BilibiliSdkMgr.inst

	if CHANNEL_NAME == "txwy_kr" then
		uv0 = TxwySdkMgr.inst

		slot0:queryWithProduct()
	end

	slot1()
end

function pg.SDKMgr.GetChannelUID(slot0)
	return uv0.channelUID
end

function pg.SDKMgr.isPlatform(slot0)
	return uv0.isPlatform
end

function pg.SDKMgr.isTenc(slot0)
	return uv0.isTenc
end

function pg.SDKMgr.isAiriJP(slot0)
	return uv0.isAiriJP
end

function pg.SDKMgr.localLogin(slot0)
	uv0:localLogin()
end

function pg.SDKMgr.login(slot0, slot1)
	uv0:login(slot1)
end

function pg.SDKMgr.localLogout(slot0)
	uv0:localLogout()
end

function pg.SDKMgr.tryTencLogin(slot0)
	uv0:tryTencLogin()
end

function pg.SDKMgr.getDeviceModel(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		return uv0:getDeviceModel()
	end
end

function pg.SDKMgr.createRole(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	uv0:createRole(id, slot2, slot3, slot4, slot5, slot6)
end

function pg.SDKMgr.enterServer(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	uv0:enterServer(tostring(slot1), slot2, playerId, slot4, slot5, slot6, slot7, slot8)
end

function pg.SDKMgr.chooseServer(slot0, slot1, slot2)
	uv0:chooseServer(tostring(slot1), slot2)
end

function pg.SDKMgr.levelUp(slot0, slot1)
	if CHANNEL_NAME == "txwy_kr" then
		if CSharpVersion > 7 then
			uv0:levelUp(slot1, getProxy(ServerProxy).getLastServer(slot4, getProxy(UserProxy).getData(slot2).uid).id)
		else
			uv0:levelUp(slot1)
		end
	else
		uv0:levelUp()
	end
end

function pg.SDKMgr.completedTutorial(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:completedTutorial()
	end
end

function pg.SDKMgr.unlockAchievement(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:unlockAchievement()
	end
end

function pg.SDKMgr.queryWithProduct(slot0)
	uv0:queryWithProduct(slot0:GetProductCode(), function (slot0)
		for slot5, slot6 in ipairs(slot1) do
			uv0:CheckProductPrice(string.split(slot6, "|")[1], string.split(slot6, "|")[2])
		end
	end)
end

function pg.SDKMgr.GetProductCode(slot0)
	for slot5, slot6 in ipairs(uv0.pay_data_display.all) do
		slot1 = "" .. uv0.pay_data_display[slot6].id_str .. ";"
	end

	return slot1
end

function pg.SDKMgr.CheckProductPrice(slot0, slot1, slot2)
	for slot6, slot7 in ipairs(uv0.pay_data_display.all) do
		if uv0.pay_data_display[slot7].id_str == slot1 and slot8.money ~= slot2 then
			print(string.format("<color=#ff0000>%s的商品价格和本地的价格不同</color> 本地价格：%s, 服务器价格：%s", slot8.name, slot8.money, slot2))
		end
	end
end

function pg.SDKMgr.pay(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:pay(slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)
	else
		uv0:pay(slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	end
end

function pg.SDKMgr.GetSdkServerID(slot0)
	if CHANNEL_NAME == "txwy_kr" and CSharpVersion > 7 then
		return uv0:getServerID()
	end
end

function pg.SDKMgr.callSdkApi(slot0, slot1, slot2)
	uv0:callSdkApi(slot1, slot2)
end

function pg.SDKMgr.onBackPressed(slot0)
	uv0:onBackPressed()
end

function pg.SDKMgr.userCenter(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		slot2 = "未登入"

		if getProxy(PlayerProxy) then
			slot2 = slot1:getData().name
		end

		if CSharpVersion > 7 then
			uv0:userCenter(slot2, UpdateMgr.Inst.currentVersion:ToString(), "1")
		else
			uv0:userCenter(slot2, slot3)
		end
	end
end

function pg.SDKMgr.bugReport(slot0)
	slot4 = getProxy(ServerProxy).getLastServer(slot3, getProxy(UserProxy).getData(slot1).uid)

	if CHANNEL_NAME == "txwy_kr" then
		slot6 = ""

		if getProxy(PlayerProxy) then
			slot6 = slot5:getData().name
		end

		if CSharpVersion > 7 then
			uv0:bugReport(slot6, UpdateMgr.Inst.currentVersion:ToString(), slot4.id)
		else
			uv0:bugReport(slot6, slot7)
		end
	end
end

function pg.SDKMgr.storeReview(slot0)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:storeReview()
	end
end

function pg.SDKMgr.shareImg(slot0, slot1, slot2)
	if CHANNEL_NAME == "txwy_kr" then
		uv0:shareImg(slot1, slot2)
	end
end
