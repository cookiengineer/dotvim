" Author:      Artificial Engineering (http://artificial.engineering)
" Description: ALE Plugin for lychee.js Strainer

function! ale_linters#javascript#strainer#Handle(buffer, lines) abort

    " Matches patterns line the following:
    "
    " /path/to/some-filename.js:13:37: Missing trailing comma. [warning/comma-dangle]
    " /path/to/some-filename.js:13:37: Invalid return value for method \"init()\". [no-return-value]
    " /path/to/some-filename.js:13:37: Invalid parameter values for \"id\" for method \"setState()\". [no-parameter-value]

    let l:pattern = '^.*:\(\d\+\):\(\d\+\): \(.\+\) \[\(.\+\)\]$'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, [l:pattern])
        let l:text = l:match[3]

        " Take the error type from the output if available
        if !empty(l:match[4])
            let l:text .= ' [' . l:match[4] . ']'
        endif

        call add(l:output, {
        \    'bufnr': a:buffer,
        \    'lnum': l:match[1] + 0,
        \    'col': l:match[2] + 0,
        \    'text': l:text,
        \    'type': 'E',
        \})

    endfor

    return l:output
endfunction

function! ale_linters#javascript#strainer#Command(buffer)
    return "/bin/bash /usr/local/bin/lycheejs-strainer-fixer %s"
endfunction

call ale#linter#Define('javascript', {
\   'name': 'strainer',
\   'executable': 'lycheejs-strainer-fixer',
\   'command_callback': 'ale_linters#javascript#strainer#Command',
\   'output_stream': 'stdout',
\   'callback': 'ale_linters#javascript#strainer#Handle',
\})

