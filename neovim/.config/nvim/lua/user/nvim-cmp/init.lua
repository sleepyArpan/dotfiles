local cmp = require('cmp');
local utils = require('user.nvim-cmp.utils');

cmp.setup({
  completion = {
    -- For auto-selecting the first item in the menu
    completeopt = 'menu,menuone,noselect',
  },
  sources = {
    -- List of all the sources to be used by nvim-cmp
    -- See the requires list for nvim-cmp in plugins/init.lua
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'path' },
    { name = 'buffer', keyword_length = 3},
  },
  snippet = {
    expand = utils.luasnip_expand,
  },
  -- Formatting completion menu
  formatting = {
    format = utils.set_custom_completion_kind,
  },
  -- Custom keybindings
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<C-j>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }),
    ['<C-Space>'] = cmp.mapping.complete(),
  },
  experimental = {
    ghost_text = true,
  }
});
