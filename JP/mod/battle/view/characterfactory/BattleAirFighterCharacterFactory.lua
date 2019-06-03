ys = ys or {}
ys.Battle.BattleAirFighterCharacterFactory = singletonClass("BattleAirFighterCharacterFactory", ys.Battle.BattleAircraftCharacterFactory)
ys.Battle.BattleAirFighterCharacterFactory.__name = "BattleAirFighterCharacterFactory"

function ys.Battle.BattleAirFighterCharacterFactory.Ctor(slot0)
	uv0.Battle.BattleAirFighterCharacterFactory.super.Ctor(slot0)

	slot0.HP_BAR_NAME = uv0.Battle.BattleHPBarManager.HP_BAR_FOE
end

function ys.Battle.BattleAirFighterCharacterFactory.MakeCharacter(slot0)
	return uv0.Battle.BattleAirFighterCharacter.New()
end

function ys.Battle.BattleAirFighterCharacterFactory.MakeModel(slot0, slot1)
	function slot2(slot0)
		uv0:AddModel(slot0)
		uv0:InitWeapon()
		uv0:CameraOrthogonal(uv2.Battle.BattleCameraUtil:GetInstance():GetCamera())
		uv1:GetSceneMediator().AddAirCraftCharacter(slot1, uv0)
		uv1:MakeUIComponentContainer(uv0)
		uv1:MakeFXContainer(uv0)
		uv1:MakePopNumPool(uv0)
		uv1:MakeBloodBar(uv0)
		uv1:MakeShadow(uv0)
	end

	slot0:GetCharacterPool():InstAirCharacter(slot1:GetModleID(), function (slot0)
		uv0(slot0)
	end)
end

function ys.Battle.BattleAirFighterCharacterFactory.MakeBloodBar(slot0, slot1)
	slot2 = slot0:GetHPBarPool():GetHPBar(slot0.HP_BAR_NAME)

	slot1:AddHPBar(slot2)
	slot2:SetActive(false)
	slot1:UpdateHPBarPostition()
end
