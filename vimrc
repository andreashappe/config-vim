execute pathogen#infect()
filetype plugin indent on

" we want vim, not vi
set nocompatible

" some simple programming thingies
" TODO move this into a filetype plugin?
syntax on
set number
set expandtab
set tabstop=2 shiftwidth=2
set nowrap

" TODO work a bit on colorscheme, this looks crappy on non-256 color terminals
set t_Co=256
colorscheme industry

" syntastic thingies
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_default_include_dirs = 1

" improve search behaviour
set hlsearch
set incsearch
set smartcase

" use space as LEADER!
let mapleader = "\<Space>"

" some common commands
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>g :Ag<Space>

" copy and paste to clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" enter visual mode with <space><space>
nmap <Leader><Leader> V

" try out airline
" let g:airline_powerline_fonts = 1
set laststatus=2

" try ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"
