
do
	local showFrame = CreateFrame("Frame", "TargetPercent", TargetFrameHealthBar)
	showFrame:SetPoint("LEFT", TargetFrameHealthBar, "LEFT", -46, 0)
	showFrame:SetWidth(45)
	showFrame:SetHeight(20)
	showFrame.text = showFrame:CreateFontString("TargetPercentText", "OVERLAY")
	showFrame.text:SetAllPoints(showFrame)
	showFrame.text:SetFontObject(TextStatusBarText)
	showFrame.text:SetJustifyH("RIGHT")
	showFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
	showFrame:RegisterEvent("UNIT_HEALTH")
	showFrame:SetScript("OnEvent", function(frame, _, unit)
		if unit and not UnitIsUnit(unit, "target") then return end
		local hp = UnitHealth("target")
		if hp > 0 then
			hp = hp / UnitHealthMax("target") * 100
			frame.text:SetFormattedText("%.1f%%", hp)
		else
			frame.text:SetText("0%")
		end
	end)
end