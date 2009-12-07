" F vi
set nocompatible

filetype on
filetype plugin on
filetype indent on

syntax on

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
" no beeps
set vb

" central backup directories
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" no goofy buttons
set guioptions=ac

let mapleader = ","

" Better buffer management, horrible setting name
" set hidden
set history=1000
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

set statusline=%F%m%r%h%w\ [Line=%03l,Col=%03v][%p%%]\ [ASCII=\%03.3b]\ [Format=%{&ff}]\ [Type=%y]
set laststatus=2

let g:fuzzy_ignore = "*.log"
let g:fuzzy_matching_limit = 7000
let g:fuzzy_ceiling = 100000
let g:speckyRunRdocKey = "<leader>r"

map <leader>t :FuzzyFinderTextMate<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>T :FuzzyFinderRemoveCache<CR>:ruby finder.rescan!<CR>:FuzzyFinderTextMate<CR>

map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

" re-indent the whole file
map <leader>i gg=G 

" Open my custom help file
map <leader>c :tabe ~/.vim/doc/cheetSheet.txt<CR>

map <F2> :mksession! .vim_session <cr> " Quick write session with F2
map <F3> :source .vim_session <cr>     " And load session with F3

" Edit or load .vimrc
nmap <silent> ,ev :e $MYVIMRC<CR>
nmap <silent> ,sv :so $MYVIMRC<CR>

" Replace tabs with spaces
nmap <silent> ,rr :1,$retab<CR>

" Toggle paste mode (indent weirdness)
nmap <silent> ,p :set invpaste<CR>:set paste?<CR>

" Toggle highlighted search
nmap <silent> ,n :set invhls<CR>:set hls?<CR>

" Toggle word wrapping
nmap <silent> ,w :set invwrap<CR>:set wrap?<CR>

" cd to directory of the current file
nmap <silent> ,cd :lcd %:h<CR>

set grepprg=ack
set grepformat=%f:%l:%m

:color blackboard  

" Move the cursor to the window in the proper direction
noremap <silent> ,h :wincmd h<cr>
noremap <silent> ,j :wincmd j<cr>
noremap <silent> ,k :wincmd k<cr>
noremap <silent> ,l :wincmd l<cr>

" Close the window in the proper direction
noremap <silent> ,cj :wincmd j<cr>:close<cr>
noremap <silent> ,ck :wincmd k<cr>:close<cr>
noremap <silent> ,ch :wincmd h<cr>:close<cr>
noremap <silent> ,cl :wincmd l<cr>:close<cr>

" Close the current window
noremap <silent> ,cc :close<cr>

" Move the current window to the proper direction from the main Vim window
noremap <silent> ,ml <C-W>L
noremap <silent> ,mk <C-W>K
noremap <silent> ,mh <C-W>H
noremap <silent> ,mj <C-W>J

" Remap omni-completion to CTRL+Space
nmap <C-space> ea<C-n>
imap <C-space> <C-n>

au BufEnter *.hs compiler ghc
