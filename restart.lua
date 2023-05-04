-- name: Restart
-- description: Type /restart to restart a level\n\nMod created by Dragonary

function restart()
    warp_restart_level()
    gMarioStates[0].health = 0x0880
	return true
end

hook_chat_command("restart", "Restart the level", restart)