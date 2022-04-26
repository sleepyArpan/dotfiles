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

function M.code_action_listener()
  local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
  local params = vim.lsp.util.make_range_params()
  params.context = context
  vim.lsp.buf_request(0, 'textDocument/codeAction', params, function(err, _, result)
    -- do something with result - e.g. check if empty and show some indication such as a sign
    -- TODO - add this later
  end)
end

local set_lsp_keybindings = function (buffer_number)
  for _, value in ipairs(CONSTANTS.KEY_MAPPINGS) do
    utils.map_in_buffer(buffer_number, value.mode, value.key_combination, value.command);
  end
end

local set_diagnostic_symbols = function ()
  for type, icon in pairs(CONSTANTS.DIAGNOSTICS_SIGNS) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end
end

M.handle_attach = function(server, buffer_number)
  set_lsp_keybindings(buffer_number);
  set_diagnostic_symbols();
  format_on_save(server);
end

return M;
