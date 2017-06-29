set nocompatible

" Load vim-plug, plugin should already be setup by git repository
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

call plug#begin('~/.vim/plugged')

" get sensible default settings
Plug 'tpope/vim-sensible'

" airline stuff
Plug 'vim-airline/vim-airline'             " better status bar
Plug 'vim-airline/vim-airline-themes'      " better status bar

" navigation, finding, grepping
Plug 'rking/ag.vim'           " fast grep replacement, need the_silver_surfer
Plug 'kien/ctrlp.vim'         " TextMate inspired goto file
Plug 'majutsushi/tagbar'      "test tagbar

" snippet stuff
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete'

" VimWiki
Plug 'vimwiki/vimwiki'

" automatic compilation / syntax checking
Plug 'w0rp/ale'

" git-specific stuff (currently not using)
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" make commenting easier
Plug 'tomtom/tcomment_vim'

" add some on-demand grammar checking
Plug 'rhysd/vim-grammarous'

"" Programming language specific stuff

" Java Stuff (Just use ^X^O for completion)
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}

" markdown stuff
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" Ruby (on Rails) specific (am I really using those)
Plug 'tpope/vim-bundler', {'for': 'ruby'}
Plug 'tpope/vim-rails', {'for': 'ruby'}

" latex specific stuff
Plug 'lervag/vimtex', {'for': 'tex'}

" align with e.g. gl=
Plug 'tommcdo/vim-lion'

" additional text objects
Plug 'wellle/targets.vim'
Plug 'tpope/vim-surround'

" navigation through f{char}
Plug 'rhysd/clever-f.vim'

" show indent markers
Plug 'Yggdroot/indentLine'

" multiple extensions for different programming languages
Plug 'sheerun/vim-polyglot'

call plug#end()

"" real configuration

" vim-lion
let g:lion_squeeze_spaces = 1

" allow per project configuration files
set exrc

" improve search behaviour
set hlsearch
set incsearch
set smartcase

" use space as LEADER!
let mapleader = "\<Space>"

" some common commands
nnoremap <Leader>O :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>wq :wq<CR>
nnoremap <Leader>g :Ag<Space>

" git commands
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>

" copy and paste to clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" buffer management
nmap <Leader>i :bnext<CR>
nmap <Leader>o :bprev<CR>

" enter visual mode with <space><space>
nmap <Leader><Leader> V

" comment currently selected stuff
nmap <Leader>c :gc

" try out airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" try ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" fast grep
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" show indent markers
let g:indentLine_faster = 1
let g:indentLine_setConceal = 0

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

" copmile hints
let g:ale_sign_column_always = 1

" use netrw (builtin) instead of Nerdtree
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = -28
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'  " --> I want line numbers on the netrw buffer
nnoremap <silent> <leader>k :Lexplore<cr>
