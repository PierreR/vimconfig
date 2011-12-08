setlocal expandtab
setlocal nu
setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal autoindent

" Folding
setlocal foldlevel=1
setlocal foldnestmax=2
" setlocal foldmethod=syntax

augroup vimrc
  au BufReadPre * setlocal foldmethod=syntax
  au BufWinEnter * if &fdm == 'syntax' | setlocal foldmethod=manual | endif
augroup END

" syntax clear javaDocComment
" syn region javaDocComment start="/\\*\\*" end="\\*/" keepend contains=javaCommentTitle,@javaHtml,javaDocTags,javaDocSeeTag,javaTodo,@Spell

" syn region javaFuncDef start="^\\z(\\s*\\)\\%(@[A-Z]\\k*\\%((\\_.\\{-})\\)\\?\\_s*\\)*\\%(\\%(public\\|protected\\|private\\|static\\|abstract\\|final\\|native\\|synchronized\\)[ \\n]\\+\\)*\\%(void\\|boolean\\|char\\|byte\\|short\\|int\\|long\\|float\\|double\\|\\%([A-Z][$A-Za-z0-9_]*\\%(\\_s*<\\_s*[$A-Za-z0-9,_ <]\\+\\_s*>\\%(\\_s*>\\)*\\_s*\\)\\?\\)\\)\\_s\\+\\%([a-z][$A-Za-z0-9_]*\\)\\_s*(\\_[^)]*)\\_s*\\%(throws\\_s\\+[A-Z]\\k\\+\\%(\\_s*,\\_s*[A-Z]\\k\\+\\)*\\_s\\{-}\\)\\?\\_s*{" end="}\\s*$" oneline keepend transparent
" syn region foldBraces start="{" end="}" transparent fold keepend extend
" syn region foldJavadoc start=+/\\*+ end=+\\*/+ transparent fold keepend extend

if eclim#EclimAvailable() 
	inoremap <c-space> <c-x><c-u>
	nnoremap <silent> <buffer> <leader>i :JavaImportMissing<cr>
	nnoremap <silent> <buffer> <leader>j ::JUnitExecute<cr>
	nnoremap <silent> <buffer> <leader>c :JavaCorrect<cr>
	nnoremap <silent> <buffer> <leader>l :%JavaFormat<cr>
	nnoremap <silent> <buffer> <leader>d :JavaDocSearch -x declarations<cr>
	nnoremap <silent> <buffer> <cr> :JavaSearchContext<cr>
	let g:EclimJavaImportPackageSeparationLevel = 2
endif
