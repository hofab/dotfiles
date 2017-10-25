# Defined in /home/fhof/.config/fish/functions/delRemBranch.fish @ line 1
function getBranch
    git branch --all | string trim | cfzf;
end
