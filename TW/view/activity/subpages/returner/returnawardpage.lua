slot0 = class("ReturnAwardPage", import("....base.BaseActivityPage"))
slot0.INVITER = 1
slot0.RETURNER = 2

slot0.SetUIName = function (slot0, slot1)
	slot0.PAGES = {
		{
			ui = "ReturnAwardPage",
			class = InviterPage
		},
		{
			ui = "ReturnAward4RetrunerPage",
			class = ReturnerPage
		}
	}
	slot0._uiName = slot0.PAGES[math.max(getProxy(ActivityProxy):getActivityByType(ActivityConst.ACTIVITY_TYPE_RETURN_AWARD).data1, 1)].ui
end

slot0.OnFirstFlush = function (slot0)
	print(slot0.PAGES[slot0.activity.data1].class)
	print(slot0.activity.data1)

	slot0.page = slot0.PAGES[slot0.activity.data1].class.New(slot0._tf, slot0._event)

	onButton(slot0, slot0.page.help, function ()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip.returner_help.tip
		})
	end)
end

slot0.OnUpdateFlush = function (slot0)
	slot0.page:Update(slot0.activity)
end

slot0.OnDestroy = function (slot0)
	slot0.page:Dispose()
end

return slot0
