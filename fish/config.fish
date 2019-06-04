eval (python -m virtualfish)
set -g Z_SCRIPT_PATH /usr/local/bin/z
set -U FZF_FIND_FILE_COMMAND 'rg --files --hidden --smartcase --glob --height=15 "!.git/*"'

# set path to fish completions
set fish_complete_path ~/.cofig/fish/completions $fish_complete_path

set fish_prompt_pwd_dir_length 1
set theme_project_dir_length 1
set -g theme_display_git_master_branch yes
set -U theme_nerd_fonts yes

# reference: https://gist.github.com/netmute/6761892
# make Vim the default editor
set --export EDITOR "nvim"
# make Vim usable with git
set --export GIT_EDITOR "nvim"

# make.py quit output
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

# codesonar
set --export CS_WORKING_DIR "$HOME/codesonar"
set --export CS_HUB_USER "fhof"
