function kcssh --description 'SSH into one of keplers ssh instances'
    # you should have the argument defined in your ssh config so you can remote into
    # the instance by kcssh <name-in-ssh-config>

    sshpass -f ~/.config/.auth/kepler@ut2 ssh $argv
end
