-- Pull in the wezterm API
local wezterm = require("wezterm")
local env = require("config")
local mux = wezterm.mux

local config = {}
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Spawn a fish shell in login mode
config.default_prog = { env.fish, "-l" }

-- theme
function GetAppearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

function SchemeForAppearance(appearance)
	if appearance:find("Dark") then
		return "Kanagawa (Gogh)"
	else
		return "Gruvbox (Gogh)"
	end
end

local appearance = GetAppearance()

function ApplyTheme(window)
	local fish_command = appearance == "Light" and "light()" or "dark()"
	window:perform_action(wezterm.action({ SpawnCommand = {
		args = { "fish", "-c", fish_command },
	} }))
end

wezterm.on("window-opened", function(window, pane)
	ApplyTheme(window)
end)

config.color_scheme = SchemeForAppearance(appearance)
config.font = wezterm.font("Cascadia Code")
config.font_size = env.size

config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_max_width = 24

config.window_frame = {
	-- tab bar
	font = wezterm.font({ family = "JetBrainsMono Nerd Font", weight = "Bold" }),
	font_size = 10.0,
	active_titlebar_bg = "#282828",
	inactive_titlebar_bg = "#1d2021",
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.window_background_opacity = 1.0

config.keys = {
	{
		key = "LeftArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ ActivateTabRelative = -1 }),
	},
	{
		key = "RightArrow",
		mods = "CTRL|SHIFT",
		action = wezterm.action({ ActivateTabRelative = 1 }),
	},
}

-- Workspaces
wezterm.on("gui-startup", function(cmd)
	-- Args
	local mode = os.getenv("WEZMODE")
	local args = { env.fish, "-l" }

	if mode == "falcon" then
		-- FALCON API
		local falcon, falcon_code_pane, window = mux.spawn_window({
			workspace = "coding",
			cwd = env.artemis.falcon,
			args = args,
		})
		local falcon_build_pane = falcon_code_pane:split({
			cwd = env.artemis.falcon,
			size = 0.4,
		})
		-- RUN DOCKER
		falcon_build_pane:send_text("make dev-local\n")
		-- RUN API
		falcon_build_pane:send_text("python falcon_optimisation_api/rest_api/run_api.py\n")
		-- RUN NEOVIM
		falcon_code_pane:send_text("vi\n")
		falcon:set_title("falcon")

		-- VISION API
		local vision, vision_code_pane, _ = window:spawn_tab({
			cwd = env.artemis.vision,
			args = args,
		})
		local vision_build_pane = vision_code_pane:split({
			cwd = env.artemis.vision,
			size = 0.4,
		})
		-- RUN DOCKER
		vision_build_pane:send_text("make dev-local\n")
		-- RUN API
		vision_build_pane:send_text("python vision_chat_api/rest_api/run_api.py\n")
		-- RUN NEOVIM
		vision_code_pane:send_text("vi\n")
		vision:set_title("vision")

		-- WORKERS
		local workers, worker_code_pane, _ = window:spawn_tab({
			workspace = "coding",
			cwd = env.artemis.workers,
			args = args,
		})
		local worker_build_pane = worker_code_pane:split({
			cwd = env.artemis.workers .. "worker/pr-create",
			direction = "Bottom",
			size = 0.3,
		})
		local tool_code_pane = worker_code_pane:split({
			cwd = env.artemis.tools,
			size = 0.5,
		})
		local rerank_worker_build_pane = worker_build_pane:split({
			cwd = env.artemis.workers .. "worker/rerank",
			size = 0.3,
		})
		local embedding_worker_build_pane = worker_build_pane:split({
			cwd = env.artemis.workers .. "worker/embedding",
			size = 0.3,
		})
		workers:set_title("workers")
	else
		local tab, pane, window = mux.spawn_window(cmd or {})
	end
end)

return config
