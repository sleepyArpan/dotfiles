" Sourcing the vimrc
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" FUGITIVE REMAPS
" get from right side
nnoremap <leader>gh :diffget //3<CR>
" get from left side
nnoremap <leader>gf :diffget //2<CR>
" get git status
nnoremap <leader>gs :Git<CR>
" get git blame for current file
nnoremap <leader>gb :Git blame<CR>

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

" When popup menu has scrollable content, enable scroll
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Bufferline maps
nnoremap <tab> :BufferNext<CR>
nnoremap <S-tab> :BufferPrevious<CR>
" Goto buffer in position...
nnoremap <leader>1 :BufferGoto 1<CR>
nnoremap <leader>2 :BufferGoto 2<CR>
nnoremap <leader>3 :BufferGoto 3<CR>
nnoremap <leader>4 :BufferGoto 4<CR>
nnoremap <leader>5 :BufferGoto 5<CR>
nnoremap <leader>6 :BufferGoto 6<CR>
nnoremap <leader>7 :BufferGoto 7<CR>
nnoremap <leader>8 :BufferGoto 8<CR>
nnoremap <leader>9 :BufferLast<CR>
" Close buffer
nnoremap <leader>bc :BufferClose<CR>
" Magic buffer-picking mode
nnoremap <leader>bp :BufferPick<CR>
" Re-order to previous/next
nnoremap <silent>mbn :BufferMoveNext<CR>
nnoremap <silent>mbp :BufferMovePrevious<CR>
nnoremap <leader>cl :BufferCloseAllButCurrent<CR>

" Fzf remaps
nnoremap <leader><tab> :Buffers<CR>
nnoremap <C-g> :Rg<CR>
nnoremap <C-p> :GFiles<CR>
nnoremap <leader>pf :Files<CR>

" NvimTree REMAPS
nnoremap <leader>e :NvimTreeToggle<CR>
nnoremap <leader>ff :NvimTreeFindFile<CR><CR>
