vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'nvim-tree/nvim-web-devicons' }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.4' }
  use { 'rose-pine/neovim', as = 'rose-pine' }
  use { 'catppuccin/nvim', as = 'catpuccin' }
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
  use { 'folke/neodev.nvim', opts = {} }
  use { 'mfussenegger/nvim-dap' }
  use { 'rcarriga/nvim-dap-ui' }
  use { 'nvim-lualine/lualine.nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'nvim-neo-tree/neo-tree.nvim', branch = 'v3.x' }
  use { 'neovim/nvim-lspconfig' }   -- LSP principal
  use { 'williamboman/mason.nvim' } -- Gerenciador de servidores
  use { 'mason-org/mason-lspconfig.nvim' }
  use { 'nvimtools/none-ls.nvim' }
  use { 'hrsh7th/nvim-cmp' }         -- Autocompletion
  use { 'hrsh7th/cmp-nvim-lsp' }     -- Integra cmp com LSP
  use { 'L3MON4D3/LuaSnip' }         -- Snippets
  use { 'saadparwaiz1/cmp_luasnip' } -- Integra cmp com LuaSnip
  use { 'rafamadriz/friendly-snippets' }
  use { 'MunifTanjim/nui.nvim' }
  use { 'folke/todo-comments.nvim' } -- sudo apt-get install ripgrep
  use { 'lambdalisue/suda.vim' }
  use { 'stevearc/conform.nvim', }
  use {
    'mfussenegger/nvim-dap-python',
    ft = 'python',
    config = function(_, opts)
      local path = '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'
      require('dap-python').setup(path)
    end
  }
  use {
    'nvim-neotest/neotest',
    requires = {
      'nvim-neotest/nvim-nio',
      'antoinemadec/FixCursorHold.nvim',
      'sidlatau/neotest-dart',
      'rcasia/neotest-java'
    }
  }
  use {
    'akinsho/flutter-tools.nvim',
    requires = {
      'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
  }
  use {
    'nvim-java/nvim-java',
    requires = {
      'nvim-java/lua-async-await',
      'nvim-java/nvim-java-core',
      'nvim-java/nvim-java-test',
      'nvim-java/nvim-java-dap',
      'neovim/nvim-lspconfig',
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
  use({
    'jackMort/ChatGPT.nvim',
    requires = {
      'folke/trouble.nvim',
    }
  })
end)
