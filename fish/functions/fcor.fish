function fcor --description 'Fuzzy-find and checkout a branch'
    git checkout -b (git branch --all | rg -v HEAD | string trim | cfzf | string replace --filter 'remotes/origin/' '')
    git push --set-upstream origin (gbn)
end
