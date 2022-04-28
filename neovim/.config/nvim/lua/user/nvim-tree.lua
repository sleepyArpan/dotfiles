local keymap = require("user.utils").map

require("nvim-tree").setup({
  hijack_cursor = true,
  renderer = {
    indent_markers = {
      enable = true,
    },
  },
  view = {
    width = 80,
    side = "right",
  },
  filters = {
    dotfiles = false,
    custom = { ".git", "node_modules", ".cache", "language-servers", ".undo_history" },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
})

-- autocmd to close nvim tree if its the last buffer remaining
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

keymap("n", "<leader>e", ":NvimTreeToggle<cr>")
keymap("n", "<leader>ff", ":NvimTreeFindFile<cr>")
