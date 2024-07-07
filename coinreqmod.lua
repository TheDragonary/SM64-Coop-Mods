-- name: Coin Requirement Modifier
-- description: Change the requirement of the 100 coin and red coin stars with these 3 commands!\n\n/coin [number] to change 100 coin star requirement\n\n/redcoin [number] to change red coin star requirement\n\n/resetcoins to reset both coin star requirements\n\nOnly the host can run these commands\n\nMod created by Dragonary

-- Create gGlobalSyncTable Fields
gGlobalSyncTable.coinsRequiredForCoinStar = gLevelValues.coinsRequiredForCoinStar
gGlobalSyncTable.redCoinsRequired = 8

-- 100 Coin Star
function coin(n)
    if network_is_server() then
        gGlobalSyncTable.coinsRequiredForCoinStar = tonumber(n)
        return true
    else
        djui_chat_message_create("You cannot run this command")
        return true
    end
end

function on_coin_change(tag, oldVal, newVal)
    -- print("coinsRequiredForCoinStar changed:", tag, ",", oldVal, "->", newVal)
    gLevelValues.coinsRequiredForCoinStar = newVal
end

hook_on_sync_table_change(gGlobalSyncTable, "coinsRequiredForCoinStar", "coins", on_coin_change)
hook_chat_command("coin", "[number] - Change number of coins needed for 100 coin star", coin)

-- Red Coin Star
function redcoin(n)
    if network_is_server() then
        gGlobalSyncTable.redCoinsRequired = tonumber(n)
        return true
    else
        djui_chat_message_create("You cannot run this command")
        return true
    end
end

function on_red_coin_change(tag, oldVal, newVal)
    -- print("redCoinsRequired changed:", tag, ",", oldVal, "->", newVal)
    gGlobalSyncTable.newRedCoins = newVal
end

hook_on_sync_table_change(gGlobalSyncTable, "redCoinsRequired", "redcoins", on_red_coin_change)
hook_chat_command("redcoin", "[number] - Change number of red coins needed for the star", redcoin)

---@param obj Object
function bhv_custom_red_coin_star_loop(obj)
    if obj.oHiddenStarTriggerCounter >= gGlobalSyncTable.redCoinsRequired then
        obj.oAction = 1
    end
end

hook_behavior(id_bhvHiddenRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)
hook_behavior(id_bhvBowserCourseRedCoinStar, OBJ_LIST_LEVEL, false, nil, bhv_custom_red_coin_star_loop)

-- Reset Both Coin Star Requirements
function resetcoins()
    if network_is_server() then
        coin(100)
        redcoin(8)
        return true
    else
        djui_chat_message_create("You cannot run this command")
        return true
    end
end

hook_chat_command("resetcoins", "Reset both coin star requirements", resetcoins)