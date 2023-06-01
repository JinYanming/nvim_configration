call plug#begin('~/.vim/plugged')
"plug configration <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" Make sure you use single quotes
" colorschemes
Plug 'tomasr/molokai'
Plug 'majutsushi/tagbar'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'tpope/vim-fireplace', { 'for': 'clojure' }


Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" show git branch in vim
Plug 'tpope/vim-fugitive'
" show err info
Plug 'tpope/vim-dispatch'










Plug 'altercation/vim-colors-solarized'
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

"helpers
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'easymotion/vim-easymotion'
Plug 'f-person/git-blame.nvim'

Plug '~/my-prototype-plugin'
Plug 'https://github.com/vim-scripts/taglist.vim.git'
" UI Plugin
Plug 'roxma/nvim-yarp'
Plug 'kien/ctrlp.vim'
Plug 'hdima/python-syntax'
Plug 'vim-syntastic/syntastic'
Plug 'rhysd/nyaovim-popup-tooltip'
Plug 'kdheepak/lazygit.nvim'
Plug 'ianding1/leetcode.vim'
Plug 'kshenoy/vim-signature'
Plug 'mfussenegger/nvim-dap'
Plug 'mfussenegger/nvim-dap-python'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate :TSInstall python'}

Plug 'folke/neodev.nvim'
Plug 'rcarriga/nvim-dap-ui'

" UI Plugin
"auto completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Initialize plugin system>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
call plug#end()



"    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    " CTags的设定  
"    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    let Tlist_Sort_Type = "name"    " 按照名称排序  
"    let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
"    let Tlist_Compart_Format = 1    " 压缩方式  
"    let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  
"    ""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
"    ""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"    let Tlist_Show_One_File=1            "不同时显示多个文件的tag，只显示当前文件的
"    "设置tags  
"    set tags=tags;  
"    set tags+=$HOME/.vim/tags/python3.ctags
"    set tags+=$HOME/.vim/tags/python3-dp.ctags
"    set tags+=$HOME/.vim/tags/python3-sp.ctags
"    "其他东东
"    """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    "默认打开Taglist 
"    let Tlist_Auto_Open=0 
"    """""""""""""""""""""""""""""" 
"    " Tag list (ctags) 
"    """""""""""""""""""""""""""""""" 
"    let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 
"    let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
"    let Tlist_File_Fold_Auto_Close = 1
"    let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
"    let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
"    let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"    " minibufexpl插件的一般设置
"    let g:miniBufExplMapWindowNavVim = 1
"    let g:miniBufExplMapWindowNavArrows = 1
"    let g:miniBufExplMapCTabSwitchBufs = 1
"    let g:miniBufExplModSelTarget = 1  
"    nmap tl :Tlist<cr>




" TagbarToggle Setup<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
nmap <F8> :TagbarToggle<CR>
" end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

" Nerd Tree Setup<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" map <C-h> :NERDTreeToggle<CR>
"当打开vim且没有文件时自动打开NERDTree
"autocmd vimenter * NERDTree
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"列出当前目录文件  
" map <F3> :NERDTreeToggle<CR>
" imap <F3> <ESC> :NERDTreeToggle<CR>
"打开树状文件目录  
" map <C-F3> \be  
" Nerd Tree Setup end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>


"easymotion configration<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
"easymotion configration end>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

"lazygit configration startup<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" option + g
nnoremap <silent><nowait> <M-g>  :<C-u>LazyGit<cr>

"FZF configration startup<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" FZF quick search file
nnoremap <silent><nowait> <space>f  :<C-u>FZF<cr>
" open list of recent files
nnoremap <silent><nowait> <space>r  :<C-u>History<cr>

"auto-pairs configration startup<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
" auto-pairs default disable
let b:autopairs_enabled = 0

"git-blame configration startup<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
let g:gitblame_enabled = 0

"syntax configration startup<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers=['pylint']
let python_highlight_all = 1
let OPTION_NAME = 1

"ctrlp configration startup<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'<Paste>
let g:ctrlp_working_path_mode = 'ra'

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#input#enabled = 1
let g:airline#extensions#input#indicator_text = '中'

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline#extensions#tabline#show_tab_count = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_vim_statusline = 1
let g:airline#extensions#tabline#show_error = 1

let g:airline_filetype_overrides = {
  \ 'coc-explorer':  [ 'CoC Explorer', '' ],
  \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
  \ 'fugitive': ['fugitive', '%{airline#util#wrap(airline#extensions#branch#get_head(),80)}'],
  \ 'floggraph':  [ 'Flog', '%{get(b:, "flog_status_summary", "")}' ],
  \ 'gundo': [ 'Gundo', '' ],
  \ 'help':  [ 'Help', '%f' ],
  \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
  \ 'startify': [ 'startify', '' ],
  \ 'vim-plug': [ 'Plugins', '' ],
  \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
  \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
  \ 'vaffle' : [ 'Vaffle', '%{b:vaffle.dir}' ],
  \ }


