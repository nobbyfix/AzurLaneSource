slot0 = class("Nation")
slot0.CM = 0
slot0.US = 1
slot0.EN = 2
slot0.JP = 3
slot0.DE = 4
slot0.CN = 5
slot0.SN = 7
slot0.FF = 8
slot0.MNF = 9
slot0.LINK = 100

function slot0.IsLinkType(slot0)
	return uv0.LINK < slot0
end

function slot0.Nation2Print(slot0)
	if not uv0.prints then
		uv0.prints = {
			[0] = "cm",
			"us",
			"en",
			"jp",
			"de",
			"cn",
			nil,
			"sn",
			"ff",
			"mnf",
			[102.0] = "bili",
			[101.0] = "np",
			[104.0] = "um",
			[103.0] = "um"
		}
	end

	return uv0.prints[slot0]
end

function slot0.Nation2Side(slot0)
	if not uv0.side then
		uv0.side = {
			[0] = "West",
			"West",
			"West",
			"Jp",
			"West",
			"Cn",
			nil,
			"West",
			"West",
			"West",
			[102.0] = "Jp",
			[101.0] = "Jp",
			[104.0] = "West",
			[103.0] = "Jp"
		}
	end

	return uv0.side[slot0]
end

function slot0.Nation2BG(slot0)
	if not uv0.bg then
		uv0.bg = {
			[0] = "bg/bg_church",
			"bg/bg_church",
			"bg/bg_church",
			"bg/bg_church_jp",
			"bg/bg_church",
			"bg/bg_church_cn",
			nil,
			"bg/bg_church",
			"bg/bg_church",
			"bg/bg_church",
			[102.0] = "bg/bg_church",
			[101.0] = "bg/bg_church",
			[104.0] = "bg/bg_church",
			[103.0] = "bg/bg_church"
		}
	end

	return uv0.bg[slot0]
end

function slot0.Nation2Name(slot0)
	if not uv0.nationName then
		uv0.nationName = {
			[0] = i18n("word_shipNation_other"),
			i18n("word_shipNation_baiYing"),
			i18n("word_shipNation_huangJia"),
			i18n("word_shipNation_chongYing"),
			i18n("word_shipNation_tieXue"),
			i18n("word_shipNation_dongHuang"),
			[7] = i18n("word_shipNation_beiLian"),
			[8] = i18n("word_shipNation_ziyou"),
			[9] = i18n("word_shipNation_weixi"),
			[101] = i18n("word_shipNation_np"),
			[102] = i18n("word_shipNation_bili"),
			[103] = i18n("word_shipNation_um"),
			[104] = i18n("word_shipNation_ai")
		}
	end

	return uv0.nationName[slot0]
end

function slot0.Nation2facionName(slot0)
	if not uv0.facionName then
		uv0.facionName = {
			[0] = i18n("guild_faction_unknown"),
			i18n("guild_faction_blhx"),
			i18n("guild_faction_blhx"),
			i18n("guild_faction_cszz"),
			i18n("guild_faction_cszz"),
			i18n("guild_faction_blhx"),
			[7] = i18n("guild_faction_blhx"),
			[8] = i18n("guild_faction_blhx"),
			[9] = i18n("guild_faction_cszz"),
			[101] = i18n("guild_faction_unknown"),
			[102] = i18n("guild_faction_unknown"),
			[103] = i18n("guild_faction_unknown"),
			[104] = i18n("guild_faction_unknown")
		}
	end

	return uv0.facionName[slot0]
end

return slot0
