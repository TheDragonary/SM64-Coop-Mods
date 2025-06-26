-- name: Level Teleport
-- description: Teleport to any level\n\nMod created by Dragonary

function level(n)
    warp_to_level(tonumber(n), 1, 1)
    return true
end

hook_chat_command("level", "[number] - Teleport to level", level)