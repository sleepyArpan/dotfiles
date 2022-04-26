local nvim_lsp = require('lspconfig')

local eslint = {
  lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
  lintIgnoreExitCode = false,
  lintStdin = true,
  lintFormats = { '%f:%l:%c: %m' },
  formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
  formatStdin = true,
}

local prettier = {
  formatCommand = 'prettierd  "${INPUT}"',
  formatStdin = true,
}

local stylua = { formatCommand = 'stylua -s -', formatStdin = true }

local format_config = {
  javascript = { prettier, eslint },
  javascriptreact = { prettier, eslint },
  typescript = { prettier, eslint },
  typescriptreact = { prettier, eslint },
  css = { prettier },
  html = { prettier },
  json = { prettier },
  lua = { stylua },
  markdown = { prettier },
  scss = { prettier },
  yaml = { prettier },
}

return {
  init_options = { documentFormatting = true, codeAction = true },
  root_dir = nvim_lsp.util.root_pattern({ '.git/' }),
  filetypes = vim.tbl_keys(format_config),
  settings = { languages = format_config },
}
