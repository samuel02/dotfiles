
filetype plugin indent on
call plug#begin(expand('~/.vim/bundle'))
  " Plug 'edkolev/tmuxline.vim'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'AndrewRadev/switch.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'chentau/marks.nvim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'dense-analysis/ale'
  Plug 'folke/which-key.nvim'
  Plug 'gennaro-tedesco/nvim-peekup'
  Plug 'haya14busa/incsearch.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/vim-journal'
  Plug 'junegunn/vim-peekaboo'
  Plug 'junegunn/vim-slash'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'machakann/vim-highlightedyank'
  Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
  Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'octol/vim-cpp-enhanced-highlight'
  Plug 'qpkorr/vim-bufkill'
  Plug 'raimondi/delimitmate'
  Plug 'ryanoasis/vim-devicons'
  Plug 'schickling/vim-bufonly'
  Plug 'scrooloose/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sleuth'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'vim-scripts/scons.vim'
  Plug 'vim-test/vim-test'
  Plug 'wincent/terminus'
call plug#end()

set ignorecase
set smartcase
set clipboard=unnamed,unnamedplus
set splitright
set splitbelow
set shiftround
set autowrite
set autoread
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
set complete+=kspell
set tags^=./.git/tags;tags
set mouse=a
set mousemodel=popup
set grepprg=rg\
            \ --hidden\
            \ --glob\ '!.git'\
            \ --glob\ '!tags'\
            \ --vimgrep\
            \ --with-filename
set grepformat=%f:%l:%c:%m
set nojoinspaces
set lazyredraw
set laststatus=2 " always display statusline
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set expandtab
set number
set colorcolumn=100
set shortmess=aoOtsT
colorscheme onehalflight
set background=light
set ttimeoutlen=50
set breakindent
set showbreak=\ +
set backupdir=/tmp//,.
set directory=/tmp//,.

" Semi-persistent undo
if has('persistent_undo')
  set undodir=/tmp,.
  set undofile
endif

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

"" Map leader to ,
let mapleader=','

"" Reload config
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<cr>

"" Split
set splitright
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"" Buffer nav
noremap <leader>q :bp<CR>
noremap <leader>w :bn<CR>
noremap <leader>d :BD<CR>

"" incsearch
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

"" airline
let g:airline_theme = 'onehalflight'
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

nnoremap <leader>e <cmd>Telescope find_files<cr>
nnoremap <leader>b <cmd>Telescope buffers<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>t <cmd>Telescope tags<cr>

"" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeShowBookmarks=0
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize = 40
let NERDTreeMinimalUI=1

noremap <Leader>n :NERDTreeToggle<CR>

"" vim-test
let test#strategy = 'dispatch'
let g:test#javascript#runner = 'jest'

map <Leader>r :TestFile<CR>
map <Leader>s :TestNearest<CR>
map <Leader>l :TestLast<CR>
map <Leader>a :TestSuite<CR>

"" ALE
let g:ale_open_list = 1
let g:ale_sign_column_always = 1
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1
let g:ale_fixers_explicit = 1

let g:ale_linters = {
\   'javascript': ['eslint', 'tsserver'],
\   'ruby': ['standard'],
\   'sh': ['shellcheck'],
\   'vim': ['vint'],
\}

let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\   'javascript': ['eslint'],
\   'ruby': ['standard'],
\   'json': ['jq'],
\}

nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"" splitjoin.vim
let g:splitjoin_trailing_comma = 1
let g:splitjoin_ruby_hanging_args = 0
let g:splitjoin_ruby_curly_braces = 0
let g:splitjoin_ruby_options_as_arguments = 1

function! s:try(cmd, default)
  if exists(':' . a:cmd) && !v:count
    let tick = b:changedtick
    execute a:cmd
    if tick == b:changedtick
      execute 'normal! '. a:default
    endif
  else
    execute 'normal! '. v:count . a:default
  endif
endfunction

nnoremap <silent> gJ :<C-U>call <SID>try("SplitjoinJoin", "gJ")<CR>
nnoremap <silent> J :<C-U>call <SID>try("SplitjoinJoin", "J")<CR>
nnoremap <silent> gS :<C-U>call <SID>try("SplitjoinSplit", "S")<CR>
nnoremap <silent> S :<C-U>call <SID>try("SplitjoinSplit", "S")<CR>

"" surround.vim
let g:surround_{char2nr("#")} = "#{\r}"

"" fzf.vim
let g:fzf_colors =
\ { 'fg':         ['fg', 'Normal'],
  \ 'bg':         ['bg', 'Normal'],
  \ 'preview-bg': ['bg', 'NormalFloat'],
  \ 'hl':         ['fg', 'Comment'],
  \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':        ['fg', 'Statement'],
  \ 'info':       ['fg', 'PreProc'],
  \ 'border':     ['fg', 'Ignore'],
  \ 'prompt':     ['fg', 'Conditional'],
  \ 'pointer':    ['fg', 'Exception'],
  \ 'marker':     ['fg', 'Keyword'],
  \ 'spinner':    ['fg', 'Label'],
  \ 'header':     ['fg', 'Comment'] }

"" Undotree
let g:undotree_WindowLayout = 2
nnoremap U :UndotreeToggle<CR>)

"" switch
let g:switch_mapping = '-'

"" tagbar
let g:tagbar_sort = 0

augroup vimrc_help
  autocmd!
  autocmd BufEnter *.txt if &buftype == 'help' | wincmd L | endif
augroup END
