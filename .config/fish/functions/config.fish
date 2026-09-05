function config --wraps git --description 'dotfiles bare-repo git'
    /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
