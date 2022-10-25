
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

local target = CreateFrame("Frame", name, TargetFrameHealthBar)
target:SetPoint("LEFT", TargetFrameHealthBar, "LEFT", -51, 0)
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
target:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", "target")
addon.target = target:CreateFontString(nil, nil, "TextStatusBarText")
addon.target:SetAllPoints(target)
addon.target:SetJustifyH("RIGHT")

for i = 1, 5 do
	local boss, Boss = ("boss%d"):format(i), ("Boss%d"):format(i)
	local bossFrame = CreateFrame("Frame", Boss.."Percent", _G[Boss.."TargetFrameHealthBar"])
	bossFrame:SetPoint("LEFT", _G[Boss.."TargetFrameHealthBar"], "LEFT", -51, 0)
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
	bossFrame.unit = boss
	bossFrame:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
	bossFrame:RegisterUnitEvent("UNIT_HEALTH_FREQUENT", boss)
	addon[boss] = bossFrame:CreateFontString(nil, nil, "TextStatusBarText")
	addon[boss]:SetAllPoints(bossFrame)
	addon[boss]:SetJustifyH("RIGHT")
end
