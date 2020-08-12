# installing tmux settings
git clone https://github.com/samoshkin/tmux-config.git
./tmux-config/install.sh

symlink tmux.conf to folder
sudo ln -sf ~/dotfiles/tmux.conf  ~/.tmux/tmux.conf

Alacritty:
sudo ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

VIM:
ln -sf ~/dotfiles/vim/config/fhof_ll_cs.vim ~/.config/nvim/plugged/lightline.vim/autoload/lightline/colorscheme/fhof_ll_cs.vim
ln -sf ~/dotfiles/vim/UltiSnips ~/.config/nvim/UltiSnips
ln -sf ~/dotfiles/vim/config ~/.config/nvim/config
ln -sf ~/dotfiles/vim/colors ~/.config/nvim/colors

ccls:
brew install node ccls
apt-get install yarn
set PATH $PATH /home/linuxbrew/.linuxbrew/bin
See: https://github.com/MaskRay/ccls/wiki/coc.nvim

fish:
rm -rf ~/.config/fish
sudo ln -sf ~/dotfiles/fish ~/.config/fish
fish
pip install virtualfish
curl -L https://get.oh-my.fish | fish
omf install bobthefish
omf install z
# set path
set PATH $PATH ~/XYZ
# change default shell
chsh -s /usr/bin/fish

