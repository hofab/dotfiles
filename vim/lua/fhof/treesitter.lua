require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all" or a list of languages
  ignore_installed = {""}, -- List of parsers to ignore installing
  highlight = {
-- highlighting messed up cSeperator/cOperator
-- after some tinkering the ts defaults are still better
    -- enable = false,              -- false will disable the whole extension
    enable = true,              -- false will disable the whole extension
    use_languagetree = true,
--    disable = { "c" },  -- list of language that will be disabled
    custom_captures = {
-- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["**@operator**"] = "Identifier",
      ["@parent**"] = "Identifier",
    },
  },
  languages = {
      c = '// %s/',
      cpp = '// %s/',
  },
}
