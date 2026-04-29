return {
  "nacro90/omen.nvim",
  requires = {
    "nvim-lua/telescope.nvim",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("omen").setup({
      picker = "telescope", --- Picker type
      title = "Omen", --- Title to be displayed on the picker
      store = vim.env.HOME .. "/.password-store/", --- Password store directory
      passphrase_prompt = "Passphrase: ", --- Prompt when asking the passphrase
      register = "+", --- Which register to fill after decoding a password
      retention = 45, --- How much seconds the life of the decoded passwords in the register
      ignored = { --- Ignored directories or files that are not to be listed in picker
        ".git",
        ".gitattributes",
        ".gpg-id",
        ".stversions",
        "Recycle Bin",
      },
      use_default_keymaps = true, --- Whether display info messages or not
    })
  end,
}
