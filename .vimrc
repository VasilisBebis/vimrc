filetype on
filetype plugin on
filetype plugin indent on
syntax   on
syntax   enable
set      number
set      tabstop=2
set      shiftwidth=2
set      softtabstop=2
set      expandtab
set      wildmenu
set      clipboard=unnamedplus
set      signcolumn=yes
set      noshowmode
set      noruler
set      smartcase
set      guioptions-=m
set      guioptions-=T
set      guioptions-=r
set      encoding=utf-8
set      updatetime=300

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'romainl/vim-cool'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/everforest'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
" Plug 'jiangmiao/auto-pairs' Use coc-pairs instead
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

set laststatus=2
" export TERM=xterm-256color
if !has('gui_running')
   set t_Co=256
endif
if has("gui_running")
  set guifont=Fira\ Mono\ Medium:h15
endif
nnoremap <C-t> :NERDTreeToggle<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
silent! colorscheme everforest
