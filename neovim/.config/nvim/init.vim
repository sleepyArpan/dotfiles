let g:mapleader = "\<Space>"

" Plug config
source $HOME/.config/nvim/plug-config/coc.vim
source $HOME/.config/nvim/plug-config/fzf.vim
source $HOME/.config/nvim/plug-config/bufonly.vim
source $HOME/.config/nvim/plug-config/lightline.vim
source $HOME/.config/nvim/mappings.vim

" Plugzzzz
call plug#begin('~/.vim/plugged')
" Language tings
Plug 'sheerun/vim-polyglot'
" Autocompletion tings
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"File search tings
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
"Git tings
Plug 'tpope/vim-fugitive'
"Aesthetic tings
Plug 'arcticicestudio/nord-vim'
" File Explorer tings 
Plug 'preservim/nerdtree'
" Random tings that make life better
" Status and bufferline plugin
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
" gcc for commenting out chunks of code
Plug 'tpope/vim-commentary'
" Useful for running tests without leaving the editor
Plug 'vim-test/vim-test'
Plug 'preservim/vimux'
" Provides more clarity
Plug 'Yggdroot/indentLine'
" Startup screen
Plug 'mhinz/vim-startify/'
call plug#end()

" Color schemes
set termguicolors
colorscheme nord

" NerdTree settings
let g:NERDTreeWinPos = "right"
let g:NERDTreeWinSize = 60
let g:NERDTreeShowHidden=1

" Vim Test settings
let test#strategy = "vimux"

" Vimux settings
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
let g:VimuxCloseOnExit = 1

" IndentLine settings
let g:indentLine_char = '▏'

" Startify settings
let g:startify_custom_header =
      \ 'startify#center(startify#fortune#cowsay())'

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
set showtabline=2
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set timeoutlen=1000
set ttimeoutlen=5
syntax enable

