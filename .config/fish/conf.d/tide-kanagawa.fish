# Tide colours as ANSI names (not hex), so the prompt inherits the terminal's
# 16-colour palette. ghostty ships Kanagawa Wave/Lotus as its ANSI palette, so
# these follow a live light/dark switch automatically — same trick as an ansi
# Claude Code theme. The comment on each line is the kanagawa role it maps to.
# (Orange/pink have no ANSI slot and are approximated to the nearest one.)
set -U tide_prompt_color_frame_and_connection brblack  # fujiGray
set -U tide_character_color blue                # crystalBlue
set -U tide_character_color_failure brred   # samuraiRed
set -U tide_character_icon '❯'
set -U tide_git_color_branch brgreen        # springGreen  — on clean branch
set -U tide_git_color_stash magenta             # oniViolet    — *N stashes
set -U tide_git_color_conflicted brred      # samuraiRed   — ~N merge conflicts
set -U tide_git_color_staged cyan               # waveAqua1    — +N staged, ready
set -U tide_git_color_dirty bryellow        # carpYellow   — !N unstaged changes
set -U tide_git_color_untracked brmagenta   # sakuraPink   — ?N untracked (approx)
set -U tide_git_color_upstream brblue       # springBlue   — ⇡⇣ ahead/behind
set -U tide_git_color_operation brred       # samuraiRed   — rebase/merge in progress
set -U tide_pwd_color_dirs brblue           # springBlue
set -U tide_pwd_color_anchors white             # oldWhite
set -U tide_pwd_color_truncated_dirs brblack # fujiGray
set -U tide_status_color brgreen            # springGreen
set -U tide_status_color_failure brred      # samuraiRed
set -U tide_cmd_duration_color yellow           # autumnYellow
set -U tide_time_color brblack              # fujiGray
set -U tide_jobs_color brgreen              # springGreen
set -U tide_nix_shell_color blue                # crystalBlue
set -U tide_python_color blue                   # crystalBlue
set -U tide_rust_color yellow                   # surimiOrange (approx)
set -U tide_node_color brgreen              # springGreen
set -U tide_go_color brblue                 # springBlue
set -U tide_java_color yellow                   # surimiOrange (approx)
set -U tide_ruby_color brred                # samuraiRed
set -U tide_php_color magenta                   # oniViolet
set -U tide_kubectl_color blue                  # crystalBlue
set -U tide_aws_color yellow                    # surimiOrange (approx)
set -U tide_gcloud_color blue                   # crystalBlue
set -U tide_terraform_color magenta             # oniViolet
set -U tide_docker_color brblue             # springBlue
set -U tide_context_color brblue            # springBlue
set -U tide_os_color brwhite                # fujiWhite
set -U tide_shlvl_color yellow                  # autumnYellow
set -U tide_vi_mode_color_default blue          # crystalBlue
set -U tide_vi_mode_color_replace brred     # samuraiRed
set -U tide_vi_mode_color_insert brgreen    # springGreen
set -U tide_vi_mode_color_visual bryellow   # carpYellow

# Niche language/tool segments (only shown in their project dirs)
set -U tide_direnv_color yellow                 # gold (approx)
set -U tide_distrobox_color brmagenta
set -U tide_elixir_color magenta
set -U tide_crystal_color brwhite
set -U tide_private_mode_color brwhite
set -U tide_pulumi_color bryellow
set -U tide_zig_color bryellow              # orange-gold (approx)
set -U tide_rustc_color brred               # orange-red (approx)
set -U tide_toolbox_color magenta
