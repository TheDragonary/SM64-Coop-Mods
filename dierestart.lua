-- name: Die/Restart
-- description: Type /die to die\nType /restart to restart a level\n\nMod created by Dragonary

function die()
	gMarioStates[0].health = 0xff
end

function restart()
    warp_restart_level()
    gMarioStates[0].health = 0x0880
	return true
end

hook_chat_command("die", "Are you sure you wanna die?", die)
hook_chat_command("restart", "Restart the level", restart)
