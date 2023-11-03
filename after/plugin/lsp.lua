local lsp_zero = require('lsp-zero')

lsp_zero.omnifunc.setup({
  autocomplete = true,
  use_fallback = true,
  update_on_delete = true,
  trigger = '<C-Space>',
  select_behavior = 'insert',
  mapping = {
    prev_item = '<S-TAB>',
    next_item = '<TAB>'
  }
})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr} )
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {'lua_ls', 'eslint', 'tsserver', 'rust_analyzer'},
  handlers = {
    lsp_zero.default_setup,
  },
})
