pg = pg or {}
pg.CriMgr = singletonClass("CriMgr")
pg.CriMgr.Category_CV = "Category_CV"
pg.CriMgr.Category_BGM = "Category_BGM"
pg.CriMgr.Category_SE = "Category_SE"

pg.CriMgr.Init = function (slot0, slot1)
	print("initializing cri manager...")
	seriesAsync({
		function (slot0)
			slot0:InitCri(slot0)
		end,
		function (slot0)
			slot0:LoadCueSheet("se-ui", slot0)

			slot0.seuiPlayer.cueSheet = "se-ui"
		end,
		function (slot0)
			slot0:LoadCueSheet("se-battle", slot0)

			slot0.sebattlePlayer.cueSheet = "se-battle"
		end
	}, slot1)
end

pg.CriMgr.InitCri = function (slot0, slot1)
	WWWLoader.Inst:LoadFile("cue/sound.f", function (slot0)
		GCHandle.Alloc(slot0, GCHandleType.Pinned)

		slot0.acf = slot0
		slot1 = GameObject.Find("CRIWARE")
		slot0.criErrorHandler = slot1:GetComponent(typeof(CriWareErrorHandler))
		slot0.criErrorHandler.enabled = true
		slot0.criInitializer = slot1:GetComponent(typeof(CriWareInitializer))
		slot0.criInitializer.fileSystemConfig.numberOfLoaders = 255
		slot0.criInitializer.manaConfig.numberOfDecoders = 255

		slot0.criInitializer:Initialize()

		slot0.criAtom = slot1:GetComponent(typeof(CriAtom))
		slot0.criAtom.enabled = true

		CriAtomEx.RegisterAcf(slot0.acf)
		_.each(slot2, function (slot0)
			slot1 = GameObject.New(slot0)

			slot1.transform:SetParent(slot0.transform, false)

			slot1[slot0 .. "Player"] = slot1:AddComponent(typeof(CriAtomSource))
		end)
		CriAtom.SetCategoryVolume(slot1.Category_CV, slot0:getCVVolume())
		CriAtom.SetCategoryVolume(slot1.Category_SE, slot0:getSEVolume())
		CriAtom.SetCategoryVolume(slot1.Category_BGM, slot0:getBGMVolume())

		-- Decompilation error in this vicinity:
		{
			"bgm",
			"cv",
			"story",
			"seui",
			"sebattle"
		}()
	end)
end

pg.CriMgr.Play = function (slot0, slot1, slot2, slot3)
	if CriAtom.GetCueSheet(slot2) and slot4.acb then
		slot5, slot6 = slot4.acb:GetCueInfo(slot3, nil)

		if slot5 and slot6 then
			slot1.cueSheet = slot2

			return slot1:Play(slot3), slot6
		end
	end
end

pg.CriMgr.PlaySE = function (slot0, slot1)
	if CriAtom.GetCueSheet(slot0.seuiPlayer.cueSheet) and slot2.acb and slot2.acb:Exists(slot1) then
		return slot0:Play(slot0.seuiPlayer, slot0.seuiPlayer.cueSheet, slot1)
	end

	if CriAtom.GetCueSheet(slot0.sebattlePlayer.cueSheet) and slot3.acb and slot3.acb:Exists(slot1) then
		return slot0:Play(slot0.sebattlePlayer, slot0.sebattlePlayer.cueSheet, slot1)
	end
end

pg.CriMgr.PlayCV = function (slot0, slot1, slot2)
	return slot0:Play(slot0.cvPlayer, slot1, slot2)
end

pg.CriMgr.StopCV = function (slot0)
	print("CV track --> StopCV")

	slot0.onStopCV = true

	slot0.cvPlayer:Stop()
end

pg.CriMgr.StopSEUI = function (slot0)
	slot0.seuiPlayer:Stop()
end

pg.CriMgr.StopSEBattle = function (slot0)
	slot0.sebattlePlayer:Stop()
end

pg.CriMgr.ResumeCV = function (slot0)
	print("CV track --> ResumeCV")

	slot0.onStopCV = false
end

pg.CriMgr.setStoryBGM = function (slot0, slot1)
	slot0.storyBGMName = slot1
end

pg.CriMgr.setNormalBGM = function (slot0, slot1)
	slot0.normalBGMName = slot1
end

pg.CriMgr.resumeNormalBGM = function (slot0)
	if slot0.normalBGMName then
		slot0:PlayBGM(slot0.normalBGMName)
	end
end

pg.CriMgr.resumeStoryBGM = function (slot0)
	if slot0.storyBGMName then
		slot0:PlayBGM(slot0.storyBGMName)
	end
end

pg.CriMgr.PlayBGM = function (slot0, slot1, slot2)
	if not slot2 then
		slot0:setNormalBGM(slot1)
	else
		slot0:setStoryBGM(slot1)
	end

	if slot0.bgmName == "bgm-" .. slot1 then
		return
	end

	slot0:stopBGM()

	slot0.bgmName = slot3

	slot0:LoadCueSheet(slot3, function ()
		slot0.bgmPlayer.loop = true
		slot0.bgmPlayer.bgmPlayer.cueSheet = true

		slot0.bgmPlayer.bgmPlayer.bgmPlayer:Play(0)
	end)
end

pg.CriMgr.stopBGM = function (slot0)
	if slot0.bgmPlayer.status ~= CriAtomSource.Status.Stop then
		slot0.bgmPlayer:Stop()
	end

	if slot0.bgmName then
		slot0:UnloadCueSheet(slot0.bgmName)

		slot0.bgmName = nil
	end
end

pg.CriMgr.playStory = function (slot0, slot1)
	if slot0.storySound == "bgm-story-" .. slot1 then
		return
	end

	slot0:stopStory()

	slot0.storySound = slot2

	slot0:LoadCueSheet(slot2, function ()
		slot0.storyPlayer.loop = true
		slot0.storyPlayer.storyPlayer.cueSheet = true

		slot0.storyPlayer.storyPlayer.storyPlayer:Play(0)
	end)
end

pg.CriMgr.stopStory = function (slot0)
	if slot0.storyPlayer.status ~= CriAtomSource.Status.Stop then
		slot0.storyPlayer:Stop()
	end

	if slot0.storySound then
		slot0:UnloadCueSheet(slot0.storySound)

		slot0.storySound = nil
	end
end

pg.CriMgr.getCVVolume = function (slot0)
	return PlayerPrefs.GetFloat("cv_vol", DEFAULT_CVVOLUME)
end

pg.CriMgr.setCVVolume = function (slot0, slot1)
	PlayerPrefs.SetFloat("cv_vol", slot1)
	CriAtom.SetCategoryVolume(slot0.Category_CV, slot1)
end

pg.CriMgr.getBGMVolume = function (slot0)
	return PlayerPrefs.GetFloat("bgm_vol", DEFAULT_BGMVOLUME)
end

pg.CriMgr.setBGMVolume = function (slot0, slot1)
	PlayerPrefs.SetFloat("bgm_vol", slot1)
	CriAtom.SetCategoryVolume(slot0.Category_BGM, slot1)
end

pg.CriMgr.getSEVolume = function (slot0)
	return PlayerPrefs.GetFloat("se_vol", DEFAULT_SEVOLUME)
end

pg.CriMgr.setSEVolume = function (slot0, slot1)
	PlayerPrefs.SetFloat("se_vol", slot1)
	CriAtom.SetCategoryVolume(slot0.Category_SE, slot1)
end

slot2 = {}

pg.CriMgr.LoadCueSheet = function (slot0, slot1, slot2)
	if not slot0[slot1] then
		slot0[slot1] = {
			state = "loading",
			callbacks = {}
		}
	end

	if slot3.state == "loaded" then
		if slot2 then
			slot2()
		end
	else
		if slot2 then
			table.insert(slot3.callbacks, slot2)
		end

		WWWLoader.Inst:LoadFile("cue/" .. slot1 .. ".b", function (slot0)
			if slot0[] then
				if slot1.state == "loading" then
					if not IsNil(slot0) then
						slot1.gch = GCHandle.Alloc(slot0, GCHandleType.Pinned)

						CriAtom.AddCueSheet(slot1, slot0, nil, nil)
					end

					slot1.state = "loaded"
				end

				slot1.callbacks = {}

				for slot6 = 1, #slot1.callbacks, 1 do
					slot2[slot6]()
				end
			end
		end)
	end
end

pg.CriMgr.UnloadCueSheet = function (slot0, slot1)
	if slot0[slot1] then
		CriAtom.RemoveCueSheet(slot1)

		if slot2.gch then
			GCHandle.Free(slot2.gch)
		end

		slot0[slot1] = nil
	end
end

pg.CriMgr.LoadCV = function (slot0, slot1, slot2)
	slot0:LoadCueSheet(slot0.GetCVBankName(slot1), slot2)
end

pg.CriMgr.LoadBattleCV = function (slot0, slot1, slot2)
	slot0:LoadCueSheet(slot0.GetBattleCVBankName(slot1), slot2)
end

pg.CriMgr.UnloadCVBank = function (slot0)
	slot0.GetInstance():UnloadCueSheet(slot0)
end

pg.CriMgr.GetCVBankName = function (slot0)
	return "cv-" .. slot0
end

pg.CriMgr.GetBattleCVBankName = function (slot0)
	return "cv-" .. slot0 .. "-battle"
end

return
