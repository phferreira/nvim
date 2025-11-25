return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  config = function()
    require("dap-python").setup(vim.fn.expand("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"))
  end,
}

