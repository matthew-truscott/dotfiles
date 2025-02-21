if status is-interactive
  set fish_greeting

  # local stuff (don't add this file to git)
  source ~/.config/fish/local.fish

  # Commands to run in interactive sessions can go here
  function lt
    eza -l --git --hyperlink --header $argv
  end

  function lst
    eza -l --git -T -L 2 --ignore-glob="*.pyc|*.o|*.make|*.cmake" --hyperlink --header $argv
  end

  alias x='xdg-open'
  alias vi='nvim'
  alias gitignored="git ls-files -v|grep '^S'"
  alias ccat='/usr/bin/cat'
  alias cat='batcat'
  alias lg='lazygit'
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  alias sl='ls'
  alias cd='z'
  alias ccd='cd'

  # theme
  source ~/.config/fish/kanagawa.fish

  set -g fish_key_bindings fish_vi_key_bindings

  # env
  direnv hook fish | source
  set -x DIRENV_LOG_FORMAT "$(set_color blue)direnv: $(set_color green)%s$(set_color normal)"

  # jump
  zoxide init fish | source

  # tide config
  set --global tide_left_prompt_items pwd git newline character
  set --global tide_right_prompt_items status cmd_duration context jobs direnv python
end


