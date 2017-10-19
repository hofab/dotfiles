function fco --description 'Fuzzy-find and checkout a branch'
    git branch --all | grep -v HEAD | string trim | fzf --height=10 | xargs git checkout
end
