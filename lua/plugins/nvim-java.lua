return {
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/lua-async",
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "neovim/nvim-lspconfig",
      "mfussenegger/nvim-dap",
    },
    config = function()
      require("java").setup({
        jdk = {
          auto_install = false,
          path = os.getenv("HOME") .. "/.sdkman/candidates/java/current",
        },
      })
      require("lspconfig").jdtls.setup({})
    end,
  },
}

