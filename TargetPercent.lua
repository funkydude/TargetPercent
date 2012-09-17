
local name, addon = ...

local startDrag = function(frame) if IsAltKeyDown() then frame:StartMoving() end end
local stopDrag = function(frame) frame:StopMovingOrSizing() end

local UnitHealth, UnitHealthMax = UnitHealth, UnitHealthMax

local healthUpdate = function(frame, _, unit)
	unit = unit or frame.unit
	local hp = UnitHealth(unit)
	if hp > 0 then
		hp = hp / UnitHealthMax(unit) * 100
		addon[unit]:SetFormattedText("%.1f%%", hp)
	else
		addon[unit]:SetText("0%")
	end
end

addon.target = CreateFrame("Frame", name, TargetFrameHealthBar)
addon.target:SetPoint("LEFT", TargetFrameHealthBar, "LEFT", -51, 0)
addon.target:SetWidth(50)
addon.target:SetHeight(20)
addon.target:EnableMouse(true)
addon.target:RegisterForDrag("LeftButton")
addon.target:SetClampedToScreen(true)
addon.target:SetMovable(true)
addon.target:SetScript("OnDragStart", startDrag)
addon.target:SetScript("OnDragStop", stopDrag)
addon.target:SetScript("OnEvent", healthUpdate)
addon.target.unit = "target"
addon.target:RegisterEvent("PLAYER_TARGET_CHANGED")
addon.target:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "target")
addon.target = addon.target:CreateFontString("TargetPercentText", "OVERLAY")
addon.target:SetAllPoints(name)
addon.target:SetFontObject(TextStatusBarText)
addon.target:SetJustifyH("RIGHT")

addon.focus = CreateFrame("Frame", "FocusPercent", FocusFrameHealthBar)
addon.focus:SetPoint("LEFT", FocusFrameHealthBar, "LEFT", -51, 0)
addon.focus:SetWidth(50)
addon.focus:SetHeight(20)
addon.focus:EnableMouse(true)
addon.focus:RegisterForDrag("LeftButton")
addon.focus:SetClampedToScreen(true)
addon.focus:SetMovable(true)
addon.focus:SetScript("OnDragStart", startDrag)
addon.focus:SetScript("OnDragStop", stopDrag)
addon.focus:SetScript("OnEvent", healthUpdate)
addon.focus.unit = "focus"
addon.focus:RegisterEvent("PLAYER_FOCUS_CHANGED")
addon.focus:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "focus")
addon.focus = addon.focus:CreateFontString("FocusPercentText", "OVERLAY")
addon.focus:SetAllPoints("FocusPercent")
addon.focus:SetFontObject(TextStatusBarText)
addon.focus:SetJustifyH("RIGHT")

addon.boss1 = CreateFrame("Frame", "Boss1Percent", Boss1TargetFrameHealthBar)
addon.boss1:SetPoint("LEFT", Boss1TargetFrameHealthBar, "LEFT", -51, 0)
addon.boss1:SetWidth(50)
addon.boss1:SetHeight(20)
addon.boss1:EnableMouse(true)
addon.boss1:RegisterForDrag("LeftButton")
addon.boss1:SetClampedToScreen(true)
addon.boss1:SetMovable(true)
addon.boss1:SetScript("OnDragStart", startDrag)
addon.boss1:SetScript("OnDragStop", stopDrag)
addon.boss1:SetScript("OnEvent", healthUpdate)
addon.boss1:SetScript("OnShow", healthUpdate)
addon.boss1.unit = "boss1"
addon.boss1:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
addon.boss1:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "boss1")
addon.boss1 = addon.boss1:CreateFontString("Boss1PercentText", "OVERLAY")
addon.boss1:SetAllPoints("Boss1Percent")
addon.boss1:SetFontObject(TextStatusBarText)
addon.boss1:SetJustifyH("RIGHT")

addon.boss2 = CreateFrame("Frame", "Boss2Percent", Boss2TargetFrameHealthBar)
addon.boss2:SetPoint("LEFT", Boss2TargetFrameHealthBar, "LEFT", -51, 0)
addon.boss2:SetWidth(50)
addon.boss2:SetHeight(20)
addon.boss2:EnableMouse(true)
addon.boss2:RegisterForDrag("LeftButton")
addon.boss2:SetClampedToScreen(true)
addon.boss2:SetMovable(true)
addon.boss2:SetScript("OnDragStart", startDrag)
addon.boss2:SetScript("OnDragStop", stopDrag)
addon.boss2:SetScript("OnEvent", healthUpdate)
addon.boss2:SetScript("OnShow", healthUpdate)
addon.boss2.unit = "boss2"
addon.boss2:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
addon.boss2:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "boss2")
addon.boss2 = addon.boss2:CreateFontString("Boss2PercentText", "OVERLAY")
addon.boss2:SetAllPoints("Boss2Percent")
addon.boss2:SetFontObject(TextStatusBarText)
addon.boss2:SetJustifyH("RIGHT")

addon.boss3 = CreateFrame("Frame", "Boss3Percent", Boss3TargetFrameHealthBar)
addon.boss3:SetPoint("LEFT", Boss3TargetFrameHealthBar, "LEFT", -51, 0)
addon.boss3:SetWidth(50)
addon.boss3:SetHeight(20)
addon.boss3:EnableMouse(true)
addon.boss3:RegisterForDrag("LeftButton")
addon.boss3:SetClampedToScreen(true)
addon.boss3:SetMovable(true)
addon.boss3:SetScript("OnDragStart", startDrag)
addon.boss3:SetScript("OnDragStop", stopDrag)
addon.boss3:SetScript("OnEvent", healthUpdate)
addon.boss2:SetScript("OnShow", healthUpdate)
addon.boss3.unit = "boss3"
addon.boss3:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
addon.boss3:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "boss3")
addon.boss3 = addon.boss3:CreateFontString("Boss3PercentText", "OVERLAY")
addon.boss3:SetAllPoints("Boss3Percent")
addon.boss3:SetFontObject(TextStatusBarText)
addon.boss3:SetJustifyH("RIGHT")

addon.boss4 = CreateFrame("Frame", "Boss4Percent", Boss4TargetFrameHealthBar)
addon.boss4:SetPoint("LEFT", Boss4TargetFrameHealthBar, "LEFT", -51, 0)
addon.boss4:SetWidth(50)
addon.boss4:SetHeight(20)
addon.boss4:EnableMouse(true)
addon.boss4:RegisterForDrag("LeftButton")
addon.boss4:SetClampedToScreen(true)
addon.boss4:SetMovable(true)
addon.boss4:SetScript("OnDragStart", startDrag)
addon.boss4:SetScript("OnDragStop", stopDrag)
addon.boss4:SetScript("OnEvent", healthUpdate)
addon.boss4:SetScript("OnShow", healthUpdate)
addon.boss4.unit = "boss4"
addon.boss4:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
addon.boss4:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "boss4")
addon.boss4 = addon.boss4:CreateFontString("Boss4PercentText", "OVERLAY")
addon.boss4:SetAllPoints("Boss4Percent")
addon.boss4:SetFontObject(TextStatusBarText)
addon.boss4:SetJustifyH("RIGHT")

