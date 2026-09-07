local mainMod = "SUPER" 
local ipc = "noctalia msg "
local dsp = hl.dsp

local terminal = "foot"
local fileManager = "thunar"
local browser = "firefox"
local editor = "codium"
local menu = "noctalia msg panel-toggle launcher"


local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd(terminal, { float = true, size = { 800, 550 } }))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager, { float = true, size = { 1000, 600 } }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(editor))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd("happ"))
hl.bind(mainMod .. " + H", hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("steam"))
hl.bind(mainMod .. " + G", hl.dsp.exec_cmd("equibop"))


hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("foot -e btop"))


hl.bind(mainMod .. " + CTRL + ALT + Delete", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + Space", function()
    hl.dispatch(dsp.window.float({ action = "toggle" }))
    hl.dispatch(dsp.window.resize({ x = 900, y = 600, relative = false }))
    hl.dispatch(dsp.window.center())
end)

hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit")) 

hl.bind(mainMod .. " + Tab", function()
    hl.dispatch(hl.dsp.window.cycle_next()) 
    hl.dispatch(hl.dsp.window.bring_to_top()) 
end)

-- Window Switcher
hl.bind("ALT + TAB", hl.dsp.exec_cmd(ipc .. "window-switcher"))

-- Locker
hl.bind(mainMod .. " + L", dsp.exec_cmd(ipc .. "session lock"))

-- Session
hl.bind("ALT + F4", dsp.exec_cmd(ipc .. "panel-toggle session"))


-- Screenshots
hl.bind(mainMod .. " + SHIFT + S", dsp.exec_cmd(ipc .. "screenshot-region"))

-- Print 
hl.bind("Print", dsp.exec_cmd(ipc .. "screenshot-fullscreen"))


-- Fullscreen
hl.bind(mainMod .. " + ALT + F", dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
-- Maximized
hl.bind(mainMod .. " + F", dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

-- Pin
hl.bind(mainMod .. " + P", dsp.window.pin())

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Move Window
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + down",  hl.dsp.window.move({ direction = "down" }))

-- Resize
local step_left  = { x = -50, y = 0, relative = true }
local step_right = { x = 50, y = 0, relative = true }
local step_up    = { x = 0, y = -50, relative = true }
local step_down  = { x = 0, y = 50, relative = true }

hl.bind(mainMod .. " + ALT + Left",  dsp.window.resize(step_left))
hl.bind(mainMod .. " + ALT + Right", dsp.window.resize(step_right))
hl.bind(mainMod .. " + ALT + Up",    dsp.window.resize(step_up))
hl.bind(mainMod .. " + ALT + Down",  dsp.window.resize(step_down))


-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + V", hl.dsp.workspace.toggle_special("messenger"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.move({ workspace = "special:messenger" }))

hl.bind(mainMod .. " + M", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:music" }))


-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. "volume-up"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. "volume-down"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. "volume-mute"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. "brightness-up"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. "brightness-down"))

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
