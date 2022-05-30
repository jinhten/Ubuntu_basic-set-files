"--------------------------------------------------------------------------------
"
" P4Revert (Front Function)
" cli: p4 revert filename
"
"-------------------------------------------------------------------------------
function! P4Revert()
    let output = P4ShellCurrentBuffer('revert')
    if v:shell_error
        call P4err('p4 revert unable')
        return 1
    endif
    sile! setlocal noreadonly autoread modifiable
    call P4msg('File revert success.')
endfunction

"--------------------------------------------------------------------------------
"
" P4Edit (Front Function)
" cli: p4 edit filename
"
"-------------------------------------------------------------------------------
function! P4Edit()
    let output = P4ShellCurrentBuffer('edit')
    if v:shell_error
        call P4err('Unable to open file for edit.')
        return 1
    endif
    silent! setlocal noreadonly autoread modifiable
    call P4msg('File open for edit.')
endfunction

"--------------------------------------------------------------------------------
"
" P4ShellCurrentBuffer (Middle Function)
" cli: p4 xxx filename
"
"-------------------------------------------------------------------------------
function! P4ShellCurrentBuffer(cmd, ...)
    let filename = shellescape(expand('%:p""'))
    return call('P4Shell', [a:cmd . ' ' . filename] + a:000)
endfunction

"--------------------------------------------------------------------------------
"
" P4Shell (Main Function)
" cli: p4 xxx
"
"-------------------------------------------------------------------------------
function! P4Shell(cmd, ...)
    return call('system', ['p4' . ' ' . a:cmd] + a:000)
endfunction

"--------------------------------------------------------------------------------
" P4msg / P4err (print)
"-------------------------------------------------------------------------------
function! P4msg(string) abort
    echomsg 'vim-perforce: ' . a:string
endfunction

function! P4err(string) abort
     echoerr 'vim-perforce: ' . a:string
endfunction
