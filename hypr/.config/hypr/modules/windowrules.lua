
 --- APPLICATIONS BLUR & OPACITY ---

hl.window_rule({
    match = { class = "foot" },
    opacity = 0.8
})

hl.window_rule({
    match = { class = "org.pulseaudio.pavucontrol" },
    opacity = 0.9
})

hl.layer_rule({
  name = "noctalia",
  match = {
    namespace = "^noctalia-(bar-.+|notification|dock|panel|attached-panel|osd|window-switcher)$",
  },
  no_anim = true,
  ignore_alpha = 0.5,
  blur = true,
  blur_popups = true,
})

 --- WORKSPACE ---

hl.window_rule({
    match = { class = "YandexMusic" },
    workspace = "special:music"
})

hl.window_rule({
    match = { class = "org.telegram.desktop" },
    workspace = "special:messenger"
})

hl.window_rule({
    match = { class = "equibop" },
    workspace = "special:messenger"
})

 --- FLOAT AND SIZE


-- Thunar 
hl.window_rule({
    match = { class = "thunar" },
    float = true,
    size = "1100 690",
    center = true
})

 -- Steam 
hl.window_rule({
    match = { class = "steam", title = "negative:^(Steam)$" },
    float = true
})

-- Firefox 
hl.window_rule({
    match = {
        class = "firefox",
        title = "^(About Mozilla Firefox|Library|Clear Recent History)$|negative:^.*(Mozilla Firefox)$"
    },
    float = true
})

hl.window_rule({
    match = { class = "firefox", title = "^(Picture-in-Picture)$" },
    float = true,
    pin = true,
    size = "560 340"
})

-- Happ
hl.window_rule({
    match = { class = "Happ" },
    float = true,
    center = true,
    size = "1000, 600"
})

-- Viewnior
hl.window_rule({
    match = { class = "viewnior" },
    float = true,
    size = "900 600",
    center = true
})

-- Mpv & VLC 
hl.window_rule({
    match = { class = "^(mpv|vlc)$" },
    float = true,
    size = "900 600",
    center = true
})

hl.window_rule({
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size = { 1080, 920 },
})

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

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
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

 --- POP UPS AND DIALOGUES ---
 
local system_dialogs = "^(Save As|Save File|Select File|Choose File|Open File|Open Folder|Confirm to replace files)$"

hl.window_rule({
    match = { title = system_dialogs },
    float = true,
    size = "1100 690",
    center = true
})


hl.window_rule({
    match = { class = "xdg-desktop-portal-gtk" },
    float = true,
    size = "900 550",
    center = true
})

hl.window_rule({
    match = { class = "thunar", title = "^(Rename).*$" },
    float = true,
    size = "500 250",
    center = true
})