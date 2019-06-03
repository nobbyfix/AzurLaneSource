slot0 = class("NavalTacticsLayer", import("..base.BaseUI"))

function slot0.getUIName(slot0)
	return "NavalTacticsUI"
end

function slot0.setShips(slot0, slot1)
	slot0.shipVOs = slot1
end

function slot0.setSKillClassNum(slot0, slot1)
	slot0.skillClassNum = slot1
end

function slot0.setStudents(slot0, slot1)
	slot0.studentVOs = slot1
end

function slot0.setPlayer(slot0, slot1)
	slot0.playerVO = slot1
end

function slot0.setItemVOs(slot0, slot1)
	slot0.itemVOs = slot1 or {}

	table.sort(slot0.itemVOs, function (slot0, slot1)
		if slot0:getConfig("rarity") == slot1:getConfig("rarity") then
			return slot0.id < slot1.id
		else
			return slot3 < slot2
		end
	end)
end

function slot0.updateShipVO(slot0, slot1)
	slot0.shipVOs[slot1.id] = slot1
end

function slot0.init(slot0)
	slot0.shipCards = {}
	slot0.backBtn = slot0:findTF("blur_container/adapt/top/btnBack")
	slot0.mainPanel = slot0:findTF("mainPanel")

	setActive(slot0.mainPanel, true)

	slot0.helpBtn = slot0:findTF("paint/help_btn", slot0.mainPanel)
	slot0.UIMgr = pg.UIMgr.GetInstance()
	slot0.studentContain = slot0:findTF("students/contain/content", slot0.mainPanel)
	slot0.skillsPanel = slot0:findTF("blurOther/skillsPanel/frame")
	slot0.skillsMask = slot0:findTF("blurOther/skillsPanel")
	slot0.skillSelBtn = slot0:findTF("confirm_btn", slot0.skillsPanel)
	slot0.skillContent = slot0:findTF("skill_contain/content", slot0.skillsPanel)
	slot0.lessonPanel = slot0:findTF("blurOther/lessonPanel/frame")
	slot0.lessonMask = slot0:findTF("blurOther/lessonPanel")
	slot0.lessonSelBtn = slot0:findTF("confirm_btn", slot0.lessonPanel)
	slot0.lessonContent = slot0:findTF("bg/lessons/content", slot0.lessonPanel)
	slot0.UIMain = GameObject.Find("/OverlayCamera/Overlay/UIMain")
	slot0.nameTxts = {}
	slot0.deleteStuentQueue = {}
	slot0.blurPanelTF = slot0:findTF("blurOther")
end

function slot0.didEnter(slot0)
	slot0.lessonOverTimer = {}

	onButton(slot0, slot0.backBtn, function ()
		uv0:emit(uv1.ON_CLOSE)
	end, SFX_CANCEL)
	setActive(slot0:findTF("stamp", slot0.mainPanel), getProxy(TaskProxy):mingshiTouchFlagEnabled())

	if LOCK_CLICK_MINGSHI then
		setActive(slot0:findTF("stamp", slot0.mainPanel), false)
	end

	onButton(slot0, slot0:findTF("stamp", slot0.mainPanel), function ()
		getProxy(TaskProxy):dealMingshiTouchFlag(3)
	end, SFX_CONFIRM)
	onButton(slot0, slot0.helpBtn, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.tactics_lesson_system_introduce.tip
		})
	end, SFX_PANEL)
	onButton(slot0, slot0.lessonMask, function ()
		uv0:closeLessonSel()
		uv0:unblurView()
	end, SFX_PANEL)
	onButton(slot0, slot0.skillsMask, function ()
		uv0:closeSkllSel()
		uv0:unblurView()
	end, SFX_PANEL)
	slot0:initStudents()
end

function slot0.initStudents(slot0)
	slot0.studentTFs = {}

	for slot4 = 1, 4, 1 do
		slot0.studentTFs[slot4] = slot0.studentContain:GetChild(slot4 - 1)

		if slot4 <= NavalAcademyProxy.MAX_SKILL_CLASS_NUM then
			setActive(slot0.studentTFs[slot4], true)

			if slot4 <= slot0.skillClassNum then
				slot0:updateLockStudentPos(slot4, true)
			else
				slot0:updateLockStudentPos(slot4, false)
			end
		else
			setActive(slot0.studentTFs[slot4], false)
		end
	end
end

slot0.NUM2SHOPID = {
	21
}

function slot0.updateLockStudentPos(slot0, slot1, slot2)
	setActive(slot4, not slot2)
	setActive(slot0.studentTFs[slot1].Find(slot3, "addPanel"), slot2)
	setActive(slot0.studentTFs[slot1].Find(slot3, "infoPanel"), slot2)

	if slot2 then
		slot0:updateStudentTF(slot1, slot0.studentVOs[slot1])
	else
		onButton(slot0, slot4, function ()
			if not id2ItemId(pg.shop_template[uv1.NUM2SHOPID[uv0.skillClassNum - 1]].resource_type) then
				return
			end

			slot4 = slot2.resource_num
			slot5, slot6 = nil

			if slot2.discount ~= 0 and (table.getCount(slot2.discount_time) == 0 or pg.TimeMgr:GetInstance():inTime(slot2.discount_time)) then
				slot5 = {
					discount = slot2.discount,
					date = i18n("discount_time", math.floor((slot18 - slot17) / 86400)) .. i18n("word_date")
				}
				slot7, slot8 = unpack(slot2.discount_time)
				slot11, slot12, slot13 = unpack(slot9)
				slot19.year, slot19.month, slot19.day = unpack(slot10)

				if os.time({
					year = slot14,
					month = slot15,
					day = slot16,
					hour = slot8[2][1],
					min = slot8[2][2],
					sec = slot8[2][3]
				}) - pg.TimeMgr.GetInstance():GetServerTime() >= 86400 then
				elseif slot19 >= 3600 then
					slot5.date = i18n("discount_time", math.floor((slot18 - slot17) / 3600)) .. i18n("word_hour")
				else
					slot5.date = i18n("discount_time", math.floor((slot18 - slot17) / 60)) .. i18n("word_minute")
				end

				slot6 = i18n("open_skill_pos_discount", slot4, slot4 * (100 - slot2.discount) / 100)
				slot4 = slot4 * (100 - slot2.discount) / 100
			end

			pg.MsgboxMgr:GetInstance():ShowMsgBox({
				content = slot6 or i18n("open_skill_pos", slot4),
				onYes = function ()
					if uv0.playerVO[id2res(uv1.resource_type)] < uv2 then
						pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_resource"))

						return
					end

					uv0:emit(NavalTacticsMediator.ON_SHOPPING, uv3)
				end,
				discount = slot5
			})
		end, SFX_PANEL)
	end
end

function slot0.addStudent(slot0, slot1, slot2, slot3)
	if slot3 then
		Student.New({
			id = slot2,
			ship_id = slot1,
			state = Student.WAIT
		}):setSkillIndex(slot3)
	end

	slot0.select = coroutine.wrap(function ()
		if not uv0 then
			uv1:showSkillSel(uv2, uv1.select)
			coroutine.yield()
		end

		uv1:showLessonSel(uv2, uv1.select)
		coroutine.yield()

		uv1.studentVOs[uv3] = uv2

		uv1:updateStudentTF(uv2.id, uv2)
	end)

	slot0.select()
end

function slot0.startLesson(slot0, slot1, slot2)
	slot5 = slot0.shipVOs[slot1.shipId].skills[slot1:getSkillId(slot3)]
	slot6 = pg.skill_data_template[slot1.getSkillId(slot3)].max_level
	slot7 = pg.item_data_statistics[slot1.lessonId].name
	slot8 = slot0.shipVOs[slot1.shipId].getName(slot3)
	slot9 = getSkillName(slot1:getSkillId(slot3))

	if slot0.shipVOs[slot1.shipId]:isActivityNpc() then
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			content = i18n("npc_learn_skill_tip"),
			onYes = function ()
				pg.MsgboxMgr.GetInstance():ShowMsgBox({
					content = i18n("tactics_lesson_start_tip", uv0, uv1, uv2),
					onYes = function ()
						if uv0.level == uv1 then
							pg.TipsMgr:GetInstance():ShowTips(i18n("tactics_max_level"))

							return
						end

						if uv2 then
							uv2()
						end

						uv3:emit(NavalTacticsMediator.ON_START, {
							shipId = uv4.shipId,
							skillPos = uv4:getSkillId(uv5),
							lessonId = uv4.lessonId,
							roomId = uv4.id
						})
					end
				})
			end
		})
	else
		slot10()
	end
end

function slot0.updateStudentVO(slot0, slot1)
	slot0.studentVOs[slot1.id] = slot1

	if slot1:getState() == Student.ATTEND then
		slot0:addLeasonOverTimer(slot1)
	end
end

function slot0.updateStudentTF(slot0, slot1, slot2)
	setActive(slot4, slot2)
	setActive(slot0:findTF("addPanel", slot3), not slot2)

	if slot2 then
		slot0:updateShipInfo(slot4, slot2)
		slot0:updateSkillInfo(slot4, slot2)

		slot7 = slot0:findTF("start_btn", slot4)

		setButtonEnabled(slot6, true)

		if slot2:getState() == Student.ATTEND then
			slot0:addLeasonOverTimer(slot2)
		elseif slot2:getState() == Student.WAIT then
			setActive(slot6, false)
			setActive(slot7, true)
		end

		slot8 = slot0.shipVOs[slot2.shipId].configId

		onButton(slot0, slot6, function ()
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				content = i18n("tactics_lesson_cancel"),
				onYes = function ()
					uv0:emit(NavalTacticsMediator.ON_CANCEL, uv1.id, Student.CANCEL_TYPE_MANUAL)
				end
			})
		end, SFX_CANCEL)
	else
		onButton(slot0, findTF(slot5, "add_btn"), function ()
			uv0:goDockYard(uv1, uv2)
		end, SFX_PANEL)
	end
end

function slot0.addDeleteStudentQueue(slot0, slot1, slot2, slot3, slot4)
	table.insert(slot0.deleteStuentQueue, {
		slot1,
		slot2,
		slot3,
		slot4
	})
	setButtonEnabled(slot0.studentTFs[slot1].Find(slot5, "infoPanel/cancel_btn"), false)

	if slot0.lessonOverTimer[slot1] then
		slot0.lessonOverTimer[slot1]:Stop()

		slot0.lessonOverTimer[slot1] = nil
	end

	slot0:pushDeleteStudentQueue()
end

function slot0.pushDeleteStudentQueue(slot0)
	if not slot0.studentVOs then
		return
	end

	if #slot0.deleteStuentQueue > 0 and not slot0.openMsgBox then
		table.remove(slot0.deleteStuentQueue, 1)
		scrollTo(slot0:findTF("students/contain", slot0.mainPanel), 0, 1 - math.max(slot0.deleteStuentQueue[1][1] - 2, 0) / (NavalAcademyProxy.MAX_SKILL_CLASS_NUM - 2))
		slot0:deleteStudentVO(slot0.deleteStuentQueue[1][1], slot0.deleteStuentQueue[1][2], slot0.deleteStuentQueue[1][3], slot0.deleteStuentQueue[1][4])
	end
end

slot1 = 1

function slot0.deleteStudentVO(slot0, slot1, slot2, slot3, slot4)
	slot0.openMsgBox = true
	slot8 = nil

	for slot13, slot14 in ipairs(slot9) do
		if slot14 == slot0.studentVOs[slot1].getSkillId(slot5, slot6) then
			slot8 = slot13

			break
		end
	end

	slot10 = getSkillConfig(slot7)
	slot13 = slot0.studentTFs[slot1].Find(slot11, "infoPanel/skill_info")
	slot14 = slot0.studentTFs[slot1].Find(slot11, "infoPanel/skill_info/level_contain/level")

	setButtonEnabled(slot15, false)

	function slot17()
		slot0 = nil

		function slot1()
			uv0.flag = nil
			uv0.studentVOs[uv1] = nil

			uv0:updateStudentTF(uv1, nil)

			if uv0.lessonOverTimer[uv1] then
				uv0.lessonOverTimer[uv1]:Stop()

				uv0.lessonOverTimer[uv1] = nil
			end
		end

		if pg.skill_data_template[uv3].max_level <= uv0.level then
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideNo = true,
				hideClose = true,
				content = uv1.level < uv0.level and i18n("tactics_end_to_learn", uv2:getName(), getSkillName(uv3), uv4) .. i18n("tactics_skill_level_up", uv1.level, uv0.level) or i18n("tactics_end_to_learn", uv2:getName(), getSkillName(uv3), uv4),
				onYes = function ()
					uv0()

					uv1.openMsgBox = false

					uv1:pushDeleteStudentQueue()
				end
			})
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				hideClose = true,
				content = slot0 .. i18n("tactics_continue_to_learn"),
				onYes = function ()
					uv0()
					uv1:addStudent(uv2.id, uv3, uv4)
				end,
				onNo = function ()
					uv0()

					uv1.openMsgBox = false

					uv1:pushDeleteStudentQueue()
				end
			})
		end
	end

	if slot3.level < slot4.level then
		function (slot0, slot1, slot2)
			uv0:updateSkillDesc(uv1, {
				id = uv2,
				name = getSkillName(uv2),
				level = slot0,
				icon = uv3.icon,
				exp = slot1 and slot1 or getConfigFromLevel1(pg.skill_need_exp, slot0).exp
			}, true, slot2)
		end(slot3.level, nil, true)
		slot0:leanTweenValue(slot12, slot0.studentTFs[slot1].Find(slot11, "infoPanel/skill_info/exp").GetComponent(slot12, typeof(Slider)).value, 1, uv0, 0, function (slot0)
			uv0.value = slot0
		end, function ()
			uv0 = uv0 + 1

			uv1(uv0)

			if uv2.level - uv0 > 0 then
				uv3:leanTweenValue(uv4, 0, 1, uv5, 0, uv6, function ()
					uv0 = uv0 + 1

					if uv0 == uv1.level then
						uv2:leanTweenValue(uv3, 0, uv1.exp / getConfigFromLevel1(pg.skill_need_exp, uv0).exp, uv4, 0, uv5, uv6)
						uv7(uv0, uv1.exp)
					else
						uv7(uv0)
					end

					setText(uv8, uv0)
				end, slot0)
			else
				uv3:leanTweenValue(uv4, 0, uv2.exp / getConfigFromLevel1(pg.skill_need_exp, uv0).exp, uv5, 0, uv6, uv7)
				uv1(uv0, uv2.exp)
			end
		end)
	else
		slot0:leanTweenValue(slot12, slot16.value, slot4.exp / getConfigFromLevel1(pg.skill_need_exp, slot19).exp, uv0, 0, slot20, slot17)
		slot18(slot19, slot4.exp, true)
	end
end

function slot0.leanTweenValue(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	if slot8 and slot8 > 0 then
		LeanTween.value(go(slot1), slot2, slot3, slot4):setOnUpdate(System.Action_float(function (slot0)
			if uv0 then
				uv0(slot0)
			end
		end)):setOnComplete(System.Action(function ()
			if uv0 then
				uv0()
			end
		end)):setDelay(slot5 or 0):setRepeat(slot8)
	end
end

function slot0.goDockYard(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 7-46, warpins: 2 ---
	if table.getCount(slot0.itemVOs or {}) <= 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-22, warpins: 1 ---
		pg.TipsMgr:GetInstance():ShowTips(i18n("tactics_no_lesson"))

		return
		--- END OF BLOCK #0 ---



	end

	slot3 = {
		[slot7] = slot8
	}

	for slot7, slot8 in pairs(slot0.studentVOs) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-37, warpins: 1 ---
		if slot8:getState() == Student.WAIT then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-35, warpins: 1 ---
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot0:emit(NavalTacticsMediator.OPEN_DOCKYARD, slot2, slot3, slot1)

	return
	--- END OF BLOCK #0 ---



end

function slot0.addLeasonOverTimer(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-45, warpins: 1 ---
	setActive(slot0:findTF("infoPanel/cancel_btn", slot2), true)
	setActive(slot0:findTF("infoPanel/start_btn", slot2), false)

	function slot3()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-33, warpins: 1 ---
		if uv0.flag then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0.flag = true

		uv0.lessonOverTimer[uv1.id]:Stop()

		uv0.lessonOverTimer[uv1.id] = nil

		uv0:emit(NavalTacticsMediator.ON_CANCEL, uv1.id, Student.CANCEL_TYPE_AUTO)

		return
		--- END OF BLOCK #0 ---



	end

	slot4 = slot1:getFinishTime()
	slot0.lessonOverTimer[slot1.id] = Timer.New(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-32, warpins: 1 ---
		if uv0 <= pg.TimeMgr.GetInstance():GetServerTime() then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-13, warpins: 1 ---
			uv1()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-31, warpins: 1 ---
			setText(uv2:Find("infoPanel/timer/Text"), pg.TimeMgr:GetInstance():DescCDTime(uv0 - slot0))
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, 1, -1)

	slot0.lessonOverTimer[slot1.id]:Start()
	slot0.lessonOverTimer[slot1.id].func()

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateSkillDesc(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-127, warpins: 1 ---
	setText(findTF(slot1, "name"), slot2.name)
	setText(findTF(slot1, "level_contain/level"), slot2.level)
	setText(findTF(slot1, "desc"), Student.getSkillDesc(slot2.id, slot2.level))

	if 26 - math.floor((#findTF(slot1, "desc"):GetComponent(typeof(Text)).text - 160) / 40) < 20 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 47-47, warpins: 1 ---
		slot6 = 20
		--- END OF BLOCK #0 ---



	end

	if slot6 > 28 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-51, warpins: 1 ---
		slot6 = 28
		--- END OF BLOCK #0 ---



	end

	slot5.fontSize = slot6

	LoadImageSpriteAsync("skillicon/" .. slot2.icon, findTF(slot1, "icon"))

	slot9 = getConfigFromLevel1(pg.skill_need_exp, slot2.level)

	if slot2.level == pg.skill_data_template[slot2.id].max_level then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 80-84, warpins: 1 ---
		setText(slot0:findTF("next_contain/Text", slot1), "MAX")
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 85-86, warpins: 1 ---
		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 109-118, warpins: 2 ---
			slot0:leanTweenValue(slot8, slot4 and tonumber(string.sub(getText(slot8), 1, string.find(getText(slot8), "/") - 1)) or 0, slot2.exp, uv0, 0, function (slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-12, warpins: 1 ---
				setText(uv0, math.floor(slot0) .. "/" .. uv1.exp)

				return
				--- END OF BLOCK #0 ---



			end)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 119-125, warpins: 1 ---
			setText(slot8, slot2.exp .. "/" .. slot9.exp)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateSkillInfo(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-81, warpins: 1 ---
	slot4 = slot2:getSkillId(slot3)

	slot0:updateSkillDesc(slot5, {
		id = slot4,
		icon = getSkillConfig(slot4).icon,
		level = slot0.shipVOs[slot2.shipId].skills[slot4].level,
		name = getSkillName(slot4),
		exp = slot0.shipVOs[slot2.shipId].skills[slot4].exp
	})

	slot8 = pg.skill_data_template[slot4].max_level

	onButton(slot0, slot5, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-21, warpins: 1 ---
		if uv0.studentVOs[uv1.id]:getState() == Student.ATTEND then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-13, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv0:showSkillSel(uv1, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-17, warpins: 1 ---
			uv0:updateSkillInfo(uv0:findTF("infoPanel", uv0.studentTFs[uv1.id]), uv1)

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)
	setSlider(slot10, 0, 1, slot0.shipVOs[slot2.shipId].skills[slot4].exp / getConfigFromLevel1(pg.skill_need_exp, slot0.shipVOs[slot2.shipId].skills[slot4].level).exp)
	setText(findTF(slot1, "timer/Text"), pg.TimeMgr:GetInstance():DescCDTime(slot2:getTime()))

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateShipInfo(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	if not slot0.shipCards[slot0.shipVOs[slot2.shipId].id] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-20, warpins: 1 ---
		slot0.shipCards[slot4.id] = DockyardShipItem.New(slot0:findTF("ship_tpl", slot1))
		--- END OF BLOCK #0 ---



	end

	slot0.shipCards[slot4.id]:update(slot4)

	return
	--- END OF BLOCK #0 ---



end

function slot0.showSkillSel(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-131, warpins: 1 ---
	slot0:blurView()

	slot0.openMsgBox = true

	setActive(slot0.skillsMask, true)

	slot5 = 0

	for slot9, slot10 in pairs(slot4) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-84, warpins: 1 ---
		if slot3.skills[slot10] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-61, warpins: 1 ---
			slot0:updateSkill(slot9, slot0.skillContent:GetChild(slot9 - 1), {
				isLearn = true,
				id = slot10,
				name = getSkillName(slot10),
				icon = getSkillConfig(slot10).icon,
				desc = getSkillDesc(slot10, slot3.skills[slot10].level),
				level = slot3.skills[slot10].level,
				exp = slot3.skills[slot10].exp
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-81, warpins: 1 ---
			slot0:updateSkill(slot9, slot11, {
				isLearn = false,
				id = slot10,
				name = getSkillName(slot10),
				icon = slot12.icon,
				desc = getSkillDesc(slot10, slot3.skills[slot10].level)
			})
			--- END OF BLOCK #0 ---



		end

		slot5 = slot5 + 1
		--- END OF BLOCK #0 ---



	end

	for slot9 = slot5, 2, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 89-100, warpins: 2 ---
		slot0:updateSkill(slot9, slot0.skillContent:GetChild(slot9), nil)
		--- END OF BLOCK #0 ---



	end

	setActive(slot0.skillContent:GetChild(3), slot5 == 4)

	slot6 = slot0:findTF("skill_contain/content", slot0.skillsPanel):GetComponent(typeof(ToggleGroup))

	onButton(slot0, slot0.skillSelBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-68, warpins: 1 ---
		if not uv0.selectedSkillIndex then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-5, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		if not uv2.skills[uv1[uv0.selectedSkillIndex]] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-26, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("tactics_should_exist_skill"))

			return
			--- END OF BLOCK #0 ---



		end

		if slot1.level == pg.skill_data_template[slot0].max_level then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 34-45, warpins: 1 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("tactics_max_level"))

			return
			--- END OF BLOCK #0 ---



		end

		uv3:setSkillIndex(uv0.selectedSkillIndex)

		uv0.selectedSkillIndex = nil

		uv4:SetAllTogglesOff()
		uv0:closeSkllSel()

		if uv5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 66-67, warpins: 1 ---
			uv5()
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.updateSkill(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 34-181, warpins: 2 ---
	setActive(slot4, slot3)
	setActive(slot5, not slot3)
	setToggleEnabled(slot2, slot3 and slot3.isLearn)
	setActive(findTF(slot2, "frame/mask"), slot3 and not slot3.isLearn)

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 89-175, warpins: 2 ---
		setText(findTF(slot4, "name_contain/name"), slot3.name)
		LoadImageSpriteAsync("skillicon/" .. slot3.icon, findTF(slot4, "icon"))
		setText(findTF(slot4, "name_contain/level_contain/label"), slot3.isLearn and "lv" or "")
		setText(findTF(slot4, "name_contain/level_contain/Text"), slot3.isLearn and slot3.level or "")
		setText(findTF(slot4, "next_contain/label"), slot3.isLearn and "NEXT:" or "")

		slot6 = nil

		if slot3.isLearn then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 94-134, warpins: 1 ---
			slot7 = getConfigFromLevel1(pg.skill_need_exp, slot3.level)

			if slot3.level == pg.skill_data_template[slot3.id].max_level then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 111-115, warpins: 1 ---
				setText(findTF(slot4, "next_contain/Text"), "MAX")
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 116-122, warpins: 1 ---
				setText(slot8, slot3.exp .. "/" .. slot7.exp)
				--- END OF BLOCK #0 ---



			end

			setText(findTF(slot4, "desc"), Student.getSkillDesc(slot3.id, slot3.level))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 135-141, warpins: 1 ---
			setText(findTF(slot4, "desc"), slot3.desc)
			--- END OF BLOCK #0 ---



		end

		if 26 - math.floor((#findTF(slot4, "desc"):GetComponent(typeof(Text)).text - 160) / 40) < 20 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 163-163, warpins: 1 ---
			slot8 = 20
			--- END OF BLOCK #0 ---



		end

		if slot8 > 28 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 167-167, warpins: 1 ---
			slot8 = 28
			--- END OF BLOCK #0 ---



		end

		slot7.fontSize = slot8

		onToggle(slot0, slot2, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-11, warpins: 1 ---
			if not uv0.isLearn then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-5, warpins: 1 ---
				return
				--- END OF BLOCK #0 ---



			end

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-10, warpins: 1 ---
				uv1.selectedSkillIndex = uv2
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)

		if slot1 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 176-179, warpins: 1 ---
			triggerToggle(slot2, true)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeSkllSel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	setActive(slot0.skillsMask, false)

	slot0.openMsgBox = false

	slot0:pushDeleteStudentQueue()

	return
	--- END OF BLOCK #0 ---



end

function slot0.showLessonSel(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-188, warpins: 1 ---
	slot0:blurView()

	slot0.openMsgBox = true

	setActive(slot0.lessonMask, true)

	slot4 = slot0.lessonContent:Find("bg")

	if slot0.lessonContent.childCount > #slot0.itemVOs then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 21-35, warpins: 1 ---
		for slot8 = slot3 - 1, #slot0.itemVOs, -1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-34, warpins: 2 ---
			setActive(slot0.lessonContent:GetChild(slot8), false)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 36-46, warpins: 1 ---
		for slot8 = 1, #slot0.itemVOs - slot3, 1 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-46, warpins: 2 ---
			cloneTplTo(slot4, slot0.lessonContent)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	slot5 = slot0.shipVOs[slot1.shipId].configId

	if slot0.shipVOs[slot1.shipId].skills[slot1:getSkillId(slot0.shipVOs[slot1.shipId])] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 72-100, warpins: 1 ---
		slot0:updateSkill(k, slot0:findTF("skill/skilltpl_1", slot0.lessonMask), {
			isLearn = true,
			id = slot6,
			name = getSkillName(slot6),
			icon = getSkillConfig(slot6).icon,
			desc = getSkillDesc(slot6, slot7.skills[slot6].level),
			level = slot7.skills[slot6].level,
			exp = slot7.skills[slot6].exp
		})
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 101-120, warpins: 1 ---
		slot0:updateSkill(k, slot8, {
			isLearn = false,
			id = slot6,
			name = getSkillName(slot6),
			icon = slot9.icon,
			desc = getSkillDesc(slot6, slot7.skills[slot6].level)
		})
		--- END OF BLOCK #0 ---



	end

	for slot13 = 1, #slot0.itemVOs, 1 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 154-180, warpins: 2 ---
		slot14 = slot0.lessonContent:GetChild(slot13 - 1)

		updateItem(slot14, slot15)
		SetActive(slot14:Find("addition"), slot0:getLessonAddition(slot6, slot0.itemVOs[slot13].id) > 1)
		setText(slot17, slot16 * 100 .. "%exp")
		setText(findTF(slot14, "icon_bg/count"), slot15.count)
		onToggle(slot0, slot14, function (slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-14, warpins: 1 ---
			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 3-13, warpins: 1 ---
				uv0.selectedLessonId = uv1.id

				uv0:updateLessonInfo(uv2, uv1.id)
				--- END OF BLOCK #0 ---



			end

			return
			--- END OF BLOCK #0 ---



		end)

		if slot13 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 175-178, warpins: 1 ---
			triggerToggle(slot14, true)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	onButton(slot0, slot0.lessonSelBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-49, warpins: 1 ---
		if not uv0.itemVOs or table.getCount(uv0.itemVOs) == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-23, warpins: 2 ---
			pg.TipsMgr:GetInstance():ShowTips(i18n("common_no_item_1"))

			return
			--- END OF BLOCK #0 ---



		end

		if not uv0.selectedLessonId then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-28, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		uv1:setLesson(uv0.selectedLessonId)
		uv1:setTime(uv0.lessonTime)
		uv0:startLesson(uv1, function ()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-16, warpins: 1 ---
			uv0:closeLessonSel()

			if uv1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-9, warpins: 1 ---
				uv1()
				--- END OF BLOCK #0 ---



			end

			uv0.selectedLessonId = nil
			uv0.lessonTime = nil

			return
			--- END OF BLOCK #0 ---



		end)

		return
		--- END OF BLOCK #0 ---



	end, SFX_PANEL)

	return
	--- END OF BLOCK #0 ---



end

function slot0.getLessonAddition(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 21-21, warpins: 2 ---
	return pg.skill_data_template[slot1].type == pg.item_data_template[slot2].usage_arg[3] and 1 + pg.gameset.same_color_lesson_addition.key_value / 100 or 1
	--- END OF BLOCK #0 ---



end

function slot0.updateLessonInfo(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-55, warpins: 1 ---
	setText(findTF(slot0.lessonPanel, "skillInfo/contain/name"), pg.item_data_statistics[slot2].name)
	setText(findTF(slot0.lessonPanel, "skillInfo/contain/desc"), pg.item_data_statistics[slot2].display)
	setText(findTF(slot0.lessonPanel, "skillInfo/contain/timer_contain/exp_timer/Text"), slot5)
	setText(findTF(slot0.lessonPanel, "skillInfo/contain/timer_contain/timer/Text"), pg.TimeMgr:GetInstance():DescCDTime(pg.item_data_template[slot2].usage_arg[1]))

	slot0.lessonTime = pg.item_data_template[slot2].usage_arg[1]

	return
	--- END OF BLOCK #0 ---



end

function slot0.closeLessonSel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	slot0.openMsgBox = false

	slot0:pushDeleteStudentQueue()
	setActive(slot0.lessonMask, false)
	slot0:unblurView()

	return
	--- END OF BLOCK #0 ---



end

function slot0.blurView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-13, warpins: 1 ---
	setActive(slot0.blurPanelTF, true)
	pg.UIMgr.GetInstance():BlurPanel(slot0.blurPanelTF)

	return
	--- END OF BLOCK #0 ---



end

function slot0.unblurView(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	setActive(slot0.blurPanelTF, false)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.blurPanelTF, slot0._tf)

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-41, warpins: 1 ---
	slot0.UIMgr:UnOverlayPanel(slot0.mainPanel, slot0._tf)
	slot0:closeLessonSel()
	slot0:closeSkllSel()
	slot0:unblurView()

	if slot0.lessonOverTimer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-29, warpins: 1 ---
		for slot4, slot5 in pairs(slot0.lessonOverTimer) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 23-27, warpins: 1 ---
			slot5:Stop()
			--- END OF BLOCK #0 ---



		end

		slot0.lessonOverTimer = nil
		--- END OF BLOCK #0 ---



	end

	for slot4, slot5 in pairs(slot0.nameTxts) do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-38, warpins: 1 ---
		slot5:destroy()
		--- END OF BLOCK #0 ---



	end

	slot0.nameTxts = nil

	return
	--- END OF BLOCK #0 ---



end

return slot0
