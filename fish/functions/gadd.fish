function gadd --description 'git add multiple selectable files'
   git add (git status | string match -r "\s{4}\s*\K.*[a-z]*" | multi_select)
end
