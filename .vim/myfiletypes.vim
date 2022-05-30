"File name : $HOME/vim/myfiletypes.vim
" myfiletypefile
augroup filetype
        au! BufRead,BufNewFile *.phc    set filetype=php
        au! BufRead,BufNewFile *.mine   set filetype=mine
        au! BufRead,BufNewFile *.xyz    set filetype=drawing
        au! BufRead,BufNewFile *.prc    set filetype=plsql
augroup END
