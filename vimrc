set nocompatible

execute pathogen#infect()
call pathogen#helptags()

set hidden

set ignorecase
set smartcase
set hlsearch

set visualbell

if has('gui_running')
  "Turn on Powerline
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
  set laststatus=2
  set noshowmode
  let g:powerline_config_overrides={"ext": {"vim": {"colorscheme": "solarized"}}}

  "Turn off tool bar
  set guioptions-=T
  "Turn off scrollbar
  set guioptions-=r

  if has("gui_macvim")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h16
  else
    set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
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

set list listchars=tab:➝\ ,trail:·,extends:<,precedes:>

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

"Remap annoying numbertoggle, so it doesn't interfere with yankring
let g:NumberToggleTrigger = "<F10>"

" Auto load .vimrc from current directory (used for per directory wildignore)
set exrc
