slot0 = class("NewGuildScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "NewGuildUI"
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1

	slot0._resPanel:setResources(slot1)
end

function slot0.init(slot0)
	slot0.createPanel = slot0:findTF("create_panel")
	slot0.factionPanel = slot0:findTF("faction_panel")
	slot0.createBtn = slot0:findTF("create_panel/frame/create_btn")
	slot0.joinBtn = slot0:findTF("create_panel/frame/join_btn")
	slot0.topPanel = slot0:findTF("blur_panel/adapt/top")
	slot0._playerResOb = slot0:findTF("playerRes", slot0.topPanel)
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)

	slot0.backBtn = slot0:findTF("back", slot0.topPanel)

	setActive(slot0.factionPanel, false)

	slot0.mask = slot0:findTF("mask")

	SetActive(slot0.mask, false)
end

function slot0.didEnter(slot0)
	slot0:select()
end

function slot0.startCreate(slot0)
	setActive(slot0.createPanel, true)
end

function slot0.select(slot0)
	slot0:startCreate()
	onButton(slot0, slot0.createBtn, function ()
		uv0:createGuild()
	end, SFX_PANEL)
	onButton(slot0, slot0.joinBtn, function ()
		uv0:joinGuild()
	end, SFX_PANEL)
	onButton(slot0, slot0.createPanel, function ()
		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)
	onButton(slot0, slot0.backBtn, function ()
		if go(uv0.createPanel).activeSelf then
			uv0:emit(uv1.ON_BACK)
		end
	end, SFX_CANCEL)
end

function slot0.createGuild(slot0)
	setActive(slot0.createPanel, false)
	setActive(slot0.factionPanel, false)

	slot0.createProcess = coroutine.wrap(function ()
		setActive(uv0.createPanel, false)

		slot0 = Guild.New({})

		uv0:selectFaction(slot0, uv0.createProcess)
		coroutine.yield()
		uv0:setDescInfo(slot0:getUIName(), slot0)
	end)

	slot0.createProcess()
end

function slot0.selectFaction(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		uv0.isPlaying = true
		slot2 = slot0:Find("bg")

		setActive(slot2, true)

		slot3 = slot2:GetComponent("CanvasGroup")

		LeanTween.value(go(slot2), 1, 3, 0.5):setOnUpdate(System.Action_float(function (slot0)
			uv0.localScale = Vector3(slot0, slot0, 1)
			uv1.alpha = 1 - slot0 / 3
		end)):setOnComplete(System.Action(function ()
			setActive(uv0, false)

			uv0.localScale = Vector3(1, 1, 1)
			uv1.isPlaying = false

			uv2()
		end))
	end

	setActive(slot0.factionPanel, true)

	slot5 = slot0.factionPanel.Find(slot4, "panel")
	slot6 = slot5:Find("blhx")
	slot7 = slot5:Find("cszz")
	slot8 = slot5:Find("bg")

	if not slot0.isInitFaction then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-30, warpins: 1 ---
		function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-46, warpins: 1 ---
			setImageSprite(uv0, GetSpriteFromAtlas("commonbg/camp_bg", ""))
			setImageSprite(uv1:Find("bg"), GetSpriteFromAtlas("clutter/blhx_icon", ""))
			setImageSprite(uv2:Find("bg"), GetSpriteFromAtlas("clutter/cszz_icon", ""))
			setActive(uv1:Find("bg"), false)
			setActive(uv2:Find("bg"), false)

			return
			--- END OF BLOCK #0 ---



		end()

		slot0.isInitFaction = true
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot6, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		if uv0.isPlaying then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv1:setFaction(Guild.FACTION_TYPE_BLHX)
		uv2()
		uv3(uv4, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-1, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot7, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		if uv0.isPlaying then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv1:setFaction(Guild.FACTION_TYPE_CSZZ)
		uv2()
		uv3(uv4, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-1, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end)
	onButton(slot0, slot0.backBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-27, warpins: 1 ---
		if uv0.isPlaying then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0.createProcess = nil

		setActive(uv0.createPanel, true)
		setActive(uv0.factionPanel, false)
		onButton(uv0, uv0.backBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			uv0:emit(uv1.ON_BACK)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)

		return
		--- END OF BLOCK #0 ---



	end, SFX_CANCEL)
	setActive(slot0.topPanel, true)
end

function slot0.setDescInfo(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-19, warpins: 1 ---
	pg.UIMgr:GetInstance():LoadingOn()
	PoolMgr.GetInstance():GetUI(slot1, true, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-172, warpins: 1 ---
		setActive(uv0._playerResOb, true)

		slot0.name = uv1
		uv0.infoGameobject = slot0
		slot1 = tf(slot0)

		setParent(slot1, uv0._tf)
		setActive(slot1, true)
		setActive(uv0.topPanel, true)
		uv0.topPanel:SetAsLastSibling()

		findTF(slot1, "bg/frame/confirm_btn/print_container/Text"):GetComponent(typeof(Text)).text = pg.gameset.create_guild_cost.key_value

		onInputChanged(uv0, slot2, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-15, warpins: 1 ---
			slot1, slot2 = wordVer(slot0, {
				isReplace = true
			})

			if slot1 > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				setInputText(uv0, slot2)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)
		onInputChanged(uv0, slot3, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-15, warpins: 1 ---
			slot1, slot2 = wordVer(slot0, {
				isReplace = true
			})

			if slot1 > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-14, warpins: 1 ---
				setInputText(uv0, slot2)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)

		function slot10()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-18, warpins: 1 ---
			uv1:setName(slot0)

			slot2 = wordVer(slot1)

			uv1:setManifesto(uv2.text)

			return
			--- END OF BLOCK #0 ---



		end

		onToggle(uv0, slot4, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-9, warpins: 1 ---
				uv0:setPolicy(Guild.POLICY_TYPE_RELAXATION)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		onToggle(uv0, slot5, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-10, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-9, warpins: 1 ---
				uv0:setPolicy(Guild.POLICY_TYPE_POWER)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		triggerToggle(slot4, true)
		onButton(uv0, slot6, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-17, warpins: 1 ---
			uv0.createProcess = nil

			uv0:createGuild()
			PoolMgr.GetInstance():ReturnUI(uv1, uv0.infoGameobject)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(uv0, uv0.backBtn, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-22, warpins: 1 ---
			if uv0.isPlaying then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			uv0.createProcess = nil

			uv0:createGuild()
			PoolMgr.GetInstance():ReturnUI(uv1, uv0.infoGameobject)

			return
			--- END OF BLOCK #0 ---



		end, SFX_CANCEL)
		onButton(uv0, slot7, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-109, warpins: 1 ---
			slot0 = uv0()

			if not uv1:getName() or slot1 == "" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-22, warpins: 2 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("guild_create_error_noname"))

				return
				--- END OF BLOCK #0 ---



			end

			if not nameValidityCheck(slot1, 0, 20, {
				"spece_illegal_tip",
				"login_newPlayerScene_name_tooShort",
				"login_newPlayerScene_name_tooLong",
				"err_name_existOtherChar"
			}) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-31, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			if not uv1:getFaction() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 38-49, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("guild_create_error_nofaction"))

				return
				--- END OF BLOCK #0 ---



			end

			if not uv1:getPolicy() then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 56-67, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("guild_create_error_nopolicy"))

				return
				--- END OF BLOCK #0 ---



			end

			if not uv1:getManifesto() or slot2 == "" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 76-87, warpins: 2 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("guild_create_error_nomanifesto"))

				return
				--- END OF BLOCK #0 ---



			end

			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("guild_create_confirm", uv2),
				onYes = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-27, warpins: 1 ---
					if uv0.playerVO:getTotalGem() < uv1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 9-19, warpins: 1 ---
						GoShoppingMsgBox(i18n("switch_to_shop_tip_3", i18n("word_gem")), ChargeScene.TYPE_DIAMOND)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 20-26, warpins: 1 ---
						uv0:emit(NewGuildMediator.CREATE, uv2)
						--- END OF BLOCK #0 ---



					end

					return
					--- END OF BLOCK #0 ---



				end
			})

			return
			--- END OF BLOCK #0 ---



		end, SFX_CONFIRM)
		pg.UIMgr:GetInstance():LoadingOff()

		GetOrAddComponent(slot1, "CanvasGroup").alpha = 0
		uv0.isPlaying = true

		LeanTween.value(slot0, 0, 1, 0.6):setOnUpdate(System.Action_float(function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			uv0.alpha = slot0

			return
			--- END OF BLOCK #0 ---



		end)):setOnComplete(System.Action(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			uv0.isPlaying = false

			setActive(uv0.factionPanel, false)

			return
			--- END OF BLOCK #0 ---



		end)):setDelay(0.5)

		return
		--- END OF BLOCK #0 ---



	end)

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeInfoPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	PoolMgr.GetInstance():ReturnUI(uiName, slot0.infoGameobject)

	return
	--- END OF BLOCK #0 ---



end

function slot0.joinGuild(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot0:emit(NewGuildMediator.OPEN_GUILD_LIST)

	return
	--- END OF BLOCK #0 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	if slot0.createProcess ~= nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		triggerButton(slot0.backBtn)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		triggerButton(slot0.createPanel)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	if slot0._resPanel then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0._resPanel:exit()

		slot0._resPanel = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

return slot0
