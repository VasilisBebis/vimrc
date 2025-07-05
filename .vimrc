if exists('g:loaded_vimrc') || &compatible
  finish
else
  let g:loaded_vimrc = 'yes'
endif

filetype on 
filetype plugin on
filetype indent on
syntax   on
syntax   enable
set      completeopt-=preview
set      autoindent
set      nocompatible
set      number
set      tabstop=2
set      shiftwidth=2
set      softtabstop=2
set      expandtab
set      wildmenu
" set      clipboard=unnamedplus
set      signcolumn=yes
set      noshowmode
set      noruler
set      smartcase
set      guioptions-=m
set      guioptions-=T
set      guioptions-=r
set      encoding=utf-8
set      updatetime=300
set      backspace=indent,eol,start
set      hidden
set      complete-=i
set      nrformats-=octal
set      ttimeout
set      ttimeoutlen=100
set      incsearch
set      laststatus=2
set      display+=lastline
set      autoread
set      cursorline
set      cursorlineopt=number
set      wrap linebreak
set      showbreak=" "
set      wildmode=longest,full
set      noerrorbells
set      modeline
set      foldmethod=indent
set      foldnestmax=3
set      nofoldenable
set      mouse=a
set      shortmess+=A
set      hlsearch
set      iskeyword+=-
set      wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set      wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set      wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set      wildignore+=*.swp,*~,._*
set      title
set      splitright
set      splitbelow
set      shortmess+=I
set      magic
set      showmatch
set      mat=2
set      novisualbell
set      regexpengine=0
set      background=dark
set      ffs=unix,dos,mac
" Avoids swapfiles in current directory
if &directory =~# '^\.,'
  if !empty($HOME)
    if has('win32')
      let &directory = expand('$HOME/vimfiles') . '//,' . &directory
    else
      let &directory = expand('$HOME/.vim') . '//,' . &directory
    endif
  endif
  if !empty($XDG_DATA_HOME)
    let &directory = expand('$XDG_DATA_HOME') . '//,' . &directory
  endif
  if has('macunix')
    let &directory = expand('$HOME/Library/Autosave Information') . '//,' . &directory
  endif
endif

try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

vmap j gj
vmap k gk
nmap j gj
nmap k gk

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

nnoremap n nzz
nnoremap N Nzz
" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &t_Co == 8 && $TERM !~# '^Eterm'
  set t_Co=16
endif

nnoremap & :&&<CR>
xnoremap & :&&<CR>
nnoremap Y y$

let mapleader = "\<Space>"
call plug#begin()
Plug 'valloric/youcompleteme'
" Plug 'rust-lang/rust.vim'
Plug 'romainl/vim-cool'
Plug 'junegunn/vim-easy-align'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
" Plug 'racer-rust/vim-racer'
Plug 'fidian/hexmode'
Plug 'jiangmiao/auto-pairs'
Plug 'rose-pine/vim'
call plug#end()

if !has('gui_running')
   set t_Co=256
endif
if has("gui_running")
  set guifont=Iosevka\ NFM\ Medium:h15
  set t_Co=256
  set guitablabel=%M\ %t
endif
nnoremap <C-t> :NERDTreeToggle<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

let g:ycm_rust_toolchain_root = "C:/Users/Vasilis/scoop/persist/rustup/.rustup/toolchains/"
let g:ycm_language_server = 
  \ [ 
  \   {
  \     'name': 'rust',
  \     'cmdline': [ 'rust-analyzer' ],
  \     'filetypes': [ 'rust' ],
  \     'project_root_files': [ 'Cargo.toml' ]
  \   }
  \ ]

let g:ycm_auto_trigger = 1

augroup MyYCMCustom
  autocmd!
  autocmd FileType c,cpp,rust let b:ycm_hover = {
    \ 'command': 'GetDoc',
    \ 'syntax': &filetype,
    \ 'popup_params': {
    \     'maxwidth': 80,
    \     'border': [],
    \     'borderchars': ['─', '│', '─', '│', '┌', '┐', '┘', '└'],
    \   },
    \ }
augroup END

let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

silent! colorscheme rosepine_moon
