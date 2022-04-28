local utils = require("user.utils");
local CONSTANTS = require("user.nvim-lspconfig.constants");

local M = {};

local set_lsp_keybindings = function(buffer_number)
  for _, value in ipairs(CONSTANTS.KEY_MAPPINGS) do
    utils.map_in_buffer(buffer_number, value.mode, value.key_combination, value.command);
  end
end

local set_diagnostic_symbols = function()
  for type, icon in pairs(CONSTANTS.DIAGNOSTICS_SIGNS) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

M.handle_attach = function(client, buffer_number)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  if client.name == "sumneko_lua" then
    client.resolved_capabilities.document_formatting = false
  end
  set_lsp_keybindings(buffer_number);
  set_diagnostic_symbols();
end

return M;
