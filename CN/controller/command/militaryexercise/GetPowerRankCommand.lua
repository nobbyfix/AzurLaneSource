slot1 = 100
slot2 = 5

class("GetPowerRankCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot2 = slot1:getBody()
	slot5 = slot2.activityId or 0

	if not slot2.force and not getProxy(BillboardProxy):canFetch(slot2.type) then
		print("this rank time has not arrived")

		return
	end

	function slot7(slot0, slot1, slot2)
		uv0:setListByType(slot0, slot1)
		uv0:setPlayerDataByType(slot0, slot2)
		uv1:sendNotification(GAME.GET_POWERRANK_DONE, {
			list = slot1,
			type = slot0,
			playerRankinfo = slot2,
			activityId = uv2
		})
	end

	if slot3 == PowerRank.TYPE_MILITARY_RANK then
		pg.ConnectionMgr.GetInstance():Send(18006, {
			type = 0
		}, 18007, function (slot0)
			for slot5, slot6 in ipairs(slot0.arena_rank_lsit) do
				slot7 = PowerRank.New(slot6, uv0)

				slot7:setRank(slot5)
				table.insert({}, slot7)
			end

			slot2 = getProxy(PlayerProxy):getData()
			slot3 = getProxy(BayProxy):getShipById(slot2.character)
			slot6 = PowerRank.New({
				user_id = slot2.id,
				point = getProxy(MilitaryExerciseProxy):getSeasonInfo().score,
				name = slot2.name,
				lv = slot2.level,
				icon = slot3:getConfig("id"),
				arena_rank = slot2.maxRank,
				skin_id = slot3.skinId,
				propose = slot3.propose and 1 or 0,
				remoulded = slot3:isRemoulded() and 1 or 0
			}, uv0)

			slot6:setRank(slot4.rank)
			uv1(uv0, slot1, slot6)
		end)
	else
		slot8 = {}

		function slot9(slot0, slot1, slot2)
			if #uv0 < (slot0 - 1) * uv1 / uv2 then
				slot1()

				return
			end

			pg.ConnectionMgr.GetInstance():Send(18201, {
				page = slot0,
				type = uv3,
				act_id = slot2
			}, 18202, function (slot0)
				for slot4, slot5 in ipairs(slot0.list) do
					table.insert(uv1, PowerRank.New(slot5, uv0))
				end

				uv2()
			end)
		end

		slot10 = nil

		function slot11(slot0, slot1)
			pg.ConnectionMgr.GetInstance():Send(18203, {
				type = uv0,
				act_id = slot1
			}, 18204, function (slot0)
				slot2 = getProxy(BayProxy):getShipById(getProxy(PlayerProxy):getData().character)
				slot3 = nil
				uv2 = PowerRank.New({
					user_id = slot1.id,
					point = (uv0 ~= PowerRank.TYPE_POWER or getProxy(BayProxy):getBayPower()) and (uv0 ~= PowerRank.TYPE_COLLECTION or getProxy(CollectionProxy):getCollectionCount()) and (uv0 == PowerRank.TYPE_PT and (getProxy(ActivityProxy):getActivityById(uv1) and slot4.data1 or slot0.point) or uv0 == PowerRank.TYPE_CHALLENGE and (getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_CHALLENGE_RANK) and slot4.data1 or slot0.point) or uv0 == PowerRank.TYPE_EXTRA_CHAPTER and (getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_EXTRA_CHAPTER_RANK) and slot4.data1 or slot0.point) or slot0.point),
					name = slot1.name,
					lv = slot1.level,
					icon = slot2:getConfig("id"),
					arena_rank = slot1.maxRank,
					skin_id = slot2.skinId,
					propose = slot2.propose and 1 or 0,
					remoulded = slot2:isRemoulded() and 1 or 0
				}, uv0)

				uv2:setRank(slot0.rank)
				uv3()
			end)
		end

		for slot16 = 1, uv1, 1 do
			table.insert({}, function (slot0)
				uv0(uv1, slot0, uv2)
			end)
		end

		table.insert(slot12, function (slot0)
			uv0(slot0, uv1)
		end)
		seriesAsync(slot12, function ()
			if #uv0 > 0 and uv1 then
				for slot5, slot6 in ipairs(uv0) do
					if slot6.power < 0 then
						slot1 = 1 + 1
					end

					slot6:setRank(slot1)

					slot0 = slot6.power
				end
			end

			uv2(uv3, uv0, uv1)
		end)
	end
end

return class("GetPowerRankCommand", pm.SimpleCommand)
