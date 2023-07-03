require'nvim-treesitter.configs'.setup {
  -- List of parsers that are always installed
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "python" , "javascript", "typescript", "sql", "html", "bash", "dockerfile", "fish", "htmldjango", "json", "latex", "markdown", "yaml", "vue", "svelte" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
