pg = pg or {}
pg.ShaderMgr = singletonClass("ShaderMgr")
slot1 = pg.ShaderMgr

function pg.ShaderMgr.Init(slot0, slot1)
	print("initializing shader manager...")
	ResourceMgr.Inst:loadAssetBundleAsync("shader", function (slot0)
		uv0.shaders = slot0

		uv1()
	end)
end
