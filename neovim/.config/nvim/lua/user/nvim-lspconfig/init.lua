local lsp_installer = require("nvim-lsp-installer")
local utils = require("user.nvim-lspconfig.utils")
local server_configs = require("user.nvim-lspconfig.server_configs")
require("user.nvim-lspconfig.server_configs.null-ls")

-- To set borders
vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]])
local border = {
  { "🭽", "FloatBorder" },
  { "▔", "FloatBorder" },
  { "🭾", "FloatBorder" },
  { "▕", "FloatBorder" },
  { "🭿", "FloatBorder" },
  { "▁", "FloatBorder" },
  { "🭼", "FloatBorder" },
  { "▏", "FloatBorder" },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

lsp_installer.on_server_ready(function(server)
  local opts = server_configs[server.name] or {}
  opts.on_attach = utils.handle_attach
  server:setup(opts)
  vim.cmd([[ do User LspAttachBuffers ]])
end)
