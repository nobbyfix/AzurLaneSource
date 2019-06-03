pg = pg or {}
pg.SendWindow = class("SendWindow")
slot2 = nil
slot3 = false

function pg.SendWindow.Ctor(slot0, slot1, slot2)
	slot0.connectionMgr = slot1
	slot0.packetIdx = defaultValue(slot2, 0)

	if Application.isEditor and not uv0 then
		uv0 = true

		DebugMgr.Inst.onRequestResend:AddListener(uv1.onRequestResend)
	end

	slot0.isSending = false
	slot0.toSends = {}
	slot0.retryCount = 0
	uv2 = {}
end

function pg.SendWindow.setPacketIdx(slot0, slot1)
	slot0.packetIdx = slot1
end

function pg.SendWindow.getPacketIdx(slot0)
	return slot0.packetIdx
end

function pg.SendWindow.incPacketIdx(slot0)
	slot0.packetIdx = slot0.packetIdx + 1
end

if Application.isEditor then
	function slot1.serialize(slot0)
		if type(slot0) == "number" then
			slot1 = "" .. slot0
		elseif slot2 == "boolean" then
			slot1 = slot1 .. tostring(slot0)
		elseif slot2 == "string" then
			slot1 = slot1 .. string.format("%q", slot0)
		elseif slot2 == "table" then
			for slot6, slot7 in pairs(slot0) do
				slot1 = slot1 .. "{\n" .. "[" .. uv0.serialize(slot6) .. "]=" .. uv0.serialize(slot7) .. ",\n"
			end

			if getmetatable(slot0) ~= nil and type(slot3.__index) == "table" then
				for slot7, slot8 in pairs(slot3.__index) do
					slot1 = slot1 .. "[" .. uv0.serialize(slot7) .. "]=" .. uv0.serialize(slot8) .. ",\n"
				end
			end

			slot1 = slot1 .. "}"
		elseif slot2 == "nil" then
			return nil
		else
			warning("can not serialize a " .. slot2 .. " type.")

			return nil
		end

		return slot1
	end

	function slot1.unserialize(slot0)
		if type(slot0) == "nil" or slot0 == "" then
			return nil
		elseif slot1 == "number" or slot1 == "string" or slot1 == "boolean" then
			slot0 = tostring(slot0)
		else
			warning("can not unserialize a " .. slot1 .. " type.")

			return nil
		end

		if loadstring("return " .. slot0) == nil then
			return nil
		end

		return slot2()
	end
end

function slot1.Queue(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	table.insert(slot0.toSends, {
		slot1,
		slot2,
		slot3,
		slot4 and function (slot0)
			table.remove(uv0.toSends, 1)

			if Application.isEditor then
				DebugMgr.Inst:PushProtoSent(uv1, uv2.serialize(uv3) or "", uv4)
			end

			uv5(slot0)

			if slot0 and slot0.result and slot0.result == 0 then
				uv6.SeriesGuideMgr:GetInstance():receiceProtocol(uv4, uv3, slot0)
			end
		end,
		slot5,
		slot6
	})

	if slot0.isSending then
		return
	end

	slot0:StartSend()
end

function slot1.StartSend(slot0)
	if #slot0.toSends > 0 then
		slot0:Send(unpack(slot0.toSends[1]))
	else
		warning("No more packets to send.")
	end
end

function slot1.Send(slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.isSending = true
	slot0.currentCS = slot1

	if slot0.connectionMgr:isConnecting() then
		slot0.connectionMgr.needStartSend = true

		return
	end

	if not slot0.connectionMgr:getConnection() then
		slot0.connectionMgr.needStartSend = true

		slot0.connectionMgr:Reconnect(function ()
		end)

		return
	end

	slot6 = defaultValue(slot6, true)

	if slot3 ~= nil then
		uv0.UIMgr.GetInstance():LoadingOn()

		slot9 = nil
		slot10 = nil

		uv1[defaultValue(slot5, true) and slot3 .. "_" .. slot0:getPacketIdx() or slot3] = function (slot0)
			uv0.isSending = false

			uv1.UIMgr.GetInstance():LoadingOff()
			uv0.connectionMgr:resetHBTimer()

			if uv2 then
				uv2:Stop()
			end

			uv3(slot0)

			if uv4 and not uv0.isSending and #uv0.toSends > 0 then
				uv0:StartSend()
			end
		end

		Timer.New(function ()
			uv0.UIMgr.GetInstance():LoadingOff()

			uv1[uv2] = nil

			uv3:setPacketIdx(uv4)

			if uv3.retryCount > 3 then
				uv3.connectionMgr.onDisconnected(false, DISCONNECT_TIME_OUT)

				uv3.retryCount = 0
			end

			warning("Network is timedOut, resend: " .. uv4 .. ", protocal: " .. uv5)

			uv3.retryCount = uv3.retryCount + 1

			uv3:StartSend()
		end, SEND_TIMEOUT, 1):Start()
	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 76-76, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	end

	function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-37, warpins: 1 ---
		for slot5, slot6 in pairs(slot1) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-36, warpins: 1 ---
			if type(slot6) == "table" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-33, warpins: 1 ---
				for slot10, slot11 in ipairs(slot6) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 14-32, warpins: 1 ---
					if slot0[slot5].add then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 18-25, warpins: 1 ---
						uv0(slot0[slot5]:add(), slot11)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 26-30, warpins: 1 ---
						slot0[slot5]:append(slot11)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-34, warpins: 1 ---
				slot0[slot5] = slot6
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end(uv0.Packer.GetInstance():GetProtocolWithName("cs_" .. slot1).GetMessage(slot9), slot2)

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 97-122, warpins: 1 ---
		slot7:Send(uv0.Packer.GetInstance():Pack(slot8, slot9:GetId(), slot11))
		print("Network sent protocol: " .. slot1 .. " with idx: " .. slot8)
		slot0:incPacketIdx()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 123-143, warpins: 1 ---
		slot7:Send(uv0.Packer.GetInstance():Pack(0, slot9:GetId(), slot11))
		print("Network sent protocol: " .. slot1 .. " without idx")
		--- END OF BLOCK #0 ---



	end

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 146-173, warpins: 1 ---
		table.remove(slot0.toSends, 1)

		if Application.isEditor then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 167-168, warpins: 2 ---
			DebugMgr.Inst:PushProtoSent(slot1, uv2.serialize(slot2) or "", 0)
			--- END OF BLOCK #0 ---



		end

		if #slot0.toSends > 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 174-177, warpins: 1 ---
			slot0:StartSend()
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 178-179, warpins: 1 ---
			slot0.isSending = false
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end
end

function slot1.stopTimer(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	if slot0.timer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.timer:Stop()

		slot0.timer = nil
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

function slot1.onData(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-49, warpins: 1 ---
	print("Network Receive idx: " .. slot0.idx .. " cmd: " .. slot0.cmd)

	if uv1[slot0.cmd .. "_" .. slot0.idx] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-34, warpins: 1 ---
		uv1[slot2](uv0.Packer.GetInstance():Unpack(slot0.cmd, slot0:getLuaStringBuffer()))

		uv1[slot2] = nil
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-39, warpins: 1 ---
		if uv1[slot0.cmd] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-48, warpins: 1 ---
			uv1[slot0.cmd](slot1)

			uv1[slot0.cmd] = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return
	--- END OF BLOCK #0 ---



end

if Application.isEditor then

	-- Decompilation error in this vicinity:
	--- BLOCK #0 44-45, warpins: 1 ---
	function slot1.onRequestResend(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-32, warpins: 1 ---
		if uv0.unserialize(slot0.sndState) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-10, warpins: 1 ---
			if slot0.scProNr > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-22, warpins: 1 ---
				uv1.ConnectionMgr.GetInstance():Send(slot0.csProNr, slot1, slot0.scProNr, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-1, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-31, warpins: 1 ---
				uv1.ConnectionMgr.GetInstance():Send(slot0.csProNr, slot1)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		return
		--- END OF BLOCK #0 ---



	end
	--- END OF BLOCK #0 ---



end
