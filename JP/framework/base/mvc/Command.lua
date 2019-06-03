ys = ys or {}
ys or .MVC = ys.MVC or {}
ys or .MVC.Command = class("MVC.Command")
ys or .MVC.Command.__name = "MVC.Command"

ys or .MVC.Command.Ctor = function (slot0)
end

ys or .MVC.Command.Initialize = function (slot0)
	uv0.EventDispatcher.AttachEventDispatcher(slot0)
	uv0.EventListener.AttachEventListener(slot0)
end

ys or .MVC.Command.Update = function (slot0)
end

ys or .MVC.Command.Dispose = function (slot0)
	uv0.EventListener.DetachEventListener(slot0)
	uv0.EventDispatcher.DetachEventDispatcher(slot0)
end
