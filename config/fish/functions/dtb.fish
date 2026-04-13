function dtb --description 'Delete this branch'
    set branch_name (git rev-parse --abbrev-ref HEAD)
    git checkout master
    git branch -D $branch_name
end
