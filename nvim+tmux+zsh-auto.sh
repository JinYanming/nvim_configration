#!/bin/bash

sudo apt-key add /unsullied/sharefs/zhuxingyu/isilon-share/Nvim/ppa/neovim/gpg.key
echo "deb file:///unsullied/sharefs/zhuxingyu/isilon-share/Nvim/ppa/neovim xenial main " | sudo tee /etc/apt/sources.list.d/neovim.list
sudo apt update
sudo apt install -y neovim
sudo apt-get install -y zsh
sudo apt-get install -y tmux
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim

rm -rf ~/.local/share/nvim
cp -rf ./nvim ~/.local/share/
echo "The program will automaticlly make the ctags needed/n"
sudo apt-get install ctags
cp ./.zshrc ~/.zshrc
cp ./.tmux.conf ~/.tmux.conf
if [ ! -d "~/.vim/tags" ];then
mkdir -p ~/.vim/tags/
fi
source ~/.zshrc
ctags -R -f ~/.vim/tags/python3.ctags /usr/lib/python3.5/
ctags -R -f ~/.vim/tags/python3-dp.ctags /usr/local/lib/python3.5/dist-packages
ctags -R -f ~/.vim/tags/python3-sp.ctags /home/jinyanming/.local/lib/python3.5/site-packages
