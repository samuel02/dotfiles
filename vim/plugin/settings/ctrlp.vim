let g:ctrlp_user_command = 'ag %s --files-with-matches --nocolor --hidden --skip-vcs-ignores --ignore ".gem" -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'

noremap <leader>b :CtrlPBuffer<CR>
