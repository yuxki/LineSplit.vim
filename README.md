# Introduction
```LineSplit.vim``` splits a single line into multiple lines by the demiliter(separator).
```
 hello

 :LineSplit \w

 h
 e
 l
 l
 o
```
Actually you may just replace this plugin by a bellow command.
```
 :command -nargs=1 LineSplit s/\(<args>\)/\1\r/g
```

But since it presses <Enter> after {separator}, not substitute, it may keep indent.
# Usage
Point cursor to a line and Run this command to split it by default separator.
```
 :LineSplit
```
Note: Refer *g:linesplit_default_separator* about default separator.

You can specifiy a separator by no quotation, single quotation, double
quotation. There is no difference by each pattern.
```
 :LineSplit ,
 :LineSplit ","
 :LineSplit ','
```
You can also use regular expression.
```
 :LineSplit \s\+
```

# Examples
Set default separator and map any key at your ```vimrc```.
```
 g:linesplit_default_separator = ","
 nnoremap <C-S> :LineSplit<CR>
```
# Testing
Run this command.
```
  vim +":call LineSplit#test#run()"
```
If all test is passed, it prints "OK".
