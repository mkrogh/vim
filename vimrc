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
"Where the yankring history file is kept
let g:yankring_history_dir = "~/.vim/tmp"


"Override IndexedSearch leader keys with commentary
xmap \\  <Plug>Commentary
nmap \\  <Plug>Commentary
nmap \\\ <Plug>CommentaryLine
nmap \\u <Plug>CommentaryUndo

" Conque stuff
let g:ConqueTerm_FastMode = 0
let g:ConqueTerm_Color = 1
let g:ConqueTerm_CWInsert = 1
let g:ConqueTerm_TERM = 'vt220'
let g:ConqueTerm_SendVisKey = '<Leader>e'

" Map open buffers in Command-T to \bf
" so it doesn't have to wait for \bd
nnoremap <silent> <Leader>bl :CommandTBuffer<CR>

let mapleader=','
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

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

