set nocompatible

if $SHELL =~ 'fish'
  set shell=/bin/sh
endif

execute pathogen#infect()
call pathogen#helptags()

set hidden

set ignorecase
set smartcase
set hlsearch

set visualbell

if has('gui_running')
  colorscheme solarized
  set background=dark

  "Turn on Powerline
  set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
  set laststatus=2
  set noshowmode
  let g:powerline_config_overrides={"ext": {"vim": {"colorscheme": "solarized"}}}

  "Turn off tool bar
  set guioptions-=T
  "Turn off scrollbar
  set guioptions-=r

  set cursorline

  if has("gui_macvim")
    set guifont=Source\ Code\ Pro\ for\ Powerline:h16
  else
    set guifont=Source\ Code\ Pro\ for\ Powerline\ 12
  endif
else
  colorscheme desert
  set nocursorline
endif

set backupdir^=~/.vim/backup
set directory^=~/.vim/tmp
if version >= 703
  set undodir^=~/.vim/undo
endif

set expandtab
set cindent
set shiftwidth=2
set tabstop=2

set list listchars=tab:➝\ ,trail:·,extends:<,precedes:>

set wrap

set foldmethod=syntax
set nofoldenable

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
"Where the yankring history file is kept
let g:yankring_history_dir = "~/.vim/tmp"

" Map open buffers in Command-T to \bf
" so it doesn't have to wait for \bd
nnoremap <silent> <Leader>bf :CommandTBuffer<CR>

let mapleader=','
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>d :e .<CR>

map <leader>h <Esc>:w\|!haml % %:r.html<CR>
map <leader>c <Esc>:w\|!coffee -c %<CR>
map <leader>r <Esc>:w\|!ruby %<CR>
map <leader>s <Esc>:w\|!sass % %:r.css<CR>
map <leader>t <Esc>:w\|!rspec <CR>
map <leader>ex <Esc>:w\|!./% <CR>

map <leader>rc <Esc>:tabe ~/.vimrc<CR>

" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" Open files, limited to the directory of the current file, with <leader>gf
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>

set splitright

