slot0 = class("SirenEquipment", import(".Equipment"))

slot0.Ctor = function (slot0, slot1)
	slot0.id = slot1.id
	slot0.configId = slot1.config_id
	slot0.count = 1
	slot0.new = defaultValue(slot1.new, 0)
	slot0.slotAttrs = {}

	_.each(slot1.attrs, function (slot0)
		table.insert(slot0.slotAttrs, {
			name = slot0.name,
			value = slot0.value
		})
	end)
	slot0:BuildConfig()
end

slot0.GetCategory = function (slot0)
	return EquipCategory.Siren
end

return slot0
