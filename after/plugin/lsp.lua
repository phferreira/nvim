local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr} )
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'eslint',
    'tsserver',
    'rust_analyzer',
    'yamlls',
    'vimls',
    'dockerls',
    'jsonls',
    'sqlls'
  --  'xmlformatter'
  },

  handlers = {
    lsp_zero.default_setup,
  },
})
