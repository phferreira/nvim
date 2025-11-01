require 'nvim-treesitter.configs'.setup {
  modules = {},
  ignore_install = {},
  ensure_installed = {
    'python',
    'javascript',
    'typescript',
    'dart',
    'c',
    'lua',
    'vim',
    'vimdoc',
    'query',
    'html',
    'sql',
    'yaml',
    'vim',
    'tsx',
    'regex',
    'json',
    'bash'
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    disable = function(_, bufnr) return vim.b[bufnr].large_buf end,
    additional_vim_regex_highlighting = false,
  },
  incremental_selection = {
    enable = true
  },
  indent = {
    enable = false
  },
  autotag = {
    enable = true,
    filetypes = {
      "html",
      "javascript",
      "typescript",
      "xml",
    },
  },
}
