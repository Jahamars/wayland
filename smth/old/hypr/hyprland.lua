-- ~/.config/hypr/hyprland.lua

----------------------------------------------------------------------
-- MONITORS
----------------------------------------------------------------------
hl.monitor({
    output = "eDP-1",
    mode = "1920x1200@60",
    position = "0x0",
    scale = "1.00",
})

----------------------------------------------------------------------
-- AUTOSTART
----------------------------------------------------------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("gnome-keyring-daemon --start --components=secrets")
    hl.exec_cmd("wl-paste -t image/png -w cliphist store")
    hl.exec_cmd("wl-paste -t text/plain -w cliphist store")
    hl.exec_cmd("waybar")
    hl.exec_cmd("~/wayland/scripts/./xdg.sh")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=Hyprland")
    hl.exec_cmd("swaybg -i ~/wayland/walls/gradient.jpg -m fill")
end)

----------------------------------------------------------------------
-- ENVIRONMENT
----------------------------------------------------------------------
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("GTK_APPLICATION_PREFER_DARK_THEME", "1")
hl.env("GTK_THEME", "gtk")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("GDK_BACKEND", "wayland,x11")
hl.env("XCURSOR_SIZE", "15")
hl.env("HYPRCURSOR_SIZE", "15")
hl.env("HYPRCURSOR_THEME", "cursor")
hl.env("XCURSOR_THEME", "cursor")
hl.env("COLOR_SCHEME", "prefer-dark")

----------------------------------------------------------------------
-- APPEARANCE: general / decoration / dwindle / master / misc
----------------------------------------------------------------------
hl.config({
    cursor = {
        no_hardware_cursors = false,
    },
})

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 6,
        border_size = 2,
        col = {
            active_border = "rgb(fabd2f)",
            inactive_border = "rgb(928374)",
        },
        allow_tearing = false,
        layout = "dwindle",
    },
})

hl.config({
    decoration = {
        rounding = 6,
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        shadow = {
            enabled = false,
            range = 4,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },
        blur = {
            enabled = true,
            size = 3,
            passes = 1,
            vibrancy = 0.1696,
        },
    },
})

hl.config({
    dwindle = {
        preserve_split = true,
        smart_split = false,
        smart_resizing = true,
    },
})

hl.config({
    master = {
        new_status = "master",
        new_on_top = true,
        mfact = 0.55,
    },
})

hl.config({
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        mouse_move_enables_dpms = true,
        key_press_enables_dpms = true,
        vrr = 0,
        enable_swallow = true,
        swallow_regex = "^(kitty)$",
        initial_workspace_tracking = 1,
    },
})

----------------------------------------------------------------------
-- ANIMATIONS
----------------------------------------------------------------------
hl.curve("easeOutQuint",    { type = "bezier", points = { {0.23, 1}, {0.32, 1} } })
hl.curve("easeInOutCubic",  { type = "bezier", points = { {0.65, 0.05}, {0.36, 1} } })
hl.curve("linear",          { type = "bezier", points = { {0, 0}, {1, 1} } })
hl.curve("almostLinear",    { type = "bezier", points = { {0.5, 0.5}, {0.75, 1.0} } })
hl.curve("quick",           { type = "bezier", points = { {0.15, 0}, {0.1, 1} } })

hl.config({
    animations = { enabled = true },
})

hl.animation({ leaf = "global",        enabled = true, speed = 7,    bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4,    bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4,    bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1,    bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 5,    bezier = "default", style = "slidefade 20%" })

----------------------------------------------------------------------
-- INPUT
----------------------------------------------------------------------
hl.config({
    input = {
        kb_layout = "us,ru",
        kb_options = "grp:win_space_toggle",
        follow_mouse = 1,
        sensitivity = -0.4,
        mouse_refocus = false,
        touchpad = {
            natural_scroll = true,
            scroll_factor = 0.2,
            tap_to_click = true,
            tap_and_drag = true,
            drag_lock = 0,
            disable_while_typing = true,
            middle_button_emulation = false,
            clickfinger_behavior = false,
        },
    },
})

hl.config({
    xwayland = {
        force_zero_scaling = true,
    },
})

hl.device({
    name = "gxt7863:00-27c6:01e0-touchpad",
    sensitivity = 0.1,
})

----------------------------------------------------------------------
-- GESTURES
----------------------------------------------------------------------
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
hl.gesture({ fingers = 3, direction = "down", action = "fullscreen" })
hl.gesture({ fingers = 3, direction = "up", action = "fullscreen", scale = 1.5 })

----------------------------------------------------------------------
-- PROGRAM SHORTCUTS
----------------------------------------------------------------------
local menu = "tofi-drun --auto-accept-single false | xargs -I{} sh -c '{}'"
local browser = "chromium"
local terminal = "kitty"
local fileManager = "nautilus"
local notes = "obsidian"
local clipman = "~/wayland/scripts/./clip.sh"
local sys = "~/wayland/scripts/./hyprsys.sh"
local screen = "~/wayland/scripts/./screen.sh"
local ssearch = "~/wayland/scripts/./ssearch.sh"
local wall = "~/wayland/scripts/hyprwall.sh"
local hyprpicker = "hyprpicker -a"

----------------------------------------------------------------------
-- KEYBINDS
----------------------------------------------------------------------
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(sys))
hl.bind("SUPER+W", hl.dsp.exec_cmd(wall))

hl.bind("SUPER+T", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER+SHIFT+T", hl.dsp.exec_cmd("throne"))
hl.bind("SUPER+B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER+SHIFT+G", hl.dsp.exec_cmd(notes))
hl.bind("SUPER+SHIFT+P", hl.dsp.exec_cmd(hyprpicker))
hl.bind("SUPER+SHIFT+V", hl.dsp.exec_cmd(clipman))
hl.bind("SUPER+Q", hl.dsp.exec_cmd(sys))

hl.bind("SUPER+Z", hl.dsp.focus({ last = true }))

hl.bind("SUPER+SHIFT+W", hl.dsp.exec_cmd(screen))
hl.bind("SUPER+SHIFT+Q", hl.dsp.exec_cmd(ssearch))
hl.bind("SUPER+SHIFT+F", hl.dsp.window.fullscreen({ action = "toggle" }))

hl.bind("SUPER+X", hl.dsp.window.close())
hl.bind("SUPER+F", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER+E", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER+O", hl.dsp.exec_cmd(menu))

hl.bind("SUPER+P", hl.dsp.window.pseudo({ action = "toggle" }))
hl.bind("SUPER+C", hl.dsp.layout("togglesplit"))

hl.bind("SUPER+left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER+right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER+up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER+down",  hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER+h", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER+l", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER+k", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER+j", hl.dsp.focus({ direction = "down" }))

hl.bind("SUPER+SHIFT+left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER+SHIFT+right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER+SHIFT+up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER+SHIFT+down",  hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER+SHIFT+h", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER+SHIFT+l", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER+SHIFT+k", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER+SHIFT+j", hl.dsp.window.move({ direction = "down" }))

for i = 1, 9 do
    hl.bind("ALT+" .. i, hl.dsp.focus({ workspace = tostring(i) }))
    hl.bind("SUPER+SHIFT+" .. i, hl.dsp.window.move({ workspace = tostring(i), follow = true }))
end
hl.bind("ALT+0", hl.dsp.focus({ workspace = "10" }))
hl.bind("SUPER+SHIFT+0", hl.dsp.window.move({ workspace = "10", follow = true }))

-- scratchpad
hl.bind("SUPER+S", hl.dsp.workspace.toggle_special("magic"))
hl.bind("SUPER+SHIFT+S", hl.dsp.window.move({ workspace = "special:magic", follow = true }))

hl.bind("SUPER+mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("SUPER+mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind("SUPER+mouse:272", hl.dsp.window.drag(), { drag = true })
hl.bind("SUPER+mouse:273", hl.dsp.window.resize(), { drag = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 5%+"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true, locked = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind("mouse:275", hl.dsp.no_op())
hl.bind("mouse:276", hl.dsp.no_op())

----------------------------------------------------------------------
-- WINDOW RULES
----------------------------------------------------------------------
hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    match = { class = "pomotroid" },
    float = true,
    size = "430 486",
    move = "747 40",
    workspace = "special:magic",
})

hl.window_rule({
    match = { class = "easygamma" },
    move = "1470 38",
})

hl.window_rule({
    match = { class = "^(swayimg)$" },
    float = true,
})

hl.window_rule({
    match = { class = "dev\\.local\\.aichat" },
    float = true,
    size = "560 780",
    move = "1350 40",
    pin = true,
})

