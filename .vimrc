set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'chriskempson/base16-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" new leaderkey
let mapleader = "\<Space>"

" PEP-8 standard with vertical split
set lines=35 columns=150

" show line numbers
set number

" clear font
set guifont=Menlo\ Regular:h18

" mark PEP-8 line lenght
set colorcolumn=72
highlight ColorColumn ctermbg=233
syntax on
set encoding=utf-8
set numberwidth=4

" automatic relaod of vimrc
autocmd bufwritepost .vimrc source $MYVIMRC

" toggle paste in vim
set pastetoggle=<F2>

" map tabs
map <Leader>j <esc>:tabprevious<CR>
map <Leader>k <esc>:tabnext<CR>

" fast sort
vnoremap <Leader>s :sort<CR>

" easier block of code intent
vnoremap < <gv
vnoremap > >gv

" remove trailing whitespace from python code
autocmd BufWritePre * :%s/\s\+$//e

" spaces not tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" improve search
set hlsearch
set incsearch
set ignorecase
set smartcase

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

