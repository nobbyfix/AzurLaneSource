slot1 = table
slot2 = ipairs
slot3 = assert
slot4 = require("pb")
slot5 = require("wire_format")

module("encoder")

function _VarintSize(slot0)
	if slot0 <= 127 then
		return 1
	end

	if slot0 <= 16383 then
		return 2
	end

	if slot0 <= 2097151 then
		return 3
	end

	if slot0 <= 268435455 then
		return 4
	end

	if slot0 <= 34359738367.0 then
		return 5
	end

	if slot0 <= 4398046511103.0 then
		return 6
	end

	if slot0 <= 562949953421311.0 then
		return 7
	end

	if slot0 <= 7.205759403792794e+16 then
		return 8
	end

	if slot0 <= 9.223372036854776e+18 then
		return 9
	end

	return 10
end

function _SignedVarintSize(slot0)
	if slot0 < 0 then
		return 10
	end

	if slot0 <= 127 then
		return 1
	end

	if slot0 <= 16383 then
		return 2
	end

	if slot0 <= 2097151 then
		return 3
	end

	if slot0 <= 268435455 then
		return 4
	end

	if slot0 <= 34359738367.0 then
		return 5
	end

	if slot0 <= 4398046511103.0 then
		return 6
	end

	if slot0 <= 562949953421311.0 then
		return 7
	end

	if slot0 <= 7.205759403792794e+16 then
		return 8
	end

	if slot0 <= 9.223372036854776e+18 then
		return 9
	end

	return 10
end

function _TagSize(slot0)
	return _VarintSize(slot0:PackTag(0))
end

function _SimpleSizer(slot0)
	return function (slot0, slot1, slot2)
		slot3 = _TagSize(slot0)

		if slot2 then
			slot4 = _VarintSize

			return function (slot0)
				slot1 = 0

				for slot5, slot6 in slot0(slot0) do
					slot1 = slot1 + slot1(slot6)
				end

				return slot1 + slot2(slot1) + slot1
			end
			return
		end

		if slot1 then
			return function (slot0)
				for slot5, slot6 in slot1(slot0) do
					slot1 = slot1 + slot2(slot6)
				end

				return slot1
			end
		else
			return function (slot0)
				return slot0 + slot1(slot0)
			end
		end
	end
end

function _ModifiedSizer(slot0, slot1)
	return function (slot0, slot1, slot2)
		slot3 = _TagSize(slot0)

		if slot2 then
			slot4 = _VarintSize

			return function (slot0)
				slot1 = 0

				for slot5, slot6 in slot0(slot0) do
					slot1 = slot1 + slot1(slot2(slot6))
				end

				return slot1 + slot3(slot1) + slot4
			end
			return
		end

		if slot1 then
			return function (slot0)
				for slot5, slot6 in slot1(slot0) do
					slot1 = slot1 + slot2(slot3(slot6))
				end

				return slot1
			end
		else
			return function (slot0)
				return slot0 + slot1(slot1(slot0))
			end
		end
	end
end

function _FixedSizer(slot0)
	return function (slot0, slot1, slot2)
		slot3 = _TagSize(slot0)

		if slot2 then
			slot4 = _VarintSize

			return function (slot0)
				return #slot0 * slot0 + slot1(slot1) + 
			end
			return
		end

		if slot1 then
			slot4 = slot0 + slot3

			return function (slot0)
				return #slot0 * slot0
			end
		else
			slot4 = slot0 + slot3

			return function (slot0)
				return slot0
			end
		end
	end
end

Int32Sizer = _SimpleSizer(_SignedVarintSize)
Int64Sizer = _SimpleSizer(slot4.signed_varint_size)
EnumSizer = Int32Sizer
UInt32Sizer = _SimpleSizer(_VarintSize)
UInt64Sizer = _SimpleSizer(slot4.varint_size)
SInt32Sizer = _ModifiedSizer(_SignedVarintSize, slot5.ZigZagEncode32)
SInt64Sizer = SInt32Sizer
Fixed32Sizer = _FixedSizer(4)
SFixed32Sizer = Fixed32Sizer
FloatSizer = Fixed32Sizer
Fixed64Sizer = _FixedSizer(8)
SFixed64Sizer = Fixed64Sizer
DoubleSizer = Fixed64Sizer
BoolSizer = _FixedSizer(1)

function StringSizer(slot0, slot1, slot2)
	slot3 = _TagSize(slot0)
	slot4 = _VarintSize

	if slot1 then
		return function (slot0)
			for slot5, slot6 in slot1(slot0) do
				slot1 = slot1 + slot2(#slot6) + #slot6
			end

			return slot1
		end
	else
		return function (slot0)
			return slot0 + slot1(#slot0) + #slot0
		end
	end
end

function BytesSizer(slot0, slot1, slot2)
	slot3 = _TagSize(slot0)
	slot4 = _VarintSize

	if slot1 then
		return function (slot0)
			for slot5, slot6 in slot1(slot0) do
				slot1 = slot1 + slot2(#slot6) + #slot6
			end

			return slot1
		end
	else
		return function (slot0)
			return slot0 + slot1(#slot0) + #slot0
		end
	end
end

function MessageSizer(slot0, slot1, slot2)
	slot3 = _TagSize(slot0)
	slot4 = _VarintSize

	if slot1 then
		return function (slot0)
			for slot5, slot6 in slot1(slot0) do
				slot1 = slot1 + slot2(slot6:ByteSize()) + slot6.ByteSize()
			end

			return slot1
		end
	else
		return function (slot0)
			slot1 = slot0:ByteSize()

			return slot0 + slot1(slot1) + slot1
		end
	end
end

function _VarintBytes(slot0)
	slot0(slot2, slot0)

	return slot1.concat({})
end

function TagBytes(slot0, slot1)
	return _VarintBytes(slot0:PackTag(slot1))
end

function _SimpleEncoder(slot0, slot1, slot2)
	return function (slot0, slot1, slot2)
		if slot2 then
			slot3 = TagBytes(slot0, slot0.WIRETYPE_LENGTH_DELIMITED)
			slot4 = slot1

			return function (slot0, slot1)
				slot0(slot0)

				slot2 = 0

				for slot6, slot7 in slot1(slot1) do
					slot2 = slot2 + slot2(slot7)
				end

				slot3(slot0, slot2)

				for slot6 in slot1 do
					slot4(slot0, slot6)
				end
			end
			return
		end

		if slot1 then
			slot3 = TagBytes(slot0, slot5)

			return function (slot0, slot1)
				for slot5, slot6 in slot0(slot1) do
					slot0(slot1)
					slot2(slot0, slot6)
				end
			end
		else
			slot3 = TagBytes(slot0, slot5)

			return function (slot0, slot1)
				slot0(slot0)
				slot1(slot0, slot1)
			end
		end
	end
end

function _ModifiedEncoder(slot0, slot1, slot2, slot3)
	return function (slot0, slot1, slot2)
		if slot2 then
			slot3 = TagBytes(slot0, slot0.WIRETYPE_LENGTH_DELIMITED)
			slot4 = slot1

			return function (slot0, slot1)
				slot0(slot0)

				slot2 = 0

				for slot6, slot7 in slot1(slot1) do
					slot2 = slot2 + slot2(slot3(slot7))
				end

				slot4(slot0, slot2)

				for slot6, slot7 in slot1(slot1) do
					slot5(slot0, slot3(slot7))
				end
			end
			return
		end

		if slot1 then
			slot3 = TagBytes(slot0, slot6)

			return function (slot0, slot1)
				for slot5, slot6 in slot0(slot1) do
					slot0(slot1)
					slot2(slot0, slot3(slot6))
				end
			end
		else
			slot3 = TagBytes(slot0, slot6)

			return function (slot0, slot1)
				slot0(slot0)
				slot1(slot0, slot1(slot1))
			end
		end
	end
end

function _StructPackEncoder(slot0, slot1, slot2)
	return function (slot0, slot1, slot2)
		slot3 = slot0.struct_pack

		if slot2 then
			slot4 = TagBytes(slot0, slot1.WIRETYPE_LENGTH_DELIMITED)
			slot5 = slot2

			return function (slot0, slot1)
				slot0(slot0)
				slot1(slot0, #slot1 * slot1)

				for slot5, slot6 in slot0(slot1) do
					slot4(slot0, slot5, slot6)
				end
			end
			return
		end

		if slot1 then
			slot4 = TagBytes(slot0, slot6)

			return function (slot0, slot1)
				for slot5, slot6 in slot0(slot1) do
					slot0(slot1)
					slot2(slot0, slot3, slot6)
				end
			end
		else
			slot4 = TagBytes(slot0, slot6)

			return function (slot0, slot1)
				slot0(slot0)
				slot1(slot0, slot1, slot1)
			end
		end
	end
end

Int32Encoder = _SimpleEncoder(slot5.WIRETYPE_VARINT, slot7, _SignedVarintSize)
Int64Encoder = _SimpleEncoder(slot5.WIRETYPE_VARINT, slot9, _SignedVarintSize)
EnumEncoder = Int32Encoder
UInt32Encoder = _SimpleEncoder(slot5.WIRETYPE_VARINT, slot6, _VarintSize)
UInt64Encoder = _SimpleEncoder(slot5.WIRETYPE_VARINT, slot8, _VarintSize)
SInt32Encoder = _ModifiedEncoder(slot5.WIRETYPE_VARINT, slot6, _VarintSize, slot5.ZigZagEncode32)
SInt64Encoder = _ModifiedEncoder(slot5.WIRETYPE_VARINT, slot8, _VarintSize, slot5.ZigZagEncode64)
Fixed32Encoder = _StructPackEncoder(slot5.WIRETYPE_FIXED32, 4, string.byte("I"))
Fixed64Encoder = _StructPackEncoder(slot5.WIRETYPE_FIXED64, 8, string.byte("Q"))
SFixed32Encoder = _StructPackEncoder(slot5.WIRETYPE_FIXED32, 4, string.byte("i"))
SFixed64Encoder = _StructPackEncoder(slot5.WIRETYPE_FIXED64, 8, string.byte("q"))
FloatEncoder = _StructPackEncoder(slot5.WIRETYPE_FIXED32, 4, string.byte("f"))
DoubleEncoder = _StructPackEncoder(slot5.WIRETYPE_FIXED64, 8, string.byte("d"))

function BoolEncoder(slot0, slot1, slot2)
	slot3 = " "
	slot4 = ""

	if slot2 then
		slot5 = TagBytes(slot0, slot0.WIRETYPE_LENGTH_DELIMITED)
		slot6 = slot1

		return function (slot0, slot1)
			slot0(slot0)
			slot1(slot0, #slot1)

			for slot5, slot6 in slot1(slot1) do
				if slot6 then
					slot0(slot3)
				else
					slot0(slot4)
				end
			end
		end
		return
	end

	if slot1 then
		slot5 = TagBytes(slot0, slot0.WIRETYPE_VARINT)

		return function (slot0, slot1)
			for slot5, slot6 in slot0(slot1) do
				slot0(slot1)

				if slot6 then
					slot0(slot2)
				else
					slot0(slot3)
				end
			end
		end
	else
		slot5 = TagBytes(slot0, slot0.WIRETYPE_VARINT)

		return function (slot0, slot1)
			slot0(slot0)

			if slot1 then
				return slot0(slot1)
			end

			return slot0(slot0)
		end
	end
end

function StringEncoder(slot0, slot1, slot2)
	slot3 = TagBytes(slot0, slot0.WIRETYPE_LENGTH_DELIMITED)
	slot4 = slot1

	if slot1 then
		return function (slot0, slot1)
			for slot5, slot6 in slot0(slot1) do
				slot0(slot1)
				slot2(slot0, #slot6)
				slot0(slot6)
			end
		end
	else
		return function (slot0, slot1)
			slot0(slot0)
			slot1(slot0, #slot1)

			return slot0(slot1)
		end
	end
end

function BytesEncoder(slot0, slot1, slot2)
	slot3 = TagBytes(slot0, slot0.WIRETYPE_LENGTH_DELIMITED)
	slot4 = slot1

	if slot1 then
		return function (slot0, slot1)
			for slot5, slot6 in slot0(slot1) do
				slot0(slot1)
				slot2(slot0, #slot6)
				slot0(slot6)
			end
		end
	else
		return function (slot0, slot1)
			slot0(slot0)
			slot1(slot0, #slot1)

			return slot0(slot1)
		end
	end
end

function MessageEncoder(slot0, slot1, slot2)
	slot3 = TagBytes(slot0, slot0.WIRETYPE_LENGTH_DELIMITED)
	slot4 = slot1

	if slot1 then
		return function (slot0, slot1)
			for slot5, slot6 in slot0(slot1) do
				slot0(slot1)
				slot2(slot0, slot6:ByteSize())
				slot6:_InternalSerialize(slot0)
			end
		end
	else
		return function (slot0, slot1)
			slot0(slot0)
			slot1(slot0, slot1:ByteSize())

			return slot1:_InternalSerialize(slot0)
		end
	end
end

return
