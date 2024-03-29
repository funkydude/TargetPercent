
local name, addon = ...

local startDrag = function(frame) if IsAltKeyDown() then frame:StartMoving() end end
local stopDrag = function(frame) frame:StopMovingOrSizing() end

local UnitHealth, UnitHealthMax = UnitHealth, UnitHealthMax

local healthUpdate = function(frame, _, unit)
	unit = unit or frame.unit
	local hp = UnitHealth(unit)
	if hp > 0 then
		hp = hp / UnitHealthMax(unit) * 100
		if hp == 100 then
			addon[unit]:SetText("100%")
		else
			addon[unit]:SetFormattedText("%.1f%%", hp)
		end
	else
		addon[unit]:SetText("0%")
	end
end

local target = CreateFrame("Frame", name, TargetFrame.healthbar)
target:SetPoint("LEFT", TargetFrame.healthbar, "LEFT", -51, 0)
target:SetWidth(50)
target:SetHeight(20)
target:EnableMouse(true)
target:RegisterForDrag("LeftButton")
target:SetClampedToScreen(true)
target:SetMovable(true)
target:SetScript("OnDragStart", startDrag)
target:SetScript("OnDragStop", stopDrag)
target:SetScript("OnEvent", healthUpdate)
target.unit = "target"
target:RegisterEvent("PLAYER_TARGET_CHANGED")
target:RegisterUnitEvent("UNIT_HEALTH", "target")
addon.target = target:CreateFontString(nil, nil, "TextStatusBarText")
addon.target:SetAllPoints(target)
addon.target:SetJustifyH("RIGHT")

if FocusFrame then -- Not on classic era
	local focus = CreateFrame("Frame", "FocusPercent", FocusFrame.healthbar)
	focus:SetPoint("LEFT", FocusFrame.healthbar, "LEFT", -51, 0)
	focus:SetWidth(50)
	focus:SetHeight(20)
	focus:EnableMouse(true)
	focus:RegisterForDrag("LeftButton")
	focus:SetClampedToScreen(true)
	focus:SetMovable(true)
	focus:SetScript("OnDragStart", startDrag)
	focus:SetScript("OnDragStop", stopDrag)
	focus:SetScript("OnEvent", healthUpdate)
	focus.unit = "focus"
	focus:RegisterEvent("PLAYER_FOCUS_CHANGED")
	focus:RegisterUnitEvent("UNIT_HEALTH", "focus")
	addon.focus = focus:CreateFontString(nil, nil, "TextStatusBarText")
	addon.focus:SetAllPoints(focus)
	addon.focus:SetJustifyH("RIGHT")
end

for i = 1, 5 do
	local bossUnit = ("boss%d"):format(i)
	local bossTargetFrame = ("Boss%dTargetFrame"):format(i)
	local bossFrame = CreateFrame("Frame", bossTargetFrame.."Percent", _G[bossTargetFrame].healthbar)
	bossFrame:SetPoint("LEFT", _G[bossTargetFrame].healthbar, "LEFT", -51, 0)
	bossFrame:SetWidth(50)
	bossFrame:SetHeight(20)
	bossFrame:EnableMouse(true)
	bossFrame:RegisterForDrag("LeftButton")
	bossFrame:SetClampedToScreen(true)
	bossFrame:SetMovable(true)
	bossFrame:SetScript("OnDragStart", startDrag)
	bossFrame:SetScript("OnDragStop", stopDrag)
	bossFrame:SetScript("OnEvent", healthUpdate)
	bossFrame:SetScript("OnShow", healthUpdate)
	bossFrame.unit = bossUnit
	bossFrame:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
	bossFrame:RegisterUnitEvent("UNIT_HEALTH", bossUnit)
	addon[bossUnit] = bossFrame:CreateFontString(nil, nil, "TextStatusBarText")
	addon[bossUnit]:SetAllPoints(bossFrame)
	addon[bossUnit]:SetJustifyH("RIGHT")
end

