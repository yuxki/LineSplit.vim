let s:save_cpo = &cpo
set cpo&vim

" clean param passed by command to pass it to function
function! s:clean_param(raw_param)
  " initialize
  let s:cleaned_param = a:raw_param

  " remove excess spaces
  let s:cleaned_param = substitute(s:cleaned_param, '\s*$', '\1', '')

  " remove single/double quotes covering cleaned_param
  let s:quotes = substitute(s:cleaned_param, '\(^.\).*\(.$\)', '\1\2', '')
  if s:quotes == "''" || s:quotes == '""'
    let s:cleaned_param = substitute(s:cleaned_param, '^.\(.*\).$', '\1', '')
  endif

  return s:cleaned_param
endfunction

function! LineSplit#split(separator='') abort
  " it does not support multiline formatting
  if a:firstline != a:lastline
    echo "Multiple line does not support"
    return
  endif

  " initialize separator
  let s:separator = s:clean_param(a:separator)

  " use default separator
  if s:separator == ""
    if !exists('g:linesplit_default_separator')
      let g:linesplit_default_separator = ","
    endif
    let s:separator = g:linesplit_default_separator
  endif

  call LineSplit#split#_split(s:separator)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
