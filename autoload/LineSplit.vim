let s:save_cpo = &cpo
set cpo&vim

function! LineSplit#split(separator) abort
  " it does not support multiline formatting
  if a:firstline != a:lastline
    echo 'Multiple line does not support'
    return
  endif

  let s:separator = a:separator
  " use default separator
  if s:separator == ""
    if !exists("g:linesplit_default_separator")
      let g:linesplit_default_separator = ","
    endif
    let s:separator = g:linesplit_default_separator
  endif

  call LineSplit#split#_split(s:separator)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
