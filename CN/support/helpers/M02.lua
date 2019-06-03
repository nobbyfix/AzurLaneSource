slot0 = UnityEngine

function slot1(slot0, slot1)
	if slot0 and slot1 then
		slot2 = pg
		slot2 = slot2.ConnectionMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.isConnected
		slot2 = slot2(slot3)

		if slot2 then
			slot2 = pg
			slot2 = slot2.m02
			slot3 = slot2
			slot2 = slot2.sendNotification
			slot4 = GAME
			slot4 = slot4.SEND_CMD
			slot5 = {
				cmd = "log",
				arg1 = slot0,
				arg2 = slot1
			}

			slot2(slot3, slot4, slot5)
		end
	end
end

flog = slot1

function slot1(slot0, slot1, slot2)
	slot3, slot4, slot5 = nil
	slot6 = 0

	function slot7()
		slot0 = uv1

		if slot0 then
			uv0 = Time.unscaledTime or 0
			uv2 = nil
			uv3 = uv4(unpack(uv5))

			if not uv2 then
				uv5 = nil
			end
		end
	end

	function slot8(...)
		slot0 = Time
		slot0 = slot0.unscaledTime
		slot1 = uv0

		if not slot1 then
			slot1 = uv1

			if not slot1 then
				uv0 = slot0
			end
		end

		slot1 = uv2
		slot2 = uv0
		slot2 = slot0 - slot2
		slot1 = slot1 - slot2
		slot2 = {
			...
		}
		uv3 = slot2
		slot2 = 0

		if slot1 > slot2 then
			slot2 = uv2

			if slot2 < slot1 then
				slot2 = uv4

				if slot2 then
					slot2 = uv4
					slot3 = slot2
					slot2 = slot2.Stop

					slot2(slot3)

					uv4 = nil
				end

				uv0 = slot0
				slot2 = uv6
				slot3 = unpack
				slot4 = uv3
				slot2 = slot2(slot3(slot4))
				uv5 = slot2
				slot2 = uv4

				if not slot2 then
					uv3 = nil
				end
			else
				slot2 = uv4

				if not slot2 then
					slot2 = uv1

					if slot2 then
						slot2 = Timer
						slot2 = slot2.New
						slot3 = uv7
						slot4 = slot1
						slot5 = 1
						slot2 = slot2(slot3, slot4, slot5)
						uv4 = slot2
						slot2 = uv4
						slot3 = slot2
						slot2 = slot2.Start

						slot2(slot3)
					end
				end
			end
		end

		slot2 = uv5

		return slot2
	end

	return slot8
end

throttle = slot1

function slot1(slot0, slot1, slot2)
	slot3, slot4, slot5, slot6, slot7 = nil

	function slot7()
		slot0 = Time
		slot0 = slot0.unscaledTime
		slot1 = uv0
		slot0 = slot0 - slot1
		slot1 = uv1

		if slot0 < slot1 then
			slot1 = 0

			if slot0 > slot1 then
				slot1 = Timer
				slot1 = slot1.New
				slot2 = uv3
				slot3 = uv1
				slot3 = slot3 - slot0
				slot4 = 1
				slot1 = slot1(slot2, slot3, slot4)
				uv2 = slot1
				slot1 = uv2
				slot2 = slot1
				slot1 = slot1.Start

				slot1(slot2)
			end
		else
			uv2 = nil
			slot1 = uv4

			if not slot1 then
				slot1 = uv6
				slot2 = unpack
				slot3 = uv7
				slot1 = slot1(slot2(slot3))
				uv5 = slot1
				slot1 = uv2

				if not slot1 then
					uv7 = nil
				end
			else
				uv4 = false
			end
		end
	end

	function slot8(...)
		slot0 = {
			...
		}
		uv0 = slot0
		slot0 = Time
		slot0 = slot0.unscaledTime
		uv1 = slot0
		slot0 = uv2

		if slot0 then
			slot0 = uv3
			slot0 = not slot0
		end

		slot1 = uv3

		if not slot1 then
			slot1 = Timer
			slot1 = slot1.New
			slot2 = uv4
			slot3 = uv5
			slot4 = 1
			slot1 = slot1(slot2, slot3, slot4)
			uv3 = slot1
			slot1 = uv3
			slot2 = slot1
			slot1 = slot1.Start

			slot1(slot2)
		end

		if slot0 then
			slot1 = uv7
			slot2 = unpack
			slot3 = uv0
			slot1 = slot1(slot2(slot3))
			uv6 = slot1
			uv0 = nil
		end

		slot1 = uv6

		return slot1
	end

	return slot8
end

debounce = slot1

function slot1(slot0, slot1)
	slot2 = LOG

	if slot2 and slot1 then
		function slot2(...)
			slot0 = print
			slot1 = uv0
			slot2 = ": "
			slot1 = slot1 .. slot2

			slot0(slot1, ...)
		end

		return slot2
	else
		slot2 = print
		slot3 = slot0
		slot4 = ": log disabled"
		slot3 = slot3 .. slot4

		slot2(slot3)

		function slot2()
		end

		return slot2
	end
end

createLog = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.m02
	slot2 = slot1
	slot1 = slot1.retrieveProxy
	slot3 = slot0.__cname

	return slot1(slot2, slot3)
end

getProxy = slot1

function slot1(slot0)
	slot1 = pg
	slot1 = slot1.backyard
	slot2 = slot1
	slot1 = slot1.retrieveProxy
	slot3 = slot0.__cname

	return slot1(slot2, slot3)
end

getBackYardProxy = slot1

function slot1(slot0, slot1, slot2, slot3, slot4)
	slot5 = defaultValue
	slot6 = slot4
	slot7 = true
	slot5 = slot5(slot6, slot7)
	slot4 = slot5
	slot5 = defaultValue
	slot6 = slot3
	slot7 = true
	slot5 = slot5(slot6, slot7)
	slot3 = slot5
	slot5 = ResourceMgr
	slot5 = slot5.Inst
	slot6 = slot5
	slot5 = slot5.getAssetAsync
	slot7 = slot0
	slot8 = "/"
	slot9 = slot1
	slot7 = slot7 .. slot8 .. slot9
	slot8 = slot1
	slot9 = uv0
	slot9 = slot9.Events
	slot9 = slot9.UnityAction_UnityEngine_Object

	function slot10(slot0)
		slot1 = Instantiate
		slot2 = slot0
		slot1 = slot1(slot2)
		slot2 = uv0
		slot3 = slot1

		slot2(slot3)
	end

	slot9 = slot9(slot10)
	slot10 = slot3
	slot11 = slot4

	slot5(slot6, slot7, slot8, slot9, slot10, slot11)
end

LoadAndInstantiateAsync = slot1

function slot1(slot0, slot1, slot2, slot3)
	slot4 = defaultValue
	slot5 = slot3
	slot6 = true
	slot4 = slot4(slot5, slot6)
	slot3 = slot4
	slot4 = defaultValue
	slot5 = slot2
	slot6 = true
	slot4 = slot4(slot5, slot6)
	slot2 = slot4
	slot4 = ResourceMgr
	slot4 = slot4.Inst
	slot5 = slot4
	slot4 = slot4.getAssetSync
	slot6 = slot0
	slot7 = "/"
	slot8 = slot1
	slot6 = slot6 .. slot7 .. slot8
	slot7 = slot1
	slot8 = slot2
	slot9 = slot3
	slot4 = slot4(slot5, slot6, slot7, slot8, slot9)
	slot5 = Instantiate
	slot6 = slot4
	slot5 = slot5(slot6)

	return slot5
end

LoadAndInstantiateSync = slot1
slot1 = {}

function slot2(slot0, slot1)
	return ResourceMgr.Inst:getAssetSync(slot0, slot1 or "", typeof(Sprite), true, false)
end

LoadSprite = slot2

function slot2(slot0, slot1)
	slot2 = ResourceMgr
	slot2 = slot2.Inst
	slot3 = slot2
	slot2 = slot2.getAssetAsync
	slot4 = slot0
	slot5 = ""
	slot6 = typeof
	slot7 = Sprite
	slot6 = slot6(slot7)
	slot7 = uv0
	slot7 = slot7.Events
	slot7 = slot7.UnityAction_UnityEngine_Object

	function slot8(slot0)
		slot1 = uv0
		slot2 = slot0

		slot1(slot2)
	end

	slot7 = slot7(slot8)
	slot8 = true
	slot9 = false

	slot2(slot3, slot4, slot5, slot6, slot7, slot8, slot9)
end

LoadSpriteAsync = slot2

function slot2(slot0, slot1, slot2)
	slot4 = slot1
	slot3 = slot1.GetComponent
	slot5 = typeof
	slot6 = Image
	slot3 = slot3(slot4, slot5(slot6))
	slot4 = false
	slot3.enabled = slot4
	slot4 = uv0
	slot4[slot3] = slot0
	slot4 = LoadSpriteAsync
	slot5 = slot0

	function slot6(slot0)
		slot1 = IsNil
		slot2 = uv0
		slot1 = slot1(slot2)

		if not slot1 then
			slot1 = uv1
			slot2 = uv0
			slot1 = slot1[slot2]
			slot2 = uv2

			if slot1 == slot2 then
				slot1 = uv1
				slot2 = uv0
				slot3 = nil
				slot1[slot2] = slot3
				slot1 = uv0
				slot2 = true
				slot1.enabled = slot2
				slot1 = uv0
				slot1.sprite = slot0
				slot1 = uv3

				if slot1 then
					slot1 = uv0
					slot2 = slot1
					slot1 = slot1.SetNativeSize

					slot1(slot2)
				end
			end
		end
	end

	slot4(slot5, slot6)
end

LoadImageSpriteAsync = slot2

function slot2(slot0, slot1)
	slot2 = nil
	slot3 = PoolMgr
	slot3 = slot3.GetInstance
	slot3 = slot3()
	slot4 = slot3
	slot3 = slot3.GetSprite
	slot5 = slot0
	slot6 = slot1
	slot7 = false

	function slot8(slot0)
		uv0 = slot0
	end

	slot3(slot4, slot5, slot6, slot7, slot8)

	return slot2
end

GetSpriteFromAtlas = slot2

function slot2(slot0, slot1, slot2)
	slot3 = PoolMgr
	slot3 = slot3.GetInstance
	slot3 = slot3()
	slot4 = slot3
	slot3 = slot3.GetSprite
	slot5 = slot0
	slot6 = slot1
	slot7 = true

	function slot8(slot0)
		slot1 = uv0
		slot2 = slot0

		slot1(slot2)
	end

	slot3(slot4, slot5, slot6, slot7, slot8)
end

GetSpriteFromAtlasAsync = slot2

function slot2(slot0, slot1, slot2, slot3)
	slot5 = slot2
	slot4 = slot2.GetComponent
	slot6 = typeof
	slot7 = Image
	slot4 = slot4(slot5, slot6(slot7))
	slot5 = false
	slot4.enabled = slot5
	slot5 = uv0
	slot6 = slot0
	slot7 = slot1
	slot6 = slot6 .. slot7
	slot5[slot4] = slot6
	slot5 = GetSpriteFromAtlasAsync
	slot6 = slot0
	slot7 = slot1

	function slot8(slot0)
		slot1 = IsNil
		slot2 = uv0
		slot1 = slot1(slot2)

		if not slot1 then
			slot1 = uv1
			slot2 = uv0
			slot1 = slot1[slot2]
			slot2 = uv2
			slot3 = uv3
			slot2 = slot2 .. slot3

			if slot1 == slot2 then
				slot1 = uv1
				slot2 = uv0
				slot3 = nil
				slot1[slot2] = slot3
				slot1 = uv0
				slot2 = true
				slot1.enabled = slot2
				slot1 = uv0
				slot1.sprite = slot0
				slot1 = uv4

				if slot1 then
					slot1 = uv0
					slot2 = slot1
					slot1 = slot1.SetNativeSize

					slot1(slot2)
				end
			end
		end
	end

	slot5(slot6, slot7, slot8)
end

GetImageSpriteFromAtlasAsync = slot2

function slot2(slot0, slot1)
	slot3 = slot0
	slot2 = slot0.GetComponent
	slot4 = typeof
	slot5 = SpineAnimUI
	slot2 = slot2(slot3, slot4(slot5))
	slot4 = slot2
	slot3 = slot2.SetAction
	slot5 = slot1
	slot6 = 0

	slot3(slot4, slot5, slot6)
end

SetAction = slot2

function slot2(slot0, slot1)
	slot2 = ResourceMgr
	slot2 = slot2.Inst
	slot3 = slot2
	slot2 = slot2.loadAssetBundleSync
	slot4 = "emojis"
	slot2 = slot2(slot3, slot4)
	slot3 = GetComponent
	slot4 = slot0
	slot5 = "TextMesh"
	slot3 = slot3(slot4, slot5)
	slot4 = GetComponent
	slot5 = slot0
	slot6 = "MeshRenderer"
	slot4 = slot4(slot5, slot6)
	slot5 = Shader
	slot5 = slot5.Find
	slot6 = "Unlit/Transparent"
	slot5 = slot5(slot6)
	slot6 = slot4.materials
	slot7 = {}
	slot8 = slot6[0]
	slot7[1] = slot8
	slot8 = {}
	slot9 = 0
	slot10 = string
	slot10 = slot10.gsub
	slot11 = slot1
	slot12 = "#(%d+)#"

	function slot13(slot0)
		slot1 = uv0
		slot1 = slot1[slot0]

		if not slot1 then
			slot2 = uv1
			slot2 = slot2 + 1
			uv1 = slot2
			slot2 = Material
			slot2 = slot2.New
			slot3 = uv2
			slot2 = slot2(slot3)
			slot3 = ResourceMgr
			slot3 = slot3.Inst
			slot4 = slot3
			slot3 = slot3.LoadAssetSync
			slot5 = uv3
			slot6 = "emoji"
			slot7 = slot0
			slot6 = slot6 .. slot7
			slot7 = false
			slot8 = false
			slot3 = slot3(slot4, slot5, slot6, slot7, slot8)
			slot2.mainTexture = slot3
			slot4 = table
			slot4 = slot4.insert
			slot5 = uv4
			slot6 = slot2

			slot4(slot5, slot6)

			slot4 = uv0
			slot5 = uv1
			slot4[slot0] = slot5
			slot1 = uv1
		end

		slot2 = "<quad material="
		slot3 = uv1
		slot4 = " />"
		slot2 = slot2 .. slot3 .. slot4

		return slot2
	end

	slot10 = slot10(slot11, slot12, slot13)
	slot3.text = slot10
	slot4.materials = slot7
	slot11 = ResourceMgr
	slot11 = slot11.Inst
	slot12 = slot11
	slot11 = slot11.ClearBundleRef
	slot13 = "emojis"
	slot14 = false
	slot15 = false

	slot11(slot12, slot13, slot14, slot15)
end

emojiText = slot2

function slot2(slot0, slot1)
	slot2 = LoadSprite
	slot3 = "painting/"
	slot4 = slot1
	slot3 = slot3 .. slot4
	slot2 = slot2(slot3)

	if not slot2 then
		slot2 = LoadSprite
		slot3 = "painting/unknown"
		slot2 = slot2(slot3)
	end

	slot3 = setImageSprite
	slot4 = slot0
	slot5 = slot2

	slot3(slot4, slot5)

	slot3 = resetAspectRatio
	slot4 = slot0

	slot3(slot4)
end

setPaintingImg = slot2

function slot2(slot0, slot1, slot2)
	removeAllChildren(slot3)

	GetOrAddComponent(slot3, "PaintingScaler").FrameName = slot2 or ""
	GetOrAddComponent(slot3, "PaintingScaler").Tween = 1

	PoolMgr.GetInstance():GetPainting(slot1, false, function (slot0)
		setParent(slot0, uv0, false)

		if not IsNil(findTF(slot0, "Touch")) then
			setActive(slot1, false)
		end

		Ship.SetExpression(uv0:GetChild(0), uv1)
	end)
end

setPaintingPrefab = slot2
slot2 = {}

function slot3(slot0, slot1, slot2, slot3)
	removeAllChildren(slot4)

	GetOrAddComponent(slot4, "PaintingScaler").FrameName = slot2 or ""
	GetOrAddComponent(slot4, "PaintingScaler").Tween = 1
	uv0[slot0] = slot1

	PoolMgr.GetInstance():GetPainting(slot1, true, function (slot0)
		if IsNil(uv0) or uv1[uv0] ~= uv2 then
			PoolMgr.GetInstance():ReturnPainting(uv2, slot0)
		else
			setParent(slot0, uv3, false)

			uv1[uv0] = nil

			Ship.SetExpression(slot0, uv2)
		end

		if not IsNil(findTF(slot0, "Touch")) then
			setActive(slot1, false)
		end

		if uv4 then
			uv4()
		end
	end)
end

setPaintingPrefabAsync = slot3

function slot3(slot0, slot1)
	if slot0 and slot1 then
		slot2 = findTF
		slot3 = slot0
		slot4 = "fitter"
		slot2 = slot2(slot3, slot4)

		if slot2 then
			slot3 = slot2.childCount
			slot4 = 0

			if slot3 > slot4 then
				slot4 = slot2
				slot3 = slot2.GetChild
				slot5 = 0
				slot3 = slot3(slot4, slot5)
				slot4 = IsNil
				slot5 = slot3
				slot4 = slot4(slot5)

				if not slot4 then
					slot4 = findTF
					slot5 = slot3
					slot6 = "Touch"
					slot4 = slot4(slot5, slot6)
					slot5 = IsNil
					slot6 = slot4
					slot5 = slot5(slot6)

					if not slot5 then
						slot5 = eachChild
						slot6 = slot4

						function slot7(slot0)
							slot2 = slot0
							slot1 = slot0.GetComponent
							slot3 = typeof
							slot4 = Button
							slot1 = slot1(slot2, slot3(slot4))
							slot2 = IsNil
							slot3 = slot1
							slot2 = slot2(slot3)

							if not slot2 then
								slot2 = Object
								slot2 = slot2.Destroy
								slot3 = slot1

								slot2(slot3)
							end
						end

						slot5(slot6, slot7)
					end

					slot5 = PoolMgr
					slot5 = slot5.GetInstance
					slot5 = slot5()
					slot6 = slot5
					slot5 = slot5.ReturnPainting
					slot7 = slot1
					slot8 = slot3.gameObject

					slot5(slot6, slot7, slot8)
				end
			end
		end

		slot3 = uv0
		slot4 = nil
		slot3[slot0] = slot4
	end
end

retPaintingPrefab = slot3

function slot3(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	slot3 = setText
	slot4 = slot0
	slot5 = string
	slot5 = slot5.format

	slot3(slot4, slot5("<color=" .. COLOR_RED .. ">%d</color>/%d" or "%d/%d", slot1, slot2))
end

setColorCount = slot3

function slot3(slot0, slot1)
	slot2 = "<color="
	slot3 = slot1
	slot4 = ">"
	slot5 = slot0
	slot6 = "</color>"
	slot2 = slot2 .. slot3 .. slot4 .. slot5 .. slot6

	return slot2
end

setColorStr = slot3

function slot3(slot0, slot1)
	slot2 = string
	slot2 = slot2.gsub
	slot3 = slot0
	slot4 = "[<]size=%d+[>]"
	slot5 = "<size="
	slot6 = slot1
	slot7 = ">"
	slot5 = slot5 .. slot6 .. slot7
	slot2, slot3 = slot2(slot3, slot4, slot5)

	if slot3 == 0 then
		slot4 = "<size="
		slot5 = slot1
		slot6 = ">"
		slot7 = slot2
		slot8 = "</size>"
		slot2 = slot4 .. slot5 .. slot6 .. slot7 .. slot8
	end

	return slot2
end

setSizeStr = slot3

function slot3(slot0)
	if not slot0 then
		return
	end

	slot1, slot2 = nil
	slot3 = string
	slot3 = slot3.gsub
	slot4 = slot0
	slot5 = "event:/cv/(.+)/(.+)"

	function slot6(slot0, slot1)
		uv0 = "cv-" .. slot0 .. (tobool(Ship.CVBattleKey[string.gsub(slot1, "_%w+", "")]) and "-battle" or "")
		uv1 = slot1
	end

	slot3(slot4, slot5, slot6)

	if slot1 and slot2 then
		slot3 = pg
		slot3 = slot3.CriMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.PlayCV
		slot5 = slot1
		slot6 = slot2

		return slot3(slot4, slot5, slot6)
	else
		slot2 = slot0
		slot3 = string
		slot3 = slot3.gsub
		slot4 = slot2
		slot5 = "event:/(battle)/(.+)"
		slot6 = "%1-%2"
		slot3 = slot3(slot4, slot5, slot6)
		slot2 = slot3
		slot3 = string
		slot3 = slot3.gsub
		slot4 = slot2
		slot5 = "event:/(ui)/(.+)"
		slot6 = "%1-%2"
		slot3 = slot3(slot4, slot5, slot6)
		slot2 = slot3
		slot3 = pg
		slot3 = slot3.CriMgr
		slot3 = slot3.GetInstance
		slot3 = slot3()
		slot4 = slot3
		slot3 = slot3.PlaySE
		slot5 = slot2

		return slot3(slot4, slot5)
	end
end

playSoundEffect = slot3

function slot3(slot0)
	slot1 = pg
	slot1 = slot1.CriMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.PlayBGM
	slot3 = slot0

	slot1(slot2, slot3)
end

playBGM = slot3

function slot3(slot0, slot1)
	slot2 = pg
	slot2 = slot2.StoryMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.Play
	slot4 = slot0
	slot5 = slot1

	slot2(slot3, slot4, slot5)
end

playStory = slot3

function slot3(slot0)
end

playStorySound = slot3

function slot3()
end

stopStorySound = slot3

function slot3(slot0)
	slot1 = ERROR_MESSAGE
	slot1 = slot1[slot0]

	if slot1 == nil then
		slot2 = ERROR_MESSAGE
		slot3 = 9999
		slot2 = slot2[slot3]
		slot3 = ":"
		slot4 = slot0
		slot1 = slot2 .. slot3 .. slot4
	end

	return slot1
end

errorMessage = slot3

function slot3(slot0, slot1, ...)
	slot2 = pg
	slot2 = slot2.gametip
	slot3 = slot0
	slot4 = "_error"
	slot3 = slot3 .. slot4
	slot2 = slot2[slot3]
	slot3 = nil

	if slot2 then
		slot3 = slot2.tip
	else
		slot4 = pg
		slot4 = slot4.gametip
		slot4 = slot4.common_error
		slot3 = slot4.tip
	end

	slot4 = slot0
	slot5 = "_error_"
	slot6 = slot1
	slot4 = slot4 .. slot5 .. slot6
	slot5 = pg
	slot5 = slot5.gametip
	slot5 = slot5[slot4]

	if slot5 then
		slot5 = i18n
		slot6 = slot4
		slot5 = slot5(slot6, ...)
		slot6 = slot3
		slot7 = slot5
		slot6 = slot6 .. slot7

		return slot6
	else
		slot5 = "common_error_"
		slot6 = slot1
		slot4 = slot5 .. slot6
		slot5 = pg
		slot5 = slot5.gametip
		slot5 = slot5[slot4]

		if slot5 then
			slot5 = i18n
			slot6 = slot4
			slot5 = slot5(slot6, ...)
			slot6 = slot3
			slot7 = slot5
			slot6 = slot6 .. slot7

			return slot6
		else
			slot5 = errorMessage
			slot6 = slot1
			slot5 = slot5(slot6)
			slot6 = slot3
			slot7 = slot1
			slot8 = ":"
			slot9 = slot5
			slot6 = slot6 .. slot7 .. slot8 .. slot9

			return slot6
		end
	end
end

errorTip = slot3

function slot3(slot0, slot1)
	slot2 = "@COLOR_SCOPE"
	slot3 = {}
	slot4 = string
	slot4 = slot4.gsub
	slot5 = slot0
	slot6 = "<color=#%x+>"

	function slot7(slot0)
		slot1 = table
		slot1 = slot1.insert
		slot2 = uv0
		slot3 = slot0

		slot1(slot2, slot3)

		slot1 = uv1

		return slot1
	end

	slot4 = slot4(slot5, slot6, slot7)
	slot0 = slot4
	slot4 = string
	slot4 = slot4.gsub
	slot5 = slot0
	slot6 = "%d+%.?%d*%%*"

	function slot7(slot0)
		slot1 = "<color="
		slot2 = uv0
		slot3 = ">"
		slot4 = slot0
		slot5 = "</color>"
		slot1 = slot1 .. slot2 .. slot3 .. slot4 .. slot5

		return slot1
	end

	slot4 = slot4(slot5, slot6, slot7)
	slot0 = slot4
	slot4 = #slot3
	slot5 = 0

	if slot4 > slot5 then
		slot4 = 0
		slot5 = string
		slot5 = slot5.gsub
		slot6 = slot0
		slot7 = slot2

		function slot8(slot0)
			slot1 = uv0
			slot1 = slot1 + 1
			uv0 = slot1
			slot1 = uv1
			slot2 = uv0
			slot1 = slot1[slot2]

			return slot1
		end

		slot5 = slot5(slot6, slot7, slot8)

		return slot5
		return
	end

	return slot0
end

colorNumber = slot3

function slot3(slot0)
	slot1 = LuaHelper
	slot1 = slot1.GetWorldCorners
	slot2 = rtf
	slot3 = slot0
	slot1 = slot1(slot2(slot3))
	slot2 = Bounds
	slot2 = slot2.New
	slot3 = slot1[0]
	slot4 = Vector3
	slot4 = slot4.zero
	slot2 = slot2(slot3, slot4)
	slot4 = slot2
	slot3 = slot2.Encapsulate
	slot5 = slot1[2]

	slot3(slot4, slot5)

	return slot2
end

getBounds = slot3

function slot3(slot0, slot1, slot2)
	slot3 = Vector3
	slot3 = slot3.one
	slot0.localScale = slot3
	slot3 = Vector2
	slot3 = slot3.zero
	slot0.anchorMin = slot3
	slot3 = Vector2
	slot3 = slot3.one
	slot0.anchorMax = slot3

	if slot2 then
		slot3 = Vector2
		slot4 = slot2[1]
		slot5 = slot2[2]
		slot3 = slot3(slot4, slot5)
		slot0.offsetMin = slot3
		slot3 = Vector2
		slot4 = slot2[3]
		slot4 = -slot4
		slot5 = slot2[4]
		slot5 = -slot5
		slot3 = slot3(slot4, slot5)
		slot0.offsetMax = slot3
	elseif slot1 then
		slot3 = Vector2
		slot3 = slot3.zero
		slot0.offsetMin = slot3
		slot3 = Vector2
		slot3 = slot3.zero
		slot0.offsetMax = slot3
	else
		slot3 = Vector2
		slot4 = 2
		slot5 = 2
		slot3 = slot3(slot4, slot5)
		slot0.offsetMin = slot3
		slot3 = Vector2
		slot4 = -2
		slot5 = -2
		slot3 = slot3(slot4, slot5)
		slot0.offsetMax = slot3
	end
end

setIconOrFrameSize = slot3

function slot3(slot0, slot1, slot2)
	slot3 = setImageColor
	slot4 = slot0
	slot5 = Color
	slot6 = 1
	slot7 = 1
	slot8 = 1
	slot9 = 1

	slot3(slot4, slot5(slot6, slot7, slot8, slot9))

	slot3 = setImageSprite
	slot4 = slot0
	slot5 = GetSpriteFromAtlas
	slot6 = "weaponframes"
	slot7 = "frame"

	slot3(slot4, slot5(slot6, slot7))

	if not slot2 then
		slot3 = string
		slot3 = slot3.sub
		slot4 = slot1
		slot5 = 1
		slot6 = 1
		slot3 = slot3(slot4, slot5, slot6)

		if slot3 ~= "0" then
			slot3 = tonumber
			slot4 = slot1
			slot3 = slot3(slot4)
			slot4 = 5

			if slot3 > slot4 then
				slot3 = findTF
				slot4 = slot0
				slot5 = "specialFrame"
				slot3 = slot3(slot4, slot5)

				if not slot3 then
					slot4 = cloneTplTo
					slot5 = slot0
					slot6 = slot0
					slot7 = "specialFrame"
					slot4 = slot4(slot5, slot6, slot7)
					slot3 = slot4
					slot4 = Vector3
					slot4 = slot4.one
					slot3.localScale = slot4
					slot4 = Vector2
					slot4 = slot4.zero
					slot3.anchorMin = slot4
					slot4 = Vector2
					slot4 = slot4.one
					slot3.anchorMax = slot4
				end

				if not slot2 then
					slot4 = "frame"
					slot5 = slot1
					slot2 = slot4 .. slot5
				end

				slot4 = string
				slot4 = slot4.sub
				slot5 = slot1
				slot6 = 1
				slot7 = 1
				slot4 = slot4(slot5, slot6, slot7)

				if slot4 == "0" then
					slot4 = Vector2
					slot5 = -8
					slot6 = -8.5
					slot4 = slot4(slot5, slot6)
					slot3.offsetMin = slot4
					slot4 = Vector2
					slot5 = 8
					slot6 = 8
					slot4 = slot4(slot5, slot6)
					slot3.offsetMax = slot4
				elseif slot2 == "frame7" then
					slot4 = Vector2
					slot5 = -16.5
					slot6 = -2.5
					slot4 = slot4(slot5, slot6)
					slot3.offsetMin = slot4
					slot4 = Vector2
					slot5 = 3.5
					slot6 = 16.5
					slot4 = slot4(slot5, slot6)
					slot3.offsetMax = slot4
				elseif slot2 == "frame_npc" then
					slot4 = Vector2
					slot5 = -4
					slot6 = -4
					slot4 = slot4(slot5, slot6)
					slot3.offsetMin = slot4
					slot4 = Vector2
					slot5 = 4
					slot6 = 4
					slot4 = slot4(slot5, slot6)
					slot3.offsetMax = slot4
				elseif slot2 == "frame_prop" then
					slot4 = Vector2
					slot5 = -11
					slot6 = -12
					slot4 = slot4(slot5, slot6)
					slot3.offsetMin = slot4
					slot4 = Vector2
					slot5 = 14
					slot6 = 14
					slot4 = slot4(slot5, slot6)
					slot3.offsetMax = slot4
				else
					slot4 = Vector2
					slot5 = -16.5
					slot6 = -2.5
					slot4 = slot4(slot5, slot6)
					slot3.offsetMin = slot4
					slot4 = Vector2
					slot5 = 3.5
					slot6 = 16.5
					slot4 = slot4(slot5, slot6)
					slot3.offsetMax = slot4
				end

				slot4 = setImageSprite
				slot5 = slot3
				slot6 = GetSpriteFromAtlas
				slot7 = "weaponframes"
				slot8 = slot2

				slot4(slot5, slot6(slot7, slot8))

				slot4 = setActive
				slot5 = slot3
				slot6 = true

				slot4(slot5, slot6)
			else
				slot3 = setImageColor
				slot4 = slot0
				slot5 = shipRarity2FrameColor
				slot6 = slot1 + 1

				slot3(slot4, slot5(slot6))

				slot3 = findTF
				slot4 = slot0
				slot5 = "specialFrame"
				slot3 = slot3(slot4, slot5)

				if slot3 then
					slot4 = setActive
					slot5 = slot3
					slot6 = false

					slot4(slot5, slot6)
				end
			end
		end
	end
end

setFrame = slot3

function slot3(slot0, slot1, slot2)
	function slot3(slot0, slot1)
		slot2 = findTF
		slot3 = uv0
		slot4 = "icon_bg/"
		slot5 = slot0
		slot6 = "(Clone)"
		slot4 = slot4 .. slot5 .. slot6
		slot2 = slot2(slot3, slot4)

		if slot2 then
			slot3 = setActive
			slot4 = slot2
			slot5 = slot1

			slot3(slot4, slot5)
		elseif slot1 then
			slot3 = PoolMgr
			slot3 = slot3.GetInstance
			slot3 = slot3()
			slot4 = slot3
			slot3 = slot3.GetPrefab
			slot5 = "ui/"
			slot6 = string
			slot6 = slot6.lower
			slot7 = slot0
			slot6 = slot6(slot7)
			slot5 = slot5 .. slot6
			slot6 = ""
			slot7 = true

			function slot8(slot0)
				slot1 = setParent
				slot2 = slot0
				slot3 = uv0
				slot4 = slot3
				slot3 = slot3.Find
				slot5 = "icon_bg"

				slot1(slot2, slot3(slot4, slot5))

				slot1 = uv0
				slot2 = slot1
				slot1 = slot1.Find
				slot3 = "icon_bg/stars"
				slot1 = slot1(slot2, slot3)

				if slot1 then
					slot3 = slot1
					slot2 = slot1.SetAsLastSibling

					slot2(slot3)
				end

				slot2 = setActive
				slot3 = slot0
				slot4 = uv1

				slot2(slot3, slot4)
			end

			slot3(slot4, slot5, slot6, slot7, slot8)
		end
	end

	slot4 = slot3
	slot5 = "IconColorful"

	if slot1 == 6 then
		slot6 = slot2.noIconColorful
		slot6 = not slot6
	else
		slot6 = false

		if false then
			slot6 = true
		end
	end

	slot4(slot5, slot6)
	slot3("Item_duang5", slot1 >= 5 and slot2.fromAwardLayer)
end

setIconColorful = slot3

function slot3(slot0, slot1, slot2)
	slot3 = findTF
	slot4 = slot1
	slot5 = "icon_bg/startpl"
	slot3 = slot3(slot4, slot5)
	slot4 = findTF
	slot5 = slot1
	slot6 = "icon_bg/stars"
	slot4 = slot4(slot5, slot6)

	if slot4 and slot3 then
		slot5 = setActive
		slot6 = slot4
		slot7 = false

		slot5(slot6, slot7)

		slot5 = setActive
		slot6 = slot3
		slot7 = false

		slot5(slot6, slot7)
	end

	if not slot4 or not slot0 then
		return
	end

	slot5 = 1
	slot6 = math
	slot6 = slot6.max
	slot7 = slot2
	slot8 = slot4.childCount
	slot6 = slot6(slot7, slot8)
	slot7 = 1

	for slot8 = slot5, slot6, slot7 do
		slot9 = setActive
		slot10 = slot4.childCount

		if slot10 < slot8 then
			slot10 = cloneTplTo
			slot11 = slot3
			slot12 = slot4
			slot10 = slot10(slot11, slot12)

			if not slot10 then
				slot11 = slot4
				slot10 = slot4.GetChild
				slot12 = slot8 - 1
				slot10 = slot10(slot11, slot12)
			end
		end

		slot9(slot10, slot8 <= slot2)
	end

	slot5 = setActive
	slot6 = slot4
	slot7 = true

	slot5(slot6, slot7)
end

setStars = slot3

function slot3(slot0, slot1, slot2)
	slot2 = slot2 or {}

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. EquipmentRarity.Rarity2Print(slot1.config.rarity)))
	setFrame(findTF(slot0, "icon_bg/frame"), slot3)

	slot4 = findTF(slot0, "icon_bg/icon")
	slot4.anchorMin = Vector2.zero
	slot4.anchorMax = Vector2.one
	slot4.offsetMin = Vector2(16, 16)
	slot4.offsetMax = Vector2(-16, -16)

	GetImageSpriteFromAtlasAsync("equips/" .. slot1.config.icon, "", slot4)
	setStars(true, slot0, slot1.config.rarity)

	if not IsNil(findTF(slot0, "name")) then
		slot6 = setText
		slot7 = slot5
		slot8 = slot1.config
		slot8 = slot8.name

		slot6(slot7, slot8)
	end

	slot6 = slot1.config
	slot6 = slot6.level
	slot6 = slot6 - 1
	slot7 = findTF
	slot8 = slot0
	slot9 = "icon_bg/slv"
	slot7 = slot7(slot8, slot9)
	slot8 = IsNil
	slot9 = slot7
	slot8 = slot8(slot9)

	if not slot8 then
		slot8 = 0

		if slot6 > slot8 then
			slot8 = setActive
			slot9 = slot7
			slot10 = true

			slot8(slot9, slot10)

			slot8 = setText
			slot9 = findTF
			slot10 = slot0
			slot11 = "icon_bg/slv/Text"
			slot9 = slot9(slot10, slot11)
			slot10 = slot6

			slot8(slot9, slot10)
		else
			slot8 = setActive
			slot9 = slot7
			slot10 = false

			slot8(slot9, slot10)
		end
	end

	slot8 = slot1.count
	slot9 = findTF
	slot10 = slot0
	slot11 = "icon_bg/count"
	slot9 = slot9(slot10, slot11)
	slot10 = IsNil
	slot11 = slot9
	slot10 = slot10(slot11)

	if not slot10 then
		setText(slot9, slot8 > 0 and slot8 or "")
	end

	slot10 = slot1.config
	slot10 = slot10.rarity
	slot11 = setIconColorful
	slot12 = slot0
	slot13 = slot10
	slot14 = slot2

	slot11(slot12, slot13, slot14)
end

updateEquipment = slot3

function slot3(slot0, slot1, slot2)
	slot2 = slot2 or {}

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. ItemRarity.Rarity2Print(pg.item_data_statistics[slot1.id].rarity)))

	slot5 = nil

	if pg.item_data_statistics[slot1.id].type == 9 then
		slot5 = "frame6"
	end

	setFrame(findTF(slot0, "icon_bg/frame"), slot4, slot5)
	GetImageSpriteFromAtlasAsync(slot1.icon or slot3.icon, "", findTF(slot0, "icon_bg/icon"))
	setStars(false, slot0)

	if not IsNil(findTF(slot0, "name")) then
		slot8 = setText
		slot9 = slot7
		slot10 = HXSet
		slot10 = slot10.hxLan
		slot11 = slot3.name

		slot8(slot9, slot10(slot11))
	end

	slot8 = slot3.rarity
	slot8 = slot8 + 1
	slot9 = setIconColorful
	slot10 = slot0
	slot11 = slot8
	slot12 = slot2

	slot9(slot10, slot11, slot12)
end

updateItem = slot3

function slot3(slot0, slot1, slot2)
	slot2 = slot2 or {}

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. ItemRarity.Rarity2Print(pg.world_item_data_template[slot1.id].rarity)))
	setFrame(findTF(slot0, "icon_bg/frame"), slot4)
	GetImageSpriteFromAtlasAsync(slot1.icon or pg.world_item_data_template[slot1.id].icon, "", findTF(slot0, "icon_bg/icon"))
	setStars(false, slot0)

	if not IsNil(findTF(slot0, "name")) then
		slot7 = setText
		slot8 = slot6
		slot9 = HXSet
		slot9 = slot9.hxLan
		slot10 = slot3.name

		slot7(slot8, slot9(slot10))
	end

	slot7 = slot3.rarity
	slot7 = slot7 + 1
	slot8 = setIconColorful
	slot9 = slot0
	slot10 = slot7
	slot11 = slot2

	slot8(slot9, slot10, slot11)
end

updateWorldItem = slot3

function slot3(slot0, slot1, slot2)
	slot3 = slot2 or {}
	slot4 = slot1:getRarity()

	if slot1.remoulded then
		slot4 = slot4 + 1
	end

	slot6 = slot1
	slot5 = slot1.rarity2bgPrint
	slot5 = slot5(slot6)
	slot7 = slot1
	slot6 = slot1.getPainting
	slot6 = slot6(slot7)
	slot7 = getProxy
	slot8 = ShipSkinProxy
	slot7 = slot7(slot8)
	slot8 = slot3.anonymous

	if slot8 then
		slot5 = "1"
		slot6 = "unknown"
	end

	slot8 = findTF
	slot9 = slot0
	slot10 = "icon_bg/new"
	slot8 = slot8(slot9, slot10)

	if slot8 then
		slot9 = slot3.isSkin

		if slot9 then
			slot9 = setActive
			slot10 = slot8
			slot12 = slot7
			slot11 = slot7.hasOldSkin
			slot13 = slot1.skinId
			slot11 = slot11(slot12, slot13)
			slot11 = not slot11

			slot9(slot10, slot11)
		else
			slot9 = setActive
			slot10 = slot8
			slot11 = slot1.virgin

			slot9(slot10, slot11)
		end
	end

	setImageSprite(slot9, GetSpriteFromAtlas("weaponframes", "bg" .. (slot3.isSkin and "-skin" or slot5)))

	slot10 = findTF(slot0, "icon_bg/frame")
	slot11 = nil

	if slot1.isNpc then
		slot11 = "frame_npc"
	else
		slot12 = slot1.propose

		if slot12 then
			slot11 = "frame_prop"
		else
			slot12 = slot3.isSkin

			if slot12 then
				slot11 = "frame7"
			end
		end
	end

	slot12 = setFrame
	slot13 = slot10
	slot14 = slot5
	slot15 = slot11

	slot12(slot13, slot14, slot15)

	slot12 = slot3.gray

	if slot12 then
		slot12 = setGray
		slot13 = slot9
		slot14 = true
		slot15 = true

		slot12(slot13, slot14, slot15)
	end

	slot12 = findTF
	slot13 = slot0
	slot14 = "icon_bg/icon"
	slot12 = slot12(slot13, slot14)
	slot13 = GetImageSpriteFromAtlasAsync
	slot14 = slot3.Q

	if slot14 then
		slot14 = "QIcon/"
	else
		slot14 = "SquareIcon/"
		slot15 = slot6
		slot14 = slot14 .. slot15
	end

	slot15 = ""
	slot16 = slot12

	slot13(slot14, slot15, slot16)

	slot13 = findTF
	slot14 = slot0
	slot15 = "icon_bg/lv"
	slot13 = slot13(slot14, slot15)

	if slot13 then
		slot14 = setActive
		slot15 = slot13
		slot16 = slot1.isNpc
		slot16 = not slot16

		slot14(slot15, slot16)

		slot14 = slot1.isNpc

		if not slot14 then
			slot14 = findTF
			slot15 = slot13
			slot16 = "Text"
			slot14 = slot14(slot15, slot16)

			if slot14 then
				slot15 = slot1.level

				if slot15 then
					slot15 = setText
					slot16 = slot14
					slot17 = slot1.level

					slot15(slot16, slot17)
				end
			end
		end
	end

	slot14 = findTF
	slot15 = slot0
	slot16 = "name"
	slot14 = slot14(slot15, slot16)
	slot15 = IsNil
	slot16 = slot14
	slot15 = slot15(slot16)

	if not slot15 then
		slot15 = setActive
		slot16 = slot14
		slot17 = slot3.hideName
		slot17 = not slot17

		slot15(slot16, slot17)

		slot15 = slot3.hideName

		if not slot15 then
			slot15 = setText
			slot16 = slot14
			slot18 = slot1
			slot17 = slot1.getName

			slot15(slot16, slot17(slot18))
		end
	end

	slot15 = setStars
	slot16 = slot3.initStar
	slot17 = slot0
	slot19 = slot1
	slot18 = slot1.getStar

	slot15(slot16, slot17, slot18(slot19))

	slot15 = findTF
	slot16 = slot0
	slot17 = "ship_type"
	slot15 = slot15(slot16, slot17)

	if slot15 then
		slot16 = setActive
		slot17 = slot15
		slot18 = true

		slot16(slot17, slot18)

		slot17 = slot15
		slot16 = slot15.GetComponent
		slot18 = typeof
		slot19 = Image
		slot16 = slot16(slot17, slot18(slot19))
		slot17 = GetSpriteFromAtlas
		slot18 = "shiptype"
		slot19 = shipType2print
		slot21 = slot1
		slot20 = slot1.getShipType
		slot17 = slot17(slot18, slot19(slot20(slot21)))
		slot16.sprite = slot17
	end

	slot17 = slot9
	slot16 = slot9.Find
	slot18 = "npc"
	slot16 = slot16(slot17, slot18)
	slot17 = IsNil
	slot18 = slot16
	slot17 = slot17(slot18)

	if not slot17 then
		if slot8 then
			slot17 = go
			slot18 = slot8
			slot17 = slot17(slot18)
			slot17 = slot17.activeSelf

			if slot17 then
				slot17 = setActive
				slot18 = slot16
				slot19 = false

				slot17(slot18, slot19)
			end
		else
			slot17 = setActive
			slot18 = slot16
			slot20 = slot1
			slot19 = slot1.isActivityNpc

			slot17(slot18, slot19(slot20))
		end
	end
end

updateShip = slot3

function slot3(slot0, slot1, slot2)
	slot5 = ShipRarity.Rarity2Print(slot4)
	slot6 = slot1:getPainting()

	if slot2 or {}.anonymous then
		slot5 = 1
		slot6 = "unknown"
	end

	setImageSprite(slot7, GetSpriteFromAtlas("weaponframes", "bg" .. (slot3.isSkin and "-skin" or slot5)))
	setFrame(findTF(slot0, "icon_bg/frame"), slot5)

	if slot3.gray then
		slot9 = setGray
		slot10 = slot7
		slot11 = true
		slot12 = true

		slot9(slot10, slot11, slot12)
	end

	slot9 = findTF
	slot10 = slot0
	slot11 = "icon_bg/icon"
	slot9 = slot9(slot10, slot11)
	slot10 = GetImageSpriteFromAtlasAsync
	slot11 = slot3.Q

	if slot11 then
		slot11 = "QIcon/"
	else
		slot11 = "SquareIcon/"
		slot12 = slot6
		slot11 = slot11 .. slot12
	end

	slot12 = ""
	slot13 = slot9

	slot10(slot11, slot12, slot13)

	slot10 = findTF
	slot11 = slot0
	slot12 = "icon_bg/lv"
	slot10 = slot10(slot11, slot12)

	if slot10 then
		slot11 = setActive
		slot12 = slot10
		slot13 = true

		slot11(slot12, slot13)

		slot11 = findTF
		slot12 = slot10
		slot13 = "Text"
		slot11 = slot11(slot12, slot13)

		if slot11 then
			slot12 = slot1.level

			if slot12 then
				slot12 = setText
				slot13 = slot11
				slot14 = slot1.level

				slot12(slot13, slot14)
			end
		end
	end

	slot11 = findTF
	slot12 = slot0
	slot13 = "name"
	slot11 = slot11(slot12, slot13)
	slot12 = IsNil
	slot13 = slot11
	slot12 = slot12(slot13)

	if not slot12 then
		slot12 = setActive
		slot13 = slot11
		slot14 = slot3.hideName
		slot14 = not slot14

		slot12(slot13, slot14)

		slot12 = slot3.hideName

		if not slot12 then
			slot12 = setText
			slot13 = slot11
			slot15 = slot1
			slot14 = slot1.getName

			slot12(slot13, slot14(slot15))
		end
	end

	slot12 = setStars
	slot13 = slot3.initStar
	slot14 = slot0
	slot16 = slot1
	slot15 = slot1.getStar

	slot12(slot13, slot14, slot15(slot16))

	slot12 = findTF
	slot13 = slot0
	slot14 = "ship_type"
	slot12 = slot12(slot13, slot14)

	if slot12 then
		slot13 = setActive
		slot14 = slot12
		slot15 = true

		slot13(slot14, slot15)

		slot14 = slot12
		slot13 = slot12.GetComponent
		slot15 = typeof
		slot16 = Image
		slot13 = slot13(slot14, slot15(slot16))
		slot14 = GetSpriteFromAtlas
		slot15 = "shiptype"
		slot16 = shipType2print
		slot18 = slot1
		slot17 = slot1.getShipType
		slot14 = slot14(slot15, slot16(slot17(slot18)))
		slot13.sprite = slot14
	end
end

updateCommander = slot3

function slot3(slot0, slot1)
	slot2 = pg
	slot2 = slot2.strategy_data_template
	slot3 = slot1.id
	slot2 = slot2[slot3]
	slot3 = ItemRarity
	slot3 = slot3.Rarity2Print
	slot4 = ItemRarity
	slot4 = slot4.Gray
	slot3 = slot3(slot4)
	slot4 = setImageSprite
	slot5 = findTF
	slot6 = slot0
	slot7 = "icon_bg"
	slot5 = slot5(slot6, slot7)
	slot6 = GetSpriteFromAtlas
	slot7 = "weaponframes"
	slot8 = "bg"
	slot9 = slot3
	slot8 = slot8 .. slot9

	slot4(slot5, slot6(slot7, slot8))

	slot4 = setFrame
	slot5 = findTF
	slot6 = slot0
	slot7 = "icon_bg/frame"
	slot5 = slot5(slot6, slot7)
	slot6 = slot3

	slot4(slot5, slot6)

	slot4 = findTF
	slot5 = slot0
	slot6 = "icon_bg/icon"
	slot4 = slot4(slot5, slot6)
	slot5 = GetImageSpriteFromAtlasAsync
	slot6 = "strategyicon/"
	slot7 = slot2.icon
	slot6 = slot6 .. slot7
	slot7 = ""
	slot8 = slot4

	slot5(slot6, slot7, slot8)

	slot5 = setStars
	slot6 = false
	slot7 = slot0

	slot5(slot6, slot7)

	slot5 = findTF
	slot6 = slot0
	slot7 = "name"
	slot5 = slot5(slot6, slot7)
	slot6 = IsNil
	slot7 = slot5
	slot6 = slot6(slot7)

	if not slot6 then
		slot6 = setText
		slot7 = slot5
		slot8 = HXSet
		slot8 = slot8.hxLan
		slot9 = slot2.name

		slot6(slot7, slot8(slot9))
	end
end

updateStrategy = slot3

function slot3(slot0, slot1, slot2)
	slot2 = slot2 or {}

	if not ItemRarity.Rarity2Print(pg.furniture_data_template[slot1].rarity) then
		slot4 = ItemRarity
		slot4 = slot4.Gray
	end

	slot5 = setImageSprite
	slot6 = findTF
	slot7 = slot0
	slot8 = "icon_bg"
	slot6 = slot6(slot7, slot8)
	slot7 = GetSpriteFromAtlas
	slot8 = "weaponframes"
	slot9 = "bg"
	slot10 = slot4
	slot9 = slot9 .. slot10

	slot5(slot6, slot7(slot8, slot9))

	slot5 = setFrame
	slot6 = findTF
	slot7 = slot0
	slot8 = "icon_bg/frame"
	slot6 = slot6(slot7, slot8)
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = findTF
	slot6 = slot0
	slot7 = "icon_bg/icon"
	slot5 = slot5(slot6, slot7)
	slot6 = GetImageSpriteFromAtlasAsync
	slot7 = "furnitureicon/"
	slot8 = slot3.icon
	slot7 = slot7 .. slot8
	slot8 = ""
	slot9 = slot5

	slot6(slot7, slot8, slot9)

	slot6 = setStars
	slot7 = false
	slot8 = slot0

	slot6(slot7, slot8)

	slot6 = findTF
	slot7 = slot0
	slot8 = "name"
	slot6 = slot6(slot7, slot8)
	slot7 = IsNil
	slot8 = slot6
	slot7 = slot7(slot8)

	if not slot7 then
		slot7 = setText
		slot8 = slot6
		slot9 = HXSet
		slot9 = slot9.hxLan
		slot10 = slot3.name

		slot7(slot8, slot9(slot10))
	end

	setIconColorful(slot0, (slot3.rarity or 0) + 1, slot2)
end

updateFurniture = slot3
slot3 = nil

function slot4(slot0)
	slot1 = #slot0

	if slot1 == 0 then
		slot1 = false

		return slot1
	end

	slot1 = slot0[1]
	slot1 = slot1.canvasRect
	slot2 = 1
	slot3 = #slot0
	slot4 = 1

	for slot5 = slot2, slot3, slot4 do
		slot6 = rectIntersect
		slot7 = slot1
		slot8 = slot0[slot5]
		slot8 = slot8.canvasRect
		slot6 = slot6(slot7, slot8)
		slot1 = slot6
	end

	slot2 = slot1.width
	slot3 = 0

	if slot2 > slot3 then
		slot2 = slot1.height
		slot3 = 0

		if slot2 <= slot3 then
			slot2 = false

			return slot2
		end
	end

	slot2 = uv0

	if not slot2 then
		slot2 = GameObject
		slot2 = slot2.Find
		slot3 = "UICamera/Canvas"
		slot2 = slot2(slot3)
		slot2 = slot2.transform
	end

	uv0 = slot2
	slot2 = uv0
	slot3 = slot2
	slot2 = slot2.TransformPoint
	slot4 = Vector3
	slot5 = slot1.x
	slot6 = slot1.y
	slot7 = 0
	slot2 = slot2(slot3, slot4(slot5, slot6, slot7))
	slot3 = uv0
	slot4 = slot3
	slot3 = slot3.TransformPoint
	slot5 = Vector3
	slot6 = slot1.x
	slot7 = slot1.width
	slot6 = slot6 + slot7
	slot7 = slot1.y
	slot8 = slot1.height
	slot7 = slot7 + slot8
	slot8 = 0
	slot3 = slot3(slot4, slot5(slot6, slot7, slot8))
	slot4 = true
	slot5 = Vector4
	slot6 = slot2.x
	slot7 = slot2.y
	slot8 = slot3.x
	slot9 = slot3.y

	return slot4, slot5(slot6, slot7, slot8, slot9)
end

findCullAndClipWorldRect = slot4

function slot4(slot0, slot1)
	slot2 = math
	slot2 = slot2.max
	slot3 = slot0.x
	slot4 = slot1.x
	slot2 = slot2(slot3, slot4)
	slot3 = math
	slot3 = slot3.min
	slot4 = slot0.x
	slot5 = slot0.width
	slot4 = slot4 + slot5
	slot5 = slot1.x
	slot6 = slot1.width
	slot5 = slot5 + slot6
	slot3 = slot3(slot4, slot5)
	slot4 = math
	slot4 = slot4.max
	slot5 = slot0.y
	slot6 = slot1.y
	slot4 = slot4(slot5, slot6)
	slot5 = math
	slot5 = slot5.min
	slot6 = slot0.y
	slot7 = slot0.height
	slot6 = slot6 + slot7
	slot7 = slot1.y
	slot8 = slot1.height
	slot7 = slot7 + slot8
	slot5 = slot5(slot6, slot7)

	if slot2 <= slot3 and slot4 <= slot5 then
		slot6 = uv0
		slot6 = slot6.Rect
		slot6 = slot6.New
		slot7 = slot2
		slot8 = slot4
		slot9 = slot3 - slot2
		slot10 = slot5 - slot4

		return slot6(slot7, slot8, slot9, slot10)
	end

	slot6 = uv0
	slot6 = slot6.Rect
	slot6 = slot6.New
	slot7 = 0
	slot8 = 0
	slot9 = 0
	slot10 = 0

	return slot6(slot7, slot8, slot9, slot10)
end

rectIntersect = slot4

function slot4(slot0)
	slot1 = {}
	slot2 = ipairs
	slot3 = slot0
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6[2]
		slot9 = slot6[3] or 1

		if slot6[1] == DROP_TYPE_SHIP then
			slot10 = Ship
			slot10 = slot10.New
			slot11 = {
				configId = slot8
			}
			slot10 = slot10(slot11)
			slot11 = table
			slot11 = slot11.insert
			slot12 = slot1
			slot14 = slot10
			slot13 = slot10.getConfig
			slot15 = "name"
			slot13 = slot13(slot14, slot15)
			slot14 = "x"
			slot15 = slot9
			slot13 = slot13 .. slot14 .. slot15

			slot11(slot12, slot13)
		else
			slot10 = DROP_TYPE_EQUIP

			if slot7 == slot10 then
				slot10 = Equipment
				slot10 = slot10.New
				slot11 = {
					id = slot8
				}
				slot10 = slot10(slot11)
				slot11 = table
				slot11 = slot11.insert
				slot12 = slot1
				slot14 = slot10
				slot13 = slot10.getConfig
				slot15 = "name"
				slot13 = slot13(slot14, slot15)
				slot14 = "x"
				slot15 = counts
				slot13 = slot13 .. slot14 .. slot15

				slot11(slot12, slot13)
			else
				slot10 = DROP_TYPE_SIREN_EQUIP

				if slot7 == slot10 then
					-- Nothing
				else
					slot10 = DROP_TYPE_RESOURCE

					if slot7 == slot10 then
						slot10 = Item
						slot10 = slot10.New
						slot11 = {}
						slot12 = id2ItemId
						slot13 = slot8
						slot12 = slot12(slot13)
						slot11.id = slot12
						slot10 = slot10(slot11)
						slot11 = table
						slot11 = slot11.insert
						slot12 = slot1
						slot14 = slot10
						slot13 = slot10.getConfig
						slot15 = "name"
						slot13 = slot13(slot14, slot15)
						slot14 = "x"
						slot15 = slot9
						slot13 = slot13 .. slot14 .. slot15

						slot11(slot12, slot13)
					else
						slot10 = DROP_TYPE_ITEM

						if slot7 == slot10 then
							slot10 = Item
							slot10 = slot10.New
							slot11 = {
								id = slot8
							}
							slot10 = slot10(slot11)
							slot11 = table
							slot11 = slot11.insert
							slot12 = slot1
							slot14 = slot10
							slot13 = slot10.getConfig
							slot15 = "name"
							slot13 = slot13(slot14, slot15)
							slot14 = "x"
							slot15 = slot9
							slot13 = slot13 .. slot14 .. slot15

							slot11(slot12, slot13)
						else
							slot10 = DROP_TYPE_FURNITURE

							if slot7 == slot10 then
								slot10 = Furniture
								slot10 = slot10.New
								slot11 = {
									id = slot8
								}
								slot10 = slot10(slot11)
								slot11 = table
								slot11 = slot11.insert
								slot12 = slot1
								slot14 = slot10
								slot13 = slot10.getConfig
								slot15 = "name"
								slot13 = slot13(slot14, slot15)
								slot14 = "x"
								slot15 = slot9
								slot13 = slot13 .. slot14 .. slot15

								slot11(slot12, slot13)
							else
								slot10 = DROP_TYPE_STRATEGY

								if slot7 == slot10 then
									slot10 = strategy_data_template
									slot10 = slot10[slot8]
									slot11 = table
									slot11 = slot11.insert
									slot12 = slot1
									slot13 = slot10.name
									slot14 = "x"
									slot15 = slot9
									slot13 = slot13 .. slot14 .. slot15

									slot11(slot12, slot13)
								else
									slot10 = DROP_TYPE_SKIN

									if slot7 == slot10 then
										slot10 = pg
										slot10 = slot10.ship_skin_template
										slot10 = slot10[slot8]
										slot11 = table
										slot11 = slot11.insert
										slot12 = slot1
										slot13 = slot10.name
										slot14 = "x"
										slot15 = slot9
										slot13 = slot13 .. slot14 .. slot15

										slot11(slot12, slot13)
									else
										slot10 = DROP_TYPE_EQUIPMENT_SKIN

										if slot7 == slot10 then
											slot10 = pg
											slot10 = slot10.equip_skin_template
											slot10 = slot10[slot8]
											slot11 = table
											slot11 = slot11.insert
											slot12 = slot1
											slot13 = slot10.name
											slot14 = "x"
											slot15 = slot9
											slot13 = slot13 .. slot14 .. slot15

											slot11(slot12, slot13)
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot2 = table
	slot2 = slot2.concat
	slot3 = slot1
	slot4 = "、"

	return slot2(slot3, slot4)
end

getDropInfo = slot4

function slot4(slot0, slot1, slot2)
	slot3 = type
	slot4 = slot2 or {}
	slot5 = slot1.type or slot1.dropType
	slot6 = ""
	slot7 = ""

	if slot0:Find("icon_bg/IconColorful(Clone)") then
		slot9 = setActive
		slot10 = slot8
		slot11 = false

		slot9(slot10, slot11)
	end

	slot10 = slot0
	slot9 = slot0.Find
	slot11 = "icon_bg/frame/specialFrame"
	slot9 = slot9(slot10, slot11)

	if slot9 then
		slot10 = setActive
		slot11 = slot9
		slot12 = false

		slot10(slot11, slot12)

		slot11 = slot0
		slot10 = slot0.Find
		slot12 = "icon_bg/frame"
		slot10 = slot10(slot11, slot12)
		slot11 = slot10
		slot10 = slot10.GetComponent
		slot12 = typeof
		slot13 = Image
		slot10 = slot10(slot11, slot12(slot13))
		slot11 = true
		slot10.enabled = slot11
	end

	slot10 = setIconOrFrameSize
	slot11 = findTF
	slot12 = slot0
	slot13 = "icon_bg/icon"

	slot10(slot11(slot12, slot13))

	function slot10(slot0)
		slot1 = findTF
		slot2 = uv0
		slot3 = "icon_bg"
		slot1, slot2 = slot1(slot2, slot3)
		slot3 = eachChild
		slot4 = slot1

		function slot5(slot0)
			slot1 = go
			slot2 = slot0
			slot1 = slot1(slot2)
			slot1 = slot1.name

			if slot1 ~= "icon" then
				slot1 = SetActive
				slot2 = slot0
				slot3 = false

				slot1(slot2, slot3)
			else
				uv0 = slot0
			end
		end

		slot3(slot4, slot5)

		slot4 = slot1
		slot3 = slot1.GetComponent
		slot5 = typeof
		slot6 = Image
		slot3 = slot3(slot4, slot5(slot6))
		slot4 = false
		slot3.enabled = slot4
		slot4 = slot2
		slot3 = slot2.GetComponent
		slot5 = typeof
		slot6 = Image
		slot3 = slot3(slot4, slot5(slot6))
		slot4 = GetSpriteFromAtlas
		slot5 = slot0.icon
		slot6 = ""
		slot4 = slot4(slot5, slot6)
		slot3.sprite = slot4
	end

	slot11 = DROP_TYPE_SHIP

	if slot5 ~= slot11 then
		slot12 = slot0
		slot11 = slot0.Find
		slot13 = "ship_type"
		slot11 = slot11(slot12, slot13)
		slot12 = IsNil
		slot13 = slot11
		slot12 = slot12(slot13)

		if not slot12 then
			slot12 = setActive
			slot13 = slot11
			slot14 = false

			slot12(slot13, slot14)
		end

		slot13 = slot0
		slot12 = slot0.Find
		slot14 = "icon_bg/new"
		slot12 = slot12(slot13, slot14)
		slot13 = IsNil
		slot14 = slot12
		slot13 = slot13(slot14)

		if not slot13 then
			slot13 = setActive
			slot14 = slot12
			slot15 = false

			slot13(slot14, slot15)
		end

		slot14 = slot0
		slot13 = slot0.Find
		slot15 = "icon_bg/npc"
		slot13 = slot13(slot14, slot15)
		slot14 = IsNil
		slot15 = slot13
		slot14 = slot14(slot15)

		if not slot14 then
			slot14 = setActive
			slot15 = slot13
			slot16 = false

			slot14(slot15, slot16)
		end
	end

	slot11 = DROP_TYPE_EQUIP

	if slot5 ~= slot11 then
		slot12 = slot0
		slot11 = slot0.Find
		slot13 = "icon_bg/slv"
		slot11 = slot11(slot12, slot13)
		slot12 = IsNil
		slot13 = slot11
		slot12 = slot12(slot13)

		if not slot12 then
			slot12 = setActive
			slot13 = slot11
			slot14 = false

			slot12(slot13, slot14)
		end
	end

	slot11 = DROP_TYPE_RESOURCE

	if slot5 == slot11 then
		slot11 = id2ItemId
		slot12 = slot1.id
		slot11 = slot11(slot12)
		slot12 = pg
		slot12 = slot12.item_data_statistics
		slot6 = slot12[slot11]
		slot7 = slot6.display
		slot12 = slot4.resNotFrame

		if slot12 then
			slot12 = slot10
			slot13 = slot6

			slot12(slot13)
		else
			slot12 = updateItem
			slot13 = slot0
			slot14 = Item
			slot14 = slot14.New
			slot15 = {
				id = slot11
			}
			slot14 = slot14(slot15)
			slot15 = slot4

			slot12(slot13, slot14, slot15)
		end
	else
		slot11 = DROP_TYPE_ITEM

		if slot5 == slot11 then
			slot11 = pg
			slot11 = slot11.item_data_statistics
			slot12 = slot1.id
			slot6 = slot11[slot12]
			slot7 = slot6.display
			slot11 = updateItem
			slot12 = slot0
			slot13 = Item
			slot13 = slot13.New
			slot14 = {}
			slot15 = slot1.id
			slot14.id = slot15
			slot13 = slot13(slot14)
			slot14 = slot4

			slot11(slot12, slot13, slot14)
		else
			slot11 = DROP_TYPE_EQUIP

			if slot5 == slot11 then
				slot11 = pg
				slot11 = slot11.equip_data_statistics
				slot12 = slot1.id
				slot6 = slot11[slot12]
				slot7 = slot6.descrip
				slot11 = updateEquipment
				slot12 = slot0
				slot13 = Equipment
				slot13 = slot13.New
				slot14 = {}
				slot15 = slot1.id
				slot14.id = slot15
				slot13 = slot13(slot14)
				slot14 = slot4

				slot11(slot12, slot13, slot14)
			else
				slot11 = DROP_TYPE_SIREN_EQUIP

				if slot5 == slot11 then
					slot11 = getProxy
					slot12 = EquipmentProxy
					slot11 = slot11(slot12)
					slot13 = slot11
					slot12 = slot11.getEquipmentById
					slot14 = slot1.id
					slot12 = slot12(slot13, slot14)
					slot13 = pg
					slot13 = slot13.equip_data_statistics
					slot14 = slot12.configId
					slot6 = slot13[slot14]
					slot7 = slot6.descrip
					slot13 = updateEquipment
					slot14 = slot0
					slot15 = slot12
					slot16 = slot4

					slot13(slot14, slot15, slot16)
				else
					slot11 = DROP_TYPE_SHIP

					if slot5 == slot11 then
						slot11 = pg
						slot11 = slot11.ship_data_statistics
						slot12 = slot1.id
						slot6 = slot11[slot12]
						slot11 = Ship
						slot11 = slot11.getWords
						slot12 = slot6.skin_id
						slot13 = "drop_descrip"
						slot11 = slot11(slot12, slot13)

						if not slot11 then
							slot12 = i18n
							slot13 = "ship_drop_desc_default"
							slot12 = slot12(slot13)
							slot7 = slot12
						end

						slot12 = Ship
						slot12 = slot12.New
						slot13 = {}
						slot14 = slot1.id
						slot13.configId = slot14
						slot14 = slot1.skinId
						slot13.skin_id = slot14
						slot14 = slot1.propose
						slot13.propose = slot14
						slot12 = slot12(slot13)
						slot13 = slot1.remoulded
						slot12.remoulded = slot13
						slot13 = slot1.virgin
						slot12.virgin = slot13
						slot13 = updateShip
						slot14 = slot0
						slot15 = slot12
						slot16 = slot4

						slot13(slot14, slot15, slot16)
					else
						slot11 = DROP_TYPE_NPC_SHIP

						if slot5 == slot11 then
							slot11 = getProxy
							slot12 = BayProxy
							slot11 = slot11(slot12)
							slot12 = slot11
							slot11 = slot11.getShipById
							slot13 = slot1.id
							slot11 = slot11(slot12, slot13)
							slot12 = pg
							slot12 = slot12.ship_data_statistics
							slot13 = slot11.configId
							slot6 = slot12[slot13]
							slot12 = Ship
							slot12 = slot12.getWords
							slot13 = slot6.skin_id
							slot14 = "drop_descrip"
							slot12 = slot12(slot13, slot14)

							if not slot12 then
								slot13 = i18n
								slot14 = "ship_drop_desc_default"
								slot13 = slot13(slot14)
								slot7 = slot13
							end

							slot13 = updateShip
							slot14 = slot0
							slot15 = slot11
							slot16 = slot4

							slot13(slot14, slot15, slot16)
						else
							slot11 = DROP_TYPE_FURNITURE

							if slot5 == slot11 then
								slot11 = pg
								slot11 = slot11.furniture_data_template
								slot12 = slot1.id
								slot6 = slot11[slot12]
								slot7 = slot6.describe
								slot11 = updateFurniture
								slot12 = slot0
								slot13 = slot1.id
								slot14 = slot4

								slot11(slot12, slot13, slot14)
							else
								slot11 = DROP_TYPE_STRATEGY

								if slot5 == slot11 then
									slot11 = pg
									slot11 = slot11.strategy_data_template
									slot12 = slot1.id
									slot6 = slot11[slot12]
									slot7 = slot6.desc
									slot11 = updateStrategy
									slot12 = slot0
									slot13 = Item
									slot13 = slot13.New
									slot14 = {}
									slot15 = slot1.id
									slot14.id = slot15

									slot11(slot12, slot13(slot14))
								else
									slot11 = DROP_TYPE_SKIN

									if slot5 == slot11 then
										slot11 = pg
										slot11 = slot11.ship_skin_template
										slot12 = slot1.id
										slot6 = slot11[slot12]
										slot11 = Ship
										slot11 = slot11.getWords
										slot12 = slot1.id
										slot13 = "drop_descrip"
										slot11 = slot11(slot12, slot13)
										slot7 = slot11
										slot11 = true
										slot4.isSkin = slot11
										slot11 = updateShip
										slot12 = slot0
										slot13 = Ship
										slot13 = slot13.New
										slot14 = {}
										slot15 = tonumber
										slot16 = slot6.ship_group
										slot17 = "1"
										slot16 = slot16 .. slot17
										slot15 = slot15(slot16)
										slot14.configId = slot15
										slot15 = slot1.id
										slot14.skin_id = slot15
										slot13 = slot13(slot14)
										slot14 = slot4

										slot11(slot12, slot13, slot14)
									else
										slot11 = DROP_TYPE_EQUIPMENT_SKIN

										if slot5 == slot11 then
											slot11 = pg
											slot11 = slot11.equip_skin_template
											slot12 = slot1.id
											slot6 = slot11[slot12]
											slot11 = updateEquipmentSkin
											slot12 = slot0
											slot13 = {}
											slot14 = slot6.rarity
											slot13.rarity = slot14
											slot14 = slot6.icon
											slot13.icon = slot14
											slot14 = slot6.name
											slot13.name = slot14
											slot14 = slot1.count
											slot13.count = slot14
											slot14 = slot4

											slot11(slot12, slot13, slot14)
										else
											slot11 = DROP_TYPE_VITEM

											if slot5 == slot11 then
												slot11 = pg
												slot11 = slot11.item_data_statistics
												slot12 = slot1.id
												slot6 = slot11[slot12]
												slot7 = slot6.display
												slot11 = updateItem
												slot12 = slot0
												slot13 = Item
												slot13 = slot13.New
												slot14 = {}
												slot15 = slot1.id
												slot14.id = slot15
												slot13 = slot13(slot14)
												slot14 = slot4

												slot11(slot12, slot13, slot14)
											else
												slot11 = DROP_TYPE_WORLD_ITEM

												if slot5 == slot11 then
													slot11 = pg
													slot11 = slot11.world_item_data_template
													slot12 = slot1.id
													slot6 = slot11[slot12]
													slot7 = slot6.display
													slot11 = updateWorldItem
													slot12 = slot0
													slot13 = WorldItem
													slot13 = slot13.New
													slot14 = {}
													slot15 = slot1.id
													slot14.id = slot15
													slot13 = slot13(slot14)
													slot14 = slot4

													slot11(slot12, slot13, slot14)
												else
													slot11 = DROP_TYPE_CHAT_FRAME

													if slot5 == slot11 then
														slot11 = pg
														slot11 = slot11.item_data_chat
														slot12 = slot1.id
														slot6 = slot11[slot12]
														slot11 = updateAttire
														slot12 = slot0
														slot13 = AttireConst
														slot13 = slot13.TYPE_CHAT_FRAME
														slot14 = slot6

														slot11(slot12, slot13, slot14)
													else
														slot11 = DROP_TYPE_ICON_FRAME

														if slot5 == slot11 then
															slot11 = pg
															slot11 = slot11.item_data_frame
															slot12 = slot1.id
															slot6 = slot11[slot12]
															slot11 = updateAttire
															slot12 = slot0
															slot13 = AttireConst
															slot13 = slot13.TYPE_ICON_FRAME
															slot14 = slot6

															slot11(slot12, slot13, slot14)
														end
													end
												end
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end

	slot1.cfg = slot6
	slot1.desc = slot7
	slot11 = slot1.count

	if slot11 then
		slot11 = slot3
		slot12 = slot1.count
		slot11 = slot11(slot12)

		if slot11 == "number" then
			slot11 = slot1.count
			slot12 = 0

			if slot11 > slot12 then
				slot11 = findTF
				slot12 = slot0
				slot13 = "icon_bg/count"
				slot11 = slot11(slot12, slot13)
				slot12 = IsNil
				slot13 = slot11
				slot12 = slot12(slot13)

				if not slot12 then
					slot12 = SetActive
					slot13 = slot11
					slot14 = true

					slot12(slot13, slot14)

					slot12 = setText
					slot13 = slot11
					slot14 = slot1.count

					slot12(slot13, slot14)
				end
			end
		end
	else
		slot11 = findTF
		slot12 = slot0
		slot13 = "icon_bg/count"
		slot11 = slot11(slot12, slot13)
		slot12 = IsNil
		slot13 = slot11
		slot12 = slot12(slot13)

		if not slot12 then
			slot12 = SetActive
			slot13 = slot11
			slot14 = false

			slot12(slot13, slot14)
		end
	end
end

updateDrop = slot4

function slot4(slot0, slot1, slot2)
	slot3 = slot2
	slot4 = 4
	slot5 = setImageSprite
	slot6 = findTF
	slot7 = slot0
	slot8 = "icon_bg"
	slot6 = slot6(slot7, slot8)
	slot7 = GetSpriteFromAtlas
	slot8 = "weaponframes"
	slot9 = "bg"
	slot10 = slot4
	slot9 = slot9 .. slot10

	slot5(slot6, slot7(slot8, slot9))

	slot5 = setFrame
	slot6 = findTF
	slot7 = slot0
	slot8 = "icon_bg/frame"
	slot6 = slot6(slot7, slot8)
	slot7 = slot4

	slot5(slot6, slot7)

	slot5 = findTF
	slot6 = slot0
	slot7 = "icon_bg/icon"
	slot5 = slot5(slot6, slot7)
	slot6 = nil
	slot7 = AttireConst
	slot7 = slot7.TYPE_CHAT_FRAME

	if slot1 == slot7 then
		slot6 = "chat_frame"
	else
		slot7 = AttireConst
		slot7 = slot7.TYPE_ICON_FRAME

		if slot1 == slot7 then
			slot6 = "icon_frame"
		end
	end

	slot7 = GetImageSpriteFromAtlasAsync
	slot8 = "Props/"
	slot9 = slot6
	slot8 = slot8 .. slot9
	slot9 = ""
	slot10 = slot5

	slot7(slot8, slot9, slot10)

	slot7 = findTF
	slot8 = slot0
	slot9 = "name"
	slot7 = slot7(slot8, slot9)
	slot8 = IsNil
	slot9 = slot7
	slot8 = slot8(slot9)

	if not slot8 then
		slot8 = setText
		slot9 = slot7
		slot10 = HXSet
		slot10 = slot10.hxLan
		slot11 = slot3.name

		slot8(slot9, slot10(slot11))
	end
end

updateAttire = slot4

function slot4(slot0)
	slot1 = 0
	slot2 = false
	slot3 = slot0.type
	slot4 = DROP_TYPE_RESOURCE

	if slot3 == slot4 then
		slot4 = getProxy
		slot5 = PlayerProxy
		slot4 = slot4(slot5)
		slot5 = slot4
		slot4 = slot4.getRawData
		slot4 = slot4(slot5)
		slot6 = slot4
		slot5 = slot4.getResById
		slot7 = slot0.id
		slot5 = slot5(slot6, slot7)
		slot1 = slot5
		slot5 = slot0.id

		if slot5 ~= 1 then
			slot5 = slot0.id

			if slot5 == 2 then
				slot2 = true
			end
		end
	else
		slot4 = DROP_TYPE_ITEM

		if slot3 == slot4 then
			slot4 = getProxy
			slot5 = BagProxy
			slot4 = slot4(slot5)
			slot5 = slot4
			slot4 = slot4.getItemCountById
			slot6 = slot0.id
			slot4 = slot4(slot5, slot6)
			slot1 = slot4
			slot2 = true
		else
			slot4 = DROP_TYPE_EQUIP

			if slot3 == slot4 then
				slot4 = getProxy
				slot5 = EquipmentProxy
				slot4 = slot4(slot5)
				slot5 = slot4
				slot4 = slot4.getEquipmentById
				slot6 = slot0.id
				slot4 = slot4(slot5, slot6)

				if slot4 then
					slot1 = slot4.count or 0
				end
			else
				slot4 = DROP_TYPE_SHIP

				if slot3 == slot4 then
					slot4 = getProxy
					slot5 = BayProxy
					slot4 = slot4(slot5)
					slot5 = slot4
					slot4 = slot4.getConfigShipCount
					slot6 = slot0.id
					slot4 = slot4(slot5, slot6)
					slot1 = slot4
				else
					slot4 = DROP_TYPE_FURNITURE

					if slot3 == slot4 then
						slot4 = getProxy
						slot5 = DormProxy
						slot4 = slot4(slot5)
						slot5 = slot4
						slot4 = slot4.getFurnitrueCount
						slot6 = slot0.id
						slot4 = slot4(slot5, slot6)
						slot1 = slot4
					else
						slot4 = DROP_TYPE_STRATEGY

						if slot3 == slot4 then
							-- Nothing
						else
							slot4 = DROP_TYPE_SKIN

							if slot3 == slot4 then
								slot4 = getProxy
								slot5 = ShipSkinProxy
								slot4 = slot4(slot5)
								slot5 = slot4
								slot4 = slot4.getSkinCountById
								slot6 = slot0.id
								slot4 = slot4(slot5, slot6)
								slot1 = slot4
							else

								-- Decompilation error in this vicinity:
								slot4 = DROP_TYPE_VITEM
								slot4 = DROP_TYPE_EQUIPMENT_SKIN
								slot4 = getProxy
								slot5 = EquipmentProxy
								slot4 = slot4(slot5)
								slot5 = slot4
								slot4 = slot4.getEquipmnentSkinById
								slot6 = slot0.id
								slot4 = slot4(slot5, slot6)
								slot1 = slot4.count or 0
							end
						end
					end
				end
			end
		end
	end

	slot4 = slot1
	slot5 = slot2

	return slot4, slot5
end

GetOwnedpropCount = slot4

function slot4(slot0, slot1, slot2)
	slot2 = slot2 or {}

	setImageSprite(findTF(slot0, "icon_bg"), GetSpriteFromAtlas("weaponframes", "bg" .. EquipmentRarity.Rarity2Print(slot1.rarity)))
	setFrame(findTF(slot0, "icon_bg/frame"), slot3, "frame7")
	GetImageSpriteFromAtlasAsync("equips/" .. slot1.icon, "", findTF(slot0, "icon_bg/icon"))
	setStars(false, slot0)

	if not IsNil(findTF(slot0, "name")) then
		slot6 = setText
		slot7 = slot5
		slot8 = slot1.name

		slot6(slot7, slot8)
	end

	slot6 = findTF
	slot7 = slot0
	slot8 = "icon_bg/slv"
	slot6 = slot6(slot7, slot8)
	slot7 = IsNil
	slot8 = slot6
	slot7 = slot7(slot8)

	if not slot7 then
		slot7 = setActive
		slot8 = slot6
		slot9 = false

		slot7(slot8, slot9)
	end

	setText(slot8, (slot1.count or 0) > 0 and (slot1.count or 0) or "")
	setIconColorful(slot0, slot1.rarity, slot2)
end

updateEquipmentSkin = slot4

function slot4(slot0)
	slot1 = 1
	slot2 = slot0.type
	slot3 = DROP_TYPE_RESOURCE

	if slot2 == slot3 then
		slot3 = pg
		slot3 = slot3.item_data_statistics
		slot4 = id2ItemId
		slot5 = slot0.id
		slot4 = slot4(slot5)
		slot3 = slot3[slot4]
		slot3 = slot3.rarity
		slot1 = slot3 + 1
	else
		slot3 = DROP_TYPE_ITEM

		if slot2 == slot3 then
			slot3 = pg
			slot3 = slot3.item_data_statistics
			slot4 = slot0.id
			slot3 = slot3[slot4]
			slot3 = slot3.rarity
			slot1 = slot3 + 1
		else
			slot3 = DROP_TYPE_EQUIP

			if slot2 == slot3 then
				slot3 = pg
				slot3 = slot3.equip_data_statistics
				slot4 = slot0.id
				slot3 = slot3[slot4]
				slot1 = slot3.rarity
			else
				slot3 = DROP_TYPE_SHIP

				if slot2 == slot3 then
					slot3 = pg
					slot3 = slot3.ship_data_statistics
					slot4 = slot0.id
					slot3 = slot3[slot4]
					slot1 = slot3.rarity
				else
					slot3 = DROP_TYPE_FURNITURE

					if slot2 == slot3 then
						slot3 = pg
						slot3 = slot3.furniture_data_template
						slot4 = slot0.id
						slot3 = slot3[slot4]
						slot3 = slot3.comfortable
						slot1 = slot3 + 1
					else
						slot3 = DROP_TYPE_STRATEGY

						if slot2 == slot3 then
							slot1 = 1
						else
							slot3 = DROP_TYPE_SKIN

							if slot2 == slot3 then
								slot1 = 5
							end
						end
					end
				end
			end
		end
	end

	return slot1
end

getDropRarity = slot4

function slot4(slot0, slot1, slot2, slot3)
	slot4 = nil
	slot5 = {}

	if slot1 then
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot5
		slot8 = {
			text = "text_noPos_clear",
			atuoClose = true,
			onCallback = slot1
		}

		slot6(slot7, slot8)
	end

	if slot2 then
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot5
		slot8 = {
			text = "text_noPos_buy",
			atuoClose = true,
			onCallback = slot2
		}

		slot6(slot7, slot8)
	end

	if slot3 then
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot5
		slot8 = {
			text = "text_noPos_intensify",
			atuoClose = true,
			onCallback = slot3
		}

		slot6(slot7, slot8)
	end

	slot6 = pg
	slot6 = slot6.MsgboxMgr
	slot7 = slot6
	slot6 = slot6.GetInstance
	slot6 = slot6(slot7)
	slot7 = slot6
	slot6 = slot6.ShowMsgBox
	slot8 = {
		hideNo = true,
		hideYes = true,
		content = slot0,
		custom = slot5
	}

	slot6(slot7, slot8)
end

NoPosMsgBox = slot4

function slot4()
	slot0 = pg
	slot0 = slot0.m02
	slot1 = slot0
	slot0 = slot0.hasMediator
	slot2 = EquipmentMediator
	slot2 = slot2.__cname
	slot0 = slot0(slot1, slot2)

	if slot0 then
		slot0 = getProxy
		slot1 = ContextProxy
		slot0 = slot0(slot1)
		slot2 = slot0
		slot1 = slot0.getCurrentContext
		slot1 = slot1(slot2)
		slot3 = slot1
		slot2 = slot1.getContextByMediator
		slot4 = EquipmentMediator
		slot2 = slot2(slot3, slot4)

		if slot2 then
			slot3 = slot2.data
			slot3 = slot3.shipId

			if slot3 then
				slot3 = pg
				slot3 = slot3.m02
				slot4 = slot3
				slot3 = slot3.sendNotification
				slot5 = GAME
				slot5 = slot5.REMOVE_LAYERS
				slot6 = {
					context = slot2
				}

				slot3(slot4, slot5, slot6)
			end
		else
			slot3 = pg
			slot3 = slot3.m02
			slot4 = slot3
			slot3 = slot3.sendNotification
			slot5 = EquipmentMediator
			slot5 = slot5.BATCHDESTROY_MODE

			slot3(slot4, slot5)

			return
		end
	end

	slot0 = pg
	slot0 = slot0.m02
	slot1 = slot0
	slot0 = slot0.sendNotification
	slot2 = GAME
	slot2 = slot2.GO_SCENE
	slot3 = SCENE
	slot3 = slot3.EQUIPSCENE
	slot4 = {}
	slot5 = StoreHouseConst
	slot5 = slot5.WARP_TO_WEAPON
	slot4.warp = slot5
	slot5 = StoreHouseConst
	slot5 = slot5.DESTORY
	slot4.mode = slot5

	slot0(slot1, slot2, slot3, slot4)
end

openDestroyEquip = slot4

function slot4()
	slot0 = {}
	slot1 = getProxy
	slot2 = BayProxy
	slot1 = slot1(slot2)
	slot2 = slot1
	slot1 = slot1.getData
	slot1 = slot1(slot2)
	slot2 = pairs
	slot3 = slot1
	slot2, slot3, slot4 = slot2(slot3)

	for slot5, slot6 in slot2, slot3, slot4 do
		slot8 = slot6
		slot7 = slot6.isActivityNpc
		slot7 = slot7(slot8)

		if slot7 then
			slot7 = table
			slot7 = slot7.contains
			slot8 = slot0
			slot9 = slot6.id
			slot7 = slot7(slot8, slot9)

			if not slot7 then
				slot7 = table
				slot7 = slot7.insert
				slot8 = slot0
				slot9 = slot6.id

				slot7(slot8, slot9)
			end
		end
	end

	slot2 = pg
	slot2 = slot2.m02
	slot3 = slot2
	slot2 = slot2.sendNotification
	slot4 = GAME
	slot4 = slot4.GO_SCENE
	slot5 = SCENE
	slot5 = slot5.DOCKYARD
	slot6 = {
		blockLock = true,
		prevFlag = false,
		selectedMax = 10,
		skipSelect = true
	}
	slot7 = DockyardScene
	slot7 = slot7.MODE_DESTROY
	slot6.mode = slot7
	slot7 = i18n
	slot8 = "word_destroy"
	slot7 = slot7(slot8)
	slot6.leftTopInfo = slot7
	slot7 = Ship
	slot7 = slot7.canDestroyShip
	slot6.onShip = slot7
	slot6.ignoredIds = slot0

	slot2(slot3, slot4, slot5, slot6)
end

openDockyardClear = slot4

function slot4()
	slot0 = pg
	slot0 = slot0.m02
	slot1 = slot0
	slot0 = slot0.sendNotification
	slot2 = GAME
	slot2 = slot2.GO_SCENE
	slot3 = SCENE
	slot3 = slot3.DOCKYARD
	slot4 = {
		prevFlag = false
	}
	slot5 = DockyardScene
	slot5 = slot5.MODE_OVERVIEW
	slot4.mode = slot5

	function slot5(slot0, slot1)
		slot2 = pg
		slot2 = slot2.m02
		slot3 = slot2
		slot2 = slot2.sendNotification
		slot4 = GAME
		slot4 = slot4.GO_SCENE
		slot5 = SCENE
		slot5 = slot5.SHIPINFO
		slot6 = {
			page = 3
		}
		slot7 = slot0.id
		slot6.shipId = slot7
		slot6.shipVOs = slot1

		slot2(slot3, slot4, slot5, slot6)
	end

	slot4.onClick = slot5

	slot0(slot1, slot2, slot3, slot4)
end

openDockyardIntensify = slot4

function slot4(slot0, slot1, slot2)
	if slot2 then
		slot3 = ""
		slot4 = ipairs
		slot5 = slot2
		slot4, slot5, slot6 = slot4(slot5)

		for slot7, slot8 in slot4, slot5, slot6 do
			slot3 = slot3 .. i18n(slot8[1] == 59001 and "text_noRes_info_tip" or "text_noRes_info_tip2", pg.item_data_statistics[slot8[1]].name, slot8[2])

			if slot7 < #slot2 then
				slot10 = slot3
				slot11 = i18n
				slot12 = "text_noRes_info_tip_link"
				slot11 = slot11(slot12)
				slot3 = slot10 .. slot11
			end
		end

		if slot3 ~= "" then
			slot4 = slot0
			slot5 = "\n"
			slot6 = i18n
			slot7 = "text_noRes_tip"
			slot8 = slot3
			slot6 = slot6(slot7, slot8)
			slot0 = slot4 .. slot5 .. slot6
		end
	end

	slot3 = pg
	slot3 = slot3.MsgboxMgr
	slot4 = slot3
	slot3 = slot3.GetInstance
	slot3 = slot3(slot4)
	slot4 = slot3
	slot3 = slot3.ShowMsgBox
	slot5 = {
		content = slot0
	}
	slot6 = LayerWeightConst
	slot6 = slot6.SECOND_LAYER
	slot5.weight = slot6

	function slot6()
		slot0 = gotoChargeScene
		slot1 = uv0
		slot2 = uv1

		slot0(slot1, slot2)
	end

	slot5.onYes = slot6

	slot3(slot4, slot5)
end

GoShoppingMsgBox = slot4

function slot4(slot0, slot1, slot2, slot3, slot4)
	if math.floor(getProxy(PlayerProxy).getData(slot6)[id2res(pg.shop_template[slot0].resource_type)] / (slot1.price or pg.shop_template[slot0].resource_num)) <= 0 then
		slot10 = 1
	end

	if slot2 ~= nil and slot2 < slot10 then
		slot10 = slot2 or slot10
	end

	slot11 = true
	slot12 = 1

	if slot5 ~= nil then
		slot13 = slot1.id

		if slot13 then
			slot13 = print
			slot14 = slot5.num
			slot14 = slot10 * slot14
			slot15 = "--"
			slot16 = slot10

			slot13(slot14, slot15, slot16)

			slot13 = Item
			slot13 = slot13.New
			slot14 = {}
			slot15 = slot1.id
			slot14.id = slot15
			slot13 = slot13(slot14)
			slot14 = slot13
			slot13 = slot13.getConfig
			slot15 = "name"
			slot13 = slot13(slot14, slot15)
			slot14 = pg
			slot14 = slot14.MsgboxMgr
			slot14 = slot14.GetInstance
			slot14 = slot14()
			slot15 = slot14
			slot14 = slot14.ShowMsgBox
			slot16 = {
				needCounter = true
			}
			slot17 = MSGBOX_TYPE_SINGLE_ITEM
			slot16.type = slot17
			slot17 = {}
			slot18 = DROP_TYPE_ITEM
			slot17.type = slot18
			slot18 = slot1.id
			slot17.id = slot18
			slot16.drop = slot17
			slot17 = slot5.num
			slot16.addNum = slot17
			slot17 = slot5.num
			slot17 = slot10 * slot17
			slot16.maxNum = slot17
			slot17 = slot5.num
			slot16.defaultNum = slot17

			function slot17(slot0, slot1)
				slot2 = math
				slot2 = slot2.floor
				slot3 = uv1
				slot3 = slot3.num
				slot3 = slot1 / slot3
				slot2 = slot2(slot3)
				uv0 = slot2
				slot2 = uv0
				slot3 = uv2
				slot2 = slot2 * slot3
				slot3 = uv3

				if slot3 < slot2 then
					slot3 = setText
					slot4 = slot0
					slot5 = i18n
					slot6 = uv4
					slot7 = slot2
					slot8 = slot1
					slot9 = COLOR_RED
					slot10 = uv5

					slot3(slot4, slot5(slot6, slot7, slot8, slot9, slot10))

					uv6 = false
				else
					slot3 = setText
					slot4 = slot0
					slot5 = i18n
					slot6 = uv4
					slot7 = slot2
					slot8 = slot1
					slot9 = COLOR_GREEN
					slot10 = uv5

					slot3(slot4, slot5(slot6, slot7, slot8, slot9, slot10))

					uv6 = true
				end
			end

			slot16.numUpdate = slot17

			function slot17()
				slot0 = uv0

				if slot0 then
					slot0 = pg
					slot0 = slot0.m02
					slot1 = slot0
					slot0 = slot0.sendNotification
					slot2 = GAME
					slot2 = slot2.SHOPPING
					slot3 = {}
					slot4 = uv1
					slot3.id = slot4
					slot4 = uv2
					slot3.count = slot4

					slot0(slot1, slot2, slot3)
				else
					slot0 = uv3

					if slot0 then
						slot0 = pg
						slot0 = slot0.TipsMgr
						slot1 = slot0
						slot0 = slot0.GetInstance
						slot0 = slot0(slot1)
						slot1 = slot0
						slot0 = slot0.ShowTips
						slot2 = i18n
						slot3 = uv3

						slot0(slot1, slot2(slot3))
					else
						slot0 = pg
						slot0 = slot0.TipsMgr
						slot1 = slot0
						slot0 = slot0.GetInstance
						slot0 = slot0(slot1)
						slot1 = slot0
						slot0 = slot0.ShowTips
						slot2 = i18n
						slot3 = "main_playerInfoLayer_error_changeNameNoGem"

						slot0(slot1, slot2(slot3))
					end
				end
			end

			slot16.onYes = slot17

			slot14(slot15, slot16)
		end
	end
end

shoppingBatch = slot4

function slot4(slot0, slot1)
	slot2 = pg
	slot2 = slot2.m02
	slot3 = slot2
	slot2 = slot2.hasMediator
	slot4 = ChargeMediator
	slot4 = slot4.__cname
	slot2 = slot2(slot3, slot4)

	if slot2 then
		slot2 = getProxy
		slot3 = ContextProxy
		slot2 = slot2(slot3)
		slot4 = slot2
		slot3 = slot2.getCurrentContext
		slot3 = slot3(slot4)
		slot5 = slot3
		slot4 = slot3.getContextByMediator
		slot6 = ShopsMediator
		slot4 = slot4(slot5, slot6)

		if slot4 then
			slot5 = pg
			slot5 = slot5.m02
			slot6 = slot5
			slot5 = slot5.sendNotification
			slot7 = GAME
			slot7 = slot7.REMOVE_LAYERS
			slot8 = {
				context = slot4
			}

			slot5(slot6, slot7, slot8)
		end

		if slot0 then
			slot5 = pg
			slot5 = slot5.m02
			slot6 = slot5
			slot5 = slot5.sendNotification
			slot7 = PlayerResource
			slot7 = slot7.GO_MALL
			slot8 = {
				type = slot0,
				noRes = slot1
			}

			slot5(slot6, slot7, slot8)
		end
	else
		slot2 = pg
		slot2 = slot2.m02
		slot3 = slot2
		slot2 = slot2.sendNotification
		slot4 = GAME
		slot4 = slot4.GO_SCENE
		slot5 = SCENE
		slot5 = slot5.CHARGE
		slot6 = {}

		if not slot0 then
			slot7 = ChargeScene
			slot7 = slot7.TYPE_ITEM
		end

		slot6.wrap = slot7
		slot6.noRes = slot1

		slot2(slot3, slot4, slot5, slot6)
	end
end

gotoChargeScene = slot4

function slot4(slot0)
	slot1 = findTF
	slot2 = slot0
	slot3 = "icon_bg"
	slot1 = slot1(slot2, slot3)
	slot2 = findTF
	slot3 = slot0
	slot4 = "icon_bg/frame"
	slot2 = slot2(slot3, slot4)
	slot3 = findTF
	slot4 = slot0
	slot5 = "icon_bg/icon"
	slot3 = slot3(slot4, slot5)
	slot4 = findTF
	slot5 = slot0
	slot6 = "icon_bg/icon/icon"
	slot4 = slot4(slot5, slot6)
	slot5 = clearImageSprite
	slot6 = slot1

	slot5(slot6)

	slot5 = clearImageSprite
	slot6 = slot2

	slot5(slot6)

	slot5 = clearImageSprite
	slot6 = slot3

	slot5(slot6)

	if slot4 then
		slot5 = clearImageSprite
		slot6 = slot4

		slot5(slot6)
	end
end

clearDrop = slot4
slot4 = {}
slot5 = Color
slot5 = slot5.New
slot6 = 1
slot7 = 0.25
slot8 = 0.25
slot5 = slot5(slot6, slot7, slot8)
slot4.red = slot5
slot5 = Color
slot5 = slot5.New
slot6 = 0.11
slot7 = 0.55
slot8 = 0.64
slot5 = slot5(slot6, slot7, slot8)
slot4.blue = slot5
slot5 = Color
slot5 = slot5.New
slot6 = 0.92
slot7 = 0.52
slot8 = 0
slot5 = slot5(slot6, slot7, slot8)
slot4.yellow = slot5

function slot5(slot0, slot1, slot2, slot3)
	slot4 = findTF
	slot5 = slot0
	slot6 = "skill"
	slot4 = slot4(slot5, slot6)
	slot5 = findTF
	slot6 = slot0
	slot7 = "lock"
	slot5 = slot5(slot6, slot7)
	slot6 = findTF
	slot7 = slot0
	slot8 = "unknown"
	slot6 = slot6(slot7, slot8)

	if slot1 then

		-- Decompilation error in this vicinity:
		setActive(slot4, true)
		setActive(slot6, false)
		setActive(slot5, not slot2)
		LoadImageSpriteAsync("skillicon/" .. slot1.icon, findTF(slot4, "icon"))

		slot7 = slot1.color or "blue"

		setText(findTF(slot4, "name"), shortenString(getSkillName(slot1.id), slot3 or 8))

		slot9 = setText
		slot10 = findTF(slot4, "level")
		slot11 = "LEVEL: "

		slot9(slot10, slot11 .. (slot2.level or "??"))
		setTextColor(slot8, uv0[slot7])
	else
		slot7 = setActive
		slot8 = slot4
		slot9 = false

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot6
		slot9 = true

		slot7(slot8, slot9)

		slot7 = setActive
		slot8 = slot5
		slot9 = false

		slot7(slot8, slot9)
	end
end

updateSkill = slot5
slot5 = true

function slot6(slot0, slot1, slot2, slot3)
	slot4 = GetOrAddComponent
	slot5 = slot1
	slot6 = "UILongPressTrigger"
	slot4 = slot4(slot5, slot6)
	slot5 = defaultValue
	slot6 = slot3
	slot7 = 1
	slot5 = slot5(slot6, slot7)
	slot4.longPressThreshold = slot5

	function slot5(slot0)
		function slot1()
			slot0 = uv0

			if slot0 then
				slot0 = playSoundEffect
				slot1 = SOUND_BACK

				slot0(slot1)
			end

			slot0 = uv1
			slot0, slot1 = slot0()

			if slot0 then
				slot2 = uv2
				slot3 = slot1

				slot2(slot3)
			end
		end

		return slot1
	end

	slot6 = slot4.onReleased
	slot7 = pg
	slot7 = slot7.DelegateInfo
	slot7 = slot7.Add
	slot8 = slot0
	slot9 = slot6

	slot7(slot8, slot9)

	slot8 = slot6
	slot7 = slot6.RemoveAllListeners

	slot7(slot8)

	slot8 = slot6
	slot7 = slot6.AddListener
	slot9 = slot5

	function slot10(slot0)
		slot2 = slot0
		slot1 = slot0.emit
		slot3 = BaseUI
		slot3 = slot3.ON_BACK

		slot1(slot2, slot3)
	end

	slot7(slot8, slot9(slot10))

	slot7 = slot4.onLongPressed
	slot8 = pg
	slot8 = slot8.DelegateInfo
	slot8 = slot8.Add
	slot9 = slot0
	slot10 = slot7

	slot8(slot9, slot10)

	slot9 = slot7
	slot8 = slot7.RemoveAllListeners

	slot8(slot9)

	slot9 = slot7
	slot8 = slot7.AddListener
	slot10 = slot5

	function slot11(slot0)
		slot2 = slot0
		slot1 = slot0.emit
		slot3 = BaseUI
		slot3 = slot3.ON_HOME

		slot1(slot2, slot3)
	end

	slot8(slot9, slot10(slot11))
end

onBackButton = slot6

function slot6()
	slot0 = pg
	slot0 = slot0.TimeMgr
	slot0 = slot0.GetInstance
	slot0 = slot0()
	slot1 = slot0
	slot0 = slot0.GetNextTime
	slot2 = 0
	slot3 = 0
	slot4 = 0

	return slot0(slot1, slot2, slot3, slot4)
end

GetZeroTime = slot6

function slot6()
	slot0 = pg
	slot0 = slot0.TimeMgr
	slot0 = slot0.GetInstance
	slot0 = slot0()
	slot1 = slot0
	slot0 = slot0.GetNextTime
	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5 = 1800

	return slot0(slot1, slot2, slot3, slot4, slot5)
end

GetHalfHour = slot6

function slot6(slot0)
	slot1 = pg
	slot1 = slot1.TimeMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.GetServerTime
	slot1 = slot1(slot2)
	slot2 = pg
	slot2 = slot2.TimeMgr
	slot2 = slot2.GetInstance
	slot2 = slot2()
	slot3 = slot2
	slot2 = slot2.parseTimeFrom
	slot4 = slot1
	slot2, slot3 = slot2(slot3, slot4)
	slot4 = slot2 * 86400
	slot5 = slot3 + slot0
	slot5 = slot5 * 3600
	slot4 = slot4 + slot5

	return slot4
end

GetNextHour = slot6

function slot6(slot0, slot1)
	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5 = #slot0

	while slot2 < slot5 do
		slot6 = string
		slot6 = slot6.byte
		slot7 = slot0
		slot8 = slot2 + 1
		slot6 = slot6(slot7, slot8)
		slot7 = 1
		slot8 = 128

		if slot6 < slot8 then
			slot2 = slot2 + 1
			slot7 = 0.5
		else
			slot8 = 192

			if slot6 >= slot8 then
				slot8 = 224

				if slot6 < slot8 then
					slot2 = slot2 + 2
				end
			else
				slot8 = 224

				if slot6 >= slot8 then
					slot8 = 240

					if slot6 < slot8 then
						slot2 = slot2 + 3
					end
				else
					slot8 = 240

					if slot6 >= slot8 then
						slot8 = 248

						if slot6 < slot8 then
							slot2 = slot2 + 4
						end
					else
						slot8 = 248

						if slot6 >= slot8 then
							slot8 = 252

							if slot6 < slot8 then
								slot2 = slot2 + 5
							end
						else
							slot8 = 252

							if slot6 >= slot8 then
								slot8 = 254

								if slot6 < slot8 then
									slot2 = slot2 + 6
								end
							else
								slot8 = error
								slot9 = "invalid utf8 string"

								slot8(slot9)
							end
						end
					end
				end
			end
		end

		slot3 = slot3 + slot7

		if slot1 <= slot3 then
			slot4 = slot2

			break
		end
	end

	if slot4 == 0 or slot4 == slot5 then
		return slot0
	end

	slot6 = string
	slot6 = slot6.sub
	slot7 = slot0
	slot8 = 1
	slot9 = slot4
	slot6 = slot6(slot7, slot8, slot9)
	slot7 = ".."
	slot6 = slot6 .. slot7

	return slot6
end

shortenString = slot6

function slot6(slot0, slot1, slot2, slot3)
	slot4 = true
	slot5 = utf8_to_unicode
	slot6 = slot0
	slot5, slot6 = slot5(slot6)
	slot7 = filterEgyUnicode
	slot8 = filterSpecChars
	slot9 = slot0
	slot7 = slot7(slot8(slot9))
	slot8 = wordVer
	slot9 = slot0
	slot8 = slot8(slot9)
	slot9 = checkSpaceValid
	slot10 = slot0
	slot9 = slot9(slot10)

	if not slot9 then
		slot9 = pg
		slot9 = slot9.TipsMgr
		slot10 = slot9
		slot9 = slot9.GetInstance
		slot9 = slot9(slot10)
		slot10 = slot9
		slot9 = slot9.ShowTips
		slot11 = i18n
		slot12 = slot3[1]

		slot9(slot10, slot11(slot12))

		slot4 = false
	else
		slot9 = 0

		if slot8 > slot9 or slot7 ~= slot0 then
			slot9 = pg
			slot9 = slot9.TipsMgr
			slot10 = slot9
			slot9 = slot9.GetInstance
			slot9 = slot9(slot10)
			slot10 = slot9
			slot9 = slot9.ShowTips
			slot11 = i18n
			slot12 = slot3[4]

			slot9(slot10, slot11(slot12))

			slot4 = false
		elseif slot6 < slot1 then
			slot9 = pg
			slot9 = slot9.TipsMgr
			slot10 = slot9
			slot9 = slot9.GetInstance
			slot9 = slot9(slot10)
			slot10 = slot9
			slot9 = slot9.ShowTips
			slot11 = i18n
			slot12 = slot3[2]

			slot9(slot10, slot11(slot12))

			slot4 = false
		elseif slot2 < slot6 then
			slot9 = pg
			slot9 = slot9.TipsMgr
			slot10 = slot9
			slot9 = slot9.GetInstance
			slot9 = slot9(slot10)
			slot10 = slot9
			slot9 = slot9.ShowTips
			slot11 = i18n
			slot12 = slot3[3]

			slot9(slot10, slot11(slot12))

			slot4 = false
		end
	end

	return slot4
end

nameValidityCheck = slot6

function slot6(slot0)
	slot1 = PLATFORM_CODE
	slot2 = PLATFORM_US

	if slot1 == slot2 then
		slot1 = true

		return slot1
	end

	return slot0 == string.gsub(string.gsub(slot0, " ", ""), "　", "")
end

checkSpaceValid = slot6

function slot6(slot0)
	slot1 = {}
	slot2 = 0
	slot3 = 0
	slot4 = 0
	slot5 = 1
	slot6 = #slot0
	slot7 = 1

	for slot8 = slot5, slot6, slot7 do
		slot9 = string
		slot9 = slot9.byte
		slot10 = slot0
		slot11 = slot8
		slot9 = slot9(slot10, slot11)

		if not slot9 then
			break
		end

		slot10 = 48

		if slot9 >= slot10 then
			slot10 = 57

			if slot9 > slot10 then
				slot10 = 65

				if slot9 >= slot10 then
					slot10 = 90

					if slot9 > slot10 then
						slot10 = 97

						if slot9 >= slot10 then
							slot10 = 122

							if slot9 <= slot10 then
								slot10 = table
								slot10 = slot10.insert
								slot11 = slot1
								slot12 = string
								slot12 = slot12.char
								slot13 = slot9

								slot10(slot11, slot12(slot13))
							end
						else
							slot10 = 228

							if slot9 >= slot10 then
								slot10 = 233

								if slot9 <= slot10 then
									slot10 = string
									slot10 = slot10.byte
									slot11 = slot0
									slot12 = slot8 + 1
									slot10 = slot10(slot11, slot12)
									slot11 = string
									slot11 = slot11.byte
									slot12 = slot0
									slot13 = slot8 + 2
									slot11 = slot11(slot12, slot13)

									if slot10 and slot11 then
										slot12 = 128

										if slot10 >= slot12 then
											slot12 = 191

											if slot10 <= slot12 then
												slot12 = 128

												if slot11 >= slot12 then
													slot12 = 191

													if slot11 <= slot12 then
														slot8 = slot8 + 2
														slot12 = table
														slot12 = slot12.insert
														slot13 = slot1
														slot14 = string
														slot14 = slot14.char
														slot15 = slot9
														slot16 = slot10
														slot17 = slot11

														slot12(slot13, slot14(slot15, slot16, slot17))

														slot2 = slot2 + 1
													end
												end
											end
										end
									end
								end
							elseif slot9 == 227 then
								slot10 = PLATFORM_CODE
								slot11 = PLATFORM_JP

								if slot10 == slot11 then
									slot10 = string
									slot10 = slot10.byte
									slot11 = slot0
									slot12 = slot8 + 1
									slot10 = slot10(slot11, slot12)
									slot11 = string
									slot11 = slot11.byte
									slot12 = slot0
									slot13 = slot8 + 2
									slot11 = slot11(slot12, slot13)

									if slot10 and slot11 then
										slot12 = 128

										if slot10 > slot12 then
											slot12 = 191

											if slot10 <= slot12 then
												slot12 = 128

												if slot11 > slot12 then
													slot12 = 191

													if slot11 <= slot12 then
														slot8 = slot8 + 2
														slot12 = table
														slot12 = slot12.insert
														slot13 = slot1
														slot14 = string
														slot14 = slot14.char
														slot15 = slot9
														slot16 = slot10
														slot17 = slot11

														slot12(slot13, slot14(slot15, slot16, slot17))

														slot3 = slot3 + 1
													end
												end
											end
										end
									end
								end
							else
								slot10 = 233

								if slot9 > slot10 then
									slot10 = PLATFORM_CODE
									slot11 = PLATFORM_KR

									if slot10 == slot11 then
										slot10 = string
										slot10 = slot10.byte
										slot11 = slot0
										slot12 = slot8 + 1
										slot10 = slot10(slot11, slot12)
										slot11 = string
										slot11 = slot11.byte
										slot12 = slot0
										slot13 = slot8 + 2
										slot11 = slot11(slot12, slot13)

										if slot10 and slot11 then
											slot12 = 128

											if slot10 >= slot12 then
												slot12 = 191

												if slot10 <= slot12 then
													slot12 = 128

													if slot11 >= slot12 then
														slot12 = 191

														if slot11 <= slot12 then
															slot8 = slot8 + 2
															slot12 = table
															slot12 = slot12.insert
															slot13 = slot1
															slot14 = string
															slot14 = slot14.char
															slot15 = slot9
															slot16 = slot10
															slot17 = slot11

															slot12(slot13, slot14(slot15, slot16, slot17))

															slot4 = slot4 + 1
														end
													end
												end
											end
										end
									end
								else
									slot10 = PLATFORM_CODE
									slot11 = PLATFORM_US

									if slot10 == slot11 then
										if slot8 ~= 1 and slot9 == 32 then
											slot10 = string
											slot10 = slot10.byte
											slot11 = slot0
											slot12 = slot8 + 1
											slot10 = slot10(slot11, slot12)

											if slot10 == 32 then
												slot8 = slot8 + 1
											else
												slot11 = table
												slot11 = slot11.insert
												slot12 = slot1
												slot13 = string
												slot13 = slot13.char
												slot14 = slot9

												slot11(slot12, slot13(slot14))
											end
										end

										if slot9 == 195 then
											slot10 = string
											slot10 = slot10.byte
											slot11 = slot0
											slot12 = slot8 + 1
											slot10 = slot10(slot11, slot12)

											if slot10 == 188 then
												slot11 = table
												slot11 = slot11.insert
												slot12 = slot1
												slot13 = string
												slot13 = slot13.char
												slot14 = slot9
												slot15 = slot10

												slot11(slot12, slot13(slot14, slot15))
											end
										end
									end
								end
							end
						end
					end
				end
			end
		end

		if slot9 == 95 then
			slot10 = table
			slot10 = slot10.insert
			slot11 = slot1
			slot12 = string
			slot12 = slot12.char
			slot13 = slot9

			slot10(slot11, slot12(slot13))
		end
	end

	slot5 = table
	slot5 = slot5.concat
	slot6 = slot1
	slot5 = slot5(slot6)
	slot6 = slot2 + slot3
	slot6 = slot6 + slot4

	return slot5, slot6
end

filterSpecChars = slot6

function slot6(slot0)
	slot1 = string
	slot1 = slot1.gsub
	slot2 = slot0
	slot3 = "\\xf0\\x93[\\x80-\\x8f][\\x80-\\xbf]"
	slot4 = ""
	slot1 = slot1(slot2, slot3, slot4)
	slot0 = slot1
	slot1 = string
	slot1 = slot1.gsub
	slot2 = slot0
	slot3 = "\\xf0\\x93\\x90[\\x80-\\xaf]"
	slot4 = ""
	slot1 = slot1(slot2, slot3, slot4)
	slot0 = slot1

	return slot0
end

filterEgyUnicode = slot6

function slot6(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8)
	slot3 = slot3 or 0.2

	if slot5 then
		slot9 = LeanTween
		slot9 = slot9.cancel
		slot10 = go
		slot11 = slot0

		slot9(slot10(slot11))
	end

	slot9 = rtf
	slot10 = slot0
	slot9 = slot9(slot10)

	if not slot1 then
		slot10 = slot9.anchoredPosition
		slot1 = slot10.x
	end

	if not slot2 then
		slot10 = slot9.anchoredPosition
		slot2 = slot10.y
	end

	slot10 = LeanTween
	slot10 = slot10.move
	slot11 = slot9
	slot12 = Vector3
	slot13 = slot1
	slot14 = slot2
	slot15 = 0
	slot12 = slot12(slot13, slot14, slot15)
	slot13 = slot3
	slot10 = slot10(slot11, slot12, slot13)

	if not slot7 then
		slot11 = LeanTweenType
		slot7 = slot11.easeInOutSine
	end

	slot12 = slot10
	slot11 = slot10.setEase
	slot13 = slot7

	slot11(slot12, slot13)

	if slot4 then
		slot12 = slot10
		slot11 = slot10.setDelay
		slot13 = slot4

		slot11(slot12, slot13)
	end

	if slot6 then
		slot11 = GetOrAddComponent
		slot12 = slot0
		slot13 = "CanvasGroup"
		slot11 = slot11(slot12, slot13)
		slot12 = false
		slot11.blocksRaycasts = slot12
	end

	slot12 = slot10
	slot11 = slot10.setOnComplete
	slot13 = System
	slot13 = slot13.Action

	function slot14()
		slot0 = uv0

		if slot0 then
			slot0 = uv0

			slot0()
		end

		slot0 = uv1

		if slot0 then
			slot0 = GetOrAddComponent
			slot1 = uv2
			slot2 = "CanvasGroup"
			slot0 = slot0(slot1, slot2)
			slot1 = true
			slot0.blocksRaycasts = slot1
		end
	end

	slot11(slot12, slot13(slot14))

	return slot10
end

shiftPanel = slot6

function slot6(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)
	slot8 = LeanTween.value(go(slot0), slot1, slot2, slot3):setOnUpdate(System.Action_float(function (slot0)
		if uv0 then
			uv0(slot0)
		end
	end)):setOnComplete(System.Action(function ()
		if uv0 then
			uv0()
		end
	end)):setDelay(slot4 or 0)

	if slot7 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 32-34, warpins: 1 ---
		slot9 = 0

		if slot7 > slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 35-38, warpins: 1 ---
			slot10 = slot8
			slot9 = slot8.setRepeat
			slot11 = slot7

			slot9(slot10, slot11)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	return slot8
end

TweenValue = slot6

function slot6(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot3 = LeanTween
	slot3 = slot3.rotate
	slot4 = rtf
	slot5 = slot0
	slot4 = slot4(slot5)
	slot5 = 360 * slot1
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = slot3
	slot3 = slot3.setLoopClamp

	return slot3(slot4)
	--- END OF BLOCK #0 ---



end

rotateAni = slot6

function slot6(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 21-21, warpins: 2 ---
	slot5 = rtf(slot0)
	slot6 = slot3 or 0

	return LeanTween.alpha(slot5, slot6, slot1):setEase(LeanTweenType.easeInOutSine):setLoopPingPong(slot2 or 0)
	--- END OF BLOCK #0 ---



end

blinkAni = slot6

function slot6(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot4 = LeanTween
	slot4 = slot4.scale
	slot5 = rtf
	slot6 = slot0
	slot5 = slot5(slot6)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-8, warpins: 1 ---
		slot6 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 9-14, warpins: 2 ---
	slot7 = slot1
	slot4 = slot4(slot5, slot6, slot7)
	slot5 = slot4
	slot4 = slot4.setLoopPingPong

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 15-15, warpins: 1 ---
		slot6 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-16, warpins: 2 ---
	return slot4(slot5, slot6)
	--- END OF BLOCK #2 ---



end

scaleAni = slot6

function slot6(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot4 = slot0.localPosition
	slot4 = slot4.y
	slot4 = slot4 + slot1
	slot5 = LeanTween
	slot5 = slot5.moveY
	slot6 = rtf
	slot7 = slot0
	slot6 = slot6(slot7)
	slot7 = slot4
	slot8 = slot2
	slot5 = slot5(slot6, slot7, slot8)
	slot6 = slot5
	slot5 = slot5.setLoopPingPong

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-16, warpins: 1 ---
		slot7 = 0
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-17, warpins: 2 ---
	return slot5(slot6, slot7)
	--- END OF BLOCK #1 ---



end

floatAni = slot6
slot6 = tostring

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if slot0 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-4, warpins: 1 ---
		slot1 = "nil"

		return slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-9, warpins: 2 ---
	slot1 = uv0
	slot2 = slot0
	slot1 = slot1(slot2)

	if slot1 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-14, warpins: 1 ---
		slot2 = type
		slot3 = slot0
		slot2 = slot2(slot3)

		if slot2 == "table" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-16, warpins: 1 ---
			slot2 = "{}"

			return slot2
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 17-18, warpins: 2 ---
		slot2 = " ~nil"

		return slot2
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return slot1
	--- END OF BLOCK #2 ---



end

tostring = slot7

function slot7(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-3, warpins: 1 ---
		slot1 = {}
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 4-10, warpins: 2 ---
	slot2 = filterEgyUnicode
	slot3 = slot0
	slot2 = slot2(slot3)
	slot3 = #slot2
	slot4 = #slot0

	if slot3 ~= slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		slot3 = slot1.isReplace

		if slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-15, warpins: 1 ---
			slot0 = slot2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-17, warpins: 1 ---
			slot3 = 1

			return slot3
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 18-27, warpins: 3 ---
	slot3 = wordSplit
	slot4 = slot0
	slot3 = slot3(slot4)
	slot4 = pg
	slot4 = slot4.word_template
	slot5 = pg
	slot5 = slot5.word_legal_template
	slot6 = slot1.isReplace

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 28-28, warpins: 1 ---
		slot6 = false
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 29-32, warpins: 2 ---
	slot1.isReplace = slot6
	slot6 = slot1.replaceWord

	if not slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-33, warpins: 1 ---
		slot6 = "*"
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 34-38, warpins: 2 ---
	slot1.replaceWord = slot6
	slot6 = #slot3
	slot7 = 1
	slot8 = ""
	slot9 = 0

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 39-40, warpins: 5 ---
	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 41-83, warpins: 0 ---
	while slot7 <= slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 41-41, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 42-48, warpins: 1 ---
		slot10 = wordLegalMatch
		slot11 = slot3
		slot12 = slot5
		slot13 = slot7
		slot10, slot11, slot12 = slot10(slot11, slot12, slot13)

		if slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 49-53, warpins: 1 ---
			slot7 = slot11
			slot13 = slot8
			slot14 = slot12
			slot8 = slot13 .. slot14
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 54-65, warpins: 1 ---
			slot13 = wordVerMatch
			slot14 = slot3
			slot15 = slot4
			slot16 = slot1
			slot17 = slot7
			slot18 = ""
			slot19 = false
			slot20 = slot7
			slot21 = ""
			slot13, slot14, slot15 = slot13(slot14, slot15, slot16, slot17, slot18, slot19, slot20, slot21)

			if slot13 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 66-70, warpins: 1 ---
				slot7 = slot14
				slot9 = slot9 + 1
				slot16 = slot1.isReplace

				if slot16 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 71-74, warpins: 1 ---
					slot16 = slot8
					slot17 = slot15
					slot8 = slot16 .. slot17
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 75-77, warpins: 1 ---
				slot16 = slot1.isReplace

				if slot16 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 78-80, warpins: 1 ---
					slot16 = slot8
					slot17 = slot3[slot7]
					slot8 = slot16 .. slot17
					--- END OF BLOCK #0 ---



				end

				--- END OF BLOCK #0 ---

				FLOW; TARGET BLOCK #1



				-- Decompilation error in this vicinity:
				--- BLOCK #1 81-82, warpins: 2 ---
				slot7 = slot7 + 1
				--- END OF BLOCK #1 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 83-83, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 83-85, warpins: 1 ---
	slot10 = slot1.isReplace

	if slot10 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 86-89, warpins: 1 ---
		slot10 = slot9
		slot11 = slot8

		return slot10, slot11
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 90-90, warpins: 1 ---
		return slot9
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #7 ---

	FLOW; TARGET BLOCK #8



	-- Decompilation error in this vicinity:
	--- BLOCK #8 91-91, warpins: 2 ---
	return
	--- END OF BLOCK #8 ---



end

wordVer = slot7

function slot7(slot0, slot1, slot2, slot3, slot4)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot5 = #slot0

	if slot2 > slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot5 = slot3
		slot6 = slot2
		slot7 = slot4

		return slot5, slot6, slot7
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	slot5 = slot0[slot2]
	slot6 = slot1[slot5]

	if slot4 == nil then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-13, warpins: 1 ---
		slot4 = ""
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 14-15, warpins: 2 ---
	if slot6 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-18, warpins: 1 ---
		slot7 = slot6.this

		if slot7 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-28, warpins: 1 ---
			slot7 = wordLegalMatch
			slot8 = slot0
			slot9 = slot6
			slot10 = slot2 + 1
			slot11 = true
			slot12 = slot4
			slot13 = slot5
			slot12 = slot12 .. slot13

			return slot7(slot8, slot9, slot10, slot11, slot12)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-38, warpins: 1 ---
			slot7 = wordLegalMatch
			slot8 = slot0
			slot9 = slot6
			slot10 = slot2 + 1
			slot11 = false
			slot12 = slot4
			slot13 = slot5
			slot12 = slot12 .. slot13

			return slot7(slot8, slot9, slot10, slot11, slot12)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 39-42, warpins: 1 ---
		slot7 = slot3
		slot8 = slot2
		slot9 = slot4

		return slot7, slot8, slot9
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 43-43, warpins: 3 ---
	return
	--- END OF BLOCK #3 ---



end

wordLegalMatch = slot7

function slot7(slot0, slot1, slot2, slot3, slot4, slot5, slot6, slot7)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot8 = #slot0

	if slot3 > slot8 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-7, warpins: 1 ---
		slot8 = slot5
		slot9 = slot6
		slot10 = slot7

		return slot8, slot9, slot10
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	slot8 = slot0[slot3]
	slot9 = slot1[slot8]

	if slot9 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		slot10 = slot9.this

		if slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			slot10 = slot2.isReplace

			if slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-32, warpins: 1 ---
				slot10 = wordVerMatch
				slot11 = slot0
				slot12 = slot9
				slot13 = slot2
				slot14 = slot3 + 1
				slot15 = slot4
				slot16 = slot2.replaceWord
				slot15 = slot15 .. slot16
				slot16 = true
				slot17 = slot3 + 1
				slot18 = slot4
				slot19 = slot2.replaceWord
				slot18 = slot18 .. slot19

				return slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-43, warpins: 1 ---
				slot10 = wordVerMatch
				slot11 = slot0
				slot12 = slot9
				slot13 = slot2
				slot14 = slot3 + 1
				slot15 = slot4
				slot16 = true
				slot17 = slot3 + 1
				slot18 = slot4

				return slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 44-46, warpins: 1 ---
			slot10 = slot2.isReplace

			if slot10 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 47-59, warpins: 1 ---
				slot10 = wordVerMatch
				slot11 = slot0
				slot12 = slot9
				slot13 = slot2
				slot14 = slot3 + 1
				slot15 = slot4
				slot16 = slot2.replaceWord
				slot15 = slot15 .. slot16
				slot16 = slot5
				slot17 = slot6
				slot18 = slot7

				return slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 60-70, warpins: 1 ---
				slot10 = wordVerMatch
				slot11 = slot0
				slot12 = slot9
				slot13 = slot2
				slot14 = slot3 + 1
				slot15 = slot4
				slot16 = slot5
				slot17 = slot6
				slot18 = slot7

				return slot10(slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 71-74, warpins: 1 ---
		slot10 = slot5
		slot11 = slot6
		slot12 = slot7

		return slot10, slot11, slot12
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 75-75, warpins: 5 ---
	return
	--- END OF BLOCK #2 ---



end

wordVerMatch = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot1 = {}
	slot2 = slot0.gmatch
	slot3 = slot0
	slot4 = "[-\\xc2-\\xf4][\\x80-\\xbf]*"
	slot2, slot3, slot4 = slot2(slot3, slot4)

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-11, warpins: 0 ---
	for slot5 in slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-9, warpins: 1 ---
		slot6 = #slot1
		slot6 = slot6 + 1
		slot1[slot6] = slot5
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 10-11, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-12, warpins: 1 ---
	return slot1
	--- END OF BLOCK #2 ---



end

wordSplit = slot7

function slot7(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot3 = LuaHelper
	slot3 = slot3.WrapContent
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot4 = #slot3
	slot5 = #slot0

	if slot4 == slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		slot4 = false
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-13, warpins: 1 ---
		slot4 = true
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-15, warpins: 2 ---
	slot5 = slot3

	return slot4, slot5
	--- END OF BLOCK #1 ---



end

contentWrap = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = nil
	slot2 = 1
	slot3 = 20
	slot4 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-18, warpins: 0 ---
	for slot5 = slot2, slot3, slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-16, warpins: 2 ---
		slot6 = string
		slot6 = slot6.gsub
		slot7 = slot0
		slot8 = "<([^>]*)>"
		slot9 = "%1"
		slot6, slot7 = slot6(slot7, slot8, slot9)
		slot1 = slot7
		slot0 = slot6
		slot6 = 0

		if slot1 <= slot6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 17-17, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-18, warpins: 1 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 19-19, warpins: 2 ---
	return slot0
	--- END OF BLOCK #2 ---



end

cancelRich = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-1, warpins: 1 ---
	return
	--- END OF BLOCK #0 ---



end

filterCharForiOS = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot1 = require
	slot2 = "GameCfg.buff.buff_"
	slot3 = slot0
	slot2 = slot2 .. slot3
	slot1 = slot1(slot2)

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot2 = warn
		slot3 = "找不到技能配置: "
		slot4 = slot0
		slot3 = slot3 .. slot4

		slot2(slot3)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-37, warpins: 1 ---
	slot2 = Clone
	slot3 = slot1
	slot2 = slot2(slot3)
	slot3 = getSkillName
	slot4 = slot0
	slot3 = slot3(slot4)
	slot2.name = slot3
	slot3 = HXSet
	slot3 = slot3.hxLan
	slot4 = slot2.desc
	slot3 = slot3(slot4)
	slot2.desc = slot3
	slot3 = HXSet
	slot3 = slot3.hxLan
	slot4 = slot2.desc_get
	slot3 = slot3(slot4)
	slot2.desc_get = slot3
	slot3 = _
	slot3 = slot3.each
	slot4 = slot2

	function slot5(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = HXSet
		slot1 = slot1.hxLan
		slot2 = slot0.desc
		slot1 = slot1(slot2)
		slot0.desc = slot1

		return
		--- END OF BLOCK #0 ---



	end

	slot3(slot4, slot5)

	return slot2
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 38-38, warpins: 2 ---
	--- END OF BLOCK #2 ---



end

getSkillConfig = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = pg
	slot1 = slot1.skill_data_template
	slot1 = slot1[slot0]

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		slot2 = pg
		slot2 = slot2.skill_data_display
		slot1 = slot2[slot0]

		if not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-12, warpins: 1 ---
			slot2 = ""

			return slot2
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 13-16, warpins: 3 ---
	slot2 = HXSet
	slot2 = slot2.hxLan
	slot3 = slot1.name

	return slot2(slot3)
	--- END OF BLOCK #1 ---



end

getSkillName = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot1 = pg
	slot1 = slot1.skill_data_template
	slot1 = slot1[slot0]

	if not slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot2 = ""

		return slot2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-10, warpins: 2 ---
	slot2 = slot1.desc_get

	if slot2 ~= "" then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-13, warpins: 1 ---
		slot2 = slot1.desc_get

		if not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 2 ---
			slot2 = slot1.desc
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 15-18, warpins: 2 ---
	slot3 = pairs
	slot4 = slot1.desc_get_add
	slot3, slot4, slot5 = slot3(slot4)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 19-47, warpins: 0 ---
	for slot6, slot7 in slot3, slot4, slot5 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 19-25, warpins: 1 ---
		slot8 = setColorStr
		slot9 = slot7[1]
		slot10 = COLOR_GREEN
		slot8 = slot8(slot9, slot10)
		slot9 = slot7[2]

		if slot9 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-37, warpins: 1 ---
			slot9 = slot8
			slot10 = specialGSub
			slot11 = i18n
			slot12 = "word_skill_desc_get"
			slot11 = slot11(slot12)
			slot12 = "$1"
			slot13 = setColorStr
			slot14 = slot7[2]
			slot15 = COLOR_GREEN
			slot10 = slot10(slot11, slot12, slot13(slot14, slot15))
			slot8 = slot9 .. slot10
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 38-45, warpins: 2 ---
		slot9 = specialGSub
		slot10 = slot2
		slot11 = "$"
		slot12 = slot6
		slot11 = slot11 .. slot12
		slot12 = slot8
		slot9 = slot9(slot10, slot11, slot12)
		slot2 = slot9
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 46-47, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 48-51, warpins: 1 ---
	slot3 = HXSet
	slot3 = slot3.hxLan
	slot4 = slot2

	return slot3(slot4)
	--- END OF BLOCK #4 ---



end

getSkillDescGet = slot7

function slot7(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = pg
	slot2 = slot2.skill_data_template
	slot2 = slot2[slot0]

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot3 = ""

		return slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	slot3 = slot2.desc
	slot4 = slot2.desc_add

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 1 ---
		slot4 = HXSet
		slot4 = slot4.hxLan
		slot5 = slot3

		return slot4(slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-19, warpins: 2 ---
	slot4 = pairs
	slot5 = slot2.desc_add
	slot4, slot5, slot6 = slot4(slot5)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-48, warpins: 0 ---
	for slot7, slot8 in slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-25, warpins: 1 ---
		slot9 = slot8[slot1]
		slot9 = slot9[1]
		slot10 = slot8[slot1]
		slot10 = slot10[2]

		if slot10 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 26-35, warpins: 1 ---
			slot10 = slot9
			slot11 = specialGSub
			slot12 = i18n
			slot13 = "word_skill_desc_learn"
			slot12 = slot12(slot13)
			slot13 = "$1"
			slot14 = slot8[slot1]
			slot14 = slot14[2]
			slot11 = slot11(slot12, slot13, slot14)
			slot9 = slot10 .. slot11
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 36-46, warpins: 2 ---
		slot10 = specialGSub
		slot11 = slot3
		slot12 = "$"
		slot13 = slot7
		slot12 = slot12 .. slot13
		slot13 = setColorStr
		slot14 = slot9
		slot15 = COLOR_YELLOW
		slot10 = slot10(slot11, slot12, slot13(slot14, slot15))
		slot3 = slot10
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 47-48, warpins: 2 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 49-52, warpins: 1 ---
	slot4 = HXSet
	slot4 = slot4.hxLan
	slot5 = slot3

	return slot4(slot5)
	--- END OF BLOCK #4 ---



end

getSkillDescLearn = slot7

function slot7(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-5, warpins: 1 ---
	slot2 = pg
	slot2 = slot2.skill_data_template
	slot2 = slot2[slot0]

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-7, warpins: 1 ---
		slot3 = ""

		return slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	slot3 = slot2.desc
	slot4 = slot2.desc_add

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-15, warpins: 1 ---
		slot4 = HXSet
		slot4 = slot4.hxLan
		slot5 = slot3

		return slot4(slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 16-19, warpins: 2 ---
	slot4 = pairs
	slot5 = slot2.desc_add
	slot4, slot5, slot6 = slot4(slot5)

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-34, warpins: 0 ---
	for slot7, slot8 in slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 20-32, warpins: 1 ---
		slot9 = setColorStr
		slot10 = slot8[slot1]
		slot10 = slot10[1]
		slot11 = COLOR_GREEN
		slot9 = slot9(slot10, slot11)
		slot10 = specialGSub
		slot11 = slot3
		slot12 = "$"
		slot13 = slot7
		slot12 = slot12 .. slot13
		slot13 = slot9
		slot10 = slot10(slot11, slot12, slot13)
		slot3 = slot10
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 33-34, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 35-38, warpins: 1 ---
	slot4 = HXSet
	slot4 = slot4.hxLan
	slot5 = slot3

	return slot4(slot5)
	--- END OF BLOCK #4 ---



end

getSkillDesc = slot7

function slot7(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-36, warpins: 1 ---
	slot3 = string
	slot3 = slot3.gsub
	slot4 = slot0
	slot5 = "<color=#"
	slot6 = "<color=NNN"
	slot3 = slot3(slot4, slot5, slot6)
	slot0 = slot3
	slot3 = string
	slot3 = slot3.gsub
	slot4 = slot0
	slot5 = "#"
	slot6 = ""
	slot3 = slot3(slot4, slot5, slot6)
	slot0 = slot3
	slot3 = string
	slot3 = slot3.gsub
	slot4 = slot2
	slot5 = "%%"
	slot6 = "%%%%"
	slot3 = slot3(slot4, slot5, slot6)
	slot2 = slot3
	slot3 = string
	slot3 = slot3.gsub
	slot4 = slot0
	slot5 = slot1
	slot6 = slot2
	slot3 = slot3(slot4, slot5, slot6)
	slot0 = slot3
	slot3 = string
	slot3 = slot3.gsub
	slot4 = slot0
	slot5 = "<color=NNN"
	slot6 = "<color=#"
	slot3 = slot3(slot4, slot5, slot6)
	slot0 = slot3

	return slot0
	--- END OF BLOCK #0 ---



end

specialGSub = slot7

function slot7(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot6 = {}

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-4, warpins: 1 ---
		slot4 = 0.27
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 5-7, warpins: 2 ---
	slot7 = 0.05

	if slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-29, warpins: 1 ---
		slot8 = slot0.transform
		slot8 = slot8.localPosition
		slot8 = slot8.x
		slot9 = setAnchoredPosition
		slot10 = slot0
		slot11 = {}
		slot12 = slot8 - 500
		slot11.x = slot12

		slot9(slot10, slot11)

		slot9 = shiftPanel
		slot10 = slot0
		slot11 = slot8
		slot12 = nil
		slot13 = 0.05
		slot14 = slot4
		slot15 = true
		slot16 = true

		slot9(slot10, slot11, slot12, slot13, slot14, slot15, slot16)

		slot9 = setActive
		slot10 = slot0
		slot11 = true

		slot9(slot10, slot11)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 30-45, warpins: 2 ---
	slot8 = setActive
	slot9 = slot1
	slot10 = false

	slot8(slot9, slot10)

	slot8 = setActive
	slot9 = slot2
	slot10 = false

	slot8(slot9, slot10)

	slot8 = setActive
	slot9 = slot3
	slot10 = false

	slot8(slot9, slot10)

	slot8 = 1
	slot9 = 3
	slot10 = 1

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 46-76, warpins: 0 ---
	for slot11 = slot8, slot9, slot10 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 46-76, warpins: 2 ---
		slot12 = table
		slot12 = slot12.insert
		slot13 = slot6
		slot14 = LeanTween
		slot14 = slot14.delayedCall
		slot15 = slot4 + 0.13
		slot16 = slot7 * slot11
		slot15 = slot15 + slot16
		slot16 = System
		slot16 = slot16.Action

		function slot17()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0 = uv0

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-10, warpins: 1 ---
				slot0 = setActive
				slot1 = uv0
				slot2 = uv0
				slot2 = slot2.gameObject
				slot2 = slot2.activeSelf
				slot2 = not slot2

				slot0(slot1, slot2)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 11-11, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot14 = slot14(slot15, slot16(slot17))
		slot14 = slot14.uniqueId

		slot12(slot13, slot14)

		slot12 = table
		slot12 = slot12.insert
		slot13 = slot6
		slot14 = LeanTween
		slot14 = slot14.delayedCall
		slot15 = slot4 + 0.02
		slot16 = slot7 * slot11
		slot15 = slot15 + slot16
		slot16 = System
		slot16 = slot16.Action

		function slot17()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0 = uv0

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 4-11, warpins: 1 ---
				slot0 = setActive
				slot1 = uv0
				slot2 = go
				slot3 = uv0
				slot2 = slot2(slot3)
				slot2 = slot2.activeSelf
				slot2 = not slot2

				slot0(slot1, slot2)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 12-14, warpins: 2 ---
			slot0 = uv0

			if slot0 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 15-22, warpins: 1 ---
				slot0 = setActive
				slot1 = uv1
				slot2 = go
				slot3 = uv1
				slot2 = slot2(slot3)
				slot2 = slot2.activeSelf
				slot2 = not slot2

				slot0(slot1, slot2)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 23-23, warpins: 2 ---
			return
			--- END OF BLOCK #2 ---



		end

		slot14 = slot14(slot15, slot16(slot17))
		slot14 = slot14.uniqueId

		slot12(slot13, slot14)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 77-78, warpins: 1 ---
	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 79-94, warpins: 1 ---
		slot8 = table
		slot8 = slot8.insert
		slot9 = slot6
		slot10 = LeanTween
		slot10 = slot10.delayedCall
		slot11 = slot4 + 0.13
		slot12 = slot7 * 3
		slot11 = slot11 + slot12
		slot11 = slot11 + 0.1
		slot12 = System
		slot12 = slot12.Action

		function slot13()

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-3, warpins: 1 ---
			slot0 = uv0

			slot0()

			return
			--- END OF BLOCK #0 ---



		end

		slot10 = slot10(slot11, slot12(slot13))
		slot10 = slot10.uniqueId

		slot8(slot9, slot10)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 95-96, warpins: 2 ---
	return slot6
	--- END OF BLOCK #5 ---



end

topAnimation = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-7, warpins: 1 ---
		slot1 = LeanTween
		slot2 = slot1
		slot1 = slot1.cancelAll

		slot1(slot2)

		return
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 8-11, warpins: 2 ---
	slot1 = ipairs
	slot2 = slot0
	slot1, slot2, slot3 = slot1(slot2)

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 12-19, warpins: 0 ---
	for slot4, slot5 in slot1, slot2, slot3 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-13, warpins: 1 ---
		if slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-17, warpins: 1 ---
			slot6 = LeanTween
			slot6 = slot6.cancel
			slot7 = slot5

			slot6(slot7)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 18-19, warpins: 3 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 20-20, warpins: 1 ---
	return
	--- END OF BLOCK #3 ---



end

cancelTweens = slot7

function slot7(slot0, slot1, slot2, slot3)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot4 = slot2.x
	slot5 = slot1.width
	slot5 = slot5 / 2
	slot4 = slot4 + slot5
	slot5 = slot2.x
	slot6 = slot2.width
	slot5 = slot5 + slot6
	slot6 = slot1.width
	slot6 = slot6 / 2
	slot5 = slot5 - slot6
	slot6 = slot2.y
	slot7 = slot1.height
	slot7 = slot7 / 2
	slot6 = slot6 + slot7
	slot7 = slot2.y
	slot8 = slot2.height
	slot7 = slot7 + slot8
	slot8 = slot1.height
	slot8 = slot8 / 2
	slot7 = slot7 - slot8

	function slot8(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-4, warpins: 1 ---
		slot1 = slot0.x
		slot2 = uv0

		if slot2 <= slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 5-8, warpins: 1 ---
			slot1 = slot0.x
			slot2 = uv1

			if slot1 <= slot2 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-12, warpins: 1 ---
				slot1 = slot0.y
				slot2 = uv2

				if slot2 <= slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 13-16, warpins: 1 ---
					slot1 = slot0.y
					slot2 = uv3

					if slot1 > slot2 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 17-18, warpins: 4 ---
						slot1 = false
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 19-19, warpins: 1 ---
						slot1 = true
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
		--- BLOCK #1 20-20, warpins: 2 ---
		return slot1
		--- END OF BLOCK #1 ---



	end

	slot9 = 10
	slot10 = Quaternion
	slot10 = slot10.Euler
	slot11 = 0
	slot12 = 0
	slot13 = slot9
	slot10 = slot10(slot11, slot12, slot13)
	slot11 = 360 / slot9
	slot12 = 1
	slot13 = -1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-45, warpins: 0 ---
	for slot14 = slot11, slot12, slot13 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-41, warpins: 2 ---
		slot3 = slot10 * slot3
		slot15 = slot0.center
		slot15 = slot15 + slot3
		pos = slot15
		slot15 = slot8
		slot16 = pos
		slot15 = slot15(slot16)

		if slot15 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-44, warpins: 1 ---
			slot15 = pos

			return slot15
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-45, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 46-71, warpins: 1 ---
	slot11 = _
	slot11 = slot11.min
	slot12 = {}
	slot13 = Vector2
	slot14 = slot4
	slot15 = slot6
	slot13 = slot13(slot14, slot15)
	slot12[1] = slot13
	slot13 = Vector2
	slot14 = slot4
	slot15 = slot7
	slot13 = slot13(slot14, slot15)
	slot12[2] = slot13
	slot13 = Vector2
	slot14 = slot5
	slot15 = slot7
	slot13 = slot13(slot14, slot15)
	slot12[3] = slot13
	slot13 = Vector2
	slot14 = slot5
	slot15 = slot6
	slot12[MULTRES] = slot13(slot14, slot15)

	function slot13(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-6, warpins: 1 ---
		slot1 = Vector2
		slot1 = slot1.Distance
		slot2 = slot0
		slot3 = uv0
		slot3 = slot3.center

		return slot1(slot2, slot3)
		--- END OF BLOCK #0 ---



	end

	return slot11(slot12, slot13)
	--- END OF BLOCK #2 ---



end

calcRelativeRectPos = slot7
slot7 = os

function slot8(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-22, warpins: 1 ---
	slot2 = os
	slot2 = slot2.time
	slot2 = slot2()
	slot3 = os
	slot3 = slot3.difftime
	slot4 = slot2
	slot5 = os
	slot5 = slot5.time
	slot6 = os
	slot6 = slot6.date
	slot7 = "!*t"
	slot8 = slot2
	slot3 = slot3(slot4, slot5(slot6(slot7, slot8)))
	slot4 = SERVER_TIME_ZONE
	slot4 = slot4 - slot3
	slot5 = os
	slot5 = slot5.date
	slot6 = slot0
	slot7 = slot1 + slot4

	return slot5(slot6, slot7)
	--- END OF BLOCK #0 ---



end

slot7.server_date = slot8
slot7 = os

function slot8(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-23, warpins: 1 ---
	slot1 = os
	slot1 = slot1.time
	slot1 = slot1()
	slot2 = os
	slot2 = slot2.difftime
	slot3 = slot1
	slot4 = os
	slot4 = slot4.time
	slot5 = os
	slot5 = slot5.date
	slot6 = "!*t"
	slot7 = slot1
	slot2 = slot2(slot3, slot4(slot5(slot6, slot7)))
	slot3 = SERVER_TIME_ZONE
	slot3 = slot3 - slot2
	slot4 = os
	slot4 = slot4.time
	slot5 = slot0
	slot4 = slot4(slot5)
	slot4 = slot4 - slot3

	return slot4
	--- END OF BLOCK #0 ---



end

slot7.server_time = slot8

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot1 = pg
	slot1 = slot1.TimeMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.GetServerTime
	slot1 = slot1(slot2)
	slot2 = slot1 - slot0
	slot3 = ""
	slot4 = 59

	if slot2 <= slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-17, warpins: 1 ---
		slot4 = i18n
		slot5 = "just_now"
		slot4 = slot4(slot5)
		slot3 = slot4
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 18-20, warpins: 1 ---
		slot4 = 3599

		if slot2 <= slot4 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 21-29, warpins: 1 ---
			slot4 = i18n
			slot5 = "several_minutes_before"
			slot6 = math
			slot6 = slot6.floor
			slot7 = slot2 / 60
			slot4 = slot4(slot5, slot6(slot7))
			slot3 = slot4
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 30-32, warpins: 1 ---
			slot4 = 86399

			if slot2 <= slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-41, warpins: 1 ---
				slot4 = i18n
				slot5 = "several_hours_before"
				slot6 = math
				slot6 = slot6.floor
				slot7 = slot2 / 3600
				slot4 = slot4(slot5, slot6(slot7))
				slot3 = slot4
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 42-49, warpins: 1 ---
				slot4 = i18n
				slot5 = "several_days_before"
				slot6 = math
				slot6 = slot6.floor
				slot7 = slot2 / 86400
				slot4 = slot4(slot5, slot6(slot7))
				slot3 = slot4
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 50-50, warpins: 4 ---
	return slot3
	--- END OF BLOCK #1 ---



end

getOfflineTimeStamp = slot7

function slot7(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot3 = GameObject
	slot3 = slot3.Find
	slot4 = "OverlayCamera/Overlay/UITop/MoviePanel"
	slot3 = slot3(slot4)
	slot4 = IsNil
	slot5 = slot3
	slot4 = slot4(slot5)

	if not slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-25, warpins: 1 ---
		slot4 = pg
		slot4 = slot4.UIMgr
		slot5 = slot4
		slot4 = slot4.GetInstance
		slot4 = slot4(slot5)
		slot5 = slot4
		slot4 = slot4.LoadingOn

		slot4(slot5)

		slot4 = WWWLoader
		slot4 = slot4.Inst
		slot5 = slot4
		slot4 = slot4.LoadStreamingAsset
		slot6 = slot0

		function slot7(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-62, warpins: 1 ---
			slot1 = pg
			slot1 = slot1.UIMgr
			slot2 = slot1
			slot1 = slot1.GetInstance
			slot1 = slot1(slot2)
			slot2 = slot1
			slot1 = slot1.LoadingOff

			slot1(slot2)

			slot1 = GCHandle
			slot1 = slot1.Alloc
			slot2 = slot0
			slot3 = GCHandleType
			slot3 = slot3.Pinned
			slot1 = slot1(slot2, slot3)
			slot2 = setActive
			slot3 = uv0
			slot4 = true

			slot2(slot3, slot4)

			slot2 = uv0
			slot3 = slot2
			slot2 = slot2.AddComponent
			slot4 = typeof
			slot5 = CriManaMovieControllerForUI
			slot2 = slot2(slot3, slot4(slot5))
			slot3 = slot2.player
			slot4 = slot3
			slot3 = slot3.SetData
			slot5 = slot0
			slot6 = slot0.Length

			slot3(slot4, slot5, slot6)

			slot3 = uv0
			slot4 = slot3
			slot3 = slot3.GetComponent
			slot5 = typeof
			slot6 = Image
			slot3 = slot3(slot4, slot5(slot6))
			slot2.target = slot3
			slot3 = false
			slot2.loop = slot3
			slot3 = false
			slot2.additiveMode = slot3
			slot3 = true
			slot2.playOnStart = slot3
			slot3 = nil
			slot4 = Timer
			slot4 = slot4.New

			function slot5()

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-9, warpins: 1 ---
				slot0 = uv0
				slot0 = slot0.player
				slot0 = slot0.status
				slot1 = CriMana
				slot1 = slot1.Player
				slot1 = slot1.Status
				slot1 = slot1.PlayEnd

				if slot0 ~= slot1 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 10-18, warpins: 1 ---
					slot0 = uv0
					slot0 = slot0.player
					slot0 = slot0.status
					slot1 = CriMana
					slot1 = slot1.Player
					slot1 = slot1.Status
					slot1 = slot1.Stop

					if slot0 ~= slot1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 19-27, warpins: 1 ---
						slot0 = uv0
						slot0 = slot0.player
						slot0 = slot0.status
						slot1 = CriMana
						slot1 = slot1.Player
						slot1 = slot1.Status
						slot1 = slot1.Error

						if slot0 == slot1 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 28-46, warpins: 3 ---
							slot0 = uv1
							slot1 = slot0
							slot0 = slot0.Stop

							slot0(slot1)

							slot0 = Object
							slot0 = slot0.Destroy
							slot1 = uv0

							slot0(slot1)

							slot0 = GCHandle
							slot0 = slot0.Free
							slot1 = uv2

							slot0(slot1)

							slot0 = setActive
							slot1 = uv3
							slot2 = false

							slot0(slot1, slot2)

							slot0 = uv4

							if slot0 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 47-48, warpins: 1 ---
								slot0 = uv4

								slot0()
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
				--- BLOCK #1 49-49, warpins: 3 ---
				return
				--- END OF BLOCK #1 ---



			end

			slot6 = 0.2
			slot7 = -1
			slot4 = slot4(slot5, slot6, slot7)
			slot3 = slot4
			slot5 = slot3
			slot4 = slot3.Start

			slot4(slot5)

			slot4 = removeOnButton
			slot5 = uv0

			slot4(slot5)

			slot4 = uv2

			if slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-68, warpins: 1 ---
				slot4 = onButton
				slot5 = nil
				slot6 = uv0

				function slot7()

					-- Decompilation error in this vicinity:
					--- BLOCK #0 1-10, warpins: 1 ---
					slot0 = uv0
					slot1 = slot0
					slot0 = slot0.Stop

					slot0(slot1)

					slot0 = uv1
					slot0 = slot0.onClick
					slot1 = slot0
					slot0 = slot0.RemoveAllListeners

					slot0(slot1)

					return
					--- END OF BLOCK #0 ---



				end

				slot8 = SFX_CANCEL

				slot4(slot5, slot6, slot7, slot8)
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 69-70, warpins: 2 ---
			return
			--- END OF BLOCK #1 ---



		end

		slot4(slot5, slot6, slot7)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 26-27, warpins: 1 ---
		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 28-29, warpins: 1 ---
			slot4 = slot1

			slot4()
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 30-31, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

playMovie = slot7
slot7 = false
PaintCameraAdjustOn = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot1 = PaintCameraAdjustOn

	if slot1 ~= slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-15, warpins: 1 ---
		slot1 = GameObject
		slot1 = slot1.Find
		slot2 = "UICamera/Canvas"
		slot1 = slot1(slot2)
		slot2 = slot1
		slot1 = slot1.GetComponent
		slot3 = typeof
		slot4 = CanvasScaler
		slot1 = slot1(slot2, slot3(slot4))

		if slot0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-28, warpins: 1 ---
			slot2 = CameraUtil
			slot3 = false
			slot2.AutoAdapt = slot3
			slot2 = CameraUtil
			slot2 = slot2.Revert

			slot2()

			slot2 = CanvasScaler
			slot2 = slot2.ScreenMatchMode
			slot2 = slot2.MatchWidthOrHeight
			slot1.screenMatchMode = slot2
			slot2 = 1
			slot1.matchWidthOrHeight = slot2
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-44, warpins: 1 ---
			slot2 = CameraUtil
			slot3 = true
			slot2.AutoAdapt = slot3
			slot2 = CameraUtil
			slot3 = 1
			slot2.CurrentWidth = slot3
			slot2 = CameraUtil
			slot3 = 1
			slot2.CurrentHeight = slot3
			slot2 = CameraUtil
			slot3 = 1.7777777777777777
			slot2.AspectRatio = slot3
			slot2 = CanvasScaler
			slot2 = slot2.ScreenMatchMode
			slot2 = slot2.Expand
			slot1.screenMatchMode = slot2
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 45-45, warpins: 2 ---
		PaintCameraAdjustOn = slot0
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 46-46, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

cameraPaintViewAdjust = slot7

function slot7(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-14, warpins: 1 ---
	slot2 = math
	slot2 = slot2.abs
	slot3 = slot0.row
	slot4 = slot1.row
	slot3 = slot3 - slot4
	slot2 = slot2(slot3)
	slot3 = math
	slot3 = slot3.abs
	slot4 = slot0.column
	slot5 = slot1.column
	slot4 = slot4 - slot5
	slot3 = slot3(slot4)
	slot2 = slot2 + slot3

	return slot2
	--- END OF BLOCK #0 ---



end

ManhattonDist = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-9, warpins: 1 ---
	slot1 = getProxy
	slot2 = SettingsProxy
	slot1 = slot1(slot2)
	slot3 = slot1
	slot2 = slot1.checkReadHelp
	slot4 = slot0
	slot2 = slot2(slot3, slot4)

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-28, warpins: 1 ---
		slot2 = pg
		slot2 = slot2.MsgboxMgr
		slot2 = slot2.GetInstance
		slot2 = slot2()
		slot3 = slot2
		slot2 = slot2.ShowMsgBox
		slot4 = {}
		slot5 = MSGBOX_TYPE_HELP
		slot4.type = slot5
		slot5 = pg
		slot5 = slot5.gametip
		slot5 = slot5[slot0]
		slot5 = slot5.tip
		slot4.helps = slot5

		slot2(slot3, slot4)

		slot3 = slot1
		slot2 = slot1.recordReadHelp
		slot4 = slot0

		slot2(slot3, slot4)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 29-29, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

checkFirstHelpShow = slot7
slot7 = nil
preOrientation = slot7

function slot7()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-21, warpins: 1 ---
	slot0 = Input
	slot0 = slot0.deviceOrientation
	slot1 = slot0
	slot0 = slot0.ToString
	slot0 = slot0(slot1)
	preOrientation = slot0
	slot0 = print
	slot1 = "Begining Orientation:"
	slot2 = preOrientation
	slot1 = slot1 .. slot2

	slot0(slot1)

	slot0 = Screen
	slot1 = true
	slot0.autorotateToPortrait = slot1
	slot0 = Screen
	slot1 = true
	slot0.autorotateToPortraitUpsideDown = slot1
	slot0 = cameraPaintViewAdjust
	slot1 = true

	slot0(slot1)

	return
	--- END OF BLOCK #0 ---



end

openPortrait = slot7

function slot7()

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot0 = Screen
	slot1 = false
	slot0.autorotateToPortrait = slot1
	slot0 = Screen
	slot1 = false
	slot0.autorotateToPortraitUpsideDown = slot1
	slot0 = print
	slot1 = "Closing Orientation:"
	slot2 = preOrientation
	slot1 = slot1 .. slot2

	slot0(slot1)

	slot0 = Screen
	slot1 = ScreenOrientation
	slot1 = slot1.LandscapeLeft
	slot0.orientation = slot1
	slot0 = Timer
	slot0 = slot0.New

	function slot1()

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-5, warpins: 1 ---
		slot0 = Screen
		slot1 = ScreenOrientation
		slot1 = slot1.AutoRotation
		slot0.orientation = slot1

		return
		--- END OF BLOCK #0 ---



	end

	slot2 = 0.2
	slot3 = 1
	slot0 = slot0(slot1, slot2, slot3)
	slot1 = slot0
	slot0 = slot0.Start
	slot0 = slot0(slot1)
	slot1 = cameraPaintViewAdjust
	slot2 = false

	slot1(slot2)

	return
	--- END OF BLOCK #0 ---



end

closePortrait = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	slot1 = slot0
	slot2 = 0

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 3-3, warpins: 3 ---
	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 4-16, warpins: 0 ---
	while true do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-13, warpins: 1 ---
		slot3 = string
		slot3 = slot3.gsub
		slot4 = slot1
		slot5 = "^(-?%d+)(%d%d%d)"
		slot6 = "%1,%2"
		slot3, slot4 = slot3(slot4, slot5, slot6)
		slot2 = slot4
		slot1 = slot3

		if slot2 == 0 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 14-14, warpins: 1 ---
			break
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 15-15, warpins: 0 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 16-16, warpins: 0 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 16-16, warpins: 1 ---
	return slot1
	--- END OF BLOCK #3 ---



end

comma_value = slot7

function slot7(slot0, slot1, slot2, slot3, slot4, slot5)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-7, warpins: 1 ---
	slot6 = defaultValue
	slot7 = slot3
	slot8 = SWITCH_PANEL_TIME
	slot6 = slot6(slot7, slot8)
	slot3 = slot6

	if slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 8-13, warpins: 1 ---
		slot6 = LeanTween
		slot6 = slot6.cancel
		slot7 = go
		slot8 = slot0

		slot6(slot7(slot8))
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 14-33, warpins: 2 ---
	slot6 = Vector3
	slot6 = slot6.New
	slot7 = tf
	slot8 = slot0
	slot7 = slot7(slot8)
	slot7 = slot7.localPosition
	slot7 = slot7.x
	slot8 = tf
	slot9 = slot0
	slot8 = slot8(slot9)
	slot8 = slot8.localPosition
	slot8 = slot8.y
	slot9 = tf
	slot10 = slot0
	slot9 = slot9(slot10)
	slot9 = slot9.localPosition
	slot9 = slot9.z
	slot6 = slot6(slot7, slot8, slot9)

	if slot1 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 34-34, warpins: 1 ---
		slot6.x = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 35-36, warpins: 2 ---
	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 37-37, warpins: 1 ---
		slot6.y = slot2
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 38-52, warpins: 2 ---
	slot7 = LeanTween
	slot7 = slot7.move
	slot8 = rtf
	slot9 = slot0
	slot8 = slot8(slot9)
	slot9 = slot6
	slot10 = slot3
	slot7 = slot7(slot8, slot9, slot10)
	slot8 = slot7
	slot7 = slot7.setEase
	slot9 = LeanTweenType
	slot9 = slot9.easeInOutSine
	slot7 = slot7(slot8, slot9)

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 53-56, warpins: 1 ---
		slot9 = slot7
		slot8 = slot7.setDelay
		slot10 = slot4

		slot8(slot9, slot10)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 57-57, warpins: 2 ---
	return slot7
	--- END OF BLOCK #4 ---



end

SwitchPanel = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot1 = {}
	slot2 = {}
	slot3 = AssignedShipMediator
	slot2.mediator = slot3
	slot3 = AssignedShipScene
	slot2.viewComponent = slot3
	slot1[1] = slot2
	slot2 = {}
	slot3 = AssignedShipMediator
	slot2.mediator = slot3
	slot3 = AssignedShipScene2
	slot2.viewComponent = slot3
	slot1[2] = slot2
	slot2 = slot1[slot0]

	return slot2
	--- END OF BLOCK #0 ---



end

getSpecialItemPage = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-10, warpins: 1 ---
	slot2 = slot0
	slot1 = slot0.getConfig
	slot3 = "config_id"
	slot1 = slot1(slot2, slot3)
	slot2 = getActivityTask
	slot3 = slot0
	slot4 = true
	slot2, slot3 = slot2(slot3, slot4)

	if not slot3 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 11-12, warpins: 1 ---
		if slot1 == 0 or slot1 == 1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-28, warpins: 2 ---
			slot4 = pg
			slot4 = slot4.m02
			slot5 = slot4
			slot4 = slot4.sendNotification
			slot6 = GAME
			slot6 = slot6.ACTIVITY_OPERATION
			slot7 = {
				cmd = 1
			}
			slot8 = slot0.id
			slot7.activity_id = slot8
			slot7.arg1 = slot2

			slot4(slot5, slot6, slot7)

			slot4 = true

			return slot4
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-30, warpins: 1 ---
			if slot1 == 2 or slot1 == 3 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 33-44, warpins: 2 ---
				slot4 = pg
				slot4 = slot4.m02
				slot5 = slot4
				slot4 = slot4.sendNotification
				slot6 = GAME
				slot6 = slot6.ACTIVITY_OPERATION
				slot7 = {
					cmd = 1
				}
				slot8 = slot0.id
				slot7.activity_id = slot8

				slot4(slot5, slot6, slot7)

				slot4 = true

				return slot4
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 45-46, warpins: 4 ---
	slot4 = false

	return slot4
	--- END OF BLOCK #1 ---



end

updateActivityTaskStatus = slot7

function slot7(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-15, warpins: 1 ---
	slot3 = Vector3
	slot3 = slot3.one
	slot0.localScale = slot3
	slot3 = Vector2
	slot3 = slot3.zero
	slot0.anchorMin = slot3
	slot3 = Vector2
	slot3 = slot3.one
	slot0.anchorMax = slot3
	slot3 = setImageSprite
	slot4 = slot0
	slot5 = GetSpriteFromAtlas
	slot6 = "shipframe"

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 16-16, warpins: 1 ---
		slot7 = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 17-19, warpins: 2 ---
	slot3(slot4, slot5(slot6, slot7))

	return
	--- END OF BLOCK #1 ---



end

setShipCardFrame = slot7

function slot7(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot3 = Vector3
	slot3 = slot3.one
	slot0.localScale = slot3
	slot3 = Vector2
	slot3 = slot3.zero
	slot0.anchorMin = slot3
	slot3 = Vector2
	slot3 = slot3.one
	slot0.anchorMax = slot3
	slot3 = setImageSprite
	slot4 = slot0
	slot5 = GetSpriteFromAtlas
	slot6 = "shipframe"
	slot7 = "b"

	if not slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-17, warpins: 1 ---
		slot8 = slot1
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-21, warpins: 2 ---
	slot7 = slot7 .. slot8

	slot3(slot4, slot5(slot6, slot7))

	return
	--- END OF BLOCK #1 ---



end

setRectShipCardFrame = slot7

function slot7(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-68, warpins: 1 ---
	slot3 = slot1
	slot2 = slot1.rarity2bgPrint
	slot2 = slot2(slot3)
	slot3 = findTF
	slot4 = slot0
	slot5 = "content/bg"
	slot3 = slot3(slot4, slot5)
	slot4 = setImageSprite
	slot5 = slot3
	slot6 = GetSpriteFromAtlas
	slot7 = "bg/star_level_card_"
	slot8 = slot2
	slot7 = slot7 .. slot8
	slot8 = ""

	slot4(slot5, slot6(slot7, slot8))

	slot4 = findTF
	slot5 = slot0
	slot6 = "content/ship_icon"
	slot4 = slot4(slot5, slot6)
	slot5 = slot4
	slot4 = slot4.GetComponent
	slot6 = "Image"
	slot4 = slot4(slot5, slot6)
	slot5 = LoadSpriteAsync
	slot6 = "shipYardIcon/"
	slot8 = slot1
	slot7 = slot1.getPainting
	slot7 = slot7(slot8)
	slot6 = slot6 .. slot7

	function slot7(slot0)

		-- Decompilation error in this vicinity:
		--- BLOCK #0 1-3, warpins: 1 ---
		slot1 = uv0

		if slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 4-5, warpins: 1 ---
			slot1 = uv1
			slot1.sprite = slot0
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 6-6, warpins: 2 ---
		return
		--- END OF BLOCK #1 ---



	end

	slot5(slot6, slot7)

	slot6 = slot1
	slot5 = slot1.getShipType
	slot5 = slot5(slot6)
	slot6 = findTF
	slot7 = slot0
	slot8 = "content/info/top/type"
	slot6 = slot6(slot7, slot8)
	slot7 = setImageSprite
	slot8 = slot6
	slot9 = GetSpriteFromAtlas
	slot10 = "shiptype"
	slot11 = shipType2print
	slot12 = slot5

	slot7(slot8, slot9(slot10, slot11(slot12)))

	slot7 = setText
	slot8 = findTF
	slot9 = slot0
	slot10 = "content/dockyard/lv/Text"
	slot8 = slot8(slot9, slot10)
	slot9 = defaultValue
	slot10 = slot1.level
	slot11 = 1

	slot7(slot8, slot9(slot10, slot11))

	slot7 = findTF
	slot8 = slot0
	slot9 = "content/front/frame"
	slot7 = slot7(slot8, slot9)
	slot8 = setShipCardFrame
	slot9 = slot7
	slot10 = slot2
	slot11 = slot1.propose

	if slot11 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 69-74, warpins: 1 ---
		slot11 = "prop"
		slot13 = slot1
		slot12 = slot1.isBluePrintShip
		slot12 = slot12(slot13)

		if not slot12 or not slot2 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 77-77, warpins: 2 ---
			slot12 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 78-80, warpins: 2 ---
		slot11 = slot11 .. slot12

		if not slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 81-81, warpins: 2 ---
			slot11 = nil
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 82-105, warpins: 2 ---
	slot8(slot9, slot10, slot11)

	slot8 = findTF
	slot9 = slot0
	slot10 = "content/front/stars"
	slot8 = slot8(slot9, slot10)
	slot9 = setActive
	slot10 = slot8
	slot11 = true

	slot9(slot10, slot11)

	slot9 = findTF
	slot10 = slot8
	slot11 = "star_tpl"
	slot9 = slot9(slot10, slot11)
	slot10 = slot8.childCount
	slot12 = slot1
	slot11 = slot1.getStar
	slot11 = slot11(slot12)
	slot13 = slot1
	slot12 = slot1.getMaxStar
	slot12 = slot12(slot13)
	slot13 = slot10
	slot14 = slot12 - 1
	slot15 = 1

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 106-110, warpins: 0 ---
	for slot16 = slot13, slot14, slot15 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 106-110, warpins: 2 ---
		slot17 = cloneTplTo
		slot18 = slot9
		slot19 = slot8

		slot17(slot18, slot19)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 111-115, warpins: 1 ---
	slot10 = slot8.childCount
	slot13 = 0
	slot14 = slot10 - 1
	slot15 = 1

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 116-151, warpins: 0 ---
	for slot16 = slot13, slot14, slot15 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 116-124, warpins: 2 ---
		slot18 = slot8
		slot17 = slot8.GetChild
		slot19 = slot16
		slot17 = slot17(slot18, slot19)
		slot18 = slot17.gameObject
		slot19 = slot18
		slot18 = slot18.SetActive

		if slot16 >= slot12 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 125-126, warpins: 1 ---
			slot20 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 127-127, warpins: 1 ---
			slot20 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 128-135, warpins: 2 ---
		slot18(slot19, slot20)

		slot18 = SetActive
		slot20 = slot17
		slot19 = slot17.Find
		slot21 = "star_tpl"
		slot19 = slot19(slot20, slot21)

		if slot16 >= slot11 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 136-137, warpins: 1 ---
			slot20 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 138-138, warpins: 1 ---
			slot20 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 139-146, warpins: 2 ---
		slot18(slot19, slot20)

		slot18 = SetActive
		slot20 = slot17
		slot19 = slot17.Find
		slot21 = "star_empty_tpl"
		slot19 = slot19(slot20, slot21)

		if slot11 > slot16 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 147-148, warpins: 1 ---
			slot20 = false
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 149-149, warpins: 1 ---
			slot20 = true
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 150-151, warpins: 2 ---
		slot18(slot19, slot20)
		--- END OF BLOCK #3 ---



	end

	--- END OF BLOCK #4 ---

	FLOW; TARGET BLOCK #5



	-- Decompilation error in this vicinity:
	--- BLOCK #5 152-160, warpins: 1 ---
	slot13 = findTF
	slot14 = slot0
	slot15 = "content/front/bg_other"
	slot13 = slot13(slot14, slot15)
	slot14 = nil
	slot15 = false
	slot16 = slot1.propose

	if slot16 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 161-166, warpins: 1 ---
		slot16 = "duang_6_jiehun"
		slot18 = slot1
		slot17 = slot1.isBluePrintShip
		slot17 = slot17(slot18)

		if slot17 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 167-168, warpins: 1 ---
			slot17 = "_tuzhi"
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 169-169, warpins: 1 ---
			slot17 = ""
			--- END OF BLOCK #0 ---



		end

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 170-171, warpins: 2 ---
		slot14 = slot16 .. slot17
		--- END OF BLOCK #1 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 172-176, warpins: 1 ---
		slot17 = slot1
		slot16 = slot1.getRarity
		slot16 = slot16(slot17)

		if slot16 == 6 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 177-177, warpins: 1 ---
			slot14 = "duang_6"
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #5 ---

	FLOW; TARGET BLOCK #6



	-- Decompilation error in this vicinity:
	--- BLOCK #6 178-179, warpins: 3 ---
	if slot14 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 180-188, warpins: 1 ---
		slot16 = slot14
		slot17 = "(Clone)"
		slot16 = slot16 .. slot17
		slot17 = eachChild
		slot18 = slot13

		function slot19(slot0)

			-- Decompilation error in this vicinity:
			--- BLOCK #0 1-6, warpins: 1 ---
			slot1 = setActive
			slot2 = slot0
			slot3 = slot0.name
			slot4 = uv0

			if slot3 ~= slot4 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 7-8, warpins: 1 ---
				slot3 = false
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 9-9, warpins: 1 ---
				slot3 = true
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 10-13, warpins: 2 ---
			slot1(slot2, slot3)

			slot1 = uv1

			if not slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 14-17, warpins: 1 ---
				slot1 = slot0.name
				slot2 = uv0

				if slot1 ~= slot2 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 18-19, warpins: 1 ---
					slot1 = false
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 20-20, warpins: 1 ---
					slot1 = true
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end

			--- END OF BLOCK #1 ---

			FLOW; TARGET BLOCK #2



			-- Decompilation error in this vicinity:
			--- BLOCK #2 21-22, warpins: 3 ---
			uv1 = slot1

			return
			--- END OF BLOCK #2 ---



		end

		slot17(slot18, slot19)

		if not slot15 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 189-200, warpins: 1 ---
			slot17 = PoolMgr
			slot17 = slot17.GetInstance
			slot17 = slot17()
			slot18 = slot17
			slot17 = slot17.GetPrefab
			slot19 = "effect/"
			slot20 = slot14
			slot19 = slot19 .. slot20
			slot20 = ""
			slot21 = true

			function slot22(slot0)

				-- Decompilation error in this vicinity:
				--- BLOCK #0 1-5, warpins: 1 ---
				slot1 = setParent
				slot2 = slot0
				slot3 = uv0

				slot1(slot2, slot3)

				return
				--- END OF BLOCK #0 ---



			end

			slot17(slot18, slot19, slot20, slot21, slot22)
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 201-201, warpins: 2 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #6 ---

	FLOW; TARGET BLOCK #7



	-- Decompilation error in this vicinity:
	--- BLOCK #7 202-207, warpins: 2 ---
	slot16 = setActive
	slot17 = slot13
	slot18 = slot14

	slot16(slot17, slot18)

	return
	--- END OF BLOCK #7 ---



end

flushShipCard = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-28, warpins: 1 ---
	slot1 = LeanTween
	slot1 = slot1.cancel
	slot2 = go
	slot3 = slot0

	slot1(slot2(slot3))

	slot1 = GetOrAddComponent
	slot2 = slot0
	slot3 = "CanvasGroup"
	slot1 = slot1(slot2, slot3)
	slot2 = 0
	slot1.alpha = slot2
	slot2 = LeanTween
	slot2 = slot2.alphaCanvas
	slot3 = slot1
	slot4 = 1
	slot5 = 0.2
	slot2 = slot2(slot3, slot4, slot5)
	slot3 = slot2
	slot2 = slot2.setUseEstimatedTime
	slot4 = true

	slot2(slot3, slot4)

	slot2 = findTF
	slot3 = slot0.transform
	slot4 = "white_mask"
	slot2 = slot2(slot3, slot4)

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 29-32, warpins: 1 ---
		slot3 = setActive
		slot4 = slot2
		slot5 = false

		slot3(slot4, slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-33, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

TweenItemAlphaAndWhite = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-16, warpins: 1 ---
	slot1 = {}
	slot2 = getProxy
	slot3 = ShipSkinProxy
	slot2 = slot2(slot3)
	slot4 = slot2
	slot3 = slot2.getSkinList
	slot3 = slot3(slot4)
	slot4 = getProxy
	slot5 = CollectionProxy
	slot4 = slot4(slot5)
	slot5 = slot4
	slot4 = slot4.getShipGroup
	slot6 = slot0
	slot4 = slot4(slot5, slot6)

	if slot4 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-24, warpins: 1 ---
		slot5 = ShipGroup
		slot5 = slot5.getSkinList
		slot6 = slot0
		slot5 = slot5(slot6)
		slot6 = ipairs
		slot7 = slot5
		slot6, slot7, slot8 = slot6(slot7)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 25-57, warpins: 0 ---
		for slot9, slot10 in slot6, slot7, slot8 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 25-29, warpins: 1 ---
			slot11 = slot10.skin_type
			slot12 = Ship
			slot12 = slot12.SKIN_TYPE_DEFAULT

			if slot11 ~= slot12 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 30-36, warpins: 1 ---
				slot11 = table
				slot11 = slot11.contains
				slot12 = slot3
				slot13 = slot10.id
				slot11 = slot11(slot12, slot13)

				if not slot11 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 37-41, warpins: 1 ---
					slot11 = slot10.skin_type
					slot12 = Ship
					slot12 = slot12.SKIN_TYPE_REMAKE

					if slot11 == slot12 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 42-44, warpins: 1 ---
						slot11 = slot4.trans

						if not slot11 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 45-49, warpins: 2 ---
							slot11 = slot10.skin_type
							slot12 = Ship
							slot12 = slot12.SKIN_TYPE_PROPOSE

							if slot11 == slot12 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 50-52, warpins: 1 ---
								slot11 = slot4.married

								if slot11 == 1 then

									-- Decompilation error in this vicinity:
									--- BLOCK #0 53-55, warpins: 4 ---
									slot11 = slot10.id
									slot12 = true
									slot1[slot11] = slot12
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
			--- BLOCK #1 56-57, warpins: 4 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 58-58, warpins: 2 ---
	return slot1
	--- END OF BLOCK #1 ---



end

getGroupOwnSkins = slot7

function slot7(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-3, warpins: 1 ---
	slot2 = {}

	if not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 4-5, warpins: 1 ---
		slot3 = nil

		return slot3
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 6-7, warpins: 2 ---
	slot3 = #slot0
	slot4 = 1

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 8-9, warpins: 2 ---
	--- END OF BLOCK #2 ---

	FLOW; TARGET BLOCK #3



	-- Decompilation error in this vicinity:
	--- BLOCK #3 10-50, warpins: 0 ---
	while slot3 >= slot4 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 10-10, warpins: 1 ---
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 11-18, warpins: 1 ---
		slot5 = string
		slot5 = slot5.find
		slot6 = slot0
		slot7 = slot1
		slot8 = slot4
		slot5 = slot5(slot6, slot7, slot8)

		if slot5 == nil then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-29, warpins: 1 ---
			slot6 = table
			slot6 = slot6.insert
			slot7 = slot2
			slot8 = string
			slot8 = slot8.sub
			slot9 = slot0
			slot10 = slot4
			slot11 = slot3

			slot6(slot7, slot8(slot9, slot10, slot11))

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 30-30, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 30-41, warpins: 1 ---
		slot6 = table
		slot6 = slot6.insert
		slot7 = slot2
		slot8 = string
		slot8 = slot8.sub
		slot9 = slot0
		slot10 = slot4
		slot11 = slot5 - 1

		slot6(slot7, slot8(slot9, slot10, slot11))

		if slot5 == slot3 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 42-47, warpins: 1 ---
			slot6 = table
			slot6 = slot6.insert
			slot7 = slot2
			slot8 = ""

			slot6(slot7, slot8)

			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 48-48, warpins: 1 ---
			break
			--- END OF BLOCK #1 ---



		end

		--- END OF BLOCK #2 ---

		FLOW; TARGET BLOCK #3



		-- Decompilation error in this vicinity:
		--- BLOCK #3 48-49, warpins: 1 ---
		slot4 = slot5 + 1
		--- END OF BLOCK #3 ---

		FLOW; TARGET BLOCK #4



		-- Decompilation error in this vicinity:
		--- BLOCK #4 50-50, warpins: 1 ---
		--- END OF BLOCK #4 ---



	end

	--- END OF BLOCK #3 ---

	FLOW; TARGET BLOCK #4



	-- Decompilation error in this vicinity:
	--- BLOCK #4 50-50, warpins: 3 ---
	return slot2
	--- END OF BLOCK #4 ---



end

split = slot7

function slot7(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-6, warpins: 1 ---
	slot2 = ""
	slot3 = #slot0
	slot4 = 1
	slot5 = slot3
	slot6 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 7-70, warpins: 0 ---
	for slot7 = slot4, slot5, slot6 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 7-14, warpins: 2 ---
		slot8 = string
		slot8 = slot8.sub
		slot9 = slot0
		slot10 = slot7
		slot11 = slot7
		slot8 = slot8(slot9, slot10, slot11)

		if slot8 ~= "0" or slot8 == "0" and not slot1 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 19-20, warpins: 2 ---
			if slot1 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 21-23, warpins: 1 ---
				slot9 = 2

				if slot3 >= slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 24-25, warpins: 1 ---
					if slot7 == 1 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 26-27, warpins: 1 ---
						if slot8 == "1" then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 28-34, warpins: 1 ---
							slot9 = i18n
							slot10 = "number_"
							slot11 = 10
							slot10 = slot10 .. slot11
							slot9 = slot9(slot10)
							slot2 = slot9
							--- END OF BLOCK #0 ---



						else

							-- Decompilation error in this vicinity:
							--- BLOCK #0 35-46, warpins: 1 ---
							slot9 = i18n
							slot10 = "number_"
							slot11 = slot8
							slot10 = slot10 .. slot11
							slot9 = slot9(slot10)
							slot10 = i18n
							slot11 = "number_"
							slot12 = 10
							slot11 = slot11 .. slot12
							slot10 = slot10(slot11)
							slot2 = slot9 .. slot10
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 47-54, warpins: 1 ---
						slot9 = slot2
						slot10 = i18n
						slot11 = "number_"
						slot12 = slot8
						slot11 = slot11 .. slot12
						slot10 = slot10(slot11)
						slot2 = slot9 .. slot10
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 55-62, warpins: 1 ---
					slot9 = slot2
					slot10 = i18n
					slot11 = "number_"
					slot12 = slot8
					slot11 = slot11 .. slot12
					slot10 = slot10(slot11)
					slot2 = slot9 .. slot10
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 63-69, warpins: 1 ---
				slot9 = slot2
				slot10 = i18n
				slot11 = "number_"
				slot12 = slot8
				slot11 = slot11 .. slot12
				slot10 = slot10(slot11)
				slot2 = slot9 .. slot10
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 70-70, warpins: 7 ---
		--- END OF BLOCK #1 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 71-71, warpins: 1 ---
	return slot2
	--- END OF BLOCK #2 ---



end

NumberToChinese = slot7

function slot7(slot0, slot1)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-32, warpins: 1 ---
	slot2 = getProxy
	slot3 = TaskProxy
	slot2 = slot2(slot3)
	slot4 = slot0
	slot3 = slot0.getConfig
	slot5 = "config_data"
	slot3 = slot3(slot4, slot5)
	slot4 = pg
	slot4 = slot4.TimeMgr
	slot4 = slot4.GetInstance
	slot4 = slot4()
	slot6 = slot4
	slot5 = slot4.DiffDay
	slot7 = slot0.data1
	slot9 = slot4
	slot8 = slot4.GetServerTime
	slot5 = slot5(slot6, slot7, slot8(slot9))
	slot5 = slot5 + 1
	slot6, slot7, slot8, slot9 = nil
	slot10 = math
	slot10 = slot10.max
	slot11 = slot0.data3
	slot12 = 1
	slot10 = slot10(slot11, slot12)
	slot11 = math
	slot11 = slot11.min
	slot12 = slot5
	slot13 = #slot3
	slot11 = slot11(slot12, slot13)
	slot12 = 1

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 33-75, warpins: 0 ---
	for slot13 = slot10, slot11, slot12 do

		-- Decompilation error in this vicinity:
		--- BLOCK #0 33-42, warpins: 2 ---
		slot14 = _
		slot14 = slot14.flatten
		slot15 = {}
		slot16 = slot3[slot13]
		slot15[1] = slot16
		slot14 = slot14(slot15)
		slot15 = ipairs
		slot16 = slot14
		slot15, slot16, slot17 = slot15(slot16)

		--- END OF BLOCK #0 ---

		FLOW; TARGET BLOCK #1



		-- Decompilation error in this vicinity:
		--- BLOCK #1 43-74, warpins: 0 ---
		for slot18, slot19 in slot15, slot16, slot17 do

			-- Decompilation error in this vicinity:
			--- BLOCK #0 43-54, warpins: 1 ---
			slot21 = slot2
			slot20 = slot2.getTaskById
			slot22 = slot19
			slot20 = slot20(slot21, slot22)
			slot8 = slot20
			slot21 = slot2
			slot20 = slot2.getFinishTaskById
			slot22 = slot19
			slot20 = slot20(slot21, slot22)
			slot9 = slot20

			if slot8 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 55-58, warpins: 1 ---
				slot20 = slot19
				slot21 = slot8

				return slot20, slot21
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 59-60, warpins: 1 ---
				if slot9 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 61-63, warpins: 1 ---
					slot6 = slot19
					slot7 = slot9
					--- END OF BLOCK #0 ---



				else

					-- Decompilation error in this vicinity:
					--- BLOCK #0 64-65, warpins: 1 ---
					if slot1 or not slot6 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 68-69, warpins: 2 ---
						return slot19
						--- END OF BLOCK #0 ---



					else

						-- Decompilation error in this vicinity:
						--- BLOCK #0 70-72, warpins: 1 ---
						slot20 = slot6
						slot21 = slot7

						return slot20, slot21
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---

			FLOW; TARGET BLOCK #1



			-- Decompilation error in this vicinity:
			--- BLOCK #1 73-74, warpins: 5 ---
			--- END OF BLOCK #1 ---



		end
		--- END OF BLOCK #1 ---

		FLOW; TARGET BLOCK #2



		-- Decompilation error in this vicinity:
		--- BLOCK #2 75-75, warpins: 1 ---
		--- END OF BLOCK #2 ---



	end

	--- END OF BLOCK #1 ---

	FLOW; TARGET BLOCK #2



	-- Decompilation error in this vicinity:
	--- BLOCK #2 76-78, warpins: 1 ---
	slot10 = slot6
	slot11 = slot7

	return slot10, slot11
	--- END OF BLOCK #2 ---



end

getActivityTask = slot7

function slot7(slot0, slot1, slot2)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-12, warpins: 1 ---
	slot3 = GetComponent
	slot4 = slot0
	slot5 = "Image"
	slot3 = slot3(slot4, slot5)
	slot4 = GetComponent
	slot5 = slot1
	slot6 = "Image"
	slot4 = slot4(slot5, slot6)
	slot4 = slot4.sprite
	slot3.sprite = slot4

	if slot2 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 13-15, warpins: 1 ---
		slot5 = slot3
		slot4 = slot3.SetNativeSize

		slot4(slot5)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 16-16, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

setImageFromImage = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1 = pg
	slot1 = slot1.TimeMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.parseTimeFrom
	slot3 = slot0
	slot1, slot2, slot3, slot4 = slot1(slot2, slot3)
	slot5 = 1

	if slot1 >= slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-16, warpins: 1 ---
		slot5 = i18n
		slot6 = "limit_skin_time_day"
		slot7 = slot1

		return slot5(slot6, slot7)
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 17-19, warpins: 1 ---
		slot5 = 0

		if slot1 <= slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 20-22, warpins: 1 ---
			slot5 = 0

			if slot2 > slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 23-28, warpins: 1 ---
				slot5 = i18n
				slot6 = "limit_skin_time_day_min"
				slot7 = slot2
				slot8 = slot3

				return slot5(slot6, slot7, slot8)
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 29-31, warpins: 2 ---
			slot5 = 0

			if slot1 <= slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 32-34, warpins: 1 ---
				slot5 = 0

				if slot2 <= slot5 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 35-37, warpins: 1 ---
					slot5 = 0

					if slot3 <= slot5 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 38-40, warpins: 1 ---
						slot5 = 0

						if slot4 > slot5 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 41-49, warpins: 2 ---
							slot5 = i18n
							slot6 = "limit_skin_time_min"
							slot7 = math
							slot7 = slot7.max
							slot8 = slot3
							slot9 = 1

							return slot5(slot6, slot7(slot8, slot9))
							--- END OF BLOCK #0 ---



						end
						--- END OF BLOCK #0 ---



					end
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			else

				-- Decompilation error in this vicinity:
				--- BLOCK #0 50-52, warpins: 3 ---
				slot5 = 0

				if slot1 <= slot5 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 53-55, warpins: 1 ---
					slot5 = 0

					if slot2 <= slot5 then

						-- Decompilation error in this vicinity:
						--- BLOCK #0 56-58, warpins: 1 ---
						slot5 = 0

						if slot3 <= slot5 then

							-- Decompilation error in this vicinity:
							--- BLOCK #0 59-61, warpins: 1 ---
							slot5 = 0

							if slot4 <= slot5 then

								-- Decompilation error in this vicinity:
								--- BLOCK #0 62-64, warpins: 1 ---
								slot5 = i18n
								slot6 = "limit_skin_time_overtime"

								return slot5(slot6)
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
	--- BLOCK #1 65-65, warpins: 8 ---
	return
	--- END OF BLOCK #1 ---



end

skinTimeStamp = slot7

function slot7(slot0)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-11, warpins: 1 ---
	slot1 = pg
	slot1 = slot1.TimeMgr
	slot1 = slot1.GetInstance
	slot1 = slot1()
	slot2 = slot1
	slot1 = slot1.parseTimeFrom
	slot3 = slot0
	slot1, slot2, slot3, slot4 = slot1(slot2, slot3)
	slot5 = 0

	if slot1 <= slot5 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 12-14, warpins: 1 ---
		slot5 = 0

		if slot2 <= slot5 then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 15-17, warpins: 1 ---
			slot5 = 0

			if slot3 <= slot5 then

				-- Decompilation error in this vicinity:
				--- BLOCK #0 18-20, warpins: 1 ---
				slot5 = 0

				if slot4 <= slot5 then

					-- Decompilation error in this vicinity:
					--- BLOCK #0 21-24, warpins: 1 ---
					slot5 = i18n
					slot6 = "limit_skin_time_overtime"

					return slot5(slot6)
					--- END OF BLOCK #0 ---



				end
				--- END OF BLOCK #0 ---



			end
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 25-30, warpins: 4 ---
		slot5 = i18n
		slot6 = "attire_time_stamp"
		slot7 = slot1
		slot8 = slot2
		slot9 = slot3

		return slot5(slot6, slot7, slot8, slot9)
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 31-31, warpins: 2 ---
	return
	--- END OF BLOCK #1 ---



end

attireTimeStamp = slot7

function slot7(slot0, slot1, ...)

	-- Decompilation error in this vicinity:
	--- BLOCK #0 1-2, warpins: 1 ---
	if not slot0 then

		-- Decompilation error in this vicinity:
		--- BLOCK #0 3-5, warpins: 1 ---
		slot2 = false

		return slot2
		--- END OF BLOCK #0 ---



	else

		-- Decompilation error in this vicinity:
		--- BLOCK #0 6-10, warpins: 1 ---
		slot2 = type
		slot3 = slot0[slot1]
		slot2 = slot2(slot3)

		if slot2 == "function" then

			-- Decompilation error in this vicinity:
			--- BLOCK #0 11-15, warpins: 1 ---
			slot2 = slot0[slot1]
			slot3 = slot0

			return slot2(slot3, ...)
			--- END OF BLOCK #0 ---



		else

			-- Decompilation error in this vicinity:
			--- BLOCK #0 16-17, warpins: 1 ---
			slot2 = slot0[slot1]

			return slot2
			--- END OF BLOCK #0 ---



		end
		--- END OF BLOCK #0 ---



	end

	--- END OF BLOCK #0 ---

	FLOW; TARGET BLOCK #1



	-- Decompilation error in this vicinity:
	--- BLOCK #1 18-18, warpins: 3 ---
	return
	--- END OF BLOCK #1 ---



end

checkExist = slot7
