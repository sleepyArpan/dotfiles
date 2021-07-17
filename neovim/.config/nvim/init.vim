let g:mapleader = "\<Space>"

" Plug config
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/mappings.vim

" Plugzzzz
call plug#begin('~/.vim/plugged')
" Language tings
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Autocompletion tings
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"File search tings
Plug 'airblade/vim-rooter'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"Git tings
Plug 'tpope/vim-fugitive'
"Aesthetic tings
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/tokyonight.nvim'
" Random tings that make life better
" File Explorer
Plug 'kyazdani42/nvim-tree.lua'
" Status line
Plug 'hoob3rt/lualine.nvim'
" Buffer line
Plug 'romgrk/barbar.nvim'
" gcc for commenting out chunks of code
Plug 'b3nj5m1n/kommentary'
" Useful for running tests without leaving the editor
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'
" Provides more clarity
Plug 'Yggdroot/indentLine'
" Startup
Plug 'glepnir/dashboard-nvim'
call plug#end()

" Dashboard settings
let g:dashboard_default_executive = 'telescope'
let g:dashboard_custom_shortcut={
\ 'last_session'       : 'SPC s l',
\ 'find_history'       : 'SPC f h',
\ 'find_file'          : 'SPC f f',
\ 'new_file'           : 'SPC c n',
\ 'change_colorscheme' : 'SPC c c',
\ 'find_word'          : 'SPC f a',
\ 'book_marks'         : 'SPC f b',
\ }
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]
let g:dashboard_custom_footer = ['👋 Happy Coding']

" Color schemes
let g:tokyonight_style = "night"
let g:tokyonight_lualine_bold = 1
let g:tokyonight_hide_inactive_statusline = 1
let g:tokyonight_italic_keywords = 0
set termguicolors
colorscheme tokyonight

" File Tree settings
let g:nvim_tree_side = 'right'
let g:nvim_tree_width = 80
let g:nvim_tree_ignore = ['.git']
let g:nvim_tree_auto_close = 1
let g:nvim_tree_follow = 1

" Vim Test settings
let test#strategy = "vimux"

" Vimux settings
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
let g:VimuxCloseOnExit = 1

" IndentLine settings
let g:indentLine_char = '▏'
let g:indentLine_fileTypeExclude = ['dashboard']

" Startify settings
let g:startify_custom_header =
      \ 'startify#center(startify#fortune#cowsay())'

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  }
}
require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = {'', ''},
    section_separators = {'', ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'filename'},
    lualine_x = { { 'diagnostics', sources = { "coc" } },'diff','encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  extensions = { 'fugitive', 'nvim-tree', 'fzf' }
}
require('telescope').setup{
  defaults = {
    initial_mode = "insert",
    prompt_prefix = "🔎 ",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    path_display = { 'shorten' }
  }
}
EOF

" Bufferline settings
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.closable = v:false
let bufferline.clickable = v:false

" Netrw settings
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

set scrolloff=8
set encoding=UTF-8
set number relativenumber
set shortmess+=W
set cursorline
set noshowmode
set nohlsearch
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set smartindent
set wrap
set linebreak
set confirm
set hidden
set wildmenu
set timeoutlen=1000
set ttimeoutlen=5
syntax enable
" Disables tabline in nvim dashboard
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
