pg = pg or {}
pg.SceneMgr = singletonClass("SceneMgr")

function pg.SceneMgr.prepare(slot0, slot1, slot2, slot3)
	slot4 = slot2.viewComponent.New()

	slot4:setContextData(slot2.data)

	slot5 = nil

	if slot4:isLoaded() then
		function ()
			uv0.event:disconnect(BaseUI.LOADED, uv1)

			slot0 = uv2.mediator.New(uv0)

			slot0:setContextData(uv2.data)
			uv3:registerMediator(slot0)
			uv4(slot0)
		end()
	else
		slot4.event:connect(BaseUI.LOADED, slot5)
		slot4:load()
	end
end

function pg.SceneMgr.prepareLayer(slot0, slot1, slot2, slot3, slot4)
	slot5 = {}

	if slot2 ~= nil then
		if slot2:getContextByMediator(slot3.mediator) then
			print("mediator already exist: " .. slot3.mediator.__cname)
			slot4({})

			return
		end

		table.insert(slot5, slot3)
		slot2:addChild(slot3)
	else
		for slot10, slot11 in ipairs(slot3.children) do
			table.insert(slot5, slot11)
		end
	end

	slot7 = nil

	function ()
		if #uv0 > 0 then
			for slot4, slot5 in ipairs(table.remove(uv0, 1).children) do
				table.insert(uv0, slot5)
			end

			slot3 = uv1:retrieveMediator(slot0.parent.mediator.__cname).getViewComponent(slot2)

			uv2:prepare(uv1, slot0, function (slot0)
				slot0.viewComponent:attach(uv0)
				table.insert(uv1, slot0)
				uv2()
			end)

			return
		end

		uv5(uv3)
	end()
end

function pg.SceneMgr.enter(slot0, slot1, slot2)
	if #slot1 == 0 then
		slot2()
	end

	slot3 = #slot1

	for slot7, slot8 in ipairs(slot1) do
		slot10 = nil

		slot8.viewComponent.event:connect(BaseUI.AVALIBLE, function ()
			uv0.event:disconnect(BaseUI.AVALIBLE, uv1)

			uv2 = uv2 - 1

			if uv2 == 0 then
				uv3()
			end
		end)
		slot8.viewComponent:enter()
	end
end

function pg.SceneMgr.removeLayer(slot0, slot1, slot2, slot3)
	slot5 = {}

	while #{
		slot2
	} > 0 do
		if table.remove(slot4, 1).mediator then
			table.insert(slot5, slot6)
		end

		for slot10, slot11 in ipairs(slot6.children) do
			table.insert(slot4, slot11)
		end
	end

	if slot2.parent == nil then
		table.remove(slot5, 1)
	else
		slot2.parent:removeChild(slot2)
	end

	for slot10 = #slot5, 1, -1 do
		slot12 = slot1:removeMediator(slot5[slot10].mediator.__cname)

		table.insert({}, function (slot0)
			if uv0 then
				uv1:remove(uv0:getViewComponent(), function ()
					uv0:onContextRemoved()
					uv1()
				end)
			else
				slot0()
			end
		end)
	end

	seriesAsync(slot6, slot3)
end

function pg.SceneMgr.remove(slot0, slot1, slot2)
	slot3 = nil

	function slot3()
		uv0.event:disconnect(BaseUI.DID_EXIT, uv1)
		uv0.event:clear()
		uv2:gc(uv0)
		uv3()
	end

	if slot1 == nil then
		slot2()
	else
		slot1.event:connect(BaseUI.DID_EXIT, slot3)
		slot1:exit()
	end
end

function pg.SceneMgr.gc(slot0, slot1)
	table.clear(slot1)

	slot1.exited = true

	gcAll()
end
