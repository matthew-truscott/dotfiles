function gitignored --description 'list assume-unchanged files'
    git ls-files -v | grep '^S'
end
