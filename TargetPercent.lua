
do
	local showFrame = CreateFrame("Frame", "TargetPercent", TargetFrameHealthBar)
	showFrame:SetPoint("LEFT", TargetFrameHealthBar, "LEFT", -40, 2)
	showFrame:SetWidth(40)
	showFrame:SetHeight(20)
	showFrame.text = showFrame:CreateFontString("TargetPercentText", "OVERLAY")
	showFrame.text:SetAllPoints(showFrame)
	showFrame.text:SetFont("Fonts\\FRIZQT__.TTF", 11)
	showFrame.text:SetJustifyH("CENTER")
	showFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
	showFrame:RegisterEvent("UNIT_HEALTH")
	showFrame:SetScript("OnEvent", function(frame, _, unit)
		if unit and not UnitIsUnit(unit, "target") then return end
		local hp = UnitHealth("target")
		if hp > 0 then
			hp = hp / UnitHealthMax("target") * 100
			frame.text:SetFormattedText("%d%%", hp)
		end
	end)
end