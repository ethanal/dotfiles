let g:ctrlp_map = '<leader>p'
let g:ctrlp_types = ['fil']
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = {'dir': '\.git$\|node_modules$\|vendor$'}

let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif
