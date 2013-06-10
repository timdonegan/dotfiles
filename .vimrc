" Use Vim settings, rather than Vi settings
set nocompatible

" Set mapleader
let mapleader=" "

" Navigation by visual line rather than \n line
nnoremap j gj
nnoremap k gk

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
set noexpandtab

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
nmap <silent> <leader>w :set nolist!<CR>

" Disable annoying beeps
set visualbell

" View buffers
noremap <silent> <Leader>b :buffers<CR>

" Split creation
noremap <silent> <Leader>v <C-w>v
noremap <silent> <Leader>s <C-w>s
noremap <silent> <Leader>c <C-w>c

" Split navigation
noremap <silent> <Leader>l <C-w>l
noremap <silent> <Leader>h <C-w>h
noremap <silent> <Leader>k <C-w>k
noremap <silent> <Leader>j <C-w>j

" Split resizing
set winheight=30
set winminheight=5
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Faster scrolling
nmap <C-j> 10j
nmap <C-k> 10k

" Run Gnu Make
noremap <Leader>m :make<CR>

" Automatically jump to last known cursor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif
