return {
  "mason-org/mason.nvim",
  branch = "main",
  opts = {
    ensure_installed = {
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
    },
  },
}
