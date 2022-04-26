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

lsp_installer.on_server_ready(function(server)
    local opts = server_configs[server.name] or {};
    opts.on_attach = utils.handle_attach;
    server:setup(opts);
    vim.cmd [[ do User LspAttachBuffers ]];
end);
