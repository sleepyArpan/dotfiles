local lsp_installer = require("nvim-lsp-installer")
local utils = require('user.nvim-lspconfig.utils')
local server_configs = require('user.nvim-lspconfig.server_configs');

vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics,
  {
    underline = true,
    virtual_text = false, -- Disables virtual text
    signs = true,
    update_in_insert = false,
  }
)

function PrintDiagnostics(opts, bufnr, line_nr)
  bufnr = bufnr or 0
  line_nr = line_nr or (vim.api.nvim_win_get_cursor(0)[1] - 1)
  opts = opts or {['lnum'] = line_nr}

  local line_diagnostics = vim.diagnostic.get(bufnr, opts)
  if vim.tbl_isempty(line_diagnostics) then return end

  local diagnostic_message = ""
  for i, diagnostic in ipairs(line_diagnostics) do
    diagnostic_message = diagnostic_message .. string.format("%d: %s", i, diagnostic.message or "")
    print(diagnostic_message)
    if i ~= #line_diagnostics then
      diagnostic_message = diagnostic_message .. "\n"
    end
  end
  vim.api.nvim_echo({{diagnostic_message, "Normal"}}, false, {})
end

vim.cmd [[ autocmd! CursorHold * lua PrintDiagnostics() ]]
vim.cmd [[ autocmd! CursorHold,CursorHoldI * lua require('user.nvim-lspconfig.utils').code_action_listener() ]]

lsp_installer.on_server_ready(function(server)
    local opts = server_configs[server.name] or {};
    opts.on_attach = utils.handle_attach;
    server:setup(opts);
    vim.cmd [[ do User LspAttachBuffers ]];
end);
