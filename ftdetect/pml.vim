autocmd BufNewFile,BufRead *.pml
      \ if &ft =~# '^\%(promela\)$' |
      \   set ft=pml |
      \ else |
      \   setf pml |
      \ endif
au BufRead,BufNewFile *.pml filetype plugin on
au BufRead,BufNewFile *.pml filetype indent on
au BufRead,BufNewFile *.pml syntax on
if has("autocmd") && exists("+omnifunc")
    au BufRead,BufNewFile *.pml 
\ if &omnifunc == "" |
\ setlocal omnifunc=syntaxcomplete#Complete |
\ endif
endif
au BufRead,BufNewFile *.pml set filetype=xml
au BufRead,BufNewFile *.pml XMLns pml
au BufRead,BufNewFile *.pml AcpEnable
