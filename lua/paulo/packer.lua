vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.4',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { "catppuccin/nvim", as = "catpuccin" }
  use { 'nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' } }
  use { 'nvim-treesitter/playground' }
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-obsession' }

  use { 'tpope/vim-dadbod' }
  use { 'kristijanhusak/vim-dadbod-ui' }
  use { 'kristijanhusak/vim-dadbod-completion' }
  use { 'oysandvik94/curl.nvim' }
  use { 'dhruvasagar/vim-prosession' }
  use { 'backdround/tabscope.nvim' }
  use { 'lewis6991/gitsigns.nvim' }
  use { 'aznhe21/actions-preview.nvim' }
  use { "folke/neodev.nvim", opts = {} }
  use { "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } }
  use {
    "mfussenegger/nvim-dap-python",
    requires = {
      "mfussenegger/nvim-dap"
    },
    ft = 'python',
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require('dap-python').setup(path)
    end
  }
  use {
    "nvim-neotest/neotest",
    requires = {
      'nvim-neotest/nvim-nio',
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      'sidlatau/neotest-dart',
      'rcasia/neotest-java'
    }
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use { 'windwp/nvim-autopairs' }
  use {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
  }
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'stevearc/dressing.nvim', -- optional for vim.ui.select
      'mfussenegger/nvim-dap',
    },
  }
  use { "neovim/nvim-lspconfig" }   -- LSP principal
  use { "williamboman/mason.nvim" } -- Gerenciador de servidores
  use { 'mason-org/mason-lspconfig.nvim' }
  use { "nvimtools/none-ls.nvim" }
  use { "hrsh7th/nvim-cmp" }         -- Autocompletion
  use { "hrsh7th/cmp-nvim-lsp" }     -- Integra cmp com LSP
  use { "L3MON4D3/LuaSnip" }         -- Snippets
  use { "saadparwaiz1/cmp_luasnip" } -- Integra cmp com LuaSnip
  use { 'rafamadriz/friendly-snippets' }
  use {
    -- sudo apt-get install ripgrep
    "folke/todo-comments.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      'nvim-tree/nvim-web-devicons'
    }
  }
  use 'lambdalisue/suda.vim'
  use {
    'nvim-java/nvim-java',
    requires = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'MunifTanjim/nui.nvim',
      'neovim/nvim-lspconfig',
      'mfussenegger/nvim-dap',
      {
        'mason-org/mason.nvim', branch = 'main',
        opts = {
          registries = {
            'github:nvim-java/mason-registry',
            'github:mason-org/mason-registry',
          },
        },
      }
    },
  }
  use{ "stevearc/conform.nvim", }
  use({
    "jackMort/ChatGPT.nvim",
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "folke/trouble.nvim",
      "nvim-telescope/telescope.nvim"
    }
  })
end)
