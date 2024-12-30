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
  alias s='kitten ssh'
  alias vi='nvim'
  alias gitignored="git ls-files -v|grep '^S'"
  alias ccat='/usr/bin/cat'
  alias cat='batcat'
  alias lg='lazygit'
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  alias wezterm='flatpak run org.wezfurlong.wezterm'
  alias docker-compose='docker compose'
  alias sl='ls'

  set -x AWS_PROFILE artemis

  # theme
  source ~/.config/fish/kanagawa.fish

  # env
  direnv hook fish | source

end


