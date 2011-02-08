" F vi
set nocompatible
" no goofy buttons
set guioptions=ac

let mapleader = ","

" Snipmate key settings
let g:SuperTabMappingForward="<c-space>"
let g:SuperTabMappingBackward="<s-space>"

" Replace the selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

nmap <leader>rm :RTmodel <C-r><C-w><CR>:AS<CR>
nmap <leader>rc :RTcontroller <C-r><C-w>s<CR>:AS<CR>

" re-indent the whole file, remove unnecessary whitespace
map <leader>i :call<SID>ReformatAndClean()<CR>

" Open my custom help file
map <leader>c :tabe ~/.vim/doc/cheetSheet.txt<CR>

" Edit or load .vimrc
nmap <silent> ,ev :tabe $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Open snippets directory
map <leader>es :tabe ~/.vim/snippets/<CR>

" Replace tabs with spaces
nmap <silent> ,rr :1,$retab<CR>

" cd to directory of the current file
nmap <silent> ,cd :lcd %:h<CR>

" De-shouldify
:noremap <leader>S :%s/it \"should\s\(\w*\)/it "\1s/gc<CR>

" Move the cursor to the window in the proper direction
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,l :wincmd l<cr>

" Move the cursor to move the window itself
noremap <silent> ,H :wincmd H<cr>
noremap <silent> ,J :wincmd J<cr>
noremap <silent> ,K :wincmd K<cr>
noremap <silent> ,L :wincmd L<cr>

" Replace all instances of the word under the cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Close the window in the proper direction
noremap <silent> ,cj :wincmd j<cr>:close<cr>
noremap <silent> ,ck :wincmd k<cr>:close<cr>
noremap <silent> ,ch :wincmd h<cr>:close<cr>
noremap <silent> ,cl :wincmd l<cr>:close<cr>

" Remap omni-completion to CTRL+Space
nmap <C-space> ea<C-n>
imap <C-space> <C-n>

map <leader>T :CommandTFlush<CR>:CommandT<CR>
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

filetype on
filetype plugin on
filetype indent on

syntax on
syntax sync fromstart

set lazyredraw

" completion on the command line
set wildmenu
set wildmode=list:longest

" numbered lines
set number
set nohlsearch
set paste
" word wrapping
set wrap
set lbr
" no beeps
set vb

set wildignore+=vendor,tmp,target,.privatebuild

set guifont=Inconsolata:h18.00

" central backup directories
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Browser for viewing documentation (in haskell)
:let g:haddock_browser="/usr/bin/open"

" Disable F1 help
:nmap <F1> :echo<CR>
:imap <F1> <C-o>:echo<CR>

" Better buffer management, horrible setting name
"set hidden

set history=10000
set sts=2
set smarttab
set shiftwidth=2
set autoindent
set expandtab
set backspace=start,eol,indent
set incsearch
set autoread
set autowrite

" With these options together, we only use case sensitive search when there is a captial letter in the search term
set ignorecase
set smartcase

" Add macports path to path
set path+=/opt/local/bin
" I'm so nice to Windoze
set shellslash

set statusline=%F%m%r%h%w\ [Line=%03l,Col=%03v][%p%%]\ [Type=%y]
set laststatus=2

let g:speckyRunRdocKey = "<leader>r"
set grepprg=ack
set grepformat=%f:%l:%m

:color blackboard  
au BufEnter *.hs compiler ghc

" Remap Cmd-S to: Save All; Return to normal mode
inoremenu File.Save <Esc>:wa<CR>

" Falls down if you start vim in your home directory
"if filereadable($PWD. "/.vimrc")
"  source $PWD/.vimrc
"endif

function! <SID>ReformatAndClean()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")

  "Replace tabs with spaces
  :1,$retab 
  "Removing Trailing whitespace
  %s/\s\+$//e 
  "Reindent the file
  :normal gg=G 

  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)  
endfunction

