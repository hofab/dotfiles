# installing tmux settings
git clone https://github.com/samoshkin/tmux-config.git
./tmux-config/install.sh

symlink tmux.conf to folder
sudo ln -sf ~/dotfiles/tmux.conf  ~/.tmux/tmux.conf

Alacritty:
sudo ln -sf ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

VIM:
./config/nvim -> /home/fhof/dotfiles/vim

starship:
./config/starship.toml -> /home/fhof/dotfiles/starship.toml

i3:
~/.i3 -> /home/fhof/dotfiles/i3

which python3
let g:python3_host_prog = ''

tig:
git clone git://github.com/jonas/tig.git
make
make install

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

Tools:
ripgrep
exa
fd
entr
bat
bb
tig
watchexec-cli
gron
