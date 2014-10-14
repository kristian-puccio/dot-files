set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'scrooloose/nerdtree'
"Plugin 'faith/vim-go'
Plugin 'fatih/vim-go'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'terryma/vim-multiple-cursors'
Plugin 'kristijanhusak/vim-multiple-cursors'
Plugin 'altercation/vim-colors-solarized'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'bling/vim-airline'
Plugin 'itchyny/lightline.vim'
"Plugin 'burnettk/vim-angular'
Plugin 'marijnh/tern_for_vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'rking/ag.vim'
Plugin 'mileszs/ack.vim'
Plugin 'groenewege/vim-less'
Plugin 'tpope/vim-surround'
Plugin 'Raimondi/delimitMate'
Plugin 'mustache/vim-mustache-handlebars'
"Plugin 'Townk/vim-autoclose'
"Plugin 'Shougo/neocomplete'
"Plugin 'Shougo/neosnippet.vim'
"Plugin 'Shougo/neosnippet-snippets'
"Plugin 'nathanaelkane/vim-indent-guides'
"Plugin 'Yggdroot/indentbvine'
"Plugin 'Shougo/unite.vim'
"Plugin 'Shougo/vimfiler'
"Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let mapleader=" "

"""""""" history
set history=100      " keep 100 lines of command line history

"""""""" saving
set nobackup         " file~ is annoying
set autowrite        " write the file out when doing shell commands/make
set noswapfile

"""""""" editing
set backspace=2      " allow backspacing over everything 
set nostartofline    " don't move to the start of line when paging

""""" clibbard sharing
set clipboard=unnamed

"""""""" Ignore Help
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

""""" Easy Escape
inoremap jj <ESC>

"""""""" indenting
"set sw=4         " move 4 spaces to the left/right when shifting text
"set expandtab    " use spaces instead of <tab> when pressing <tab> key
"set smarttab     " pretend I am inserting tabs when really inserting 4 spaces
"set autoindent   " automatic indenting - take the indent of the last line
"set smartindent  " less strict but works for many programming languages
"set cindent          " strict but often better for C-like programming

"""""""" searching
set incsearch        " show search results before we have pressed return
set ignorecase       " this means our searches are case insensitive
set smartcase        " ... unless what we are searching for has a capital
set hlsearch         " turn on hilighting of serach results

"""""""" display
if has("gui_running")
    set cursorline  
endif

set colorcolumn=81
set showcmd          " show partial commands on the status line
set showmatch        " when inserting braces, show me the alternate brace
set ruler            " show the co-ordinates in the bottom-right of the screen
set background=dark  " dont assume white-on-black with syntax highlighting
colorscheme molokai
"colorscheme solarized
set report=0         " inform me when yanking one line
syntax enable            " use syntax highlighting 

set list lcs=tab:\|\ 


"""""""" functions
"set gfn=Source\ Code\ Pro\ for\ Powerline\ Light:h15
set gfn=Sauce\ Code\ Powerline\ Light:h15
"set gfn=Source\ Code\ Pro\ Light:h15
set anti
""set bdlay=30


" toggle word-wrap on and off
function! ToggleWrap()
    if &textwidth == 0
        set textwidth=78
        echo "wrapping text at column 78"
    elseif &textwidth == 78
        set textwidth=75
        echo "wrapping text at column 75"
    else
        set textwidth=0
        echo "not wrapping text"
    endif
endfunction

" toggle listing whitespace on and off
function! ToggleList()
    if &list == 0
        set list
    else
        set nolist
    endif
    set list?
endfunction

"""""""" mappings
" When someone else has defined control-H instead of control-? to be the
" erase key, then we can simply map it to (CTRL-H) instead of getting ^?^?
imap <C-?> <C-H>


set pastetoggle=<F2>

nnoremap <leader>ev :tabedit ~/.vimrc<CR>
nnoremap <leader>sv :so ~/.vimrc<CR>

nmap _h :nohlsearch<CR>
nmap _l :call ToggleList()<CR>
nmap _v :source $vimrc<CR>
nmap _w :call ToggleWrap()<CR>
nmap _x :%!xxd<CR>

" from http://www.vim.org/tips/tip.php?tip_id=173
" allow control J, control K to move around windows nicely
set wmh=0
nmap <C-L> gt
nmap <C-H> gT
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_

map <C-A-left> :bp<CR>
map <C-A-right> :bn<CR>

"""""""" autocommands for different files
"auto BufRead  Makefile set sw=8 noexpandtab nosmarttab " give me real <tab>s
"auto BufLeave Makefile set sw=3 expandtab smarttab " back to normal

"auto BufRead     *.sql set filetype=plsql  " Assume SQL is Oracle
"auto BufRead     *.mako set filetype=html  " Mako templates
"auto BufRead     *.cgi,*.lib,*.pm,*.py,*.pl,*.sql set tabstop=4  " some code has <tab> chars
"auto BufLeave    *.cgi,*.lib,*.pm,*.py,*.pl,*.sql set tabstop=8  " back to normal
"auto BufWritePre *.cgi,*.lib,*.pm,*.py,*.pl,*.sql retab 4 " kill all tabs 

"""""" Line numbers
set relativenumber 
set number    
filetype plugin on

""" Tabs setup
set tabstop=4
set shiftwidth=4
set nosmarttab
set autoindent

" Hide scroll bars
set guioptions-=L

"""""""" sound
set novb             " no visual bells please
set vb t_vb=         " don't beep at me

""""" plugin setup
autocmd vimenter * NERDTree
let NERDTreeIgnore=['\.pyc$','\~$','^__pycache__$']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F8> :NERDTreeToggle<CR>

nmap <F9> :TagbarToggle<CR>

let g:ctrlp_extensions = ['funky']
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1

let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1

let g:multi_cursor_exit_from_visual_mode = 1
let g:multi_cursor_exit_from_insert_mode = 1

"""" Easy Motion
nmap <D-j> <Plug>(easymotion-s)

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"let g:lightline = {
	  "\ 	'colorscheme': 'wombat',
	  "\ 	'component': {
	  "\   
	  "\ 	},
	  "\ 	'component_visible_condition': {
	  "\     }
	  "\ }

"call airline#parts#define_function('goinfo', 'go#complete#GetInfo')
"call airline#parts#define_condition('goinfo', '&ft =~ "go"')
"function! AirlineInit()
    " Ended up not having virtualenv here since for some reason it insisted on having that as a bare string
"    let g:airline_section_x = airline#section#create_right(['goinfo', 'tagbar', 'filetype'])
"endfunction
"autocmd VimEnter * call AirlineInit()

set noshowmode

"""" go-tags
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
	\ }


" vp doesn't replace paste buffer
"function! RestoreRegister()
  "let @" = s:restore_reg
  "return ''
"endfunction
"function! s:Repl()
  "let s:restore_reg = @"
  "return "p@=RestoreRegister()\<cr>"
"endfunction
"vmap <silent> <expr> p <sid>Repl()
