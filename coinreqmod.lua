-- name: Coin Requirement Modifier
-- description: Change the requirement of the 100 coin and red coin stars with these 3 commands!\n\n/coin [number] to change 100 coin star requirement\n\n/redcoin [number] to change red coin star requirement\n\n/resetcoins to reset both coin star requirements\n\nMod created by Dragonary

function coin(n)
    gLevelValues.coinsRequiredForCoinStar = tonumber(n)
    return true
end

hook_chat_command("coin", "[number] - Change number of coins needed for 100 coin star", coin)

function redcoin(n)
    _G.newRedCoins = tonumber(n)
    return true
end

_G.newRedCoins = 8

---@param obj Object
function bhv_custom_red_coin_star_loop(obj)
    if obj.oHiddenStarTriggerCounter >= newRedCoins then
        obj.oAction = 1
    end
end

hook_chat_command("redcoin", "[number] - Change number of red coins needed for the star", redcoin)

hook_behavior(id_bhvHiddenRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)
hook_behavior(id_bhvBowserCourseRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)

function resetcoins()
    coin(100)
    redcoin(8)
    return true
end

hook_chat_command("resetcoins", "Reset both coin star requirements", resetcoins)