" !! Use Pathogen to manage plugins !!
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Common usual options that should never be changed.
" Without these you don't survive Vim
set lazyredraw
set nocompatible
set enc=utf-8
set nostartofline
set nobackup
set noswapfile
set shell=zsh
set t_Co=256
syn on
set incsearch
set showcmd
set hidden " allow buffer to have hidden changed
set ignorecase
set smartcase
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set history=50 " how much line do you want to keep in the history table
set bs=indent,eol,start
set mouse=a " enable the mouse in all mode
" set splitbelow 
set textwidth=0 " disable automatic line break !
set complete=.,w,b,t "completion will first search in the current buffer, then windows, then open buffers, then tags
set sessionoptions-=options
set completeopt=menu,longest
set wildignore+=*.pyc,*.jar,*.pdf,*.class,/tmp/*.*,.git,*.o,*.obj,*.png,*.jpeg,*.gif,*.orig,target/*
set directory=~/tmp
set cpoptions+=$ " Display a $ as vi does whenever you use the change command (c)
set viminfo='50,<100,s100,%
"Mappings
nmap <F1> <nop>
nmap <T-F1> <nop>
imap <F1> <nop>
imap <T-F1> <nop>
let mapleader = ","
nnoremap Y y$
nnoremap <F5> :buffers<CR>:buffer<Space>
noremap <Space> :set hlsearch! hlsearch?<CR>
nnoremap <leader>l :execute ToggleColorScheme()<CR> 

" Default sensible option that might be overridden for specific file type
set noexpandtab "don't transform tab into spaces by default
set tabstop=4
set shiftwidth=4
" Folding
set foldcolumn=0 "Don't show because it does not take into account foldminlines
set foldlevel=3 "unfold the first x level
" set foldtext=v:folddashes.substitute(getline(v:foldstart),'/\\\\*\\\\\\|\\\\*/\\\\\\|{{{\\\\d\\\\=','','g')
set foldtext=CustomFoldText() 
fu! CustomFoldText()
     "get first non-blank line
     let fs = v:foldstart
     while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
     endwhile
     if fs > v:foldend
         let line = getline(v:foldstart)
     else
         let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
     endif
 
     let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
     let foldSize = 1 + v:foldend - v:foldstart
     let foldSizeStr = " " . foldSize . " "
     let foldLevelStr = repeat("+--", v:foldlevel)
     let lineCount = line("$")
     let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr))
     return line . expansionString . foldSizeStr . foldLevelStr
 endf

" Command-t
let g:CommandTMaxHeight=10


" Nice to have
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %{fugitive#statusline()}\ %P
set titlestring=%f title
set wildmenu
set wildmode=longest,list  
set tags+=./tags
cmap w!! w !sudo tee % >/dev/null " is this working fine ? 

"   Correct some spelling mistakes
ia htis     this
ia tihs     this
ia funciton function
ia fucntion function
ia funtion  function
ia retunr   return
ia reutrn   return

filetype plugin indent on
" if &term =~ "xterm\\\\|rxvt" 
" 	let &t_SI = "\\033]12;cyan3\\x9c"
" 	let &t_EI = "\\033]12;grey\\x9c"
" 	:silent !echo -ne "\\033]12;grey\\x9c"
" 	autocmd VimLeave * :!echo -ne "\\033]12;grey\\x9c"
" endif

"
" Persistent-undo (vim 7.3)
" 
if v:version >= 703
	set undofile
	set undodir=/tmp
endif

set grepprg=ack


"Small custom fct
function! ToggleColorScheme()
	if g:colors_name == 'lucius'
		exe SetSolarized()
	elseif g:colors_name == 'solarized'
		exe SetLucius()
	endif
endfunction

function! SetSolarized()
	set background=light
	colorscheme solarized
	highlight iCursor guifg=black guibg=#5C7077
endfunction	

function! SetLucius()
	set background=dark
	colorscheme lucius
	hi CursorLine guibg=#676968
	highlight Cursor guifg=white guibg=grey
	highlight iCursor guifg=green guibg=#93D6A9
endfunction		

let g:solarized_termcolors=256

if has('gui_running')
    exe SetSolarized()
else
	exe SetLucius()
endif

autocmd BufReadPost fugitive://* set bufhidden=delete

"Eclim
let g:EclimXmlValidate=0
let g:EclimHmlValidate=0

let g:SuperTabDefaultCompletionType = "context"
