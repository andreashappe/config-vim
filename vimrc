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

call minpac#add('arcticicestudio/nord-vim')
colorscheme nord

" user interface enhancements
call minpac#add('vim-airline/vim-airline')             " better status bar
call minpac#add('vim-airline/vim-airline-themes')             " better status bar
set laststatus=2
let g:airline#extensions#tabline#enabled = 1

" TextMate inspired goto file
call minpac#add('junegunn/fzf')
call minpac#add('junegunn/fzf.vim')
call minpac#add('pechorin/any-jump.vim')
nnoremap <leader>j :AnyJump<CR>

" grammar stuff
call minpac#add('rhysd/vim-grammarous')

" snippet stuff
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')

ino <silent> <c-x><c-t> <c-r>=<sid>ulti_complete()<cr>

fu! s:ulti_complete() abort
      if empty(UltiSnips#SnippetsInCurrentScope(1))
                return ''
                    endif
                        let word_to_complete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\S\+$')
                            let contain_word = 'stridx(v:val, word_to_complete)>=0'
                                let candidates = map(filter(keys(g:current_ulti_dict_info), contain_word),
                                                   \  "{
                                                   \      'word': v:val,
                                                   \      'menu': '[snip] '. g:current_ulti_dict_info[v:val]['description'],
                                                   \      'dup' : 1,
                                                   \   }")
                                    let from_where = col('.') - len(word_to_complete)
                                        if !empty(candidates)
                                                  call complete(from_where, candidates)
                                                      endif
                                                          return ''
                                                        endfu

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
"
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nmap <Leader>e :CocCommand explorer<CR>
nnoremap <leader>e :CocCommand explorer<CR>

nmap <silent> gd <Plug>(coc-definition)

" adaptive search function
function! s:GoToDefinition()
    if CocAction('jumpDefinition')
      return v:true
    endif

    let ret = execute("silent! normal \<C-]>")
    if ret =~ "Error" || ret =~ "错误"
      call searchdecl(expand('<cword>'))
    endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-tab>"

" some spelling fixes
set spelllang=de
autocmd FileType tex setlocal spell

" Testing out some new features
call minpac#add('w0rp/ale') " automatic compilation / syntax checking

" git-specific stuff
call minpac#add('airblade/vim-gitgutter')              " git sidebar
call minpac#add('tpope/vim-fugitive')
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>gc :Gcommit<CR>

" Programming language stuff
call minpac#add('sheerun/vim-polyglot')   " multiple extensions for different
                                          " programming languages (includes vim-markdown)
call minpac#add('lervag/vimtex')  " latex specific stuff
let g:polyglot_disabled = ['latex']
let g:vimtex_compiler_latexmk = {'callback' : 0}
let g:tex_flavor = 'latex'

set exrc " allow per project configuration files

" improve search behaviour
set hlsearch
set incsearch
set smartcase

" use match-up
call minpac#add('andymass/matchup.vim')

" use space as LEADER!
let mapleader = "\<Space>"
let maplocalleader = "\<Space>" " used by vimtex

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
