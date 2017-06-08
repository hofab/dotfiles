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
abbr --add gch      'git checkout'
abbr --add gnb      'git checkout -b'
abbr --add gchm     'git checkout master'
abbr --add gA       'git add --all'
abbr --add ga       'git add'
abbr --add gd       'git diff'
abbr --add gb       'git bit'
abbr --add gr       'git rebase'
abbr --add grm      'git rebase origin/master'
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
abbr --add gp       'git push -f'
abbr --add grd      'git push origin --delete'
abbr --add gr       'git reset HEAD'

#shell shortcuts
abbr --add c        'clear'
abbr > file.txt 2>&1 'infi'
abbr rr             'rm -ir'
abbr rd             'rm -id'
abbr rf             'rm -rf'

#merge history of several fish instances
abbr --add mhi      'history --merge'
