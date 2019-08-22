pg = pg or {}
pg.SystemGuideMgr = singletonClass("SystemGuideMgr")
slot1 = nil

pg.SystemGuideMgr.Init = function (slot0, slot1)
	slot0 = require("GameCfg.guide.newguide.SSG001")

	slot1()
end

function slot2(slot0)
	if getProxy(PlayerProxy) then
		return slot1:getData():IsPlayed(slot0, noAgain)
	end

	return false
end

function slot3(slot0)
	if slot0 then
		slot0()
	end
end

function slot4(slot0, slot1, slot2)
	if pg.SeriesGuideMgr.GetInstance():isRunning() then
		slot0(slot2)

		return
	end

	if slot1(slot0) then
		slot0(slot2)

		return
	end

	if not pg.GuideMgr.GetInstance():canPlay() then
		slot0(slot2)

		return
	end

	if PLATFORM_CODE == PLATFORM_JP or PLATFORM_CODE == PLATFORM_US then
		slot3 = getProxy(PlayerProxy):getData()

		if slot0 == "SYG001" then
			SendAiriJPTracking(AIRIJP_TRACKING_TUTORIAL_COMPLETE_2, slot3.id)
		elseif slot0 == "SYG003" then
			SendAiriJPTracking(AIRIJP_TRACKING_TUTORIAL_COMPLETE_3, slot3.id)
		elseif slot0 == "SYG006" then
			SendAiriJPTracking(AIRIJP_TRACKING_TUTORIAL_COMPLETE_4, slot3.id)
		end
	end

	pg.m02:sendNotification(GAME.STORY_UPDATE, {
		storyId = slot0
	})
	pg.GuideMgr.GetInstance():play(slot0, slot1, slot2)
end

pg.SystemGuideMgr.Play = function (slot0, slot1, slot2)
	if not slot0[slot1.__cname] then
		slot1(slot2)

		return
	end

	if not _.detect(slot3, function (slot0)
		return not slot0(slot0.id) and slot0.condition()
	end) then
		slot1(slot2)

		return
	end

	slot3(slot4.id, slot6(slot1), slot2)
end

pg.SystemGuideMgr.PlayChapter = function (slot0, slot1)
	if slot1:getPlayType() == ChapterConst.TypeMainSub then
		slot0:PlayByGuideId("NG003")
	elseif slot1.id == 1160002 then
		slot0:PlayByGuideId("NG0011")
	elseif slot1:isTypeDefence() then
		slot0:PlayByGuideId("NG0016")
	end
end

pg.SystemGuideMgr.PlayByGuideId = function (slot0, slot1, slot2, slot3)
	slot0(slot1, slot2, slot3)
end

pg.SystemGuideMgr.FixGuide = function (slot0, slot1)
	if not slot0("FixGuide") then
		slot1("FixGuide")
		slot1()
	end
end

pg.SystemGuideMgr.PlayDailyLevel = function (slot0, slot1)
	if not slot0("NG0015") then
		pg.m02:sendNotification(GAME.STORY_UPDATE, {
			storyId = "NG0015"
		})
		slot1()
	end
end

pg.SystemGuideMgr.PlayCommander = function (slot0)
	slot3 = {}

	for slot7, slot8 in ipairs(slot2) do
		table.insert(slot3, function (slot0)
			if (slot0 == "NG006" and table.getCount(getProxy(CommanderProxy):getData()) >= 1) or (slot0 == "NG007" and getProxy(BagProxy):getItemCountById(20012) ~= 1) or (slot0 == "NG008" and getProxy(CommanderProxy):getBoxes()[1]:getState() ~= CommanderBox.STATE_FINISHED) or (slot0 == "NG009" and table.getCount(getProxy(CommanderProxy):getData()) ~= 1) then
				pg.m02:sendNotification(GAME.STORY_UPDATE, {
					storyId = slot0
				})
				slot0()
			elseif slot0 == "ZHIHUIMIAO2" or slot0 == "ZHIHUIMIAO3" or slot0 == "ZHIHUIMIAO4" then
				pg.StoryMgr.GetInstance():Play(slot0, slot0, true, true)
			else
				slot1(slot0, {}, slot0)
			end
		end)
	end

	seriesAsync(slot3)
end

return
