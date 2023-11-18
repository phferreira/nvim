local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr} )
end)

lsp_zero.format_on_save({
  format_opts = {
    async = false,
    timeout_ms = 10000,
  },
  servers = {
    ['tsserver'] = {'javascript', 'typescript'},
    ['rust_analyzer'] = {'rust'},
    ['dartls'] = {'dart'}
  }
})

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
