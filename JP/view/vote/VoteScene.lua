slot0 = class("VoteScene", import("..base.BaseUI"))
slot0.raceShipOrderAsc = false
slot0.raceShipIndex = {
	display = {
		sort = IndexConst.Flags2Bits({
			IndexConst.SortRarity,
			IndexConst.SortVotes
		}),
		index = IndexConst.FlagRange2Bits(IndexConst.IndexAll, IndexConst.IndexOther),
		camp = IndexConst.FlagRange2Bits(IndexConst.CampAll, IndexConst.CampOther),
		rarity = IndexConst.FlagRange2Bits(IndexConst.RarityAll, IndexConst.Rarity5)
	},
	sort = IndexConst.SortVotes,
	index = IndexConst.Flags2Bits({
		IndexConst.IndexAll
	}),
	camp = IndexConst.Flags2Bits({
		IndexConst.CampAll
	}),
	rarity = IndexConst.Flags2Bits({
		IndexConst.RarityAll
	})
}

function slot0.setVoteInfo(slot0, slot1, slot2, slot3)
	slot0.votes = slot1
	slot0.loves = slot2
	slot0.voteGroup = slot3
end

function slot0.getUIName(slot0)
	return "VoteUI"
end

function slot0.init(slot0)
	slot0.overlay = slot0:findTF("overlay")
	slot0.btnBack = slot0:findTF("top/back", slot0.overlay)
	slot0.panelPrimary = slot0:findTF("primary", slot0.overlay)
	slot0.primaryPaint = slot0:findTF("painting", slot0.panelPrimary)
	slot0.primaryShips = slot0:findTF("rank/ships/content", slot0.panelPrimary)
	slot0.primaryShip = slot0:findTF("rank/ships/ship", slot0.panelPrimary)
	slot0.btnPrimary = slot0:findTF("rank/start", slot0.panelPrimary)
	slot0.primaryTitle = slot0:findTF("rank/title", slot0.panelPrimary)
	slot0.primaryVotes = slot0:findTF("number_bg/vote", slot0.panelPrimary)
	slot0.primaryLoves = slot0:findTF("number_bg/love", slot0.panelPrimary)
	slot0.primaryTime = slot0:findTF("rule/time", slot0.panelPrimary)
	slot0.primaryRule = slot0:findTF("rule/text/scroll/text_desc", slot0.panelPrimary)

	setText(slot0.primaryRule, i18n("vote_primary_rule"))

	slot0.panelFinal = slot0:findTF("final", slot0.overlay)
	slot0.finalShips = slot0:findTF("bgs/ships", slot0.panelFinal)
	slot0.finalShip = slot0:findTF("bgs/ship", slot0.panelFinal)
	slot0.finalTime = slot0:findTF("rule/time", slot0.panelFinal)
	slot0.finalVotes = slot0:findTF("number_bg/vote", slot0.panelFinal)
	slot0.finalLoves = slot0:findTF("number_bg/love", slot0.panelFinal)
	slot0.finalRules = {
		vote_final_title1 = slot0:findTF("rule/title1", slot0.panelFinal),
		vote_final_rule1 = slot0:findTF("rule/rule1", slot0.panelFinal),
		vote_final_title2 = slot0:findTF("rule/title2", slot0.panelFinal),
		vote_final_rule2 = slot0:findTF("rule/rule2", slot0.panelFinal)
	}

	for slot4, slot5 in pairs(slot0.finalRules) do
		setText(slot5, i18n(slot4))
	end

	slot0.racePaint = slot0:findTF("racePaint")
	slot0.panelRace = slot0:findTF("race", slot0.overlay)
	slot0.btnOrder = slot0:findTF("main/index/sort_button", slot0.panelRace)
	slot0.btnIndex = slot0:findTF("main/index/index_button", slot0.panelRace)
	slot0.raceShips = slot0:findTF("main/ship_container", slot0.panelRace):GetComponent("LScrollRect")

	function slot0.raceShips.onInitItem(slot0)
		uv0:onInitShip(slot0)
	end

	function slot0.raceShips.onUpdateItem(slot0, slot1)
		uv0:onUpdateShip(slot0, slot1)
	end

	function slot0.raceShips.onReturnItem(slot0, slot1)
		uv0:onReturnShip(slot0, slot1)
	end

	slot0.raceShipItems = {}
	slot0.raceShip = slot0:findTF("main/ship_container/ship", slot0.panelRace)
	slot0.raceVotes = slot0:findTF("main/number_bg/vote", slot0.panelRace)
	slot0.raceLoves = slot0:findTF("main/number_bg/love", slot0.panelRace)
	slot0.rankShips = slot0:findTF("rank/bg/ships/content", slot0.panelRace)
	slot0.rankShip = slot0:findTF("rank/bg/ships/ship", slot0.panelRace)
	slot0.rankTag = slot0:findTF("rank/bg/tag", slot0.panelRace)
	slot0.raceTitle = slot0:findTF("tag/title", slot0.panelRace)
	slot0.raceTime = slot0:findTF("tag/time", slot0.panelRace)
	slot0.raceShipAll = {}
	slot0.raceShipFiltered = {}
	slot0.panelVote = slot0:findTF("vote")
	slot0.voteIcon = slot0:findTF("bg/ship/icon", slot0.panelVote)
	slot0.textVoteCount = slot0:findTF("bg/count/text_vote_count", slot0.panelVote)
	slot0.textVoteOrder = slot0:findTF("bg/count/text_order", slot0.panelVote)
	slot0.textVoteName = slot0:findTF("bg/name/text_name", slot0.panelVote)
	slot0.textVoteEnName = slot0:findTF("bg/name/english_name", slot0.panelVote)
	slot0.textVoteShipType = slot0:findTF("bg/name/type_bg/type", slot0.panelVote)
	slot0.textVoteDesc = slot0:findTF("bg/desc/scroll/text_desc", slot0.panelVote)
	slot0.textVoteTip = slot0:findTF("bg/text_instruction", slot0.panelVote)
	slot0.btnVote = slot0:findTF("bg/btn_vote", slot0.panelVote)
	slot0.btnLove = slot0:findTF("bg/btn_love", slot0.panelVote)
	slot0.res = slot0:findTF("res")

	setActive(slot0.panelPrimary, false)
	setActive(slot0.primaryShip, false)
	setActive(slot0.panelFinal, false)
	setActive(slot0.finalShip, false)
	setActive(slot0.panelRace, false)
	setActive(slot0.racePaint, false)
	setActive(slot0.raceShip, false)
	setActive(slot0.rankShip, false)
	setActive(slot0.panelVote, false)
end

function slot0.didEnter(slot0)
	slot0:displayEntryView()
	onButton(slot0, slot0.btnBack, function ()
		if isActive(uv0.panelRace) then
			setActive(uv0.panelRace, false)
			setActive(uv0.racePaint, false)
			uv0:displayEntryView()
		else
			uv0:emit(BaseUI.ON_BACK)
		end
	end, SFX_CANCEL)
	pg.UIMgr.GetInstance():BlurPanel(slot0.overlay)
end

function slot0.onBackPressed(slot0)
	playSoundEffect(SFX_CANCEL)

	if slot0.currentVoteShip then
		slot0:closeVotePanel()

		return
	end

	triggerButton(slot0.btnBack)
end

function slot0.displayEntryView(slot0)
	if slot0.voteGroup:getConfig("type") == VoteConst.RacePrimary then
		setActive(slot0.panelPrimary, true)
		slot0:updatePrimaryPanel()
	elseif slot1 == VoteConst.RaceFinal then
		setActive(slot0.panelFinal, true)
		slot0:updateFinalPanel()
	end
end

function slot0.onInitShip(slot0, slot1)
	onButton(slot0, VoteShipItem.New(slot1).go, function ()
		uv1:openVotePanel(uv0.voteShip)
	end, SFX_PANEL)

	slot0.raceShipItems[slot1] = VoteShipItem.New(slot1)
end

function slot0.onUpdateShip(slot0, slot1, slot2)
	if not slot0.raceShipItems[slot2] then
		slot0:onInitShip(slot2)

		slot3 = slot0.raceShipItems[slot2]
	end

	slot3:update(slot0.raceShipFiltered[slot1 + 1])
end

function slot0.onReturnShip(slot0, slot1, slot2)
	if slot0.raceShipItems and slot0.raceShipItems[slot2] then
		slot3:clear()
	end
end

function slot0.updatePrimaryPanel(slot0)
	setText(slot0.primaryVotes, "X" .. slot0.votes)
	setText(slot0.primaryLoves, "X" .. slot0.loves)

	slot2 = UIItemList.New(slot0.primaryShips, slot0.primaryShip)

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setActive(slot2:Find("rank"), uv0[slot1 + 1].rank <= 3)

			if slot3.rank <= 3 then
				setImageSprite(slot2:Find("rank"), getImageSprite(uv1.res:Find("rank" .. slot3.rank)))
			end

			setImageSprite(slot4, slot5)
			LoadSpriteAsync("herohrzicon/" .. slot3.shipVO:getPainting(), function (slot0)
				if not uv0.exited and uv1 == uv2[uv3 + 1] then
					setImageSprite(uv4, slot0, true)
				end
			end)
			setText(slot2:Find("black/ticket_number"), slot3.votes)
			onButton(uv1, slot2, function ()
			end, SFX_PANEL)
		end
	end)
	slot2:align(#_.slice(slot0.voteGroup:getList(), 1, VoteConst.PrimayDisplayMax))
	onButton(slot0, slot0.btnPrimary, function ()
		setActive(uv0.panelPrimary, false)
		setActive(uv0.panelRace, true)
		setActive(uv0.racePaint, true)
		uv0:updateRacePanel()
	end, SFX_PANEL)
	setText(slot0.primaryTime, slot0.voteGroup:getVoteTimeStr())
	setImageSprite(slot0.primaryTitle, getImageSprite(slot0.res:Find("group" .. slot0.voteGroup:getVoteGroupChar())), true)
end

function slot0.updateFinalPanel(slot0)
	setText(slot0.finalVotes, "X" .. slot0.votes)
	setText(slot0.finalLoves, "X" .. slot0.loves)

	slot2 = UIItemList.New(slot0.finalShips, slot0.finalShip)

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			setActive(slot2:Find("rank"), uv0[slot1 + 1].rank <= 3)

			if slot3.rank <= 3 then
				setImageSprite(slot2:Find("rank"), getImageSprite(uv1.res:Find("rank" .. slot3.rank)))
			end

			setImageSprite(slot4, slot5)
			LoadSpriteAsync("herohrzicon/" .. slot3.shipVO:getPainting(), function (slot0)
				if not uv0.exited and uv1 == uv2[uv3 + 1] then
					setImageSprite(uv4, slot0, true)
				end
			end)
			setText(slot2:Find("black/ticket_number"), slot3.votes)
			onButton(uv1, slot2, function ()
				uv0:openVotePanel(uv1)
			end, SFX_PANEL)
		end
	end)
	slot2:align(#_.slice(slot0.voteGroup:getList(), 1, VoteConst.FinalDisplayMax))
	setText(slot0.finalTime, slot0.voteGroup:getVoteTimeStr())
end

function slot0.updateRacePanel(slot0)
	slot0.raceNameDic = {}

	setText(slot0.raceVotes, "X" .. slot0.votes)
	setText(slot0.raceLoves, "X" .. slot0.loves)
	setText(slot0.rankTag, i18n("vote_rank_refresh_time"))
	setText(slot0.raceTitle, slot0.voteGroup:getConfig("name") .. ": " .. i18n("vote_vote_group", slot0.voteGroup:getVoteGroupChar()))
	setText(slot0.raceTime, slot0.voteGroup:getVoteTimeStr())

	slot2 = UIItemList.New(slot0.rankShips, slot0.rankShip)

	slot2:make(function (slot0, slot1, slot2)
		if slot0 == UIItemList.EventUpdate then
			slot4 = nil

			setText(slot2:Find("rank"), uv0[slot1 + 1].rank)
			(uv1.raceNameDic[slot2] ~= nil or ScrollTxt.New(slot2:Find("name_mask"), slot2:Find("name_mask/name"))) and uv1.raceNameDic[slot2]:setText(uv0[slot1 + 1].shipVO:getName())
			setText(slot2:Find("number"), uv0[slot1 + 1].votes)
		end
	end)
	slot2:align(#_.slice(slot0.voteGroup:getList(), 1, VoteConst.PrimayDisplayMax))

	slot0.raceShipAll = slot0.voteGroup:getList()

	slot0:sortFilterRaceShips()
	onButton(slot0, slot0.btnOrder, function ()
		uv0.raceShipOrderAsc = not uv0.raceShipOrderAsc

		uv1:sortFilterRaceShips()
	end, SFX_CONFIRM)
	onButton(slot0, slot0.btnIndex, function ()
		pg.UIMgr.GetInstance():UnblurPanel(uv0.overlay, uv0._tf)
		uv0:emit(VoteMediator.ON_INDEX, {
			display = uv1.raceShipIndex.display,
			sort = uv1.raceShipIndex.sort,
			index = uv1.raceShipIndex.index,
			camp = uv1.raceShipIndex.camp,
			rarity = uv1.raceShipIndex.rarity,
			callback = function (slot0)
				uv0.raceShipIndex.sort = slot0.sort
				uv0.raceShipIndex.index = slot0.index
				uv0.raceShipIndex.camp = slot0.camp
				uv0.raceShipIndex.rarity = slot0.rarity

				uv1:sortFilterRaceShips()
			end
		}, function ()
			pg.UIMgr.GetInstance():BlurPanel(uv0.overlay)
		end)
	end, SFX_PANEL)
end

function slot0.sortFilterRaceShips(slot0)
	setActive(slot0.btnOrder:Find("asc"), uv0.raceShipOrderAsc)
	setActive(slot0.btnOrder:Find("desc"), not uv0.raceShipOrderAsc)
	setImageSprite(slot0.btnIndex:Find("Image"), slot3, true)

	slot0.raceShipFiltered = _.filter(slot0.raceShipAll, function (slot0)
		return IndexConst.filterByIndex(slot0.shipVO, uv0.raceShipIndex.index) and IndexConst.filterByCamp(slot0.shipVO, uv0.raceShipIndex.camp) and IndexConst.filterByRarity(slot0.shipVO, uv0.raceShipIndex.rarity)
	end)

	IndexConst.sortByOrder(slot0.raceShipFiltered, slot0.raceShipIndex.sort, slot0.raceShipOrderAsc)
	slot0.raceShips:SetTotalCount(#slot0.raceShipFiltered)
end

function slot0.openVotePanel(slot0, slot1)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.overlay, slot0._tf)
	pg.UIMgr.GetInstance():BlurPanel(slot0.panelVote)
	setActive(slot0.panelVote, true)
	slot0:updateVotePanel(slot1)
end

function slot0.closeVotePanel(slot0)
	pg.UIMgr.GetInstance():UnblurPanel(slot0.panelVote, slot0._tf)
	pg.UIMgr.GetInstance():BlurPanel(slot0.overlay)
	setActive(slot0.panelVote, false)

	slot0.currentVoteShip = nil
end

function slot0.updateVotePanel(slot0, slot1)
	setImageSprite(slot0.voteIcon, slot2)
	LoadSpriteAsync("herohrzicon/" .. slot1.shipVO:getPainting(), function (slot0)
		if not uv0.exited then
			setImageSprite(uv0.voteIcon, slot0, true)
		end
	end)
	setText(slot0.textVoteCount, slot1.votes)
	setText(slot0.textVoteOrder, slot1.rank)
	setText(slot0.textVoteName, slot1.shipVO:getName())
	setText(slot0.textVoteEnName, slot1.shipVO:getConfig("english_name"))
	setImageSprite(slot0.textVoteShipType, GetSpriteFromAtlas("shiptype", slot1.shipVO:getShipType()), true)
	setText(slot0.textVoteDesc, Ship.getShipWords(slot1.shipVO.skinId).profile)
	setText(slot0.textVoteTip, i18n("vote_rank_in_current_server"))
	setGray(slot0.btnVote, slot0.voteGroup:getConfig("type") == VoteConst.RacePrimary and slot1.ivoted, true)
	onButton(slot0, slot0.btnVote, function ()
		if not uv0 or not uv1.ivoted then
			if uv2.votes <= 0 then
				pg.TipsMgr.GetInstance():ShowTips(i18n("vote_not_enough"))

				return
			end

			uv2:emit(VoteMediator.ON_VOTE, {
				cmd = 1,
				activity_id = uv2.voteGroup.activityId,
				arg1 = uv2.voteGroup.configId,
				arg2 = uv1.group
			})
		end
	end, SFX_CONFIRM)
	onButton(slot0, slot0.btnLove, function ()
		if not uv0.ivoted then
			pg.TipsMgr.GetInstance():ShowTips(i18n("vote_love_limit"))

			return
		end

		if uv1.loves <= 0 then
			pg.TipsMgr.GetInstance():ShowTips(i18n("vote_love_not_enough"))

			return
		end

		if uv2.DontRemindLove then
			function ()
				uv0:emit(VoteMediator.ON_VOTE, {
					cmd = 2,
					activity_id = uv0.voteGroup.activityId,
					arg1 = uv0.voteGroup.configId,
					arg2 = uv1.group
				})
			end()
		else
			pg.MsgboxMgr.GetInstance():ShowMsgBox({
				modal = true,
				showStopRemind = true,
				content = i18n("vote_love_confirm"),
				stopRamindContent = i18n("common_dont_remind_dur_login"),
				onYes = function ()
					uv0.DontRemindLove = uv1.stopRemindToggle.isOn

					uv2()
				end
			})
		end
	end, SFX_PANEL)
	onButton(slot0, slot0.panelVote, function ()
		uv0:closeVotePanel()
	end)

	slot0.currentVoteShip = slot1
end

function slot0.onVoteGroupUpdate(slot0)
	if isActive(slot0.panelPrimary) then
		slot0:updatePrimaryPanel()
	end

	if isActive(slot0.panelFinal) then
		slot0:updateFinalPanel()
	end

	if isActive(slot0.panelRace) then
		slot0:updateRacePanel()
	end

	if slot0.currentVoteShip then
		slot0:updateVotePanel(slot0.voteGroup:getVoteShip(slot1))
	end
end

function slot0.willExit(slot0)
	for slot4, slot5 in pairs(slot0.raceShipItems) do
		slot5:clear()
	end

	if slot0.primaryPaintName then
		retPaintingPrefab(slot0.primaryPaint, slot0.primaryPaintName)

		slot0.primaryPaintName = nil
	end

	if slot0.racePaintName then
		retPaintingPrefab(slot0.racePaint, slot0.racePaintName)

		slot0.racePaintName = nil
	end

	if slot0.raceNameDic then
		for slot4, slot5 in pairs(slot0.raceNameDic) do
			slot5:destroy()
		end
	end

	slot0.raceNameDic = nil

	pg.UIMgr.GetInstance():UnblurPanel(slot0.overlay, slot0._tf)
end

return slot0
