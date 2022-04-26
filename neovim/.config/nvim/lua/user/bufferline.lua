local keymap = require('user.utils').map;

vim.g.bufferline = {
  closable = false,
  animation = false,
}

-- Navigate buffers
-- Move to previous/next
keymap('n', '<A-,>', ':BufferPrevious<CR>')
keymap('n', '<A-.>', ':BufferNext<CR>')
-- Re-order to previous/next
keymap('n', '<A-<>', ':BufferMovePrevious<CR>')
keymap('n', '<A->>', ' :BufferMoveNext<CR>')
-- Goto buffer in position...
keymap('n', '<A-1>', ':BufferGoto 1<CR>')
keymap('n', '<A-2>', ':BufferGoto 2<CR>')
keymap('n', '<A-3>', ':BufferGoto 3<CR>')
keymap('n', '<A-4>', ':BufferGoto 4<CR>')
keymap('n', '<A-5>', ':BufferGoto 5<CR>')
keymap('n', '<A-6>', ':BufferGoto 6<CR>')
keymap('n', '<A-7>', ':BufferGoto 7<CR>')
keymap('n', '<A-8>', ':BufferGoto 8<CR>')
keymap('n', '<A-9>', ':BufferGoto 9<CR>')
keymap('n', '<A-0>', ':BufferLast<CR>')
-- Close buffer
keymap('n', '<A-c>', ':BufferClose<CR>')
keymap('n', '<A-m>', ':BufferCloseAllButCurrent<CR>')
