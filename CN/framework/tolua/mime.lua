slot0 = _G
slot1 = require("ltn12")
slot3 = require("io")
slot4 = require("string")
require("mime.core").encodet = {
	base64 = function ()
		return uv0.filter.cycle(uv1.b64, "")
	end,
	["quoted-printable"] = function (slot0)
		return uv0.filter.cycle(uv1.qp, "", slot0 == "binary" and "=0D=0A" or "\r\n")
	end
}
require("mime.core").decodet = {
	base64 = function ()
		return uv0.filter.cycle(uv1.unb64, "")
	end,
	["quoted-printable"] = function ()
		return uv0.filter.cycle(uv1.unqp, "")
	end
}
require("mime.core").wrapt = {
	text = function (slot0)
		return uv0.filter.cycle(uv1.wrp, slot0 or 76, )
	end,
	base64 = ()["text"],
	default = ()["text"],
	["quoted-printable"] = function ()
		return uv0.filter.cycle(uv1.qpwrp, 76, 76)
	end
}

local function slot9(slot0)
	return function (slot0, slot1, slot2)
		if uv0.type(slot0) ~= "string" then
			slot2 = slot1
			slot1 = slot0
			slot0 = "default"
		end

		if not uv1[slot0 or "nil"] then
			uv0.error("unknown key (" .. uv0.tostring(slot0) .. ")", 3)
		else
			return slot3(slot1, slot2)
		end
	end
end

function slot10(slot0)
	if slot0 then
		if slot0 == "" then
			return "''"
		else
			return uv0.len(slot0)
		end
	else
		return "nil"
	end
end

require("mime.core").encode = slot9(slot6)
require("mime.core").decode = slot9(slot7)
require("mime.core").wrap = slot9()

require("mime.core").normalize = function (slot0)
	return uv0.filter.cycle(uv1.eol, 0, slot0)
end

require("mime.core").stuff = function ()
	return uv0.filter.cycle(uv1.dot, 2)
end

return require("mime.core")
