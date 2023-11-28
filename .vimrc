" Base:

let mapleader="\<space>"

set number
set title
set showcmd
set hlsearch
set undofile
set smarttab
set expandtab
set incsearch
set showmatch
set smartcase
set ignorecase
set autoindent
set cursorline
set splitright
set splitbelow
set smartindent
set breakindent
set termguicolors
set nobackup

set backspace=indent,eol,start
set cmdheight=1
set laststatus=2
set numberwidth=4
set timeoutlen=400
set mouse=a
set fileformat=unix
set wildmode=longest
set wildignore+=*/node_modules/*
set wildoptions=pum
set clipboard=unnamedplus
set backupskip=/tmp/*,/private/tmp/*
set whichwrap+=<>[]hl
set shortmess+=sI
set path+=**
set formatoptions+=r
set nowrap
set tabstop=2
set softtabstop=2
set shiftwidth=2

if has('macunix')
  set clipboard+=unnamed
endif
if has('unix')
  set clipboard+=unnamedplus
endif
if has('win32')
  set clipboard=unnamed
endif


" functions:

function SetTab(size)
  set tabstop=size
  set softtabstop=size
  set shiftwidth=size
endfunction

function SetFileFormat(format)
  set fileformat=format
endfunction

function CopyName()
  :let @+ = expand('%:t')
endfunction

function CopyPath()
  :let @+ = expand('%')
endfunction

function CopyFullPath()
  :let @+ = expand('%:p')
endfunction


" commands:

command Tab2 :call SetTab(2)
command Tab4 :call SetTab(4)
command Tab8 :call SetTab(8)

command SetUnix :call SetFileFormat(unix)
command SetDos :call SetFileFormat(dos)
command SetMac :call SetFileFormat(mac)

command CopyName :call CopyName()
command CopyPath :call CopyPath()
command CopyFullPath :call CopyFullPath()


" mappings:

nnoremap <silent> + <C-a>
nnoremap <silent> - <C-x>
nnoremap <silent> <Leader>p "0p
nnoremap <silent> <C-s> gg<S-v>G
nnoremap <silent> st :tabedit<Return>
nnoremap <silent> sh :split<Return>
nnoremap <silent> sv :vsplit<Return>
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>l <C-w>l
nnoremap <silent> <Leader><left> 20<C-w><
nnoremap <silent> <Leader><right> 20<C-w>>
nnoremap <silent> <Leader><up> 5<C-w>+
nnoremap <silent> <Leader><down> 5<C-w>-
nnoremap <silent> <Esc> :noh<Return>
nnoremap <silent> <Leader>z :set spell<Return>
nnoremap <silent> <Leader>Z :set nospell<Return>
nnoremap <silent> <Leader>w :wa<Return>
nnoremap <silent> <Leader>q :wq<Return>

