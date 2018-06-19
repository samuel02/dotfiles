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
  \       --no-ignore
  \       --hidden
  \       --follow
  \       --glob "!.git/*"
  \       --glob "!.gem/*"
  \       --glob "!node_modules/*"
  \       --glob "!tmp/*"
  \       --glob "!coverage/*"
  \       --color=always ' . <q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
