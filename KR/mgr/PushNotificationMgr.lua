pg = pg or {}
pg.PushNotificationMgr = singletonClass("PushNotificationMgr")
pg.PushNotificationMgr.PUSH_TYPE_EVENT = 1
pg.PushNotificationMgr.PUSH_TYPE_GOLD = 2
pg.PushNotificationMgr.PUSH_TYPE_OIL = 3
pg.PushNotificationMgr.PUSH_TYPE_BACKYARD = 4
pg.PushNotificationMgr.PUSH_TYPE_SCHOOL = 5
pg.PushNotificationMgr.PUSH_TYPE_CLASS = 6
pg.PushNotificationMgr.PUSH_TYPE_TECHNOLOGY = 7
pg.PushNotificationMgr.PUSH_TYPE_BLUEPRINT = 8
pg.PushNotificationMgr.PUSH_TYPE_COMMANDER = 9
pg.PushNotificationMgr.PUSH_TYPE_COMMANDER = 9
slot2 = {}
slot3 = false

function pg.PushNotificationMgr.Init(slot0)
	uv0 = {}

	for slot4, slot5 in ipairs(uv1.push_data_template) do
		uv0[slot5.id] = PlayerPrefs.GetInt("push_setting_" .. slot5.id) == 0
	end

	uv2 = PlayerPrefs.GetInt("setting_ship_name") == 1
end

function pg.PushNotificationMgr.Reset(slot0)
	uv0 = {}

	for slot4, slot5 in ipairs(uv1.push_data_template) do
		PlayerPrefs.SetInt("push_setting_" .. slot5.id, 0)

		uv0[slot5.id] = true
	end

	PlayerPrefs.SetInt("setting_ship_name", 0)

	uv2 = false
end

function pg.PushNotificationMgr.setSwitch(slot0, slot1, slot2)
	if not uv0.push_data_template[slot1] then
		return
	end

	uv1[slot1] = slot2

	PlayerPrefs.SetInt("push_setting_" .. slot1, slot2 and 0 or 1)
end

function pg.PushNotificationMgr.setSwitchShipName(slot0, slot1)
	uv0 = slot1

	PlayerPrefs.SetInt("setting_ship_name", slot1 and 1 or 0)
end

function pg.PushNotificationMgr.isEnabled(slot0, slot1)
	return uv0[slot1]
end

function pg.PushNotificationMgr.isEnableShipName(slot0)
	return uv0
end

function pg.PushNotificationMgr.Push(slot0, slot1, slot2, slot3)
	NotificationMgr.Inst:ScheduleLocalNotification(slot1, slot2, slot3)
	slot0:log(slot1, slot2, slot3)
end

function pg.PushNotificationMgr.cancelAll(slot0)
	NotificationMgr.Inst:CancelAllLocalNotifications()
end

function pg.PushNotificationMgr.PushAll(slot0)
	if getProxy(PlayerProxy) and slot1:getInited() then
		slot0:cancelAll()

		if uv0[uv1.PUSH_TYPE_EVENT] then
			slot0:PushEvent()
		end

		if uv0[uv1.PUSH_TYPE_GOLD] then
			slot0:PushGold()
		end

		if uv0[uv1.PUSH_TYPE_OIL] then
			slot0:PushOil()
		end

		if uv0[uv1.PUSH_TYPE_BACKYARD] then
			slot0:PushBackyard()
		end

		if uv0[uv1.PUSH_TYPE_SCHOOL] then
			slot0:PushSchool()
		end

		if uv0[uv1.PUSH_TYPE_CLASS] then
			slot0:PushClass()
		end

		if uv0[uv1.PUSH_TYPE_TECHNOLOGY] then
			slot0:PushTechnlogy()
		end

		if uv0[uv1.PUSH_TYPE_BLUEPRINT] then
			slot0:PushBluePrint()
		end

		if uv0[uv1.PUSH_TYPE_COMMANDER] then
			slot0:PushCommander()
		end
	end
end

function pg.PushNotificationMgr.PushEvent(slot0)
	for slot6, slot7 in ipairs(slot1) do
		slot0:Push(uv0.push_data_template[slot0.PUSH_TYPE_EVENT].title, string.gsub(uv0.push_data_template[slot0.PUSH_TYPE_EVENT].content, "$1", slot7.template.title), slot7.finishTime)
	end
end

function pg.PushNotificationMgr.PushGold(slot0)
	slot1 = getProxy(NavalAcademyProxy):GetGoldVO()
	slot2 = slot1:bindConfigTable()
	slot3 = slot1:GetLevel()
	slot6 = slot2[slot3].hour_time

	if getProxy(PlayerProxy).data.goldField < slot2[slot3].store and uv0.TimeMgr.GetInstance():GetServerTime() < getProxy(PlayerProxy).data.resUpdateTm + (slot4 - slot9) / slot2[slot3].production * 60 * 60 / 3 then
		slot0:Push(uv0.push_data_template[slot0.PUSH_TYPE_GOLD].title, uv0.push_data_template[slot0.PUSH_TYPE_GOLD].content, slot10)
	end
end

function pg.PushNotificationMgr.PushOil(slot0)
	slot1 = getProxy(NavalAcademyProxy):GetOilVO()
	slot2 = slot1:bindConfigTable()
	slot3 = slot1:GetLevel()
	slot6 = slot2[slot3].hour_time

	if getProxy(PlayerProxy).data.oilField < slot2[slot3].store and uv0.TimeMgr.GetInstance():GetServerTime() < getProxy(PlayerProxy).data.resUpdateTm + (slot4 - slot9) / slot2[slot3].production * 60 * 60 / 3 then
		slot0:Push(uv0.push_data_template[slot0.PUSH_TYPE_OIL].title, uv0.push_data_template[slot0.PUSH_TYPE_OIL].content, slot10)
	end
end

function pg.PushNotificationMgr.PushBackyard(slot0)
	if uv0.TimeMgr.GetInstance():GetServerTime() < getProxy(DormProxy):getData().getFoodLeftTime(slot1) then
		slot0:Push(uv0.push_data_template[slot0.PUSH_TYPE_BACKYARD].title, uv0.push_data_template[slot0.PUSH_TYPE_BACKYARD].content, slot2)
	end
end

function pg.PushNotificationMgr.PushSchool(slot0)
	for slot8, slot9 in ipairs(slot1) do
		if uv0.TimeMgr.GetInstance():GetServerTime() < slot9.finishTime then
			slot12 = getProxy(BayProxy).getData(slot3)[slot9.shipId].skills[slot9:getSkillId(slot10)]

			slot0:Push(uv0.push_data_template[slot0.PUSH_TYPE_SCHOOL].title, string.gsub(string.gsub(uv0.push_data_template[slot0.PUSH_TYPE_SCHOOL].content, "$1", slot13), "$2", slot14), slot9.finishTime)
		end
	end
end

function pg.PushNotificationMgr.PushClass(slot0)
	if getProxy(NavalAcademyProxy):getCourse():inClass() and uv0.TimeMgr.GetInstance():GetServerTime() < slot2.timestamp + AcademyCourse.MaxStudyTime then
		slot0:Push(uv0.push_data_template[slot0.PUSH_TYPE_CLASS].title, uv0.push_data_template[slot0.PUSH_TYPE_CLASS].content, slot3)
	end
end

function pg.PushNotificationMgr.PushTechnlogy(slot0)
	if uv0.push_data_template[uv1.PUSH_TYPE_TECHNOLOGY] and getProxy(TechnologyProxy) then
		for slot7, slot8 in ipairs(slot3) do
			if slot8:isStarting() then
				slot0:Push(slot1.title, string.gsub(slot1.content, "$1", slot8:getConfig("name")), slot8.time)

				break
			end
		end
	end
end

function pg.PushNotificationMgr.PushBluePrint(slot0)
	slot2 = getProxy(TechnologyProxy)

	if uv0.push_data_template[uv1.PUSH_TYPE_BLUEPRINT] and slot2 and getProxy(TaskProxy) and slot2:getBuildingBluePrint() then
		for slot9, slot10 in ipairs(slot5) do
			if uv0.TimeMgr.GetInstance():GetServerTime() < slot4:getTaskOpenTimeStamp(slot10) then
				if not (slot3:getTaskById(slot10) or slot3:getFinishTaskById(slot10)) and slot3:isFinishPrevTasks(slot10) then
					slot0:Push(slot1.title, string.gsub(slot1.content, "$1", slot4:getShipVO().getConfig(slot14, "name")), slot11)
				end
			end
		end
	end
end

function pg.PushNotificationMgr.PushCommander(slot0)
	if uv0.push_data_template[uv1.PUSH_TYPE_COMMANDER] and getProxy(CommanderProxy) then
		for slot7, slot8 in pairs(slot3) do
			if slot8:getState() == CommanderBox.STATE_STARTING then
				slot0:Push(slot1.title, slot1.content, slot8.finishTime)

				break
			end
		end
	end
end

function pg.PushNotificationMgr.log(slot0, slot1, slot2, slot3)
	if Application.isEditor then
		print(slot1, " - ", slot2, " - ", slot3 - uv0.TimeMgr.GetInstance():GetServerTime(), "s后推送")
	end
end
