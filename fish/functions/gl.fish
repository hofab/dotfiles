function gl
    git log --graph --pretty=format:'%C(yellow bold)%h%Creset (%ad) %C(bold)%an:%Creset %s %Cgreen%d%Creset' --date=relative
end
