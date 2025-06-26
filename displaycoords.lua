-- name: Display Coordinates
-- description: Display the XYZ coordinates of Mario on the HUD\n\nMod created by Dragonary

function x_text()
    -- set text and scale
    local text = "X :" .. tostring(tonumber(string.format("%.2f", gMarioStates[0].pos.x)))
    local scale = 1

    -- render to native screen space, with the MENU font
    djui_hud_set_resolution(RESOLUTION_DJUI);
    djui_hud_set_font(FONT_MENU);

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local width = djui_hud_measure_text(text) * scale

    -- get height of screen and text
    local screenHeight = djui_hud_get_screen_height()
    local height = 64 * scale

    -- set location
    local x = 20
    local y = screenHeight - height - 130

    -- set color and render
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
end

function y_text()
    -- set text and scale
    local text = "Y :" .. tostring(tonumber(string.format("%.2f", gMarioStates[0].pos.y)))
    local scale = 1

    -- render to native screen space, with the MENU font
    djui_hud_set_resolution(RESOLUTION_DJUI);
    djui_hud_set_font(FONT_MENU);

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local width = djui_hud_measure_text(text) * scale

    -- get height of screen and text
    local screenHeight = djui_hud_get_screen_height()
    local height = 64 * scale

    -- set location
    local x = 20
    local y = screenHeight - height - 70

    -- set color and render
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
end

function z_text()
    -- set text and scale
    local text = "Z :" .. tostring(tonumber(string.format("%.2f", gMarioStates[0].pos.z)))
    local scale = 1

    -- render to native screen space, with the MENU font
    djui_hud_set_resolution(RESOLUTION_DJUI);
    djui_hud_set_font(FONT_MENU);

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local width = djui_hud_measure_text(text) * scale

    -- get height of screen and text
    local screenHeight = djui_hud_get_screen_height()
    local height = 64 * scale

    -- set location
    local x = 20
    local y = screenHeight - height - 10

    -- set color and render
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
end

function on_hud_render()
    x_text()
    y_text()
    z_text()
end

hook_event(HOOK_ON_HUD_RENDER, on_hud_render)