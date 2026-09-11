-- https://wiki.hypr.land/configuring/core/rules/window-rules/
-- https://wiki.hypr.land/configuring/core/rules/workspace-rules/

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    name           = "suppress-maximize",
    match          = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

hl.window_rule({
    name  = "tag-picture-in-picture",
    match = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    tag   = "+picture-in-picture",
})

hl.window_rule({
    name              = "picture-in-picture",
    match             = { tag = "picture-in-picture" },
    move              = { "monitor_w*0.73", "monitor_h*0.72" },
    size              = { "monitor_w*0.25", "monitor_h*0.25" },
    float             = true,
    keep_aspect_ratio = true,
    pin               = true,
})

hl.window_rule({ match = { class = "^(firefox-developer-edition)" },  opacity = "0.90 0.90 1" })
hl.window_rule({ match = { class = "^(kitty)" },                     opacity = "0.80 0.80 1" })
hl.window_rule({ match = { class = "^(org.kde.dolphin)" },           opacity = "0.80 0.80 1" })
hl.window_rule({ match = { class = "^(qt6ct)" },                     opacity = "0.80 0.80 1" })
hl.window_rule({ match = { class = "^(kvantummanager)" },            opacity = "0.80 0.80 1" })
hl.window_rule({ match = { class = "^(nm-connection-editor)$" },     opacity = "0.80 0.70 1" })
