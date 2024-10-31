vim.cmd([[
  filetype plugin indent on
  syntax on
]])

-- sudo apt-get install xclip
vim.opt.clipboard = 'unnamedplus'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.enc = 'utf-8'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.splitbelow = true
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.nvim/undo')
vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 100
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.showmatch = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.wrap = false
vim.opt.exrc = true
--vim.opt.nocompatible=true
--vim.opt.termwinsize=15x0
--vim.opt.t_co=256
