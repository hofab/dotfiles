function fa --description 'Fuzzy git add'
    git add (git status | rg -o '(\w*\.c)' | fzf --height=10);
end
