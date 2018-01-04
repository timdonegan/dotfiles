" Use Vim settings, rather than Vi settings
set nocompatible

" Set mapleader
let mapleader=" "

" Navigation by visual line rather than \n line
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

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
noremap <silent> <Leader>b :CtrlPBuffer<CR>

" Tab changes buffer
nnoremap <Tab> :bn<CR>
map <Esc>[Z <S-Tab>
nnoremap <S-Tab> :bp<CR>

" delete buffers without closing window
" (just switch to next buffer in window)
nnoremap <Leader>d :bn<CR>:bd#<CR>

" Split creation
noremap <silent> <Leader>v <C-w>v
noremap <silent> <Leader>s <C-w>s
noremap <silent> <Leader>c <C-w>c

" Split navigation
noremap <silent> <Leader>l <C-w>l
noremap <silent> <Leader>h <C-w>h
noremap <silent> <Leader>k <C-w>k
noremap <silent> <Leader>j <C-w>j

" http://stackoverflow.com/questions/677986/vim-copy-selection-to-os-x-clipboard
vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

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
"Plugin 'davidhalter/jedi-vim'

" javascript support
Plugin 'pangloss/vim-javascript'

" fuzzy file search
Plugin 'ctrlpvim/ctrlp.vim'

" Syntax errors
"Plugin 'scrooloose/syntastic.git'

" vim status line
"Plugin 'bling/vim-airline'

" elixir support
Plugin 'elixir-lang/vim-elixir'

" typescript support
Plugin 'leafgarland/typescript-vim'

" js/ts formatting
Plugin 'prettier/vim-prettier'

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
if !exists("*MultiScroll")
    function MultiScroll(OnOff)
        if a:OnOff == 1
          noremap j 5j
          noremap k 5k
        else
          noremap j j
          noremap k k
        endif
    endfunction
endif
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
if !exists("*Yapf")
    function Yapf()
        if &ft != 'python'
            return
        end

        kb
        let current_line = line('.')
        silent execute "0,$!yapf"
        silent! bdelete 'error_msg'
        if v:shell_error != 0 && v:shell_error != 2
            " Shell command failed, so open a new buffer with error text
            execute 'normal! gg"ayG'
            silent undo
            execute 'normal! ' . current_line . 'G'
            silent new
            setlocal buftype=nofile
            setlocal bufhidden=delete
            setlocal noswapfile
            silent file 'error_msg'
            silent put a
        end

        silent! 'b

    endfunction
endif

nnoremap <silent> <leader>y :call Yapf()<Cr>:w<Cr>
" autocmd BufWritePre * call Yapf()

" format with goimports instead of gofmt
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 0

" Syntastic bullshit
set statusline = ""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_disabled_filetypes=['ts']
let g:syntastic_html_checkers=['']

" SQL spacing
autocmd Filetype sql setlocal ts=2 sts=2 sw=2

" Yaml spacing
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2

" Lua spacing
autocmd Filetype lua setlocal ts=2 sts=2 sw=2

" Javascript spacing
autocmd Filetype js setlocal ts=2 sts=2 sw=2

" Typescript spacing
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2

" Elixir spacing
autocmd Filetype elixir setlocal ts=2 sts=2 sw=2

" Run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
