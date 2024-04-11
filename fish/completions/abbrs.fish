#abbreviations
abbr --add g        'git'
abbr --add gs       'git status'
abbr --add gst      'git stash'
abbr --add gstl     'git stash list'
abbr --add gstp     'git stash pop'
abbr --add gstd     'git stash drop'
# see mjcarroll: https://github.com/mjcarroll/dotfiles/blob/master/git/.gitconfig
abbr --add gsnap    'git stash save "snapshot: (date)"; and git stash apply "stash@{0}"'
abbr --add gsnaps   'git stash list --rg snapshot'
abbr --add gco      'git checkout'
abbr --add gnb      'git checkout -b fh/'
abbr --add gfb      'git checkout -b feature/fh/'
abbr --add gcom     'git checkout master'
abbr --add grf      'git checkout --'
abbr --add gcp      'git cherry-pick'
abbr --add gcpa     'git cherry-pick --abort'
abbr --add gcpc     'git cherry-pick --continue'
abbr --add gA       'git add --all'
abbr --add ga       'git add'
abbr --add gap      'git add -p'
abbr --add gd       'git diff'
abbr --add gdh      'git diff HEAD'
abbr --add gdlc     'git diff HEAD^'
abbr --add gdom     'git diff origin/master'
abbr --add gdt      'git difftool'
abbr --add gdtom    'git difftool origin/master'
abbr --add gr       'git rebase'
abbr --add gri      'git rebase -i --autosquash'
abbr --add grom     'git rebase origin/master'
abbr --add grc      'git rebase --continue'
abbr --add gra      'git rebase --abort'
abbr --add gsb      'git branch'
abbr --add gdb      'git branch -d'
abbr --add gDb      'git branch -D'
abbr --add gvv      'git branch -vv'
abbr --add glr      'git branch --remotes'
abbr --add gDab     'git branch -D (git for-each-ref --format="%(refname:short)" | cfzf )'
abbr --add gfa      'git fetch --all -p'
abbr --add gfr      'git fetch --all -p; and git rebase'
abbr --add gfrm     'git fetch --all -p; and git rebase origin/master'
abbr --add gc       'git commit'
abbr --add gcm      'git commit -m "'
abbr --add gf       'git commit --fixup'
abbr --add gfh      'git commit --fixup HEAD'
abbr --add gca      'git commit --amend'
abbr --add gru      'git config --get remote.origin.url'
abbr --add gp       'git push'
abbr --add gfp      'git push --force-with-lease'
abbr --add gDrb     'git push origin --delete (gbn)' #delete remote branch
abbr --add gpl      'git pull --rebase -p'
abbr --add gus      'git reset HEAD --' #throw away any local changes
abbr --add grs      'git reset --hard HEAD' #throw away any local changes
abbr --add gdlc     'git reset --hard HEAD^' #throw away the last commit
abbr --add guco     'git reset --mixed HEAD~' #uncommit and keep changes
abbr --add gdc      'git reset --hard' #throw away everything after commit
abbr --add grh      'git revert HEAD' #revert changes of specified commit
abbr --add gcl      'git clone'
abbr --add gbs      'git bisect start "#BAD" "#GOOD" --'
abbr --add gbig     'git bisect good'
abbr --add gbib     'git bisect bad'
abbr --add gmt      'git mergetool'
abbr --add grev     'git merge-base origin/master HEAD | git difftool --stdin'
abbr --add gaifb    'git checkout integration/aifb'
abbr --add gac      'git commit -m"((gbn) | string split '/' | string match -r ".*[0-9]")'
abbr --add flc      'gfc -1' #show files of last commit
# apply clang-format to staged commit: https://clang.llvm.org/docs/ClangFormat.html
abbr --add fc       'git diff -U0 --no-color --relative HEAD^ | clang-format-diff-18 -p1 -i'
# show age of last commit on branch git age branch
abbr --add gba      'git for-each-ref --sort=committerdate refs/heads/ --format=\'%(HEAD)%(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname)(%(color:green)%(committerdate:relative)%(color:reset))\''
#shell shortcuts
abbr --add c        'clear'
abbr --add infi     '> file.txt 2>&1'
abbr --add rr       'rm -ir'
abbr --add rd       'rm -id'
abbr --add rf       'rm -rf'
abbr --add rA       'rm -rf *'
abbr --add ll       'exa -l'
abbr --add lll      '..; and exa -l'
abbr --add lr       'exa -lR'
abbr --add la       'exa -la'

#ninja shortcuts
abbr --add nc       'ninja clean'
abbr --add nv       'ninja -v'

#make shortcuts
abbr --add mca      'make cleanall'

#useful stuff
abbr --add ei       'nvim ~/dotfiles/i3/config'
abbr --add et       'nvim ~/dotfiles/tmux.conf'
abbr --add evrc     'nvim ~/dotfiles/vim/init.vim'
abbr --add efc      'nvim ~/dotfiles/fish/config.fish'
abbr --add efa     'nvim ~/dotfiles/fish/completions/abbrs.fish'
abbr --add evm      'nvim ~/dotfiles/vim/config/fhof_mapping.vim'
abbr --add ecs      'nvim ~/dotfiles/vim/UltiSnips/c_my.snippets'
abbr --add zd       'z ~/Downloads'
abbr --add o        'nvim'
abbr --add sd       'exa -lR | rg -i'
abbr --add sc       'rg -iu -tc'
abbr --add sg       'gb -1000 | rg -i'
abbr --add rsw      'rm /home/fhof/.local/share/nvim/swap/*'
abbr --add rg       'rg -i'

#merge history of several fish instances
abbr --add mhi      'history --merge'

#docker short cuts
abbr --add dk       'docker'
abbr --add dki      'docker images'
abbr --add dkstop   'docker stop `docker ps -q`'
abbr --add dkps     'docker ps --format "{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}"'
abbr --add drio     'docker run -it --rm --name="draw" -p 8080:8080 -p 8443:8443 jgraph/drawio'

# make reset of abbreviations easy
abbr --add ars      'set -e fish_user_abbreviations; set -e fish_initialized'

# tmux dev environment start
abbr --add tmx      'tmux attach -d -t fhof'

# bang bang implementation for fish
abbr --add !! --position anywhere --function last_history_item
