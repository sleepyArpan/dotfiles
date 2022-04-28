local options = {
  scrolloff = 8, -- keeps 8 space width at the bottom
  completeopt = { "menuone", "noselect" }, -- for cmp
  clipboard = "unnamedplus", -- whatever is yanked or deleted is put in the '+' registry
  hlsearch = true, -- highlights searched words
  encoding = "utf-8", -- basic file encoding
  cursorline = true, -- highlights the line the cursor is on
  relativenumber = true, -- enables relative line numbers
  autoread = true, -- Update neovim if a file changes from outside of neovim
  termguicolors = true, -- Enables 24-bit RGB color in the Terminal UI
  wrap = false,
  linebreak = true,
  breakindent = true,
  tabstop = 2,
  softtabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  swapfile = false,
  writebackup = false,
  undofile = true,
  smartcase = true,
  confirm = true,
  signcolumn = "yes",
  showmode = false,
  hidden = true,
  wildmenu = true,
  timeoutlen = 1000,
  ttimeoutlen = 5,
  smartindent = true,
  smarttab = true,
  foldlevel = 99,
  updatetime = 300,
  splitright = true,
  splitbelow = true,
  ignorecase = true,
  list = true,
}

vim.opt.iskeyword:append("-")
vim.opt.listchars:append("eol:↴")

for option_name, option_value in pairs(options) do
  vim.opt[option_name] = option_value
end
