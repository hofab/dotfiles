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

set --export TERMINAL "alacritty"

# reference: https://gist.github.com/netmute/6761892
# make neovim the default editor
set --export EDITOR "nvim"
# make neovim usable with git
set --export GIT_EDITOR "nvim"

# make.py quiet output
set --export MAKE_QUIET "1"
#set --export TOOLCHAIN "xilinx"
set --export CFGDB_DIR "$HOME/cfgdb"
set --export OPT_ROOT  '/opt/software'
set --export CPPUTEST_HOME  "$OPT_ROOT/cpputest"

# vectorCast
set --export VECTORCAST_DIR '/opt/software/vectorcast'
# vectorCast license server
set --export VECTOR_LICENSE_FILE "27000@englicense1"
# vectorCast Repos
set --export VCAST_VER_REPO ~/verification.git
set --export VCAST_MX_REPO ~/release.git

# Matlab license and server
set --export MLM_LICENSE_FILE "27000@LICENSESVR2:27000@LICENSESVR3"

# codesonar w
set --export CS_WORKING_DIR "$HOME/codesonar"
set --export CS_HUB_USER "fhof"

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

# get ccls working
set -g PATH $PATH /home/linuxbrew/.linuxbrew/bin

source "$HOME/.config/fish/completions/abbrs.fish"
starship init fish | source
