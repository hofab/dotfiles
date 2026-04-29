ln -sf ~/dotfiles/config/alacritty ~/.config/alacritty

ln -sf ~/dotfiles/config/tmux ~/.config/tmux
ln -sf ~/dotfiles/config/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/config/tmuxinator ~/.config/tmuxinator

ln -sf ~/dotfiles/config/fish ~/.config/fish

ln -sf ~/dotfiles/config/startship/starship.toml ~/.config/starship.toml

ln -sf ~/dotfiles/config/nvim ~/.config/nvim

ln -sf ~/dotfiles/config/rofi ~/.config/rofi

ln -sf ~/dotfiles/config/display ~/.config/display

ln -sf ~/dotfiles/config/eza ~/.config/eza

ln -sf ~/dotfiles/scripts/mount_network_drive.sh ~/.local/bin/

# setup python environment for nvim
curl -LsSf https://astral.sh/uv/install.sh | sh
source $HOME/.local/bin/env.fish
uv tool install --upgrade pynvim

# open neovim
:PlugInstall
:TSUpdate # if needed


