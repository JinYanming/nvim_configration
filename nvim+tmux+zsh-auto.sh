#!/bin/bash
set -e
RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')
echo "${RED}clear enviroment${RESET}"

if [ -d ~/.zsh ];then
rm -rf ~/.zsh
mkdir ~/.zsh
fi
echo "${BLUE} neovim zsh tmux ctags installation start"
echo "${BLUE} installing neovim by Appimage${RESET}" 
if ! [ -f ./nvim.appimage ];then
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
fi
chmod u+x nvim.appimage
./nvim.appimage --appimage-extract
./squashfs-root/AppRun --version

if ! [ -d ~/bin/ ];then
mkdir ~/bin
fi

if [ -d ~/bin/squashfs-root/ ];then
rm -rf ~/bin/squashfs-root
fi

mv squashfs-root ~/bin/

if [ -f ~/bin/nvim ];then
rm ~/bin/nvim
fi

ln -s ~/bin/squashfs-root/AppRun ~/bin/nvim

echo "${GREEN} neovim is installed{RESET}"

pip3 install update
pip3 install --upgrade pip
pip3 install --upgrade setuptools
pip3 install --upgrade pip
pip3 install --upgrade distlib
pip3 install pynvim python-language-server pyls-mypy pyls-black jedi==0.17.2
echo "${GREEN} neovim zsh tmux ctags installation is completed${RESET}"
echo "${BLUE}install oh my zsh${RESET}"
rm -rf ~/.oh-my-zsh
echo y|sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "${GREEN} oh my zsh installation is completed${RESET}"
echo "${BLUE}make zsh default${RESET}" 
chsh -s `which zsh`

echo "${GREEN}  zsh  is set as default${RESET}"
echo "${BLUE}install vim-plug"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
cat ./init.vim > ~/.config/nvim/init.vim

echo "${GREEN} vim-plug installation is completed${RESET}"
echo "${BLUE}copying configration files"
rm -rf ~/.local/share/nvim
cp -rf ./nvim ~/.local/share
if [ -f ~/.zshrc ];then
rm ~/.zshrc
fi
if [ -f ~/.tmux.conf ];then
rm ~/.tmux.conf
fi
if [ -f ~/.config/nvim/coc-settings.json ];then
rm ~/.config/nvim/coc-settings.json
fi
cat ./.zshrc > ~/.zshrc
cat ./.tmux.conf > ~/.tmux.conf
cat ./coc-settings.json > ~/.config/nvim/coc-settings.json
echo "${GREEN} configration files copy is done ${RESET}"
echo "${BLUE}installing tmux plugins"
if [ -d ~/.tmux/plugins/tpm ];then
rm -rf ~/.tmux/plugins/tpm
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "${GREEN} tmux plugins installation is completed${RESET}"
if [ ! -d ~/.vim/tags ];then
mkdir -p ~/.vim/tags/
fi
echo "${BLUE}install fzf"
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo n|~/.fzf/install
echo "${GREEN} fzf installation is completed${RESET}"
echo "${BLUE}install zsh autosuggestions"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "${GREEN} zsh autosuggestions installation is completed${RESET}"
echo "${BLUE}install zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "${GREEN} zsh-syntax-highlighting installation is completed${RESET}"
echo "${BLUE}install lazy-git"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
echo "${GREEN} lazy-git is completed${RESET}"

echo "${GREEN}All steps is done!${RESET}"
