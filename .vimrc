set nocompatible              " be iMproved, required

function! BuildYCM(info)
	" info is a dictionary with 3 fields
	" - name:  name of the plugin
	" - status: 'installed', 'updated', or 'unchanged'
	" - force:  set on PlugInstall! or PlugUpdate!
	if a:info.status == 'installed' || a:info.force
		!./install.sh
	endif
endfunction

" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

call plug#begin('~/.vim/plugged')

"Plug 'gmarik/Vundle.vim'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } 
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'tomasr/molokai'
Plug 'scrooloose/nerdcommenter'
Plug 'Valloric/YouCompleteMe', { 'do' : 'BuildYCM' }
Plug 'kristijanhusak/vim-multiple-cursors'
Plug 'altercation/vim-colors-solarized'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
"Plug 'JazzCore/ctrlp-cmatcher', {'do': './install.sh'}
Plug 'itchyny/lightline.vim'
"Plug 'klen/python-mode'
"Plug 'TFenby/python-mode', { 'branch' : 'develop' }
Plug 'yosiat/oceanic-next-vim'
"Plug 'marijnh/tern_for_vim'
"let g:tern_map_keys=1
"let g:tern_show_argument_hints='on_hold'
"let g:tern_show_argument_hints='on_move'

Plug 'tpope/vim-dispatch'
Plug 'garyburd/go-explorer'
Plug 'fatih/vim-nginx' , {'for' : 'nginx'}
Plug 'elzr/vim-json', {'for' : 'json'}

Plug 'Lokaltog/vim-easymotion'
Plug 'rking/ag.vim'
"Plug 'mileszs/ack.vim'
Plug 'groenewege/vim-less'
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'mustache/vim-mustache-handlebars'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
"Plug 'facebook/vim-flow'

"Plug 'mattn/gist-vim'
Plug 'mxw/vim-jsx'
Plug 'justinj/vim-react-snippets', { 'for': 'javascript' }
Plug 'scrooloose/syntastic'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'ramitos/jsctags', { 'for': 'javascript' }
"Plug 'heavenshell/vim-jsdoc'

" Visually sets marks
Plug 'kshenoy/vim-signature'

Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular'

" Expand/shrink the visual selection by text-object blocks with `+` and `_` in
" the visual mode
Plug 'terryma/vim-expand-region'

" Undo/Redo tree
Plug 'sjl/gundo.vim'

"Plug 'FelikZ/ctrlp-py-matcher'
"Plug 'JarrodCTaylor/vim-python-test-runner'

"Plug 'evilpie/jsctags'
"Plug 'sosmo/vim-easyreplace'
"Plug 'burnettk/vim-angular'
"Plug 'bling/vim-airline'
"Plug 'terryma/vim-multiple-cursors'
"Plug 'Townk/vim-autoclose'
"Plug 'Shougo/neocomplete'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'nathanaelkane/vim-indent-guides'
"Plug 'Yggdroot/indentbvine'
"Plug 'Shougo/unite.vim'
"Plug 'Shougo/vimfiler'
"Plug 'YankRing.vim'

" All of your Plugins must be added before the following line
call plug#end()
call plug#end()

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
	set list lcs=tab:\|\ 
	set colorcolumn=81
	set gfn=Sauce\ Code\ Powerline\ Light:h17
	set anti
endif

set showcmd          " show partial commands on the status line
set showmatch        " when inserting braces, show me the alternate brace
set ruler            " show the co-ordinates in the bottom-right of the screen
set background=dark  " dont assume white-on-black with syntax highlighting
colorscheme monokai
"colorscheme Tomorrow-Night-Eighties
set report=0         " inform me when yanking one line
syntax enable        " use syntax highlighting 


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
"nmap <C-L> gt
"nmap <C-H> gT
nmap <C-S-j> <C-W>j<C-W>_
nmap <C-S-k> <C-W>k<C-W>_
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

map <C-A-left> :bp<CR>
map <C-A-right> :bn<CR>

"""""""" move over wraped lines
nnoremap k gk
nnoremap gk k
nnoremap j gj
nnoremap gj j

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
"if has("gui_running")
	"autocmd vimenter * NERDTree
	let NERDTreeIgnore=['\.pyc$','\~$','^__pycache__$']
	let NERDTreeShowBookmarks=1
	autocmd StdinReadPre * let s:std_in=1
	"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
	map <F8> :NERDTreeToggle<CR>
	map <S-F8> :NERDTreeFind<CR>
	nmap <F9> :TagbarToggle<CR>
"endif

let g:tagbar_ctags_bin = '/usr/local/bin/ctags'


"""" Control-P
let g:ctrlp_extensions = ['funky']
nnoremap <Leader>f :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>F :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>l :CtrlPBuffer<Cr>

" Set delay to prevent extra search
"let g:ctrlp_match_func  = {'match' : 'matcher#cmatch'}
"let g:ctrlp_lazy_update = 100

" Do not clear filenames cache, to improve CtrlP startup
" You can manualy clear it by <F5>
"let g:ctrlp_clear_cache_on_exit = 0

" Set no file limit, we are building a big project
"let g:ctrlp_max_files = 0

" If ag is available use it as filename list generator instead of 'find'
"if executable("ag")
"	set grepprg=ag\ --nogroup\ --nocolor
"	let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --ignore ''.git'' --ignore ''.DS_Store'' --ignore ''node_modules'' --hidden -g" '
"endif



"""" Vim-go
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_fail_silently = 1
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_dispatch_enabled = 1
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

set completeopt=menu
let g:ycm_autoclose_preview_window_after_completion = 1

"let g:multi_cursor_exit_from_visual_mode = 1
"let g:multi_cursor_exit_from_insert_mode = 1

"""" Easy Motion
nmap <D-j> <Plug>(easymotion-s)

"""" NerdCommenter
map <D-/> <leader>c<space>

"""" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"""" JSX
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:jsx_pragma_required = 0


"""" Syntastic
"let g:syntastic_go_checkers = ['go', 'golint', 'govet']
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '☠'
let g:syntastic_style_warning_symbol = '⚑'
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1
"let g:syntastic_check_on_wq = 1
"let g:syntastic_auto_loc_list = 1
"highlight SyntasticErrorSign guifg=white guibg=red
"highlight SyntasticStyleErrorSign guifg=white guibg=#2f0000  
"highlight SyntasticErrorLine guibg=#2f0000  
"highlight SyntasticError guibg=#2f0000  



let g:syntastic_enable_python_checker = 0
let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_go_checkers = ['go', 'golint', 'govet']
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 0
"let g:syntastic_check_on_open = 1
"let g:syntastic_mode_map = { 
		"\ 'mode': 'passive', 
		"\ 'active_filetypes': ['go','javascript', 'javascript.jsx']
	"\ }


""""" lightline
let g:lightline = {
	  \ 	'colorscheme': 'wombat',
	  \ 	'component': {
	  \   
	  \ 	},
	  \ 	'component_visible_condition': {
	  \     }
	  \ }

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


" ==================== YouCompleteMe ====================
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_min_num_of_chars_for_completion = 1

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        if pumvisible()
            return "\<C-n>"
        else
            call UltiSnips#JumpForwards()
            if g:ulti_jump_forwards_res == 0
               return "\<TAB>"
            endif
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-e>"
" this mapping Enter key to <C-y> to chose the current highlight item 
" and close the selection list, same as other IDEs.
" CONFLICT with some plugins like tpope/Endwise
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"g:UltiSnipsJumpForwardTrigger="<cr>"


" Save undo history persistently on disk, takes extra space "{{{
if has('persistent_undo')         " persistend undo history
  " create the directory if it doesn't exist
  silent !mkdir ~/.vim/undo > /dev/null 2>&1
  set undofile                  " Save undo's after file closes
  set undodir=~/.vim/undo/      " where to save undo histories
  set undolevels=100            " How many undos
  set undoreload=3000           " number of lines to save for undo
endif
"}}}


