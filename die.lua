-- name: Die
-- description: Type /die to die\n\nMod created by Dragonary

function die()
	gMarioStates[0].health = 0xff
end

hook_chat_command("die", "Are you sure you wanna die?", die)
