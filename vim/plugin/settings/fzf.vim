let g:fzf_layout = { 'down': '~20%' }
let g:fzf_buffers_jump = 1

noremap <leader>e :Files<CR>
noremap <leader>b :Buffers<CR>
noremap <leader>f :Rg<CR>
noremap <leader>fp :Rg!<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!.gem/*" --glob "!node_modules/*" --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
