#### by 金焰明(JinYanming)
#### email me if there is any problems:1535640262@qq.com
#### I will keep the maintenance work and update Irregularly
#### This project integrates neovim tmux zsh and some very useful plugs of them including COC-Nvim FZF auto pairs nerdtree ncm2 and so on.
#### The installation is quite easy as you do as the follow steps.
## A Rapid Installation Mode

1.Clone this repo:
```sh
git clone https://github.com/JinYanming/nvim_configration.git
```


2.Quick installation
```sh
cd nvim_configration
bash ./neovim_install.sh
bash nvim+tmux+zsh-auto.sh
bash ./virtualenv_debuggy.sh
```

3.Open nvim, and wait for the coc auto-installation complete,after that type:
```sh
:PlugInstall
:MasonInstall codelldb
```
4.open tmux and:
```
~/.tmux/plugins/tpm/bin/install_plugins
```

5.install nerd fonts in you local machine!!!(not on servers,do the below operation on you local machine)
```
git clone https://github.com/ryanoasis/nerd-fonts.git
cd fonts
./install.sh
```
Settings: terminal > preference > fons modified as  ：any kind of Nerd fonts。
（**注意：是在本地终端修改和安装字体**)  
After all the four steps above finished,Please exit your server and reconnect your servers.  
Tools including nvim zsh tmux and several needed plugs will be installed automaticly  
The rest thing you have to do is to use it and work on it.  


some important Keys usage:

### Debug keymapping
<F5>        continue()
<F10>       step_over()
<F11>       step_into()
<F12>       step_out()
<Leader>b   toggle_breakpoint()
<Leader>B   set_breakpoint()
<Leader>lp  set_breakpoint
<Leader>dr  repl.open()
<Leader>dl  run_last()
<Leader>dc  run_to_cursor()
<Leader>dh  hover
<Leader>dp  preview()
<Leader>df  centered_float (widgets.frames)
<Leader>ds  centered_float(widgets.scopes)

### common keymapping

#### NVIM
```
<leader> key is tab
<F3> open file tree
<F8> open function tree
/  quick search

<space>f        fuzzy search files
<space>r        fuzzy search recent files
<ALT>s          open/close: autoshow signature/doc while hovering functions or varaiables
<ALT>g          lazy git
```
#### Terminal/Shell
```
Ctrl + R        recent history commands
```








