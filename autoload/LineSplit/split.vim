" ============================================================
" Filename: split.vim
" Author: yuxki
" License: MIT License
" Last Change: 2021/12/04 06:54:41
" ============================================================

let s:save_cpo = &cpo
set cpo&vim

" it splits single line into mutiple line by delimiter(separator)
function! LineSplit#split#_split(separator) abort
  try
    execute "s/" . a:separator . "/" . a:separator ."\r/g"
  catch /E486:/
    echo a:separator . " not found in" getline(".")
  endtry
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

