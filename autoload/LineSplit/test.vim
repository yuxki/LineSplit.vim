let s:save_cpo = &cpo
set cpo&vim

function! LineSplit#test#run()
  " init errors
  let v:errors = []

  " start tests
  try
    call LineSplit#test#test_split#run()
  catch
    execute "cq!"
  endtry

  if len(v:errors) > 0
    for error in v:errors
      "execute "silent !echo E"
      let s:msg =  escape(error, "#")
      execute "silent !echo " . s:msg
    endfor
    execute "cq!"
  endif

  " end test
  execute "silent !echo \"OK\""
  execute "qall!"
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
