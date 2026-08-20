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
