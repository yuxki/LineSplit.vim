" ============================================================
" Filename: split.vim
" Author: yuxki
" License: MIT License
" Last Change: 2021/12/09 00:07:29
" ============================================================

let s:save_cpo = &cpo
set cpo&vim

function! LineSplit#split#_split(separator) abort
  execute "normal ^"
  let s:matches = []
  let s:start_pos = getpos('.')[2] - 1

  while 1
    let s:end_pos = matchend(getline('.'), a:separator, s:start_pos)
    if s:end_pos < 0
      break
    endif
    let s:start_pos = s:end_pos
    let s:matches = add(s:matches, s:end_pos)
  endwhile

  for m in s:matches
    execute "normal ^"
    let s:end_pos = matchend(getline('.'), a:separator, getpos('.')[2] - 1)
    call cursor(getcurpos()[1] ,s:end_pos)
    if s:end_pos < 0
      break
    endif
    execute "normal a\<CR>\<Esc>"
  endfor
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
