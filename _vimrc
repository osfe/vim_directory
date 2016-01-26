" Author 	Olivier LEMAIRE
" Date		March, 19th 2014
" Version	0.1
" 
"
" 
" Outline  1. Syntax and fonts 
"           2. user interface
"           3. Edition 
"           4. Print 
" 
"
" Love vim forever and more...!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 1. Syntax and fonts 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" enable plugins 
filetype plugin on

" filetype based indentation
filetype indent on 

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2. user interface 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" theme 
set t_Co=256

" Highlight line longer than 80 chars 
" highlight rightMargin term=bold ctermfg=DarkMagenta ctermbg=Black guifg=blue
" match rightMargin '\%>80v'

colorscheme molokai
" set background=dark

" gui font
set guifont=Monospace\ 11

" menus
" set guioptions-=m
set guioptions+=aegimrTtLT

" show numbers
set number 

" wildmenu
set wildmenu

" Height of the command bar
set cmdheight=1

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Always show the status line
set laststatus=2

" Format the status line
let &statusline="%F%<%y[%{&fileencoding}/%{&encoding}/%{&termencoding}][%{&fileformat}](%n)%m%r%w %a%=%b 0x%B  #L:%l/%L, C:%-7(%c%V%) %P"

" enable mouse use 
set mouse=a

" copy 
map <C-c> "+y<CR> 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 3. Edition 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set bs=2

" Highlight line longer than 80 chars 
highlight rightMargin term=bold ctermfg=DarkMagenta ctermbg=Black guifg=blue
match rightMargin '\%>80v'


" Show matching brackets when text indicator is over them
set showmatch 

" Linebreak on 80 characters
set lbr
set tw=80

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set autoindent
set formatoptions+=tcroqn

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" chdir automatic
autocmd BufEnter * silent! lcd %:p:h



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 4. Print 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hardcopy
map <C-p> :color print_bw<CR>:hardcopy > %.ps<CR>:color molokai<CR>:syn on<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easy compil
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
fun! MAKE()
    let makedir=fnamemodify(findfile('Makefile',';'),":h")
    let olddir=pwd()
    let newdir=findfile('Makefile',';')
    exec "cd " . makedir 
    make 
    cd olddir
endf 

nnoremap <silent> <F5> :call MAKE()<CR>

if match($TERM, "screen")!=-1
    set term=xterm
endif

