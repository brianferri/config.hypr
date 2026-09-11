-- https://wiki.hypr.land/configuring/core/config-options/#input
hl.config({
    input = {
        kb_layout  = "us,it",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})

-- https://wiki.hypr.land/configuring/core/binds/gestures/
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- https://wiki.hypr.land/configuring/core/devices/
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
