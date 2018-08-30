function gfc
    if [ (count $argv) -gt 0 ]
        git log --pretty=format:'%Cblue %h %Cgreen %cr %Creset %N %sr' --name-only --date=relative $argv
    else
        git log --pretty=format:'%Cblue %h %Cgreen %cr %Creset %N %sr' --name-only --date=relative -10
    end
end
