" 启用 nvim-dap-ui 插件
let g:nvim_dap_ui_enable = 1

" 设置窗口位置
let g:nvim_dap_ui_position = 'right'

" 设置窗口宽度
let g:nvim_dap_ui_width = 40

" 设置 nvim-dap-ui 窗口的高度
let g:nvim_dap_ui_height = 10

" 设置 nvim-dap-ui 窗口的字体大小
let g:nvim_dap_ui_fontsize = 10

" 设置 nvim-dap-ui 窗口的字体
let g:nvim_dap_ui_font = 'FiraCode Nerd Font Mono'

" 设置 nvim-dap-ui 窗口的背景色
let g:nvim_dap_ui_custom_colors = {
      \ 'background': ['#2e3440', 'Normal'],
      \ 'foreground': ['#d8dee9', 'Normal'],
      \ 'border': ['#3b4252', 'Normal'],
      \ 'ui': ['#3b4252', 'Normal'],
      \ 'currentLine': ['#434c5e', 'Normal'],
      \ 'selection': ['#4c566a', 'Visual'],
      \ 'lineNumber': ['#4c566a', 'NonText'],
      \ 'breakpoint': ['#bf616a', 'Identifier'],
      \ 'breakpointDisabled': ['#4c566a', 'Identifier'],
      \ 'breakpointCurrent': ['#ebcb8b', 'Identifier'],
      \ 'expression': ['#88c0d0', 'Identifier'],
      \ 'variable': ['#d8dee9', 'Identifier'],
      \ 'value': ['#a3be8c', 'Identifier'],
      \ 'errorMessage': ['#bf616a', 'Identifier'],
      \ 'source': ['#b48ead', 'Identifier'],
      \ }











" Python debugger
lua require('dap-python').setup('~/.virtualenvs/debugpy/bin/python3')

let g:dap_python = 'python3'
let g:dap_python_launcher = {
    \ 'command': 'python3',
    \ 'args': ['-m', 'debugpy', '--listen', 'localhost:5678'],
    \ }
let g:dap_python_term = 'xterm'
let g:dap_python_repl = 'ptpython'
let g:dap_python_test_runner = 'pytest'
let g:dap_python_use_visuals = v:true
nnoremap <leader>py :r ~/.config/nvim/debugyy.py<CR>zz


luafile ~/.config/nvim/dap_config.lua
