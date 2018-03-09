"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set nobomb

"" Fix backspace indent
set backspace=indent,eol,start

"" Enable hidden buffers
set nohidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

"" Show commands
set showcmd

"" Copy/Paste/Cut
set clipboard=unnamed,unnamedplus

"" Splitting
set splitright
set splitbelow

"" Round indent to multiple of 'shiftwidth'
set shiftround

"" Automatically reload and write file
set autoread
set autowrite

"" Wildmode
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

"" Load plugins
filetype plugin indent on
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

"" Visual Settings
set t_Co=256
set tabstop=2
set shiftwidth=2
set expandtab
syntax on
set ruler
set number
set colorcolumn=80

"colorscheme cobalt2
set background=dark
colorscheme solarized

set mouse=a
set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set gfn=Monospace\ 12
set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h12

"" Map leader to ,
let mapleader=','

"" Split
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" pbcopy for OSX copy/paste
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>

"" Close buffer
noremap <leader>d :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
