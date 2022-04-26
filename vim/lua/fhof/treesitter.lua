require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    use_languagetree = true,
--    disable = { "c" },  -- list of language that will be disabled
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["**@operator**"] = "Identifier",
      ["@parent**"] = "Identifier",
    },
  },
  context_commentstring = {
    enable = true,
    config = {
      c = {
        __default = '// %s',
        comment = '// %s'
      }
    }
  },
}
