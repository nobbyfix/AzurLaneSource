slot0 = class("BackYardHouseVO")
slot0.MAX_SIZE_X = 23
slot0.MAX_SIZE_Y = 23

slot0.Ctor = function (slot0, slot1)
	slot0.level = slot1.level or 1
	slot0.ships = slot1.ships or {}
	slot0.furnitures = slot1.furnitures or {}
	slot0.wallPaper = slot1.wallPaper
	slot0.floorPaper = slot1.floorPaper
	slot0.perFurnitures = {}

	slot0:setBound()

	slot0.expandIds = {}
	slot0.shopCfg = pg.shop_template

	for slot5, slot6 in pairs(pg.shop_template.all) do
		if slot0.shopCfg[slot6].genre == "backyard_upgrade" then
			table.insert(slot0.expandIds, slot6)
		end
	end
end

slot0.getMaze = function (slot0, slot1)
	slot2 = {}

	for slot6 = slot0.MAX_SIZE_X, 0, -1 do
		slot7 = {}

		for slot11 = slot0.MAX_SIZE_Y, 0, -1 do
			if slot1 and slot1.x == slot6 and slot1.y == slot11 then
				table.insert(slot7, 0)
			elseif slot11 < slot0.startY or slot6 < slot0.startX then
				table.insert(slot7, 1)
			else
				table.insert(slot7, (slot0:canMoveBoat(nil, Vector2(slot6, slot11)) and 0) or 1)
			end
		end

		table.insert(slot2, slot7)
	end

	return slot2
end

slot0.printMaze = function (slot0)
	for slot5, slot6 in ipairs(slot1) do
		slot7 = ""

		for slot11, slot12 in ipairs(slot6) do
			slot7 = slot7 .. " " .. slot12
		end

		print(slot7)
	end
end

slot0.addFurniture = function (slot0, slot1)
	slot0.furnitures[slot1.id] = slot1
end

slot0.getFurnAndPaperIds = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.furnitures) do
		table.insert(slot1, slot6.id)
	end

	if slot0.wallPaper then
		table.insert(slot1, slot0.wallPaper.id)
	end

	if slot0.floorPaper then
		table.insert(slot1, slot0.floorPaper.id)
	end

	return slot1
end

slot0.getExpandId = function (slot0)
	slot1 = slot0.level - 1

	for slot5, slot6 in ipairs(slot0.expandIds) do
		if slot0.shopCfg[slot6].limit_args[1][2] == slot1 then
			return slot6
		end
	end
end

slot0.setBound = function (slot0)
	slot0.startX = 12 - (slot0.level - 1) * 4
	slot0.startY = 12 - (slot0.level - 1) * 4
	slot0.endX = slot0.MAX_SIZE_X
	slot0.endY = slot0.MAX_SIZE_Y
	slot0.wallX = slot0.endX + 1
	slot0.wallY = slot0.endY + 1
end

slot0.checkBound = function (slot0, slot1)
	for slot5, slot6 in ipairs(slot1) do
		if slot6.x < slot0.startX or slot6.y < slot0.startY or slot0.endX < slot6.x or slot0.endY < slot6.y then
			return false
		end
	end

	return true
end

slot0.updateLevel = function (slot0, slot1)
	slot0.level = slot1

	slot0:setBound(slot1)
end

slot0.setPreFurnitures = function (slot0, slot1)
	slot0.perFurnitures = slot1
end

slot0.getPreFurnitures = function (slot0)
	return slot0.perFurnitures
end

slot0.setPerWallPaper = function (slot0, slot1)
	slot0.perWallPaper = slot1
end

slot0.getPerWallPaper = function (slot0)
	return slot0.perWallPaper
end

slot0.setPerFloorPaper = function (slot0, slot1)
	slot0.perFloorPaper = slot1
end

slot0.getPerFloorPaper = function (slot0)
	return slot0.perFloorPaper
end

slot0.getSortPreFurnitures = function (slot0)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		table.insert(slot2, slot7)
	end

	table.sort(slot2, function (slot0, slot1)
		return slot0.parent < slot1.parent
	end)

	return slot2
end

slot0.getSortFurnitures = function (slot0)
	slot2 = {}

	for slot6, slot7 in pairs(slot1) do
		table.insert(slot2, slot7)
	end

	table.sort(slot2, function (slot0, slot1)
		return slot0.parent < slot1.parent
	end)

	return slot2
end

slot0.hasChangeFloorPaper = function (slot0)
	if (not slot0.perFloorPaper and not slot0.floorPaper) or (slot0.perFloorPaper and slot0.floorPaper and slot0.perFloorPaper.id == slot0.floorPaper.id) then
		return false
	end

	return true
end

slot0.hasChangeWallPaper = function (slot0)
	if (not slot0.perWallPaper and not slot0.wallPaper) or (slot0.perWallPaper and slot0.wallPaper and slot0.perWallPaper.id == slot0.wallPaper.id) then
		return false
	end

	return true
end

slot0.hasChangeFurnitures = function (slot0)
	for slot4, slot5 in pairs(slot0.furnitures) do
		if slot0:isChangeFurniture(slot5) or slot0:isAddFurniture(slot5) then
			return true
		end
	end

	for slot4, slot5 in pairs(slot0.perFurnitures) do
		if slot0:isRemoveFurnitrue(slot5) then
			return true
		end
	end

	if slot0:hasChangeFloorPaper() then
		return true
	end

	if slot0:hasChangeWallPaper() then
		return true
	end

	return false
end

slot0.isChangeFurniture = function (slot0, slot1)
	if slot0.perFurnitures[slot1.id] then
		if slot0.perFurnitures[slot1.id].dir ~= slot1.dir then
			return true
		end

		if slot2:getPosition().x ~= slot1:getPosition().x or slot3.y ~= slot4.y then
			return true
		end

		if slot2.parent ~= slot1.parent then
			return true
		end

		for slot8, slot9 in pairs(slot2.child) do
			if slot1.child[slot8] then
				if slot1.child[slot8].x ~= slot9.x or slot10.y ~= slot9.y then
					return true
				end
			else
				return true
			end
		end

		for slot8, slot9 in pairs(slot1.child) do
			if not slot2.child[slot8] then
				return true
			end
		end
	end
end

slot0.isAddFurniture = function (slot0, slot1)
	if not slot0.perFurnitures[slot1.id] then
		return true
	end

	return false
end

slot0.isRemoveFurnitrue = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.furnitures) do
		if slot1.id == slot5 then
			return false
		end
	end

	return true
end

slot0.getFanceScaleByLevel = function (slot0)
	return 0.52 + 0.16 * math.min(slot0.level, 3)
end

slot0.canMoveFurniture = function (slot0, slot1, slot2)
	return _.all(slot0.furnitures[slot1].getOccupyGrid(slot3, slot2), function (slot0)
		slot1 = slot0:getSpineId()

		return slot1:checkShips(slot1, slot0) and slot1:checkFurnitruesWithOutChild(slot0, slot1:checkShips(slot0))
	end)
end

slot0.canMoveBoat = function (slot0, slot1, slot2)
	if slot0:checkShips(slot1, slot2) then
		return slot0:checkFurnitruesWithOutChild(slot2)
	else
		return false
	end
end

slot0.checkShips = function (slot0, slot1, slot2)
	if slot0:isBound(slot2) then
		return false
	end

	for slot6, slot7 in pairs(slot0.ships) do
		if slot1 ~= slot7.id then
			for slot12, slot13 in ipairs(slot8) do
				if slot2.x == slot13.x and slot2.y == slot13.y then
					return false
				end
			end

			if slot7:getPosition() and slot2.x == slot9.x and slot9.y == slot2.y then
				return false
			end

			if slot7:getLockPosition() and slot2.x == slot10.x and slot10.y == slot2.y then
				return false
			end
		end
	end

	return true
end

slot0.checkFurnitruesWithOutChild = function (slot0, slot1, slot2)
	for slot6, slot7 in pairs(slot0.furnitures) do
		slot8 = slot7:getPosition()

		if (not slot2 or slot2 ~= slot7.id) and slot8 and not slot7:isMat() and not slot7:hasParent() then
			for slot13, slot14 in ipairs(slot9) do
				if slot1.x == slot14.x and slot14.y == slot1.y then
					return false, slot7.id
				end
			end
		end
	end

	return true
end

slot0.checkFurnitruesWithChild = function (slot0, slot1)
	_.sort(slot2, function (slot0, slot1)
		return slot1.parent < slot0.parent
	end)

	for slot6, slot7 in pairs(slot2) do
		if slot7:getPosition() and not slot7:isMat() then
			for slot13, slot14 in ipairs(slot9) do
				if slot1.x == slot14.x and slot14.y == slot1.y then
					return false, slot7.id
				end
			end
		end
	end

	return true
end

slot0.canPutShip = function (slot0, slot1, slot2)
	if slot0:checkShips(slot1, slot2) then
		return slot0:checkFurnitruesWithChild(slot2)
	else
		return false
	end
end

slot0.isBound = function (slot0, slot1)
	if slot0.endX < slot1.x or slot1.x < slot0.startX then
		return true
	end

	if slot0.endY < slot1.y or slot1.y < slot0.startY then
		return true
	end

	return false
end

slot0.getFloorScaleByLevel = function (slot0)
	return (slot0.level + 2) * 0.25 - 0.005
end

slot0.setWallPaper = function (slot0, slot1)
	slot0.wallPaper = slot1
end

slot0.getWallPaper = function (slot0)
	return slot0.wallPaper
end

slot0.setFloorPaper = function (slot0, slot1)
	slot0.floorPaper = slot1
end

slot0.getFloorPaper = function (slot0)
	return slot0.floorPaper
end

slot0.getAlreadyPutFurn = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.furnitures) do
		if pg.furniture_data_template[slot5].type ~= Furniture.TYPE_WALLPAPER and slot7 ~= Furniture.TYPE_FLOORPAPER and not not slot6.position then
			slot1[slot6.id] = slot6
		end
	end

	return slot1
end

slot0.getShips = function (slot0)
	return Clone(slot0.ships)
end

slot0.getShipPosById = function (slot0, slot1)
	return slot0.ships[slot1]:getPosition()
end

slot0.getSingleByRamdom = function (slot0, slot1)
	slot2, slot6 = slot0:getEmptyGridCount()
	slot4 = {}

	for slot8, slot9 in pairs(slot3) do
		if slot0:canMoveBoat(slot1, slot9) then
			table.insert(slot4, slot9)
		end
	end

	if table.getCount(slot4) > 0 then
		return slot4[math.random(1, #slot4)]
	else
		return nil
	end
end

slot0.totalGridCount = function (slot0)
	return (slot0.endX - slot0.startX + 1) * (slot0.endY - slot0.startY + 1)
end

slot0.hasEmptyGrid = function (slot0)
	if #slot0:getEmptyFloorGrid(1, 1) > 0 then
		return true
	else
		return false
	end
end

slot0.getEmptyGridCount = function (slot0)
	slot1 = 0
	slot2 = {}

	for slot6 = slot0.endX, slot0.startX, -1 do
		for slot10 = slot0.endY, slot0.startY, -1 do
			if not slot0:isOccupyFurnPos(slot6, slot10) then
				slot1 = slot1 + 1

				table.insert(slot2, Vector2(slot6, slot10))
			end
		end
	end

	return slot1, slot2
end

slot0.getEmptyFloorGrid = function (slot0, slot1, slot2)
	slot3 = {}

	function slot4(slot0, slot1)
		for slot5 = slot0, slot0 - slot0 + 1, -1 do
			for slot9 = slot1, slot1 - slot1 + 1, -1 do
				if slot2:isOccupyFurnPos(slot5, slot9) then
					slot3 = {}

					return false
				else
					table.insert(slot3, Vector2(slot5, slot9))

					if #slot3 == slot0 * slot1 then
						return true
					end
				end
			end
		end
	end

	for slot8 = slot0.endX, (slot1 + slot0.startX) - 1, -1 do
		for slot12 = slot0.endY, (slot2 + slot0.startY) - 1, -1 do
			if slot4(slot8, slot12) then
				return slot3
			end
		end
	end

	return slot3
end

slot0.isLegalPos = function (slot0, slot1, slot2)
	slot3 = true
	slot0.curPos = slot2
	slot4 = slot1:getOccupyGrid(slot2)
	slot5 = {}

	if slot1:isFloor() then
		for slot9, slot10 in ipairs(slot4) do
			if slot0:isOccupyFurnPos(slot10.x, slot10.y, slot1) then
				table.insert(slot5, slot9)

				slot3 = false
			end
		end

		if slot0.localedParent and table.getCount(slot0.localedParent.child) ~= 0 then
			for slot9, slot10 in pairs(slot0.localedParent.child) do
				slot11 = slot0.furnitures[slot9]

				for slot15, slot16 in ipairs(slot4) do
					if slot1.id ~= slot11.id and slot11:isOccupy(slot16.x, slot16.y) then
						table.insert(slot5, slot15)

						slot3 = false
					end
				end
			end
		end
	else
		for slot9, slot10 in ipairs(slot4) do
			if slot0:isOccupyFurnPos(slot10.x, slot10.y, slot1) then
				table.insert(slot5, slot9)

				slot3 = false
			end
		end
	end

	slot0.curPos = nil

	return slot3, slot5
end

slot0.findInterActionFurnitrue = function (slot0, slot1, slot2)
	slot3 = slot0.ships[slot2]

	for slot7, slot8 in pairs(slot0.furnitures) do
		if slot8:canInterActionShipGroup(slot3.gruopId) and slot8:canInterAction() and not slot8:isLock() then
			for slot13, slot14 in ipairs(slot9) do
				if slot14.x == slot1.x and slot14.y == slot1.y then
					return slot8
				end
			end
		end
	end
end

slot0.findInterActionStage = function (slot0, slot1, slot2)
	slot3 = slot0.ships[slot2]

	for slot7, slot8 in pairs(slot0.furnitures) do
		if slot8:canInterActionShipGroup(slot3.gruopId) and slot8:isStageFurniture() and slot0:getCanMovePosOnFurnitrue(nil, slot8.id) then
			for slot13, slot14 in ipairs(slot9) do
				if slot14.x == slot1.x and slot14.y == slot1.y then
					return slot8
				end
			end
		end
	end
end

slot0.findInterActionSpineFurnitrue = function (slot0, slot1)
	for slot5, slot6 in pairs(slot0.furnitures) do
		if slot6:canInterActionSpine() and not slot6:isLock() then
			for slot11, slot12 in ipairs(slot7) do
				if slot12.x == slot1.x and slot12.y == slot1.y then
					return slot6
				end
			end
		end
	end
end

slot0.isIllegalPos = function (slot0, slot1, slot2)
	slot3, slot4 = slot0:canMoveBoat(nil, slot1)

	if slot3 or (not slot3 and slot4 == slot2) then
		return false
	end

	return true
end

slot0.isOccupyFurnPos = function (slot0, slot1, slot2, slot3)
	slot0.localedParent = nil
	slot4 = false

	function slot5()
		if slot0 and slot0:isFloor() and slot1:isBound(Vector2(Vector2, )) then
			return true
		end

		for slot3, slot4 in pairs(slot1.furnitures) do
			if slot0 and slot0.id == slot4.id then
			elseif not slot0 or not slot0:isMat() then
				if slot4:isMat() then
				elseif not slot0 or not slot0:isWallMat() then
					if slot4:isWallMat() then
					elseif slot0 and slot0:isChild(slot4) then
					elseif slot0 and slot4:hasParent() and not slot0:isSameParent(slot4) then
					elseif slot4:isOccupy(slot2, slot3) then
						return true
					end
				end
			end
		end

		return false
	end

	if slot3 then
		slot4, locatedFurnVO = slot0:isLocatedOnFurn(slot3, slot1, slot2)
	end

	if slot4 and slot0:canPutOn(slot3, locatedFurnVO) then
		slot6 = false

		for slot10, slot11 in pairs(locatedFurnVO.child) do
			if slot10 ~= slot3.id and slot0.furnitures[slot10]:isOccupy(slot1, slot2) then
				slot6 = true
			end
		end

		if slot6 == true then
			slot6 = slot5()
			slot0.localedParent = nil
		end

		return slot6
	else
		return slot5()
	end
end

slot0.canPutOn = function (slot0, slot1, slot2)
	slot3 = slot1:getConfig("size")
	slot4 = slot2:getConfig("size")

	if slot2:canputon() and slot2:getConfig("level") < slot1:getConfig("level") and slot0:isCoincide(slot1, slot2) then
		slot0.localedParent = slot2

		return true
	end

	return false
end

slot0.isLocatedOnFurn = function (slot0, slot1, slot2, slot3)
	if slot1:isMat() or slot1:isWallMat() then
		return false
	end

	_.sort(slot4, function (slot0, slot1)
		return slot1.parent < slot0.parent
	end)

	slot5 = {}

	for slot9, slot10 in pairs(slot4) do
		if slot10:canputon() and not slot1:isSelf(slot10.id) then
			for slot15, slot16 in ipairs(slot10:getCanPutOnGrid(slot11)) do
				if slot16.x == slot2 and slot16.y == slot3 then
					table.insert(slot5, slot10)
				end
			end
		end
	end

	if #slot5 == 0 then
		return false
	elseif #slot5 == 1 then
		return true, slot5[1]
	else
		slot6 = nil

		for slot10, slot11 in ipairs(slot5) do
			if slot0:canPutOn(slot1, slot11) then
				slot6 = slot11

				break
			end
		end

		return true, slot6 or slot5[1]
	end
end

slot0.isLocaledAndPutOn = function (slot0, slot1, slot2)
	return slot0.localedParent
end

slot0.isCoincide = function (slot0, slot1, slot2)
	slot3 = slot2:getCanPutOnGrid(slot2:getPosition())
	slot5 = slot1
	slot4 = slot1.getOccupyGrid
	slot6 = slot0.curPos or slot1:getPosition()
	slot5 = slot1:getOccupyGridCount()
	slot6 = 0

	for slot10, slot11 in ipairs(slot4) do
		for slot15, slot16 in ipairs(slot3) do
			if slot16.x == slot11.x and slot16.y == slot11.y then
				slot6 = slot6 + 1

				break
			end
		end
	end

	return slot6 == slot5
end

slot0.getWallEmptyGrids = function (slot0, slot1, slot2)
	if slot2 == BackyardFurnitureVO.WALL_DIR_ALL or slot2 == BackyardFurnitureVO.WALL_DIR_LEFT then
		slot3 = slot0.wallY

		for slot7 = slot0.startX, slot0.wallX - slot1, 2 do
			slot8 = true

			for slot12 = slot7, (slot7 + slot1) - 1, 1 do
				if slot0:isOccupyFurnPos(slot12, slot3) then
					slot8 = false
				end
			end

			if slot8 == true then
				return Vector2(slot7, slot3)
			end
		end
	end

	if slot2 == BackyardFurnitureVO.WALL_DIR_ALL or slot2 == BackyardFurnitureVO.WALL_DIR_RIGHT then
		slot3 = slot0.wallX

		for slot7 = slot0.startY, slot0.wallY - slot1, 2 do
			slot8 = true

			for slot12 = slot7, (slot7 + slot1) - 1, 1 do
				if slot0:isOccupyFurnPos(slot3, slot12) then
					slot8 = false
				end
			end

			if slot8 == true then
				return Vector2(slot3, slot7)
			end
		end
	end
end

slot0.canRotate = function (slot0, slot1)
	slot2 = Clone(slot1)

	slot2:updateDir()

	slot3 = false

	if slot0:isLegalPos(slot2, slot2:getPosition()) then
		slot5, slot6 = slot0:isLocatedOnFurn(slot2, slot2:getPosition().x, slot2.getPosition().y)
		slot0.localedParent = nil

		return not slot5 or not slot2:hasParent() or slot0:canPutOn(slot2, slot6)
	end
end

slot0.sortWallFurns = function (slot0)
	slot1 = {}
	slot2 = {}
	slot3 = {}

	for slot7, slot8 in pairs(slot0.furnitures) do
		slot9 = slot8:getPosition()

		if not slot8:isFloor() then
			if slot8:isWallMat() then
				table.insert(slot3, {
					id = slot7,
					configId = slot8.configId,
					pos = slot9
				})
			elseif not BackyardFurnitureVO.isRightWall(slot9) then
				table.insert(slot1, {
					id = slot7,
					configId = slot8.configId,
					pos = slot9
				})
			elseif BackyardFurnitureVO.isRightWall(slot9) then
				table.insert(slot2, {
					id = slot7,
					configId = slot8.configId,
					pos = slot9
				})
			end
		end
	end

	table.sort(slot1, function (slot0, slot1)
		return slot1.pos.x < slot0.pos.x
	end)
	table.sort(slot2, function (slot0, slot1)
		return slot1.pos.y < slot0.pos.y
	end)

	slot4 = pg.furniture_data_template

	table.sort(slot3, function (slot0, slot1)
		if slot0[slot0.configId].size[1] == slot0[slot1.configId].size[1] then
			return slot0.id < slot1.id
		else
			return slot2 < slot3
		end
	end)

	return slot1, slot2, slot3
end

slot0.limitWallFurnWidth = function (slot0, slot1, slot2)
	if slot2:isFloor() then
		return slot1
	end

	slot4, slot5 = slot2:getSize()
	slot6 = slot0:limiteWallPos(slot1)

	if not BackyardFurnitureVO.isRightWall(slot0.limiteWallPos(slot1)) and slot3.x > slot0.wallY - slot4 then
		slot6 = Vector2(slot0.wallY - slot4, slot3.y)
	elseif BackyardFurnitureVO.isRightWall(slot3) and slot3.y > slot0.wallY - slot4 then
		slot6 = Vector2(slot3.x, slot0.wallY - slot4)
	end

	return slot6
end

slot0.limiteWallPos = function (slot0, slot1)
	slot2 = slot1

	if not BackyardFurnitureVO.isRightWall(slot1) then
		if slot1.y ~= slot0.wallY then
			slot2.x = slot1.x - (slot1.y - slot0.wallY)
			slot2.y = slot0.wallY
		end

		if (slot1.x + slot1.y) % 2 ~= 0 then
			slot2.x = slot2.x - 1
		end

		return slot2
	elseif BackyardFurnitureVO.isRightWall(slot1) then
		if slot1.x ~= slot0.wallY then
			slot2.y = slot1.y - (slot1.x - slot0.wallY)
			slot2.x = slot0.wallY
		end

		if (slot1.x + slot1.y) % 2 ~= 0 then
			slot2.y = slot2.y + 1
		end

		return slot2
	end
end

slot0.isLimitWallBound = function (slot0, slot1, slot2)
	slot4, slot5 = slot1:getSize()

	for slot9, slot10 in ipairs(slot3) do
		if slot2.x < slot0.startY or slot2.y < slot0.startY or (not BackyardFurnitureVO.isRightWall(slot2) and slot10.y < slot0.wallY) or (BackyardFurnitureVO.isRightWall(slot2) and slot10.x < slot0.wallY) then
			return false
		elseif slot1:isRightType() and not BackyardFurnitureVO.isRightWall(slot2) then
			return false
		elseif slot1:isLeftType() and BackyardFurnitureVO.isRightWall(slot2) then
			return false
		end
	end

	return true
end

slot0.getWallBound = function (slot0, slot1, slot2)
	slot3, slot4 = slot2:getSize()

	if slot2:isLeftType() and BackyardFurnitureVO.isRightWall(slot1) then
		return Vector2(slot0.wallX - slot3, slot0.wallY)
	elseif slot2:isRightType() and not BackyardFurnitureVO.isRightWall(slot1) then
		return Vector2(slot0.wallX, slot0.wallY - slot3)
	elseif BackyardFurnitureVO.isRightWall(slot1) then
		return Vector2(slot0.wallY, slot0.startX)
	else
		return Vector2(slot0.startX, slot0.wallY)
	end
end

slot0.getCountByIndex = function (slot0, slot1)
	slot2 = 0

	for slot6, slot7 in pairs(slot0.furnitures) do
		if slot1 == slot7:getConfig("tag") then
			slot2 = slot2 + 1
		end
	end

	if slot1 == 3 and slot0.wallPaper then
		slot2 = slot2 + 1
	end

	if slot1 == 4 and slot0.floorPaper then
		slot2 = slot2 + 1
	end

	return slot2
end

slot0.getIndexByType = function (slot0, slot1)
	return slot1:getConfig("tag")
end

slot0.canPutFurniture = function (slot0, slot1)
	if slot1:getConfig("type") == 4 or slot2 == 1 then
		return true
	end

	return slot0:getCountByIndex(slot3) < pg.dorm_data_template[slot0.level].limit[slot0:getIndexByType(slot1)]
end

slot0.getSameConfigIdFurnitrues = function (slot0, slot1)
	slot2 = {}

	for slot6, slot7 in pairs(slot0.furnitures) do
		if slot7:getConfig("id") == slot1 then
			table.insert(slot2, slot7)
		end
	end

	return slot2
end

slot0.getSameConfigIdCount = function (slot0, slot1)
	return table.getCount(slot0:getSameConfigIdFurnitrues(slot1))
end

slot0.canMoveBoatOnFurniture = function (slot0, slot1, slot2, slot3)
	if slot0.furnitures[slot2]:isStageFurniture() then
		slot5 = {}

		for slot9, slot10 in pairs(slot4.child) do
			if slot0.furnitures[slot9] then
				_.each(slot11:getOccupyGridForShip(slot11:getPosition()), function (slot0)
					table.insert(slot0, slot0)
				end)
			end
		end

		if _.any(slot5, function (slot0)
			return slot0.x == slot0.x and slot0.y == slot0.y
		end) then
			return false
		end

		for slot9, slot10 in pairs(slot0.ships) do
			if slot1 ~= slot10.id then
				slot11 = slot10.id

				if slot10:getPosition() and slot12.x == slot3.x and slot12.y == slot3.y then
					return false
				end

				if slot10:getLockPosition() and slot13.x == slot3.x and slot13.y == slot3.y then
					return false
				end
			end
		end

		if _.any(slot4:getCanPutOnGrid(slot4.position), function (slot0)
			return slot0 == slot0
		end) then
			return true
		end
	end

	return false
end

slot0.getAllArch = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.furnitures) do
		if slot6:isArch() then
			table.insert(slot1, slot6)
		end
	end

	return slot1
end

slot0.getArchByPos = function (slot0, slot1)
	for slot6, slot7 in pairs(slot2) do
		for slot12, slot13 in pairs(slot8) do
			if slot13.x == slot1.x and slot13.y == slot1.y then
				return slot7
			end
		end
	end
end

slot0.getCanMoveNearerPosOnFurnitrue = function (slot0, slot1, slot2)
	slot6 = slot0.ships[slot1].getPosition(slot5)
	slot7 = nil

	function slot8(slot0, slot1)
		return Vector2.Distance(slot0, slot1) < Vector2.Distance(slot0, slot0)
	end

	for slot12, slot13 in pairs(slot4) do
		slot14 = slot0:canMoveBoatOnFurniture(slot1, slot2, slot13)

		if not slot6 and slot14 then
			return slot13
		elseif slot6 and slot14 then
			if not slot7 then
				slot7 = slot13
			elseif slot7 and slot8(slot7, slot13) then
				slot7 = slot13
			end
		end
	end

	return slot7
end

slot0.getCanMovePosOnFurnitrue = function (slot0, slot1, slot2)
	for slot8, slot9 in pairs(slot4) do
		if slot0:canMoveBoatOnFurniture(slot1, slot2, slot9) then
			return slot9
		end
	end

	return nil
end

slot0.getMoveableFurnitures = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.furnitures) do
		if slot6:isMoveable() then
			table.insert(slot1, slot6)
		end
	end

	return slot1
end

slot0.getTransportPoint = function (slot0, slot1, slot2)
	if slot0.furnitures[slot2]:isTransPort() and slot0:hasEmptyGrid() then
		return 
		-- Decompilation error in this vicinity:
		function (slot0)
			slot1 = {
				slot0
			}
			slot2 = {}

			function slot3(slot0)
				if not table.contains(slot0, slot0) and not slot1:isBound(slot0) then
					table.insert(slot2, slot0)
				end
			end

			while #slot1 > 0 do
				if slot0:canMoveBoat(slot1, table.remove(slot1, 1)) then
					return slot4
				else
					slot3(Vector2(slot4.x, slot4.y - 1))
					slot3(Vector2(slot4.x - 1, slot4.y))
					slot3(Vector2(slot4.x + 1, slot4.y))
					slot3(Vector2(slot4.x, slot4.y + 1))
				end

				table.insert(slot2, slot4)
			end
		end(slot3:getTransportPoint())
	else
		return slot0:getSingleByRamdom()
	end
end

slot0.getSaveData = function (slot0)
	slot1 = {}

	for slot5, slot6 in pairs(slot0.furnitures) do
		slot10 = slot6:getPosition()
		slot1[slot5] = {
			id = slot5,
			configId = slot6.configId,
			position = Vector2(slot10.x, slot10.y),
			x = slot10.x,
			y = slot10.y,
			dir = slot6.dir,
			child = slot6.child,
			parent = slot6.parent,
			floor = slot6.floor
		}
	end

	if slot0.wallPaper then
		slot1[slot0.wallPaper.id] = {
			dir = 1,
			parent = 0,
			y = 0,
			x = 0,
			id = slot0.wallPaper.id,
			configId = slot0.wallPaper.configId,
			position = Vector2(0, 0),
			child = {},
			floor = slot0.wallPaper.floor
		}
	end

	if slot0.floorPaper then
		slot1[slot0.floorPaper.id] = {
			dir = 1,
			parent = 0,
			y = 0,
			x = 0,
			id = slot0.floorPaper.id,
			configId = slot0.floorPaper.configId,
			position = Vector2(0, 0),
			child = {},
			floor = slot0.floorPaper.floor
		}
	end

	return slot1
end

return slot0
