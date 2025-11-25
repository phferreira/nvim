return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "antoinemadec/FixCursorHold.nvim",
    "sidlatau/neotest-dart",
    "rcasia/neotest-java",
  },
  config = function()
    local neotest = require("neotest")

    neotest.setup({
      adapters = {
        require("neotest-java")({
          command = "java",
          use_lsp = true,
        }),
        require("neotest-dart")({
          command = "fvm flutter",
          use_lsp = true,
        }),
      },
    })
  end,
}
