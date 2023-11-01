vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = {'nvim-lua/plenary.nvim'}
  }
  use{ 'rose-pine/neovim', as = 'rose-pine' }
  use{ "catppuccin/nvim", as = "catpuccin" }
  use{ 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} }
  use{ 'nvim-treesitter/playground' }
  use{ 'mbbill/undotree' }
  use{ 'tpope/vim-fugitive' }
  use{ 'tpope/vim-surround' }
  use{ 'tpope/vim-obsession' }
  use{ 'dhruvasagar/vim-prosession' }
  use{ 'backdround/tabscope.nvim' }
  use{ 'lewis6991/gitsigns.nvim' }
  use{
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use { 'windwp/nvim-autopairs' }
  use{
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = { 
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  }
end)
