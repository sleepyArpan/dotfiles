local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
	use("shaunsingh/nord.nvim") -- Colorscheme
	use("folke/tokyonight.nvim") -- Colorscheme
	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	}) -- Bufferline
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
	}) -- File tree
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	}) -- Statusline
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons" },
	}) -- File finder
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	}) -- AST parser
	use({
		"neovim/nvim-lspconfig", -- configure nvim native lsp
		requires = {
			{ "williamboman/nvim-lsp-installer" }, -- easily install language servers
		},
	})
	use({ "jose-elias-alvarez/null-ls.nvim" }) -- Formatter and Linter for a bunch of languages
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-nvim-lsp", -- nvim-cmp source lsp completion
			"hrsh7th/cmp-buffer", -- nvim-cmp source for buffer completion
			"hrsh7th/cmp-path", -- nvim-cmp source for path completion
			"saadparwaiz1/cmp_luasnip", -- nvim-cmp source for lua snip
			"L3MON4D3/LuaSnip", -- nvim-cmp requires a snippet engine for completion
		},
	})
	use("rafamadriz/friendly-snippets") -- Bunch of snippets
	use("windwp/nvim-ts-autotag") -- Autocomplete html tags
	use("windwp/nvim-autopairs") -- Auto close quotes/brackets
	use("lukas-reineke/indent-blankline.nvim") -- Shows indent lines
	use("b3nj5m1n/kommentary") -- Comments
	use("wincent/loupe") -- Better search
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
