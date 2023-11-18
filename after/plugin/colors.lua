function ColorMyPencils(color)
  color = color or 'rose-pine'
  vim.cmd.colorscheme(color)

  vim.cmd('hi DiffAdd    gui=NONE      guifg=#000000 guibg=#3E50D8')
  vim.cmd('hi DiffChange gui=NONE      guifg=#135B04 guibg=#51D137')
  vim.cmd('hi DiffDelete gui=NONE      guifg=#000000 guibg=#f25757')
  vim.cmd('hi DiffText   gui=NONE      guifg=#000000 guibg=#B9F1AD')
end

ColorMyPencils('catppuccin')
