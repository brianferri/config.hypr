-- https://wiki.hypr.land/configuring/core/binds/
local mainMod = "SUPER"

local scripts = os.getenv("HOME") .. "/.config/hypr/scripts"

local browser     = "firefox-developer-edition"
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "rofi -show drun"

-- https://wiki.hypr.land/configuring/core/dispatchers/
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + T",     hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F",     hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + E",     hl.dsp.exec_cmd(fileManager))

hl.bind(mainMod .. " + Q",         hl.dsp.window.close())
hl.bind(mainMod .. " + L",         hl.dsp.exit())
hl.bind(mainMod .. " + W",         hl.dsp.window.float())
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.window.fullscreen({ mode = "maximized" }))

hl.bind("Print",                   hl.dsp.exec_cmd(scripts .. "/screenshot.sh p"), { locked = true })
hl.bind(mainMod .. " + D",         hl.dsp.exec_cmd(scripts .. "/toggle_show_desktop.sh"))
hl.bind(mainMod .. " + K",         hl.dsp.exec_cmd(scripts .. "/switch_keyboard_layout.sh"))
hl.bind(mainMod .. " + P",         hl.dsp.exec_cmd(scripts .. "/screenshot.sh s"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd(scripts .. "/screenshot.sh sf"))

hl.bind(mainMod .. " + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))

hl.bind("ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next({ next = false }))
    hl.dispatch(hl.dsp.window.bring_to_top())
end)
hl.bind("SHIFT + ALT + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next())
    hl.dispatch(hl.dsp.window.bring_to_top())
end)

-- https://wiki.hypr.land/configuring/core/binds/devices/mouse/
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + Z",         hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + X",         hl.dsp.window.resize(), { mouse = true })

hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
