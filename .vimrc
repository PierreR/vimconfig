" !! Use Pathogen to manage plugins !!
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Common usual options that should never be changed.
" Without these you don't survive Vim
set nocompatible
colorscheme lucius
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
set splitbelow 
set textwidth=0 " disable automatic line break !
set complete=.,w,b,t "completion will first search in the current buffer, then windows, then open buffers, then tags
set sessionoptions-=options
set completeopt=menu,longest
set foldcolumn=1
set wildignore+=*.pyc,*.jar,*.pdf,*.class,/tmp/*.*
set directory=~/tmp
set cpoptions+=$ " Display a $ as vi does whenever you use the change command (c)

"Mappings
let mapleader = ","
nmap <F6> :b#<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
:noremap <Space> :set hlsearch! hlsearch?<CR>

" Default sensible option that might be overridden for specific file type
set noexpandtab "don't transform tab into spaces by default
set tabstop=4
set shiftwidth=4
set foldlevel=0


" Nice to have
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
