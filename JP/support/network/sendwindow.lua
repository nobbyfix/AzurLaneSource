pg = pg or {}
pg.SendWindow = class("SendWindow")
slot2 = nil
slot3 = false

pg.SendWindow.Ctor = function (slot0, slot1, slot2)
	slot0.connectionMgr = slot1
	slot0.packetIdx = defaultValue(slot2, 0)

	if Application.isEditor and not slot0 then
		slot0 = true

		DebugMgr.Inst.onRequestResend:AddListener(slot1.onRequestResend)
	end

	slot0.isSending = false
	slot0.toSends = {}
	slot0.retryCount = 0
	slot2 = {}
end

pg.SendWindow.setPacketIdx = function (slot0, slot1)
	slot0.packetIdx = slot1
end

pg.SendWindow.getPacketIdx = function (slot0)
	return slot0.packetIdx
end

pg.SendWindow.incPacketIdx = function (slot0)
	slot0.packetIdx = slot0.packetIdx + 1
end

if Application.isEditor then
	slot1.serialize = function (slot0)
		slot1 = ""

		if type(slot0) == "number" then
			slot1 = slot1 .. slot0
		elseif slot2 == "boolean" then
			slot1 = slot1 .. tostring(slot0)
		elseif slot2 == "string" then
			slot1 = slot1 .. string.format("%q", slot0)
		elseif slot2 == "table" then
			slot1 = slot1 .. "{\n"

			for slot6, slot7 in pairs(slot0) do
				slot1 = slot1 .. "[" .. slot0.serialize(slot6) .. "]=" .. slot0.serialize(slot7) .. ",\n"
			end

			if getmetatable(slot0) ~= nil and type(slot3.__index) == "table" then
				for slot7, slot8 in pairs(slot3.__index) do
					slot1 = slot1 .. "[" .. slot0.serialize(slot7) .. "]=" .. slot0.serialize(slot8) .. ",\n"
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

	slot1.unserialize = function (slot0)
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

slot1.Queue = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	table.insert(slot0.toSends, {
		slot1,
		slot2,
		slot3,
		slot4 and function (slot0)
			table.remove(slot0.toSends, 1)

			if Application.isEditor then
				slot1(slot2, slot3, slot2.serialize(DebugMgr.Inst.PushProtoSent) or "", )
			end

			slot5(slot0)

			if slot0 and slot0.result and slot0.result == 0 then
				slot6.SeriesGuideMgr.GetInstance():receiceProtocol(slot4, , slot0)
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

slot1.StartSend = function (slot0)
	if #slot0.toSends > 0 then
		slot0:Send(unpack(slot0.toSends[1]))
	else
		warning("No more packets to send.")
	end
end

slot1.Send = function (slot0, slot1, slot2, slot3, slot4, slot5, slot6)
	slot0.isSending = true
	slot0.currentCS = slot1

	if slot0.connectionMgr:isConnecting() then
		slot0.connectionMgr.needStartSend = true

		return
	end

	if not slot0.connectionMgr:getConnection() then
		slot0.connectionMgr.needStartSend = true

		slot0.connectionMgr:Reconnect(function ()
			return
		end)

		return
	end

	slot5 = defaultValue(slot5, true)
	slot6 = defaultValue(slot6, true)
	slot8 = slot0:getPacketIdx()

	if slot3 ~= nil then
		slot0.UIMgr.GetInstance():LoadingOn()

		slot9 = nil
		slot10 = nil

		slot1[(slot5 and slot3 .. "_" .. slot8) or slot3] = function (slot0)
			slot0.isSending = false

			slot0.UIMgr.GetInstance():LoadingOff()
			slot0.connectionMgr:resetHBTimer()

			if slot0.connectionMgr then
				slot2:Stop()
			end

			slot3(slot0)

			if slot4 and not slot0.isSending and #slot0.toSends > 0 then
				slot0:StartSend()
			end
		end

		Timer.New(function ()
			slot0.UIMgr.GetInstance():LoadingOff()

			slot0.UIMgr.GetInstance()[slot2] = nil

			slot3:setPacketIdx(slot4)

			if slot3.retryCount > 3 then
				slot3.connectionMgr.onDisconnected(false, DISCONNECT_TIME_OUT)

				slot3.retryCount = 0
			end

			warning("Network is timedOut, resend: " .. slot4 .. ", protocal: " .. slot5)

			slot3.retryCount = slot3.retryCount + 1

			slot3:StartSend()
		end, SEND_TIMEOUT, 1):Start()
	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 76-76, warpins: 1 ---
		slot5 = false
		--- END OF BLOCK #0 ---



	end


	-- Decompilation error in this vicinity:
	function (slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 5-36, warpins: 0 ---
		for slot5, slot6 in pairs(slot1) do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-9, warpins: 1 ---
			if type(slot6) == "table" then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-13, warpins: 1 ---
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 14-32, warpins: 0 ---
				for slot10, slot11 in ipairs(slot6) do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 14-17, warpins: 1 ---
					if slot0[slot5].add then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 18-25, warpins: 1 ---
						slot0(slot0[slot5]:add(), slot11)
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 26-30, warpins: 1 ---
						slot0[slot5]:append(slot11)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 31-32, warpins: 3 ---
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 33-33, warpins: 1 ---
				--- END OF BLOCK #2 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-34, warpins: 1 ---
				slot0[slot5] = slot6
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 35-36, warpins: 3 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 37-37, warpins: 1 ---
		return
		--- END OF BLOCK #2 ---



	end(slot0.Packer.GetInstance():GetProtocolWithName("cs_" .. slot1).GetMessage(slot9), slot2)

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 97-122, warpins: 1 ---
		slot7:Send(slot0.Packer.GetInstance():Pack(slot8, slot9:GetId(), slot11))
		print("Network sent protocol: " .. slot1 .. " with idx: " .. slot8)
		slot0:incPacketIdx()
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 123-143, warpins: 1 ---
		slot7:Send(slot0.Packer.GetInstance():Pack(0, slot9:GetId(), slot11))
		print("Network sent protocol: " .. slot1 .. " without idx")
		--- END OF BLOCK #0 ---



	end

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 146-154, warpins: 1 ---
		table.remove(slot0.toSends, 1)

		if Application.isEditor then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 155-165, warpins: 1 ---
			DebugMgr.Inst:PushProtoSent(slot1, slot2:serialize() or "", 0)
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 167-168, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 169-173, warpins: 2 ---
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
		--- END OF BLOCK #1 ---



	end
end

slot1.stopTimer = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	if slot0.timer then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot0.timer:Stop()

		slot0.timer = nil
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-10, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot1.onData = function (slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-26, warpins: 1 ---
	print("Network Receive idx: " .. slot0.idx .. " cmd: " .. slot0.cmd)

	if slot1[slot0.cmd .. "_" .. slot0.idx] then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 27-34, warpins: 1 ---
		slot1[slot2](slot1)

		slot1[slot2] = nil
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-39, warpins: 1 ---
		if slot1[slot0.cmd] then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-48, warpins: 1 ---
			slot1[slot0.cmd](slot1)

			slot1[slot0.cmd] = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 49-49, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

if Application.isEditor then

	-- Decompilation error in this vicinity:
	--- BLOCK #0 44-45, warpins: 1 ---
	slot1.onRequestResend = function (slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		if slot0.unserialize(slot0.sndState) then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-10, warpins: 1 ---
			if slot0.scProNr > 0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 11-22, warpins: 1 ---
				slot1.ConnectionMgr.GetInstance():Send(slot0.csProNr, slot1, slot0.scProNr, function (slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-1, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-31, warpins: 1 ---
				slot1.ConnectionMgr.GetInstance():Send(slot0.csProNr, slot1)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 32-32, warpins: 3 ---
		return
		--- END OF BLOCK #1 ---



	end
	--- END OF BLOCK #0 ---



end

return
