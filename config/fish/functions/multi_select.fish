function multi_select --description 'Multi-select from input files'
   fzf -m --color=light,fg:-1,bg:-1,hl:199,hl+:128 --height=15 $argv
end
