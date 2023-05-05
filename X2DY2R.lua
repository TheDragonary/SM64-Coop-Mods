-- name: X2Die/Y2Restart 
-- description: Press X to die or press Y to restart a level\n\nMod created by Dragonary

function die(m)
	if (m.controller.buttonPressed & X_BUTTON) ~= 0 then
		m.health = 0xff
		return true
	end
end

hook_event(HOOK_MARIO_UPDATE, die)

function restart(m)
	if (m.controller.buttonPressed & Y_BUTTON) ~= 0 then
		warp_restart_level()
		m.health = 0x0880
		return true
	end
end

hook_event(HOOK_MARIO_UPDATE, restart)