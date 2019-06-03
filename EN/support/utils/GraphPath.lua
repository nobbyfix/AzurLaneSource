GraphPath = class("GraphPath")

function GraphPath.Ctor(slot0, slot1)
	slot0.points = {}

	for slot5, slot6 in pairs(slot1.Points) do
		slot0.points[slot5] = {
			x = slot6.x,
			y = slot6.y,
			nexts = {}
		}
	end

	for slot5, slot6 in pairs(slot1.Edges) do
		if slot0.points[slot6.p1] and slot0.points[slot6.p2] and slot7 ~= slot0.points[slot6.p2] then
			table.insert(slot7.nexts, slot6.p2)
			table.insert(slot0.points[slot6.p2].nexts, slot6.p1)
		end
	end
end

function GraphPath.getRandomPoint(slot0)
	return _.values(slot0.points)[math.random(1, #_.values(slot0.points))]
end

function GraphPath.getPoint(slot0, slot1)
	return slot0.points[slot1]
end
