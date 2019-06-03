class("ChapterOpCommand", import(".ChapterOpRoutine")).execute = function (slot0, slot1)
	if slot1:getBody().type == ChapterConst.OpSwitch then
		for slot8, slot9 in ipairs(getProxy(ChapterProxy).getActiveChapter(slot3).fleets) do
			if slot9.id == slot2.id then
				slot4.findex = slot8

				break
			end
		end

		slot3:updateChapter(slot4, bit.bor(ChapterConst.DirtyStrategy, ChapterConst.DirtyFleet))
		slot0:sendNotification(GAME.CHAPTER_OP_DONE, {
			type = slot2.type
		})
		pg.TipsMgr:GetInstance():ShowTips(i18n("formation_switch_success", slot4.fleet.name))

		return
	elseif slot2.type == ChapterConst.OpRetreat and getProxy(ChapterProxy):getActiveChapter() and slot4:getFleetById(slot2.id) and slot5:getFleetType() == FleetType.Submarine then
		_.each(slot4.fleets, function (slot0)
			if slot0.id ~= uv0.id then
				table.insert(uv1, slot0)
			end
		end)

		slot4.fleets = {}

		slot3:updateChapter(slot4, bit.bor(ChapterConst.DirtyFleet, ChapterConst.DirtyAttachment, ChapterConst.DirtyChampion, ChapterConst.DirtyStrategy))
		slot0:sendNotification(GAME.CHAPTER_OP_DONE, {
			type = slot2.type,
			id = slot5.id
		})

		return
	end

	pg.ConnectionMgr.GetInstance():Send(13103, {
		act = slot2.type,
		group_id = defaultValue(slot2.id, 0),
		act_arg_1 = slot2.arg1,
		act_arg_2 = slot2.arg2
	}, 13104, function (slot0)
		if slot0.result == 0 then
			slot1 = false

			uv0:initData(uv1, slot0, getProxy(ChapterProxy).getActiveChapter(slot2))
			uv0:doDropUpdate()

			if uv0.chapter then
				uv0:doMapUpdate()
				uv0:doAIUpdate()
				uv0:doShipUpdate()
				uv0:doBuffUpdate()
				uv0:doCellFlagUpdate()
				uv0:doKizunaJammingUpdate()

				if uv1.type == ChapterConst.OpRetreat then
					if slot3:getPlayType() == ChapterConst.TypeMainSub and (uv1.win or not slot3:isValid()) then
						slot3:retreat()
						slot3:clearSubChapter()
						slot2:updateChapter(slot3)
						uv0:sendNotification(GAME.CHAPTER_OP_DONE, {
							type = uv1.type
						})

						return
					end

					uv0:doRetreat()
				elseif uv1.type == ChapterConst.OpMove then
					uv0:doCollectAI()
					uv0:doMove()
				elseif uv1.type == ChapterConst.OpBox then
					uv0:doCollectAI()
					uv0:doOpenBox()
				elseif uv1.type == ChapterConst.OpStory then
					uv0:doCollectAI()
					uv0:doPlayStory()
				elseif uv1.type == ChapterConst.OpAmbush then
					uv0:doAmbush()
				elseif uv1.type == ChapterConst.OpStrategy then
					uv0:doCollectAI()
					uv0:doStrategy()
				elseif uv1.type == ChapterConst.OpRepair then
					uv0:doRepair()
				elseif uv1.type == ChapterConst.OpSupply then
					uv0:doSupply()
				elseif uv1.type == ChapterConst.OpEnemyRound then
					uv0:doCollectAI()
				elseif uv1.type == ChapterConst.OpSubState then
					uv0:doSubState()
				elseif uv1.type == ChapterConst.OpBarrier then
					uv0:doBarrier()
				elseif uv1.type == ChapterConst.OpRequest then
					uv0:doRequest()
				elseif uv1.type == ChapterConst.OpSkipBattle then
					uv0:doSkipBattle()
				end

				slot2:updateChapter(uv0.chapter, uv0.flag)
				uv0:sendNotification(GAME.CHAPTER_OP_DONE, {
					type = uv1.type,
					id = uv1.id,
					arg1 = uv1.arg1,
					arg2 = uv1.arg2,
					path = slot0.move_path,
					fullpath = uv0.fullpath,
					items = uv0.items,
					exittype = uv1.exittype or 0,
					aiActs = uv0.aiActs,
					oldLine = uv1.ordLine,
					extraFlagRemoveList = slot0.del_flag_list,
					extraFlagAddList = slot0.add_flag_list
				})
			end
		else
			pg.TipsMgr:GetInstance():ShowTips(errorTip("levelScene_operation", slot0.result))

			if uv1.type ~= ChapterConst.OpRequest and uv1.type ~= ChapterConst.OpRetreat then
				uv0:sendNotification(GAME.CHAPTER_OP, {
					type = ChapterConst.OpRequest,
					id = uv1.id
				})
			end
		end
	end)
end

return class("ChapterOpCommand", import(".ChapterOpRoutine"))
