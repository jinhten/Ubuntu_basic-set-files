
"--------------------------------------------------------------------------------
" Xpath_line (execute Xpath)
"-------------------------------------------------------------------------------
function! Xpath_line()
    let linebuf = Xpath_get_xml()
    let linebuf = getline('.')
    let dictionary = split(linebuf, " ")
   for i in dictionary
       if (stridx(tolower(i), "href") != -1)
           let sPos = stridx(i, "\"")+1
           let ePos = stridx(i, "\"", sPos+1)
           let file = strpart(i, sPos, ePos-sPos)
       elseif (stridx(tolower(i), "xpointer") != -1)
           let sPos = stridx(i, "(") +1
           let ePos = stridx(i, ")", sPos+1)
          let fullword = strpart(i, sPos, ePos-sPos)
          let wordDic = split(fullword, "/")
          let length = len(wordDic)
          let word = wordDic[length-2]
       endif
   endfor

   silent! execute ":e " . file
   silent! execute "/". word
   echomsg 'XpathGo: open file ' . file . "::" . word
endfunction
"--------------------------------------------------------------------------------
" Xpath_parse (string parsing)
"-------------------------------------------------------------------------------
function! Xpath_parse(string)
    let file = Xpath_get_filename(a:string);
    let word = Xpath_get_word(a:string);
    return Xpath_open(file, word)
endfunction
"--------------------------------------------------------------------------------
" Xpath_get_xml (get string)
"-------------------------------------------------------------------------------
function! Xpath_parse(string)
    let dictionary = split(a:string, " ")
    for i in dictionary
        if (stridx(tolower(i), "href") != -1)
            let sPos = stridx(i, "\"")
            let ePos = stridx(i, "\"", sPos+1)
            return strpart(i, sPos+1, ePos)
        endif
    endfor
endfunction
"--------------------------------------------------------------------------------
" Xpath_get_xml (get string)
"-------------------------------------------------------------------------------
function! Xpath_parse(string)
    let dictionary = split(a:string, " ")
    for i in dictionary
        if (stridx(tolower(i), "xpointer") != -1)
            let sPos = stridx(i, "(") 
            let ePos = stridx(i, ")", sPos+1)
            return strpart(i, sPos+1, ePos)
        endif
    endfor
endfunction
"--------------------------------------------------------------------------------
" Xpath_get_xml (get string)
"-------------------------------------------------------------------------------
function! Xpath_get_xml()
    return Xpath_parse(getline('.'))
endfunction
"--------------------------------------------------------------------------------
" Xpath_open (open file)
"-------------------------------------------------------------------------------
function! Xpath_open(file, word)
    silent! execute ":e " . a:file
    search(a:word)
    echomsg 'XpathGo: open file ' . a:file . "::" . a:word
endfunction
