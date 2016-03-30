" required by vundle
set nocompatible
filetype off

" add runtime path to include Vundle and initalize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" now add plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'           " fast grep replacement, need the_silver_surfer
Plugin 'kien/ctrlp.vim'         " TextMate inspired goto file
Plugin 'SirVer/ultisnips'       " use snippets
Plugin 'honza/vim-snippets'     " use snippets
Plugin 'scrooloose/syntastic'   " online syntax/lint checker
Plugin 'vim-airline/vim-airline'      " better status bar
Bundle 'jlanzarotta/bufexplorer' " Buffer explorer

" Lots of colorschemes
Plugin 'flazz/vim-colorschemes'

" Ruby (on Rails) specific (am I really using those)
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'skalnik/vim-vroom'      " not sure
Plugin 'benmills/vimux'         " not sure

" currently not really using
Plugin 'tpope/vim-fugitive'     " git integration within vim
Plugin 'tpope/vim-surround'     " not sure
Plugin 'lervag/vimtex'
Plugin 'rhysd/vim-grammarous'

" reactivate stuff after vundle has completed
call vundle#end()
filetype plugin indent on

" automatically reload after writing .vimrc
au BufWritePost .vimrc so $MYVIMRC

" allow per project configuration files
set exrc

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

" also would be callable through <Leader>be
nnoremap <Leader>b :BufExplorer<CR>

" git commands
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>

nnoremap <Leader>t :VroomRunNearestTest<CR>

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
set laststatus=2

" try ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" vroom / vimux
let g:vroom_use_vimux=1
let g:vroom_use_spring=1

" fast grep
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" grammar check on <leader>gc
nmap <Leader>gc :GrammarousCheck<CR>

" latex bindings
nmap <Leader>lc :Vimtex

" Invisible characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200
