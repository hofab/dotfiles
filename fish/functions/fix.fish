function fix --description 'Fuzzy select commit ot fixup'
    set output (gb | cfzf | string match -rq '.*\* (?<hash>\w+) ')
    if [ (count $hash) -gt 0 ]
        echo $hash
        commandline -r 'git commit --fixup '$hash
    else
        echo "NONE"
    end
end
