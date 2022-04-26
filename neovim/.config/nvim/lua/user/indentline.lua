local blankline = require('indent_blankline');

blankline.setup({
  char = '▏',
  space_char = ' ',
  buftype_exclude = {'nofile', 'help'},
  show_end_of_line = true,
})
