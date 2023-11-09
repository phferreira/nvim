 require'nvim-treesitter.configs'.setup {
  ensure_installed = {
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
    enable_autocmd= false
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = false,
    disable = function (_, bufnr) return vim.b[bufnr].large_buf end,
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
