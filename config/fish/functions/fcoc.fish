function fcoc --description 'Fuzzy-find and checkout a commit'
    git log --pretty=oneline --abbrev-commit --reverse | cfzf --tac +s -e | awk '{print $1;}' | xargs git checkout
end
