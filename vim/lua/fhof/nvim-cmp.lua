-- Setup nvim-cmp
local cmp = require('cmp')

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'

cmp.setup({
  completion = {
      autocomplete = true
  },
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
    "clangd-test",
    "clangd-12",
    "--background-index",
    },
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
    root_dir = require('lspconfig/util').root_pattern("compile_commands.json", "compile_flags.txt"),
    -- root_dir = function() return "/home/vivado/sfl/q8/libkvh" end,
    --     -- return lspconfig.util.root_pattern('compile_commands.json')(fname)
    --     -- print(dir_)
    --     -- dir_.gsub(dir_, "fhof", "vivado")
    --     -- return dir_
    -- end,
    -- root_dir = root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname
--  capabilities = capabilities,
--  root_dir = function() return "/home/fhof/kepler/c/pch_reliable_boot" end
    -- cwd = function(root_dir)
    --     return root_dir.gsub(root_dir, "fhof", "vivado")
    -- end,
    -- handlers = {
    -- ['textDocument/declaration'] = function(err, result, method, ...)
          -- local uri = result.uri or result.targetUri
          -- local fname = vim.uri_to_fname(uri)
          -- for _, item in pairs(result) do
              -- print("Uri: ", item.uri.gsub(item.uri, "vivado", "fhof"))
              -- item.uri = item.uri.gsub(item.uri, "vivado", "fhof")
          -- end
          -- for _, item in pairs(result) do
          --     print("Uri: ", item.uri)
          -- end
      -- don't include internal react definitions (react/index.d.ts)
      -- print("HERE!!!!")
      -- print("Testing: ", fname)
      -- if vim.tbl_islist(result) then
      --   local filter = function(v)
      --     return string.match(v.targetUri, '%.d.ts') == nil
      --   end
      --   result = vim.tbl_filter(filter, result)
      -- end
      -- jump to use the original implementation in handlers.lua
      -- vim.lsp.handlers['textDocument/declaration'](err, result, method, ...)
    -- end
    -- },
    before_init = function(params)
        params.processId = vim.NIL
    end,
}
