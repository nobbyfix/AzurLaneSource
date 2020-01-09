slot0 = class("BeatMonsterNianConst")
slot0.INPUT_TIME = 3
slot0.ACTION_NAME_L = "L"
slot0.ACTION_NAME_R = "R"
slot0.ACTION_NAME_A = "A"
slot0.MotionCombinations = {
	LLA = "isAttack2",
	RRA = "isAttack5",
	ARA = "isAttack2",
	LRA = "isAttack3",
	AAA = "isAttack1",
	LAA = "isAttack4",
	ALA = "isAttack1",
	RAA = "isAttack7",
	RLA = "isAttack6"
}

slot0.MatchAction = function (slot0)
	return slot0.MotionCombinations[slot0] ~= nil
end

slot0.GetMatchAction = function (slot0)
	return slot0.MotionCombinations[slot0]
end

slot0.GetMonsterAction = function (slot0)
	return "isAttack"
end

return slot0
