class("BYHouseCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	slot4 = getBackYardProxy(BackYardHouseProxy)

	if slot1:getBody().name == BACKYARD.LEVEL_UP then
		slot4:updateHouseLevel(slot2.level)
	end
end

return class("BYHouseCommand", pm.SimpleCommand)
