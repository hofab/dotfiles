eval (python -m virtualfish)
set -g Z_SCRIPT_PATH /usr/local/bin/z
set -U FZF_FIND_FILE_COMMAND 'rg --files --hidden --smartcase --glob "!.git/*"'

# set path to fish completions
set fish_complete_path ~/.cofig/fish/completions $fish_complete_path
# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

set fish_prompt_pwd_dir_length 1
set theme_project_dir_length 1

# reference: https://gist.github.com/netmute/6761892
# make Vim the default editor
set --export EDITOR "nvim -f"
# make Vim usable with git
set --export GIT_EDITOR "nvim -f"

source "$HOME/.config/fish/completions/abbrs.fish"
