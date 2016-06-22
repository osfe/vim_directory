"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easy compil
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! MAKE()
    let makedir=fnamemodify(findfile('Makefile',';'),":h")
    let olddir=getcwd()
    execute 'cd '.makedir 
    wa
    make! compile
    execute 'cd '.olddir 
endf 

inoremap <F5> <C-O>:call MAKE()<CR>
