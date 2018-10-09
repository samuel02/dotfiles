let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier'],
\   'html': ['prettier'],
\   'ruby': ['rufo']
\}
