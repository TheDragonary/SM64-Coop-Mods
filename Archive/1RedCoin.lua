-- name: 1 Red Coin
-- description: You only need 1 red coin to get the star\n\nMod created by Dragonary

---@param obj Object
function bhv_custom_red_coin_star_loop(obj)
    if obj.oHiddenStarTriggerCounter >= 1 then
        obj.oAction = 1
    end
end

hook_behavior(id_bhvHiddenRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)
hook_behavior(id_bhvBowserCourseRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)