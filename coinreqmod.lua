-- name: Coin Requirement Modifier
-- description: Change the requirement of the 100 coin and red coin stars with these 2 commands!\n\n/coin [number] to change 100 coin star requirement\n\n/redcoin [number] to change red coin star requirement\n\nMod created by Dragonary

function coin(n)
    gLevelValues.coinsRequiredForCoinStar = tonumber(n)
    return true
end

hook_chat_command("coin", "[number] - Change number of coins needed for 100 coin star", coin)

function redcoin(n)
    _G.newRedCoins = tonumber(n)
    return true
end

---@param obj Object
function bhv_custom_red_coin_star_loop(obj)
    if obj.oHiddenStarTriggerCounter >= gMarioStates[0].area.numRedCoins - gMarioStates[0].area.numRedCoins + newRedCoins then
        obj.oAction = 1
    end
end

hook_chat_command("redcoin", "[number] - Change number of red coins needed for the star", redcoin)

hook_behavior(id_bhvHiddenRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)
hook_behavior(id_bhvBowserCourseRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)