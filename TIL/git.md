# GIT
Just a collection of things I don't do often and don't want to look up repeadetly.

## Split up previously committed commits into multiple commits
[stackoverflow](https://stackoverflow.com/questions/6217156/break-a-previous-commit-into-multiple-commits)
```
git rebase <hash>~
# replace pick with edit in rebase screen
git reset HEAD~
# make the changes
git rebase --continue
```
