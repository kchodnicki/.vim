" Allow copy/paste between VIM instances
" copy the visual selection to ~/.vbuf
vmap <leader>y :w! ~/.vbuf<cr>

let NERDTreeShowHidden=1

nnoremap <S-j> :m .+1<CR>==
nnoremap <S-Down> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
nnoremap <S-Up> :m .-2<CR>==
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-Down> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi
inoremap <S-Up> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
vnoremap <S-Up> :m '<-2<CR>gv=gv

" Cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <leader>f <Plug>(go-test-func)

" Toogle on/off
nmap <leader>o :NERDTreeToggle<cr>

map ]] ]c
map [[ [c
map <leader>gdi :Gdiff<cr>
map <leader>gst :Gstatus<cr>
map <leader>dup :diffupdate<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

set ai "Auto indent
set si "Smart indent
set nowrap "Don't Wrap lines (it is stupid)

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

" lightline
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'absolutepath', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }

" enable deoplete
let g:deoplete#enable_at_startup = 1
filetype plugin on
set omnifunc=syntaxcomplete#Complete


filetype plugin indent on
syntax enable

" Clipbord
set clipboard=unnamed

" Mouse ( see :help mouse-using )
set mouse=nvic

" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" disable multiple cursors for deoplete
function! Multiple_cursors_before()
    let b:deoplete_disable_auto_complete = 1
endfunction
function! Multiple_cursors_after()
    let b:deoplete_disable_auto_complete = 0
endfunction

" autofill json tags
let g:go_addtags_transform = "snakecase"

" turn hybrid line numbers on
:set number relativenumber
:set nu rnu

" let's make sure we are in noncompatble mode
set nocp

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <esc>
nnoremap JJJJ <nop>

" Make sure that coursor is always vertically centered on j/k moves
set so=999

" Highlight current line - allows you to track cursor position more easily
set cursorline

" Turn on the WiLd menu
set wildmenu

" Set command-line completion mode
set wildmode=list:longest,full

" Completion options (select longest + show menu even if a single match is found)
set completeopt=longest,menuone

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Show line, column number, and relative position within a file in the status line
set ruler

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Allow smarter completion by infering the case
set infercase

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Make sure that extra margin on left is removed
set foldcolumn=0

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

