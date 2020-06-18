set nocompatible
filetype plugin indent on
syntax on

" use minpac (which is a plugin manager built on top of vim8's package manager
packadd minpac
call minpac#init()

" add some shortcuts for minpac
command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" get sensible default settings
call minpac#add('tpope/vim-sensible')

" user interface enhancements
call minpac#add('vim-airline/vim-airline')             " better status bar

" improve efficiency
call minpac#add('AlphaMycelium/pathfinder.vim')

" try out airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

call minpac#add('airblade/vim-gitgutter')              " git sidebar
call minpac#add('majutsushi/tagbar')   		   " test tagbar

" navigation, finding, grepping
call minpac#add('mhinz/vim-grepper')           " fast grep replacement, need the_silver_surfer

" TextMate inspired goto file
call minpac#add('kien/ctrlp.vim')
call minpac#add('junegunn/fzf.vim')
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" grammar stuff
call minpac#add('rhysd/vim-grammarous')

" snippet stuff
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')

call minpac#add('Shougo/deoplete.nvim')
if !has('nvim')
	call minpac#add('roxma/nvim-yarp')
	call minpac#add('roxma/vim-hug-neovim-rpc')
endif
let g:deoplete#enable_at_startup = 1

let g:completor_tex_omni_trigger =
        \   '\\(?:'
        \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \  .  '|hyperref\s*\[[^]]*'
        \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
        \  .')'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" some spelling fixes
set spelllang=de
autocmd FileType tex setlocal spell

" Testing out some new features
call minpac#add('w0rp/ale') " automatic compilation / syntax checking

" git-specific stuff (currently not using)
call minpac#add('tpope/vim-fugitive')
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>

" Programming language stuff
call minpac#add('sheerun/vim-polyglot')   " multiple extensions for different
                                          " programming languages (includes vim-markdown)
					  "
call minpac#add('lervag/vimtex')  " latex specific stuff
let g:polyglot_disabled = ['latex']
let g:vimtex_compiler_latexmk = {'callback' : 0}

" ruby and ror stuff
call minpac#add('tpope/vim-bundler')
call minpac#add('tpope/vim-rails')

" allow per project configuration files
set exrc

" improve search behaviour
set hlsearch
set incsearch
set smartcase

" use match-up
call minpac#add('andymass/matchup.vim')

" use space as LEADER!
let mapleader = "\<Space>"
let maplocalleader = "\<Space>" " used by vimtex

" some common commands
nnoremap <Leader>O :CtrlP<CR>
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

" buffer management
nmap <Leader>i :bnext<CR>
nmap <Leader>o :bprev<CR>

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

" compile hints
let g:ale_sign_column_always = 1

" use netrw (builtin) instead of Nerdtree
let g:netrw_altv = 1
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_liststyle = 3
let g:netrw_winsize = -28
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro rnu'  " --> I want line numbers on the netrw buffer
nnoremap <silent> <leader>k :Lexplore<cr>

" work with quickfix
call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')

" add some testing support
call minpac#add('janko-m/vim-test')
let test#strategy = "dispatch"
