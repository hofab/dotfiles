set -g Z_SCRIPT_PATH /usr/local/bin/z
set -U FZF_FIND_FILE_COMMAND 'rg --files --hidden --smartcase --glob --height=15 "!.git/*"'
set --export FZF_DEFAULT_COMMAND 'fd --type f'

# set fish_right_prompt timezone
set -g theme_date_timezone America/New_York

# set path to fish completions
set fish_complete_path ~/.config/fish/completions $fish_complete_path

set fish_prompt_pwd_dir_length 1
set theme_project_dir_length 1
set -g theme_display_git_master_branch yes
set -U theme_nerd_fonts no

# reference: https://gist.github.com/netmute/6761892
# make neovim the default editor
set --export EDITOR "nvim"
# make neovim usable with git
set --export GIT_EDITOR "nvim"

set -g fish_term256 1

# nnn support editor
set --export NNN_USE_EDITOR "1"
set --export NNN_FCOLORS "04041947000080f600000000"
set --export NNN_COLORS "5236"

# exa colors
# do more
set --export EXA_COLORS "ln=35"

#alacritty scalling to be consistent
set --export WINIT_X11_SCALE_FACTOR "1"

status is-login; and pyenv init --path | source
status is-interactive; and pyenv init - | source

source "$HOME/.config/fish/completions/abbrs.fish"
starship init fish | source


