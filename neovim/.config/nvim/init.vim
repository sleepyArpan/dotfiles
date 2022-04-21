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
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Git tings
Plug 'tpope/vim-fugitive'
"Aesthetic tings
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/tokyonight.nvim'
" Random tings that make life better
" File Explorer
Plug 'kyazdani42/nvim-tree.lua'
" Status line
Plug 'nvim-lualine/lualine.nvim'
" Buffer line
Plug 'romgrk/barbar.nvim'
" gcc for commenting out chunks of code and commentstring plugin to support
" multiple comment types in a single file
Plug 'b3nj5m1n/kommentary'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
" Useful for running tests without leaving the editor
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'
" Provides more clarity
Plug 'Yggdroot/indentLine'
" Discord rich presence
Plug 'andweeb/presence.nvim'
call plug#end()

" Color schemes
let g:tokyonight_style = "storm"
let g:tokyonight_lualine_bold = 1
let g:tokyonight_hide_inactive_statusline = 1
let g:tokyonight_italic_keywords = 1
" let g:tokyonight_italic_functions = 1
set termguicolors
colorscheme tokyonight

" Vim Test settings
let test#strategy = "vimux"

" Vimux settings
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
let g:VimuxCloseOnExit = 1

" IndentLine settings
let g:indentLine_char = '▏'
let g:indentLine_fileTypeExclude = ['dashboard']

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false
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
  extensions = { 'fugitive', 'nvim-tree' }
}
require("presence"):setup({
    -- General options
    auto_update         = true,                       -- Update activity based on autocmd events (if `false`, map or manually execute `:lua package.loaded.presence:update()`)
    neovim_image_text   = "The One True Text Editor", -- Text displayed when hovered over the Neovim image
    main_image          = "neovim",                   -- Main image display (either "neovim" or "file")
    log_level           = nil,                        -- Log messages at or above this level (one of the following: "debug", "info", "warn", "error")
    debounce_timeout    = 10,                         -- Number of seconds to debounce events (or calls to `:lua package.loaded.presence:update(<filename>, true)`)
    enable_line_number  = false,                      -- Displays the current line number instead of the current project

    -- Rich Presence text options
    editing_text        = "Editing a file",               -- Format string rendered when an editable file is loaded in the buffer
    file_explorer_text  = "Browsing a file",              -- Format string rendered when browsing a file explorer
    git_commit_text     = "Committing changes",       -- Format string rendered when commiting changes in git
    plugin_manager_text = "Managing plugins",         -- Format string rendered when managing plugins
    reading_text        = "Reading a file",               -- Format string rendered when a read-only or unmodifiable file is loaded in the buffer
    workspace_text      = "Working on %s",            -- Workspace format string (either string or function(git_project_name: string|nil, buffer: string): string)
    line_number_text    = "Line %s out of %s",        -- Line number format string (for when enable_line_number is set to true)
})
require('kommentary.config').configure_language('typescriptreact', {
  single_line_comment_string = 'auto',
  multi_line_comment_strings = 'auto',
  hook_function = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end,
})
require('kommentary.config').configure_language('javascriptreact', {
  single_line_comment_string = 'auto',
  multi_line_comment_strings = 'auto',
  hook_function = function()
    require('ts_context_commentstring.internal').update_commentstring()
  end,
})
require'nvim-tree'.setup {
  auto_close = true,
  view = {
    width = 80,
    side = 'right',
    auto_resize = true
  }  
} 
EOF

" File Tree settings
let g:nvim_tree_ignore = ['.git']
let g:nvim_tree_follow = 1

" Bufferline settings
let bufferline = get(g:, 'bufferline', {})
let bufferline.animation = v:false
let bufferline.closable = v:false
let bufferline.clickable = v:false

" Netrw settings
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

" Fzf settings
" Customize fzf colors to match your color scheme                                          
" - fzf#wrap translates this to a set of `--color` options                                 
let g:fzf_colors =                                                                         
\ { 'fg':      ['fg', 'Normal'],                                                           
  \ 'bg':      ['bg', 'Normal'],                                                           
  \ 'hl':      ['fg', 'Comment'],                                                          
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],                             
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],                                       
  \ 'hl+':     ['fg', 'Statement'],                                                        
  \ 'info':    ['fg', 'PreProc'],                                                          
  \ 'border':  ['fg', 'Ignore'],                                                           
  \ 'prompt':  ['fg', 'Conditional'],                                                      
  \ 'pointer': ['fg', 'Exception'],                                                        
  \ 'marker':  ['fg', 'Keyword'],                                                          
  \ 'spinner': ['fg', 'Label'],                                                            
  \ 'header':  ['fg', 'Comment'] } 


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
setlocal foldmethod=indent
set nofoldenable
set foldlevel=99
syntax enable
" Disables tabline in nvim dashboard
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
