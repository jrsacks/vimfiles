" vim: set noet nosta sw=4 ts=4 fdm=marker :
"
" RubySource
" "Ben Rady" <benrady@gmail.com>
"

function! OpenRubySource()
  let class_name = tolower(expand("<cfile>"))
  let ruby_file = system("gem which ".class_name)
  exec "tabe ".ruby_file
endfunction

nmap <Leader>v :call OpenRubySource()<cr>
