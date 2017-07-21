echo -n Setting abbreviations...
#abbreviations
abbr --add g        'git'
abbr --add gs       'git status'
abbr --add gst      'git stash'
abbr --add gstl     'git stash list'
abbr --add gstp     'git stash pop'
abbr --add gstd     'git stash drop'
abbr --add gco      'git checkout'
abbr --add gnb      'git checkout -b'
abbr --add gcom     'git checkout master'
abbr --add gcop     'git checkout production'
abbr --add gcp      'git cherry-pick'
abbr --add gA       'git add --all'
abbr --add ga       'git add'
abbr --add gd       'git diff'
abbr --add gdom     'git diff origin/master'
abbr --add gdtom    'git difftool origin/master'
abbr --add gb       'git bit'
abbr --add gr       'git rebase'
abbr --add gri      'git rebase -i'
abbr --add grm      'git rebase origin/master'
abbr --add grp      'git rebase origin/production'
abbr --add gsb      'git branch'
abbr --add gbd      'git branch -d'
abbr --add gbD      'git branch -D'
abbr --add gvv      'git branch -vv'
abbr --add gseb     'git branch | ag'
abbr --add glr      'git branch --remotes'
abbr --add gf       'git fetch'
abbr --add gfa      'git fetch --all -p'
abbr --add gfr      'git fetch; and git rebase'
abbr --add gfrm     'git fetch; and git rebase origin/master'
abbr --add gc       'git commit'
abbr --add gcm      'git commit -m "'
abbr --add gcf      'git commit --fixup'
abbr --add gca      'git commit --amend'
abbr --add gdt      'git difftool'
abbr --add gru      'git config --get remote.origin.url'
abbr --add gp       'git push'
abbr --add grd      'git push origin --delete' #delete remote branch
abbr --add gpl      'git pull'
abbr --add gr       'git reset HEAD' #throw away any local changes
abbr --add gdlc     'git reset --hard HEAD^' #throw away the last commit
abbr --add grc      'git reset --hard' #throw away everything after commit
abbr --add gdrc     'git revert HEAD' #revert changes of specified commit
abbr --add gcl      'git clone'
abbr --add gDab     'git branch -D (git for-each-ref --format="%(refname:short)" | ag )'
#shell shortcuts
abbr --add c         'clear'
abbr --add infi     '> file.txt 2>&1'
abbr rr             'rm -ir'
abbr rd             'rm -id'
abbr rf             'rm -rf'
abbr rA             'rm -rf *'
abbr llh            'ls -Al *.hex'

#ninja shortcuts
abbr nc             'ninja clean'
abbr nv             'ninja -v'

#make shortcuts
abbr mca            'make cleanall'

#useful stuff
abbr efc            'nvim ~/dotfiles/fish/config.fish'
abbr efia            'nvim ~/dotfiles/fish/completions/abbrs.fish'
abbr evrc           'nvim ~/dotfiles/.vimrc'
abbr evm            'nvim ~/dotfiles/vim/config/fhof_mapping.vim'
abbr cdl            'cd ~/Downloads'
abbr cmx            'cd ~/mx-dev.git'
abbr cmxf           'cd ~/mx-fork.git'
abbr rsse           'rsync fhof@pyrite:/home/sw-eng/builds/ -avzuP'

#merge history of several fish instances
abbr --add mhi      'history --merge'
echo 'Done'
