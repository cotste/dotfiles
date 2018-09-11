syntax on
filetype plugin indent on

"File type settings

"Markdown Settings
au! BufRead,BufNewFile *.md       set filetype=.mkd
au! BufRead,BufNewFile *.markdown set filetype=.mkd

au! BufRead,BufNewFile *.md       setlocal spell
au! BufRead,BufNewFile *.markdown setlocal spell

au! BufRead,BufNewFile *.md       setlocal textwidth=80
au! BufRead,BufNewFile *.markdown setlocal textwidth=80

"au filetype java setlocal mp=javac\ %
"au filetype cpp setlocal mp=g++\ %
"au filetype c setlocal mp=gcc\ %

":let java_highlight_all=1
"set path+=**
set guifont=Inconsolata\ 9
set nu
set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
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
autocmd FileType python setlocal foldmethod=indent
autocmd FileType json setlocal foldmethod=indent
set foldignore=
"colorscheme bubblegum2-mine
"colo mine
colo gruvbox
"colo Tomorrow-Night

"Spell check
noremap <silent> <F6> :setlocal spell! spell?<CR>

"NERDTree settings

map <silent> <F3> :NERDTree<CR>k
noremap <Leader>f :NERDTreeToggle<Enter>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

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

filetype plugin on
set omnifunc=syntaxcomplete#Complete

"syntastic
let g:syntastic_javascript_checkers=['eslint']

"Powerline config
"set laststatus=2
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
