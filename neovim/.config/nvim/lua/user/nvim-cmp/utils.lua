local CONSTANTS = require("user.nvim-cmp.constants");
local luasnip = require("luasnip");
local cmp = require('cmp');

local M = {};

M.set_custom_completion_kind = function (_, vim_item)
  vim_item.kind =
    CONSTANTS.COMPLETION_KINDS_SYMBOLS[vim_item.kind];
  return vim_item;
end

local has_words_before = function()
  local col_no = vim.api.nvim_win_get_cursor(0)[2];
  local line_text = vim.api.nvim_get_current_line();
  local char_before_cursor = line_text:sub(col_no, col_no);
  return col_no ~= 0 and char_before_cursor:match("%s") == nil
end


-- source: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#luasnip
M.custom_tab_key_handler = function (fallback)
  if cmp.visible() then
    cmp.select_next_item();
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump();
  elseif has_words_before() then
    cmp.complete();
  else
    -- Fallback is normal Tab key behaviour i.e. insert Tab space
    fallback();
  end
end

M.luasnip_expand = function (args)
  luasnip.lsp_expand(args.body);
end

return M;
