 
 ---- MONITORS ----

hl.workspace_rule({ workspace = "1", monitor = "DP-1", persistent = true, default_name = "web" })
hl.workspace_rule({ workspace = "2", monitor = "DP-1", persistent = true, default_name = "code" })
hl.workspace_rule({ workspace = "3", monitor = "DP-1", persistent = true, default_name = "chat" })
hl.workspace_rule({ workspace = "4", monitor = "DP-1", persistent = true, default_name = "game" })
hl.workspace_rule({ workspace = "5", monitor = "DP-1", persistent = true, default_name = "design" })


 ---- AUTOSTART ----

hl.on("hyprland.start", function () 
    hl.exec_cmd("noctalia")  
end)


 ---- LOOK AND FEEL ----

hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 10,

        border_size = 2,

        col = {
            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
            inactive_border = "rgba(595959aa)",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,
        
        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 1,
            passes    = 1,
            ignore_opacity = false,
    	    new_optimizations = true,
    	    special = false,
    	    popups = false,
    	    xray = false,
            vibrancy  = 0.1696,
        },
    },

    animations = {
        enabled = true,
    },
})



 ----  MISC  ----


hl.config({
    misc = {
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})

hl.config({
    dwindle = {
        preserve_split = true, 
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

 ---- INPUT ----

hl.config({
    input = {
        kb_layout  = "us, ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = false,
        },
    },
})


hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


-- For Noctalia Color templates
require("noctalia").apply_theme()

require("modules.animation")
require("modules.keybinds")
require("environment")
require("modules.windowrules")