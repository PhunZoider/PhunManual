if isServer() then
    return
end

local PM = PhunManual

Events.OnCreatePlayer.Add(function(playerIndex, playerObj)
    if PM.settings.ManualShowOnCharacterCreate then
        local hours = playerObj:getHoursSurvived()
        if hours < 1 then
            PM.ui.manual.OnOpenPanel(playerObj, playerIndex)
        end
    end
end)

if PhunZones then
    Events[PhunZones.events.OnPhunZoneWidgetClicked].Add(function(player)
        local p = PM
        if p.settings.ManualShowOnPhunZoneWidgetClick then
            PM.ui.manual.OnOpenPanel(player, player:getPlayerNum())
        end
    end)
end
