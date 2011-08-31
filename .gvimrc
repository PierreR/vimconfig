"set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
set guifont=DejaVu\ Sans\ Mono\ 10.5
set guioptions-=T
set guioptions-=m
set guioptions-=l
set guioptions-=r
set guioptions-=b
set cursorline
" hi CursorLine guibg=#6C6E70
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
