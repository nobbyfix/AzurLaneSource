slot0 = class("BattleContributionResultLayer", import("..base.BaseUI"))
slot0.DURATION_WIN_FADE_IN = 0.5
slot0.DURATION_LOSE_FADE_IN = 1.5
slot0.DURATION_GRADE_LAST = 1.5
slot0.DURATION_MOVE = 0.7
slot0.DURATION_WIN_SCALE = 0.7

function slot0.getUIName(slot0)
	return "BattleResultUI"
end

function slot0.setPlayer(slot0)
end

function slot0.setShips(slot0)
end

function slot0.setActId(slot0, slot1)
	slot0._actID = slot1
	slot0._resourceID = pg.activity_event_worldboss[pg.activity_template[slot1].config_id].damage_resource
end

function slot0.init(slot0)
	slot0._grade = slot0:findTF("grade")
	slot0._gradeLabel = slot0:findTF("label", slot0._grade)
	slot0._gradeLabelImg = slot0._gradeLabel:GetComponent(typeof(Image))
	slot0._levelText = slot0:findTF("Text", slot0._grade)
	slot0.clearFX = slot0:findTF("clear")
	slot0._main = slot0:findTF("main")
	slot0._blurConatiner = slot0:findTF("blur_container")
	slot0._bg = slot0:findTF("main/bg")
	slot0._rankBG = slot0:findTF("main/rank")
	slot0._rankBG.localScale = Vector3(1, 0, 1)
	rtf(slot0._rankBG).anchoredPosition = Vector2(0, 0)
	slot0._rightBottomPanel = slot0:findTF("dodgem_confirm", slot0._main)
	slot0._exitBtn = slot0:findTF("confirm_btn", slot0._rightBottomPanel)
	slot0._skipBtn = slot0:findTF("skipLayer", slot0._tf)
	slot0._contribution = slot0:findTF("contirbution", slot0._main)
	slot0._damageText = slot0:findTF("total_damage/value", slot0._contribution)
	slot0._contributionText = slot0:findTF("contribution/value", slot0._contribution)

	SetActive(slot0._contribution, false)

	slot0.UIMain = pg.UIMgr:GetInstance().UIMain
	slot0.overlay = pg.UIMgr:GetInstance().OverlayMain

	LoadImageSpriteAsync("battlescore/grade_label_clear", slot0._gradeLabel, true)
	SetActive(slot0._levelText, false)
end

function slot0.didEnter(slot0)
	setText(slot0._levelText, pg.expedition_data_template[slot0.contextData.stageId].name)

	slot0._gradeUpperLeftPos = rtf(slot0._grade).localPosition
	rtf(slot0._grade).localPosition = Vector3(0, 15, 0)
	slot0._gradeLabelImg.color = Color.New(1, 1, 1, 0)

	pg.UIMgr.GetInstance():BlurPanel(slot0._tf)

	slot0._grade.transform.localScale = Vector3(1.5, 1.5, 0)

	shiftPanel(slot0._rankBG, nil, 10, 0.7, nil)
	LeanTween.scale(slot0._rankBG, Vector3(1, 1, 1), 0.7)
	LeanTween.value(go(slot0._tf), 0, 1, uv0.DURATION_WIN_FADE_IN):setOnUpdate(System.Action_float(function (slot0)
		uv0._gradeLabelImg.color = Color.New(1, 1, 1, 1)
	end))
	LeanTween.scale(slot0._grade, Vector3(0.88, 0.88, 1), uv0.DURATION_WIN_SCALE):setEase(LeanTweenType.easeInExpo):setOnComplete(System.Action(function ()
		SetActive(uv0._levelText, true)
		uv0:rankAnimaFinish()
	end))

	slot0._tf:GetComponent(typeof(Image)).color = Color.New(0, 0, 0, 0.5)

	setText(slot0._damageText, 0)
	setText(slot0._contributionText, 0)
	SetActive(slot0._skipBtn, false)
	SetActive(slot0:findTF("main/condition"), false)

	slot0._stateFlag = "rankAnima"
	slot0._contributionPoint = 0

	for slot7, slot8 in ipairs(slot0.contextData.drops) do
		if slot8.configId == slot0._resourceID then
			slot0._contributionPoint = slot8.count
		end
	end
end

function slot0.rankAnimaFinish(slot0)
	onButton(slot0, slot0._bg, function ()
		uv0._bg:GetComponent("Button").enabled = false

		uv0:showRewardInfo()
	end, SFX_CONFIRM)
	SetActive(slot0:findTF("main/tips"), true)
	SetActive(slot0:findTF("main/condition"), false)

	slot0._stateFlag = "report"
end

function slot0.showRewardInfo(slot0)
	SetActive(slot0:findTF("main/tips"), false)
	setParent(slot0._tf, slot0.UIMain)

	slot1 = nil
	slot1 = coroutine.create(function ()
		while #Clone(uv0.contextData.drops) > 0 do
			if slot0[slot1].configId == uv0._resourceID then
				table.remove(slot0, slot1)
			end

			slot1 = slot1 - 1
		end

		if table.getCount(slot0) > 0 then
			uv0:emit(BaseUI.ON_AWARD, {
				items = slot0,
				onYes = uv1
			})
			coroutine.yield()
		end

		setParent(uv0._tf, uv0.overlay)
		uv0:displayBG()
	end)

	function ()
		if uv0 and coroutine.status(uv0) == "suspended" then
			slot0, slot1 = coroutine.resume(uv0)
		end
	end()
end

function slot0.displayBG(slot0)
	SetActive(slot0:findTF("main/tips"), false)
	slot0:displayScore()

	slot0._stateFlag = "display"
end

function slot0.displayScore(slot0)
	SetActive(slot0._contribution, true)
	LeanTween.value(go(slot0._tf), 0, slot1, 1):setOnUpdate(System.Action_float(function (slot0)
		setText(uv0._damageText, math.floor(slot0))
	end)):setDelay(1):setOnComplete(System.Action(function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		uv0:showRightBottomPanel()

		return
		--- END OF BLOCK #0 ---



	end))
	LeanTween.value(go(slot0._tf), 0, slot0._contributionPoint, 1):setOnUpdate(System.Action_float(function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-9, warpins: 1 ---
		setText(uv0._contributionText, math.floor(slot0))

		return
		--- END OF BLOCK #0 ---



	end))
end

function slot0.skip(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

function slot0.showRightBottomPanel(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-18, warpins: 1 ---
	SetActive(slot0._skipBtn, false)
	SetActive(slot0._rightBottomPanel, true)
	onButton(slot0, slot0._exitBtn, function ()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-25, warpins: 1 ---
		if uv0.contextData.result == 1030 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 6-18, warpins: 1 ---
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				hideNo = true,
				content = i18n("md5_error")
			})
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-24, warpins: 1 ---
			uv0:emit(BattleResultMediator.ON_BACK_TO_LEVEL_SCENE)
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end, SFX_CONFIRM)

	slot0._stateFlag = nil

	return
	--- END OF BLOCK #0 ---



end

function slot0.onBackPressed(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	if slot0._stateFlag == "rankAnima" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-7, warpins: 1 ---
		if slot0._stateFlag == "report" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 8-11, warpins: 1 ---
			triggerButton(slot0._bg)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 12-14, warpins: 1 ---
			if slot0._stateFlag == "display" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-18, warpins: 1 ---
				triggerButton(slot0._skipBtn)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 19-21, warpins: 1 ---
				triggerButton(slot0._confirmBtn)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot0.willExit(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	LeanTween.cancel(go(slot0._tf))
	pg.UIMgr.GetInstance():UnblurPanel(slot0._tf)

	return
	--- END OF BLOCK #0 ---



end

return slot0
