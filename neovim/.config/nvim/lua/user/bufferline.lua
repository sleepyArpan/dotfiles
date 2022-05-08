local keymap = require("user.utils").map

vim.g.bufferline = {
  closable = false,
  animation = false,
}

-- Navigate buffers
-- Move to previous/next
keymap("n", "<C-b>h", ":BufferPrevious<CR>")
keymap("n", "<C-b>l", ":BufferNext<CR>")
-- Re-order to previous/next
keymap("n", "<C-b><", ":BufferMovePrevious<CR>")
keymap("n", "<C-b>>", " :BufferMoveNext<CR>")
-- Goto buffer in position...
keymap("n", "<C-b>1", ":BufferGoto 1<CR>")
keymap("n", "<C-b>2", ":BufferGoto 2<CR>")
keymap("n", "<C-b>3", ":BufferGoto 3<CR>")
keymap("n", "<C-b>4", ":BufferGoto 4<CR>")
keymap("n", "<C-b>5", ":BufferGoto 5<CR>")
keymap("n", "<C-b>6", ":BufferGoto 6<CR>")
keymap("n", "<C-b>7", ":BufferGoto 7<CR>")
keymap("n", "<C-b>8", ":BufferGoto 8<CR>")
keymap("n", "<C-b>9", ":BufferGoto 9<CR>")
keymap("n", "<C-b>0", ":BufferLast<CR>")
-- Close buffer
keymap("n", "<C-b>c", ":BufferClose<CR>")
keymap("n", "<C-b>m", ":BufferCloseAllButCurrent<CR>")
