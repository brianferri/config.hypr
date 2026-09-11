-- https://wiki.hypr.land/configuring/core/config-options/

-- https://wiki.hypr.land/configuring/core/autostart/
local function restart_waybar()
    hl.exec_cmd("sleep 1 && killall waybar 2>/dev/null; waybar")
end

-- The first config parse happens before the compositor has a Wayland socket, so
-- the initial launch waits for the first frame. A reload already has monitors up.
hl.on("hyprland.start", restart_waybar)
hl.on("config.reloaded", function()
    if #hl.get_monitors() > 0 then
        restart_waybar()
    end
end)

hl.on("hyprland.start", function()
    hl.exec_cmd('gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"')
    hl.exec_cmd('gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"')
end)

-- https://wiki.hypr.land/configuring/core/config-options/#general
hl.config({
    general = {
        gaps_in     = 4,
        gaps_out    = 8,
        border_size = 1,

        col = {
            active_border   = { colors = { "rgba(33ccffee)", "rgba(ffffffff)" }, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,

        -- See https://wiki.hypr.land/configuring/extra/tearing/
        allow_tearing = false,

        layout = "dwindle",
    },

    -- https://wiki.hypr.land/configuring/core/config-options/#decoration
    decoration = {
        -- rounding       = 10,
        -- rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 4,
            render_power = 3,
            color        = "rgba(1a1a1aee)",
        },

        -- https://wiki.hypr.land/configuring/core/config-options/#blur
        blur = {
            enabled           = true,
            size              = 6,
            passes            = 3,
            new_optimizations = true,
            ignore_opacity    = true,
            xray              = false,
            vibrancy          = 0.1696,
        },
    },

    -- https://wiki.hypr.land/configuring/core/config-options/#misc
    misc = {
        -- Set to 0 or 1 to disable the anime mascot wallpapers
        force_default_wallpaper = -1,
        -- If true disables the random hyprland logo / anime girl background. :(
        disable_hyprland_logo = false,
        -- When in fullscreen, cyclying on tiles will `1` take over the fullscreen context
        on_focus_under_fullscreen = 1,

        middle_click_paste = false,
    },
})
