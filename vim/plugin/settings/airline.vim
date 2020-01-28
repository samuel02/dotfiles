let g:airline_theme = 'solarized'
let g:airline_skip_empty_sections = 1

let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#coc#enabled = 1
let g:airline#extensions#branch#enabled = 1

let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_symbols.linenr    = '␊'
let g:airline_symbols.branch    = '⎇'
let g:airline_symbols.paste     = 'ρ'
let g:airline_symbols.paste     = 'Þ'
let g:airline_symbols.paste     = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_powerline_fonts = 1
let g:airline_left_sep          = '▶'
let g:airline_left_alt_sep      = '»'
let g:airline_right_sep         = '◀'
let g:airline_right_alt_sep     = '«'
