set -g Z_SCRIPT_PATH /usr/local/bin/z
set -U FZF_FIND_FILE_COMMAND 'rg --files --hidden --smartcase --glob --height=15 "!.git/*"'
set --export FZF_DEFAULT_COMMAND 'fd --type f'

# set fish_right_prompt timezone
set -g theme_date_timezone America/New_York

set -g fish_browser /usr/bin/firefox

# set path to fish completions
set fish_complete_path ~/.config/fish/completions $fish_complete_path

set fish_prompt_pwd_dir_length 1
set theme_project_dir_length 1
set -g theme_display_git_master_branch yes
set -U theme_nerd_fonts no

set --export TERMINAL "alacritty"

# reference: https://gist.github.com/netmute/6761892
# make neovim the default editor
set --export EDITOR "nvim"
# make neovim usable with git
set --export GIT_EDITOR "nvim"

set -g fish_term256 1

# user specific configuration
set --export USER_LOG_DIR "$HOME/sfl-bkp/logs"

# nnn support editor
set --export NNN_USE_EDITOR "1"
set --export NNN_FCOLORS "04041947000080f600000000"
set --export NNN_COLORS "5236"

# exa colors
# do more
set --export EXA_COLORS "ln=35:ex=32"

# set bat theme
set --export BAT_THEME "ansi"

#alacritty scalling to be consistent
set --export WINIT_X11_SCALE_FACTOR "1"

fundle plugin 'edc/bass'
fundle plugin 'tuvistavie/fish-fastdir'
fundle plugin 'catppuccin/fish'

fundle init

source "$HOME/sfl-bkp/git-subrepo/.fish.rc"

# if not loaded remove surrounding if and restart fish
source "$HOME/.config/fish/completions/abbrs.fish"

starship init fish | source

# if not added to path it throws an error at startup
set -x PATH ~/.pyenv/bin $PATH
set -x PATH ~/.local/bin $PATH
pyenv init - | source
