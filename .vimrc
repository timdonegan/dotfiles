" Use Vim settings, rather than Vi settings
set nocompatible

" Set mapleader
let mapleader=" "

" Allow changing buffers w/o saving
set hidden

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set backup directory
set backupdir=~/tmp,/var/tmp,/tmp

" Enable plugins
filetype plugin on

" keep 50 lines of command line history
set history=1000

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd	

" do incremental searching
set incsearch

" show line numbers
set number

"Use jj as escape in insert mode and command line mode
inoremap jj <C-c>
cnoremap jj <C-c>

" Viewport scrolling
nnoremap <Leader>e 3<C-e>
nnoremap <Leader>y 3<C-y>

"Use semi-colon to clear highlighted search results
nmap <silent> <Leader>; :noh<CR>

" enables more % matching
runtime macros/matchit.vim	

" fixes complete problems
set wildmenu
set wildmode=list:longest

" searches treat undercase and lowercase similarly
set ignorecase
set smartcase

" Title
set title

" Tabs are four spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Leave space below cursor when strolling
set scrolloff=3

" Syntax highlighting
syntax on

" Allow vim to recognize filetype
filetype on

" Filetype specific settings
filetype plugin on
filetype indent on

" Highligh search terms
set hlsearch

" Highlight search terms as they are typed
set incsearch

" View tabs and trailing useful (quite useful!)
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Disable annoying beeps
set visualbell

" Window navigation and editing with the mapleader
nmap <silent> <Leader>l <C-w>l
nmap <silent> <Leader>h <C-w>h
nmap <silent> <Leader>k <C-w>k
nmap <silent> <Leader>j <C-w>j
nmap <silent> <Leader>v <C-w>v
nmap <silent> <Leader>s <C-w>s
nmap <silent> <Leader>c <C-w>c

" Automatically jump to last known cursor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
