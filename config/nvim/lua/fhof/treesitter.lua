vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'cpp', 'c', 'python', 'markdown', 'sh', 'fish' },
    callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local lang = ft == 'sh' and 'bash' or ft
        vim.treesitter.start(args.buf, lang)
    end,
})

require('nvim-treesitter').install({
    'cpp', 'c', 'python', 'markdown', 'markdown_inline', 'bash', 'fish',
    'rust'
})
