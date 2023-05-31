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


lua <<EOF


-- nvim-dap configration
vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
vim.keymap.set({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)




-- dap ui configrarion
local dap, dapui = require("dap"), require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

--    require("dapui").open()
--    require("dapui").close()
--    require("dapui").toggle()

EOF


