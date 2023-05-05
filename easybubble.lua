-- name: Easy Bubble
-- description: Basically bubbling but on crack\n\nBubble and unbubble anywhere you want without having to go to another player!\n(Only works in multiplayer)\n\nMod created by Dragonary

function bubble(m)
    local players = 0
    for i=1, (MAX_PLAYERS - 1) do
        if gNetworkPlayers[i].connected then
            if gNetworkPlayers[i].currActNum == gNetworkPlayers[0].currActNum and gNetworkPlayers[i].currLevelNum == gNetworkPlayers[0].currLevelNum and gNetworkPlayers[i].currAreaIndex == gNetworkPlayers[0].currAreaIndex then
                players = players + 1
            end
        end
    end
	
	if (m.action & ACT_FLAG_AIR) == 0 and (m.controller.buttonPressed & X_BUTTON) ~= 0 and players >= 1 then
	    set_mario_action(m, ACT_BUBBLED, 0)
	end
	
	if (m.action == ACT_BUBBLED) and (m.controller.buttonPressed & Y_BUTTON) ~= 0 then
	    force_idle_state(m)
		m.forwardVel = 0
		m.marioObj.oIntangibleTimer = 0
		if m.health < 0x100 then
			m.hurtCounter = 0
			m.health = 0x880
		end
	end
end

hook_event(HOOK_MARIO_UPDATE, bubble)