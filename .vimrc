function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --go-completer
  endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'fatih/vim-go', { 'tag': '*' , 'do': ':GoInstallBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'valloric/youcompleteme', { 'do': function('BuildYCM') }
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'          " displays VCS changes
Plug 'scrooloose/nerdcommenter'   " <Leader>cX for commenting code
Plug 'godlygeek/tabular'          " aligning text
Plug 'tpope/vim-markdown'
Plug 'ambv/black'
Plug 'andviro/flake8-vim'
Plug 'https://github.com/vim-scripts/indentpython.vim.git'
Plug 'vim-syntastic/syntastic'
Plug 'jnurmine/Zenburn'
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

filetype plugin on
filetype plugin indent on
syntax enable

" Please do not use the arrow keys in vim.
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

" Rebind <Leader> key.
" Apparently EVERYONE binds <Leader> key to ','. So :)
let mapleader=","

" lightline
let g:lightline = {
  \     'active': {
  \         'left': [['mode', 'paste' ], ['readonly', 'absolutepath', 'modified']],
  \         'right': [['lineinfo'], ['percent'], ['fileformat', 'fileencoding']]
  \     }
  \ }


" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
set infercase

" Mouse ( see :help mouse-using )
set mouse=nvic

" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" numbering
set number relativenumber
set nu rnu
set nocp
set so=999
set cursorline
set wildmenu
set wildmode=list:longest,full
set ruler

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <esc>
nnoremap JJJJ <nop>

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" Show (partial) commands (or size of selection in Visual mode) in the status line
set showcmd

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Make sure that extra margin on left is removed
set foldcolumn=0

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" tab
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set nowrap "Don't Wrap lines (it is stupid)

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" copy from vim to clipboard
set clipboard=unnamed

" Always show the status line
set laststatus=2

" Remap VIM 0 to first non-blank character
map 0 ^

" Allow to copy/paste between VIM instances
"copy the current visual selection to ~/.vbuf
vmap <leader>y :w! ~/.vbuf<cr>

" Make search case insensitive. When we use regex for searches.
set hlsearch
set incsearch
set ignorecase
set smartcase

" I HATE backup and swap files - They trigger too many events.
set nobackup
set nowritebackup
set noswapfile

"------------------------------------------------------------------------------
" NERDTree
"------------------------------------------------------------------------------

" General properties
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
let NERDTreeWinSize = 35
let NERDTreeShowHidden=1

" Make sure that when NT root is changed, Vim's pwd is also updated
let NERDTreeChDirMode = 2
let NERDTreeShowLineNumbers = 1
let NERDTreeAutoCenter = 1

" Locate file in hierarchy quickly
map <leader>T :NERDTreeFind<cr>

map ]] ]c
map [[ [c
map <leader>gdi :Gdiff<cr>
map <leader>gst :Gstatus<cr>
map <leader>dup :diffupdate<cr>

" Cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" YCM - YouCompleteMe
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 2

" ALE
" ALE has some requirements - > Vim 8.0 (compiled with python) is a must. Reinstalling vim from source might be needed. Take a look at YCM docs for that.
" Also the linters/fixers you run such as eslint, flake8, autopep8, isort have to be manually installed via pip/yarn/npm.
let g:ale_linters = { 'python': ['flake8'] , }
let g:ale_fixers = { 'python': ['autopep8', 'isort'], }
let g:ale_lint_on_text_changed = 'never'
nnoremap <Leader>f :ALEFix<CR>
"=================================Golang=======================================
function! Golang()

    " GoTags support
    " https://github.com/jstemmer/gotags
    " Run gotags -f tags -R . on your project root

    " Tagbar
    nnoremap <silent> <Leader>b :TagbarToggle<CR>
    let g:tagbar_width = 80

    " Vim-go
    nnoremap <silent> <Leader>c :GoCoverage<CR>
    nnoremap <silent> <Leader>v :GoCoverageClear<CR>
    nnoremap <silent> <Leader>g :GoTestFunc<CR>
    autocmd FileType go nmap <Leader>ta <Plug>(go-test)
    autocmd FileType go nmap <Leader>tf <Plug>(go-test-func)
    autocmd FileType go nmap <Leader>i <Plug>(go-info)

    " Why am I forced to do this? I thought the vim-go plugin automatically overrides the vim defaults?
    nnoremap <silent> <C-]> :GoDef<CR>
    nnoremap <silent> <C-t> :GoDefPop<CR>
    nnoremap <silent> <Leader>r :GoReferrers<CR>

    "let g:go_def_mapping_enabled = 0
    let g:go_def_mode = 'godef'
    let g:go_fmt_command = "goimports"
    let g:go_fmt_fail_silently = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_methods = 1
    let g:go_metalinter_autosave = 1
    let g:go_metalinter_deadline = "15s"
    let g:go_list_type = "quickfix"
    let g:go_auto_type_info = 1
    let g:go_auto_sameids = 1

endfunction

call Golang()

" Reaload vimrc
autocmd! bufwritepost .vimrc source %

" Gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

" Airline
let g:airline_section_c = '%F'
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1

" CtrlP
let g:ctrlp_custom_ignore = 'vendor\|node_modules'
