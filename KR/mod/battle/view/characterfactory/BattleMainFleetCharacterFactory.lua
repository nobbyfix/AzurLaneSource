ys = ys or {}
ys.Battle.BattleMainFleetCharacterFactory = singletonClass("BattleMainFleetCharacterFactory", ys.Battle.BattlePlayerCharacterFactory)
ys.Battle.BattleMainFleetCharacterFactory.__name = "BattleMainFleetCharacterFactory"

function ys.Battle.BattleMainFleetCharacterFactory.Ctor(slot0)
	uv0.super.Ctor(slot0)

	slot0.ARROW_BAR_NAME = "EnemyArrowContainer/MainArrow"
end

function ys.Battle.BattleMainFleetCharacterFactory.MakeCharacter(slot0)
	return uv0.Battle.BattleMainFleetCharacter.New()
end

function ys.Battle.BattleMainFleetCharacterFactory.MakeModel(slot0, slot1, slot2)
	function slot3(slot0)
		uv0:AddModel(slot0)
		uv0:CameraOrthogonal(uv2.Battle.BattleCameraUtil:GetInstance():GetCamera())
		uv1:GetSceneMediator().AddPlayerCharacter(slot1, uv0)
		uv1:MakeUIComponentContainer(uv0)
		uv1:MakeFXContainer(uv0)
		uv1:MakePopNumPool(uv0)
		uv1:MakeBloodBar(uv0)
		uv1:MakeWaveFX(uv0)
		uv1:MakeSmokeFX(uv0)
		uv1:MakeArrowBar(uv0)
	end

	slot0:GetCharacterPool():InstCharacter(slot1:GetModleID(), function (slot0)
		uv0(slot0)
	end)
end
