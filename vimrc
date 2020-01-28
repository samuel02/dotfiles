"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set nobomb

"" Enable hidden buffers
set hidden

"" Searching
set incsearch
set ignorecase
set smartcase
set hlsearch

"" Backup and swap
set nobackup
set nowritebackup
set noswapfile

"" Show commands
set showcmd
set cmdheight=1

"" don't give |ins-completion-menu| messages.
set shortmess+=c

"" always show signcolumns
set signcolumn=yes

"" Copy/Paste/Cut
set clipboard=unnamed,unnamedplus

"" Splitting
set splitright
set splitbelow

"" Indentation
set backspace=indent,eol,start
set shiftround
set autoindent

"" Automatically reload and write file
set autoread
set autowrite

"" Wildmode
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

"" Load plugins
filetype plugin indent on

if &compatible
  set nocompatible
end

"" Enable ALE completion
let g:ale_completion_enabled = 1

call plug#begin(expand('~/.vim/bundle'))
Plug '/usr/local/opt/fzf'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'haya14busa/incsearch.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'ryanoasis/vim-devicons'
Plug 'schickling/vim-bufonly'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/gitignore'
Plug 'w0rp/ale'
Plug 'wincent/terminus'
Plug 'vim-scripts/scons.vim'
Plug 'vim-scripts/Scons-compiler-plugin'
Plug 'xavierd/clang_complete'
call plug#end()

runtime macros/matchit.vim

"" Visual Settings
set t_Co=256
set expandtab
syntax enable
set ruler
set number
set colorcolumn=100

set background=dark
colorscheme solarized

set mouse=a
set mousemodel=popup
set guioptions=egmrti
set gfn=Monospace\ 12
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12

"" Map leader to ,
let mapleader=','

"" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"" pbcopy for OSX copy/paste
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
noremap <leader>d :bd<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Searching
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
