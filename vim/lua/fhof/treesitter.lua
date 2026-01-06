vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'cpp', 'c', 'python', 'markdown', 'bash', 'fish' },
    callback = function()
        vim.treesitter.start()
        -- Treesitter folding
        -- vim.wo.foldmethod = 'expr'
        -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

        -- Treesitter indentation
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

