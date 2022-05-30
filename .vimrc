set nowrap
set nu
set ci
set si
set ai
set sw=4
set ts=4
au Bufenter *.\(c\|cpp\|h\|xml\|proto\|yang\|json\|html\) set et

set paste
set backspace=2
set tabstop=4
set showmatch
syntax on
filetype on

"============================================================
""Plugin
"============================================================
""Tag List
filetype on "vim filetype on
      nmap <F7> :TlistToggle<CR> "F7 key = Tag List Toggling
      let Tlist_Ctags_Cmd = "/usr/bin/exctags"
      let Tlist_Inc_Winwidth = 0 "window width change off
      let Tlist_Exit_OnlyWindow = 0
      let Tlist_Auto_Open = 0
      let Tlist_Use_Right_Window = 1

" 
map <F5> :call P4Edit()<CR>
map <F6> :call P4Revert()<CR>

" Doxygen Toolkit
map <F8> :Dox<cr>

"set fileencoding=korea
set fileencodings=utf8,korea

set hlsearch
set laststatus=2
set t_Co=256

"set tags+=$HOME/mycode/http3/opensource/libquic/tags
"set tags+=$HOME/mycode/http3/opensource/msquic/src/tags
"set tags+=$HOME/mycode/quic/tags
"set tags+=$HOME/mycode/test/tags
set tags+=$HOME/zibsvr/ZibRTC/tags
set tags+=$HOME/zibsvr/ZibWindows/tags
set tags+=$HOME/zibsvr/ZibWindows_Linux/tags

colorscheme molokai
if v:version >= 700
"연보라 하늘색 주황색
"    source ~/ETC/vimcolors/jellybeans.vim
"빨강 보라
"    source ~/ETC/vimcolors/molokai.vim
"    source ~/ETC/vimcolors/monokai-soda.vim
"    source ~/ETC/vimcolors/monokai1.vim
"    source ~/ETC/vimcolors/monokai2.vim
endif

