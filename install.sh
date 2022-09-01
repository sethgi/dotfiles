# TODO: This is a bit sus since it forcibly creates hard links everywhere. But, it works. 

#---- Arch + i3 as DE config ----# 

# i3 config
sudo ln -f i3/config ~/.config/i3/config

# ROFI
sudo ln -f rofi/config.rasi ~/.config/rofi/config.rasi

# Polybar
sudo ln -f polybar/config.ini ~/.config/polybar/config.ini
mkdir -p ~/.config/polybar/scripts/modules
sudo ln -f polybar/scripts/modules/battery.sh ~/.config/polybar/scripts/modules/battery.sh
sudo ln -f polybar/scripts/launch_polybar.sh ~/.config/polybar/scripts/launch_polybar.sh

# Xresources 
sudo ln -f Xresources ~/.Xresources

# Misc scripts
mkdir ~/.config/scripts
sudo ln -f scripts/increase_brightness.sh ~/.config/scripts/increase_brightness.sh
sudo ln -f scripts/decrease_brightness.sh ~/.config/scripts/decrease_brightness.sh

# Texmaker
mkdir ~/.config/texmaker
sudo ln -f texmaker/config.ini ~/.config/texmaker/config.ini

# Vim and nvim
mkdir ~/.config/nvim
sudo ln -f nvim/init.vim ~/.config/nvim/init.vim
sudo ln -f vim/vimrc ~/.vimrc

# Latex styles
mkdir -p texmf/tex/latex
sudo ln -f latex/betterpsets.cls texmf/tex/latex
sudo ln -f latex/hmcpset.cls texmf/tex/latex

# TODO: pacman package list, etc
