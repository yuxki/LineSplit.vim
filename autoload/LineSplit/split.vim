" ============================================================
" Filename: split.vim
" Author: yuxki
" License: MIT License
" Last Change: 2021/12/08 12:46:03
" ============================================================

let s:save_cpo = &cpo
set cpo&vim

function! LineSplit#split#_split(separator) abort
  execute "normal ^"
  let s:matches = []
  let s:end_pos = getpos('.')[2] - 1

  while 1
    let s:pos = matchend(getline('.'), a:separator, s:end_pos)
    if s:pos < 0
      break
    endif
    let s:end_pos = s:pos
    let s:matches = add(s:matches, s:pos)
  endwhile

  for m in s:matches
    execute "normal ^"
    let s:pos = matchend(getline('.'), a:separator)
    call cursor(getcurpos()[1],s:pos)
    execute "normal a\<CR>\<Esc>"
  endfor
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
