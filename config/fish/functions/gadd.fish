function gadd --description 'git add multiple selectable files'
   git add (git status | string match -r "^\s\s*\K.*" | multi_select)
end
