set nocompatible

execute pathogen#infect()
call pathogen#helptags()

set hidden

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
    set guifont=Inconsolata\ 11
  endif
else
  "Detect 256 color terminal
  if $TERM == "xterm-256color" || $TERM == "gnome-256color"
    "Assume no solarized theme
    let g:solarized_termcolors=256
  endif
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

set cursorline

set list listchars=tab:\ \ ,trail:·,extends:<,precedes:>

set nowrap

set foldmethod=syntax
set nofoldenable

command! -bar -nargs=0 W :silent exe "write !sudo tee % >/dev/null"|silent edit!

set wildmode=longest,list,full

"Ruby stuff
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby let g:rubycomplete_rails = 1
autocmd FileType ruby let g:rubycomplete_classes_in_global = 1

"Tagbar mapping
nmap <F8> :TagbarToggle<CR>

" Autoload .vimrc from current directory (used for per directory wildignore)
set exrc
