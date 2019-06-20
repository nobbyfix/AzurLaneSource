slot0 = class
slot1 = "ShipBluePrintScene"
slot2 = import
slot3 = "..base.BaseUI"
slot0 = slot0(slot1, slot2(slot3))
slot1 = pg
slot1 = slot1.ship_data_blueprint
slot2 = pg
slot2 = slot2.ship_data_template
slot3 = pg
slot3 = slot3.ship_data_breakout
slot4 = 3
slot5 = -10
slot6 = 2.3

function slot7(slot0)
	slot1 = "ShipBluePrintUI"

	return slot1
end

slot0.getUIName = slot7

function slot7(slot0, slot1)
	slot0.version = slot1
end

slot0.setVersion = slot7

function slot7(slot0, slot1)
	slot0.shipVOs = slot1
end

slot0.setShipVOs = slot7

function slot7(slot0, slot1)
	slot2 = slot0.shipVOs
	slot2 = slot2[slot1]

	return slot2
end

slot0.getShipById = slot7

function slot7(slot0, slot1)
	slot0.taskVOs = slot1
end

slot0.setTaskVOs = slot7

function slot7(slot0, slot1)
	slot0.itemVOs = slot1
end

slot0.setItemVOs = slot7

function slot7(slot0, slot1)
	slot2 = slot0.taskVOs
	slot2 = slot2[slot1]

	if not slot2 then
		slot2 = Task
		slot2 = slot2.New
		slot3 = {
			id = slot1
		}
		slot2 = slot2(slot3)
	end

	return slot2
end

slot0.getTaskById = slot7

function slot7(slot0, slot1)
	slot2 = nil
	slot3 = ipairs
	slot4 = slot0.itemVOs
	slot3, slot4, slot5 = slot3(slot4)

	for slot6, slot7 in slot3, slot4, slot5 do
		slot8 = slot7.id

		if slot8 == slot1 then
			slot8 = slot7.count
			slot9 = 0

			if slot8 > slot9 then
				slot2 = slot7

				break
			end
		end
	end

	if not slot2 then
		slot3 = Item
		slot3 = slot3.New
		slot4 = {
			count = 0,
			id = slot1
		}
		slot3 = slot3(slot4)
		slot2 = slot3
	end

	return slot2
end

slot0.getItemById = slot7

function slot7(slot0, slot1)
	slot0.bluePrintByIds = slot1
end

slot0.setShipBluePrints = slot7

function slot7(slot0, slot1)
	slot2 = slot0.bluePrintByIds
	slot3 = slot1.id
	slot2[slot3] = slot1
	slot3 = slot0
	slot2 = slot0.filterBlueprints

	slot2(slot3)

	slot2 = slot0.itemList
	slot3 = slot2
	slot2 = slot2.align
	slot4 = slot0.filterBlueprintVOs
	slot4 = #slot4

	slot2(slot3, slot4)

	slot2 = eachChild
	slot3 = slot0.shipContainer

	function slot4(slot0)
		slot1 = slot0
		slot1 = slot1.contextData
		slot1 = slot1.shipBluePrintVO
		slot1 = slot1.id
		slot2 = slot0
		slot2 = slot2.bluePrintItems
		slot2 = slot2[slot0]
		slot2 = slot2.shipBluePrintVO
		slot2 = slot2.id

		if slot1 == slot2 then
			slot1 = triggerToggle
			slot2 = slot0
			slot3 = true

			slot1(slot2, slot3)
		end
	end

	slot2(slot3, slot4)
end

slot0.updateShipBluePrintVO = slot7

function slot7(slot0)
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main"
	slot1 = slot1(slot2, slot3)
	slot0.main = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "center_panel"
	slot4 = slot0.main
	slot1 = slot1(slot2, slot3, slot4)
	slot0.centerPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "blur_panel"
	slot1 = slot1(slot2, slot3)
	slot0.blurPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "adapt"
	slot4 = slot0.blurPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.top = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.topPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top_bg"
	slot4 = slot0.blurPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.topBg = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "top/back"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.backBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "left_panel"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.leftPanle = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bottom_panel"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.bottomPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "right_panel"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.rightPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ships/bg/content"
	slot4 = slot0.bottomPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ship_tpl"
	slot4 = slot0.bottomPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "ships/bg/version/version_btn"
	slot4 = slot0.bottomPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.versionBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "eye"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.eyeTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "main/center_panel/painting"
	slot1 = slot1(slot2, slot3)
	slot0.painting = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "name"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.nameTF = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "name_mask/Text"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipName = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "type"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipType = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "english_name"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.englishName = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "star_tpl"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.shipInfoStarTpl = slot1
	slot1 = setActive
	slot2 = slot0.shipInfoStarTpl
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "stars"
	slot4 = slot0.nameTF
	slot1 = slot1(slot2, slot3, slot4)
	slot0.stars = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/btns/init_toggle"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.initBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/btns/attr_toggle"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.attrBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/btns/attr_toggle/disable"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.attrDisableBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.initPanel = slot1
	slot1 = PropertyPanel
	slot1 = slot1.New
	slot2 = slot0.initPanel
	slot3 = 32
	slot1 = slot1(slot2, slot3)
	slot0.propertyPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel/skills_rect"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillRect = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel/skills_rect/skills"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "skilltpl"
	slot4 = slot0.skillPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel/arrow1"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillArrLeft = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel/arrow2"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.skillArrRight = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/init_panel/property_title2/simulation"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.simulationBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/attr_panel"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.attrPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "property_panel/attr_panel"
	slot4 = slot0.leftPanle
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modAdditionPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "scroll_rect/content"
	slot4 = slot0.modAdditionPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modAdditionContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "addition_tpl"
	slot4 = slot0.modAdditionContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modAdditionTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "pre_view"
	slot4 = slot0.attrPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.preViewBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.stateInfo = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/start_btn"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.startBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/lock_panel"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.lockPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "lock"
	slot4 = slot0.lockPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.lockBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/finished_btn"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.finishedBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/progress"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.progressPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "content"
	slot4 = slot0.progressPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.progressContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "item"
	slot4 = slot0.progressContainer
	slot1 = slot1(slot2, slot3, slot4)
	slot0.progressTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "state_info/open_condition"
	slot4 = slot0.centerPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.openCondition = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "task_list"
	slot4 = slot0.rightPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.taskListPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "task_list/scroll/content"
	slot4 = slot0.rightPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.taskContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "task_list/task_tpl"
	slot4 = slot0.rightPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.taskTpl = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "mod_panel"
	slot4 = slot0.rightPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/atrrs"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.attrContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/slider"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Slider
	slot1 = slot1(slot2, slot3(slot4))
	slot0.levelSlider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/slider/Text"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.levelSliderTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/pre_slider"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Slider
	slot1 = slot1(slot2, slot3(slot4))
	slot0.preLevelSlider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/level_bg/Text"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.modLevel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/calc_panel/item_bg"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.itemInfo = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "icon"
	slot4 = slot0.itemInfo
	slot1 = slot1(slot2, slot3, slot4)
	slot0.itemInfoIcon = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "kc/count"
	slot4 = slot0.itemInfo
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.itemInfoCount = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/Text"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.needLevelTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/calc_panel/confirm_btn"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.modBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/calc_panel"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.calcPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "min"
	slot4 = slot0.calcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.calcMinBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "max"
	slot4 = slot0.calcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.calcMaxBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "count/Text"
	slot4 = slot0.calcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.calcTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/fitting_btn"
	slot4 = slot0.modPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "fitting_panel"
	slot4 = slot0.rightPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingPanel = slot1
	slot1 = setActive
	slot2 = slot0.fittingPanel
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/middle"
	slot4 = slot0.fittingPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingAttrPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "title/phase"
	slot4 = slot0.fittingPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.phasePic = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/top/slider"
	slot4 = slot0.fittingPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Slider
	slot1 = slot1(slot2, slot3(slot4))
	slot0.phaseSlider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/top/precent"
	slot4 = slot0.fittingPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.phaseSliderTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/top/pre_slider"
	slot4 = slot0.fittingPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Slider
	slot1 = slot1(slot2, slot3(slot4))
	slot0.prePhaseSlider = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/top/mask"
	slot4 = slot0.fittingPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingNeedMask = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "desc/bottom"
	slot4 = slot0.fittingPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingCalcPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "calc/min"
	slot4 = slot0.fittingCalcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingCalcMinBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "calc/max"
	slot4 = slot0.fittingCalcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingCalcMaxBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "calc/count/Text"
	slot4 = slot0.fittingCalcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingCalcTxt = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "item_bg"
	slot4 = slot0.fittingCalcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingItemInfo = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "icon"
	slot4 = slot0.fittingItemInfo
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingItemInfoIcon = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "kc/count"
	slot4 = slot0.fittingItemInfo
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = typeof
	slot4 = Text
	slot1 = slot1(slot2, slot3(slot4))
	slot0.fittingItemInfoCount = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "confirm_btn"
	slot4 = slot0.fittingCalcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingConfirmBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "cancel_btn"
	slot4 = slot0.fittingCalcPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.fittingCancelBtn = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "msg_panel"
	slot4 = slot0.blurPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.msgPanel = slot1
	slot1 = setActive
	slot2 = slot0.msgPanel
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "preview"
	slot1 = slot1(slot2, slot3)
	slot0.preViewer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "preview/frame"
	slot1 = slot1(slot2, slot3)
	slot0.preViewerFrame = slot1
	slot1 = setActive
	slot2 = slot0.preViewer
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "sea"
	slot4 = slot0.preViewerFrame
	slot1 = slot1(slot2, slot3, slot4)
	slot0.sea = slot1
	slot1 = slot0.sea
	slot2 = slot1
	slot1 = slot1.GetComponent
	slot3 = "RawImage"
	slot1 = slot1(slot2, slot3)
	slot0.rawImage = slot1
	slot1 = setActive
	slot2 = slot0.rawImage
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "bg/loading"
	slot4 = slot0.preViewerFrame
	slot1 = slot1(slot2, slot3, slot4)
	slot0.seaLoading = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "resources/heal"
	slot1 = slot1(slot2, slot3)
	slot0.healTF = slot1
	slot1 = slot0.healTF
	slot1 = slot1.transform
	slot2 = Vector3
	slot3 = -360
	slot4 = 50
	slot5 = 40
	slot2 = slot2(slot3, slot4, slot5)
	slot1.localPosition = slot2
	slot1 = setActive
	slot2 = slot0.healTF
	slot3 = false

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "stageScrollRect/stages"
	slot4 = slot0.preViewerFrame
	slot1 = slot1(slot2, slot3, slot4)
	slot0.stages = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "content/Text"
	slot4 = slot0.preViewerFrame
	slot1 = slot1(slot2, slot3, slot4)
	slot0.breakView = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "preview/attrs_panel/attr_panel"
	slot1 = slot1(slot2, slot3)
	slot0.previewAttrPanel = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "content"
	slot4 = slot0.previewAttrPanel
	slot1 = slot1(slot2, slot3, slot4)
	slot0.previewAttrContainer = slot1
	slot2 = slot0
	slot1 = slot0.findTF
	slot3 = "helpBtn"
	slot4 = slot0.top
	slot1 = slot1(slot2, slot3, slot4)
	slot0.helpBtn = slot1
	slot1 = slot0.bottomPanel
	slot1 = slot1.rect
	slot1 = slot1.height
	slot0.bottomWidth = slot1
	slot1 = slot0.topPanel
	slot1 = slot1.rect
	slot1 = slot1.height
	slot1 = slot1 * 2
	slot0.topWidth = slot1
	slot1 = {}
	slot0.nameTxts = slot1
	slot1 = {}
	slot0.taskTFs = slot1
	slot1 = {}
	slot0.leanTweens = slot1
end

slot0.init = slot7

function slot7(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO

	if not slot1 then
		slot1 = {
			0,
			0
		}
		slot2 = pairs
		slot3 = slot0.bluePrintByIds
		slot2, slot3, slot4 = slot2(slot3)

		for slot5, slot6 in slot2, slot3, slot4 do
			slot1[slot6.version] = slot1[slot6.version] + ((slot6.state == ShipBluePrint.STATE_UNLOCK and 1) or 0)
			slot7 = slot6.state
			slot8 = ShipBluePrint.STATE_DEV

			if slot7 == slot8 then
				slot0.contextData.shipBluePrintVO = slot0.contextData.shipBluePrintVO or slot6

				break
			end
		end

		slot2 = slot0.contextData
		slot2 = slot2.shipBluePrintVO

		if not slot2 then
			slot0.version = (slot1[1] <= 4 and 1) or 2
			slot3 = slot0
			slot2 = slot0.emit
			slot4 = ShipBluePrintMediator
			slot4 = slot4.SET_TECHNOLOGY_VERSION
			slot5 = slot0.version

			slot2(slot3, slot4, slot5)
		end
	end

	slot2 = slot0
	slot1 = slot0.initShips

	slot1(slot2)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.backBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipBluePrintMediator
		slot2 = slot2.ON_MAIN

		slot0(slot1, slot2)
	end

	slot5 = SOUND_BACK

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.startBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.shipBluePrintVO

		if not slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.shipBluePrintVO
		slot0 = slot0.id
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ShipBluePrintMediator
		slot3 = slot3.ON_START
		slot4 = slot0

		slot1(slot2, slot3, slot4)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.finishedBtn

	function slot4()
		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.shipBluePrintVO

		if not slot0 then
			return
		end

		slot0 = slot0
		slot0 = slot0.contextData
		slot0 = slot0.shipBluePrintVO
		slot0 = slot0.id
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.emit
		slot3 = ShipBluePrintMediator
		slot3 = slot3.ON_FINISHED
		slot4 = slot0

		slot1(slot2, slot3, slot4)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.preViewBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.openPreView

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.seaLoading

	function slot4()
		slot0 = slot0
		slot0 = slot0.previewer

		if not slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showBarrage

			slot0(slot1)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.preViewer

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.closePreview

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.eyeTF

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.hideUI

		slot0(slot1)
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.main

	function slot4()
		slot0 = slot0
		slot0 = slot0.flag

		if slot0 then
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.hideUI

			slot0(slot1)
		end
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.helpBtn

	function slot4()
		pg.MsgboxMgr.GetInstance():ShowMsgBox({
			type = MSGBOX_TYPE_HELP,
			helps = pg.gametip[(isActive(slot0.fittingPanel) and "help_shipblueprintui_luck") or "help_shipblueprintui"].tip
		})
	end

	slot5 = SFX_PANEL

	slot1(slot2, slot3, slot4, slot5)

	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.OverlayPanelPB
	slot3 = slot0.blurPanel
	slot4 = {}
	slot5 = {}
	slot6 = slot0.rightPanel
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "task_list"
	slot6 = slot6(slot7, slot8)
	slot5[1] = slot6
	slot6 = slot0.rightPanel
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "mod_panel"
	slot6 = slot6(slot7, slot8)
	slot5[2] = slot6
	slot6 = slot0.leftPanle
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "property_panel"
	slot6 = slot6(slot7, slot8)
	slot5[3] = slot6
	slot6 = slot0.bottomPanel
	slot7 = slot6
	slot6 = slot6.Find
	slot8 = "ships/bg"
	slot5[MULTRES] = slot6(slot7, slot8)
	slot4.pbList = slot5

	slot1(slot2, slot3, slot4)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "window/top/btnBack"
	slot6 = slot0.msgPanel
	slot3 = slot3(slot4, slot5, slot6)

	function slot4()
		slot0 = pg
		slot0 = slot0.UIMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.UnblurPanel
		slot2 = slot0
		slot2 = slot2.msgPanel
		slot3 = slot0
		slot3 = slot3.top

		slot0(slot1, slot2, slot3)

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.msgPanel
		slot2 = false

		slot0(slot1, slot2)
	end

	slot1(slot2, slot3, slot4)

	slot1 = setText
	slot3 = slot0
	slot2 = slot0.findTF
	slot4 = "window/confirm_btn/Text"
	slot5 = slot0.msgPanel
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = i18n
	slot4 = "text_confirm"

	slot1(slot2, slot3(slot4))

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "window/confirm_btn"
	slot6 = slot0.msgPanel
	slot3 = slot3(slot4, slot5, slot6)

	function slot4()
		slot0 = pg
		slot0 = slot0.UIMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.UnblurPanel
		slot2 = slot0
		slot2 = slot2.msgPanel
		slot3 = slot0
		slot3 = slot3.top

		slot0(slot1, slot2, slot3)

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.msgPanel
		slot2 = false

		slot0(slot1, slot2)
	end

	slot1(slot2, slot3, slot4)

	slot1 = onButton
	slot2 = slot0
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "bg"
	slot6 = slot0.msgPanel
	slot3 = slot3(slot4, slot5, slot6)

	function slot4()
		slot0 = pg
		slot0 = slot0.UIMgr
		slot0 = slot0.GetInstance
		slot0 = slot0()
		slot1 = slot0
		slot0 = slot0.UnblurPanel
		slot2 = slot0
		slot2 = slot2.msgPanel
		slot3 = slot0
		slot3 = slot3.top

		slot0(slot1, slot2, slot3)

		slot0 = setActive
		slot1 = slot0
		slot1 = slot1.msgPanel
		slot2 = false

		slot0(slot1, slot2)
	end

	slot1(slot2, slot3, slot4)

	slot1 = GetImageSpriteFromAtlasAsync
	slot2 = "ui/shipblueprintui_atlas"
	slot3 = "version_"
	slot4 = slot0.version
	slot3 = slot3 .. slot4
	slot4 = slot0.versionBtn

	slot1(slot2, slot3, slot4)

	slot1 = onButton
	slot2 = slot0
	slot3 = slot0.versionBtn

	function slot4()
		slot0 = slot0
		slot1 = slot0
		slot1 = slot1.version
		slot1 = slot1 % 2
		slot1 = slot1 + 1
		slot0.version = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipBluePrintMediator
		slot2 = slot2.SET_TECHNOLOGY_VERSION
		slot3 = slot0
		slot3 = slot3.version

		slot0(slot1, slot2, slot3)

		slot0 = slot0
		slot0 = slot0.contextData
		slot1 = nil
		slot0.shipBluePrintVO = slot1
		slot0 = GetImageSpriteFromAtlasAsync
		slot1 = "ui/shipblueprintui_atlas"
		slot2 = "version_"
		slot3 = slot0
		slot3 = slot3.version
		slot2 = slot2 .. slot3
		slot3 = slot0
		slot3 = slot3.versionBtn

		slot0(slot1, slot2, slot3)

		slot0 = slot0
		slot0 = slot0.itemList
		slot1 = slot0
		slot0 = slot0.align
		slot2 = 0

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.initShips

		slot0(slot1)
	end

	slot1(slot2, slot3, slot4)

	slot1 = LeanTween
	slot1 = slot1.alpha
	slot2 = rtf
	slot3 = slot0.skillArrLeft
	slot2 = slot2(slot3)
	slot3 = 0.25
	slot4 = 1
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.setEase
	slot3 = LeanTweenType
	slot3 = slot3.easeInOutSine
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.setLoopPingPong

	slot1(slot2)

	slot1 = LeanTween
	slot1 = slot1.alpha
	slot2 = rtf
	slot3 = slot0.skillArrRight
	slot2 = slot2(slot3)
	slot3 = 0.25
	slot4 = 1
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.setEase
	slot3 = LeanTweenType
	slot3 = slot3.easeInOutSine
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.setLoopPingPong

	slot1(slot2)
end

slot0.didEnter = slot7
slot7 = 0.5

function slot8(slot0)
	slot1 = LeanTween
	slot1 = slot1.isTweening
	slot2 = go
	slot3 = slot0.leftPanle
	slot1 = slot1(slot2(slot3))

	if not slot1 then
		slot1 = LeanTween
		slot1 = slot1.isTweening
		slot2 = go
		slot3 = slot0.rightPanel
		slot1 = slot1(slot2(slot3))

		if not slot1 then
			slot1 = LeanTween
			slot1 = slot1.isTweening
			slot2 = go
			slot3 = slot0.bottomPanel
			slot1 = slot1(slot2(slot3))

			if slot1 then
				return
			end
		end
	end

	slot1 = slot0.flag
	slot1 = not slot1
	slot0.flag = slot1
	slot1 = slot0.flag

	if slot1 then
		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.leftPanle
		slot3 = slot0.leftPanle
		slot3 = slot3.rect
		slot3 = slot3.width
		slot3 = -slot3
		slot3 = slot3 - 400
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.rightPanel
		slot3 = 400
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.bottomPanel
		slot3 = slot0.bottomWidth
		slot3 = -slot3
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.topPanel
		slot3 = slot0.topWidth
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.topBg
		slot3 = slot0.topWidth
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.centerPanel
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)
	else
		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.leftPanle
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.rightPanel
		slot3 = slot0.rightPanel
		slot3 = slot3.rect
		slot3 = slot3.width
		slot3 = -slot3
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.bottomPanel
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.topPanel
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveY
		slot2 = slot0.topBg
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.moveX
		slot2 = slot0.centerPanel
		slot3 = 0
		slot4 = slot0

		slot1(slot2, slot3, slot4)
	end

	slot1 = setActive
	slot2 = slot0.nameTF
	slot3 = slot0.flag
	slot3 = not slot3

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.stateInfo
	slot3 = slot0.flag
	slot3 = not slot3

	slot1(slot2, slot3)

	slot1 = setActive
	slot2 = slot0.helpBtn
	slot3 = slot0.flag
	slot3 = not slot3

	slot1(slot2, slot3)
end

slot0.hideUI = slot8

function slot8(slot0, slot1, slot2)
	if slot2 then
		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.leftPanle
		slot5 = 0
		slot6 = slot1

		slot3(slot4, slot5, slot6)

		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.rightPanel
		slot5 = slot0.rightPanel
		slot5 = slot5.rect
		slot5 = slot5.width
		slot5 = -slot5
		slot6 = slot1

		slot3(slot4, slot5, slot6)

		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.centerPanel
		slot5 = 0
		slot6 = slot1

		slot3(slot4, slot5, slot6)
	else
		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.leftPanle
		slot5 = slot0.leftPanle
		slot5 = slot5.rect
		slot5 = slot5.width
		slot5 = -slot5
		slot5 = slot5 - 400
		slot6 = slot1

		slot3(slot4, slot5, slot6)

		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.rightPanel
		slot5 = 400
		slot6 = slot1

		slot3(slot4, slot5, slot6)

		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.centerPanel
		slot5 = 0
		slot6 = slot1

		slot3(slot4, slot5, slot6)
	end
end

slot0.switchUI = slot8

function slot8(slot0, slot1, slot2)
	if slot2 then
		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.rightPanel
		slot5 = slot0.rightPanel
		slot5 = slot5.rect
		slot5 = slot5.width
		slot5 = -slot5
		slot6 = slot1

		slot3(slot4, slot5, slot6)

		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.centerPanel
		slot5 = slot0.rightPanel
		slot5 = slot5.rect
		slot5 = slot5.width
		slot5 = -slot5
		slot5 = slot5 / 2
		slot6 = slot1

		slot3(slot4, slot5, slot6)
	else
		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.leftPanle
		slot5 = slot0.leftPanle
		slot5 = slot5.rect
		slot5 = slot5.width
		slot5 = -slot5
		slot5 = slot5 - 400
		slot6 = slot1

		slot3(slot4, slot5, slot6)

		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.rightPanel
		slot5 = 400
		slot6 = slot1

		slot3(slot4, slot5, slot6)

		slot3 = LeanTween
		slot3 = slot3.moveX
		slot4 = slot0.centerPanel
		slot5 = 0
		slot6 = slot1

		slot3(slot4, slot5, slot6)
	end
end

slot0.switch2FittingPanel = slot8

function slot8(slot0, slot1)
	slot2 = {
		go = slot1
	}
	slot3 = tf
	slot4 = slot1
	slot3 = slot3(slot4)
	slot2.tf = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "icon"
	slot3 = slot3(slot4, slot5)
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = "Image"
	slot3 = slot3(slot4, slot5)
	slot2.iconShip = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "count"
	slot3 = slot3(slot4, slot5)
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = typeof
	slot6 = Text
	slot3 = slot3(slot4, slot5(slot6))
	slot2.countTxt = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "selected"
	slot3 = slot3(slot4, slot5)
	slot2.seleted = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "state/mask_lock"
	slot3 = slot3(slot4, slot5)
	slot2.maskLock = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "state/mask_dev"
	slot3 = slot3(slot4, slot5)
	slot2.maskDev = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "state/mask_none"
	slot3 = slot3(slot4, slot5)
	slot2.maskNone = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "tip"
	slot3 = slot3(slot4, slot5)
	slot2.tip = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "icon"
	slot3 = slot3(slot4, slot5)
	slot2.iconTF = slot3
	slot3 = slot2.tf
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = "Toggle"
	slot3 = slot3(slot4, slot5)
	slot2.toggle = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "dev_lv"
	slot3 = slot3(slot4, slot5)
	slot2.lvTF = slot3
	slot3 = findTF
	slot4 = slot2.tf
	slot5 = "dev_lv/Text"
	slot3 = slot3(slot4, slot5)
	slot2.lvTextTF = slot3

	function slot3(slot0, slot1, slot2)
		slot0.toggle.enabled = slot1.id > 0
		slot3 = slot1.id
		slot4 = 0

		if slot3 < slot4 then
			slot3 = setActive
			slot4 = slot0.maskNone
			slot5 = true

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.seleted
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.maskLock
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.maskDev
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.tip
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.lvTF
			slot5 = false

			slot3(slot4, slot5)

			slot3 = setActive
			slot4 = slot0.countTxt
			slot5 = false

			slot3(slot4, slot5)

			slot3 = LoadSpriteAsync
			slot4 = "shipdesignicon/unknow"

			function slot5(slot0)
				slot1 = slot0
				slot1 = slot1.iconShip
				slot1.sprite = slot0
			end

			slot3(slot4, slot5)

			slot3 = print
			slot4 = "asdfasdfasdf==============================="

			slot3(slot4)
		else
			slot0.shipBluePrintVO = slot1
			slot3 = slot0.shipBluePrintVO
			slot4 = slot3
			slot3 = slot3.getShipVO
			slot3 = slot3(slot4)
			slot4 = LoadSpriteAsync
			slot5 = "shipdesignicon/"
			slot7 = slot3
			slot6 = slot3.getPainting
			slot6 = slot6(slot7)
			slot5 = slot5 .. slot6

			function slot6(slot0)
				if slot0 then
					slot1 = slot0
					slot1 = slot1.iconShip
					slot1.sprite = slot0
				end
			end

			slot4(slot5, slot6)

			slot4 = slot2.count
			slot5 = 999

			if slot4 > slot5 then
				slot4 = slot0
				slot4 = slot4.countTxt
				slot5 = "999+"
				slot4.text = slot5
			else
				slot4 = slot0
				slot4 = slot4.countTxt
				slot5 = slot2.count
				slot4.text = slot5
			end

			slot4 = setText
			slot5 = slot0.lvTextTF
			slot6 = slot0.shipBluePrintVO
			slot6 = slot6.level

			slot4(slot5, slot6)

			slot4 = setActive
			slot5 = slot0.seleted
			slot6 = false

			slot4(slot5, slot6)

			slot4 = setActive
			slot5 = slot0.countTxt
			slot6 = true

			slot4(slot5, slot6)

			slot4 = setActive
			slot5 = slot0.maskLock
			slot7 = slot1
			slot6 = slot1.isLock

			slot4(slot5, slot6(slot7))

			slot4 = setActive
			slot5 = slot0.maskDev
			slot7 = slot1
			slot6 = slot1.isDeving

			slot4(slot5, slot6(slot7))

			slot4 = setActive
			slot5 = slot0.tip
			slot7 = slot1
			slot6 = slot1.isFinished

			slot4(slot5, slot6(slot7))

			slot4 = setActive
			slot5 = slot0.maskNone
			slot6 = false

			slot4(slot5, slot6)

			slot4 = setActive
			slot5 = slot0.lvTF
			slot7 = slot1
			slot6 = slot1.isLock
			slot6 = slot6(slot7)

			if not slot6 then
				slot7 = slot1
				slot6 = slot1.isDeving
				slot6 = slot6(slot7)
				slot6 = not slot6
			else
				slot6 = false

				if false then
					slot6 = true
				end
			end

			slot4(slot5, slot6)
		end
	end

	slot2.update = slot3

	function slot3(slot0, slot1)
		LeanTween.moveY(slot0.iconTF, (slot1 and 0) or -25, 0.1)
	end

	slot2.updateSelectedStyle = slot3

	return slot2
end

slot0.createShipItem = slot8

function slot8(slot0)
	slot2 = slot0
	slot1 = slot0.checkStory

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.filterBlueprints

	slot1(slot2)

	slot1 = slot0.contextData
	slot2 = slot0.contextData
	slot2 = slot2.shipBluePrintVO

	if not slot2 then
		slot2 = slot0.filterBlueprintVOs
		slot2 = slot2[1]
	end

	slot1.shipBluePrintVO = slot2
	slot1 = slot0.itemList

	if not slot1 then
		slot1 = {}
		slot0.bluePrintItems = slot1
		slot1 = UIItemList
		slot1 = slot1.New
		slot2 = slot0.shipContainer
		slot3 = slot0.shipTpl
		slot1 = slot1(slot2, slot3)
		slot0.itemList = slot1
		slot1 = slot0.itemList
		slot2 = slot1
		slot1 = slot1.make

		function slot3(slot0, slot1, slot2)
			slot3 = UIItemList
			slot3 = slot3.EventInit

			if slot0 == slot3 then
				slot3 = slot0
				slot3 = slot3.bluePrintItems
				slot4 = slot0
				slot5 = slot4
				slot4 = slot4.createShipItem
				slot6 = slot2
				slot4 = slot4(slot5, slot6)
				slot3[slot2] = slot4
				slot3 = slot0
				slot3 = slot3.bluePrintItems
				slot3 = slot3[slot2]
				slot4 = onToggle
				slot5 = slot0
				slot6 = slot3.go

				function slot7(slot0)
					if slot0 then
						slot1 = slot0
						slot2 = slot1
						slot1 = slot1.clearLeanTween

						slot1(slot2)

						slot1 = slot0
						slot1 = slot1.contextData
						slot2 = slot1
						slot2 = slot2.shipBluePrintVO
						slot1.shipBluePrintVO = slot2

						function slot1()
							slot0 = slot0
							slot1 = slot0
							slot0 = slot0.setSelectedBluePrint

							slot0(slot1)

							slot0 = slot0
							slot1 = slot0
							slot1 = slot1.contextData
							slot1 = slot1.shipBluePrintVO
							slot1 = slot1.id
							slot0.nowShipId = slot1
						end

						slot2 = slot0
						slot2 = slot2.inFlag

						if slot2 then
							slot2 = slot0
							slot2 = slot2.nowShipId
							slot3 = slot0
							slot3 = slot3.contextData
							slot3 = slot3.shipBluePrintVO
							slot3 = slot3.id

							if slot2 ~= slot3 then
								slot2 = 0.3
								slot3 = slot0
								slot4 = slot3
								slot3 = slot3.switchUI
								slot5 = slot2
								slot6 = false

								slot3(slot4, slot5, slot6)

								slot3 = LeanTween
								slot3 = slot3.delayedCall
								slot4 = slot2 + 0.1
								slot5 = System
								slot5 = slot5.Action

								function slot6()
									slot0 = slot0

									slot0()

									slot0 = Canvas
									slot0 = slot0.ForceUpdateCanvases

									slot0()

									slot0 = slot1
									slot1 = slot0
									slot0 = slot0.switchUI
									slot2 = slot2
									slot3 = true

									slot0(slot1, slot2, slot3)
								end

								slot3(slot4, slot5(slot6))
							else
								slot2 = slot1

								slot2()
							end
						else
							slot2 = slot1

							slot2()

							slot2 = Canvas
							slot2 = slot2.ForceUpdateCanvases

							slot2()

							slot2 = slot0
							slot3 = true
							slot2.inFlag = slot3
							slot2 = slot0
							slot3 = true
							slot2.flag = slot3
							slot2 = slot0
							slot3 = slot2
							slot2 = slot2.hideUI

							slot2(slot3)
						end
					end

					slot1 = slot1
					slot2 = slot1
					slot1 = slot1.updateSelectedStyle
					slot3 = slot0

					slot1(slot2, slot3)
				end

				slot8 = SFX_PANEL

				slot4(slot5, slot6, slot7, slot8)

				return
			end

			slot3 = UIItemList
			slot3 = slot3.EventUpdate

			if slot0 == slot3 then
				slot3 = slot0
				slot3 = slot3.bluePrintItems
				slot3 = slot3[slot2]
				slot4 = slot0
				slot4 = slot4.filterBlueprintVOs
				slot5 = slot1 + 1
				slot4 = slot4[slot5]
				slot5 = slot4.id
				slot6 = 0

				if slot5 > slot6 then
					slot6 = slot4
					slot5 = slot4.getItemId
					slot5 = slot5(slot6)
					slot6 = slot0
					slot7 = slot6
					slot6 = slot6.getItemById
					slot8 = slot5
					slot6 = slot6(slot7, slot8)
					slot8 = slot3
					slot7 = slot3.update
					slot9 = slot4
					slot10 = slot6

					slot7(slot8, slot9, slot10)
				else
					slot6 = slot3
					slot5 = slot3.update
					slot7 = slot4
					slot8 = nil

					slot5(slot6, slot7, slot8)
				end
			end
		end

		slot1(slot2, slot3)
	end

	slot1 = slot0.itemList
	slot2 = slot1
	slot1 = slot1.align
	slot3 = slot0.filterBlueprintVOs
	slot3 = #slot3

	slot1(slot2, slot3)

	slot1 = eachChild
	slot2 = slot0.shipContainer

	function slot3(slot0)
		slot1 = print_r
		slot2 = slot0
		slot2 = slot2.contextData

		slot1(slot2)

		slot1 = print_r
		slot2 = slot0
		slot2 = slot2.bluePrintItems
		slot2 = slot2[slot0]

		slot1(slot2)

		slot1 = slot0
		slot1 = slot1.contextData
		slot1 = slot1.shipBluePrintVO
		slot1 = slot1.id
		slot2 = slot0
		slot2 = slot2.bluePrintItems
		slot2 = slot2[slot0]
		slot2 = slot2.shipBluePrintVO
		slot2 = slot2.id

		if slot1 == slot2 then
			slot1 = triggerToggle
			slot2 = slot0
			slot3 = true

			slot1(slot2, slot3)
		end
	end

	slot1(slot2, slot3)
end

slot0.initShips = slot8

function slot8(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO

	if slot1 then
		slot1 = slot0.contextData
		slot1 = slot1.shipBluePrintVO
		slot2 = slot1
		slot1 = slot1.getConfig
		slot3 = "blueprint_version"
		slot1 = slot1(slot2, slot3)
		slot0.version = slot1
		slot2 = slot0
		slot1 = slot0.emit
		slot3 = ShipBluePrintMediator
		slot3 = slot3.SET_TECHNOLOGY_VERSION
		slot4 = slot0.version

		slot1(slot2, slot3, slot4)
	end

	slot1 = 1
	slot0.version = slot1
	slot1 = {}
	slot0.filterBlueprintVOs = slot1
	slot1 = 0
	slot2 = pairs
	slot3 = slot0.bluePrintByIds
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot7 = slot6.version
		slot8 = slot0.version

		if slot7 == slot8 then
			slot7 = table
			slot7 = slot7.insert
			slot8 = slot0.filterBlueprintVOs
			slot9 = slot6

			slot7(slot8, slot9)

			slot1 = slot1 + 1
		end
	end

	slot2 = slot1
	slot3 = 5
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot0.filterBlueprintVOs
		slot8 = {
			id = -1,
			state = -1
		}

		slot6(slot7, slot8)
	end

	slot2 = table
	slot2 = slot2.sort
	slot3 = slot0.filterBlueprintVOs

	function slot4(slot0, slot1)
		slot2 = slot0.state
		slot3 = slot1.state

		if slot2 == slot3 then
			return slot0.id < slot1.id
		else
			return slot1.state < slot0.state
		end
	end

	slot2(slot3, slot4)
end

slot0.filterBlueprints = slot8

function slot8(slot0)
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot0
	slot2 = slot0.updateInfo

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updatePainting

	slot2(slot3)

	slot3 = slot0
	slot2 = slot0.updateProperty

	slot2(slot3)

	slot3 = slot1
	slot2 = slot1.isUnlock
	slot2 = slot2(slot3)
	slot3 = setActive
	slot4 = slot0.taskListPanel
	slot5 = not slot2

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.fittingPanel

	if slot2 then
		slot3(slot4, isActive(slot0.fittingPanel) and slot0.noUpdateMod)

		slot3 = setActive
		slot4 = slot0.modPanel
	end

	if slot2 then
		slot5 = isActive
		slot6 = slot0.fittingPanel
		slot5 = slot5(slot6)
		slot5 = not slot5
	end

	slot3(slot4, slot5)

	slot3 = setActive
	slot4 = slot0.attrDisableBtn
	slot5 = not slot2

	slot3(slot4, slot5)

	if slot2 then
		slot4 = slot0
		slot3 = slot0.updateMod

		slot3(slot4)
	else
		slot4 = slot0
		slot3 = slot0.updateTaskList

		slot3(slot4)

		slot3 = triggerToggle
		slot4 = slot0.initBtn
		slot5 = true

		slot3(slot4, slot5)
	end

	slot4 = slot1
	slot3 = slot1.isDeving
	slot3 = slot3(slot4)

	if slot3 then
		slot4 = slot0
		slot3 = slot0.emit
		slot5 = ShipBluePrintMediator
		slot5 = slot5.ON_CHECK_TAKES
		slot6 = slot1.id

		slot3(slot4, slot5, slot6)
	end
end

slot0.setSelectedBluePrint = slot8

function slot8(slot0)
	slot1 = slot0.noUpdateMod

	if slot1 then
		return
	end

	slot2 = slot0
	slot1 = slot0.updateModPanel

	slot1(slot2)

	slot2 = slot0
	slot1 = slot0.updateModAdditionPanel

	slot1(slot2)
end

slot0.updateMod = slot8

function slot8(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.getShipById
	slot4 = slot1.shipId
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.contextData
	slot3 = slot3.shipBluePrintVO
	slot4 = intProperties
	slot6 = slot3
	slot5 = slot3.getShipProperties
	slot7 = slot2
	slot4 = slot4(slot5(slot6, slot7))
	slot5 = intProperties
	slot7 = slot1
	slot6 = slot1.getShipProperties
	slot8 = slot2
	slot5 = slot5(slot6(slot7, slot8))
	slot6 = Clone
	slot7 = slot1
	slot6 = slot6(slot7)
	slot8 = slot6
	slot7 = slot6.getMaxLevel
	slot7 = slot7(slot8)
	slot6.level = slot7
	slot7 = intProperties
	slot9 = slot6
	slot8 = slot6.getShipProperties
	slot10 = slot2
	slot7 = slot7(slot8(slot9, slot10))

	function slot8(slot0, slot1, slot2, slot3)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-54, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 56-118, warpins: 2 ---
		slot4 = slot0
		slot5 = slot4
		slot4 = slot4.findTF
		slot6 = "attr_bg/name"
		slot7 = slot0
		slot4 = slot4(slot5, slot6, slot7)
		slot5 = slot0
		slot6 = slot5
		slot5 = slot5.findTF
		slot7 = "attr_bg/value"
		slot8 = slot0
		slot5 = slot5(slot6, slot7, slot8)
		slot6 = slot0
		slot7 = slot6
		slot6 = slot6.findTF
		slot8 = "attr_bg/max"
		slot9 = slot0
		slot6 = slot6(slot7, slot8, slot9)
		slot7 = slot0
		slot8 = slot7
		slot7 = slot7.findTF
		slot9 = "slider"
		slot10 = slot0
		slot7 = slot7(slot8, slot9, slot10)
		slot8 = slot7
		slot7 = slot7.GetComponent
		slot9 = typeof
		slot10 = Slider
		slot7 = slot7(slot8, slot9(slot10))
		slot8 = slot0
		slot9 = slot8
		slot8 = slot8.findTF
		slot10 = "pre_slider"
		slot11 = slot0
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = slot8
		slot8 = slot8.GetComponent
		slot10 = typeof
		slot11 = Slider
		slot8 = slot8(slot9, slot10(slot11))
		slot9 = slot0
		slot10 = slot9
		slot9 = slot9.findTF
		slot11 = "exp"
		slot12 = slot0
		slot9 = slot9(slot10, slot11, slot12)
		slot10 = slot1
		slot11 = slot10
		slot10 = slot10.isMaxLevel
		slot10 = slot10(slot11)

		if slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 55-55, warpins: 1 ---
			slot3 = slot2
			--- END OF BLOCK #0 ---



		end

		slot10 = setText
		slot11 = slot6
		slot12 = slot3

		slot10(slot11, slot12)

		slot10 = setText
		slot11 = slot4
		slot12 = AttributeType
		slot12 = slot12.Type2Name
		slot13 = slot1

		slot10(slot11, slot12(slot13))

		slot10 = setText
		slot11 = slot5
		slot12 = slot2

		slot10(slot11, slot12)

		slot10 = slot2
		slot11 = slot10
		slot10 = slot10.getBluePrintAddition
		slot12 = slot1
		slot10, slot11 = slot10(slot11, slot12)
		slot12 = table
		slot12 = slot12.indexof
		slot13 = ShipModAttr
		slot13 = slot13.BLUEPRINT_ATTRS
		slot14 = slot1
		slot12 = slot12(slot13, slot14)
		slot13 = slot2
		slot14 = slot13
		slot13 = slot13.getExpRetio
		slot15 = slot12
		slot13 = slot13(slot14, slot15)
		slot14 = slot11 / slot13
		slot7.value = slot14
		slot14 = slot1
		slot15 = slot14
		slot14 = slot14.getBluePrintAddition
		slot16 = slot1
		slot14, slot15 = slot14(slot15, slot16)
		slot16 = slot1
		slot17 = slot16
		slot16 = slot16.getExpRetio
		slot18 = slot12
		slot16 = slot16(slot17, slot18)
		slot17 = setText
		slot18 = slot9
		slot19 = math
		slot19 = slot19.floor
		slot20 = slot15
		slot19 = slot19(slot20)
		slot20 = "/"
		slot21 = slot13
		slot19 = slot19 .. slot20 .. slot21

		slot17(slot18, slot19)

		slot17 = math
		slot17 = slot17.floor
		slot18 = slot14
		slot17 = slot17(slot18)
		slot18 = math
		slot18 = slot18.floor
		slot19 = slot10
		slot18 = slot18(slot19)
		slot17 = (slot18 < slot17 and 1) or slot15 / slot16
		slot8.value = slot17

		return

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #2 119-120, warpins: 1 ---
		slot17 = 1

		if 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 121-121, warpins: 1 ---
			slot17 = slot15 / slot16
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 122-123, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	slot9 = 0
	slot10 = pairs
	slot11 = slot5
	slot10, slot11, slot12 = slot10(slot11)

	for slot13, slot14 in slot10, slot11, slot12 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 38-45, warpins: 1 ---
		slot15 = table
		slot15 = slot15.contains
		slot16 = ShipModAttr
		slot16 = slot16.BLUEPRINT_ATTRS
		slot17 = slot13
		slot15 = slot15(slot16, slot17)

		if slot15 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 46-58, warpins: 1 ---
			slot15 = slot0.attrContainer
			slot16 = slot15
			slot15 = slot15.Find
			slot17 = slot13
			slot15 = slot15(slot16, slot17)
			slot9 = slot9 + 1
			slot16 = slot8
			slot17 = slot15
			slot18 = slot13
			slot19 = slot14
			slot20 = slot7[slot13]

			if not slot20 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 59-59, warpins: 1 ---
				slot20 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 60-60, warpins: 2 ---
			slot16(slot17, slot18, slot19, slot20)
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 61-62, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	slot10 = slot0.modLevel
	slot12 = slot0
	slot11 = slot0.formatModLvTxt
	slot13 = slot1.level
	slot15 = slot1
	slot14 = slot1.getMaxLevel
	slot11 = slot11(slot12, slot13, slot14(slot15))
	slot10.text = slot11
	slot11 = slot3
	slot10 = slot3.getNextLevelExp
	slot10 = slot10(slot11)

	if slot10 == -1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 77-80, warpins: 1 ---
		slot11 = slot0.levelSlider
		slot12 = 1
		slot11.value = slot12
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 81-84, warpins: 1 ---
		slot11 = slot0.levelSlider
		slot12 = slot3.exp
		slot12 = slot12 / slot10
		slot11.value = slot12
		--- END OF BLOCK #0 ---



	end

	slot12 = slot1
	slot11 = slot1.getNextLevelExp
	slot11 = slot11(slot12)
	slot10 = slot11

	if slot10 == -1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 91-98, warpins: 1 ---
		slot11 = setText
		slot12 = slot0.levelSliderTxt
		slot13 = "MAX"

		slot11(slot12, slot13)

		slot11 = slot0.preLevelSlider
		slot12 = 1
		slot11.value = slot12
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 99-112, warpins: 1 ---
		slot11 = setText
		slot12 = slot0.levelSliderTxt
		slot13 = slot1.exp
		slot14 = "/"
		slot16 = slot1
		slot15 = slot1.getNextLevelExp
		slot15 = slot15(slot16)
		slot13 = slot13 .. slot14 .. slot15

		slot11(slot12, slot13)

		slot11 = slot0.preLevelSlider
		slot12 = slot1.level
		slot13 = slot3.level

		if slot13 < slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 113-114, warpins: 1 ---
			slot12 = 1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 115-116, warpins: 1 ---
			slot12 = slot1.exp
			slot12 = slot12 / slot10
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 117-117, warpins: 2 ---
		slot11.value = slot12
		--- END OF BLOCK #1 ---



	end

	slot12 = slot1
	slot11 = slot1.isShipModMaxLevel
	slot13 = slot2
	slot11, slot12 = slot11(slot12, slot13)
	slot13 = setActive
	slot14 = slot0.needLevelTxt
	slot15 = slot11

	slot13(slot14, slot15)

	slot13 = setActive
	slot14 = slot0.levelSliderTxt
	slot15 = not slot11

	slot13(slot14, slot15)

	if slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 132-141, warpins: 1 ---
		slot13 = setText
		slot14 = slot0.needLevelTxt
		slot15 = i18n
		slot16 = "buleprint_need_level_tip"
		slot17 = slot12

		slot13(slot14, slot15(slot16, slot17))

		slot13 = slot0.levelSlider
		slot14 = 1
		slot13.value = slot14
		--- END OF BLOCK #0 ---



	end
end

slot0.updateModInfo = slot8

function slot8(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot1 = slot0.inAnim

	return slot1
	--- END OF BLOCK #0 ---



end

slot0.inModAnim = slot8

function slot8(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot3 = "<size=45>"
	slot4 = slot1
	slot5 = "</size>/<size=27>"
	slot6 = slot2
	slot7 = "</size>"
	slot3 = slot3 .. slot4 .. slot5 .. slot6 .. slot7

	return slot3
	--- END OF BLOCK #0 ---



end

slot0.formatModLvTxt = slot8
slot8 = 0.2

function slot9(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot4 = slot0
	slot3 = slot0.clearLeanTween

	slot3(slot4)

	slot3 = true
	slot0.inAnim = slot3
	slot3 = {}
	slot5 = slot2
	slot4 = slot2.getMaxLevel
	slot4 = slot4(slot5)
	slot5 = slot1.level

	if slot5 ~= slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-20, warpins: 1 ---
		function slot5(slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot3 = Clone
			slot4 = slot0
			slot3 = slot3(slot4)
			slot0 = slot3
			slot0.level = slot1
			slot0.exp = slot2

			return slot0
			--- END OF BLOCK #0 ---



		end

		slot6 = slot0.preLevelSlider
		slot7 = 0
		slot6.value = slot7
		slot6 = slot1.level
		slot7 = slot2.level
		slot8 = 1

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-53, warpins: 0 ---
		for slot9 = slot6, slot7, slot8 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-23, warpins: 2 ---
			slot10 = slot1.level

			if slot9 == slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 24-30, warpins: 1 ---
				slot10 = slot1.exp
				slot12 = slot1
				slot11 = slot1.getNextLevelExp
				slot11 = slot11(slot12)
				slot10 = slot10 / slot11

				if not slot10 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 31-31, warpins: 2 ---
					slot10 = 0
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 32-34, warpins: 2 ---
			slot11 = slot2.level

			if slot9 == slot11 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 35-37, warpins: 1 ---
				slot11 = slot2.level

				if slot11 ~= slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 38-44, warpins: 1 ---
					slot11 = slot2.exp
					slot13 = slot2
					slot12 = slot2.getNextLevelExp
					slot12 = slot12(slot13)
					slot11 = slot11 / slot12

					if not slot11 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 45-45, warpins: 3 ---
						slot11 = 1
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 46-53, warpins: 2 ---
			slot12 = table
			slot12 = slot12.insert
			slot13 = slot3

			function slot14(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-14, warpins: 1 ---
				slot1 = TweenValue
				slot2 = go
				slot3 = slot0
				slot3 = slot3.levelSlider
				slot2 = slot2(slot3)
				slot3 = slot1
				slot4 = slot2
				slot5 = slot3
				slot6 = nil

				function slot7(slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-4, warpins: 1 ---
					slot1 = slot0
					slot1 = slot1.levelSlider
					slot1.value = slot0

					return
					--- END OF BLOCK #0 ---



				end

				function slot8()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0 = slot0
					slot1 = slot1
					slot1 = slot1.level

					if slot0 == slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 6-8, warpins: 1 ---
						slot0 = slot1

						if not slot0 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 9-13, warpins: 2 ---
							slot0 = slot2
							slot1 = slot1
							slot2 = slot0
							slot3 = 0
							slot0 = slot0(slot1, slot2, slot3)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 14-18, warpins: 2 ---
					slot1 = slot0
					slot2 = slot3
					slot2 = slot2.level

					if slot1 == slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 19-21, warpins: 1 ---
						slot1 = slot3

						if not slot1 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 22-27, warpins: 2 ---
							slot1 = slot2
							slot2 = slot1
							slot3 = slot0
							slot3 = slot3 + 1
							slot4 = 0
							slot1 = slot1(slot2, slot3, slot4)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 28-44, warpins: 2 ---
					slot2 = slot4
					slot3 = slot2
					slot2 = slot2.doAttrsAinm
					slot4 = slot0
					slot5 = slot1
					slot6 = slot5

					slot2(slot3, slot4, slot5, slot6)

					slot2 = slot4
					slot2 = slot2.modLevel
					slot3 = slot4
					slot4 = slot3
					slot3 = slot3.formatModLvTxt
					slot5 = slot1.level
					slot6 = slot6
					slot3 = slot3(slot4, slot5, slot6)
					slot2.text = slot3

					return
					--- END OF BLOCK #2 ---



				end

				slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8)

				return
				--- END OF BLOCK #0 ---



			end

			slot12(slot13, slot14)
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 54-59, warpins: 1 ---
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot0.leanTweens
		slot8 = slot0.levelSlider

		slot6(slot7, slot8)
		--- END OF BLOCK #2 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 60-71, warpins: 1 ---
		slot6 = slot2
		slot5 = slot2.getMaxFateLevel
		slot5 = slot5(slot6)
		slot4 = slot5

		function slot5(slot0, slot1, slot2)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot3 = Clone
			slot4 = slot0
			slot3 = slot3(slot4)
			slot0 = slot3
			slot0.fateLevel = slot1
			slot0.exp = slot2

			return slot0
			--- END OF BLOCK #0 ---



		end

		slot6 = slot0.prePhaseSlider
		slot7 = 0
		slot6.value = slot7
		slot6 = slot1.fateLevel
		slot7 = slot2.fateLevel
		slot8 = 1

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 72-104, warpins: 0 ---
		for slot9 = slot6, slot7, slot8 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 72-74, warpins: 2 ---
			slot10 = slot1.fateLevel

			if slot9 == slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 75-81, warpins: 1 ---
				slot10 = slot1.exp
				slot12 = slot1
				slot11 = slot1.getNextFateLevelExp
				slot11 = slot11(slot12)
				slot10 = slot10 / slot11

				if not slot10 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 82-82, warpins: 2 ---
					slot10 = 0
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 83-85, warpins: 2 ---
			slot11 = slot2.fateLevel

			if slot9 == slot11 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 86-88, warpins: 1 ---
				slot11 = slot2.fateLevel

				if slot11 ~= slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 89-95, warpins: 1 ---
					slot11 = slot2.exp
					slot13 = slot2
					slot12 = slot2.getNextFateLevelExp
					slot12 = slot12(slot13)
					slot11 = slot11 / slot12

					if not slot11 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 96-96, warpins: 3 ---
						slot11 = 1
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 97-104, warpins: 2 ---
			slot12 = table
			slot12 = slot12.insert
			slot13 = slot3

			function slot14(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-14, warpins: 1 ---
				slot1 = TweenValue
				slot2 = go
				slot3 = slot0
				slot3 = slot3.phaseSlider
				slot2 = slot2(slot3)
				slot3 = slot1
				slot4 = slot2
				slot5 = slot3
				slot6 = nil

				function slot7(slot0)

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-4, warpins: 1 ---
					slot1 = slot0
					slot1 = slot1.phaseSlider
					slot1.value = slot0

					return
					--- END OF BLOCK #0 ---



				end

				function slot8()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-5, warpins: 1 ---
					slot0 = slot0
					slot1 = slot1
					slot1 = slot1.fateLevel

					if slot0 == slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 6-8, warpins: 1 ---
						slot0 = slot1

						if not slot0 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 9-13, warpins: 2 ---
							slot0 = slot2
							slot1 = slot1
							slot2 = slot0
							slot3 = 0
							slot0 = slot0(slot1, slot2, slot3)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 14-18, warpins: 2 ---
					slot1 = slot0
					slot2 = slot3
					slot2 = slot2.fateLevel

					if slot1 == slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 19-21, warpins: 1 ---
						slot1 = slot3

						if not slot1 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 22-27, warpins: 2 ---
							slot1 = slot2
							slot2 = slot1
							slot3 = slot0
							slot3 = slot3 + 1
							slot4 = 0
							slot1 = slot1(slot2, slot3, slot4)
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #1 ---

					FLOW; TARGET BLOCK #2



					-- Decompilation error in this vicinity:
					--- BLOCK #2 28-51, warpins: 2 ---
					slot2 = slot4
					slot3 = slot2
					slot2 = slot2.updateFittingAttrPanel
					slot4 = slot1

					slot2(slot3, slot4)

					slot2 = GetImageSpriteFromAtlasAsync
					slot3 = "ui/shipblueprintui_atlas"
					slot4 = "phase_"
					slot5 = math
					slot5 = slot5.min
					slot6 = slot1.fateLevel
					slot6 = slot6 + 1
					slot8 = slot1
					slot7 = slot1.getMaxFateLevel
					slot5 = slot5(slot6, slot7(slot8))
					slot4 = slot4 .. slot5
					slot5 = slot4
					slot5 = slot5.phasePic
					slot6 = true

					slot2(slot3, slot4, slot5, slot6)

					slot2 = slot5

					slot2()

					return
					--- END OF BLOCK #2 ---



				end

				slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8)

				return
				--- END OF BLOCK #0 ---



			end

			slot12(slot13, slot14)
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 105-110, warpins: 1 ---
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot0.leanTweens
		slot8 = slot0.phaseSlider

		slot6(slot7, slot8)
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 111-116, warpins: 2 ---
	slot5 = seriesAsync
	slot6 = slot3

	function slot7()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot0 = slot0
		slot1 = false
		slot0.noUpdateMod = slot1
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.updateMod

		slot0(slot1)

		slot0 = slot0
		slot1 = false
		slot0.inAnim = slot1

		return
		--- END OF BLOCK #0 ---



	end

	slot5(slot6, slot7)

	return
	--- END OF BLOCK #1 ---



end

slot0.doModAnim = slot9

function slot9(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot4 = {}
	slot6 = slot0
	slot5 = slot0.getShipById
	slot7 = slot1.shipId
	slot5 = slot5(slot6, slot7)
	slot6 = intProperties
	slot8 = slot1
	slot7 = slot1.getShipProperties
	slot9 = slot5
	slot6 = slot6(slot7(slot8, slot9))
	slot7 = intProperties
	slot9 = slot2
	slot8 = slot2.getShipProperties
	slot10 = slot5
	slot7 = slot7(slot8(slot9, slot10))
	slot8 = ipairs
	slot9 = ShipModAttr
	slot9 = slot9.BLUEPRINT_ATTRS
	slot8, slot9, slot10 = slot8(slot9)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 23-96, warpins: 0 ---
	for slot11, slot12 in slot8, slot9, slot10 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-26, warpins: 1 ---
		slot13 = AttributeType
		slot13 = slot13.AntiAircraft

		if slot12 ~= slot13 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-94, warpins: 1 ---
			slot13 = slot0.attrContainer
			slot14 = slot13
			slot13 = slot13.Find
			slot15 = slot12
			slot13 = slot13(slot14, slot15)
			slot15 = slot0
			slot14 = slot0.findTF
			slot16 = "attr_bg/value"
			slot17 = slot13
			slot14 = slot14(slot15, slot16, slot17)
			slot15 = slot14
			slot14 = slot14.GetComponent
			slot16 = typeof
			slot17 = Text
			slot14 = slot14(slot15, slot16(slot17))
			slot16 = slot0
			slot15 = slot0.findTF
			slot17 = "slider"
			slot18 = slot13
			slot15 = slot15(slot16, slot17, slot18)
			slot16 = slot15
			slot15 = slot15.GetComponent
			slot17 = typeof
			slot18 = Slider
			slot15 = slot15(slot16, slot17(slot18))
			slot17 = slot0
			slot16 = slot0.findTF
			slot18 = "pre_slider"
			slot19 = slot13
			slot16 = slot16(slot17, slot18, slot19)
			slot17 = slot16
			slot16 = slot16.GetComponent
			slot18 = typeof
			slot19 = Slider
			slot16 = slot16(slot17, slot18(slot19))
			slot17 = table
			slot17 = slot17.indexof
			slot18 = ShipModAttr
			slot18 = slot18.BLUEPRINT_ATTRS
			slot19 = slot12
			slot17 = slot17(slot18, slot19)
			slot19 = slot1
			slot18 = slot1.getExpRetio
			slot20 = slot17
			slot18 = slot18(slot19, slot20)
			slot19 = slot6[slot12]
			slot20 = slot7[slot12]
			slot22 = slot1
			slot21 = slot1.getBluePrintAddition
			slot23 = slot12
			slot21, slot22 = slot21(slot22, slot23)
			slot24 = slot2
			slot23 = slot2.getBluePrintAddition
			slot25 = slot12
			slot23, slot24 = slot23(slot24, slot25)
			slot25 = slot22 / slot18
			slot26 = slot24 / slot18
			slot27 = 0
			slot16.value = slot27
			slot27 = table
			slot27 = slot27.insert
			slot28 = slot4

			function slot29(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-20, warpins: 1 ---
				slot1 = slot0
				slot2 = slot1
				slot1 = slot1.doAttrAnim
				slot3 = slot1
				slot4 = slot2
				slot5 = slot3
				slot6 = slot4
				slot7 = math
				slot7 = slot7.floor
				slot8 = slot5
				slot7 = slot7(slot8)
				slot8 = math
				slot8 = slot8.floor
				slot9 = slot6
				slot8 = slot8(slot9)
				slot9 = slot7
				slot10 = slot8
				slot11 = slot0

				slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11)

				return
				--- END OF BLOCK #0 ---



			end

			slot27(slot28, slot29)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 95-96, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 97-102, warpins: 1 ---
	slot8 = parallelAsync
	slot9 = slot4
	slot10 = slot3

	slot8(slot9, slot10)

	return
	--- END OF BLOCK #2 ---



end

slot0.doAttrsAinm = slot9
slot9 = 0.1

function slot10(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot10 = table
	slot10 = slot10.insert
	slot11 = slot0.leanTweens
	slot12 = slot1

	slot10(slot11, slot12)

	slot10 = {}
	slot11 = slot5
	slot12 = slot6
	slot13 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-28, warpins: 0 ---
	for slot14 = slot11, slot12, slot13 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 2 ---
		if slot14 ~= slot5 or not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-15, warpins: 2 ---
			slot15 = 0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-17, warpins: 2 ---
		if slot14 ~= slot6 or not slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-20, warpins: 2 ---
			slot16 = 1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 21-28, warpins: 2 ---
		slot17 = table
		slot17 = slot17.insert
		slot18 = slot10

		function slot19(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-13, warpins: 1 ---
			slot1 = TweenValue
			slot2 = go
			slot3 = slot0
			slot2 = slot2(slot3)
			slot3 = slot1
			slot4 = slot2
			slot5 = slot3
			slot6 = nil

			function slot7(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-3, warpins: 1 ---
				slot1 = slot0
				slot1.value = slot0

				return
				--- END OF BLOCK #0 ---



			end

			function slot8()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-16, warpins: 1 ---
				slot0 = slot0
				slot1 = slot1
				slot2 = math
				slot2 = slot2.min
				slot3 = slot2
				slot4 = slot3
				slot3 = slot3 - slot4
				slot4 = slot1
				slot5 = slot4
				slot4 = slot4 - slot5
				slot2 = slot2(slot3, slot4)
				slot1 = slot1 - slot2
				slot0.text = slot1
				slot0 = slot5

				slot0()

				return
				--- END OF BLOCK #0 ---



			end

			slot1(slot2, slot3, slot4, slot5, slot6, slot7, slot8)

			return
			--- END OF BLOCK #0 ---



		end

		slot17(slot18, slot19)
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-34, warpins: 1 ---
	slot11 = seriesAsync
	slot12 = slot10

	function slot13()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0 = slot0

		slot0()

		return
		--- END OF BLOCK #0 ---



	end

	slot11(slot12, slot13)

	return
	--- END OF BLOCK #2 ---



end

slot0.doAttrAnim = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = pairs
	slot3 = slot0.leanTweens
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-20, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-12, warpins: 1 ---
		slot7 = LeanTween
		slot7 = slot7.isTweening
		slot8 = go
		slot9 = slot6
		slot7 = slot7(slot8(slot9))

		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-18, warpins: 1 ---
			slot7 = LeanTween
			slot7 = slot7.cancel
			slot8 = go
			slot9 = slot6

			slot7(slot8(slot9))
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-20, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-23, warpins: 1 ---
	slot2 = slot0.inAnim

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-27, warpins: 1 ---
		slot2 = nil
		slot0.inAnim = slot2

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-29, warpins: 1 ---
			slot2 = false
			slot0.noUpdateMod = slot2
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 30-32, warpins: 3 ---
	slot2 = {}
	slot0.leanTweens = slot2

	return
	--- END OF BLOCK #3 ---



end

slot0.clearLeanTween = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot0
	slot2 = slot0.getShipById
	slot4 = slot1.shipId
	slot2 = slot2(slot3, slot4)
	slot4 = slot1
	slot3 = slot1.getConfig
	slot5 = "strengthen_item"
	slot3 = slot3(slot4, slot5)
	slot5 = slot0
	slot4 = slot0.getItemById
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	slot5 = 0
	slot6 = math
	slot6 = slot6.min
	slot7 = slot4.count
	slot9 = slot1
	slot8 = slot1.getUseageMaxItem
	slot6 = slot6(slot7, slot8(slot9))

	function slot7(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-23, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getItemExp
		slot1 = slot1(slot2)
		slot2 = slot0 * slot1
		slot3 = Clone
		slot4 = slot0
		slot3 = slot3(slot4)
		slot5 = slot3
		slot4 = slot3.addExp
		slot6 = slot2

		slot4(slot5, slot6)

		slot4 = slot1
		slot5 = slot4
		slot4 = slot4.updateModInfo
		slot6 = slot3

		slot4(slot5, slot6)

		slot4 = setText
		slot5 = slot1
		slot5 = slot5.calcTxt
		slot6 = slot0

		slot4(slot5, slot6)

		return
		--- END OF BLOCK #0 ---



	end

	slot8 = nil
	slot9 = slot0.nameTxts
	slot10 = slot0.itemInfo
	slot9 = slot9[slot10]

	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-33, warpins: 1 ---
		slot9 = slot0.nameTxts
		slot10 = slot0.itemInfo
		slot8 = slot9[slot10]
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-48, warpins: 1 ---
		slot9 = ScrollTxt
		slot9 = slot9.New
		slot10 = findTF
		slot11 = slot0.itemInfo
		slot12 = "name"
		slot10 = slot10(slot11, slot12)
		slot11 = findTF
		slot12 = slot0.itemInfo
		slot13 = "name/Text"
		slot9 = slot9(slot10, slot11(slot12, slot13))
		slot8 = slot9
		slot9 = slot0.nameTxts
		slot10 = slot0.itemInfo
		slot9[slot10] = slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 49-104, warpins: 2 ---
	slot10 = slot8
	slot9 = slot8.setText
	slot12 = slot4
	slot11 = slot4.getConfig
	slot13 = "name"

	slot9(slot10, slot11(slot12, slot13))

	slot9 = slot0.itemInfoCount
	slot10 = slot4.count
	slot9.text = slot10
	slot9 = GetImageSpriteFromAtlasAsync
	slot11 = slot4
	slot10 = slot4.getConfig
	slot12 = "icon"
	slot10 = slot10(slot11, slot12)
	slot11 = ""
	slot12 = slot0.itemInfoIcon

	slot9(slot10, slot11, slot12)

	slot9 = onButton
	slot10 = slot0
	slot11 = slot0.modBtn

	function slot12()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.inModAnim
		slot0 = slot0(slot1)

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-10, warpins: 2 ---
		slot0 = slot1

		if slot0 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-11, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 12-21, warpins: 2 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipBluePrintMediator
		slot2 = slot2.ON_MOD
		slot3 = slot2
		slot3 = slot3.id
		slot4 = slot1

		slot0(slot1, slot2, slot3, slot4)

		return
		--- END OF BLOCK #2 ---



	end

	slot13 = SFX_PANEL

	slot9(slot10, slot11, slot12, slot13)

	slot9 = pressPersistTrigger
	slot10 = slot0.calcMinBtn
	slot11 = 0.5

	function slot12(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.inModAnim
		slot1 = slot1(slot2)

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-12, warpins: 1 ---
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.isMaxLevel
			slot1 = slot1(slot2)

			if not slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-15, warpins: 1 ---
				slot1 = slot2

				if slot1 == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 16-17, warpins: 3 ---
					if slot0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 18-19, warpins: 1 ---
						slot1 = slot0

						slot1()
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 20-20, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-31, warpins: 2 ---
		slot1 = math
		slot1 = slot1.max
		slot2 = slot2
		slot2 = slot2 - 1
		slot3 = 0
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot3
		slot2 = slot2

		slot1(slot2)

		return
		--- END OF BLOCK #1 ---



	end

	slot13 = nil
	slot14 = true
	slot15 = true
	slot16 = 0.1
	slot17 = SFX_PANEL

	slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)

	slot9 = pressPersistTrigger
	slot10 = slot0.calcMaxBtn
	slot11 = 0.5

	function slot12(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.inModAnim
		slot1 = slot1(slot2)

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-12, warpins: 1 ---
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.isMaxLevel
			slot1 = slot1(slot2)

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-14, warpins: 2 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-16, warpins: 1 ---
					slot1 = slot0

					slot1()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 17-17, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-47, warpins: 2 ---
		slot1 = slot2
		slot1 = slot1 + 1
		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.getItemExp
		slot2 = slot2(slot3)
		slot3 = slot1 * slot2
		slot4 = Clone
		slot5 = slot1
		slot4 = slot4(slot5)
		slot6 = slot4
		slot5 = slot4.addExp
		slot7 = slot3

		slot5(slot6, slot7)

		slot6 = slot4
		slot5 = slot4.getStrengthenConfig
		slot7 = math
		slot7 = slot7.min
		slot8 = slot4.level
		slot8 = slot8 + 1
		slot10 = slot4
		slot9 = slot4.getMaxLevel
		slot5 = slot5(slot6, slot7(slot8, slot9(slot10)))
		slot6 = slot3
		slot6 = slot6.level
		slot7 = slot5.need_lv

		if slot6 < slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 48-50, warpins: 1 ---
			slot6 = slot4.exp

			if slot2 <= slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-52, warpins: 1 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 53-54, warpins: 1 ---
					slot6 = slot0

					slot6()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 55-55, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 56-61, warpins: 3 ---
		slot6 = slot4.level
		slot8 = slot4
		slot7 = slot4.getMaxLevel
		slot7 = slot7(slot8)

		if slot6 == slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-64, warpins: 1 ---
			slot6 = slot4.exp

			if slot2 <= slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-66, warpins: 1 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 67-68, warpins: 1 ---
					slot6 = slot0

					slot6()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 69-69, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 70-84, warpins: 3 ---
		slot6 = math
		slot6 = slot6.max
		slot7 = math
		slot7 = slot7.min
		slot8 = slot2
		slot8 = slot8 + 1
		slot9 = slot4
		slot7 = slot7(slot8, slot9)
		slot8 = 0
		slot6 = slot6(slot7, slot8)
		slot2 = slot6
		slot6 = slot5
		slot7 = slot2

		slot6(slot7)

		return
		--- END OF BLOCK #3 ---



	end

	slot13 = nil
	slot14 = true
	slot15 = true
	slot16 = 0.1
	slot17 = SFX_PANEL

	slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)

	slot9 = slot7
	slot10 = slot5

	slot9(slot10)

	function slot9(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-11, warpins: 1 ---
		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.calcPanel
		slot3 = not slot0

		slot1(slot2, slot3)

		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.fittingBtn
		slot3 = slot0

		slot1(slot2, slot3)

		return
		--- END OF BLOCK #0 ---



	end

	slot10 = slot9
	slot11 = false

	slot10(slot11)

	slot11 = slot1
	slot10 = slot1.canFateSimulation
	slot10 = slot10(slot11)

	if slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 105-127, warpins: 1 ---
		slot11 = slot0
		slot10 = slot0.updateFittingPanel

		slot10(slot11)

		slot10 = onButton
		slot11 = slot0
		slot12 = slot0.fittingBtn

		function slot13()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-21, warpins: 1 ---
			slot0 = 0.3
			slot1 = setActive
			slot2 = slot0
			slot3 = slot2
			slot2 = slot2.findTF
			slot4 = "anim/ShipBlue02"
			slot5 = slot0
			slot5 = slot5.fittingBtn
			slot2 = slot2(slot3, slot4, slot5)
			slot3 = true

			slot1(slot2, slot3)

			slot1 = LeanTween
			slot1 = slot1.delayedCall
			slot2 = 0.6
			slot3 = System
			slot3 = slot3.Action

			function slot4()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-16, warpins: 1 ---
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.switch2FittingPanel
				slot2 = slot1
				slot3 = false

				slot0(slot1, slot2, slot3)

				slot0 = LeanTween
				slot0 = slot0.delayedCall
				slot1 = slot1
				slot1 = slot1 + 0.1
				slot2 = System
				slot2 = slot2.Action

				function slot3()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-26, warpins: 1 ---
					slot0 = setActive
					slot1 = slot0
					slot1 = slot1.modPanel
					slot2 = false

					slot0(slot1, slot2)

					slot0 = setActive
					slot1 = slot0
					slot1 = slot1.fittingPanel
					slot2 = true

					slot0(slot1, slot2)

					slot0 = setActive
					slot1 = slot0
					slot2 = slot1
					slot1 = slot1.findTF
					slot3 = "anim/ShipBlue02"
					slot4 = slot0
					slot4 = slot4.fittingBtn
					slot1 = slot1(slot2, slot3, slot4)
					slot2 = false

					slot0(slot1, slot2)

					slot0 = PlayerPrefs
					slot0 = slot0.HasKey
					slot1 = "first_fate"
					slot0 = slot0(slot1)

					if not slot0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 27-38, warpins: 1 ---
						slot0 = triggerButton
						slot1 = slot0
						slot1 = slot1.helpBtn

						slot0(slot1)

						slot0 = PlayerPrefs
						slot0 = slot0.SetInt
						slot1 = "first_fate"
						slot2 = 1

						slot0(slot1, slot2)

						slot0 = PlayerPrefs
						slot0 = slot0.Save

						slot0()
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 39-48, warpins: 2 ---
					slot0 = Canvas
					slot0 = slot0.ForceUpdateCanvases

					slot0()

					slot0 = slot0
					slot1 = slot0
					slot0 = slot0.switch2FittingPanel
					slot2 = slot1
					slot3 = true

					slot0(slot1, slot2, slot3)

					return
					--- END OF BLOCK #1 ---



				end

				slot0(slot1, slot2(slot3))

				return
				--- END OF BLOCK #0 ---



			end

			slot1(slot2, slot3(slot4))

			return
			--- END OF BLOCK #0 ---



		end

		slot14 = SFX_PANEL

		slot10(slot11, slot12, slot13, slot14)

		slot11 = slot1
		slot10 = slot1.getConfig
		slot12 = "luck_story"
		slot10 = slot10(slot11, slot12)
		slot11 = pg
		slot11 = slot11.StoryMgr
		slot11 = slot11.GetInstance
		slot11 = slot11()
		slot12 = slot11
		slot11 = slot11.IsPlayed
		slot13 = slot10
		slot11 = slot11(slot12, slot13)

		if not slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 128-137, warpins: 1 ---
			slot11 = pg
			slot11 = slot11.StoryMgr
			slot11 = slot11.GetInstance
			slot11 = slot11()
			slot12 = slot11
			slot11 = slot11.Play
			slot13 = slot10

			function slot14()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-7, warpins: 1 ---
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.buildStartAni
				slot2 = "fateStartWindow"

				function slot3()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-4, warpins: 1 ---
					slot0 = slot0
					slot1 = true

					slot0(slot1)

					return
					--- END OF BLOCK #0 ---



				end

				slot0(slot1, slot2, slot3)

				return
				--- END OF BLOCK #0 ---



			end

			slot11(slot12, slot13, slot14)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 138-140, warpins: 1 ---
			slot11 = slot9
			slot12 = true

			slot11(slot12)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 141-142, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.updateModPanel = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-29, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot0
	slot2 = slot0.getShipById
	slot4 = slot1.shipId
	slot2 = slot2(slot3, slot4)
	slot4 = slot1
	slot3 = slot1.getConfig
	slot5 = "strengthen_item"
	slot3 = slot3(slot4, slot5)
	slot5 = slot0
	slot4 = slot0.getItemById
	slot6 = slot3
	slot4 = slot4(slot5, slot6)
	slot5 = 0
	slot6 = math
	slot6 = slot6.min
	slot7 = slot4.count
	slot9 = slot1
	slot8 = slot1.getFateUseageMaxItem
	slot6 = slot6(slot7, slot8(slot9))

	function slot7(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-23, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.getItemExp
		slot1 = slot1(slot2)
		slot2 = slot0 * slot1
		slot3 = Clone
		slot4 = slot0
		slot3 = slot3(slot4)
		slot5 = slot3
		slot4 = slot3.addExp
		slot6 = slot2

		slot4(slot5, slot6)

		slot4 = slot1
		slot5 = slot4
		slot4 = slot4.updateFittingInfo
		slot6 = slot3

		slot4(slot5, slot6)

		slot4 = setText
		slot5 = slot1
		slot5 = slot5.fittingCalcTxt
		slot6 = slot0

		slot4(slot5, slot6)

		return
		--- END OF BLOCK #0 ---



	end

	slot8 = nil
	slot9 = slot0.nameTxts
	slot10 = slot0.fittingItemInfo
	slot9 = slot9[slot10]

	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 30-33, warpins: 1 ---
		slot9 = slot0.nameTxts
		slot10 = slot0.fittingItemInfo
		slot8 = slot9[slot10]
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-48, warpins: 1 ---
		slot9 = ScrollTxt
		slot9 = slot9.New
		slot10 = findTF
		slot11 = slot0.fittingItemInfo
		slot12 = "name"
		slot10 = slot10(slot11, slot12)
		slot11 = findTF
		slot12 = slot0.fittingItemInfo
		slot13 = "name/Text"
		slot9 = slot9(slot10, slot11(slot12, slot13))
		slot8 = slot9
		slot9 = slot0.nameTxts
		slot10 = slot0.fittingItemInfo
		slot9[slot10] = slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 49-150, warpins: 2 ---
	slot10 = slot8
	slot9 = slot8.setText
	slot12 = slot4
	slot11 = slot4.getConfig
	slot13 = "name"

	slot9(slot10, slot11(slot12, slot13))

	slot9 = slot0.fittingItemInfoCount
	slot10 = slot4.count
	slot9.text = slot10
	slot9 = GetImageSpriteFromAtlasAsync
	slot11 = slot4
	slot10 = slot4.getConfig
	slot12 = "icon"
	slot10 = slot10(slot11, slot12)
	slot11 = ""
	slot12 = slot0.fittingItemInfoIcon

	slot9(slot10, slot11, slot12)

	slot9 = setText
	slot11 = slot0
	slot10 = slot0.findTF
	slot12 = "attr/name"
	slot13 = slot0.fittingAttrPanel
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = AttributeType
	slot11 = slot11.Type2Name
	slot12 = AttributeType
	slot12 = slot12.Luck

	slot9(slot10, slot11(slot12))

	slot9 = setText
	slot11 = slot0
	slot10 = slot0.findTF
	slot12 = "desc/top/text/Text"
	slot13 = slot0.fittingPanel
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = i18n
	slot12 = "fate_phase_word"

	slot9(slot10, slot11(slot12))

	slot9 = GetImageSpriteFromAtlasAsync
	slot10 = "tecfateskillicon/skill_"
	slot11 = slot1.id
	slot10 = slot10 .. slot11
	slot11 = ""
	slot13 = slot0
	slot12 = slot0.findTF
	slot14 = "phase_5/off/icon_off"
	slot15 = slot0.fittingAttrPanel
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = true

	slot9(slot10, slot11, slot12, slot13)

	slot9 = GetImageSpriteFromAtlasAsync
	slot10 = "tecfateskillicon/skill_on_"
	slot11 = slot1.id
	slot10 = slot10 .. slot11
	slot11 = ""
	slot13 = slot0
	slot12 = slot0.findTF
	slot14 = "phase_5/on/icon_on"
	slot15 = slot0.fittingAttrPanel
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = true

	slot9(slot10, slot11, slot12, slot13)

	slot9 = onButton
	slot10 = slot0
	slot11 = slot0.fittingCancelBtn

	function slot12()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-17, warpins: 1 ---
		slot0 = 0.3
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.switchUI
		slot3 = slot0
		slot4 = false

		slot1(slot2, slot3, slot4)

		slot1 = LeanTween
		slot1 = slot1.delayedCall
		slot2 = slot0 + 0.1
		slot3 = System
		slot3 = slot3.Action

		function slot4()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-20, warpins: 1 ---
			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.modPanel
			slot2 = true

			slot0(slot1, slot2)

			slot0 = setActive
			slot1 = slot0
			slot1 = slot1.fittingPanel
			slot2 = false

			slot0(slot1, slot2)

			slot0 = Canvas
			slot0 = slot0.ForceUpdateCanvases

			slot0()

			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.switchUI
			slot2 = slot1
			slot3 = true

			slot0(slot1, slot2, slot3)

			return
			--- END OF BLOCK #0 ---



		end

		slot1(slot2, slot3(slot4))

		return
		--- END OF BLOCK #0 ---



	end

	slot13 = SFX_PANEL

	slot9(slot10, slot11, slot12, slot13)

	slot9 = onButton
	slot10 = slot0
	slot11 = slot0.fittingConfirmBtn

	function slot12()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.inModAnim
		slot0 = slot0(slot1)

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-7, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 8-10, warpins: 2 ---
		slot0 = slot1

		if slot0 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-11, warpins: 1 ---
			return
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 12-21, warpins: 2 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.emit
		slot2 = ShipBluePrintMediator
		slot2 = slot2.ON_MOD
		slot3 = slot2
		slot3 = slot3.id
		slot4 = slot1

		slot0(slot1, slot2, slot3, slot4)

		return
		--- END OF BLOCK #2 ---



	end

	slot13 = SFX_PANEL

	slot9(slot10, slot11, slot12, slot13)

	slot9 = pressPersistTrigger
	slot10 = slot0.fittingCalcMinBtn
	slot11 = 0.5

	function slot12(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.inModAnim
		slot1 = slot1(slot2)

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-12, warpins: 1 ---
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.isMaxFateLevel
			slot1 = slot1(slot2)

			if not slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-15, warpins: 1 ---
				slot1 = slot2

				if slot1 == 0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 16-17, warpins: 3 ---
					if slot0 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 18-19, warpins: 1 ---
						slot1 = slot0

						slot1()
						--- END OF BLOCK #0 ---



					end

					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 20-20, warpins: 2 ---
					return
					--- END OF BLOCK #1 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 21-31, warpins: 2 ---
		slot1 = math
		slot1 = slot1.max
		slot2 = slot2
		slot2 = slot2 - 1
		slot3 = 0
		slot1 = slot1(slot2, slot3)
		slot2 = slot1
		slot1 = slot3
		slot2 = slot2

		slot1(slot2)

		return
		--- END OF BLOCK #1 ---



	end

	slot13 = nil
	slot14 = true
	slot15 = true
	slot16 = 0.1
	slot17 = SFX_PANEL

	slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)

	slot9 = pressPersistTrigger
	slot10 = slot0.fittingCalcMaxBtn
	slot11 = 0.5

	function slot12(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = slot0
		slot2 = slot1
		slot1 = slot1.inModAnim
		slot1 = slot1(slot2)

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-12, warpins: 1 ---
			slot1 = slot1
			slot2 = slot1
			slot1 = slot1.isMaxFateLevel
			slot1 = slot1(slot2)

			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-14, warpins: 2 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 15-16, warpins: 1 ---
					slot1 = slot0

					slot1()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 17-17, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-47, warpins: 2 ---
		slot1 = slot2
		slot1 = slot1 + 1
		slot2 = slot1
		slot3 = slot2
		slot2 = slot2.getItemExp
		slot2 = slot2(slot3)
		slot3 = slot1 * slot2
		slot4 = Clone
		slot5 = slot1
		slot4 = slot4(slot5)
		slot6 = slot4
		slot5 = slot4.addExp
		slot7 = slot3

		slot5(slot6, slot7)

		slot6 = slot4
		slot5 = slot4.getFateStrengthenConfig
		slot7 = math
		slot7 = slot7.min
		slot8 = slot4.fateLevel
		slot8 = slot8 + 1
		slot10 = slot4
		slot9 = slot4.getMaxFateLevel
		slot5 = slot5(slot6, slot7(slot8, slot9(slot10)))
		slot6 = slot3
		slot6 = slot6.level
		slot7 = slot5.need_lv

		if slot6 < slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 48-50, warpins: 1 ---
			slot6 = slot4.exp

			if slot2 <= slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-52, warpins: 1 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 53-54, warpins: 1 ---
					slot6 = slot0

					slot6()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 55-55, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 56-61, warpins: 3 ---
		slot6 = slot4.fateLevel
		slot8 = slot4
		slot7 = slot4.getMaxFateLevel
		slot7 = slot7(slot8)

		if slot6 == slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-64, warpins: 1 ---
			slot6 = slot4.exp

			if slot2 <= slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 65-66, warpins: 1 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 67-68, warpins: 1 ---
					slot6 = slot0

					slot6()
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 69-69, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 70-84, warpins: 3 ---
		slot6 = math
		slot6 = slot6.max
		slot7 = math
		slot7 = slot7.min
		slot8 = slot2
		slot8 = slot8 + 1
		slot9 = slot4
		slot7 = slot7(slot8, slot9)
		slot8 = 0
		slot6 = slot6(slot7, slot8)
		slot2 = slot6
		slot6 = slot5
		slot7 = slot2

		slot6(slot7)

		return
		--- END OF BLOCK #3 ---



	end

	slot13 = nil
	slot14 = true
	slot15 = true
	slot16 = 0.1
	slot17 = SFX_PANEL

	slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17)

	slot9 = 1
	slot11 = slot1
	slot10 = slot1.getMaxFateLevel
	slot10 = slot10(slot11)
	slot11 = 1

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 151-164, warpins: 0 ---
	for slot12 = slot9, slot10, slot11 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 151-164, warpins: 2 ---
		slot13 = onButton
		slot14 = slot0
		slot16 = slot0
		slot15 = slot0.findTF
		slot17 = "phase_"
		slot18 = slot12
		slot17 = slot17 .. slot18
		slot18 = slot0.fittingAttrPanel
		slot15 = slot15(slot16, slot17, slot18)

		function slot16()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.showFittingMsgPanel
			slot2 = slot1

			slot0(slot1, slot2)

			return
			--- END OF BLOCK #0 ---



		end

		slot17 = SFX_PANEL

		slot13(slot14, slot15, slot16, slot17)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 165-169, warpins: 1 ---
	slot9 = slot7
	slot10 = slot5

	slot9(slot10)

	return
	--- END OF BLOCK #3 ---



end

slot0.updateFittingPanel = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot3 = slot0
	slot2 = slot0.getShipById
	slot4 = slot1.shipId
	slot2 = slot2(slot3, slot4)
	slot3 = slot0.contextData
	slot3 = slot3.shipBluePrintVO
	slot5 = slot0
	slot4 = slot0.updateFittingAttrPanel
	slot6 = slot3
	slot7 = slot1

	slot4(slot5, slot6, slot7)

	slot4 = GetImageSpriteFromAtlasAsync
	slot5 = "ui/shipblueprintui_atlas"
	slot6 = "phase_"
	slot7 = math
	slot7 = slot7.max
	slot8 = slot1.fateLevel
	slot9 = 1
	slot7 = slot7(slot8, slot9)
	slot6 = slot6 .. slot7
	slot7 = slot0.phasePic
	slot8 = true

	slot4(slot5, slot6, slot7, slot8)

	slot5 = slot3
	slot4 = slot3.getNextFateLevelExp
	slot4 = slot4(slot5)

	if slot4 == -1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-32, warpins: 1 ---
		slot5 = slot0.phaseSlider
		slot6 = 1
		slot5.value = slot6
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-36, warpins: 1 ---
		slot5 = slot0.phaseSlider
		slot6 = slot3.exp
		slot6 = slot6 / slot4
		slot5.value = slot6
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 37-42, warpins: 2 ---
	slot6 = slot1
	slot5 = slot1.getNextFateLevelExp
	slot5 = slot5(slot6)
	slot4 = slot5

	if slot4 == -1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 43-50, warpins: 1 ---
		slot5 = setText
		slot6 = slot0.phaseSliderTxt
		slot7 = "MAX"

		slot5(slot6, slot7)

		slot5 = slot0.prePhaseSlider
		slot6 = 1
		slot5.value = slot6
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 51-72, warpins: 1 ---
		slot5 = math
		slot5 = slot5.floor
		slot6 = slot1.exp
		slot8 = slot1
		slot7 = slot1.getNextFateLevelExp
		slot7 = slot7(slot8)
		slot6 = slot6 / slot7
		slot6 = slot6 * 100
		slot5 = slot5(slot6)
		slot6 = setText
		slot7 = slot0.phaseSliderTxt
		slot8 = tostring
		slot9 = slot5
		slot8 = slot8(slot9)
		slot9 = "%"
		slot8 = slot8 .. slot9

		slot6(slot7, slot8)

		slot6 = slot0.prePhaseSlider
		slot7 = slot1.fateLevel
		slot8 = slot3.fateLevel

		if slot8 < slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 73-74, warpins: 1 ---
			slot7 = 1
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 75-76, warpins: 1 ---
			slot7 = slot1.exp
			slot7 = slot7 / slot4
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 77-77, warpins: 2 ---
		slot6.value = slot7
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 78-87, warpins: 2 ---
	slot6 = slot1
	slot5 = slot1.isShipModMaxFateLevel
	slot7 = slot2
	slot5, slot6 = slot5(slot6, slot7)
	slot7 = setActive
	slot8 = slot0.fittingNeedMask
	slot9 = slot5

	slot7(slot8, slot9)

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 88-101, warpins: 1 ---
		slot7 = setText
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "limit"
		slot11 = slot0.fittingNeedMask
		slot8 = slot8(slot9, slot10, slot11)
		slot9 = i18n
		slot10 = "buleprint_need_level_tip"
		slot11 = slot6

		slot7(slot8, slot9(slot10, slot11))

		slot7 = slot0.phaseSlider
		slot8 = 1
		slot7.value = slot8
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 102-102, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.updateFittingInfo = slot10

function slot10(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = setText
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "attr/name/Text"
	slot7 = slot0.fittingAttrPanel
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = " + "
	slot6 = defaultValue

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-11, warpins: 1 ---
		slot7 = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-24, warpins: 2 ---
	slot8 = slot7
	slot7 = slot7.attrSpecialAddition
	slot7 = slot7(slot8)
	slot8 = AttributeType
	slot8 = slot8.Luck
	slot7 = slot7[slot8]
	slot8 = 0
	slot6 = slot6(slot7, slot8)
	slot5 = slot5 .. slot6

	slot3(slot4, slot5)

	slot3 = slot0.blinkTarget

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-29, warpins: 1 ---
		slot3 = {}
		slot4 = {}
		slot3[1] = slot4
		slot4 = {}
		slot3[2] = slot4
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 30-36, warpins: 2 ---
	slot0.blinkTarget = slot3
	slot3 = 1
	slot5 = slot1
	slot4 = slot1.getMaxFateLevel
	slot4 = slot4(slot5)
	slot5 = 1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 37-145, warpins: 0 ---
	for slot6 = slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-55, warpins: 2 ---
		slot8 = slot0
		slot7 = slot0.findTF
		slot9 = "phase_"
		slot10 = slot6
		slot9 = slot9 .. slot10
		slot10 = slot0.fittingAttrPanel
		slot7 = slot7(slot8, slot9, slot10)
		slot9 = slot0
		slot8 = slot0.findTF
		slot10 = "off"
		slot11 = slot7
		slot8 = slot8(slot9, slot10, slot11)
		slot10 = slot0
		slot9 = slot0.findTF
		slot11 = "on"
		slot12 = slot7
		slot9 = slot9(slot10, slot11, slot12)

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 56-58, warpins: 1 ---
			slot10 = slot1.fateLevel

			if slot10 < slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 59-61, warpins: 1 ---
				slot10 = slot2.fateLevel

				if slot6 <= slot10 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 62-77, warpins: 1 ---
					slot10 = setActive
					slot11 = slot8
					slot12 = true

					slot10(slot11, slot12)

					slot10 = setActive
					slot11 = slot9
					slot12 = true

					slot10(slot11, slot12)

					slot10 = table
					slot10 = slot10.contains
					slot11 = slot0.blinkTarget
					slot11 = slot11[1]
					slot12 = slot8
					slot10 = slot10(slot11, slot12)

					if not slot10 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 78-90, warpins: 1 ---
						slot10 = table
						slot10 = slot10.insert
						slot11 = slot0.blinkTarget
						slot11 = slot11[1]
						slot12 = slot8

						slot10(slot11, slot12)

						slot10 = table
						slot10 = slot10.insert
						slot11 = slot0.blinkTarget
						slot11 = slot11[2]
						slot12 = slot9

						slot10(slot11, slot12)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 91-98, warpins: 3 ---
			slot10 = table
			slot10 = slot10.indexof
			slot11 = slot0.blinkTarget
			slot11 = slot11[1]
			slot12 = slot8
			slot10 = slot10(slot11, slot12)

			if slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 99-110, warpins: 1 ---
				slot11 = table
				slot11 = slot11.remove
				slot12 = slot0.blinkTarget
				slot12 = slot12[1]
				slot13 = slot10

				slot11(slot12, slot13)

				slot11 = table
				slot11 = slot11.remove
				slot12 = slot0.blinkTarget
				slot12 = slot12[2]
				slot13 = slot10

				slot11(slot12, slot13)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 111-115, warpins: 2 ---
			slot11 = setActive
			slot12 = slot8
			slot13 = slot1.fateLevel

			if slot13 >= slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 116-117, warpins: 1 ---
				slot13 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 118-118, warpins: 1 ---
				slot13 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 119-124, warpins: 2 ---
			slot11(slot12, slot13)

			slot11 = setActive
			slot12 = slot9
			slot13 = slot1.fateLevel

			if slot6 > slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 125-126, warpins: 1 ---
				slot13 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 127-127, warpins: 1 ---
				slot13 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 128-144, warpins: 2 ---
			slot11(slot12, slot13)

			slot12 = slot8
			slot11 = slot8.GetComponent
			slot13 = typeof
			slot14 = CanvasGroup
			slot11 = slot11(slot12, slot13(slot14))
			slot12 = 1
			slot11.alpha = slot12
			slot12 = slot9
			slot11 = slot9.GetComponent
			slot13 = typeof
			slot14 = CanvasGroup
			slot11 = slot11(slot12, slot13(slot14))
			slot12 = 1
			slot11.alpha = slot12
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 145-145, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 146-150, warpins: 1 ---
	slot3 = slot0.blinkTarget
	slot3 = slot3[1]
	slot3 = #slot3

	if slot3 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 151-157, warpins: 1 ---
		slot3 = LeanTween
		slot3 = slot3.cancel
		slot4 = go
		slot5 = slot0.fittingAttrPanel

		slot3(slot4(slot5))
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 158-165, warpins: 1 ---
		slot3 = LeanTween
		slot3 = slot3.isTweening
		slot4 = go
		slot5 = slot0.fittingAttrPanel
		slot3 = slot3(slot4(slot5))

		if not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 166-190, warpins: 1 ---
			slot3 = LeanTween
			slot3 = slot3.value
			slot4 = go
			slot5 = slot0.fittingAttrPanel
			slot4 = slot4(slot5)
			slot5 = 1
			slot6 = 0
			slot7 = 0.8
			slot3 = slot3(slot4, slot5, slot6, slot7)
			slot4 = slot3
			slot3 = slot3.setOnUpdate
			slot5 = System
			slot5 = slot5.Action_float

			function slot6(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-6, warpins: 1 ---
				slot1 = ipairs
				slot2 = slot0
				slot2 = slot2.blinkTarget
				slot2 = slot2[1]
				slot1, slot2, slot3 = slot1(slot2)

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 7-15, warpins: 0 ---
				for slot4, slot5 in slot1, slot2, slot3 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 7-13, warpins: 1 ---
					slot7 = slot5
					slot6 = slot5.GetComponent
					slot8 = typeof
					slot9 = CanvasGroup
					slot6 = slot6(slot7, slot8(slot9))
					slot6.alpha = slot0
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 14-15, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 16-21, warpins: 1 ---
				slot1 = ipairs
				slot2 = slot0
				slot2 = slot2.blinkTarget
				slot2 = slot2[2]
				slot1, slot2, slot3 = slot1(slot2)

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 22-31, warpins: 0 ---
				for slot4, slot5 in slot1, slot2, slot3 do

					-- Decompilation error in this vicinity:
					--- BLOCK #0 22-29, warpins: 1 ---
					slot7 = slot5
					slot6 = slot5.GetComponent
					slot8 = typeof
					slot9 = CanvasGroup
					slot6 = slot6(slot7, slot8(slot9))
					slot7 = 1 - slot0
					slot6.alpha = slot7
					--- END OF BLOCK #0 ---

					FLOW; TARGET BLOCK #1



					-- Decompilation error in this vicinity:
					--- BLOCK #1 30-31, warpins: 2 ---
					--- END OF BLOCK #1 ---



				end

				--- END OF BLOCK #3 ---

				FLOW; TARGET BLOCK #4



				-- Decompilation error in this vicinity:
				--- BLOCK #4 32-32, warpins: 1 ---
				return
				--- END OF BLOCK #4 ---



			end

			slot3 = slot3(slot4, slot5(slot6))
			slot4 = slot3
			slot3 = slot3.setEase
			slot5 = LeanTweenType
			slot5 = slot5.easeInOutSine
			slot3 = slot3(slot4, slot5)
			slot4 = slot3
			slot3 = slot3.setLoopPingPong
			slot5 = 0

			slot3(slot4, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 191-192, warpins: 3 ---
	return
	--- END OF BLOCK #5 ---



end

slot0.updateFittingAttrPanel = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.specialStrengthens
	slot2 = slot2(slot3)
	slot3 = slot0.modAdditionContainer
	slot3 = slot3.childCount
	slot4 = slot3 - 1
	slot5 = #slot2
	slot6 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-17, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-17, warpins: 2 ---
		slot9 = slot0
		slot8 = slot0.cloneTplTo
		slot10 = slot0.modAdditionTpl
		slot11 = slot0.modAdditionContainer

		slot8(slot9, slot10, slot11)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-23, warpins: 1 ---
	slot4 = slot0.modAdditionContainer
	slot3 = slot4.childCount
	slot4 = 1
	slot5 = slot3
	slot6 = 1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 24-47, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-26, warpins: 2 ---
		slot8 = #slot2

		if slot7 > slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 27-28, warpins: 1 ---
			slot8 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-29, warpins: 1 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 30-40, warpins: 2 ---
		slot9 = slot0.modAdditionContainer
		slot10 = slot9
		slot9 = slot9.GetChild
		slot11 = slot7 - 1
		slot9 = slot9(slot10, slot11)
		slot10 = setActive
		slot11 = slot9
		slot12 = slot8

		slot10(slot11, slot12)

		if slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-46, warpins: 1 ---
			slot11 = slot0
			slot10 = slot0.updateAdvanceTF
			slot12 = slot1
			slot13 = slot9
			slot14 = slot2[slot7]

			slot10(slot11, slot12, slot13, slot14)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 47-47, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 48-48, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.updateModAdditionPanel = slot10

function slot10(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot4 = slot1.level
	slot5 = slot3.level

	if slot4 >= slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-6, warpins: 1 ---
		slot4 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-7, warpins: 1 ---
		slot4 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-16, warpins: 2 ---
	slot5 = setActive
	slot7 = slot2
	slot6 = slot2.Find
	slot8 = "mask"
	slot6 = slot6(slot7, slot8)
	slot7 = slot4

	slot5(slot6, slot7)

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-26, warpins: 1 ---
		slot5 = setText
		slot7 = slot2
		slot6 = slot2.Find
		slot8 = "mask/content/Text"
		slot6 = slot6(slot7, slot8)
		slot7 = i18n
		slot8 = "blueprint_mod_addition_lock"
		slot9 = slot3.level

		slot5(slot6, slot7(slot8, slot9))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 27-30, warpins: 2 ---
	slot5 = slot3.des
	slot6 = slot3.extraDes

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 31-31, warpins: 1 ---
		slot6 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 32-48, warpins: 2 ---
	slot8 = slot2
	slot7 = slot2.Find
	slot9 = "additions"
	slot7 = slot7(slot8, slot9)
	slot8 = removeAllChildren
	slot9 = slot7

	slot8(slot9)

	slot9 = slot0
	slot8 = slot0.findTF
	slot10 = "scroll_rect/info"
	slot11 = slot0.modAdditionPanel
	slot8 = slot8(slot9, slot10, slot11)

	function slot9(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-43, warpins: 1 ---
		slot2 = slot1[2]
		slot3 = pg
		slot3 = slot3.ship_data_breakout
		slot3 = slot3[slot2]
		slot3 = slot3.pre_id
		slot4 = Ship
		slot4 = slot4.New
		slot5 = {}
		slot5.configId = slot2
		slot4 = slot4(slot5)
		slot5 = Ship
		slot5 = slot5.New
		slot6 = {}
		slot6.configId = slot3
		slot5 = slot5(slot6)
		slot7 = slot5
		slot6 = slot5.getStar
		slot6 = slot6(slot7)
		slot8 = slot4
		slot7 = slot4.getStar
		slot7 = slot7(slot8)
		slot9 = slot0
		slot8 = slot0.Find
		slot10 = "star_tpl"
		slot8 = slot8(slot9, slot10)
		slot10 = slot0
		slot9 = slot0.Find
		slot11 = "stars"
		slot9 = slot9(slot10, slot11)
		slot11 = slot0
		slot10 = slot0.Find
		slot12 = "pre_stars"
		slot10 = slot10(slot11, slot12)
		slot11 = removeAllChildren
		slot12 = slot9

		slot11(slot12)

		slot11 = removeAllChildren
		slot12 = slot10

		slot11(slot12)

		slot11 = 1
		slot12 = slot6
		slot13 = 1

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 44-48, warpins: 0 ---
		for slot14 = slot11, slot12, slot13 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-48, warpins: 2 ---
			slot15 = cloneTplTo
			slot16 = slot8
			slot17 = slot9

			slot15(slot16, slot17)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 49-52, warpins: 1 ---
		slot11 = 1
		slot12 = slot7
		slot13 = 1

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 53-57, warpins: 0 ---
		for slot14 = slot11, slot12, slot13 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 53-57, warpins: 2 ---
			slot15 = cloneTplTo
			slot16 = slot8
			slot17 = slot10

			slot15(slot16, slot17)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 58-58, warpins: 1 ---
		return
		--- END OF BLOCK #4 ---



	end

	slot10 = 1
	slot11 = #slot5
	slot12 = 1

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 49-118, warpins: 0 ---
	for slot13 = slot10, slot11, slot12 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 49-85, warpins: 2 ---
		slot14 = cloneTplTo
		slot15 = slot8
		slot16 = slot7
		slot14 = slot14(slot15, slot16)
		slot16 = slot14
		slot15 = slot14.Find
		slot17 = "text_tpl"
		slot15 = slot15(slot16, slot17)
		slot17 = slot14
		slot16 = slot14.Find
		slot18 = "breakout_tpl"
		slot16 = slot16(slot17, slot18)
		slot17 = setActive
		slot18 = slot15
		slot19 = false

		slot17(slot18, slot19)

		slot17 = setActive
		slot19 = slot14
		slot18 = slot14.Find
		slot20 = "attr_tpl"
		slot18 = slot18(slot19, slot20)
		slot19 = false

		slot17(slot18, slot19)

		slot17 = setActive
		slot18 = slot16
		slot19 = false

		slot17(slot18, slot19)

		slot17 = setActive
		slot19 = slot14
		slot18 = slot14.Find
		slot20 = "empty_tpl"
		slot18 = slot18(slot19, slot20)
		slot19 = false

		slot17(slot18, slot19)

		slot17 = slot5[slot13]

		if slot17 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 86-91, warpins: 1 ---
			slot17 = slot5[slot13]
			slot17 = slot17[1]
			slot18 = ShipBluePrint
			slot18 = slot18.STRENGTHEN_TYPE_BREAKOUT

			if slot17 == slot18 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 92-100, warpins: 1 ---
				slot18 = setActive
				slot19 = slot16
				slot20 = true

				slot18(slot19, slot20)

				slot18 = slot9
				slot19 = slot16
				slot20 = slot5[slot13]

				slot18(slot19, slot20)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 101-113, warpins: 1 ---
				slot18 = setActive
				slot19 = slot15
				slot20 = true

				slot18(slot19, slot20)

				slot18 = setText
				slot20 = slot15
				slot19 = slot15.Find
				slot21 = "Text"
				slot19 = slot19(slot20, slot21)
				slot20 = slot5[slot13]
				slot20 = slot20[3]

				slot18(slot19, slot20)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 114-117, warpins: 1 ---
			slot17 = setActive
			slot18 = empty_tpl
			slot19 = true

			slot17(slot18, slot19)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 118-118, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 119-122, warpins: 1 ---
	slot10 = 1
	slot11 = #slot6
	slot12 = 1

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 123-163, warpins: 0 ---
	for slot13 = slot10, slot11, slot12 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 123-163, warpins: 2 ---
		slot14 = cloneTplTo
		slot15 = slot8
		slot16 = slot7
		slot14 = slot14(slot15, slot16)
		slot16 = slot14
		slot15 = slot14.Find
		slot17 = "text_tpl"
		slot15 = slot15(slot16, slot17)
		slot16 = setActive
		slot17 = slot15
		slot18 = true

		slot16(slot17, slot18)

		slot16 = setActive
		slot18 = slot14
		slot17 = slot14.Find
		slot19 = "attr_tpl"
		slot17 = slot17(slot18, slot19)
		slot18 = false

		slot16(slot17, slot18)

		slot16 = setActive
		slot18 = slot14
		slot17 = slot14.Find
		slot19 = "breakout_tpl"
		slot17 = slot17(slot18, slot19)
		slot18 = false

		slot16(slot17, slot18)

		slot16 = setActive
		slot18 = slot14
		slot17 = slot14.Find
		slot19 = "empty_tpl"
		slot17 = slot17(slot18, slot19)
		slot18 = false

		slot16(slot17, slot18)

		slot16 = setText
		slot18 = slot15
		slot17 = slot15.Find
		slot19 = "Text"
		slot17 = slot17(slot18, slot19)
		slot18 = slot6[slot13]

		slot16(slot17, slot18)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 164-164, warpins: 1 ---
	return
	--- END OF BLOCK #7 ---



end

slot0.updateAdvanceTF = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot2 = nil
	slot4 = slot1
	slot3 = slot1.isFetched
	slot3 = slot3(slot4)

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-11, warpins: 1 ---
		slot3 = slot0.shipVOs
		slot4 = slot1.shipId
		slot2 = slot3[slot4]
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-13, warpins: 2 ---
	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-17, warpins: 1 ---
		slot4 = slot1
		slot3 = slot1.getShipVO
		slot3 = slot3(slot4)
		slot2 = slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-44, warpins: 2 ---
	slot4 = slot2
	slot3 = slot2.getConfigTable
	slot3 = slot3(slot4)
	slot5 = slot2
	slot4 = slot2.getName
	slot4 = slot4(slot5)
	slot5 = setText
	slot6 = slot0.shipName
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = setText
	slot6 = slot0.englishName
	slot7 = slot3.english_name

	slot5(slot6, slot7)

	slot5 = removeAllChildren
	slot6 = slot0.stars

	slot5(slot6)

	slot6 = slot2
	slot5 = slot2.getStar
	slot5 = slot5(slot6)
	slot7 = slot2
	slot6 = slot2.getMaxStar
	slot6 = slot6(slot7)
	slot7 = 1
	slot8 = slot6
	slot9 = 1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 45-52, warpins: 0 ---
	for slot10 = slot7, slot8, slot9 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-52, warpins: 2 ---
		slot11 = cloneTplTo
		slot12 = slot0.shipInfoStarTpl
		slot13 = slot0.stars
		slot14 = "star_"
		slot15 = slot10
		slot14 = slot14 .. slot15

		slot11(slot12, slot13, slot14)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 53-57, warpins: 1 ---
	slot7 = slot6 - slot5
	slot8 = 1
	slot9 = slot7
	slot10 = 1

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 58-77, warpins: 0 ---
	for slot11 = slot8, slot9, slot10 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 58-77, warpins: 2 ---
		slot12 = slot0.stars
		slot13 = slot12
		slot12 = slot12.GetChild
		slot14 = slot6 - slot11
		slot12 = slot12(slot13, slot14)
		slot13 = setActive
		slot15 = slot12
		slot14 = slot12.Find
		slot16 = "star_tpl"
		slot14 = slot14(slot15, slot16)
		slot15 = false

		slot13(slot14, slot15)

		slot13 = setActive
		slot15 = slot12
		slot14 = slot12.Find
		slot16 = "empty_star_tpl"
		slot14 = slot14(slot15, slot16)
		slot15 = true

		slot13(slot14, slot15)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 78-85, warpins: 1 ---
	slot8 = GetSpriteFromAtlas
	slot9 = "shiptype"
	slot11 = slot2
	slot10 = slot2.getShipType
	slot8 = slot8(slot9, slot10(slot11))

	if not slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-90, warpins: 1 ---
		slot9 = warning
		slot10 = "找不到船形, shipConfigId: "
		slot11 = slot2.configId
		slot10 = slot10 .. slot11

		slot9(slot10)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 91-113, warpins: 2 ---
	slot9 = setImageSprite
	slot10 = slot0.shipType
	slot11 = slot8
	slot12 = true

	slot9(slot10, slot11, slot12)

	slot10 = slot1
	slot9 = slot1.isLock
	slot9 = slot9(slot10)
	slot10 = setActive
	slot11 = slot0.finishedBtn
	slot13 = slot1
	slot12 = slot1.isFinished

	slot10(slot11, slot12(slot13))

	slot11 = slot1
	slot10 = slot1.isDeving
	slot10 = slot10(slot11)
	slot11 = setActive
	slot12 = slot0.progressPanel
	slot13 = slot10

	slot11(slot12, slot13)

	if slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 114-116, warpins: 1 ---
		slot12 = slot0
		slot11 = slot0.updateTasksProgress

		slot11(slot12)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 117-122, warpins: 2 ---
	slot12 = slot1
	slot11 = slot1.isFinishPrevTask
	slot13 = true
	slot11 = slot11(slot12, slot13)

	if slot9 and not slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 125-129, warpins: 1 ---
		slot13 = slot1
		slot12 = slot1.isFinishPrevTask
		slot12 = slot12(slot13)

		if slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 130-135, warpins: 1 ---
			slot12 = ipairs
			slot14 = slot1
			slot13 = slot1.getOpenTaskList
			slot12, slot13, slot14 = slot12(slot13(slot14))

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 136-143, warpins: 0 ---
			for slot15, slot16 in slot12, slot13, slot14 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 136-141, warpins: 1 ---
				slot18 = slot0
				slot17 = slot0.emit
				slot19 = ShipBluePrintMediator
				slot19 = slot19.ON_FINISH_TASK
				slot20 = slot16

				slot17(slot18, slot19, slot20)
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 142-143, warpins: 2 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 144-145, warpins: 1 ---
			slot11 = true
			--- END OF BLOCK #2 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 146-155, warpins: 1 ---
			slot12 = getProxy
			slot13 = TaskProxy
			slot12 = slot12(slot13)
			slot14 = slot1
			slot13 = slot1.getOpenTaskList
			slot13 = slot13(slot14)
			slot14 = ipairs
			slot15 = slot13
			slot14, slot15, slot16 = slot14(slot15)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 156-206, warpins: 0 ---
			for slot17, slot18 in slot14, slot15, slot16 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 156-163, warpins: 1 ---
				slot20 = slot12
				slot19 = slot12.getTaskVO
				slot21 = slot18
				slot19 = slot19(slot20, slot21)
				slot20 = slot0.lockPanel
				slot20 = slot20.childCount

				if slot20 < slot17 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 164-169, warpins: 1 ---
					slot20 = cloneTplTo
					slot21 = slot0.lockBtn
					slot22 = slot0.lockPanel
					slot20 = slot20(slot21, slot22)

					if not slot20 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 170-174, warpins: 2 ---
						slot20 = slot0.lockPanel
						slot21 = slot20
						slot20 = slot20.GetChild
						slot22 = slot17 - 1
						slot20 = slot20(slot21, slot22)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 175-193, warpins: 2 ---
				slot21 = setActive
				slot22 = slot20
				slot23 = true

				slot21(slot22, slot23)

				slot22 = slot19
				slot21 = slot19.getProgress
				slot21 = slot21(slot22)
				slot23 = slot19
				slot22 = slot19.getConfig
				slot24 = "target_num"
				slot22 = slot22(slot23, slot24)
				slot23 = setText
				slot25 = slot0
				slot24 = slot0.findTF
				slot26 = "Text"
				slot27 = slot20
				slot24 = slot24(slot25, slot26, slot27)

				if slot22 <= slot21 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 194-199, warpins: 1 ---
					slot25 = setColorStr
					slot26 = slot21
					slot27 = COLOR_GREEN
					slot25 = slot25(slot26, slot27)

					if not slot25 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 200-200, warpins: 2 ---
						slot25 = slot21
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 201-204, warpins: 2 ---
				slot26 = "/"
				slot27 = slot22
				slot25 = slot25 .. slot26 .. slot27

				slot23(slot24, slot25)
				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 205-206, warpins: 2 ---
				--- END OF BLOCK #3 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 207-212, warpins: 1 ---
			slot14 = #slot13
			slot14 = slot14 + 1
			slot15 = slot0.lockPanel
			slot15 = slot15.childCount
			slot16 = 1

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 213-221, warpins: 0 ---
			for slot17 = slot14, slot15, slot16 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 213-221, warpins: 2 ---
				slot18 = setActive
				slot19 = slot0.lockPanel
				slot20 = slot19
				slot19 = slot19.GetChild
				slot21 = slot17 - 1
				slot19 = slot19(slot20, slot21)
				slot20 = false

				slot18(slot19, slot20)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #8 ---

	FLOW; TARGET BLOCK #9



	-- Decompilation error in this vicinity:
	--- BLOCK #9 222-240, warpins: 4 ---
	slot12 = setText
	slot14 = slot0
	slot13 = slot0.findTF
	slot15 = "Text"
	slot16 = slot0.openCondition
	slot13 = slot13(slot14, slot15, slot16)
	slot15 = slot1
	slot14 = slot1.getConfig
	slot16 = "unlock_word"

	slot12(slot13, slot14(slot15, slot16))

	slot12 = setActive
	slot13 = slot0.openCondition
	slot14 = slot9

	slot12(slot13, slot14)

	slot12 = setActive
	slot13 = slot0.startBtn

	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 241-241, warpins: 1 ---
		slot14 = slot11
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #9 ---

	FLOW; TARGET BLOCK #10



	-- Decompilation error in this vicinity:
	--- BLOCK #10 242-246, warpins: 2 ---
	slot12(slot13, slot14)

	slot12 = setActive
	slot13 = slot0.lockPanel

	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 247-247, warpins: 1 ---
		slot14 = not slot11
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #10 ---

	FLOW; TARGET BLOCK #11



	-- Decompilation error in this vicinity:
	--- BLOCK #11 248-249, warpins: 2 ---
	slot12(slot13, slot14)

	return
	--- END OF BLOCK #11 ---



end

slot0.updateInfo = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.getTaskIds
	slot2 = slot2(slot3)
	slot3 = slot0.progressContainer
	slot3 = slot3.childCount
	slot4 = slot3
	slot5 = #slot2
	slot6 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-16, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 2 ---
		slot8 = cloneTplTo
		slot9 = slot0.progressTpl
		slot10 = slot0.progressContainer

		slot8(slot9, slot10)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-22, warpins: 1 ---
	slot4 = slot0.progressContainer
	slot3 = slot4.childCount
	slot4 = 1
	slot5 = slot3
	slot6 = 1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 23-95, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-30, warpins: 2 ---
		slot8 = slot0.progressContainer
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot7 - 1
		slot8 = slot8(slot9, slot10)
		slot9 = #slot2

		if slot7 > slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 31-32, warpins: 1 ---
			slot9 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-33, warpins: 1 ---
			slot9 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 34-39, warpins: 2 ---
		slot10 = setActive
		slot11 = slot8
		slot12 = slot9

		slot10(slot11, slot12)

		if slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 40-52, warpins: 1 ---
			slot11 = slot1
			slot10 = slot1.getTaskStateById
			slot12 = slot2[slot7]
			slot10 = slot10(slot11, slot12)
			slot11 = setActive
			slot12 = findTF
			slot13 = slot8
			slot14 = "complete"
			slot12 = slot12(slot13, slot14)
			slot13 = ShipBluePrint
			slot13 = slot13.TASK_STATE_FINISHED

			if slot10 ~= slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-54, warpins: 1 ---
				slot13 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 55-55, warpins: 1 ---
				slot13 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 56-65, warpins: 2 ---
			slot11(slot12, slot13)

			slot11 = setActive
			slot12 = findTF
			slot13 = slot8
			slot14 = "lock"
			slot12 = slot12(slot13, slot14)
			slot13 = ShipBluePrint
			slot13 = slot13.TASK_STATE_LOCK

			if slot10 ~= slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 66-69, warpins: 1 ---
				slot13 = ShipBluePrint
				slot13 = slot13.TASK_STATE_WAIT

				if slot10 ~= slot13 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 70-71, warpins: 1 ---
					slot13 = false
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 72-72, warpins: 2 ---
				slot13 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 73-82, warpins: 2 ---
			slot11(slot12, slot13)

			slot11 = setActive
			slot12 = findTF
			slot13 = slot8
			slot14 = "working"
			slot12 = slot12(slot13, slot14)
			slot13 = ShipBluePrint
			slot13 = slot13.TASK_STATE_ACHIEVED

			if slot10 ~= slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 83-86, warpins: 1 ---
				slot13 = ShipBluePrint
				slot13 = slot13.TASK_STATE_OPENING

				if slot10 ~= slot13 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 87-90, warpins: 1 ---
					slot13 = ShipBluePrint
					slot13 = slot13.TASK_STATE_START

					if slot10 ~= slot13 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 91-92, warpins: 1 ---
						slot13 = false
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 93-93, warpins: 3 ---
				slot13 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 94-94, warpins: 2 ---
			slot11(slot12, slot13)
			--- END OF BLOCK #3 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 95-95, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 96-96, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.updateTasksProgress = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-8, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.getShipVO
	slot2 = slot2(slot3)
	slot3 = slot0.lastPaintingName

	if slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-14, warpins: 1 ---
		slot3 = slot0.lastPaintingName
		slot5 = slot2
		slot4 = slot2.getPainting
		slot4 = slot4(slot5)

		if slot3 ~= slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-18, warpins: 1 ---
			slot3 = retPaintingPrefab
			slot4 = slot0.painting
			slot5 = slot0.lastPaintingName

			slot3(slot4, slot5)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-31, warpins: 3 ---
	slot4 = slot2
	slot3 = slot2.getPainting
	slot3 = slot3(slot4)
	slot4 = setPaintingPrefab
	slot5 = slot0.painting
	slot6 = slot3
	slot7 = "tuzhi"

	slot4(slot5, slot6, slot7)

	slot0.lastPaintingName = slot3
	slot5 = slot0
	slot4 = slot0.paintBreath

	slot4(slot5)

	return
	--- END OF BLOCK #1 ---



end

slot0.updatePainting = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.getShipVO
	slot2 = slot2(slot3)
	slot3 = slot0.propertyPanel
	slot4 = slot3
	slot3 = slot3.initProperty
	slot5 = slot2.configId
	slot6 = PropertyPanel
	slot6 = slot6.TypeFlat

	slot3(slot4, slot5, slot6)

	slot3 = slot0
	slot4 = slot2.configId
	slot3 = slot3[slot4]
	slot4 = slot3.buff_list_display
	slot5 = slot0.skillPanel
	slot5 = slot5.childCount
	slot6 = slot5
	slot7 = #slot4
	slot7 = slot7 - 1
	slot8 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-28, warpins: 0 ---
	for slot9 = slot6, slot7, slot8 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 24-28, warpins: 2 ---
		slot10 = cloneTplTo
		slot11 = slot0.skillTpl
		slot12 = slot0.skillPanel

		slot10(slot11, slot12)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-34, warpins: 1 ---
	slot6 = slot0.skillPanel
	slot5 = slot6.childCount
	slot6 = 1
	slot7 = slot5
	slot8 = 1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 35-73, warpins: 0 ---
	for slot9 = slot6, slot7, slot8 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 35-42, warpins: 2 ---
		slot10 = slot0.skillPanel
		slot11 = slot10
		slot10 = slot10.GetChild
		slot12 = slot9 - 1
		slot10 = slot10(slot11, slot12)
		slot11 = #slot4

		if slot9 > slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-44, warpins: 1 ---
			slot11 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 45-45, warpins: 1 ---
			slot11 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 46-51, warpins: 2 ---
		slot12 = findTF
		slot13 = slot10
		slot14 = "icon"
		slot12 = slot12(slot13, slot14)

		if slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 52-68, warpins: 1 ---
			slot13 = slot4[slot9]
			slot14 = getSkillConfig
			slot15 = slot13
			slot14 = slot14(slot15)
			slot15 = LoadImageSpriteAsync
			slot16 = "skillicon/"
			slot17 = slot14.icon
			slot16 = slot16 .. slot17
			slot17 = slot12

			slot15(slot16, slot17)

			slot15 = onButton
			slot16 = slot0
			slot17 = slot10

			function slot18()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-21, warpins: 1 ---
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ShipBluePrintMediator
				slot2 = slot2.SHOW_SKILL_INFO
				slot3 = slot1
				slot3 = slot3.id
				slot4 = {}
				slot5 = slot1
				slot5 = slot5.id
				slot4.id = slot5
				slot5 = pg
				slot5 = slot5.skill_data_template
				slot6 = slot1
				slot6 = slot6.id
				slot5 = slot5[slot6]
				slot5 = slot5.max_level
				slot4.level = slot5

				function slot5()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-1, warpins: 1 ---
					return
					--- END OF BLOCK #0 ---



				end

				slot0(slot1, slot2, slot3, slot4, slot5)

				return
				--- END OF BLOCK #0 ---



			end

			slot19 = SFX_PANEL

			slot15(slot16, slot17, slot18, slot19)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 69-73, warpins: 2 ---
		slot13 = setActive
		slot14 = slot10
		slot15 = slot11

		slot13(slot14, slot15)
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 74-79, warpins: 1 ---
	slot6 = setActive
	slot7 = slot0.skillArrLeft
	slot8 = #slot4
	slot9 = 3

	if slot8 <= slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 80-81, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 82-82, warpins: 1 ---
		slot8 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 83-89, warpins: 2 ---
	slot6(slot7, slot8)

	slot6 = setActive
	slot7 = slot0.skillArrRight
	slot8 = #slot4
	slot9 = 3

	if slot8 <= slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-91, warpins: 1 ---
		slot8 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 92-92, warpins: 1 ---
		slot8 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 93-97, warpins: 2 ---
	slot6(slot7, slot8)

	slot6 = #slot4
	slot7 = 3

	if slot6 > slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 98-103, warpins: 1 ---
		slot6 = onScroll
		slot7 = slot0
		slot8 = slot0.skillRect

		function slot9(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-7, warpins: 1 ---
			slot1 = setActive
			slot2 = slot0
			slot2 = slot2.skillArrLeft
			slot3 = slot0.x
			slot4 = 0.01

			if slot3 <= slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 8-9, warpins: 1 ---
				slot3 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 10-10, warpins: 1 ---
				slot3 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-18, warpins: 2 ---
			slot1(slot2, slot3)

			slot1 = setActive
			slot2 = slot0
			slot2 = slot2.skillArrRight
			slot3 = slot0.x
			slot4 = 0.99

			if slot3 >= slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 19-20, warpins: 1 ---
				slot3 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-21, warpins: 1 ---
				slot3 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 22-23, warpins: 2 ---
			slot1(slot2, slot3)

			return
			--- END OF BLOCK #2 ---



		end

		slot6(slot7, slot8, slot9)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 104-113, warpins: 1 ---
		slot6 = GetComponent
		slot7 = slot0.skillRect
		slot8 = typeof
		slot9 = ScrollRect
		slot6 = slot6(slot7, slot8(slot9))
		slot6 = slot6.onValueChanged
		slot8 = slot6
		slot7 = slot6.RemoveAllListeners

		slot7(slot8)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 114-125, warpins: 2 ---
	slot6 = setAnchoredPosition
	slot7 = slot0.skillPanel
	slot8 = {
		x = 0
	}

	slot6(slot7, slot8)

	slot7 = slot1
	slot6 = slot1.getConfig
	slot8 = "simulate_dungeon"
	slot6 = slot6(slot7, slot8)
	slot7 = setActive
	slot8 = slot0.simulationBtn

	if slot6 == 0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 126-127, warpins: 1 ---
		slot9 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 128-128, warpins: 1 ---
		slot9 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 129-137, warpins: 2 ---
	slot7(slot8, slot9)

	slot7 = onButton
	slot8 = slot0
	slot9 = slot0.simulationBtn

	function slot10()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot0 = slot0

		if slot0 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-15, warpins: 1 ---
			slot0 = pg
			slot0 = slot0.TipsMgr
			slot1 = slot0
			slot0 = slot0.GetInstance
			slot0 = slot0(slot1)
			slot1 = slot0
			slot0 = slot0.ShowTips
			slot2 = i18n
			slot3 = "tech_simulate_closed"

			slot0(slot1, slot2(slot3))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-33, warpins: 1 ---
			slot0 = i18n
			slot1 = "blueprint_simulation_confirm_"
			slot2 = slot1
			slot2 = slot2.id
			slot1 = slot1 .. slot2
			slot0 = slot0(slot1)
			slot1 = pg
			slot1 = slot1.MsgboxMgr
			slot2 = slot1
			slot1 = slot1.GetInstance
			slot1 = slot1(slot2)
			slot2 = slot1
			slot1 = slot1.ShowMsgBox
			slot3 = {}
			slot3.content = slot0

			function slot4()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-8, warpins: 1 ---
				slot0 = slot0
				slot1 = slot0
				slot0 = slot0.emit
				slot2 = ShipBluePrintMediator
				slot2 = slot2.SIMULATION_BATTLE
				slot3 = slot1

				slot0(slot1, slot2, slot3)

				return
				--- END OF BLOCK #0 ---



			end

			slot3.onYes = slot4

			slot1(slot2, slot3)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 34-34, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot11 = SFX_CONFIRM

	slot7(slot8, slot9, slot10, slot11)

	return
	--- END OF BLOCK #8 ---



end

slot0.updateProperty = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO
	slot3 = slot1
	slot2 = slot1.getTaskIds
	slot2 = slot2(slot3)
	slot3 = slot0.taskContainer
	slot3 = slot3.childCount
	slot4 = slot3
	slot5 = #slot2
	slot6 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 12-16, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 2 ---
		slot8 = cloneTplTo
		slot9 = slot0.taskTpl
		slot10 = slot0.taskContainer

		slot8(slot9, slot10)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-22, warpins: 1 ---
	slot4 = slot0.taskContainer
	slot3 = slot4.childCount
	slot4 = 1
	slot5 = slot3
	slot6 = 1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 23-92, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 23-32, warpins: 2 ---
		slot8 = slot0.taskContainer
		slot9 = slot8
		slot8 = slot8.GetChild
		slot10 = slot7 - 1
		slot8 = slot8(slot9, slot10)
		slot9 = setActive
		slot10 = slot8
		slot11 = #slot2

		if slot7 > slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 33-34, warpins: 1 ---
			slot11 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-35, warpins: 1 ---
			slot11 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-40, warpins: 2 ---
		slot9(slot10, slot11)

		slot9 = slot0.taskTFs
		slot9 = slot9[slot7]

		if slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-45, warpins: 1 ---
			slot9 = slot0.taskTFs
			slot9 = slot9[slot7]
			slot10 = slot9
			slot9 = slot9.clear

			slot9(slot10)
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 46-48, warpins: 2 ---
		slot9 = #slot2

		if slot7 <= slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-52, warpins: 1 ---
			slot9 = slot0.taskTFs
			slot9 = slot9[slot7]

			if not slot9 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 53-58, warpins: 1 ---
				slot9 = slot0.taskTFs
				slot11 = slot0
				slot10 = slot0.createTask
				slot12 = slot8
				slot10 = slot10(slot11, slot12)
				slot9[slot7] = slot10
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 59-67, warpins: 2 ---
			slot9 = slot2[slot7]
			slot11 = slot0
			slot10 = slot0.getTaskById
			slot12 = slot9
			slot10 = slot10(slot11, slot12)
			slot11 = slot1.duration
			slot12 = 0

			if slot11 > slot12 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 68-74, warpins: 1 ---
				slot12 = slot1
				slot11 = slot1.getTaskOpenTimeStamp
				slot13 = slot9
				slot11 = slot11(slot12, slot13)
				slot12 = slot1.duration
				slot12 = slot11 - slot12
				slot10.leftTime = slot12
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 75-91, warpins: 2 ---
			slot12 = slot1
			slot11 = slot1.getTaskStateById
			slot13 = slot9
			slot11 = slot11(slot12, slot13)
			slot10.taskState = slot11
			slot12 = slot1
			slot11 = slot1.getTaskOpenTimeStamp
			slot13 = slot9
			slot11 = slot11(slot12, slot13)
			slot10.dueTime = slot11
			slot10.index = slot7
			slot11 = slot0.taskTFs
			slot11 = slot11[slot7]
			slot12 = slot11
			slot11 = slot11.update
			slot13 = slot10

			slot11(slot12, slot13)
			--- END OF BLOCK #2 ---



		end
		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 92-92, warpins: 2 ---
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 93-93, warpins: 1 ---
	return
	--- END OF BLOCK #4 ---



end

slot0.updateTaskList = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-165, warpins: 1 ---
	slot2 = {}
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/name"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.title = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/Text"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.desc = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/timer"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.timerTF = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/timer/Text"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.timerTFTxt = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/timer/open"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.timerOpen = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/timer/close"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.timerClose = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/slider/complete"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.maskAchieved = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/tip"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.tip = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/commit_panel/commit_btn"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.commitBtn = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/item_info"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.itemInfo = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "items"
	slot6 = slot2.itemInfo
	slot3 = slot3(slot4, slot5, slot6)
	slot2.itemContainer = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "item_tpl"
	slot6 = slot2.itemContainer
	slot3 = slot3(slot4, slot5, slot6)
	slot2.itemTpl = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/number"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.numberTF = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/slider"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.progressTF = slot3
	slot3 = slot2.progressTF
	slot4 = slot3
	slot3 = slot3.GetComponent
	slot5 = typeof
	slot6 = Slider
	slot3 = slot3(slot4, slot5(slot6))
	slot2.progessSlider = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/commit_panel/lock_btn"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.lockBtn = slot3
	slot3 = slot2.itemTpl
	slot4 = slot3
	slot3 = slot3.Find
	slot5 = "award/icon_bg/count"
	slot3 = slot3(slot4, slot5)
	slot2.itemCount = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "desc/commit_panel/progress"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.progres = slot3
	slot4 = slot0
	slot3 = slot0.findTF
	slot5 = "title/shadow"
	slot6 = slot1
	slot3 = slot3(slot4, slot5, slot6)
	slot2.progreshadow = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/complete"
	slot3 = slot3(slot4, slot5)
	slot2.check = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/lock"
	slot3 = slot3(slot4, slot5)
	slot2.lock = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/working"
	slot3 = slot3(slot4, slot5)
	slot2.working = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/pause"
	slot3 = slot3(slot4, slot5)
	slot2.pause = slot3
	slot3 = findTF
	slot4 = slot1
	slot5 = "title/pause_lock"
	slot3 = slot3(slot4, slot5)
	slot2.pauseLock = slot3
	slot2.view = slot0
	slot3 = onToggle
	slot4 = slot0
	slot5 = slot1

	function slot6(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-12, warpins: 1 ---
		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.desc
		slot3 = slot0

		slot1(slot2, slot3)

		slot1 = setActive
		slot2 = slot0
		slot2 = slot2.progreshadow
		slot3 = slot0

		slot1(slot2, slot3)

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 13-38, warpins: 1 ---
			slot1 = Canvas
			slot1 = slot1.ForceUpdateCanvases

			slot1()

			slot1 = slot1
			slot1 = slot1.taskContainer
			slot1 = slot1.parent
			slot1 = slot1.transform
			slot2 = slot1
			slot1 = slot1.InverseTransformPoint
			slot3 = slot2
			slot3 = slot3.position
			slot1 = slot1(slot2, slot3)
			slot1 = slot1.y
			slot2 = slot2
			slot2 = slot2.rect
			slot2 = slot2.height
			slot2 = slot1 - slot2
			slot3 = slot1
			slot3 = slot3.taskContainer
			slot3 = slot3.parent
			slot3 = slot3.transform
			slot3 = slot3.rect
			slot4 = 0
			slot5 = slot3.yMin

			if slot2 < slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 39-40, warpins: 1 ---
				slot5 = slot3.yMin
				slot4 = slot5 - slot2
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 41-43, warpins: 2 ---
			slot5 = slot3.yMax

			if slot5 < slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 44-45, warpins: 1 ---
				slot5 = slot3.yMax
				slot4 = slot5 - slot1
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 46-67, warpins: 2 ---
			slot5 = slot1
			slot5 = slot5.taskContainer
			slot5 = slot5.localPosition
			slot6 = slot5.y
			slot6 = slot6 + slot4
			slot5.y = slot6
			slot6 = slot1
			slot6 = slot6.taskContainer
			slot6.localPosition = slot5
			slot6 = slot0
			slot6 = slot6.progreshadow
			slot7 = Vector3
			slot8 = 39
			slot9 = slot0
			slot9 = slot9.desc
			slot9 = slot9.rect
			slot9 = slot9.height
			slot9 = 148 + slot9
			slot9 = slot9 - 150
			slot9 = -slot9
			slot7 = slot7(slot8, slot9)
			slot6.localPosition = slot7
			--- END OF BLOCK #2 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 68-68, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot7 = SFX_PANEL

	slot3(slot4, slot5, slot6, slot7)

	function slot3(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-23, warpins: 1 ---
		slot3 = slot0
		slot2 = slot0.clearTimer

		slot2(slot3)

		slot2 = true
		slot0.autoCommit = slot2
		slot2 = false
		slot0.isExpTask = slot2
		slot2 = removeOnButton
		slot3 = slot0.commitBtn

		slot2(slot3)

		slot3 = slot0
		slot2 = slot0.updateItemInfo
		slot4 = slot1

		slot2(slot3, slot4)

		slot3 = slot0
		slot2 = slot0.updateView
		slot4 = slot1

		slot2(slot3, slot4)

		slot3 = slot0
		slot2 = slot0.updateProgress
		slot4 = slot1

		slot2(slot3, slot4)

		return
		--- END OF BLOCK #0 ---



	end

	slot2.update = slot3

	function slot3(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-29, warpins: 1 ---
		slot0.taskVO = slot1
		slot2 = setText
		slot3 = slot0.title
		slot5 = slot1
		slot4 = slot1.getConfig
		slot6 = "name"

		slot2(slot3, slot4(slot5, slot6))

		slot2 = setText
		slot3 = slot0.desc
		slot5 = slot1
		slot4 = slot1.getConfig
		slot6 = "desc"
		slot4 = slot4(slot5, slot6)
		slot5 = "\n\n"
		slot4 = slot4 .. slot5

		slot2(slot3, slot4)

		slot2 = nil
		slot4 = slot1
		slot3 = slot1.getConfig
		slot5 = "target_num"
		slot3 = slot3(slot4, slot5)
		slot5 = slot1
		slot4 = slot1.getConfig
		slot6 = "sub_type"
		slot4 = slot4(slot5, slot6)
		slot5 = TASK_SUB_TYPE_GIVE_ITEM

		if slot4 == slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-37, warpins: 1 ---
			slot5 = false
			slot0.autoCommit = slot5
			slot6 = slot1
			slot5 = slot1.getConfig
			slot7 = "target_id_for_client"
			slot5 = slot5(slot6, slot7)
			slot2 = slot5
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-40, warpins: 1 ---
			slot5 = TASK_SUB_TYPE_PLAYER_RES

			if slot4 == slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 41-50, warpins: 1 ---
				slot5 = false
				slot0.autoCommit = slot5
				slot5 = id2ItemId
				slot7 = slot1
				slot6 = slot1.getConfig
				slot8 = "target_id_for_client"
				slot5 = slot5(slot6(slot7, slot8))
				slot2 = slot5
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 51-53, warpins: 1 ---
				slot5 = TASK_SUB_TYPE_BATTLE_EXP

				if slot4 == slot5 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 54-56, warpins: 1 ---
					slot5 = true
					slot0.isExpTask = slot5
					slot2 = 59000
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 57-61, warpins: 4 ---
		slot5 = setActive
		slot6 = slot0.itemContainer
		slot7 = slot0.autoCommit

		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 62-63, warpins: 1 ---
			slot7 = slot0.isExpTask

			if slot0.isExpTask then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 64-65, warpins: 0 ---
				slot7 = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 66-66, warpins: 1 ---
			slot7 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 67-69, warpins: 3 ---
		slot5(slot6, slot7)

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 70-84, warpins: 1 ---
			slot5 = updateDrop
			slot6 = slot0.itemTpl
			slot7 = slot6
			slot6 = slot6.Find
			slot8 = "award"
			slot6 = slot6(slot7, slot8)
			slot7 = {
				type = 2
			}
			slot7.id = slot2
			slot7.count = slot3

			slot5(slot6, slot7)

			slot5 = setText
			slot6 = slot0.itemCount
			slot7 = 1000

			if slot3 > slot7 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 85-92, warpins: 1 ---
				slot7 = math
				slot7 = slot7.floor
				slot8 = slot3 / 1000
				slot7 = slot7(slot8)
				slot8 = "K"
				slot7 = slot7 .. slot8

				if not slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 93-93, warpins: 2 ---
					slot7 = slot3
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 94-94, warpins: 2 ---
			slot5(slot6, slot7)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 95-99, warpins: 2 ---
		slot5 = setText
		slot6 = slot0.numberTF
		slot7 = slot1.index

		slot5(slot6, slot7)

		return
		--- END OF BLOCK #3 ---



	end

	slot2.updateItemInfo = slot3

	function slot3(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-8, warpins: 1 ---
		slot2 = slot1.taskState
		slot3 = false
		slot4 = false
		slot5 = false
		slot6 = ShipBluePrint
		slot6 = slot6.TASK_STATE_PAUSE

		if slot2 == slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-11, warpins: 1 ---
			slot6 = slot1.leftTime

			if slot6 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 12-20, warpins: 1 ---
				slot6 = getProxy
				slot7 = TaskProxy
				slot6 = slot6(slot7)
				slot7 = slot6
				slot6 = slot6.getTaskVO
				slot8 = slot1.id
				slot6 = slot6(slot7, slot8)

				if slot6 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-24, warpins: 1 ---
					slot8 = slot6
					slot7 = slot6.isFinish
					slot7 = slot7(slot8)
					slot3 = slot7
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 25-28, warpins: 2 ---
				slot7 = slot1.leftTime
				slot8 = 0

				if slot7 <= slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 29-30, warpins: 1 ---
					slot5 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 31-31, warpins: 1 ---
					slot5 = true
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 32-33, warpins: 2 ---
				if slot6 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 34-37, warpins: 1 ---
					slot8 = slot6
					slot7 = slot6.isReceive
					slot7 = slot7(slot8)
					slot4 = slot7
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #2 ---

				FLOW; TARGET BLOCK #3



				-- Decompilation error in this vicinity:
				--- BLOCK #3 38-41, warpins: 2 ---
				slot7 = slot1.leftTime
				slot8 = 0

				if slot7 > slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 42-54, warpins: 1 ---
					slot7 = setText
					slot8 = slot0
					slot8 = slot8.timerTFTxt
					slot9 = pg
					slot9 = slot9.TimeMgr
					slot10 = slot9
					slot9 = slot9.GetInstance
					slot9 = slot9(slot10)
					slot10 = slot9
					slot9 = slot9.DescCDTime
					slot11 = slot1.leftTime

					slot7(slot8, slot9(slot10, slot11))
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #3 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 55-60, warpins: 4 ---
		slot6 = setActive
		slot7 = slot0.pause
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_PAUSE

		if slot8 ~= slot2 or slot3 or slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 65-68, warpins: 3 ---
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_PAUSE

			if slot8 == slot2 and not slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 71-72, warpins: 1 ---
				if slot3 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 73-75, warpins: 1 ---
					slot8 = slot0.autoCommit
					slot8 = not slot8
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 76-77, warpins: 2 ---
				slot8 = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 78-78, warpins: 1 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 79-85, warpins: 4 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.pauseLock
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_PAUSE

		if slot8 == slot2 and not slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 88-89, warpins: 1 ---
			slot8 = slot5
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 90-91, warpins: 2 ---
			slot8 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 92-92, warpins: 0 ---
				slot8 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 93-99, warpins: 3 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.lockBtn
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_ACHIEVED

		if slot2 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 100-103, warpins: 1 ---
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_START

			if slot2 == slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 104-107, warpins: 1 ---
				slot8 = slot0.autoCommit
				slot8 = not slot8
				slot8 = not slot8
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 108-109, warpins: 1 ---
			slot8 = false

			if false then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 110-110, warpins: 1 ---
				slot8 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 111-117, warpins: 3 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.commitBtn
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_ACHIEVED

		if slot2 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 118-121, warpins: 1 ---
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_START

			if slot2 == slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 122-124, warpins: 1 ---
				slot8 = slot0.autoCommit
				slot8 = not slot8
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 125-126, warpins: 1 ---
				slot8 = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 127-127, warpins: 1 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 128-134, warpins: 3 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.progressTF
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_ACHIEVED

		if slot2 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 135-138, warpins: 1 ---
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_START

			if slot2 ~= slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 139-142, warpins: 1 ---
				slot8 = ShipBluePrint
				slot8 = slot8.TASK_STATE_FINISHED

				if slot2 ~= slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 143-146, warpins: 1 ---
					slot8 = ShipBluePrint
					slot8 = slot8.TASK_STATE_PAUSE

					if slot2 == slot8 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 147-148, warpins: 1 ---
						slot8 = not slot5
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 149-150, warpins: 1 ---
						slot8 = false
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 151-151, warpins: 3 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 152-158, warpins: 3 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.lock
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_LOCK

		if slot2 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 159-162, warpins: 1 ---
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_WAIT

			if slot2 ~= slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 163-164, warpins: 1 ---
				slot8 = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 165-165, warpins: 2 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 166-172, warpins: 2 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.working
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_OPENING

		if slot2 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 173-176, warpins: 1 ---
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_START

			if slot2 ~= slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 177-180, warpins: 1 ---
				slot8 = ShipBluePrint
				slot8 = slot8.TASK_STATE_ACHIEVED

				if slot2 ~= slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 181-182, warpins: 1 ---
					slot8 = false
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 183-183, warpins: 3 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #7 ---

		FLOW; TARGET BLOCK #8



		-- Decompilation error in this vicinity:
		--- BLOCK #8 184-190, warpins: 2 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.maskAchieved
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_FINISHED

		if slot2 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 191-194, warpins: 1 ---
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_PAUSE

			if slot2 == slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 195-196, warpins: 1 ---
				slot8 = slot4
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 197-198, warpins: 1 ---
				slot8 = false
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 199-199, warpins: 1 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #8 ---

		FLOW; TARGET BLOCK #9



		-- Decompilation error in this vicinity:
		--- BLOCK #9 200-206, warpins: 3 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.timerTF
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_WAIT

		if slot2 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 207-210, warpins: 1 ---
			slot8 = ShipBluePrint
			slot8 = slot8.TASK_STATE_PAUSE

			if slot2 == slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 211-213, warpins: 1 ---
				slot8 = slot1.leftTime

				if slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 214-217, warpins: 1 ---
					slot8 = slot1.leftTime
					slot9 = 0

					if slot8 <= slot9 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 218-219, warpins: 2 ---
						slot8 = false
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 220-220, warpins: 2 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #9 ---

		FLOW; TARGET BLOCK #10



		-- Decompilation error in this vicinity:
		--- BLOCK #10 221-226, warpins: 3 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.check
		slot8 = slot0.autoCommit

		if slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 227-229, warpins: 1 ---
			slot8 = TASK_STATE_ACHIEVED

			if slot2 ~= slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 230-233, warpins: 2 ---
				slot8 = ShipBluePrint
				slot8 = slot8.TASK_STATE_FINISHED

				if slot2 ~= slot8 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 234-237, warpins: 1 ---
					slot8 = ShipBluePrint
					slot8 = slot8.TASK_STATE_PAUSE

					if slot2 == slot8 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 238-239, warpins: 1 ---
						slot8 = slot4
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 240-241, warpins: 1 ---
						slot8 = false
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 242-242, warpins: 2 ---
				slot8 = true
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #10 ---

		FLOW; TARGET BLOCK #11



		-- Decompilation error in this vicinity:
		--- BLOCK #11 243-249, warpins: 3 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.tip
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_ACHIEVED

		if slot2 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 250-251, warpins: 1 ---
			slot8 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 252-252, warpins: 1 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #11 ---

		FLOW; TARGET BLOCK #12



		-- Decompilation error in this vicinity:
		--- BLOCK #12 253-259, warpins: 2 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.timerOpen
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_WAIT

		if slot2 ~= slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 260-261, warpins: 1 ---
			slot8 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 262-262, warpins: 1 ---
			slot8 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #12 ---

		FLOW; TARGET BLOCK #13



		-- Decompilation error in this vicinity:
		--- BLOCK #13 263-269, warpins: 2 ---
		slot6(slot7, slot8)

		slot6 = setActive
		slot7 = slot0.timerClose
		slot8 = ShipBluePrint
		slot8 = slot8.TASK_STATE_PAUSE

		if slot2 == slot8 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 270-272, warpins: 1 ---
			slot8 = slot1.leftTime

			if slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 273-276, warpins: 1 ---
				slot8 = slot1.leftTime
				slot9 = 0

				if slot8 <= slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 277-278, warpins: 2 ---
					slot8 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 279-279, warpins: 1 ---
					slot8 = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #13 ---

		FLOW; TARGET BLOCK #14



		-- Decompilation error in this vicinity:
		--- BLOCK #14 280-281, warpins: 3 ---
		slot6(slot7, slot8)

		return
		--- END OF BLOCK #14 ---



	end

	slot2.updateView = slot3

	function slot3(slot0, slot1)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-13, warpins: 1 ---
		slot2 = slot1.taskState
		slot4 = slot1
		slot3 = slot1.getProgress
		slot3 = slot3(slot4)
		slot5 = slot1
		slot4 = slot1.getConfig
		slot6 = "target_num"
		slot4 = slot4(slot5, slot6)
		slot3 = slot3 / slot4
		slot4 = ShipBluePrint
		slot4 = slot4.TASK_STATE_WAIT

		if slot2 == slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-20, warpins: 1 ---
			slot5 = slot0
			slot4 = slot0.addTimer
			slot6 = slot1
			slot7 = slot1.dueTime

			slot4(slot5, slot6, slot7)

			slot3 = 0
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-24, warpins: 1 ---
			slot4 = ShipBluePrint
			slot4 = slot4.TASK_STATE_OPENING

			if slot2 == slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 25-33, warpins: 1 ---
				slot3 = 0
				slot4 = slot0.view
				slot5 = slot4
				slot4 = slot4.emit
				slot6 = ShipBluePrintMediator
				slot6 = slot6.ON_TASK_OPEN
				slot7 = slot1.id

				slot4(slot5, slot6, slot7)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 34-37, warpins: 1 ---
				slot4 = ShipBluePrint
				slot4 = slot4.TASK_STATE_PAUSE

				if slot2 == slot4 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 38-42, warpins: 1 ---
					slot5 = slot1
					slot4 = slot1.isReceive
					slot4 = slot4(slot5)

					if slot4 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 43-44, warpins: 1 ---
						slot3 = 1
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 45-48, warpins: 1 ---
					slot4 = ShipBluePrint
					slot4 = slot4.TASK_STATE_LOCK

					if slot2 == slot4 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 49-50, warpins: 1 ---
						slot3 = 0
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 51-54, warpins: 1 ---
						slot4 = ShipBluePrint
						slot4 = slot4.TASK_STATE_ACHIEVED

						if slot2 == slot4 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 55-62, warpins: 1 ---
							slot4 = onButton
							slot5 = slot0.view
							slot6 = slot0.commitBtn

							function slot7()

								-- Decompilation error in this vicinity:
								--- BLOCK #0 1-10, warpins: 1 ---
								slot0 = slot0
								slot0 = slot0.view
								slot1 = slot0
								slot0 = slot0.emit
								slot2 = ShipBluePrintMediator
								slot2 = slot2.ON_FINISH_TASK
								slot3 = slot1
								slot3 = slot3.id

								slot0(slot1, slot2, slot3)

								return
								--- END OF BLOCK #0 ---



							end

							slot8 = SFX_PANEL

							slot4(slot5, slot6, slot7, slot8)

							slot3 = 1
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 63-66, warpins: 1 ---
							slot4 = ShipBluePrint
							slot4 = slot4.TASK_STATE_FINISHED

							if slot2 == slot4 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 67-68, warpins: 1 ---
								slot3 = 1
								--- END OF BLOCK #0 ---



							else

								-- Decompilation error in this vicinity:
								--- BLOCK #0 69-72, warpins: 1 ---
								slot4 = ShipBluePrint
								slot4 = slot4.TASK_STATE_START

								if slot2 == slot4 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 73-75, warpins: 1 ---
									slot4 = slot0.autoCommit

									if not slot4 then

										-- Decompilation error in this vicinity:
										--- BLOCK #0 76-82, warpins: 1 ---
										slot4 = onButton
										slot5 = slot0.view
										slot6 = slot0.commitBtn

										function slot7()

											-- Decompilation error in this vicinity:
											--- BLOCK #0 1-10, warpins: 1 ---
											slot0 = slot0
											slot0 = slot0.view
											slot1 = slot0
											slot0 = slot0.emit
											slot2 = ShipBluePrintMediator
											slot2 = slot2.ON_FINISH_TASK
											slot3 = slot1
											slot3 = slot3.id

											slot0(slot1, slot2, slot3)

											return
											--- END OF BLOCK #0 ---



										end

										slot8 = SFX_PANEL

										slot4(slot5, slot6, slot7, slot8)

										slot3 = 0
										--- END OF BLOCK #0 ---



									end
									--- END OF BLOCK #0 ---



								end
								--- END OF BLOCK #0 ---



							end
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 83-113, warpins: 10 ---
		slot4 = slot0.progessSlider
		slot4.value = slot3
		slot4 = math
		slot4 = slot4.floor
		slot5 = slot3 * 100
		slot4 = slot4(slot5)
		slot5 = setText
		slot6 = slot0.progres
		slot7 = math
		slot7 = slot7.ceil
		slot8 = math
		slot8 = slot8.min
		slot9 = slot4
		slot10 = 100
		slot7 = slot7(slot8(slot9, slot10))
		slot8 = "%"
		slot7 = slot7 .. slot8

		slot5(slot6, slot7)

		slot5 = setText
		slot6 = slot0.progreshadow
		slot7 = math
		slot7 = slot7.min
		slot8 = slot4
		slot9 = 100
		slot7 = slot7(slot8, slot9)
		slot8 = "%"
		slot7 = slot7 .. slot8

		slot5(slot6, slot7)

		return
		--- END OF BLOCK #1 ---



	end

	slot2.updateProgress = slot3

	function slot3(slot0, slot1, slot2)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-20, warpins: 1 ---
		function slot3()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-19, warpins: 1 ---
			slot0 = slot0
			slot1 = slot0
			slot0 = slot0.clearTimer

			slot0(slot1)

			slot0 = setText
			slot1 = slot0
			slot1 = slot1.timerTFTxt
			slot2 = "00:00:00"

			slot0(slot1, slot2)

			slot0 = slot0
			slot0 = slot0.view
			slot1 = slot0
			slot0 = slot0.emit
			slot2 = ShipBluePrintMediator
			slot2 = slot2.ON_TASK_OPEN
			slot3 = slot1
			slot3 = slot3.id

			slot0(slot1, slot2, slot3)

			return
			--- END OF BLOCK #0 ---



		end

		slot5 = slot0
		slot4 = slot0.clearTimer

		slot4(slot5)

		slot4 = Timer
		slot4 = slot4.New

		function slot5()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-12, warpins: 1 ---
			slot0 = pg
			slot0 = slot0.TimeMgr
			slot0 = slot0.GetInstance
			slot0 = slot0()
			slot1 = slot0
			slot0 = slot0.GetServerTime
			slot0 = slot0(slot1)
			slot1 = slot0
			slot1 = slot1 - slot0
			slot2 = 0

			if slot1 > slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 13-25, warpins: 1 ---
				slot2 = setText
				slot3 = slot1
				slot3 = slot3.timerTFTxt
				slot4 = pg
				slot4 = slot4.TimeMgr
				slot4 = slot4.GetInstance
				slot4 = slot4()
				slot5 = slot4
				slot4 = slot4.DescCDTime
				slot6 = slot1

				slot2(slot3, slot4(slot5, slot6))
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 26-27, warpins: 1 ---
				slot2 = slot2

				slot2()
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 28-28, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot6 = 1
		slot7 = -1
		slot4 = slot4(slot5, slot6, slot7)
		slot0.taskTimer = slot4
		slot4 = slot0.taskTimer
		slot5 = slot4
		slot4 = slot4.Start

		slot4(slot5)

		slot4 = slot0.taskTimer
		slot4 = slot4.func

		slot4()

		return
		--- END OF BLOCK #0 ---



	end

	slot2.addTimer = slot3

	function slot3(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot1 = slot0.taskTimer

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-9, warpins: 1 ---
			slot1 = slot0.taskTimer
			slot2 = slot1
			slot1 = slot1.Stop

			slot1(slot2)

			slot1 = nil
			slot0.taskTimer = slot1
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-10, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot2.clearTimer = slot3

	function slot3(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot2 = slot0
		slot1 = slot0.clearTimer

		slot1(slot2)

		return
		--- END OF BLOCK #0 ---



	end

	slot2.clear = slot3

	return slot2
	--- END OF BLOCK #0 ---



end

slot0.createTask = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = slot0.contextData
	slot1 = slot1.shipBluePrintVO

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-37, warpins: 1 ---
		slot2 = setActive
		slot3 = slot0.preViewer
		slot4 = true

		slot2(slot3, slot4)

		slot2 = setParent
		slot3 = slot0.blurPanel
		slot4 = slot0._tf

		slot2(slot3, slot4)

		slot2 = pg
		slot2 = slot2.UIMgr
		slot3 = slot2
		slot2 = slot2.GetInstance
		slot2 = slot2(slot3)
		slot3 = slot2
		slot2 = slot2.BlurPanel
		slot4 = slot0.preViewer

		slot2(slot3, slot4)

		slot3 = slot0
		slot2 = slot0.playLoadingAni

		slot2(slot3)

		slot3 = slot1
		slot2 = slot1.getShipVO
		slot2 = slot2(slot3)
		slot0.viewShipVO = slot2
		slot3 = slot0
		slot2 = slot0.getStages
		slot4 = slot0.viewShipVO
		slot2 = slot2(slot3, slot4)
		slot0.breakIds = slot2
		slot2 = 1
		slot3 = slot0
		slot4 = 1

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 38-62, warpins: 0 ---
		for slot5 = slot2, slot3, slot4 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 38-56, warpins: 2 ---
			slot6 = slot0.breakIds
			slot6 = slot6[slot5]
			slot7 = slot1
			slot7 = slot7[slot6]
			slot9 = slot0
			slot8 = slot0.findTF
			slot10 = "stage"
			slot11 = slot5
			slot10 = slot10 .. slot11
			slot11 = slot0.stages
			slot8 = slot8(slot9, slot10, slot11)
			slot9 = onToggle
			slot10 = slot0
			slot11 = slot8

			function slot12(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-2, warpins: 1 ---
				if slot0 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 3-15, warpins: 1 ---
					slot1 = setText
					slot2 = slot0
					slot2 = slot2.breakView
					slot3 = slot1
					slot4 = slot2
					slot3 = slot3[slot4]
					slot3 = slot3.breakout_view

					slot1(slot2, slot3)

					slot1 = slot0
					slot2 = slot1
					slot1 = slot1.switchStage
					slot3 = slot2

					slot1(slot2, slot3)
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 16-16, warpins: 2 ---
				return
				--- END OF BLOCK #1 ---



			end

			slot13 = SFX_PANEL

			slot9(slot10, slot11, slot12, slot13)

			if slot5 == 1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 57-60, warpins: 1 ---
				slot9 = triggerToggle
				slot10 = slot8
				slot11 = true

				slot9(slot10, slot11)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 61-62, warpins: 2 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 63-68, warpins: 1 ---
		slot2 = true
		slot0.isShowPreview = slot2
		slot3 = slot0
		slot2 = slot0.updateMaxLevelAttrs
		slot4 = slot1

		slot2(slot3, slot4)
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 69-70, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

slot0.openPreView = slot10
slot10 = {}
slot11 = AttributeType
slot11 = slot11.Durability
slot10[1] = slot11
slot11 = AttributeType
slot11 = slot11.Cannon
slot10[2] = slot11
slot11 = AttributeType
slot11 = slot11.Torpedo
slot10[3] = slot11
slot11 = AttributeType
slot11 = slot11.AntiAircraft
slot10[4] = slot11
slot11 = AttributeType
slot11 = slot11.Air
slot10[5] = slot11
slot11 = AttributeType
slot11 = slot11.Reload
slot10[6] = slot11
slot11 = AttributeType
slot11 = slot11.ArmorType
slot10[7] = slot11
slot11 = AttributeType
slot11 = slot11.Dodge
slot10[8] = slot11
slot0.MAX_LEVEL_ATTRS = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot3 = slot1
	slot2 = slot1.isFetched
	slot2 = slot2(slot3)

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-6, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-33, warpins: 2 ---
	slot2 = slot0.shipVOs
	slot3 = slot1.shipId
	slot2 = slot2[slot3]
	slot3 = Clone
	slot4 = slot2
	slot3 = slot3(slot4)
	slot4 = 120
	slot3.level = slot4
	slot4 = Clone
	slot5 = slot1
	slot4 = slot4(slot5)
	slot6 = slot1
	slot5 = slot1.getMaxLevel
	slot5 = slot5(slot6)
	slot4.level = slot5
	slot5 = intProperties
	slot7 = slot4
	slot6 = slot4.getShipProperties
	slot8 = slot3
	slot9 = false
	slot5 = slot5(slot6(slot7, slot8, slot9))
	slot6 = ipairs
	slot7 = slot0
	slot7 = slot7.MAX_LEVEL_ATTRS
	slot6, slot7, slot8 = slot6(slot7)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 34-74, warpins: 0 ---
	for slot9, slot10 in slot6, slot7, slot8 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-42, warpins: 1 ---
		slot11 = slot0.previewAttrContainer
		slot12 = slot11
		slot11 = slot11.Find
		slot13 = slot10
		slot11 = slot11(slot12, slot13)
		slot12 = AttributeType
		slot12 = slot12.ArmorType

		if slot10 == slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-52, warpins: 1 ---
			slot12 = setText
			slot14 = slot11
			slot13 = slot11.Find
			slot15 = "bg/value"
			slot13 = slot13(slot14, slot15)
			slot15 = slot2
			slot14 = slot2.getShipArmorName

			slot12(slot13, slot14(slot15))
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 53-60, warpins: 1 ---
			slot12 = setText
			slot14 = slot11
			slot13 = slot11.Find
			slot15 = "bg/value"
			slot13 = slot13(slot14, slot15)
			slot14 = slot5[slot10]

			if not slot14 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 61-61, warpins: 1 ---
				slot14 = 0
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 62-62, warpins: 2 ---
			slot12(slot13, slot14)
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 63-72, warpins: 2 ---
		slot12 = setText
		slot14 = slot11
		slot13 = slot11.Find
		slot15 = "bg/name"
		slot13 = slot13(slot14, slot15)
		slot14 = AttributeType
		slot14 = slot14.Type2Name
		slot15 = slot10

		slot12(slot13, slot14(slot15))
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 73-74, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 75-75, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.updateMaxLevelAttrs = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot0.previewer

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-9, warpins: 1 ---
		slot2 = slot0.previewer
		slot3 = slot2
		slot2 = slot2.clear

		slot2(slot3)

		slot2 = nil
		slot0.previewer = slot2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 10-19, warpins: 2 ---
	slot2 = setActive
	slot3 = slot0.preViewer
	slot4 = false

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.rawImage
	slot4 = false

	slot2(slot3, slot4)

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-28, warpins: 1 ---
		slot2 = SetParent
		slot3 = slot0.blurPanel
		slot4 = pg
		slot4 = slot4.UIMgr
		slot5 = slot4
		slot4 = slot4.GetInstance
		slot4 = slot4(slot5)
		slot4 = slot4.OverlayMain

		slot2(slot3, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 29-41, warpins: 2 ---
	slot2 = pg
	slot2 = slot2.UIMgr
	slot3 = slot2
	slot2 = slot2.GetInstance
	slot2 = slot2(slot3)
	slot3 = slot2
	slot2 = slot2.UnblurPanel
	slot4 = slot0.preViewer
	slot5 = slot0._tf

	slot2(slot3, slot4, slot5)

	slot2 = nil
	slot0.isShowPreview = slot2

	return
	--- END OF BLOCK #2 ---



end

slot0.closePreview = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = setActive
	slot2 = slot0.seaLoading
	slot3 = true

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #0 ---



end

slot0.playLoadingAni = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = setActive
	slot2 = slot0.seaLoading
	slot3 = false

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #0 ---



end

slot0.stopLoadingAni = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-30, warpins: 1 ---
	slot1 = WeaponPreviewer
	slot1 = slot1.New
	slot2 = slot0.rawImage
	slot1 = slot1(slot2)
	slot0.previewer = slot1
	slot1 = slot0.previewer
	slot2 = slot1
	slot1 = slot1.configUI
	slot3 = slot0.healTF

	slot1(slot2, slot3)

	slot1 = slot0.previewer
	slot2 = slot1
	slot1 = slot1.setDisplayWeapon
	slot4 = slot0
	slot3 = slot0.getWaponIdsById
	slot5 = slot0.breakOutId

	slot1(slot2, slot3(slot4, slot5))

	slot1 = slot0.previewer
	slot2 = slot1
	slot1 = slot1.load
	slot3 = 40000
	slot4 = slot0.viewShipVO
	slot6 = slot0
	slot5 = slot0.getAllWeaponIds
	slot5 = slot5(slot6)

	function slot6()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0 = slot0
		slot1 = slot0
		slot0 = slot0.stopLoadingAni

		slot0(slot1)

		return
		--- END OF BLOCK #0 ---



	end

	slot1(slot2, slot3, slot4, slot5, slot6)

	return
	--- END OF BLOCK #0 ---



end

slot0.showBarrage = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot2 = slot0
	slot2 = slot2[slot1]
	slot2 = slot2.weapon_ids

	return slot2
	--- END OF BLOCK #0 ---



end

slot0.getWaponIdsById = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = {}
	slot2 = ipairs
	slot3 = slot0.breakIds
	slot2, slot3, slot4 = slot2(slot3)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-20, warpins: 0 ---
	for slot5, slot6 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-18, warpins: 1 ---
		slot7 = Clone
		slot8 = slot0
		slot8 = slot8[slot6]
		slot8 = slot8.weapon_ids
		slot7 = slot7(slot8)
		slot8 = {}

		function slot9(slot0, slot1)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-4, warpins: 1 ---
			slot2 = ipairs
			slot3 = slot0
			slot2, slot3, slot4 = slot2(slot3)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 5-18, warpins: 0 ---
			for slot5, slot6 in slot2, slot3, slot4 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 5-11, warpins: 1 ---
				slot7 = table
				slot7 = slot7.contains
				slot8 = slot1
				slot9 = slot6
				slot7 = slot7(slot8, slot9)

				if not slot7 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 12-16, warpins: 1 ---
					slot7 = table
					slot7 = slot7.insert
					slot8 = slot1
					slot9 = slot6

					slot7(slot8, slot9)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 17-18, warpins: 3 ---
				--- END OF BLOCK #1 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 19-19, warpins: 1 ---
			return slot1
			--- END OF BLOCK #2 ---



		end

		slot8.__add = slot9
		slot9 = setmetatable
		slot10 = slot1
		slot11 = slot8

		slot9(slot10, slot11)

		slot1 = slot1 + slot7
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 19-20, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 21-22, warpins: 1 ---
	return slot1
	--- END OF BLOCK #2 ---



end

slot0.getAllWeaponIds = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot2 = {}
	slot3 = math
	slot3 = slot3.floor
	slot4 = slot1.configId
	slot4 = slot4 / 10
	slot3 = slot3(slot4)
	slot4 = 1
	slot5 = 4
	slot6 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 11-21, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-21, warpins: 2 ---
		slot8 = tonumber
		slot9 = slot3
		slot10 = slot7
		slot9 = slot9 .. slot10
		slot8 = slot8(slot9)
		slot9 = table
		slot9 = slot9.insert
		slot10 = slot2
		slot11 = slot8

		slot9(slot10, slot11)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 22-22, warpins: 1 ---
	return slot2
	--- END OF BLOCK #2 ---



end

slot0.getStages = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = slot0.breakOutId

	if slot2 == slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-8, warpins: 2 ---
	slot0.breakOutId = slot1
	slot2 = slot0.previewer

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 9-16, warpins: 1 ---
		slot2 = slot0.previewer
		slot3 = slot2
		slot2 = slot2.setDisplayWeapon
		slot5 = slot0
		slot4 = slot0.getWaponIdsById
		slot6 = slot0.breakOutId

		slot2(slot3, slot4(slot5, slot6))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 17-17, warpins: 2 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.switchStage = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = pairs
	slot2 = slot0.taskTFs

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-5, warpins: 1 ---
		slot2 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 2 ---
	slot1, slot2, slot3 = slot1(slot2)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-12, warpins: 0 ---
	for slot4, slot5 in slot1, slot2, slot3 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-10, warpins: 1 ---
		slot7 = slot5
		slot6 = slot5.clear

		slot6(slot7)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-12, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 13-13, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.clearTimers = slot10

function slot10(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-17, warpins: 1 ---
	slot3 = tf
	slot4 = Instantiate
	slot5 = slot1
	slot3 = slot3(slot4(slot5))
	slot4 = SetActive
	slot5 = slot3
	slot6 = true

	slot4(slot5, slot6)

	slot5 = slot3
	slot4 = slot3.SetParent
	slot6 = tf
	slot7 = slot2
	slot6 = slot6(slot7)
	slot7 = false

	slot4(slot5, slot6, slot7)

	return slot3
	--- END OF BLOCK #0 ---



end

slot0.cloneTplTo = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = slot0.isShowPreview

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-8, warpins: 1 ---
		slot2 = slot0
		slot1 = slot0.closePreview
		slot3 = true

		slot1(slot2, slot3)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-11, warpins: 2 ---
	slot1 = slot0.awakenPlay

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 1 ---
		slot2 = slot0
		slot1 = slot0.inModAnim
		slot1 = slot1(slot2)

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 2 ---
			return
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-23, warpins: 2 ---
	slot2 = slot0
	slot1 = slot0.emit
	slot3 = slot0
	slot3 = slot3.ON_BACK_PRESSED

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #2 ---



end

slot0.onBackPressed = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = isActive
	slot2 = slot0.msgPanel
	slot1 = slot1(slot2)

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-18, warpins: 1 ---
		slot1 = pg
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.UnblurPanel
		slot3 = slot0.msgPanel
		slot4 = slot0._tf

		slot1(slot2, slot3, slot4)

		slot1 = setActive
		slot2 = slot0.msgPanel
		slot3 = false

		slot1(slot2, slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 19-36, warpins: 2 ---
	slot1 = pg
	slot1 = slot1.UIMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.UnOverlayPanel
	slot3 = slot0.blurPanel
	slot4 = slot0._tf

	slot1(slot2, slot3, slot4)

	slot1 = LeanTween
	slot1 = slot1.cancel
	slot2 = go
	slot3 = slot0.fittingAttrPanel

	slot1(slot2(slot3))

	slot1 = slot0.lastPaintingName

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-40, warpins: 1 ---
		slot1 = retPaintingPrefab
		slot2 = slot0.painting
		slot3 = slot0.lastPaintingName

		slot1(slot2, slot3)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 41-44, warpins: 2 ---
	slot1 = pairs
	slot2 = slot0.taskTFs

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 45-45, warpins: 1 ---
		slot2 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 46-47, warpins: 2 ---
	slot1, slot2, slot3 = slot1(slot2)

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 48-52, warpins: 0 ---
	for slot4, slot5 in slot1, slot2, slot3 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 48-50, warpins: 1 ---
		slot7 = slot5
		slot6 = slot5.clear

		slot6(slot7)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 51-52, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 53-64, warpins: 1 ---
	slot2 = slot0
	slot1 = slot0.closePreview
	slot3 = true

	slot1(slot2, slot3)

	slot2 = slot0
	slot1 = slot0.clearLeanTween
	slot3 = true

	slot1(slot2, slot3)

	slot1 = pairs
	slot2 = slot0.nameTxts
	slot1, slot2, slot3 = slot1(slot2)

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 65-69, warpins: 0 ---
	for slot4, slot5 in slot1, slot2, slot3 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 65-67, warpins: 1 ---
		slot7 = slot5
		slot6 = slot5.destroy

		slot6(slot7)
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 68-69, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 70-74, warpins: 1 ---
	slot1 = nil
	slot0.nameTxts = slot1
	slot1 = slot0.previewer

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 75-80, warpins: 1 ---
		slot1 = slot0.previewer
		slot2 = slot1
		slot1 = slot1.clear

		slot1(slot2)

		slot1 = nil
		slot0.previewer = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 81-81, warpins: 2 ---
	return
	--- END OF BLOCK #8 ---



end

slot0.willExit = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-27, warpins: 1 ---
	slot1 = LeanTween
	slot1 = slot1.cancel
	slot2 = go
	slot3 = slot0.painting

	slot1(slot2(slot3))

	slot1 = LeanTween
	slot1 = slot1.moveY
	slot2 = rtf
	slot3 = slot0.painting
	slot2 = slot2(slot3)
	slot3 = slot0
	slot4 = slot1
	slot1 = slot1(slot2, slot3, slot4)
	slot2 = slot1
	slot1 = slot1.setLoopPingPong
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.setEase
	slot3 = LeanTweenType
	slot3 = slot3.easeInOutCubic
	slot1 = slot1(slot2, slot3)
	slot2 = slot1
	slot1 = slot1.setFrom
	slot3 = 0

	slot1(slot2, slot3)

	return
	--- END OF BLOCK #0 ---



end

slot0.paintBreath = slot10

function slot10(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot1 == "researchStartWindow" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-23, warpins: 1 ---
		slot3 = slot0.progressPanel
		slot4 = Vector3
		slot5 = 0
		slot6 = 1
		slot7 = 1
		slot4 = slot4(slot5, slot6, slot7)
		slot3.localScale = slot4
		slot3 = LeanTween
		slot3 = slot3.scale
		slot4 = slot0.progressPanel
		slot5 = Vector3
		slot6 = 1
		slot7 = 1
		slot8 = 1
		slot5 = slot5(slot6, slot7, slot8)
		slot6 = 0.2
		slot3 = slot3(slot4, slot5, slot6)
		slot4 = slot3
		slot3 = slot3.setDelay
		slot5 = 2

		slot3(slot4, slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 24-32, warpins: 2 ---
	function slot3()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-34, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0.awakenAni
		slot1 = slot0
		slot0 = slot0.SetActive
		slot2 = true

		slot0(slot1, slot2)

		slot0 = slot0
		slot1 = true
		slot0.awakenPlay = slot1
		slot0 = tf
		slot1 = slot0
		slot1 = slot1.awakenAni
		slot0 = slot0(slot1)
		slot1 = pg
		slot1 = slot1.UIMgr
		slot1 = slot1.GetInstance
		slot1 = slot1()
		slot2 = slot1
		slot1 = slot1.BlurPanel
		slot3 = slot0

		slot1(slot2, slot3)

		slot2 = slot0
		slot1 = slot0.SetAsLastSibling

		slot1(slot2)

		slot2 = slot0
		slot1 = slot0.GetComponent
		slot3 = "DftAniEvent"
		slot1 = slot1(slot2, slot3)
		slot3 = slot1
		slot2 = slot1.SetEndEvent

		function slot4(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot1 = IsNil
			slot2 = slot0
			slot2 = slot2.awakenAni
			slot1 = slot1(slot2)

			if not slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-28, warpins: 1 ---
				slot1 = pg
				slot1 = slot1.UIMgr
				slot1 = slot1.GetInstance
				slot1 = slot1()
				slot2 = slot1
				slot1 = slot1.UnblurPanel
				slot3 = slot1
				slot4 = slot0
				slot4 = slot4.blurPanel

				slot1(slot2, slot3, slot4)

				slot1 = slot0
				slot1 = slot1.awakenAni
				slot2 = slot1
				slot1 = slot1.SetActive
				slot3 = false

				slot1(slot2, slot3)

				slot1 = slot0
				slot2 = false
				slot1.awakenPlay = slot2
				slot1 = slot2

				if slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 29-30, warpins: 1 ---
					slot1 = slot2

					slot1()
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 31-31, warpins: 3 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot2(slot3, slot4)

		return
		--- END OF BLOCK #0 ---



	end

	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = slot1
	slot7 = "(Clone)"
	slot6 = slot6 .. slot7
	slot4 = slot4(slot5, slot6)

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-35, warpins: 1 ---
		slot5 = go
		slot6 = slot4
		slot5 = slot5(slot6)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 36-39, warpins: 2 ---
	slot0.awakenAni = slot5
	slot5 = slot0.awakenAni

	if not slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 40-49, warpins: 1 ---
		slot5 = PoolMgr
		slot5 = slot5.GetInstance
		slot5 = slot5()
		slot6 = slot5
		slot5 = slot5.GetUI
		slot7 = slot1
		slot8 = true

		function slot9(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-9, warpins: 1 ---
			slot2 = slot0
			slot1 = slot0.SetActive
			slot3 = true

			slot1(slot2, slot3)

			slot1 = slot0
			slot1.awakenAni = slot0
			slot1 = slot1

			slot1()

			return
			--- END OF BLOCK #0 ---



		end

		slot5(slot6, slot7, slot8, slot9)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 50-51, warpins: 1 ---
		slot5 = slot3

		slot5()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 52-53, warpins: 2 ---
	return
	--- END OF BLOCK #3 ---



end

slot0.buildStartAni = slot10

function slot10(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-73, warpins: 1 ---
	slot2 = pg
	slot2 = slot2.UIMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.BlurPanel
	slot4 = slot0.msgPanel

	slot2(slot3, slot4)

	slot2 = setActive
	slot3 = slot0.msgPanel
	slot4 = true

	slot2(slot3, slot4)

	slot2 = slot0.contextData
	slot2 = slot2.shipBluePrintVO
	slot4 = slot2
	slot3 = slot2.getMaxFateLevel
	slot3 = slot3(slot4)
	slot5 = slot0
	slot4 = slot0.findTF
	slot6 = "window/content"
	slot7 = slot0.msgPanel
	slot4 = slot4(slot5, slot6, slot7)
	slot6 = slot0
	slot5 = slot0.findTF
	slot7 = "pre_btn"
	slot8 = slot4
	slot5 = slot5(slot6, slot7, slot8)
	slot7 = slot0
	slot6 = slot0.findTF
	slot8 = "next_btn"
	slot9 = slot4
	slot6 = slot6(slot7, slot8, slot9)
	slot8 = slot0
	slot7 = slot0.findTF
	slot9 = "attrl_panel"
	slot10 = slot4
	slot7 = slot7(slot8, slot9, slot10)
	slot9 = slot0
	slot8 = slot0.findTF
	slot10 = "skill_panel"
	slot11 = slot4
	slot8 = slot8(slot9, slot10, slot11)
	slot10 = slot0
	slot9 = slot0.findTF
	slot11 = "phase"
	slot12 = slot4
	slot9 = slot9(slot10, slot11, slot12)
	slot10 = {
		"I",
		"II",
		"III",
		"IV",
		"V"
	}

	function slot11()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0 = setActive
		slot1 = slot0
		slot2 = slot1
		slot3 = 1

		if slot2 <= slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 7-8, warpins: 1 ---
			slot2 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 9-9, warpins: 1 ---
			slot2 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-16, warpins: 2 ---
		slot0(slot1, slot2)

		slot0 = setActive
		slot1 = slot2
		slot2 = slot1
		slot3 = slot3

		if slot2 >= slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-18, warpins: 1 ---
			slot2 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-19, warpins: 1 ---
			slot2 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 20-40, warpins: 2 ---
		slot0(slot1, slot2)

		slot0 = setText
		slot1 = slot4
		slot2 = "PHASE."
		slot3 = slot5
		slot4 = slot1
		slot3 = slot3[slot4]
		slot2 = slot2 .. slot3

		slot0(slot1, slot2)

		slot0 = slot6
		slot1 = slot0
		slot0 = slot0.getFateStrengthenConfig
		slot2 = slot1
		slot0 = slot0(slot1, slot2)
		slot1 = slot0.special_effect
		slot2 = nil
		slot3 = {}
		slot4 = ipairs
		slot5 = slot1
		slot4, slot5, slot6 = slot4(slot5)

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 41-59, warpins: 0 ---
		for slot7, slot8 in slot4, slot5, slot6 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 41-45, warpins: 1 ---
			slot9 = slot8[1]
			slot10 = ShipBluePrint
			slot10 = slot10.STRENGTHEN_TYPE_CHANGE_SKILL

			if slot9 == slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 46-48, warpins: 1 ---
				slot10 = slot8[2]
				slot2 = slot10[2]
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 49-52, warpins: 1 ---
				slot10 = ShipBluePrint
				slot10 = slot10.STRENGTHEN_TYPE_ATTR

				if slot9 == slot10 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 53-57, warpins: 1 ---
					slot10 = table
					slot10 = slot10.insert
					slot11 = slot3
					slot12 = slot8[2]

					slot10(slot11, slot12)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 58-59, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 60-65, warpins: 1 ---
		slot4 = setActive
		slot5 = slot7
		slot6 = #slot3
		slot7 = 0

		if slot6 <= slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 66-67, warpins: 1 ---
			slot6 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 68-68, warpins: 1 ---
			slot6 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #4 ---

		FLOW; TARGET BLOCK #5



		-- Decompilation error in this vicinity:
		--- BLOCK #5 69-75, warpins: 2 ---
		slot4(slot5, slot6)

		slot4 = setActive
		slot5 = slot8
		slot6 = slot2

		slot4(slot5, slot6)

		if slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 76-124, warpins: 1 ---
			slot4 = getSkillConfig
			slot5 = slot2
			slot4 = slot4(slot5)
			slot5 = GetImageSpriteFromAtlasAsync
			slot6 = "skillicon/"
			slot7 = slot4.icon
			slot6 = slot6 .. slot7
			slot7 = ""
			slot8 = slot9
			slot9 = slot8
			slot8 = slot8.findTF
			slot10 = "skill_icon"
			slot11 = slot8

			slot5(slot6, slot7, slot8(slot9, slot10, slot11))

			slot5 = setText
			slot6 = slot9
			slot7 = slot6
			slot6 = slot6.findTF
			slot8 = "skill_name"
			slot9 = slot8
			slot6 = slot6(slot7, slot8, slot9)
			slot7 = getSkillName
			slot8 = slot2

			slot5(slot6, slot7(slot8))

			slot5 = 1
			slot6 = setText
			slot7 = slot9
			slot8 = slot7
			slot7 = slot7.findTF
			slot9 = "skill_lv"
			slot10 = slot8
			slot7 = slot7(slot8, slot9, slot10)
			slot8 = "Lv."
			slot9 = slot5
			slot8 = slot8 .. slot9

			slot6(slot7, slot8)

			slot6 = setText
			slot7 = slot9
			slot8 = slot7
			slot7 = slot7.findTF
			slot9 = "help_panel/skill_intro"
			slot10 = slot8
			slot7 = slot7(slot8, slot9, slot10)
			slot8 = getSkillDescGet
			slot9 = slot2

			slot6(slot7, slot8(slot9))
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #5 ---

		FLOW; TARGET BLOCK #6



		-- Decompilation error in this vicinity:
		--- BLOCK #6 125-128, warpins: 2 ---
		slot4 = #slot3
		slot5 = 0

		if slot4 > slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 129-132, warpins: 1 ---
			slot4 = ipairs
			slot5 = slot3
			slot4, slot5, slot6 = slot4(slot5)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 133-172, warpins: 0 ---
			for slot7, slot8 in slot4, slot5, slot6 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 133-136, warpins: 1 ---
				slot9 = slot7
				slot9 = slot9.childCount

				if slot7 < slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 137-143, warpins: 1 ---
					slot9 = slot7
					slot10 = slot9
					slot9 = slot9.GetChild
					slot11 = slot7
					slot9 = slot9(slot10, slot11)

					if not slot9 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 144-151, warpins: 2 ---
						slot9 = cloneTplTo
						slot10 = slot7
						slot11 = slot10
						slot10 = slot10.GetChild
						slot12 = slot7 - 1
						slot10 = slot10(slot11, slot12)
						slot11 = slot7
						slot9 = slot9(slot10, slot11)
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 152-170, warpins: 2 ---
				slot10 = setText
				slot12 = slot9
				slot11 = slot9.Find
				slot13 = "name"
				slot11 = slot11(slot12, slot13)
				slot12 = AttributeType
				slot12 = slot12.Type2Name
				slot13 = slot8[1]

				slot10(slot11, slot12(slot13))

				slot10 = setText
				slot12 = slot9
				slot11 = slot9.Find
				slot13 = "number"
				slot11 = slot11(slot12, slot13)
				slot12 = " + "
				slot13 = slot8[2]
				slot12 = slot12 .. slot13

				slot10(slot11, slot12)
				--- END OF BLOCK #1 ---

				FLOW; TARGET BLOCK #2



				-- Decompilation error in this vicinity:
				--- BLOCK #2 171-172, warpins: 2 ---
				--- END OF BLOCK #2 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 173-179, warpins: 1 ---
			slot4 = #slot3
			slot4 = slot4 + 1
			slot5 = slot7
			slot5 = slot5.childCount
			slot5 = slot5 - 1
			slot6 = 1

			--- END OF BLOCK #2 ---

			FLOW; TARGET BLOCK #3



			-- Decompilation error in this vicinity:
			--- BLOCK #3 180-188, warpins: 0 ---
			for slot7 = slot4, slot5, slot6 do

				-- Decompilation error in this vicinity:
				--- BLOCK #0 180-188, warpins: 2 ---
				slot8 = setActive
				slot9 = slot7
				slot10 = slot9
				slot9 = slot9.GetChild
				slot11 = slot7
				slot9 = slot9(slot10, slot11)
				slot10 = false

				slot8(slot9, slot10)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #3 ---



		end

		--- END OF BLOCK #6 ---

		FLOW; TARGET BLOCK #7



		-- Decompilation error in this vicinity:
		--- BLOCK #7 189-189, warpins: 2 ---
		return
		--- END OF BLOCK #7 ---



	end

	slot12 = onButton
	slot13 = slot0
	slot14 = slot5

	function slot15()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0 - 1
		slot0 = slot0
		slot0 = slot1

		slot0()

		return
		--- END OF BLOCK #0 ---



	end

	slot12(slot13, slot14, slot15)

	slot12 = onButton
	slot13 = slot0
	slot14 = slot6

	function slot15()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot0 = slot0
		slot0 = slot0 + 1
		slot0 = slot0
		slot0 = slot1

		slot0()

		return
		--- END OF BLOCK #0 ---



	end

	slot12(slot13, slot14, slot15)

	slot12 = setText
	slot14 = slot0
	slot13 = slot0.findTF
	slot15 = "desc"
	slot16 = slot7
	slot13 = slot13(slot14, slot15, slot16)
	slot14 = i18n
	slot15 = "fate_attr_word"

	slot12(slot13, slot14(slot15))

	slot12 = slot11

	slot12()

	return
	--- END OF BLOCK #0 ---



end

slot0.showFittingMsgPanel = slot10

function slot10(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-4, warpins: 1 ---
	slot1 = {}
	slot2 = slot0.storyMgr

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 5-8, warpins: 1 ---
		slot2 = pg
		slot2 = slot2.StoryMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-13, warpins: 2 ---
	slot0.storyMgr = slot2
	slot2 = slot0.version
	slot2 = slot1[slot2]

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 14-21, warpins: 1 ---
		slot2 = slot0.storyMgr
		slot3 = slot2
		slot2 = slot2.IsPlayed
		slot4 = slot0.version
		slot4 = slot1[slot4]
		slot2 = slot2(slot3, slot4)

		if not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 22-27, warpins: 1 ---
			slot2 = slot0.storyMgr
			slot3 = slot2
			slot2 = slot2.Play
			slot4 = slot0.version
			slot4 = slot1[slot4]

			slot2(slot3, slot4)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 28-28, warpins: 3 ---
	return
	--- END OF BLOCK #2 ---



end

slot0.checkStory = slot10

return slot0
