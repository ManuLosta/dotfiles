"  _   _                      _
" | \ | |                    (_)
" |  \| |  ___   ___  __   __ _  _ __ ___
" | . ` | / _ \ / _ \ \ \ / /| || '_ ` _ \
" | |\  ||  __/| (_) | \ V / | || | | | | |
" \_| \_/ \___| \___/   \_/  |_||_| |_| |_|
"
" By: ManuLosta

set nocompatible              
filetype off                  

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'ap/vim-css-color'
Plug 'sheerun/vim-polyglot'
Plug 'vim-python/python-syntax'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set smarttab                    
set shiftwidth=4                
set tabstop=4                   
set number norelativenumber     
set t_Co=256
syntax on
set mouse=nicr
set clipboard=unnamedplus

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
:imap ii <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi User1 ctermfg=black ctermbg=green
hi User2 ctermfg=black ctermbg=blue
hi User3 ctermfg=black ctermbg=yellow
hi User4 ctermfg=black ctermbg=magenta
hi User5 ctermfg=black ctermbg=red
hi User6 ctermfg=none ctermbg=black

let g:currentmode={
    \ 'n'  : 'NORMAL ',
    \ 'v'  : 'VISUAL ',
    \ 'V'  : 'V·Line ',
    \ '' : 'V·Block ',
    \ 'i'  : 'INSERT ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \}

set statusline=
set statusline+=%4*\ %4*%{toupper(g:currentmode[mode()])}
set statusline+=%6*\ %f
set statusline+=\ %6*\ %{&modified?'[+]':''}
set statusline+=\ %=%6*\ %Y
set statusline+=\ %5*\ %v:%l\/%L
set statusline+=\ "


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NerdTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Emmet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:user_emmet_leader_key='<C-Z>'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
hi LineNr           ctermfg=8    ctermbg=none 
hi Comment          ctermfg=15 
hi Statement        ctermfg=3
hi Function         ctermfg=6
hi Number			ctermfg=1
hi Constant			ctermfg=3
hi String			ctermfg=2
hi Identifier       ctermfg=6
hi Special          ctermfg=white
hi Statement		ctermfg=5
hi CursorLine		ctermbg=8
