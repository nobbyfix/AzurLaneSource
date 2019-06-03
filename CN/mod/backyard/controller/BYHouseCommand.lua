class("BYHouseCommand", pm.SimpleCommand).execute = function (slot0, slot1)
	if slot1:getBody().name == BACKYARD.LEVEL_UP then
		getBackYardProxy(BackYardHouseProxy):updateHouseLevel(slot2.level)
	end
end

return class("BYHouseCommand", pm.SimpleCommand)
