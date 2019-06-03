slot0 = setmetatable

module("protobuf.listener")

slot1 = {
	Modified = function ()
	end
}

function NullMessageListener()
	return uv0
end

function Listener(slot0)
	return uv0({
		__mode = "v",
		_parent_message = slot0,
		dirty = false
	}, uv1)
end
