" Load guard
if ( exists('g:loaded_ctrlp_git') && g:loaded_ctrlp_git )
	\ || v:version < 700 || &cp
	finish
endif
let g:loaded_ctrlp_git = 1


" Add this extension's settings to g:ctrlp_ext_vars
"
" Required:
"
" + init: the name of the input function including the brackets and any
"         arguments
"
" + accept: the name of the action function (only the name)
"
" + lname & sname: the long and short names to use for the statusline
"
" + type: the matching type
"   - line : match full line
"   - path : match full line like a file or a directory path
"   - tabs : match until first tab character
"   - tabe : match until last tab character
"
" Optional:
"
" + enter: the name of the function to be called before starting ctrlp
"
" + exit: the name of the function to be called after closing ctrlp
"
" + opts: the name of the option handling function called when initialize
"
" + sort: disable sorting (enabled by default when omitted)
"
" + specinput: enable special inputs '..' and '@cd' (disabled by default)
"
call add(g:ctrlp_ext_vars, {
	\ 'init': 'ctrlp#git#init()',
	\ 'accept': 'ctrlp#acceptfile',
	\ 'lname': 'recent git files',
	\ 'sname': 'git',
	\ 'type': 'path',
	\ 'nolim': 1,
	\ 'opmul': 1,
  \ 'sort': 0,
	\ 'specinput': 1,
	\ })


" Provide a list of strings to search in
"
" Return: a Vim's List
"
function! ctrlp#git#init()
	" Return the list of recently modified or dirty files in git

	let recently_modified = systemlist('git diff --name-only HEAD')
	let dirty_files = systemlist('git status --porcelain | cut -c4-')
	let all_files = recently_modified + dirty_files

	let prefix = system('git rev-parse --path-format=relative --show-toplevel')
	let prefix = substitute(prefix, '\n$', '', '')
	let prefix = substitute(prefix, '^./', '', '')
	let root_rel_paths = map(all_files, 'prefix . v:val')
	let rel_paths = map(root_rel_paths, 'fnamemodify(v:val, ":.")')

	return uniq(reverse(sort(rel_paths)))


endfunction

" Give the extension an ID
let s:id = g:ctrlp_builtins + len(g:ctrlp_ext_vars)

" Allow it to be called later
function! ctrlp#git#id()
	return s:id
endfunction
