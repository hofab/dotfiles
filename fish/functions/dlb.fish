function dlb --description "Delete local git branches that include x"
    if [ (count $argv) -gt 0 ]
        git branch -D (git branch | rg -i $argv| string trim)
    else
        echo "No input arguments"
    end
end
