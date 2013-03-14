set nocompatible

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set backspace=indent,eol,start
set history=500
set ruler
set showcmd
set showmode

filetype plugin on
filetype indent on
syntax enable

set hidden
:nnoremap <C-n> :bnext<CR> "on trial
:nnoremap <C-p> :bprevious<CR> "on trial

set autoread
set ruler

set incsearch
set ignorecase
set smartcase
set hlsearch
" on trial
autocmd cursorhold * set nohlsearch
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
"to here

set dictionary=/usr/share/dict/words "on trial ctrl-x ctrl-k

colorscheme desert
set background=dark

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set expandtab
set autoindent
set cindent "on trial
set shiftwidth=2
set tabstop=2
set smarttab

set list listchars=tab:\ \ ,trail:· "on trial

set nowrap

set foldmethod=syntax "on trial
set nofoldenable "on trial

command! -bar -nargs=0 W :silent exe "write !sudo tee % >/dev/null"|silent edit!

set wildmode=longest,list,full
set wildmenu

