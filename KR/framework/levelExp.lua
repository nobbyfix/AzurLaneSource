function prepareLevelExpConfig(slot0, slot1)
	for slot6, slot7 in ipairs(slot0.all) do
		slot0[slot7].level0 = slot6 - 1
		slot0[slot7].level1 = slot6

		if not nil then
			slot8[(slot1 or "exp") .. "_start"] = 0
		else
			slot8[slot1 .. "_start"] = slot2[slot1 .. "_start"] + slot2[slot1 .. "_interval"]
		end

		slot8[slot1 .. "_interval"] = slot8[slot1]
		slot8[slot1 .. "_end"] = slot8[slot1 .. "_start"] + slot8[slot1] - 1
		slot2 = slot8
	end
end

function getConfigFromTotalExp(slot0, slot1, slot2)
	for slot7, slot8 in ipairs(slot0.all) do
		if slot1 < slot0[slot8][(slot2 or "exp") .. "_end"] then
			return nil
		end
	end

	return slot3
end

function getConfigFromLevel0(slot0, slot1)
	return slot0[slot1 + 1] or slot0[#slot0]
end

function getConfigFromLevel1(slot0, slot1)
	return slot0[slot1] or slot0[#slot0]
end

function getExpByRarityFromLv1(slot0, slot1)
	if ShipRarity.SSR <= slot0 then
		exp = getConfigFromLevel1(pg.ship_level, slot1).exp_ur
	else
		exp = slot2.exp
	end

	return exp
end

prepareLevelExpConfig(pg.user_level)
prepareLevelExpConfig(pg.ship_level)
prepareLevelExpConfig(pg.ship_level, "exp_ur")
