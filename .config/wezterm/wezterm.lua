local wezterm = require("wezterm")
local mux = wezterm.mux

local config = wezterm.config_builder()

-- Spawn a fish shell in login mode
config.default_prog = { "/home/matthew.t/.local/bin/fish", "-l" }

config.font = wezterm.font("Cascadia Code")
config.font_size = 18.0
config.color_scheme = "Kanagawa (Gogh)"

config.tab_bar_at_bottom = true

-- Workspaces
wezterm.on("gui-startup", function(cmd)
	-- Args
	local mode = os.getenv("WEZMODE")
	local args = { "/home/matthew.t/.local/bin/fish", "-l" }

	if mode == "falcon" then
		-- FALCON API
		local falcon, falcon_code_pane, window = mux.spawn_window({
			workspace = "coding",
			cwd = "/home/matthew.t/dev/falcon-optimisation-api",
			args = args,
		})
		local falcon_build_pane = falcon_code_pane:split({
			cwd = "/home/matthew.t/dev/falcon-optimisation-api",
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
			cwd = "/home/matthew.t/dev/vision-chat-api",
			args = args,
		})
		local vision_build_pane = vision_code_pane:split({
			cwd = "/home/matthew.t/dev/vision-chat-api",
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
			cwd = "/home/matthew.t/dev/artemis-misc-workers",
			args = args,
		})
		local worker_build_pane = worker_code_pane:split({
			cwd = "/home/matthew.t/dev/artemis-misc-workers/worker/pr-create",
			direction = "Bottom",
			size = 0.3,
		})
		local tool_code_pane = worker_code_pane:split({
			cwd = "/home/matthew.t/dev/artemis-tools",
			size = 0.5,
		})
		local rerank_worker_build_pane = worker_build_pane:split({
			cwd = "/home/matthew.t/dev/artemis-misc-workers/worker/rerank",
			size = 0.3,
		})
		local embedding_worker_build_pane = worker_build_pane:split({
			cwd = "/home/matthew.t/dev/artemis-misc-workers/worker/embedding",
			size = 0.3,
		})
		workers:set_title("workers")
	else
		local tab, pane, window = mux.spawn_window(cmd or {})
	end
end)

return config
