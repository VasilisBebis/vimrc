filetype on
filetype plugin on
syntax   on
set      number
set      tabstop=2
set      shiftwidth=2
set      softtabstop=2
set      expandtab
set      wildmenu
set      clipboard=unnamedplus

call plug#begin()
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/everforest'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'ervandew/supertab'
Plug 'jiangmiao/auto-pairs'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
call plug#end()

set laststatus=2
export TERM=xterm-256color
if !has('gui_running')
   set t_Co=256
endif
set noshowmode
set smartcase
nnoremap <C-t> :NERDTreeToggle<CR>
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
silent! colorscheme everforest
