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
set backupskip=/tmp/*,/private/tmp/*

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

"" Completion
set complete+=kspell
set complete-=i
set wildmode=list,full

"" Undo
set undodir=~/.cache/vim/undo//
set undofile

if !isdirectory(expand(&undodir))
  call mkdir(expand(&undodir), 'p')
endif

" Enforce italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Set different cursors for insert, replace, and normal mode.
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" When the type of shell script is /bin/sh, assume a POSIX-compatible shell for
" syntax highlighting purposes.
" More on why: https://github.com/thoughtbot/dotfiles/pull/471
let g:is_posix = 1

"" Tags
set tags^=./.git/tags;tags

"" Mouse
set mouse=a
set mousemodel=popup
set guioptions=egmrti
set guifont=MesloLGLDZ\ Nerd\ Font:h12

if executable('rg')
  set grepprg=rg\
        \ --hidden\
        \ --glob\ '!.git'\
        \ --glob\ '!tags'\
        \ --vimgrep\
        \ --with-filename
  set grepformat=%f:%l:%c:%m
else
  set grepprg=grep\ -rnH\ --exclude-dir\ .git\ $*\ /dev/null
endif

"" Load plugins
filetype plugin indent on

call plug#begin(expand('~/.vim/bundle'))
  Plug '/usr/local/opt/fzf'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'dense-analysis/ale'
  Plug 'direnv/direnv.vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'junegunn/fzf.vim'
  Plug 'machakann/vim-highlightedyank'
  Plug 'qpkorr/vim-bufkill'
  Plug 'raimondi/delimitmate'
  Plug 'rakr/vim-one'
  Plug 'ryanoasis/vim-devicons'
  Plug 'schickling/vim-bufonly'
  Plug 'scrooloose/nerdtree'
  Plug 'sheerun/vim-polyglot'
  Plug 'tmux-plugins/vim-tmux'
  Plug 'tpope/vim-abolish'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-dispatch'
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

runtime macros/matchit.vim

"" Appearance
set display=lastline " display as much as possible of last line
set laststatus=2 " always display statusline
set signcolumn=yes " always show signcolumns
set showcmd " Show (partial) command in the last line of the screen
set cmdheight=2
set lazyredraw
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set t_Co=256
set expandtab
syntax enable
set ruler
set number
set numberwidth=5
set colorcolumn=100
set shortmess=aoOtsT
colorscheme one
set background=light
set ttimeout
set ttimeoutlen=50
set breakindent
set showbreak=\ +


"" Map leader to ,
let mapleader=','

"" Split
set splitright
noremap <leader>h :<C-u>split<CR>
noremap <leader>v :<C-u>vsplit<CR>

"" pbcopy for OSX copy/paste
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

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
let g:airline_theme = 'one'
let g:airline#extensions#ale#enabled = 1

"" fzf
let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1

noremap <leader>e :Files<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>t :BTags<CR>
noremap <leader>f :Rg <C-R><C-W><CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column
  \       --line-number
  \       --no-heading
  \       --ignore-case
  \       --hidden
  \       --follow
  \       --color=always ' . <q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

augroup FZF
  autocmd!

  autocmd FileType help
        \ if executable("fzf") |
        \   nnoremap <buffer> <Space>] :FZFHelptags<CR> |
        \ else |
        \   nnoremap <buffer> <Space>] :tag<Space> |
        \ endif
  autocmd FileType fzf
        \ set laststatus=0 noshowmode noruler
        \ |
        \ autocmd BufLeave <buffer> set laststatus=2 showmode ruler
augroup END


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
let g:surround_{char2nr("s")} = " \r"
let g:surround_{char2nr("S")} = "\r "
