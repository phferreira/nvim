return {
  {
    "blink.cmp",
    -- se o nome do repositório for diferente, ajuste o primeiro campo para o id correto
    opts = {
      keymap = {
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
    },
  },
}
