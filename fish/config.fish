eval (python -m virtualfish)
set -g Z_SCRIPT_PATH /usr/local/bin/z
set -U FZF_FIND_FILE_COMMAND 'rg --files --hidden --smartcase --glob --height=15 "!.git/*"'

# set path to fish completions
set fish_complete_path ~/.cofig/fish/completions $fish_complete_path

set fish_prompt_pwd_dir_length 1
set theme_project_dir_length 1

# reference: https://gist.github.com/netmute/6761892
# make Vim the default editor
set --export EDITOR "nvim -f"
# make Vim usable with git
set --export GIT_EDITOR "nvim -f"

# make.py quit output
set --export MAKE_QUIET "1"
set --export TOOLCHAIN "xilinx"

# vectorCast
set --export VECTORCAST_DIR '/opt/software/vectorcast'
# vectorCast license server
set --export VECTOR_LICENSE_FILE "27000@englicense1"
# vectorCast Repos
set --export VCAST_VER_REPO ~/verification.git
set --export VCAST_MX_REPO ~/release.git

# Matlab license and server
set --export MLM_LICENSE_FILE "27000@LICENSESVR2:27000@LICENSESVR3"
set --export VTE_VERSION "100"

# codesonar
set --export CS_WORKING_DIR "$HOME/codesonar"
set --export CS_HUB_USER "fhof"

source "$HOME/.config/fish/completions/abbrs.fish"
