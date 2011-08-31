setlocal expandtab
setlocal nu
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal autoindent

if eclim#EclimAvailable() 
	inoremap <c-space> <c-x><c-u>
	nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
	nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
	nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
endif
" If you use Eclim
" nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
" nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
