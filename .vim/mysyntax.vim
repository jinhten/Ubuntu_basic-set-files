if has("syntax")
	if !exists("did_my_syntax_inits")
		let did_my_syntax_inits = 1

		hi Normal  term=NONE cterm=NONE ctermfg=white gui=NONE guifg=white guibg=#343328
		hi Comment term=NONE cterm=NONE ctermfg=Cyan  gui=NONE guifg=Cyan
		hi Visual     term=reverse cterm=reverse ctermfg=black gui=NONE guifg=black guibg=gray85
		hi StatusLine term=bold    cterm=reverse ctermfg=black ctermbg=white gui=reverse guifg=SandyBrown guibg=black
		hi Constant   term=bold    cterm=bold    ctermfg=Cyan    gui=NONE guifg=Cyan
		hi Identifier term=bold    cterm=bold    ctermfg=Yellow     gui=NONE guifg=Yellow
		hi Special    term=bold    cterm=NONE    ctermfg=White      gui=NONE guifg=Orange
		hi Statement  term=bold    cterm=bold    ctermfg=Yellow     gui=NONE guifg=magenta
		hi PreProc    term=bold    cterm=bold    ctermfg=Brown      gui=NONE guifg=SandyBrown
		hi Type       term=bold    cterm=bold    ctermfg=Green      gui=NONE guifg=Green
		hi SpecialKey term=bold    cterm=bold    ctermfg=Green      gui=NONE guifg=Green
		hi Directory  term=bold    cterm=bold    ctermfg=Yellow     gui=NONE guifg=Yellow
		hi MoreMsg    term=bold    cterm=bold    ctermfg=Magenta    gui=NONE guifg=Magenta
		hi Question   term=bold    cterm=bold    ctermfg=Green      gui=NONE guifg=Green
		hi WarningMsg term=bold    cterm=NONE    ctermfg=Yellow     gui=NONE guifg=Red
		hi Error      term=bold    cterm=bold    ctermfg=Red        gui=NONE guifg=black guibg=Red
		hi Todo       term=bold    cterm=NONE    ctermfg=black  ctermbg=Green gui=NONE guifg=black guibg=Orange
		hi Cursor     term=bold    cterm=NONE    ctermfg=white  ctermbg=black gui=NONE guifg=black guibg=salmon
	endif

	syntax keyword gTodo TODO FIXME CAUTION NOTE
	highlight link gTodo Todo

	augroup my_ext_syntax_rc
		au!
		au BufNewFile,BufReadPost * :let usersyntax="$HOME/$RC/" . &ft . ".svim"
		au BufNewFile,BufReadPost * :if file_readable(expand(usersyntax))
		au BufNewFile,BufReadPost * :  execute "source " . expand(usersyntax)
		au BufNewFile,BufReadPost * :endif
		au BufNewFile,BufReadPost * :unlet usersyntax
	augroup END
endif
