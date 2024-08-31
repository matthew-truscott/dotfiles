if status is-interactive
  set fish_greeting

  # Commands to run in interactive sessions can go here
  function lt
    eza -l --git --hyperlink --header $argv
  end

  function lst
    eza -l --git -T -L 2 --ignore-glob="*.pyc|*.o|*.make|*.cmake" --hyperlink --header $argv
  end

  alias x='xdg-open'
  alias ssh='kitten ssh'
  alias vi='nvim'
  alias gitignored="git ls-files -v|grep '^S'"
  alias ccat='/usr/bin/cat'
  alias cat='batcat'
  alias lg='lazygit'
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  alias wezterm='flatpak run org.wezfurlong.wezterm'
  alias docker-compose='docker compose'
  alias sl='ls'

  function dark -d "Switch to dark theme"
    set -xU theme dark
    kitty @ set-colors --all --configured ~/.config/kitty/kanagawa_dark.conf
  end

  function light
    set -xU theme light
    kitty @ set-colors --all --configured ~/.config/kitty/kanagawa_light.conf
  end

  dark
  source ~/.config/fish/kanagawa.fish

  eval "$(fnm env --use-on-cd)"

  # env
  direnv hook fish | source

end


