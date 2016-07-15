" required by vundle
set nocompatible
filetype off

" add runtime path to include Vundle and initalize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" system stuff
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'      " better status bar

" navigation, finding, grepping
Plugin 'rking/ag.vim'           " fast grep replacement, need the_silver_surfer
Plugin 'kien/ctrlp.vim'         " TextMate inspired goto file
Plugin 'jlanzarotta/bufexplorer' " Buffer explorer
Plugin 'majutsushi/tagbar' "test tagbar

" Java Stuf (Just use ^X^O for completion)
Plugin 'artur-shaik/vim-javacomplete2'

" markdown stuff
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" snippet stuff
Plugin 'SirVer/ultisnips'       " use snippets
Plugin 'honza/vim-snippets'     " use snippets

" automatic compilation / syntax checking
Plugin 'scrooloose/syntastic'   " online syntax/lint checker

" Ruby (on Rails) specific (am I really using those)
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-rails'

" git-specific stuff (currently not using)
Plugin 'tpope/vim-fugitive'     " git integration within vim

" make commenting easier
Plugin 'tpope/vim-commentary'

" latex specific stuff
Plugin 'lervag/vimtex'
Plugin 'rhysd/vim-grammarous'

Plugin 'tpope/vim-vinegar'

" reactivate stuff after vundle has completed
call vundle#end()
filetype plugin indent on

" automatically reload after writing .vimrc
au BufWritePost .vimrc so $MYVIMRC
au BufWritePost vimrc so $MYVIMRC

" allow per project configuration files
set exrc

" some simple programming thingies
syntax on
set number

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
let g:airline#extensions#tabline#enabled = 1

" try ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" fast grep
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" grammar check on <leader>gc
nmap <Leader>gc :GrammarousCheck<CR>

" Invisible characters
set listchars=tab:▸\ ,trail:·,eol:¬,nbsp:_,extends:❯,precedes:❮

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=1200

" be a bit sadistic
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
nnoremap <PageUp> <nop>
nnoremap <PageDown> <nop>

" config for markdown
let g:vim_markdown_folding_disabled = 1

if has('gui_running')
  set guioptions-=T  " no toolbar
  colorscheme desert
else
  " something for console Vim
endif

" use netrw (builtin) instead of Nerdtree
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = -28
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'  " --> I want line numbers on the netrw buffer
nnoremap <silent> <leader>k :Lexplore<cr>
