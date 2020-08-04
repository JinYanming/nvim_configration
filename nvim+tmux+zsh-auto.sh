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
sudo rm -rf ~/.zsh
mkdir ~/.zsh
fi
echo "${BLUE} neovim zsh tmux ctags installation start"

sudo apt-get update
sudo apt-get install -y software-properties-common
#sudo apt-get install -y python-software-properties 
sudo apt-add-repository -y ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install -y neovim
sudo apt-get install -y python-neovim
sudo apt-get install -y python3-neovim
sudo apt-get install -y zsh
sudo apt-get install -y tmux
sudo apt-get install -y ctags
sudo apt-get install -y build-essential cmake python3-dev
sudo apt-get install -y git
sudo apt-get install -y python3-pip
sudo apt-get install -y python-pip
sudo apt-get install -y nodejs
sudo pip install pynvim python-language-server pyls-mypy pyls-black jedi
sudo pip3 install pynvim python-language-server pyls-mypy pyls-black jedi
echo "${GREEN} neovim zsh tmux ctags installation is completed${RESET}"
echo "${BLUE}install oh my zsh${RESET}"
sudo rm -rf ~/.oh-my-zsh
echo y|sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "${GREEN} oh my zsh installation is completed${RESET}"
echo "${BLUE}make zsh default${RESET}" 
sudo usermod -s /bin/zsh root
sudo usermod -s /bin/zsh $USER

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
sudo rm ~/.zshrc
fi
if [ -f ~/.tmux.conf ];then
sudo rm ~/.tmux.conf
fi
if [ -f ~/.config/nvim/coc-settings.json ];then
sudo rm ~/.config/nvim/coc-settings.json
fi
cat ./.zshrc > ~/.zshrc
cat ./.tmux.conf > ~/.tmux.conf
cat ./coc-settings.json > ~/.config/nvim/coc-settings.json
echo "${GREEN} configration files copy is done ${RESET}"
echo "${BLUE}installing tmux plugins"
if [ -d ~/.tmux/plugins/tpm ];then
sudo rm -r ~/.tmux/plugins/tpm
fi
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "${GREEN} tmux plugins installation is completed${RESET}"
if [ ! -d ~/.vim/tags ];then
mkdir -p ~/.vim/tags/
fi
echo "${BLUE}install fzf"
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
echo n|sudo ~/.fzf/install
echo "${GREEN} fzf installation is completed${RESET}"
echo "${BLUE}install zsh autosuggestions"
sudo git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "${GREEN} zsh autosuggestions installation is completed${RESET}"
echo "${BLUE}install zsh-syntax-highlighting"
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "${GREEN} zsh-syntax-highlighting installation is completed${RESET}"

echo "${RED}now generate ctags"
sudo ctags -R -f ~/.vim/tags/python3.ctags /usr/lib/python3.5/
sudo ctags -R -f ~/.vim/tags/python3-dp.ctags /usr/local/lib/python3.5/dist-packages
sudo ctags -R -f ~/.vim/tags/python3-sp.ctags ~/.local/lib/python3.5/site-packages
echo "${GREEN}ctags generating is over!${RESET}"
echo "${GREEN}All steps is done!${RESET}"
