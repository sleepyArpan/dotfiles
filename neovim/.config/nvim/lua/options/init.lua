local options = {
	scrolloff = 8,
	encoding = "utf-8",
	cursorline = true,
	number = true,
	relativenumber = true,
	autoread = true,
	termguicolors = true,
	wrap = false,
	linebreak = true,
	breakindent = true,
	cursorline = true,
	tabstop = 2,
  softtabstop = 2,
	shiftwidth = 2,
 	expandtab = true,
 	swapfile = false,
 	writebackup = false,
 	undofile = true,
 	splitright = true,
 	ignorecase = true,
 	smartcase = true,
 	confirm = true,
 	signcolumn = 'yes',
 	showmode = false,
 	hidden = true,
	wildmenu = true,
	timeoutlen = 1000,
	ttimeoutlen = 5,
  smartindent = true,
  smarttab = true,
  foldlevel = 99,
  updatetime = 300
}

for option_name, option_value in pairs(options) do
	vim.opt[option_name] = option_value
end
