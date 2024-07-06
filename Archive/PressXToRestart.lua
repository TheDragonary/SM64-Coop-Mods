-- name: Press X To Restart
-- description: Press X to restart a level\n\nMod created by Dragonary

function restart(m)
	if (m.controller.buttonPressed & X_BUTTON) ~= 0 then
		warp_restart_level()
		m.health = 0x0880
		return true
	end
end

hook_event(HOOK_MARIO_UPDATE, restart)