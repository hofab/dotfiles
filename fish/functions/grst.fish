function grst --description 'git restore of multiple selectable files'
   git restore --staged (git status | string match -r "[a-z].*:\s*\K.*[a-z]*" | multi_select)
end
