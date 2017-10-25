function gb
    if [ (count $argv) -gt 0 ]
        git log --graph --pretty=format:'%C(yellow bold)%h%Creset (%ad) %C(bold)%an:%Creset %s %Cgreen%d%Creset' --date=relative -$argv

    else
        git log --graph --pretty=format:'%C(yellow bold)%h%Creset (%ad) %C(bold)%an:%Creset %s %Cgreen%d%Creset' --date=relative -15
    end
end
