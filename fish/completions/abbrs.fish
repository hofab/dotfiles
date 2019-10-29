#abbreviations
if not set -q fish_initialized
    abbr --add g        'git'
    abbr --add gs       'git status'
    abbr --add gst      'git stash'
    abbr --add gstl     'git stash list'
    abbr --add gstp     'git stash pop'
    abbr --add gstd     'git stash drop'
    abbr --add gco      'git checkout'
    abbr --add gnb      'git checkout -b'
    abbr --add gfb      'git checkout -b feature/fh/'
    abbr --add gbb      'git checkout -b bugfix/fh/'
    abbr --add ghb      'git checkout -b hotfix/fh/'
    abbr --add gwb      'git checkout -b wip/fh/'
    abbr --add gcom     'git checkout master'
    abbr --add grf      'git checkout --'
    abbr --add gcp      'git cherry-pick'
    abbr --add gcpa     'git cherry-pick --abort'
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
    abbr --add gri      'git rebase -i'
    abbr --add gas      'git rebase --autosquash'
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
    abbr --add gfp      'git push -f'
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
#shell shortcuts
    abbr --add c        'clear'
    abbr --add infi     '> file.txt 2>&1'
    abbr --add rr       'rm -ir'
    abbr --add rd       'rm -id'
    abbr --add rf       'rm -rf'
    abbr --add rA       'rm -rf *'
    abbr --add elh      'exa -l *.hex'
    abbr --add el       'exa -l'
    abbr --add ea       'exa -la'

#ninja shortcuts
    abbr --add nc       'ninja clean'
    abbr --add nv       'ninja -v'

#make shortcuts
    abbr --add mca      'make cleanall'

#make.py shortcuts
    abbr --add mpc      'make.py clean'
    abbr --add mp       'make.py'

#useful stuff
    abbr --add efc      'nvim ~/dotfiles/fish/config.fish'
    abbr --add efia     'nvim ~/dotfiles/fish/completions/abbrs.fish'
    abbr --add evrc     'nvim ~/dotfiles/.vimrc'
    abbr --add evm      'nvim ~/dotfiles/vim/config/fhof_mapping.vim'
    abbr --add ecs      'nvim ~/dotfiles/vim/UltiSnips/c_my.snippets'
    abbr --add zdl      'z ~/Downloads'
    abbr --add zm       'z ~/maint'
    abbr --add zc       'z ~/cfgdb'
    abbr --add zb       'z sw-builds'
    abbr --add zr       'z ~/release.git'
    abbr --add mip      './maint -i 142.65.'
    abbr --add rsse     'rsync fhof@pyrite:/home/sw-eng/builds/ -avzuP'
    abbr --add o        'nvim'
    abbr --add ov       'nvim *.vdd'
    abbr --add ca       'rm *.{hex,elf,map,bin}'
    abbr --add sd       'exa -l | rg -i'
    abbr --add sg       'gb -1000 | rg -i'
    abbr --add rsw      'rm /home/fhof/.local/share/nvim/swap/*'

#merge history of several fish instances
    abbr --add mhi      'history --merge'

#docker short cuts
    abbr --add dk       'docker'
    abbr --add dki      'docker images'
    abbr --add dkstop   'docker stop `docker ps -q`'
    abbr --add dkps     'docker ps --format "{{.ID}} ~ {{.Names}} ~ {{.Status}} ~ {{.Image}}"'

# make reset of abbreviations easy
    abbr --add ars      'set -e fish_user_abbreviations; set -e fish_initialized'

# tmux dev environment start
    abbr --add tmx      'tmux attach -d -t dev'
    set -U fish_initialized
end
