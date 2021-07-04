" Sourcing the vimrc
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
" Moves to next buffer
nnoremap <tab> :bn<CR>
" Moves to previous buffer
nnoremap <S-tab> :bp<CR>

" FUGITIVE REMAPS
" get from right side
nnoremap <leader>gh :diffget //3<CR>
" get from left side
nnoremap <leader>gf :diffget //2<CR>
" get git status
nnoremap <leader>gs :Git<CR>
" get git blame for current file
nnoremap <leader>gb :Git blame<CR>

" NERDTREE REMAPS
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>e :NERDTreeToggle %<CR>

" Vim Test remaps
nnoremap <leader>tn :TestNearest<CR>
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>ts :TestSuite<CR>
nnoremap <leader>tl :TestLast<CR>
nnoremap <leader>tv :TestVisit<CR>

" Vimux remaps
nnoremap <leader>tc :VimuxCloseRunner<CR>
nnoremap <leader>tq :VimuxInterruptRunner<CR>

" Jsdoc remap
nnoremap <leader>dc :CocCommand docthis.documentThis<CR>

" BufferLine Picks
nnoremap <leader>1 :BufferLinePick<CR>

" When popup menu has scrollable content, enable scroll
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
