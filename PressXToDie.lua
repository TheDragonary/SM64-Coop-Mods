-- name: Press X To Die
-- description: Press X to die\n\nMod created by Dragonary

function die(m)
	if (m.controller.buttonPressed & X_BUTTON) ~= 0 then
		m.health = 0xff
		return true
	end
end

hook_event(HOOK_MARIO_UPDATE, die)
hook_event(HOOK_ON_DEATH, die)