set nocompatible

execute pathogen#infect()

set hidden
:noremap <C-left> :bprev<CR>
:noremap <C-right> :bnext<CR>

set autoread

set ignorecase
set smartcase
set hlsearch

set dictionary=/usr/share/dict/words "on trial ctrl-x ctrl-k

colorscheme desert
set background=dark

set backupdir^=~/.vim/backup
set directory^=~/.vim/tmp
set undodir^=~/.vim/undo

set expandtab
set cindent "on trial
set shiftwidth=2
set tabstop=2

set list listchars=tab:\ \ ,trail:Â

set nowrap

set foldmethod=syntax "on trial
set nofoldenable "on trial

command! -bar -nargs=0 W :silent exe "write !sudo tee % >/dev/null"|silent edit!

set wildmode=longest,list,full
set wildmenu

