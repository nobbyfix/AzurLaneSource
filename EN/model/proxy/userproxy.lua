slot0 = class("UserProxy", import(".NetProxy"))

slot0.setLastLogin = function (slot0, slot1)
	if slot1.type == 1 then
		PlayerPrefs.SetString("user.type", "1")
		PlayerPrefs.SetString("user.arg1", slot1.arg1)
		PlayerPrefs.SetString("user.arg2", slot1.arg2)
		PlayerPrefs.SetString("user.arg3", slot1.arg3)
	elseif slot1.type == 2 then
		PlayerPrefs.SetString("user.type", "1")
		PlayerPrefs.SetString("user.arg1", "yongshi")
		PlayerPrefs.SetString("user.arg2", slot1.arg1)
		PlayerPrefs.SetString("user.arg3", slot1.token)
	elseif slot1.type == 3 then
		PlayerPrefs.SetString("user.type", "3")
		PlayerPrefs.SetString("user.arg1", slot1.arg1)
		PlayerPrefs.SetString("user.arg2", "")
		PlayerPrefs.SetString("user.arg3", "")
		PlayerPrefs.SetString("guest_uuid", slot1.arg1)
	end

	PlayerPrefs.Save()

	slot0.data = slot1:clone()

	slot0.data:display("logged in")
end

slot0.getLastLoginUser = function (slot0)
	slot3 = PlayerPrefs.GetString("user.arg2")
	slot4 = PlayerPrefs.GetString("user.arg3")

	print("last login:", tonumber(PlayerPrefs.GetString("user.type")), " arg1:", PlayerPrefs.GetString("user.arg1"))

	if tonumber(PlayerPrefs.GetString("user.type")) ~= "" and slot2 ~= "" and slot3 ~= "" then
		return User.New({
			type = slot1,
			arg1 = slot2,
			arg2 = slot3,
			arg3 = slot4
		})
	end

	return nil
end

return slot0