# A Setup Guide FOR NEOVIM / TMUX

by Xingyu Zhu  -  email: <zhuxingyu@megvii.com>

## A Rapid Installation Mode

Clone this repo:
```sh
git clone git@git-core.megvii-inc.com:zhuxingyu/nvim-config.git
```

Make sure that you can reach /unsullied/sharefs/zhuxingyu/isilon-share

If you can't, mail to [zhuxingyu@megvii.com](mailto:zhuxingyu@megvii.com)

1.Quick installation
```sh
cd nvim-config
export all_proxy=http://proxy.i.brainpp.cn:3128 no_proxy=.brainpp.cn,.brainpp.ml,.megvii-inc.com,.megvii-op.org,127.0.0.1,localhost; export http_proxy=$all_proxy https_proxy=$all_proxy
bash Nvim-install.sh
```

2.Open nvim, and
```sh
:PlugInstall
```

And it would be all done~

## Installing and Setting up Neovim in Traditional Way.

### Download
[init.vim](https://git-core.megvii-inc.com/zhuxingyu/nvim-config/blob/master/init.vim) from git: https://git-core.megvii-inc.com/zhuxingyu/nvim-config/blob/master/init.vim. The 'init.vim' mentioned later means this file.

### Install
1.Connect to public servers, and try this command once meeting errors occuring in other steps.
```sh
export all_proxy=http://proxy.i.brainpp.cn:3128 no_proxy=.brainpp.cn,.brainpp.ml,.megvii-inc.com,.megvii-op.org,127.0.0.1,localhost; export http_proxy=$all_proxy https_proxy=$all_proxy
```
2.Update apt-get by running
```sh
sudo apt-get update
```

3.Run the following Commands to install supporting packages.
```sh
sudo apt-get install software-properties-common
sudo pip3 install neovim
```

4.Start installing neovim.
```sh
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

5.Install Vim-Plug
```sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

6.Setting up initialize environment.
```sh
mkdir -p ~/.config/nvim
mv ./init.vim ~/.config/nvim
```

7.Now Open Neovim by typing 'nvim' in console.
In Neovim, Run
```sh
:PlugInstall
```

You should see something like this:
Wait for the Installing process to be complete.

<img src="https://raw.githubusercontent.com/junegunn/i/master/vim-plug/installer.gif" height="450">

### If you want to replace 'vim' / 'vi' command to open neovim, run the following commands
```sh
sudo update-alternatives --install /usr/bin/vi vi /usr/bin/nvim 60
sudo update-alternatives --config vi
sudo update-alternatives --install /usr/bin/vim vim /usr/bin/nvim 60
sudo update-alternatives --config vim
sudo update-alternatives --install /usr/bin/editor editor /usr/bin/nvim 60
sudo update-alternatives --config editor
```

## Usage Instructions:

- 'Ctrl + h': Open [NerdTree](https://github.com/scrooloose/nerdtree).
- '/something': Search and rapid movements using [Easymotion](https://github.com/easymotion/vim-easymotion).
- '\cc' & '\cu' Comment & Uncomment in Visual Mode (while selecting multiple lines) using [NerdCommenter](https://github.com/scrooloose/nerdcommenter).
- Auto Complete Initialized automatically using [nvim-completion-manager](https://github.com/roxma/nvim-completion-manager). Can be disabled in init.vim (line 53)

```sh
Plug 'roxma/nvim-completion-manager'
```

## Tmux Optimization

If you want to make tmux looks nicer (e.g. like this)

<img src='https://cloud.githubusercontent.com/assets/553208/19740585/85596a5a-9bbf-11e6-8aa1-7c8d9829c008.gif' height="450">

### Run the following commands outside of tmux.
```sh
cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .
```
