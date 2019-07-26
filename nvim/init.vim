packadd nord-vim

set autoindent
filetype plugin indent on
syntax enable

set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set background=dark

"Color settings
colo nord
let g:airline_theme='nord'
let g:airline_powerline_fonts=1

"Fold settings
autocmd FileType python setlocal foldmethod=indent
autocmd FileType json setlocal foldmethod=indent

"Markdown Settings
au! BufRead,BufNewFile *.md       set filetype=.mkd
au! BufRead,BufNewFile *.markdown set filetype=.mkd
au! BufRead,BufNewFile *.md       setlocal spell
au! BufRead,BufNewFile *.markdown setlocal spell
au! BufRead,BufNewFile *.md       setlocal textwidth=80
au! BufRead,BufNewFile *.markdown setlocal textwidth=80

noremap <silent> <F6> :setlocal spell! spell?<CR>

"Line numbering
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

