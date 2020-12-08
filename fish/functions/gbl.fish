function gbl
    if test (count $argv) -gt 1
        git blame -L$argv[2],+30 $argv[1]
    else
        git blame $argv[1]
    end
end
