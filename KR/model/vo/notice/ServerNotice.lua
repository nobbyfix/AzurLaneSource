slot0 = class("ServerNotice", import(".Notice"))

function slot0.Ctor(slot0, slot1)
	uv0.super.Ctor(slot0, slot1)

	slot0.version = slot1.version
	slot0.btnTitle = slot1.btn_title
	slot0.titleImage = slot1.title_image
	slot0.timeDes = slot1.time_desc
end

function slot0.prefKey(slot0)
	return "ServerNotice" .. slot0.id
end

return slot0
