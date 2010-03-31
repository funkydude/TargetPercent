
do
	local t_hpFrame = CreateFrame("Frame", "TargetPercent", TargetFrameHealthBar)
	t_hpFrame:SetPoint("LEFT", TargetFrameHealthBar, "LEFT", -46, 0)
	t_hpFrame:SetWidth(45)
	t_hpFrame:SetHeight(20)
	t_hpFrame.text = t_hpFrame:CreateFontString("TargetPercentText", "OVERLAY")
	t_hpFrame.text:SetAllPoints(t_hpFrame)
	t_hpFrame.text:SetFontObject(TextStatusBarText)
	t_hpFrame.text:SetJustifyH("RIGHT")
	t_hpFrame:RegisterEvent("PLAYER_TARGET_CHANGED")
	t_hpFrame:RegisterEvent("UNIT_HEALTH")
	t_hpFrame:SetScript("OnEvent", function(frame, _, unit)
		if unit and not UnitIsUnit(unit, "target") then return end
		local hp = UnitHealth("target")
		if hp > 0 then
			hp = hp / UnitHealthMax("target") * 100
			frame.text:SetFormattedText("%.1f%%", hp)
		else
			frame.text:SetText("0%")
		end
	end)

	local f_hpFrame = CreateFrame("Frame", "FocusPercent", FocusFrameHealthBar)
	f_hpFrame:SetPoint("LEFT", FocusFrameHealthBar, "LEFT", -46, 0)
	f_hpFrame:SetWidth(45)
	f_hpFrame:SetHeight(20)
	f_hpFrame.text = f_hpFrame:CreateFontString("FocusPercentText", "OVERLAY")
	f_hpFrame.text:SetAllPoints(f_hpFrame)
	f_hpFrame.text:SetFontObject(TextStatusBarText)
	f_hpFrame.text:SetJustifyH("RIGHT")
	f_hpFrame:RegisterEvent("PLAYER_FOCUS_CHANGED")
	f_hpFrame:SetScript("OnShow", function() f_hpFrame:RegisterEvent("UNIT_HEALTH") end)
	f_hpFrame:SetScript("OnHide", function() f_hpFrame:UnregisterEvent("UNIT_HEALTH") end)
	f_hpFrame:SetScript("OnEvent", function(frame, _, unit)
		if unit and not UnitIsUnit(unit, "focus") then return end
		local hp = UnitHealth("focus")
		print"update"
		if hp > 0 then
			hp = hp / UnitHealthMax("focus") * 100
			frame.text:SetFormattedText("%.1f%%", hp)
		else
			frame.text:SetText("0%")
		end
	end)
end

