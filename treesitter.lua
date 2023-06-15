
require('nvim-treesitter.configs').setup({                                               
    -- 支持的语言
    ensure_installed = "all",
    -- 启用代码高亮
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    --启用增量选择
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            node_incremental = '<CR>',
            node_decremental = '<BS>',
            scope_incremental = '<TAB>'
        }
    },
    -- 启用基于 Treesitter 的代码格式化(=)
    indent = {
        enable = true
    },
})
-- 开启代码折叠
vim.wo.foldmethod = 'expr'
vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'
-- 默认不折叠
vim.wo.foldlevel = 99
