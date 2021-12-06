" ============================================================
" Filename: plugin/LineSplit.vim
" Author: yuxki
" License: MIT License
" Last Change: 2021/12/04 06:54:41
" ============================================================

if exists('g:loaded_comma_splitor')
  finish
endif
let g:loaded_comma_splitor = 1

let s:save_cpo = &cpo
set cpo&vim

if !exists(':LineSplit')
  command -nargs=? LineSplit call LineSplit#split("<args>")
endif

let &cpo = s:save_cpo
unlet s:save_cpo
