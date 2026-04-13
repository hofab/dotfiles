function dtrb --description 'Delete this branch on remote'
    set branch_name (git rev-parse --abbrev-ref HEAD)
    git push origin --delete $branch_name
end
