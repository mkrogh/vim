scriptencoding utf-8
set encoding=utf-8
set nocompatible

"Set $VIMDIR to ~/.vim if unset
if empty($VIMDIR)
  if has('nvim')
    let $VIMDIR = glob('~/.config/nvim')
  else
    let $VIMDIR = glob('~/.vim')
  end
else
  let g:vimdir = $VIMDIR
end

"Install vimplug, if not present
if empty(glob($VIMDIR . '/autoload/plug.vim'))
  silent !curl -fLo $VIMDIR/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  call mkdir($VIMDIR . '/spell', 'p')
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin($VIMDIR . '/plugged')

"Well it's only sensible
Plug 'tpope/vim-sensible'

"Airline
Plug 'bling/vim-airline'
  Plug 'powerline/fonts', { 'dir': $VIMDIR . '/fonts/powerline', 'do': './install.sh' }
  Plug 'vim-airline/vim-airline-themes'

"Snipmate
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

"Automatic syntax checking
Plug 'dense-analysis/ale'

"Puppet
Plug 'rodjek/vim-puppet', { 'for': 'puppet' }
let g:puppet_align_hashes = 0

"Go
Plug 'fatih/vim-go'

"Rainbow levels
Plug 'thiagoalessio/rainbow_levels.vim'

"Color schemes
Plug 'tomasr/molokai'

call plug#end()

" Allow unsaved changes in buffers
set hidden

set ignorecase
set smartcase
set hlsearch

set visualbell
syntax on

" if has("gui_running")... else
  colorscheme desert
  let g:airline_theme = 'term'
  set nocursorline

set backupdir^=$VIMDIR/backup
set directory^=$VIMDIR/tmp
if version >= 703
  set undodir^=$VIMDIR/undo
endif

set expandtab
set cindent
set shiftwidth=2
set tabstop=2

"Python pep-008
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab
let g:ale_python_flake8_options='--ignore=E501'

"Puppetlint ignores
let g:ale_puppet_puppetlint_options='--no-puppet_url_without_modules-check --no-autoloader_layout-check'

"Shellcheck disable realtive check
let g:ale_shellcheck_options='-e SC1091'

"Yamllint disables
let g:ale_yaml_yamllint_options='disable-line'

set listchars=tab:→\ ,trail:·,extends:<,precedes:>,nbsp:␣
set list

set wrap

set foldmethod=syntax
set nofoldenable

set wildmode=longest,full

let g:is_posix = 1

"Ruby stuff
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby let g:rubycomplete_rails = 1
autocmd FileType ruby let g:rubycomplete_classes_in_global = 1

" Go stuff
autocmd FileType go set nolist


" Fix auto comment for new lines etc
set formatoptions-=c formatoptions-=r formatoptions-=o

let mapleader=','
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
map <leader>d :e .<CR>

map <leader>l <Esc>:RainbowLevelsToggle<cr>
map <leader>h <Esc>:w\|!haml % %:r.html<CR>
map <leader>c <Esc>:w\|!coffee -c %<CR>
map <leader>r <Esc>:w\|!ruby %<CR>
map <leader>s <Esc>:w\|!sass % %:r.css<CR>
map <leader>t <Esc>:w\|!rspec <CR>
map <leader>ex <Esc>:w\|!./% <CR>

map <leader>rc <Esc>:tabe $VIMDIR/.vimrc<CR>

" Disable EX mode
nnoremap Q <nop>

" map _ to remove search highlight
nnoremap <silent> _ :nohl<CR>

set splitright
" Make backspace work for insert
set backspace=indent,eol,start

"Spelling defaults
set spelllang=en_gb,da
autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType gitcommit setlocal spell

" Better highilight colors
highlight SpellLocal ctermfg=253 ctermbg=2
highlight SpellCap ctermfg=0
highlight SpellBad ctermfg=249

" Use special colorscheme for diffs
if &diff
  colorscheme molokai
endif
