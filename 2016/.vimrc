" dont connect to X
set clipboard=exclude:.*

" compatibility
set nocompatible          " Use Vim defaults instead of vi
set backspace=2           " allow backspacing over everything in insert mode
set history=5000          " 5000 lines of command line history
set viminfo='20,\"50      " 50 lines of registers max

" indentation
set autoindent            " automatic indentation
set ts=4 sw=4 sts=4 et    " tabs at 4 spaces

" buffers
set hidden                " hide buffers instead of closing

" search
set ignorecase            " Do case insensitive matching
set smartcase             " Don't ignore case for uppercase letters
set incsearch             " Incremental search
set hlsearch              " Highlight matching results

" visuals
set ruler                 " the ruler on the bottom is useful
set number                " Show line numbers
set showcmd               " Show (partial) command in status line.
set laststatus=2          " always have status bar
set scrolloff=1           " dont let the curser get too close to the edge
set linebreak             " This displays long lines as wrapped at word boundries
set showmatch             " Show matching brackets.
set matchtime=10          " Time to flash the brack with showmatch
colorscheme monokai      " a colorscheme to use
set t_ut=                 " disable background color erase


function ExtendedHome()
    let column = col('.')
    normal! ^
    if column == col('.')
        normal! 0
    endif
endfunction
noremap <silent> <Home> :call ExtendedHome()<CR>
inoremap <silent> <Home> <C-O>:call ExtendedHome()<CR>

set wildignore=*.o,*.pyc,*.so,*.swp,*.zip "Ignore these extensions when expanding paths

" bash tabs for wildmode
set wildmenu
set wildmode=list:longest,full

" vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
call vundle#end()

let g:NERDTreeDirArrows = 0
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = 'v'

set encoding=utf-8
set fileencoding=utf-8

syntax on
filetype plugin indent on

set laststatus=2
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme = 'badwolf'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'ra'  "Default to head of repo, or current working directory
let g:ctrlp_max_files = 0             "Don't limit how many files to scan
let g:ctrlp_max_depth = 40            "Don't go farther than 40 levels deep into a directory

" for command mode
nnoremap <S-Tab> <<
" " for insert mode
inoremap <S-Tab> <C-d>

"let g:clang_use_library = 1
"let g:clang_debug = 1
"let g:clang_complete_auto = 1
"let g:clang_library_path='/opt/bb/lib/llvm-3.8/lib64/libclang.so.3.8'
"let g:clang_user_options='-std=c++13 -I/bb/build/Linux-x86_64/release/robolibs/stage/dpkgroot/opt/bb/include '


filetype plugin indent on


set expandtab
set shiftwidth=4  "this is the level of autoindent, adjust to taste
set backspace=indent,eol,start
set novisualbell
set mouse=a
set colorcolumn=80


" Use ctrl-[hjkl] to navigate splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>


map <D-A-RIGHT> <C-w>l
map <D-A-LEFT> <C-w>h
map <D-A-DOWN> <C-w><C-w>
map <D-A-UP> <C-w>W

let g:rehash256 = 1


nmap <S-Up> v<Up>
nmap <S-Down> v<Down>
nmap <S-Left> v<Left>
nmap <S-Right> v<Right>
vmap <S-Up> <Up>
vmap <S-Down> <Down>
vmap <S-Left> <Left>
vmap <S-Right> <Right>


function! Auto_complete_string()
    if pumvisible()
        return "\<C-n>"
    else
        return "\<C-x>\<C-o>\<C-r>=Auto_complete_opened()\<CR>"
    end
endfunction

function! Auto_complete_opened()
    if pumvisible()
        return "\<Down>"
    end
    return ""
endfunction

inoremap <expr> <Nul> Auto_complete_string()
inoremap <expr> <C-Space> Auto_complete_string()
