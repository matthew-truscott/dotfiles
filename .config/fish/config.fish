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

  eval "$(fnm env --use-on-cd)"

  function dark
    theme_gruvbox 'dark' 'hard'
    set -xU theme dark
  end

  function light
    theme_gruvbox 'light' 'medium'
    set -xU theme light
  end

  dark

  # env
  direnv hook fish | source

  # for pyenv
  pyenv init - | source
  pyenv virtualenv-init - | source


  # search for a myInit.fish file UP THE DIRECTORY TREE, starting from the current folder.
  # if found, execute it.
  # Intended for automatically switching to the python  virtual environment on entering the
  # directories.  Can put in other initialization stuff.


  function cd --description 'change directory - fish overload'
    builtin cd $param $argv

    set -l INIT init.fish
    set -l CWD (pwd)
    # if myInit.fish is found in the home directory:
    if test -f "$CWD/$INIT"
      source $CWD/$INIT
      echo "executed: source $CWD/$INIT"
      return
    end

    # Look up the directory tree for myInit.fish:
    set CWD (string split -r -m 1 / $check_dir)[1]

    while test $CWD
      if test -f "$CWD/$INIT"
        source $CWD/$INIT
        echo "executed: source $CWD/$INIT"
        break;
      else
        set CWD (string split -r -m 1 / $check_dir)[1]
      end  # if ... else ...
    end  # while 
  end  # function

end


