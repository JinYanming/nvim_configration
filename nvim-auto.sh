#!/bin/bash
echo "The program will automaticlly make the ctags needed/n"
sudo apt-get install ctags
if [ ! -d "~/.vim/tags" ];then
mkdir -p ~/.vim/tags/
fi
ctags -R -f ~/.vim/tags/python3.ctags /usr/lib/python3.5/
ctags -R -f ~/.vim/tags/python3-dp.ctags /usr/local/lib/python3.5/dist-packages
ctags -R -f ~/.vim/tags/python3-sp.ctags /home/jinyanming/.local/lib/python3.5/site-packages
