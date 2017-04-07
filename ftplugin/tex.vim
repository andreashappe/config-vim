" improve line-wrapping for latex
set wrap
noremap  <buffer> <silent> k gk
noremap  <buffer> <silent> j gj
noremap  <buffer> <silent> 0 g0
noremap  <buffer> <silent> $ g$

augroup Latex
autocmd!
autocmd BufNewFile,BufRead *.tex setlocal filetype=tex
augroup END
