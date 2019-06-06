pg = pg or {}
pg.SeriesGuideMgr = singletonClass("SeriesGuideMgr")
slot1 = false
slot2 = 29

function log(...)
	if slot0 then
		print(...)
	end
end

slot3 = {
	IDLE = 1,
	BUSY = 2
}
pg.SeriesGuideMgr.CODES = {
	GUIDER = 1,
	CONDITION = 4,
	MAINUI = 2
}

pg.SeriesGuideMgr.isRunning = function (slot0)
	return slot0.state == slot0.BUSY
end

pg.SeriesGuideMgr.isNotFinish = function (slot0)
	if getProxy(PlayerProxy) then
		return slot1:getRawData().guideIndex < 28
	end
end

pg.SeriesGuideMgr.loadGuide = function (slot0, slot1)
	return require("GameCfg.guide.newguide." .. slot1)
end

pg.SeriesGuideMgr.getStepConfig = function (slot0, slot1)
	return slot0.guideCfgs[slot1]
end

pg.SeriesGuideMgr.Init = function (slot0, slot1)
	slot0.state = slot0.IDLE
	slot0.guideCfgs = slot0:loadGuide("SG001")
	slot0.guideMgr = pg.GuideMgr.GetInstance()
	slot0.protocols = {}
	slot0.onReceiceProtocol = nil

	slot1()
end

pg.SeriesGuideMgr.dispatch = function (slot0, slot1)
	if slot0:canPlay(slot1) then
		slot0.guideMgr:mask()
	end
end

pg.SeriesGuideMgr.start = function (slot0, slot1)
	if slot0:canPlay(slot1) then
		slot0.state = slot0.BUSY

		slot0.guideMgr:unMask()

		slot0.stepConfig = slot0:getStepConfig(slot0.currIndex)

		function slot2(slot0)
			slot0.state = slot1.IDLE
			slot0.protocols = {}

			if not slot0.stepConfig.interrupt then
				slot0:doNextStep(slot0.currIndex, slot0)
			end
		end

		slot0:doGuideStep(slot1, function (slot0, slot1)
			if slot0.stepConfig.end_segment and slot1 then
				slot0.guideMgr:play(slot0.stepConfig.end_segment, slot1.code, function ()
					slot0(slot1)
				end)
			else
				slot2(slot0)
			end
		end)
	end
end

pg.SeriesGuideMgr.doGuideStep = function (slot0, slot1, slot2)
	if slot0.stepConfig.condition then
		slot3, slot4 = slot0:checkCondition(slot1)
		slot5 = slot0.currIndex < slot4

		slot0:updateIndex(slot4, function ()
			slot0({
				slot1
			}, slot1)
		end)

		return
	end

	slot4 = slot0.stepConfig.segment[slot0:getSegmentIndex()][1]
	slot5 = slot0.stepConfig.segment[slot0.getSegmentIndex()][2]

	seriesAsync({
		function (slot0)
			slot0.guideMgr:play(slot0.guideMgr.play, slot2.code, slot0, function ()
				slot0:updateIndex(slot0)
			end)
			slot0.guideMgr:mask()
		end,
		function (slot0)
			if _.any(slot0.protocols, function (slot0)
				return slot0.protocol == slot0
			end) then
				slot0()

				return
			end

			slot0.onReceiceProtocol = function (slot0)
				if slot0 == slot0 then
					slot1.onReceiceProtocol = 
					-- Decompilation error in this vicinity:
					nil


					-- Decompilation error in this vicinity:
					nil()
				end
			end
		end,
		function (slot0)
			slot0.guideMgr:unMask()
			slot0:increaseIndex(slot0)
		end
	}, function ()
		slot0({
			slot1.CODES.GUIDER
		}, true)
	end)
end

pg.SeriesGuideMgr.getSegmentIndex = function (slot0)
	slot1 = 1

	if slot0.stepConfig.getSegment then
		slot1 = slot0.stepConfig.getSegment()
	end

	return slot1
end

slot4 = 1

pg.SeriesGuideMgr.checkCondition = function (slot0, slot1)
	slot3, slot4 = nil

	if slot0.stepConfig.condition.arg[1] == slot0 then
		slot4, slot3 = slot0:checkPtotocol({
			protocol = slot5[2],
			func = slot2.condition.func
		}, slot1)
	end

	return slot4, slot3
end

pg.SeriesGuideMgr.checkPtotocol = function (slot0, slot1, slot2)
	slot3 = slot1.protocol

	return slot1.func(slot2.view, _.select(slot0.protocols, function (slot0)
		return slot0.protocol == slot0
	end)[1] or {}.args)
end

pg.SeriesGuideMgr.increaseIndex = function (slot0, slot1)
	slot0:updateIndex(slot0.currIndex + 1, slot1)
end

pg.SeriesGuideMgr.updateIndex = function (slot0, slot1, slot2)
	pg.m02:sendNotification(GAME.UPDATE_GUIDE_INDEX, {
		index = slot1,
		callback = slot2
	})
end

pg.SeriesGuideMgr.doNextStep = function (slot0, slot1, slot2)
	slot0.stepConfig = nil

	if slot0:isEnd() then
		return
	end

	if slot0:canPlay({
		view = slot0.guideCfgs[slot1].view[#slot0.guideCfgs[slot1].view],
		code = slot2
	}) then
		slot0:start(slot4)
	end
end

pg.SeriesGuideMgr.isEnd = function (slot0)
	return slot0.currIndex > #slot0.guideCfgs or not ENABLE_GUIDE
end

pg.SeriesGuideMgr.receiceProtocol = function (slot0, slot1, slot2, slot3)
	table.insert(slot0.protocols, {
		protocol = slot1,
		args = slot2,
		data = slot3
	})

	if slot0.onReceiceProtocol then
		slot0.onReceiceProtocol(slot1)
	end
end

pg.SeriesGuideMgr.canPlay = function (slot0, slot1)
	if slot0.state ~= slot0.IDLE then
		log("guider is busy")

		return false
	end

	if not ENABLE_GUIDE then
		log("ENABLE is false")

		return false
	end

	if not slot0.guideMgr then
		log("guideMgr is nil")

		return false
	end

	if not slot0.player then
		log("player is nil")

		return false
	end

	if slot0:isEnd() then
		log("guider is end")

		return false
	end

	if not table.contains(slot0:getStepConfig(slot0.currIndex).view, slot1.view) then
		log("view is erro", slot0.currIndex, slot1.view, slot2.view[1], slot2.view[2])

		return false
	end

	return true
end

pg.SeriesGuideMgr.setPlayer = function (slot0, slot1)
	slot0.player = slot1
	slot0.currIndex = slot0.player.guideIndex

	slot0:compatibleOldPlayer()
end

pg.SeriesGuideMgr.dispose = function (slot0)
	slot0.player = nil
	slot0.protocols = {}
	slot0.state = slot0.IDLE
end

pg.SeriesGuideMgr.compatibleOldPlayer = function (slot0)
	if not slot0.player then
		return
	end

	function slot1()
		slot0 = getProxy(PlayerProxy)
		slot1 = slot0:getData()
		slot1.guideIndex = slot0

		slot0:updatePlayer(slot1)
		slot1:setPlayer(slot1)
		slot1:updateIndex(slot1.guideIndex)
	end

	if slot0.player.level >= 5 and slot0.player.guideIndex < slot0 then
		slot1()

		return
	end

	if not pg.StoryMgr:GetInstance():IsPlayed("FixGuide") then
		pg.StoryMgr:GetInstance():PlayGuide("FixGuide")

		if slot0.player.guideIndex > 1 and slot0.player.guideIndex < 101 then
			slot0:finish()
		end
	end
end

return
