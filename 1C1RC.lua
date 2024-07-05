-- name: 1 Coin/1 Red Coin
-- description: You only need 1 coin to get the coin star and 1 red coin to get the red coin star or you can get both at the same time\n\nMod created by Dragonary

gLevelValues.coinsRequiredForCoinStar = 1

---@param obj Object
function bhv_custom_red_coin_star_loop(obj)
    if obj.oHiddenStarTriggerCounter >= gMarioStates[0].area.numRedCoins - gMarioStates[0].area.numRedCoins + 1 then
        obj.oAction = 1
    end
end

-- These both need to be changed, though they share a lot of the same code so the function can be reused
hook_behavior(id_bhvHiddenRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)
hook_behavior(id_bhvBowserCourseRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)