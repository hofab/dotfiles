function fco --description 'Fuzzy-find and checkout a branch'
    git branch --all | rg -v HEAD | string trim | cfzf | xargs git checkout
end
