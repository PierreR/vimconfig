setlocal expandtab
setlocal nu
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal autoindent

" Folding


setlocal foldlevel=1
setlocal foldmarker={,} 
setlocal foldnestmax=2
setlocal foldmethod=syntax

syntax clear javaDocComment
syn region javaDocComment start="/\*\*" end="\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaDocSeeTag,javaTodo,@Spell

if eclim#EclimAvailable() 
	inoremap <c-space> <c-x><c-u>
	nnoremap <silent> <buffer> <leader>i :JavaImport<cr>
	nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
	nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
endif
