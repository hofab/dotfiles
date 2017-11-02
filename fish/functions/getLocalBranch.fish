# Defined in /home/fhof/.config/fish/functions/delRemBranch.fish @ line 1
function getLocalBranch
    git branch | string trim | cfzf;
end
