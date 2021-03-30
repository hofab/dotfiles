" I couldn't figure out how to include this in lua/fhof/lsp.lua
" ThePrimagen had it like that, but it does not work for me so I must make a mistake
lua << EOF
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup
{
    on_attach=require'completion'.on_attach
}
require'lspconfig'.ccls.setup
{
    on_attach=require'completion'.on_attach
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = false,
     -- Enable virtual text, override spacing to 4
     virtual_text = {
       spacing = 4,
     },
    -- This is similar to:
    -- let g:diagnostic_show_sign = 1
    -- To configure sign display,
    --  see: ":help vim.lsp.diagnostic.set_signs()"
    signs = true,

    -- This is similar to:
    -- "let g:diagnostic_insert_delay = 1"
    update_in_insert = false,
  }
)
EOF
