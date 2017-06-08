eval (python -m virtualfish)
set -g Z_SCRIPT_PATH /usr/local/bin/z

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

#abbreviations
abbr --add g        'git'
abbr --add gs       'git status'
abbr --add gst      'git stash'
abbr --add gnb      'git checkout -b'
abbr --add gsb      'git branch'
abbr --add gA       'git add --all'
abbr --add gd       'git diff'
abbr --add gc       'git checkout'
abbr --add gcm      'git checkout master'
abbr --add gb       'git bit'
abbr --add gr       'git rebase'
abbr --add grm      'git rebase origin/master'
abbr --add gbd      'git branch -d'
abbr --add gbD      'git branch -D'
abbr --add gvv      'git branch -vv'
abbr --add glr      'git branch --remotes'
abbr --add gfa      'git fetch --all -p'
abbr --add gf       'git fetch'
abbr --add gp       'git push -f'
abbr --add gca      'git commit --amend'
abbr --add gdt      'git difftool'
abbr --add gru      'git config --get remote.origin.url'
abbr --add gp       'git push -f'
abbr --add gfrm     'git fetch; and git rebase origin/master'
abbr --add gfr      'git fetch; and git rebase '
abbr --add gsmb     'git branch | ag'
abbr --add gcf      'git commit --fixup'
abbr --add gr       'git reset HEAD'
abbr --add grd      'git push origin --delete'


#shell shortcuts
abbr --add c        'clear'
abbr > file.txt 2>&1 'infi'
abbr rr             'rm -ir'
abbr rd             'rm -id'
abbr rf             'rm -rf'

#merge history of several fish instances
abbr --add mhi      'history --merge'
