
packadd coc.nvim
packadd defx
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
color nord
let g:airline_theme = 'nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1

"highlight CocFloating ctermbg=15

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

":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
":  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END

augroup defx_settings
  autocmd FileType defx call s:defx_my_settings()
augroup END

call defx#custom#option('_', {
            \'winwidth' : 40,
            \'split' : 'vertical',
            \'direction' : 'topleft',
            \})

function! s:defx_my_settings() abort
    "Define mappings
    nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
    nnoremap <silent><buffer><expr> q defx#do_action('quit')
    nnoremap <silent><buffer><expr> u defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> s defx#do_action('open', 'vsplit')
endfunction

noremap <C-n> :Defx<Enter>
