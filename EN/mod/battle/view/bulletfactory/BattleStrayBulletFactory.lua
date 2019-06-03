ys = ys or {}
slot1 = ys.Battle.BattleConst.UnitType
ys.Battle.BattleStrayBulletFactory = singletonClass("BattleStrayBulletFactory", ys.Battle.BattleCannonBulletFactory)
ys.Battle.BattleStrayBulletFactory.__name = "BattleStrayBulletFactory"

function ys.Battle.BattleStrayBulletFactory.Ctor(slot0)
	uv0.super.Ctor(slot0)
end

function ys.Battle.BattleStrayBulletFactory.MakeBullet(slot0)
	return uv0.Battle.BattleStrayBullet.New()
end
