#!/bin/bash
set -e
RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')
echo "${RED}clear enviroment${RESET}"

if [ -d "~/.zsh" ];then
sudo rm -rf ~/.zsh
mkdir ~/.zsh
fi
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-software-properties 
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt update
sudo apt-get install -y neovim
sudo apt-get install -y zsh
sudo apt-get install -y tmux
echo "${BLUE}install oh my zsh${RESET}"
sudo rm -rf ~/.oh-my-zsh
echo y|sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "${BLUE}make zsh default${RESET}" 

chsh -s /bin/zsh root
chsh -s /bin/zsh


echo "${BLUE}install vim-plug${RESET}"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim

rm -rf ~/.local/share/nvim
cp -rf ./nvim ~/.local/share
echo "${YELLOW}The program will automaticlly make the ctags needed/n${RESET}"
sudo apt-get install ctags
if [-d "~/.zshrc"];then
rm ~/.zshrc
fi
if [-d "~/.tmux.conf"];then
rm ~/.tmux.conf
fi
sudo cp ./.zshrc ~/
sudo cp ./.tmux.conf ~/
if [ ! -d "~/.vim/tags" ];then
mkdir -p ~/.vim/tags/
fi
ehco "${BLUE}install fzf${RESET}"
sudo git clone --depth 1 https://github.com/junegunn/fzf.git ~${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf
~/.zsh/.fzf/install
echo "${BLUE}install zsh autosuggestions${RESET}"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "${BLUE}install zsh-syntax-highlighting${RESET}"
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "${RED}install over${RESET}"
source ~/.zshrc
ctags -R -f ~/.vim/tags/python3.ctags /usr/lib/python3.5/
ctags -R -f ~/.vim/tags/python3-dp.ctags /usr/local/lib/python3.5/dist-packages
ctags -R -f ~/.vim/tags/python3-sp.ctags /home/jinyanming/.local/lib/python3.5/site-packages
echo "${GREEN}All steps is done!${RESET}"
