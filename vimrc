packadd nord-vim

syntax on

if has('python')
  command! Python python3
else
  command! Python python
end



"File type settings
filetype plugin indent on

"Macros
let @h = "yypVr"
let @n = "<C-e>ln"



" Fold settings
autocmd FileType python setlocal foldmethod=indent
autocmd FileType json setlocal foldmethod=indent

"Markdown Settings
au! BufRead,BufNewFile *.md       set filetype=.mkd
au! BufRead,BufNewFile *.markdown set filetype=.mkd

au! BufRead,BufNewFile *.md       setlocal spell
au! BufRead,BufNewFile *.markdown setlocal spell

"au! BufRead,BufNewFile *.md       setlocal textwidth=80
"au! BufRead,BufNewFile *.markdown setlocal textwidth=80

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
"set noshowmode

:augroup nord-overrides
:  autocmd!
":  autocmd ColorScheme nord highlight Comment ctermfg=14
:augroup END

colo nord
"ColorScheme settings
"colorscheme bubblegum2-mine
"colo mine
"colo gruvbox
"colo Tomorrow-Night
"colo Tomorrow-Night-Eighties-mine
"colo dracula
"colo solarized
"highlight Normal ctermbg=None

"Spell check
noremap <silent> <F6> :setlocal spell! spell?<CR>

"Line numbering
:set number relativenumber

":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
":  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END


"NERDTree settings
map <silent> <F3> :NERDTree<CR>k
noremap <C-n> :NERDTreeToggle<Enter>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeShowLineNumbers = 0

"let g:airline_theme='nord'
let g:airline_powerline_fonts = 1

"Riv Settings
let g:riv_auto_format_table = 0
"let g:riv_temp_path=0
let g:riv_temp_path='/mnt/c/Users/chq-stephenco/riv/'
" Leave space at end of folds
let g:riv_fold_blank = 1
"Dont fold lists
let g:riv_fold_level = 1


"Cursorline settings
set cursorline
"hi clear Cursorline
"hi Cursorline gui=underline cterm=underline

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

"Auto Completion
"set omnifunc=syntaxcomplete#Complete
"let g:ycm_server_python_interpreter = '/usr/bin/python2'
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_server_python_interpreter='python3'

"syntastic
let g:syntastic_javascript_checkers=['eslint']

"Powerline config
"set laststatus=2
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
