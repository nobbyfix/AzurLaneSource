pg = pg or {}
pg.UIMgr = singletonClass("UIMgr")
pg.UIMgr._loadPanel = nil
pg.UIMgr.CameraLevel = 1
pg.UIMgr.CameraOverlay = 2

function pg.UIMgr.Init(slot0, slot1)
	print("initializing ui manager...")

	slot2 = GameObject.Find("UICamera")
	slot0._cameraBlur = slot2:GetComponent("BlurOptimized")
	slot0._staticBlur = slot2:GetComponent("UIStaticBlur")
	slot0._cameraBlurPartial = slot2:GetComponent("UIPartialBlur")
	slot0.UIMain = GameObject.Find("UICamera/Canvas/UIMain")
	slot0.OverlayMain = GameObject.Find("OverlayCamera/Overlay/UIMain")
	slot0.OverlayEffect = GameObject.Find("OverlayCamera/Overlay/UIEffect")
	slot3 = GameObject.Find("LevelCamera")
	slot4 = GameObject.Find("OverlayCamera")
	slot0.cameraBlurs = {
		[uv0.CameraLevel] = {
			slot3:GetComponent("BlurOptimized"),
			slot3:GetComponent("UIStaticBlur")
		},
		[uv0.CameraOverlay] = {
			slot4:GetComponent("BlurOptimized"),
			slot4:GetComponent("UIStaticBlur")
		}
	}
	slot0.cameraBlurCounters = {
		[uv0.CameraLevel] = 0,
		[uv0.CameraOverlay] = 0
	}
	slot0._debugPanel = DebugPanel.New()

	slot2:SetActive(false)
	seriesAsync({
		function (slot0)
			ResourceMgr.Inst:loadAssetBundleAsync("ui/commonui_atlas", function (slot0)
				uv0._common_ui_bundle = slot0

				uv1()
			end)
		end,
		function (slot0)
			ResourceMgr.Inst:loadAssetBundleAsync("skinicon", function (slot0)
				uv0._skinicon_bundle = slot0

				uv1()
			end)
		end,
		function (slot0)
			ResourceMgr.Inst:loadAssetBundleAsync("attricon", function (slot0)
				uv0._attricon_bundle = slot0

				uv1()
			end)
		end,
		function (slot0)
			uv0:SetActive(true)

			uv1._loadPanel = LoadingPanel.New(slot0)
		end,
		function (slot0)
			PoolMgr.GetInstance():GetUI("ClickEffect", true, function (slot0)
				setParent(slot0, uv0.OverlayEffect)
				SetActive(uv0.OverlayEffect, true)
				uv1()
			end)
		end
	}, slot1)
end

function pg.UIMgr.Loading(slot0, slot1)
	slot0._loadPanel:appendInfo(slot1)
end

function pg.UIMgr.LoadingOn(slot0, slot1)
	slot0._loadPanel:on(slot1)
end

function pg.UIMgr.displayLoadingBG(slot0, slot1)
	slot0._loadPanel:displayBG(slot1)
end

function pg.UIMgr.LoadingOff(slot0)
	slot0._loadPanel:off()
end

function pg.UIMgr.OnLoading(slot0)
	return slot0._loadPanel:onLoading()
end

function pg.UIMgr.LoadingRetainCount(slot0)
	return slot0._loadPanel:getRetainCount()
end

function pg.UIMgr.AddDebugButton(slot0, slot1, slot2)
	slot0._debugPanel:addCustomBtn(slot1, slot2)
end

pg.UIMgr._maxbianjie = 50
pg.UIMgr._maxbianjieInv = 0.02
pg.UIMgr._maxbianjieSqr = 2500
pg.UIMgr._followRange = 0
pg.UIMgr._stick = nil
pg.UIMgr._areaImg = nil
pg.UIMgr._stickImg = nil
pg.UIMgr._stickCom = nil
pg.UIMgr._normalColor = Color(255, 255, 255, 1)
pg.UIMgr._darkColor = Color(255, 255, 255, 0.5)
pg.UIMgr._firstPos = Vector3.zero

function pg.UIMgr.AttachStickOb(slot0, slot1)
	slot0.hrz = 0
	slot0.vtc = 0
	slot0.fingerId = -1
	slot2 = slot1:Find("Area")
	slot0._stick = slot2:Find("Stick")
	slot0._areaImg = slot2:GetComponent(typeof(Image))
	slot0._stickImg = slot0._stick:GetComponent(typeof(Image))
	slot0._stickCom = slot1:GetComponent(typeof(StickController))
	slot0._stickCom.StickBorderRate = 1

	slot0._stickCom:SetStickFunc(function (slot0, slot1)
		uv0:UpdateStick(slot0, slot1)
	end)

	slot0._firstPos = slot2.localPosition
	slot0.vtc = 0

	slot0:SetActive(true)
end

function pg.UIMgr.SetActive(slot0, slot1)
	slot0._stickActive = slot1
end

function pg.UIMgr.Marching(slot0)
	slot1 = ys.Battle.BattleConfig

	LeanTween.value(go(slot0._stick), 0, 0.625, 1.8):setOnUpdate(System.Action_float(function (slot0)
		uv0.hrz = uv1.START_SPEED_CONST_B * (slot0 - uv1.START_SPEED_CONST_A) * (slot0 - uv1.START_SPEED_CONST_A)
	end)):setOnComplete(System.Action(function ()
		uv0.hrz = 0
	end))
end

function pg.UIMgr.UpdateStick(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-66, warpins: 1 ---
	if not slot0._stickActive then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	if slot2 == -2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-14, warpins: 1 ---
		slot0:SetOutput(slot1.x, slot1.y, -2)

		return
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-16, warpins: 1 ---
		if slot2 == -1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-23, warpins: 1 ---
			slot0:SetOutput(0, 0, slot2)

			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot1.z = 0

	if slot0._maxbianjieSqr < slot1.SqrMagnitude(slot3) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-53, warpins: 1 ---
		if slot1 - slot3 / math.sqrt(slot4) * slot0._maxbianjie ~= slot0._firstPos then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-44, warpins: 1 ---
			slot6 = slot0._firstPos
			--- END OF BLOCK #0 ---



		end

		slot0._stick.localPosition = slot5

		slot0:SetOutput(slot3.x, slot3.y, slot2)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 54-65, warpins: 1 ---
		slot0._stick.localPosition = slot1

		slot0:SetOutput(slot3.x * slot0._maxbianjieInv, slot3.y * slot0._maxbianjieInv, slot2)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.SetOutput(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-36, warpins: 1 ---
	slot0.hrz = slot1
	slot0.vtc = slot2

	if slot3 >= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-9, warpins: 1 ---
		if slot0.fingerId < 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 10-18, warpins: 1 ---
			slot0._areaImg.color = uv0._normalColor
			slot0._stickImg.color = uv0._normalColor
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-34, warpins: 1 ---
		if slot0.fingerId >= 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-30, warpins: 1 ---
			slot0._areaImg.color = uv0._darkColor
			slot0._stickImg.color = uv0._darkColor
			--- END OF BLOCK #0 ---



		end

		slot0._stick.localPosition = Vector3.zero
		--- END OF BLOCK #0 ---



	end

	slot0.fingerId = slot3

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.ClearStick(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot0._stick.localPosition = Vector3.zero

	slot0._stickCom:ClearStickFunc()

	slot0._stick = nil
	slot0._areaImg = nil
	slot0._stickImg = nil
	slot0._stickCom = nil

	return
	--- END OF BLOCK #0 ---



end

slot2 = 0
slot3 = {}
slot4 = nil
slot5 = {}
slot6 = false

function pg.UIMgr.OverlayPanel(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 4-17, warpins: 2 ---
	slot2 or {}.globalBlur = false

	uv0.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, slot1, slot2 or )

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.UnOverlayPanel(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 11-12, warpins: 2 ---
	uv0.LayerWeightMgr.GetInstance():DelFromOverlay(slot1, slot2 or slot0.UIMain)

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.BlurPanel(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-59, warpins: 1 ---
	if uv0[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	uv0[slot1] = true
	uv1 = uv1 + 1

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-20, warpins: 1 ---
		slot0._cameraBlur.enabled = false
		slot0._staticBlur.enabled = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-27, warpins: 1 ---
		slot0._staticBlur.enabled = false

		if not slot0._cameraBlur.enabled then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-39, warpins: 1 ---
			slot0._cameraBlur.enabled = true
			slot0._cameraBlur.downsample = 2
			slot0._cameraBlur.blurSize = 4
			slot0._cameraBlur.blurIterations = 2
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot3 or {}.globalBlur = true

	uv2.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, slot1, slot3 or )
	slot0:UpdatePBEnable()

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.UnblurPanel(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-35, warpins: 1 ---
	if not uv0[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	uv0[slot1] = nil
	uv1 = uv1 - 1

	if uv1 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-20, warpins: 1 ---
		slot0._staticBlur.enabled = false
		slot0._cameraBlur.enabled = false
		--- END OF BLOCK #0 ---



	end

	uv2.LayerWeightMgr.GetInstance():DelFromOverlay(slot1, slot2 or slot0.UIMain)
	slot0:UpdatePBEnable()

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.OverlayPanelPB(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 4-17, warpins: 2 ---
	slot2 or {}.globalBlur = false

	uv0.LayerWeightMgr.GetInstance():Add2Overlay(LayerWeightConst.UI_TYPE_SUB, slot1, slot2 or )

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.PartialBlurTfs(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	uv0 = true
	uv1 = slot1

	slot0:UpdatePBEnable()

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.ShutdownPartialBlur(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	uv0 = false
	uv1 = {}

	slot0:UpdatePBEnable()

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.RevertPBMaterial(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	for slot5, slot6 in ipairs(slot1) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-26, warpins: 2 ---
		slot6:GetComponent(typeof(Image)).material = enabled and Material.New(Shader.Find("UI/Default")) or nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.UpdatePBEnable(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 10-82, warpins: 3 ---
	if uv0 and uv1 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-23, warpins: 1 ---
		slot0._cameraBlurPartial.downsample = 1
		slot0._cameraBlurPartial.blurSize = 2
		slot0._cameraBlurPartial.blurIteration = 1
		slot0._cameraBlurPartial.enabled = true
		--- END OF BLOCK #0 ---



	end

	if not IsNil(uv2) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-48, warpins: 2 ---
		uv2:GetComponent(typeof(Image)).material = slot1 and Material.New(Shader.Find("UI/PartialBlur")) or nil
		--- END OF BLOCK #0 ---



	end

	if uv3 ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 52-76, warpins: 1 ---
		for slot5, slot6 in ipairs(uv3) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 74-76, warpins: 2 ---
			slot6:GetComponent(typeof(Image)).material = slot1 and Material.New(Shader.Find("UI/PartialBlur")) or nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-81, warpins: 1 ---
		slot0._cameraBlurPartial.enabled = false
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.BlurCamera(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot0.cameraBlurCounters[slot1] = slot0.cameraBlurCounters[slot1] + 1

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		slot0.cameraBlurs[slot1][1].enabled = false
		slot0.cameraBlurs[slot1][2].enabled = true
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-23, warpins: 1 ---
		slot4.enabled = false

		if not slot3.enabled then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 24-31, warpins: 1 ---
			slot3.enabled = true
			slot3.downsample = 1
			slot3.blurSize = 2
			slot3.blurIterations = 1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function pg.UIMgr.UnblurCamera(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 4-36, warpins: 2 ---
	if (slot2 or 1) <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-8, warpins: 1 ---
		slot2 = slot0.cameraBlurCounters[slot1]
		--- END OF BLOCK #0 ---



	end

	slot0.cameraBlurCounters[slot1] = slot0.cameraBlurCounters[slot1] - slot2
	slot0.cameraBlurCounters[slot1] = math.max(slot0.cameraBlurCounters[slot1], 0)

	if slot0.cameraBlurCounters[slot1] == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-35, warpins: 1 ---
		slot0.cameraBlurs[slot1][2].enabled = false
		slot0.cameraBlurs[slot1][1].enabled = false
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end
