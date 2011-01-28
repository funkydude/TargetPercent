
local registerOnShow = function(frame) frame:RegisterEvent("UNIT_HEALTH") end
local unregisterOnHide = function(frame) frame:UnregisterEvent("UNIT_HEALTH") end

local startDrag = function(frame) if IsAltKeyDown() then frame:StartMoving() end end
local stopDrag = function(frame) frame:StopMovingOrSizing() end

local healthUpdate = function(frame, _, unit)
	if not unit or unit == frame.target then
		local hp = UnitHealth(frame.target)
		if hp > 0 then
			hp = hp / UnitHealthMax(frame.target) * 100
			frame.text:SetFormattedText("%.1f%%", hp)
		else
			frame.text:SetText("0%")
		end
	end
end

local t_hpFrame = CreateFrame("Frame", "TargetPercent", TargetFrameHealthBar)
t_hpFrame:SetPoint("LEFT", TargetFrameHealthBar, "LEFT", -46, 0)
t_hpFrame:SetWidth(45)
t_hpFrame:SetHeight(20)
t_hpFrame.text = t_hpFrame:CreateFontString("TargetPercentText", "OVERLAY")
t_hpFrame.text:SetAllPoints(t_hpFrame)
t_hpFrame.text:SetFontObject(TextStatusBarText)
t_hpFrame.text:SetJustifyH("RIGHT")
t_hpFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
t_hpFrame:SetScript("OnShow", registerOnShow)
t_hpFrame:SetScript("OnHide", unregisterOnHide)
t_hpFrame:EnableMouse(true)
t_hpFrame:RegisterForDrag("LeftButton")
t_hpFrame:SetClampedToScreen(true)
t_hpFrame:SetMovable(true)
t_hpFrame:SetScript("OnDragStart", startDrag)
t_hpFrame:SetScript("OnDragStop", stopDrag)
t_hpFrame:SetScript("OnEvent", healthUpdate)
t_hpFrame.target = "target"

local f_hpFrame = CreateFrame("Frame", "FocusPercent", FocusFrameHealthBar)
f_hpFrame:SetPoint("LEFT", FocusFrameHealthBar, "LEFT", -46, 0)
f_hpFrame:SetWidth(45)
f_hpFrame:SetHeight(20)
f_hpFrame.text = f_hpFrame:CreateFontString("FocusPercentText", "OVERLAY")
f_hpFrame.text:SetAllPoints(f_hpFrame)
f_hpFrame.text:SetFontObject(TextStatusBarText)
f_hpFrame.text:SetJustifyH("RIGHT")
f_hpFrame:RegisterEvent("PLAYER_FOCUS_CHANGED")
f_hpFrame:SetScript("OnShow", registerOnShow)
f_hpFrame:SetScript("OnHide", unregisterOnHide)
f_hpFrame:SetScript("OnEvent", healthUpdate)
f_hpFrame.target = "focus"

local bossHealthUpdate = function(frame)
	local hp = UnitHealth(frame.target)
	if hp > 0 then
		hp = hp / UnitHealthMax(frame.target) * 100
		frame.text:SetFormattedText("%.1f%%", hp)
	else
		frame.text:SetText("0%")
	end
end

local b1_hpFrame = CreateFrame("Frame", "Boss1Percent", Boss1TargetFrameHealthBar)
b1_hpFrame:SetPoint("LEFT", Boss1TargetFrameHealthBar, "LEFT", -46, 0)
b1_hpFrame:SetWidth(45)
b1_hpFrame:SetHeight(20)
b1_hpFrame.text = b1_hpFrame:CreateFontString("Boss1PercentText", "OVERLAY")
b1_hpFrame.text:SetAllPoints(b1_hpFrame)
b1_hpFrame.text:SetFontObject(TextStatusBarText)
b1_hpFrame.text:SetJustifyH("RIGHT")
b1_hpFrame:SetScript("OnShow", registerOnShow)
b1_hpFrame:SetScript("OnHide", unregisterOnHide)
b1_hpFrame:SetScript("OnEvent", bossHealthUpdate)
b1_hpFrame.target = "boss1"

local b2_hpFrame = CreateFrame("Frame", "Boss2Percent", Boss2TargetFrameHealthBar)
b2_hpFrame:SetPoint("LEFT", Boss2TargetFrameHealthBar, "LEFT", -46, 0)
b2_hpFrame:SetWidth(45)
b2_hpFrame:SetHeight(20)
b2_hpFrame.text = b2_hpFrame:CreateFontString("Boss2PercentText", "OVERLAY")
b2_hpFrame.text:SetAllPoints(b2_hpFrame)
b2_hpFrame.text:SetFontObject(TextStatusBarText)
b2_hpFrame.text:SetJustifyH("RIGHT")
b2_hpFrame:SetScript("OnShow", registerOnShow)
b2_hpFrame:SetScript("OnHide", unregisterOnHide)
b2_hpFrame:SetScript("OnEvent", bossHealthUpdate)
b2_hpFrame.target = "boss2"

local b3_hpFrame = CreateFrame("Frame", "Boss3Percent", Boss3TargetFrameHealthBar)
b3_hpFrame:SetPoint("LEFT", Boss3TargetFrameHealthBar, "LEFT", -46, 0)
b3_hpFrame:SetWidth(45)
b3_hpFrame:SetHeight(20)
b3_hpFrame.text = b3_hpFrame:CreateFontString("Boss3PercentText", "OVERLAY")
b3_hpFrame.text:SetAllPoints(b3_hpFrame)
b3_hpFrame.text:SetFontObject(TextStatusBarText)
b3_hpFrame.text:SetJustifyH("RIGHT")
b3_hpFrame:SetScript("OnShow", registerOnShow)
b3_hpFrame:SetScript("OnHide", unregisterOnHide)
b3_hpFrame:SetScript("OnEvent", bossHealthUpdate)
b3_hpFrame.target = "boss3"

local b4_hpFrame = CreateFrame("Frame", "Boss4Percent", Boss4TargetFrameHealthBar)
b4_hpFrame:SetPoint("LEFT", Boss4TargetFrameHealthBar, "LEFT", -46, 0)
b4_hpFrame:SetWidth(45)
b4_hpFrame:SetHeight(20)
b4_hpFrame.text = b4_hpFrame:CreateFontString("Boss4PercentText", "OVERLAY")
b4_hpFrame.text:SetAllPoints(b4_hpFrame)
b4_hpFrame.text:SetFontObject(TextStatusBarText)
b4_hpFrame.text:SetJustifyH("RIGHT")
b4_hpFrame:SetScript("OnShow", registerOnShow)
b4_hpFrame:SetScript("OnHide", unregisterOnHide)
b4_hpFrame:SetScript("OnEvent", bossHealthUpdate)
b4_hpFrame.target = "boss4"

