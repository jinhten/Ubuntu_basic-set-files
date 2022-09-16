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


" vim 자동완성

"complete 옵션
":set complete?
"complete=.,w,b,u,t,i
" .: 현재 편집중인 버퍼의 모든 단어를 자동완성 소스로 사용한다.
" w: vim에 현재 열려 있는 window들의 모든 단어를 사용한다.
" b: 버퍼 리스트에 있고 로드된 버퍼들의 모든 단어를 사용한다.
" u: 버퍼 리스트에 있고 로드되지 않은 버퍼들의 모든 단어를 사용한다.
" t: tag completion을 사용한다. ctags를 사용한다면 당연한 설정.
" i: 현재 파일과 include된 파일의 단어를 사용한다.
" :help complete로 확인.

" https://johngrib.github.io/wiki/vim/auto-completion/


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

"set tags+=$HOME/mycode/opensource/libquic/tags
set tags+=$HOME/mycode/opensource/msquic/src/tags
set tags+=$HOME/mycode/quic/tags
"set tags+=$HOME/mycode/test/tags
"set tags+=/p4ws/zibServer/ZibRTC/tags
set tags+=/p4ws/zibServer/km7/tags
set tags+=/p4ws/zibServer/zibLinux/tags
"set tags+=/p4ws/zibServer/ZibNet_Linux/tags
"set tags+=/p4ws/zibServer/ZibRTC_Linux/tags

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

