ys = ys or {}
slot1 = ys.Battle.BattleConfig
slot2 = singletonClass("BattleAircraftCharacterFactory", ys.Battle.BattleCharacterFactory)
ys.Battle.BattleAircraftCharacterFactory = slot2
slot2.__name = "BattleAircraftCharacterFactory"
slot2.BOMB_FX_NAME = "feijibaozha"

function slot2.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function slot2.MakeCharacter(slot0)
	return uv0.Battle.BattleAircraftCharacter.New()
end

function slot2.MakeModel(slot0, slot1)
	function slot2(slot0)
		uv0:AddModel(slot0)
		uv0:InitWeapon()
		uv0:CameraOrthogonal(uv2.Battle.BattleCameraUtil:GetInstance():GetCamera())
		uv1:GetSceneMediator().AddAirCraftCharacter(slot1, uv0)
		uv1:MakeUIComponentContainer(uv0)
		uv1:MakeFXContainer(uv0)
		uv1:MakeShadow(uv0)

		if uv0:GetUnitData():GetIFF() == uv3.FOE_CODE then
			uv1:MakePopNumPool(uv0)
			uv1:MakeBloodBar(uv0)
		end
	end

	slot0:GetCharacterPool():InstAirCharacter(slot1:GetModleID(), function (slot0)
		uv0(slot0)
	end)
end

function slot2.MakeBloodBar(slot0, slot1)
	slot2 = nil

	slot1:AddHPBar((not slot1:GetUnitData():IsPlayerAircraft() or slot0:GetHPBarPool():GetHPBar(uv0.Battle.BattleHPBarManager.HP_BAR_FRIENDLY)) and slot0:GetHPBarPool():GetHPBar(uv0.Battle.BattleHPBarManager.HP_BAR_FOE))
	slot1:UpdateHPBarPostition()
end

function slot2.SetHPBarWidth(slot0, slot1, slot2)
	slot1.transform.sizeDelta = Vector2(slot3, slot5)
	slot6.sizeDelta = Vector2(40 - slot2 or 0, slot1.transform.Find(slot4, "blood").transform.rect.height)
end

function slot2.MakeShadow(slot0, slot1)
	slot1:AddShadow()
	slot1:UpdateShadow()
end
