local utils = require("user.utils");
local CONSTANTS = require("user.nvim-lspconfig.constants");

local M = {};

local format_on_save = function (server)
  -- So that the only server with format capabilities is efm
  if server.name ~= 'efm' then
    server.resolved_capabilities.document_formatting = false
  end

  if server.resolved_capabilities.document_formatting then
    vim.cmd([[
      augroup Format
        au! * <buffer>
        au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(vim.empty_dict(), 400)
      augroup END
    ]])
  end
end

local set_lsp_keybindings = function (buffer_number)
  for _, value in ipairs(CONSTANTS.KEY_MAPPINGS) do
    utils.map_in_buffer(buffer_number, value.mode, value.key_combination, value.command);
  end
end

local set_diagnostic_symbols = function ()
  for _, diagnostics_sign in pairs(CONSTANTS.DIAGNOSTICS_SIGNS) do
    local hl = 'LspDiagnosticsSign' .. diagnostics_sign.type
    vim.fn.sign_define(hl, { text = diagnostics_sign.icon, texthl = hl, numhl = '' })
  end
end

M.handle_attach = function(server, buffer_number)
  set_lsp_keybindings(buffer_number);
  set_diagnostic_symbols();
  format_on_save(server);
end

return M;
