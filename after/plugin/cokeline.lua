local get_hex = require('cokeline.hlgroups').get_hl_attr

local map = vim.api.nvim_set_keymap

map("n", "<M-Left>", "<Plug>(cokeline-focus-prev)", { silent = true })
map("n", "<M-Right>", "<Plug>(cokeline-focus-next)", { silent = true })
map("n", "<M-S-Left>", "<Plug>(cokeline-switch-prev)", { silent = true })
map("n", "<M-S-Right>", "<Plug>(cokeline-switch-next)", { silent = true })

--for i = 1, 9 do
--  map(
--    "n",
--    ("<F%s>"):format(i),
--    ("<Plug>(cokeline-focus-%s)"):format(i),
--    { silent = true }
--  )
--  map(
--    "n",
--    ("<Leader>%s"):format(i),
--    ("<Plug>(cokeline-switch-%s)"):format(i),
--    { silent = true }
--  )
--end

require('cokeline').setup({
  default_hl = {
    fg = function(buffer)
      return
        buffer.is_focused
        and get_hex('ColorColumn', 'bg')
         or get_hex('Normal', 'fg')
    end,
    bg = function(buffer)
      return
        buffer.is_focused
        and get_hex('Normal', 'fg')
         or get_hex('ColorColumn', 'bg')
    end,
  },

  components = {
    {
      text = function(buffer) return ' ' .. buffer.devicon.icon end,
      fg = function(buffer) return buffer.devicon.color end,
    },
    {
      text = function(buffer) return buffer.unique_prefix end,
      fg = get_hex('Comment', 'fg'),
      italic = true
    },
    {
      text = function(buffer) return buffer.filename .. ' ' end,
      underline = function(buffer)
        return buffer.is_hovered and not buffer.is_focused
      end
    },
    {
      text = '',
      on_click = function(_, _, _, _, buffer)
        buffer:delete()
      end
    },
    {
      text = ' ',
    }
  },
})
