sudo apt-key add /unsullied/sharefs/zhuxingyu/isilon-share/Nvim/ppa/neovim/gpg.key
echo "deb file:///unsullied/sharefs/zhuxingyu/isilon-share/Nvim/ppa/neovim xenial main " | sudo tee /etc/apt/sources.list.d/neovim.list
sudo apt update
sudo apt install -y neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
cp ./init.vim ~/.config/nvim

rm -rf ~/.local/share/nvim
cp -rf ./nvim ~/.local/share/
