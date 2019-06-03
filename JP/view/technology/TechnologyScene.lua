slot0 = class("TechnologyScene", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "TechnologyUI"
end

function slot0.setTechnologys(slot0, slot1)
	slot0.technologyVOs = slot1
end

function slot0.setRefreshFlag(slot0, slot1)
	slot0.flag = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.player = slot1

	if slot0._resPanel then
		slot0._resPanel:setResources(slot1)
	end
end

function slot0.setTendency(slot0, slot1)
	slot0.tendency = slot1

	setText(slot0:findTF("Text", slot0.tendencyBtn), i18n("tech_change_version_mark"))
	setImageSprite(slot0:findTF("version", slot0.tendencyBtn), GetSpriteFromAtlas("ui/technologyui_atlas", "version_" .. slot0.tendency))
end

function slot0.init(slot0)
	slot0.srcollView = slot0:findTF("main/srcoll_rect/content")
	slot0.cardTpl = slot0:findTF("card_tpl", slot0.srcollView)
	slot0.srcollViewCG = slot0.srcollView:GetComponent(typeof(CanvasGroup))
	slot0.helpBtn = slot0:findTF("main/help_btn")
	slot0.refreshBtn = slot0:findTF("main/refresh_btn")
	slot0.backBtn = slot0:findTF("blur_panel/adapt/top/back")
	slot0.tendencyBtn = slot0:findTF("main/tendency_btn")
	slot0.selectetPanel = slot0:findTF("main/selecte_panel")

	setActive(slot0.selectetPanel, false)

	slot0.arrLeftBtn = slot0:findTF("left_arr_btn", slot0.selectetPanel)
	slot0.arrRightBtn = slot0:findTF("right_arr_btn", slot0.selectetPanel)
	slot0.technologyTpl = slot0:findTF("technology_card", slot0.selectetPanel)
	slot0.descTxt = slot0:findTF("desc/bg/Text", slot0.selectetPanel):GetComponent(typeof(Text))
	slot0.timerTxt = slot0:findTF("timer/bg/Text", slot0.selectetPanel):GetComponent(typeof(Text))
	slot0.itemContainer = slot0:findTF("consume_panel/bg/container", slot0.selectetPanel)
	slot0.itemTpl = slot0:findTF("item_tpl", slot0.itemContainer)
	slot0.emptyTF = slot0:findTF("consume_panel/bg/empty", slot0.selectetPanel)
	slot0.taskPanel = slot0:findTF("consume_panel/bg/task_panel", slot0.selectetPanel)
	slot0.taskSlider = slot0.taskPanel:Find("slider"):GetComponent(typeof(Slider))
	slot0.taskDesc = slot0.taskPanel:Find("slider/Text"):GetComponent(typeof(Text))
	slot0.descBG = slot0:findTF("desc/bg", slot0.selectetPanel):GetComponent(typeof(Image))
	slot0.techTimer = {}
	slot0.refreshTimer = {}
	slot0.cardtimer = {}
	slot0._playerResOb = slot0:findTF("blur_panel/adapt/top/playerRes")
	slot0._resPanel = PlayerResource.New()

	tf(slot0._resPanel._go):SetParent(tf(slot0._playerResOb), false)
end

function slot0.didEnter(slot0)
	slot0:initTechnologys()
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.technology_help_text.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.refreshBtn, function ()
		if _.any(uv0.technologyVOs, function (slot0)
			return slot0.state ~= Technology.STATE_IDLE
		end) then
			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = i18n("technology_canot_refresh")
			})

			return
		end

		pg.MsgboxMgr:GetInstance():ShowMsgBox({
			content = i18n("technology_refresh_tip"),
			onYes = function ()
				uv0:emit(TechnologyMediator.ON_REFRESH)
			end
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.tendencyBtn, function ()
		uv0:emit(TechnologyMediator.CHANGE_TENDENCY, (uv0.tendency + 1) % 3)
	end, SFX_PANEL)
	onButton(slot0, slot0.backBtn, function ()
		uv0:emit(uv1.ON_BACK)
	end, SOUND_BACK)
	onButton(slot0, slot0.selectetPanel, function ()
		uv0:cancelSelected()
	end, SFX_PANEL)
	slot0:updateRefreshBtn(slot0.flag)
	slot0._resPanel:setResources(slot0.player)
end

function slot0.initTechnologys(slot0)
	slot0.technologCards = {}
	slot0.lastButtonListener = slot0.lastButtonListener or {}

	if not slot0.itemList then
		slot0.itemList = UIItemList.New(slot0.srcollView, slot0.cardTpl)

		slot0.itemList:make(function (slot0, slot1, slot2)
			if slot0 == UIItemList.EventUpdate then
				slot2.name = slot1 + 1
				uv0.technologCards[uv0.technologyVOs[slot1 + 1].id] = slot2

				uv0:updateTechnologyTF(slot2, uv0.technologyVOs[slot1 + 1])
				uv0:updateTimer(uv0.technologyVOs[slot1 + 1])

				if uv0.lastButtonListener[slot2] then
					GetOrAddComponent(slot2, typeof(Button)).onClick:RemoveListener(uv0.lastButtonListener[slot2])
				end

				if uv0.technologyVOs[slot1 + 1]:isStart() then
					Timer.New(function ()
						uv0.srcollView:GetComponent("EnhancelScrollView"):SetHorizontalTargetItemIndex(uv1:GetComponent("EnhanceItem").scrollViewItemIndex)
					end, 0.35, 1):Start()
				end

				uv0.lastButtonListener[slot2] = function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-44, warpins: 1 ---
					playSoundEffect(SFX_PANEL)

					if uv0.technologyVOs[uv1 + 1]:getState() == Technology.STATE_FINISHED then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 16-37, warpins: 1 ---
						uv0:emit(TechnologyMediator.ON_FINISHED, {
							id = uv0.technologyVOs[uv1 + 1].id,
							pool_id = uv0.technologyVOs[uv1 + 1].poolId
						})
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 38-43, warpins: 1 ---
						uv0:onSelected(uv1 + 1)
						--- END OF BLOCK #0 ---



					end

					return
					--- END OF BLOCK #0 ---



				end

				slot3:AddListener(uv0.lastButtonListener[slot2])
			end
		end)
	end

	slot0.itemList:align(#slot0.technologyVOs)
end

function slot0.updateRefreshBtn(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 8-9, warpins: 2 ---
	setButtonEnabled(slot0.refreshBtn, slot1 == 0)

	return
	--- END OF BLOCK #0 ---



end

function slot0.onSelected(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-55, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.technologyVOs[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.technologyCount = table.getCount(slot0.technologyVOs)
	slot0.contextData.selectedIndex = slot1
	slot0.srcollViewCG.alpha = 0.3

	setActive(slot3, false)
	setActive(slot0.selectetPanel, true)

	slot4 = {}

	eachChild(slot0.srcollView, function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		uv0[tonumber(slot0.name)] = slot0

		return
		--- END OF BLOCK #0 ---



	end)

	function slot5(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-77, warpins: 1 ---
		slot2 = {
			[slot8] = uv0[slot8].localPosition.x - uv0[slot0].localPosition.x
		}
		slot3 = slot0

		for slot8, slot9 in ipairs(uv0) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-18, warpins: 1 ---
			--- END OF BLOCK #0 ---



		end

		for slot8, slot9 in ipairs(slot2) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-74, warpins: 1 ---
			if slot9 ~= 0 and (slot2[slot3] == 0 or slot1 and (slot9 > 0 and slot2[slot3] > 0 and slot2[slot3] < slot9 or slot9 < 0 and (slot2[slot3] > 0 or slot2[slot3] < slot9)) or not slot1 and (slot9 < 0 and slot2[slot3] < 0 and slot9 < slot2[slot3] or slot9 > 0 and (slot2[slot3] < 0 or slot9 < slot2[slot3]))) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 72-72, warpins: 7 ---
				slot3 = slot8
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return uv0[slot3]
		--- END OF BLOCK #0 ---



	end

	slot0:updateSelectedInfo(slot2)
	onButton(slot0, slot0.arrLeftBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		if uv0.inAnim then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0:cancelSelected()
		triggerButton(uv1(uv2, true))

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	onButton(slot0, slot0.arrRightBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-16, warpins: 1 ---
		if uv0.inAnim then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0:cancelSelected()
		triggerButton(uv1(uv2, false))

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateSelectedInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	if not slot0.contextData.selectedIndex then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0:updateTechnologyTF(slot0.technologyTpl, slot1, true)
	slot0:updateExtraInfo(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateExtraInfo(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-215, warpins: 1 ---
	slot0.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(slot2)
	slot0.descTxt.text = slot1:getConfig("desc")
	slot0.descBG.sprite = GetSpriteFromAtlas("ui/TechnologyUI_atlas", slot1:getConfig("rarity"))

	for slot8 = slot0.itemContainer.childCount + 1, #slot1:getConfig("consume"), 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-44, warpins: 2 ---
		cloneTplTo(slot0.itemTpl, slot0.itemContainer)
		--- END OF BLOCK #0 ---



	end

	for slot8 = 1, slot0.itemContainer.childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 64-74, warpins: 2 ---
		setActive(slot0.itemContainer:GetChild(slot8 - 1), slot8 <= #slot3)

		if slot8 <= #slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 68-73, warpins: 1 ---
			slot0:updateItem(slot9, slot1, slot3[slot8])
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.emptyTF, not slot3 or #slot3 <= 0)

	if slot1:hasCondition() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 110-133, warpins: 2 ---
		slot0.taskSlider.value = getProxy(TaskProxy):getTaskById(slot1:getTaskId()) or Task.New({
			id = slot5
		}).progress / getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New():getConfig("target_num")
		slot0.taskDesc.text = getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New():getConfig("desc") .. "(" .. getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New().progress .. "/" .. getProxy(TaskProxy).getTaskById(slot1.getTaskId()) or Task.New():getConfig("target_num") .. ")"
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 134-141, warpins: 1 ---
		slot0.taskDesc.text = i18n("technology_task_none_tip")
		slot0.taskSlider.value = 0
		--- END OF BLOCK #0 ---



	end

	if slot0.techTimer[slot1.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 147-156, warpins: 1 ---
		slot0.techTimer[slot1.id]:Stop()

		slot0.techTimer[slot1.id] = nil
		--- END OF BLOCK #0 ---



	end

	function slot5()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-19, warpins: 1 ---
		uv0.techTimer[uv1.id]:Stop()

		uv0.techTimer[uv1.id] = nil
		uv0.timerTxt.text = "00:00:00"

		return
		--- END OF BLOCK #0 ---



	end

	if slot1:isStarting() then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 163-182, warpins: 1 ---
		slot0.techTimer[slot1.id] = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-30, warpins: 1 ---
			if uv0.time - pg.TimeMgr.GetInstance():GetServerTime() <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-16, warpins: 1 ---
				uv1()
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 17-29, warpins: 1 ---
				uv2.timerTxt.text = pg.TimeMgr.GetInstance():DescCDTime(uv0.time - slot0)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, 1, -1)

		slot0.techTimer[slot1.id]:Start()
		slot0.techTimer[slot1.id].func()
		--- END OF BLOCK #0 ---



	end

	for slot10 = 1, slot0.itemContainer.childCount, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 189-213, warpins: 2 ---
		slot11 = slot0.itemContainer:GetChild(slot10 - 1)

		setActive(slot11:Find("check"), slot1:isStart())
		setActive(slot11:Find("icon_bg/count"), not slot1:isStart())
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.cancelSelected(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-79, warpins: 1 ---
	if not slot0.contextData.selectedIndex then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	if not slot0.technologyVOs[slot1] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	slot0.srcollViewCG.alpha = 1

	setActive(slot3, true)
	removeOnButton(slot0.arrLeftBtn)
	removeOnButton(slot0.arrRightBtn)
	setActive(slot0.selectetPanel, false)

	slot0.inAnim = true

	if slot0.timer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-41, warpins: 1 ---
		slot0.timer:Stop()

		slot0.timer = nil
		--- END OF BLOCK #0 ---



	end

	slot0.contextData.selectedIndex = nil
	slot0.timer = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		uv0.inAnim = nil

		return
		--- END OF BLOCK #0 ---



	end, 0.2, 1)

	slot0.timer:Start()

	if callback then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 59-60, warpins: 1 ---
		callback()
		--- END OF BLOCK #0 ---



	end

	if slot0.techTimer[slot2.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 66-75, warpins: 1 ---
		slot0.techTimer[slot2.id]:Stop()

		slot0.techTimer[slot2.id] = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateTechnology(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-25, warpins: 1 ---
	for slot5, slot6 in ipairs(slot0.technologyVOs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-12, warpins: 1 ---
		if slot6.id == slot1.id then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-10, warpins: 1 ---
			slot0.technologyVOs[slot5] = slot1
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0:updateTechnologyTF(slot2, slot1)
	slot0:updateTimer(slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-63, warpins: 1 ---
	slot3 = slot0.technologCards[slot1.id].Find(slot2, "frame/btns/dev_btn/time")
	slot4 = slot0.technologCards[slot1.id].Find(slot2, "frame/btns/dev_btn/limit")

	if slot0.cardtimer[slot1.id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-26, warpins: 1 ---
		slot0.cardtimer[slot1.id]:Stop()

		slot0.cardtimer[slot1.id] = nil
		--- END OF BLOCK #0 ---



	end

	if slot1:getState() == Technology.STATE_STARTING then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-61, warpins: 1 ---
		setActive(slot3, true)
		setActive(slot4, false)

		slot0.cardtimer[slot1.id] = Timer.New(function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-76, warpins: 1 ---
			if uv0.time - pg.TimeMgr:GetInstance():GetServerTime() <= 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-41, warpins: 1 ---
				if uv1.cardtimer[uv0.id] then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 22-35, warpins: 1 ---
					uv1.cardtimer[uv0.id]:Stop()

					uv1.cardtimer[uv0.id] = nil
					--- END OF BLOCK #0 ---



				end

				if not uv0:canFinish() then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 42-50, warpins: 1 ---
					setActive(uv2, false)
					setActive(uv3, true)
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 51-59, warpins: 1 ---
					uv1:emit(TechnologyMediator.ON_TIME_OVER, uv0.id)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 60-75, warpins: 1 ---
				setText(uv2:Find("text"), pg.TimeMgr:GetInstance():DescCDTime(slot0 - slot1))
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, 1, -1)

		slot0.cardtimer[slot1.id]:Start()
		slot0.cardtimer[slot1.id].func()
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateTechnologyTF(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 24-137, warpins: 2 ---
	slot0:updateInfo(slot1, slot2, slot3)
	setActive(slot0:findTF("frame/btns/finish_btn", slot1), slot2:getState() == Technology.STATE_FINISHED)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 56-57, warpins: 2 ---
		setActive(slot0:findTF("frame/btns/desc_btn", slot1), slot4 == Technology.STATE_IDLE)
		setActive(slot0:findTF("frame/btns/dev_btn", slot1), slot4 == Technology.STATE_STARTING)

		return
		--- END OF BLOCK #0 ---



	end

	removeOnButton(slot5)
	removeOnButton(slot6)
	removeOnButton(slot7)
	setActive(slot0:findTF("frame/btns/start_btn", slot1), slot4 == Technology.STATE_IDLE)
	setActive(slot7, slot4 == Technology.STATE_STARTING)

	if slot4 == Technology.STATE_IDLE then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 101-113, warpins: 1 ---
		onButton(slot0, slot6, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-64, warpins: 1 ---
			if _.any(uv0.technologyVOs, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-9, warpins: 2 ---
				return slot0.state ~= Technology.STATE_IDLE
				--- END OF BLOCK #0 ---



			end) then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-21, warpins: 1 ---
				pg.TipsMgr:GetInstance():ShowTips(i18n("technology_is_actived"))

				return
				--- END OF BLOCK #0 ---



			end

			if #uv1:getConfig("consume") > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 31-50, warpins: 1 ---
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					content = i18n("technology_task_build_tip", getDropInfo(slot0)),
					onYes = function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-14, warpins: 1 ---
						uv0:emit(TechnologyMediator.ON_START, {
							id = uv1.id,
							pool_id = uv1.poolId
						})

						return
						--- END OF BLOCK #0 ---



					end
				})
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-63, warpins: 1 ---
				uv0:emit(TechnologyMediator.ON_START, {
					id = uv1.id,
					pool_id = uv1.poolId
				})
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end, SFX_PANEL)
		setButtonEnabled(slot6, slot2:hasResToStart())
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 114-117, warpins: 1 ---
		if slot4 == Technology.STATE_STARTING then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 118-124, warpins: 1 ---
			onButton(slot0, slot7, function ()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-16, warpins: 1 ---
				pg.MsgboxMgr:GetInstance():ShowMsgBox({
					content = i18n("technology_stop_tip"),
					onYes = function ()

						-- Decompilation error in this vicinity:
						--- BLOCK #0 1-14, warpins: 1 ---
						uv0:emit(TechnologyMediator.ON_STOP, {
							id = uv1.id,
							pool_id = uv1.poolId
						})

						return
						--- END OF BLOCK #0 ---



					end
				})

				return
				--- END OF BLOCK #0 ---



			end, SFX_PANEL)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 125-128, warpins: 1 ---
			if slot4 == Technology.STATE_FINISHED then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 129-134, warpins: 1 ---
				onButton(slot0, slot5, function ()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-14, warpins: 1 ---
					uv0:emit(TechnologyMediator.ON_FINISHED, {
						id = uv1.id,
						pool_id = uv1.poolId
					})

					return
					--- END OF BLOCK #0 ---



				end, SFX_PANEL)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.dfs(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	if slot1.name ~= "item_tpl" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-17, warpins: 1 ---
		for slot6 = 1, slot1.childCount, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-16, warpins: 2 ---
			slot0:dfs(slot1:GetChild(slot6 - 1), slot2)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-20, warpins: 1 ---
		slot2(slot1)
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateInfo(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 106-169, warpins: 2 ---
	setImageSprite(slot0:findTF("frame", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("bg") .. (slot3 and "_l" or "")))
	setImageSprite(slot0:findTF("frame/icon_mask/icon", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("bg_icon")), true)
	setImageSprite(slot0:findTF("frame/label", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("label")))
	setImageSprite(slot0:findTF("frame/label/text", slot1), GetSpriteFromAtlas("technologycard", slot2:getConfig("label_color")), true)
	setImageSprite(slot0:findTF("frame/label/version", slot1), GetSpriteFromAtlas("technologycard", "version_" .. slot2:getConfig("blueprint_version")), true)
	setText(slot0:findTF("frame/name_bg/Text", slot1), slot2:getConfig("name"))
	setText(slot0:findTF("frame/sub_name", slot1), slot2:getConfig("sub_name") or "")

	slot4 = slot2:getConfig("drop_client")
	slot6 = 0

	slot0:dfs(slot1:Find("frame/item_container"), function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-29, warpins: 2 ---
		uv0 = uv0 + 1

		setActive(slot0, uv0 <= #uv1)

		if uv0 <= #uv1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-28, warpins: 1 ---
			uv2:updateItem(slot0, uv3, uv1[uv0])
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 167-167, warpins: 2 ---
		setActive(slot5:GetChild(1), #slot4 > 2)

		slot5:GetChild(0):GetComponent("HorizontalLayoutGroup").padding.right = #slot4 == 4 and 25 or 0
		slot5:GetChild(1):GetComponent("HorizontalLayoutGroup").padding.left = #slot4 == 4 and 25 or 0
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateItem(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-57, warpins: 1 ---
	updateDrop(slot1, nil)

	if not IsNil(slot0:findTF("icon_bg/count", slot1)) then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-49, warpins: 2 ---
		slot6 = nil

		setColorCount(slot5, (slot3[1] ~= DROP_TYPE_RESOURCE or slot0.player:getResById(slot3[2])) and getProxy(BagProxy):getItemCountById(nil.id), slot3[3])
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot1, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-46, warpins: 2 ---
		if #(uv0:getConfig("display_icon") or {}) > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-38, warpins: 1 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				type = MSGBOX_TYPE_ITEM_BOX,
				items = _.map(slot0, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-6, warpins: 1 ---
					return {
						type = slot0[1],
						id = slot0[2]
					}
					--- END OF BLOCK #0 ---



				end),
				content = uv0:getConfig("display"),
				itemFunc = function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-8, warpins: 1 ---
					uv0:emit(uv1.ON_ITEM, slot0.id)

					return
					--- END OF BLOCK #0 ---



				end
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 39-45, warpins: 1 ---
			uv1:emit(uv2.ON_DROP, uv0)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.clearTimer(slot0, ...)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	if slot0.timer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.timer:Stop()

		slot0.timer = nil
		--- END OF BLOCK #0 ---



	end

	for slot4, slot5 in pairs(slot0.techTimer) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-18, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---



	end

	slot0.techTimer = {}

	for slot4, slot5 in pairs(slot0.cardtimer) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-29, warpins: 1 ---
		slot5:Stop()
		--- END OF BLOCK #0 ---



	end

	slot0.cardtimer = {}

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot0:clearTimer()

	slot0.techTimer = nil
	slot0.cardtimer = {}

	return
	--- END OF BLOCK #0 ---



end

return slot0
