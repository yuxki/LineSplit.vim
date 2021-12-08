function! LineSplit#test#test_split#test_split_specified()
  " expectation
  let s:test_split_specified_expectation = ["1a", "2a", "3"]

  " get result
  let s:test_split_specified_sub_cases = [
        \  {'command': "LineSplit a", 'msg': "no quotation"},
        \  {'command': "LineSplit 'a'", 'msg': "single quotation"},
        \  {'command': "LineSplit \"a\"", 'msg': "double quotation"}]

  for sub_case in s:test_split_specified_sub_cases
    " setup
    execute "normal I1a2a3\<Esc>"

    " get result
    execute sub_case['command']
    let s:test_split_specified_result = getline(1, 3)

    "assert
    call assert_equal(s:test_split_specified_expectation,
                    \ s:test_split_specified_result,
                    \ "Subcase " . sub_case['msg'])

    "tear down
    execute "1,$d"
  endfor
endfunction

function! LineSplit#test#test_split#test_split_default()
  " expectation
  let s:test_split_default_expectation = ["1,", "2,", "3"]

  " setup
  execute "normal I1,2,3\<Esc>"

  " get result
  execute "LineSplit"
  let s:test_split_default_result = getline(1, 3)

  "assert
  call assert_equal(s:test_split_default_expectation, s:test_split_default_result)

  "tear down
  execute "1,$d"
endfunction

function! LineSplit#test#test_split#run()
  call LineSplit#test#test_split#test_split_specified()
  call LineSplit#test#test_split#test_split_default()
endfunction
