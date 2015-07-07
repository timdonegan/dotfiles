" Use Vim settings, rather than Vi settings
set nocompatible

" Set mapleader
let mapleader=" "

" Navigation by visual line rather than \n line
noremap j gj
noremap k gk

" Allow changing buffers w/o saving
set hidden

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Set backup directory
set backupdir=~/tmp,/var/tmp,/tmp

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

" Syntax highlighting
syntax on

" Allow vim to recognize filetype
filetype off

" Filetype specific settings
filetype plugin off
filetype indent off

" Tabs are two spaces
set tabstop=4
set shiftwidth=4
set expandtab

" Leave space below cursor when strolling
set scrolloff=3

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

" Tab changes buffer
nnoremap <Tab> :bn<CR>
map <Esc>[Z <S-Tab>
nnoremap <S-Tab> :bp<CR>

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
" set winheight=30
" set winminheight=5

" Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" golang support
Plugin 'fatih/vim-go'

" coffee support
Plugin 'kchmck/vim-coffee-script'

" python autocompletion
Plugin 'davidhalter/jedi-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Faster scrolling
function MultiScroll(OnOff)
	if a:OnOff == 1
	  noremap j 5j
	  noremap k 5k
	else
	  noremap j j
	  noremap k k
	endif
endfunction 
map <silent> <Leader>aj :call MultiScroll(1)<CR>
map <silent> <Leader>ak :call MultiScroll(0)<CR>

" Run Gnu Make
noremap <Leader>m :make<CR>

" Automatically jump to last known cursor position
if has("autocmd")
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" Set path to current directory
set path+=**

" Yapf
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr>:w<Cr>
