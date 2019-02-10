function! BuildYCM(info)
  if a:info.status == 'installed' || a:info.force
    !./install.py --go-completer
  endif
endfunction

call plug#begin('~/.vim/plugged')
Plug 'valloric/youcompleteme', { 'do': function('BuildYCM') }
Plug 'mdempsky/gocode'
Plug 'Shougo/unite.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'jodosha/vim-godebug'
Plug 'sebdah/vim-delve'
Plug 'Shougo/vimshell.vim'
Plug 'Shougo/vimproc.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'flazz/vim-colorschemes'
Plug 'junegunn/vim-easy-align'
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'fatih/vim-go', { 'tag': '*' , 'do': ':GoInstallBinaries' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
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

" YCM - YouCompleteMe
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_min_num_of_chars_for_completion = 3

" Ack
cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
set infercase

" NERDTree toggle
map <C-n> :NERDTreeToggle<CR>

" numbering
set number relativenumber
set nu rnu
set nocp
set so=999
set cursorline
set ruler

" This is totally awesome - remap jj to escape in insert mode.  You'll never type jj anyway, so it's great!
inoremap jj <esc>
nnoremap JJJJ <nop>

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

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

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

" ALE
" ALE has some requirements - > Vim 8.0 (compiled with python) is a must. Reinstalling vim from source might be needed. Take a look at YCM docs for that.
" Also the linters/fixers you run such as eslint, flake8, autopep8, isort have to be manually installed via pip/yarn/npm.
let g:ale_linters = { 'python': ['flake8'] , }
let g:ale_fixers = { 'python': ['autopep8', 'isort'], }
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '‚§´'
let g:ale_sign_warning = '‚ö†'
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
    autocmd FileType go nmap <Leader>ta <Plug>(go-test)
    autocmd FileType go nmap <Leader>tf <Plug>(go-test-func)
    autocmd FileType go nmap <Leader>i <Plug>(go-info)

    au Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
    au Filetype go nmap <leader>gah <Plug>(go-alternate-split)
    au Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)

    au FileType go nmap <F9> :GoCoverageToggle -short<cr>
    au FileType go nmap <F12> <Plug>(go-def)

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
    let g:go_auto_type_info = 1
    let g:go_auto_sameids = 1

endfunction

call Golang()

" Reaload vimrc
autocmd! bufwritepost init.vim source %

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
let g:airline_skip_empty_sections = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#fugitiveline#enabled = 1

" CtrlP
let g:ctrlp_custom_ignore = 'vendor\|node_modules'

" Colorscheme
colorscheme gruvbox

" Turn off preview
set completeopt-=preview

" Snippwts
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
