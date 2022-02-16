function gcob --description "checkout version branch quickly gcob 16/20"
    if [ (count $argv) -gt 0 ]
        set first_num (string sub -s1 -l1 $argv)
        set sec_num (string sub -s2 -l1 $argv)
        set branch "v"$first_num"."$sec_num
        git checkout $branch
    else
    end
end
