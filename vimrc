set nocompatible

execute pathogen#infect()
call pathogen#helptags()

set hidden
:noremap <C-left> :bprev<CR>
:noremap <C-right> :bnext<CR>

set autoread

set ignorecase
set smartcase
set hlsearch

set visualbell

if has('gui_running')
  "Turn off toolbar
  set guioptions-=T
  "Turn off scrollbar
  set guioptions-=r

  if has("gui_macvim")
    set guifont=Menlo:h16
  else
    set guifont=Inconsolata\ 12
  endif
else
  "Make color scheme look better in crappy terminals
  let g:solarized_termcolors=256
endif

colorscheme solarized
set background=dark

set backupdir^=~/.vim/backup
set directory^=~/.vim/tmp
if version >= 703
  set undodir^=~/.vim/undo
endif

set expandtab
set cindent
set shiftwidth=2
set tabstop=2

set list listchars=tab:\ \ ,trail:·,extends:<,precedes:>

set nowrap

set foldmethod=syntax
set nofoldenable

command! -bar -nargs=0 W :silent exe "write !sudo tee % >/dev/null"|silent edit!

set wildmode=longest,list,full
set wildmenu

"Ruby stuff
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

"Tagbar mapping
nmap <F8> :TagbarToggle<CR>
