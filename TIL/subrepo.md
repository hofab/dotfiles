# git subrepo

To make it easier to work with submodules, some places use [git subrepo](https://github.com/ingydotnet/git-subrepo), and so it is
important to know how to use it.

## Usage
In the main repo do the following:
```
git commit <work>
git fetch origin
git pull --rebase or git rebase origin/master
git subrepo push <subrepo_name>
git push
```
