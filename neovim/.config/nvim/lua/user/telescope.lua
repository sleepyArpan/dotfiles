local map = require('user.utils').map;

map('n', '<C-f>', ':Telescope find_files<CR>'); -- file search
map('n', '<C-p>', ':Telescope git_files<CR>'); -- file search
map('n', '<C-g>', ':Telescope live_grep<CR>'); -- project wide grep
map('n', '<C-b><C-b>', ':Telescope buffers<CR>'); -- buffer search

require('telescope').setup({
  defaults = {
    path_display={"truncate"},
    sorting_strategy="ascending", -- Best match is at top
    layout_strategy = 'vertical', -- Vertical layout for telescope window
    -- Disable file preview in setting and pass preview=true as an option with Telescope command
    prompt_prefix = "  ",
    selection_caret = " ",
    mappings = {
      i = {
        ["<C-j>"] = 'move_selection_next',
        ["<C-k>"] = 'move_selection_previous',
      },
      n = {
        ["<C-c>"] = 'close',
      },
    },
    dynamic_preview_title = true, -- Show selected file name on top of file preview window
  },
  pickers = {
    buffers = {
      mappings = {
        i = {
          ['<C-d>'] = 'delete_buffer'
        },
        n = {
          ['<C-d>'] = 'delete_buffer'
        }
      }
    },
  }
});
