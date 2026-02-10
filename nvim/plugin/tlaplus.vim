autocmd FileType tla setlocal commentstring=\\\*\ %s
autocmd FileType tla set shiftwidth=4

function! TranslateOnSave()
    let l:output = execute("!bash -c \"if grep '\\-\\-algorithm' %; then java pcal.trans -nocfg %; fi\"")

    if v:shell_error == 0
      cclose
    else
        let l:lines = split(l:output, "\n")

        " Remove the first line
        call remove(l:lines, 0)

        " Remove leading whitespace lines
        while len(l:lines) > 0 && l:lines[0] =~# '^\s*$'
            call remove(l:lines, 0)
        endwhile

        let l:qflist = []
        for l:line in l:lines
          let l:match = matchlist(l:line, 'line \(\d\+\), column \(\d\+\).\+')
          if len(l:match) == 0
            call add(l:qflist, {'filename': expand('%:p'), 'text': l:line})
          else
            let l:line_number = match[1]
            let l:column_number = match[2]
            call add(l:qflist, {'filename': expand('%:p'), 'lnum': l:line_number, 'col': l:column_number, 'text': l:line})
          endif
        endfor

        call setqflist(l:qflist)
        copen
    endif
endfunction

autocmd BufWritePost *.tla call TranslateOnSave()
