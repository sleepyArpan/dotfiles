local keymap = require('user.utils').map;

require'nvim-tree'.setup {
  renderer = {
    indent_markers = {
     enable = true
   }
  },
  view = {
    width = 80,
    side = 'right',
    auto_resize = true
  }
}

-- autocmd to close nvim tree if its the last buffer remaining
vim.cmd [[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]]

keymap("n", "<leader>e", ":NvimTreeToggle<cr>")
keymap("n", "<leader>ff", ":NvimTreeFindFile<cr>")
