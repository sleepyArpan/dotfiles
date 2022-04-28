local parser_list = {
  "bash",
  "c",
  "cpp",
  "css",
  "dockerfile",
  "dot",
  "graphql",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "lua",
  "markdown",
  "python",
  "regex",
  "tsx",
  "typescript",
  "yaml",
}

require("nvim-treesitter.configs").setup({
  ensure_installed = parser_list, -- checks and install all parsers in list
  sync_install = false, -- parsers listed in ensure_installed are installed asynchronously
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})
