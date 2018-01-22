set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|.gem)|(\.(swp|tox|ico|git|hg|svn))$'
let g:ctrlp_user_command = 'ag %s --files-with-matches --nocolor --hidden -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'

noremap <leader>b :CtrlPBuffer<CR>
