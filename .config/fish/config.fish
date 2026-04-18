if status is-interactive
  set fish_greeting

  # local stuff (don't add this file to git)
  #source ~/.config/fish/local.fish

  # Commands to run in interactive sessions can go here

  alias x='xdg-open'
  alias vi='nvim'
  alias gitignored="git ls-files -v|grep '^S'"
  alias lg='lazygit'
  alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
  alias sl='l'

  set -g fish_key_bindings fish_vi_key_bindings

  # env
  set -x DIRENV_LOG_FORMAT "$(set_color blue)direnv: $(set_color green)%s$(set_color normal)"
end


