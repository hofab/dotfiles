function m --description 'Start maint with log'
    cd ~/maint
    ./maint -d 23 -s ~/dotfiles/maintrc -i 142.65.$argv
end
