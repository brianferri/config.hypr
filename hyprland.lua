-- https://wiki.hypr.land/configuring/

-- https://wiki.hypr.land/configuring/core/environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("GTK_THEME", "Adwaita:dark")

-- https://wiki.hypr.land/configuring/core/#using-multiple-configuration-files
require("./configs/*")
