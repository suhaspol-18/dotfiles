-- Migrated from hyprland.conf to hyprland.lua (Hyprland 0.55+)
-- Legacy file kept: ~/.config/hypr/hyprland.conf

----------------
-- MONITORS
----------------
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

----------------
-- PROGRAMS
----------------
local terminal = "alacritty"
local fileManager = "nemo"
local menu = "fuzzel"
local browser = "zen"

----------------
-- AUTOSTART
----------------
hl.on("hyprland.start", function()
	hl.exec_cmd(
		'vicifyd --name "onkarsathe (librespot)" --device-type computer --enable-oauth --system-cache ~/.cache/vicifyd --quiet'
	)
	hl.exec_cmd("systemctl --user restart swaync.service")
	hl.exec_cmd("hyprlock")
	hl.exec_cmd(terminal)
	hl.exec_cmd("waybar & hyprpaper")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("vicinae server")
	hl.exec_cmd(
		"[workspace special:magic silent] alacritty --class scratchpad-term -e tmux new-session -A -s pad codex"
	)
	hl.exec_cmd('hyprctl setcursor "Banana-Catppuccin-Mocha" 40')
end)

-- Kept as recurring exec commands (from original exec = ...)
hl.exec_cmd('gsettings set org.gnome.desktop.interface cursor-theme "Banana-Catppuccin-Mocha"')
hl.exec_cmd("gsettings set org.gnome.desktop.interface cursor-size 40")

----------------
-- ENV
----------------
hl.env("WLR_NO_HARDWARE_CURSORS", "1")
hl.env("XCURSOR_SIZE", "40")
hl.env("HYPRCURSOR_SIZE", "40")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("GDK_BACKEND", "wayland")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("TERMINAL", "alacritty")

----------------
-- LOOK AND FEEL
----------------
hl.config({
	cursor = {
		no_hardware_cursors = true,
	},
	general = {
		gaps_in = 4,
		gaps_out = 3,
		border_size = 1,
		col = {
			active_border = "rgba(87c095ee)",
			inactive_border = "rgba(7fbbb3aa)",
		},
		resize_on_border = false,
		allow_tearing = false,
		layout = "dwindle",
	},
	decoration = {
		rounding = 1,
		active_opacity = 1.0,
		inactive_opacity = 1.0,
		shadow = {
			enabled = true,
			range = 4,
			render_power = 3,
			color = "rgba(1a1a1aee)",
		},
		blur = {
			enabled = true,
			size = 2,
			passes = 3,
			vibrancy = 0.1696,
			ignore_opacity = true,
		},
	},
	animations = {
		enabled = false,
	},
	master = {
		new_status = "master",
	},
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		force_default_wallpaper = -1,
	},
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "ctrl:nocaps",
		follow_mouse = 1,
		sensitivity = 0,
		touchpad = {
			natural_scroll = true,
		},
	},
})

hl.curve("easeOutQuint", {
	type = "bezier",
	points = { { 0.23, 1 }, { 0.32, 1 } },
})

hl.curve("easeInOutCubic", {
	type = "bezier",
	points = { { 0.65, 0.05 }, { 0.36, 1 } },
})

hl.curve("linear", {
	type = "bezier",
	points = { { 0, 0 }, { 1, 1 } },
})

hl.curve("almostLinear", {
	type = "bezier",
	points = { { 0.5, 0.5 }, { 0.75, 1.0 } },
})

hl.curve("quick", {
	type = "bezier",
	points = { { 0.15, 0 }, { 0.1, 1 } },
})

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "slide 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "slide 87%" })
hl.animation({ leaf = "fadeIn", enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = true, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = true, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn", enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

----------------
-- INPUT
----------------
hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.device({
	name = "epic-mouse-v1",
	sensitivity = -0.5,
})

----------------
-- KEYBINDINGS
----------------
local mainMod = "ALT"
local winKey = "SUPER"

hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("vicinae vicinae://launch/clipboard/history"))
hl.bind("Print", hl.dsp.exec_cmd("flameshot gui"))

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("vicinae toggle"))

hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(winKey .. " + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(winKey .. " + P", hl.dsp.exec_cmd("hyprpicker"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd("vicinae vicinae://launch/wm/switch-windows"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("vicinae vicinae://launch/window/selector"))

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

for i = 1, 10 do
	local key = i % 10
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), { locked = true, repeating = true })

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))

hl.bind(mainMod .. " + CTRL + h", hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + j", hl.dsp.window.move({ direction = "down" }))
hl.bind(mainMod .. " + CTRL + k", hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.move({ direction = "right" }))

hl.bind(mainMod .. " + f", hl.dsp.window.fullscreen({ action = "toggle" }))
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("alacritty -e nvim"))
hl.bind(mainMod .. " + F2", hl.dsp.exec_cmd(browser))
hl.bind(mainMod .. " + F3", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("flameshot gui"))

hl.bind(winKey .. " + f", hl.dsp.exec_cmd("alacritty --class yazi -e yazi"))
hl.bind(winKey .. " + SHIFT + S", hl.dsp.exec_cmd("zathura ~/Desktop/syllabus.pdf"))
hl.bind(
	winKey .. " + c",
	hl.dsp.exec_cmd("alacritty --class cava -o window.dimensions.columns=60 -o window.dimensions.lines=20 -e cava")
)
hl.bind(
	winKey .. " + h",
	hl.dsp.exec_cmd("alacritty --class htop -o window.dimensions.columns=60 -o window.dimensions.lines=20 -e htop")
)

----------------
-- WINDOW / LAYER RULES
----------------
hl.layer_rule({ match = { namespace = "notifications" }, blur = true })
hl.layer_rule({ match = { namespace = "notifications" }, ignore_alpha = 0.0 })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-notification-window" }, ignore_alpha = 0.1 })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, blur = true })
hl.layer_rule({ match = { namespace = "swaync-control-center" }, ignore_alpha = 0.1 })

hl.window_rule({
	name = "scratchpad-term-float",
	match = { class = "^(scratchpad-term)$" },
	float = true,
	size = { 800, 500 },
	center = true,
})

hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	name = "bruno-workspace",
	match = { class = "^(bruno|BRUNO)$" },
	workspace = "2",
})

hl.window_rule({
	name = "zen-workspace",
	match = { class = "^(zen)$" },
	workspace = "3",
})

hl.window_rule({
	name = "helium-browser",
	match = { class = "^(helium-browser)$" },
	workspace = "5",
})

hl.window_rule({
	name = "browsers-workspace",
	match = { class = "^(firefox|chrome|brave|chromium)$" },
	workspace = "3",
})

hl.window_rule({
	name = "obsidian-workspace",
	match = { class = "^(obsidian|Obsidian|Eraser)$" },
	workspace = "4",
})

hl.window_rule({
	name = "messaging-workspace",
	match = { class = "^(Signal|signal|whatsapp-nativefier-d40211)$" },
	workspace = "5",
})

hl.window_rule({
	name = "xwayland-drag-fix",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
	no_initial_focus = true,
})

hl.window_rule({
	name = "ghostty-float",
	match = { class = "^(ghostty)$" },
	float = true,
	size = { 800, 1000 },
	center = true,
})

hl.window_rule({
	name = "yazi-float",
	match = { class = "^(yazi)$" },
	float = true,
	size = { 1000, 600 },
	center = true,
})

hl.window_rule({
	name = "zathura-float",
	match = { class = "^(org.pwmt.zathura)$" },
	float = true,
	size = { 1000, 600 },
	center = true,
})

hl.window_rule({
	name = "flameshot-pin",
	match = { class = "^(flameshot)$" },
	float = true,
	pin = true,
	move = { 0, 0 },
	rounding = 0,
	no_anim = true,
})

hl.window_rule({
	name = "mpv-float",
	match = { class = "^(mpv)$" },
	float = true,
	size = { 230, 230 },
	move = { 1000, 60 },
})

hl.window_rule({
	name = "cava-float",
	match = { class = "^(cava)$" },
	float = true,
	size = { 600, 300 },
	move = { 600, 450 },
})

hl.window_rule({
	name = "htop-float",
	match = { class = "^(htop)$" },
	float = true,
	size = { 1000, 600 },
	center = true,
})

-- keep locals referenced to avoid accidental cleanup in future edits
_ = menu
