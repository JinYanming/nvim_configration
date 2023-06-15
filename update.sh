
#!/bin/bash
set -e
RED=$(printf '\033[31m')
GREEN=$(printf '\033[32m')
YELLOW=$(printf '\033[33m')
BLUE=$(printf '\033[34m')
BOLD=$(printf '\033[1m')
RESET=$(printf '\033[m')


echo "${GREEN} building init.vim and relative dependencies ...${RESET}"
cat ./init.vim > ~/.config/nvim/init.vim
cat ./basic.vim > ~/.config/nvim/basic.vim
cat ./plug.vim > ~/.config/nvim/plug.vim
cat ./dap.vim > ~/.config/nvim/dap.vim
cat ./ui.vim > ~/.config/nvim/ui.vim
cat ./coc.vim > ~/.config/nvim/coc.vim
cat ./coc-settings.json > ~/.config/nvim/coc-settings.json
cat ./debugyy.py > ~/.config/nvim/debugyy.py
cat ./dap_config.lua > ~/.config/nvim/dap_config.lua
echo "${BLUE} Done${RESET}"

