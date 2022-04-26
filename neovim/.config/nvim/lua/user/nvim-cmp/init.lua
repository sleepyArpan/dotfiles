local cmp = require('cmp');
local luasnip = require('luasnip');
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
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif utils.check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  experimental = {
    ghost_text = true,
  }
});
