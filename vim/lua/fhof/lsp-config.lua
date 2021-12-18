-- I couldn't figure out how to include this in lua/fhof/lsp.lua
-- ThePrimagen had it like that, but it does not work for me so I must make a mistake
require'lspconfig'.pyright.setup{}
require'lspconfig'.clangd.setup{}
