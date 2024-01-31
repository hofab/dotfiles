-- Setup nvim-cmp
local cmp = require('cmp')

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = {
	['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
	['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
	['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	['<Down>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
	['<Up>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-SPACE>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    -- { name = 'vsnip' }, -- For vsnip users.
    -- { name = 'luasnip' }, -- For luasnip users.
    { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
    { name = 'orgmode' },
  })
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- disable inline diagnostics
vim.diagnostic.disable()

-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require'lspconfig'.pyright.setup{
  capabilities = capabilities;
  root_dir = require('lspconfig/util').root_pattern(".gitignore"),
}
require'lspconfig'.clangd.setup{
    capabilities = capabilities;
    on_attach = on_attach;
    flags = {
        debounce_text_changes = 150,
    },
    cmd = {
    "docker",
    "exec",
    "-i",
    "buildq8",
    "clangd-12",
    "--background-index",
    },
    -- cmd = {
    --   "clangd",
    -- },
    settings = {
    cpp = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = 'openFilesOnly',
            },
        },
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    -- on_init = function to handle changing offsetEncoding
    root_dir = require('lspconfig/util').root_pattern("compile_commands.json", "compile_flags.txt", ".root"),
    before_init = function(params)
        params.processId = vim.NIL
    end,
}
