syntax on
filetype plugin indent on

"au filetype java setlocal mp=javac\ %
"au filetype cpp setlocal mp=g++\ %
"au filetype c setlocal mp=gcc\ %

":let java_highlight_all=1
set path+=**
set guifont=Inconsolata\ 9
set nu
set nocompatible
set tabstop=2 expandtab
set shiftwidth=2
set background=dark
set history=50
set wildmode=list:longest,full
set shortmess+=r
set showmode
set showcmd
set nomodeline
set ignorecase
set smartcase
set t_Co=256
set hlsearch
set vb t_vb=".
set incsearch


"Line numbering
set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave *.html,*.py,*.js,*.json,*.md set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter *.html,*.py,*.js,*.json,*.md set norelativenumber
augroup END

"NERDTree settings
map <silent> <F3> :NERDTree<CR>
noremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers = 0


"Color Schemes
"colorscheme bubblegum2-mine
"colo mine
colo gruvbox

let g:airline_theme='gruvbox'

"Cursorline settings
set cursorline
hi clear Cursorline
hi Cursorline gui=underline cterm=underline

"Press Space to turn off highlighting and clear any message
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

set guioptions-=r

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F2> :if &guioptions =~# 'T' <Bar>
\set guioptions-=T <Bar>
\set guioptions-=m <Bar>
\else <Bar>
\set guioptions+=T <Bar>
\set guioptions+=m <Bar>
\endif<CR>

"Completion
let g:ycm_server_python_interpreter='/usr/bin/python2'

"set omnifunc=syntaxcomplete#Complete


"Powerline config
"set laststatus=2
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
