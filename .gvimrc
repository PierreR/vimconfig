set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=r
set guioptions-=b
highlight Cursor guifg=white guibg=grey
highlight iCursor guifg=green guibg=#93D6A9
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-iCursor/lCursor 
set guicursor+=a:blinkon0
set foldenable

" vnoremap <leader><s>y "+y
" vnoremap <leader>y "*y
" nmap <leader><s>p "+gp
" nmap <RightMouse> "*p
" imap <RightMouse> <Esc><RightMouse>i
" vmap <C-C> "*y
nmap <c-p> "*p
imap <c-p> <Esc><c-p>i
vmap <C-C> "*y
