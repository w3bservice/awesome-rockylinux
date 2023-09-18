# This script only aims to have a clean installation of 
# Neovim boilerplate on a fresh Fedora, with all its prerequistres.


# Installing gcc (cause Fedoras doesent have it)
sudo yum -y install gcc

# And gcc for cpp cuz why not
yum install gcc-c++

# Installing neovim via AppImage
#### Deperecated version ####
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
# chmod u+x nvim.appimage
# ./nvim.appimage

# Installing python prerequistres
sudo dnf install -y python3-pip
sudo dnf install -y neovim python3-neovim

# NodeJS time
sudo dnf install -y nodejs

# Finally: golang
sudo dnf install -y go


# Installing neovim boilerplate (https://github.com/tokiory/neovim-boilerplate)
[ -d $HOME/.config/nvim ] && mv -vn $HOME/.config/{nvim,nvim.old}; \
    git clone https://github.com/tokiory/neovim-boilerplate $HOME/.config/nvim

# Letting Neovim installing its own dependencies:
nvim
