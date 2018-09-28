call plug#begin('~/.nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/nerdcommenter'
Plug 'yuttie/comfortable-motion.vim'
Plug 'PBhandari99/nofrils'
Plug 'reedes/vim-colors-pencil'
" Plug 'owickstrom/vim-colors-paramount'
" Plug 'mhartington/oceanic-next'
" Plug 'junegunn/seoul256.vim'
Plug 'godlygeek/csapprox'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'zchee/deoplete-clang', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/deoplete-clangx', { 'for': ['c', 'cpp'] }
Plug 'zchee/libclang-python3'
Plug 'Shougo/neoinclude.vim'
Plug 'zchee/deoplete-jedi', { 'for': 'python' }
Plug 'eagletmt/neco-ghc'
Plug 'copy/deoplete-ocaml', { 'for': 'ocaml' }
Plug 'rust-lang/rust.vim'
" Plug 'sebastianmarkow/deoplete-rust'
Plug 'racer-rust/vim-racer'
Plug 'scrooloose/syntastic', {'for': ['c', 'cpp']}
" Plug 'w0rp/ale'
Plug 'neomake/neomake', {'for': ['ocaml', 'python', 'rust']}
Plug 'vim-airline/vim-airline'
Plug 'wincent/command-t', {
    \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
    \ }

call plug#end()


set termguicolors
syntax enable
filetype plugin indent on
set background=dark
colorscheme nofrils-dark
" colorscheme paramount
" colorscheme OceanicNext
" let g:seoul256_background = 235
" colo seoul256

" Set to auto read when a file is changed from the outside
set autoread

" show cursor position.
" set ruler
set number
" Show number ruler.

" show relative numbers in the ruler.
set relativenumber

" Height of the command bar
set cmdheight=2

" hide the buffer if it's not in use
set hid

" Ignore case when searching
set ignorecase

" Dah
set noswapfile

" let vim set the terminal title.
set title

" same indententation as the line above
set autoindent
set smartindent

" tabs -> spaces
set expandtab

" Indentation is 4 character
set shiftwidth=4

" tab is 2 character
set softtabstop=2

" write when switching buffers
set autowrite

" Linebreak on 500 characters
set lbr
set tw=500

" Autosave buffers before leaving them
autocmd BufLeave * silent! :wa

" copy to system clipboard when you yank
set clipboard=unnamedplus

set colorcolumn=80               " highlight the 80th column as an indicator

set cursorline                    " highlight the current line for the cursor

set list                          " show trailing whitespace

" Show matching brackets when text indicator is over them
set showmatch

" Show current mode
set showmode

" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=1

" search as characters are entered
set incsearch

" highlight the search
" check this link for highlight as you search:
" https://github.com/haya14busa/incsearch.vim
set hlsearch
" let g:incsearch#auto_nohlsearch = 1

" to unhighlight the highlighted search
" either :noh or esc
nnoremap <esc> :noh<return><esc>

" create horizantal split below the current window
set splitbelow
set splitright

" Always show the status line
set laststatus=2

" look `:help updatetime`
set updatetime=100

" Status line format
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

" ocaml settings
set rtp+=/home/bit-wangler/.opam/system/share/merlin/vim

map <space> <leader>
" Leader key mapping to ;
" let mapleader = ';'

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" mapping for switching buffers.
nmap <Leader>bn :bn<return>       " buffer next
nmap <Leader>bp :bp<return>       " buffer previous
nmap <Leader>dcb :bd<return>      " buffers delete

" mapping to switch splits.
nmap <Leader>l <C-w>l
nmap <Leader>j <C-w>j
nmap <Leader>h <C-w>h
nmap <Leader>k <C-w>k
nmap <Leader>wq <C-w>q

" Open terminal in a split split
command! Vtm vsplit | terminal
command! Stm split | terminal
" nmap <Leader>Vt Vte

" Making the mispelled work.
command! -bang WQ wq<bang>
command! -bang Wq wq<bang>
command! -bang Wqa wqa<bang>
command! -bang W w<bang>
command! -bang Q q<bang>

" use 'Y' to yank to the end of a line, instead of the whole line
nnoremap <silent> Y y$

" :cd. change working directory to that of the current file
cmap cd. lcd %:p:h

"this will automatically resize the terminal vim when opened
"if !has('gui_running')
  "if exists("+lines")
    "set lines=72
  "endif
  "if exists("+columns")
    "set columns=175
  "endif
"endif

 " Maps the key ;h to open command-t from home dir.
 " nmap <Space>h :CommandT ~/<return>

 " Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

 " Delete trailing whitespaces on save.
fun! CleanExtraSpaces()
   let save_cursor = getpos(".")
   let old_query = getreg('/')
   silent! %s/\s\+$//e
   call setpos('.', save_cursor)
   call setreg('/', old_query)
endfun

if has("autocmd")
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" Toggle NERDTree with ctr-n.
map <C-n> :NERDTreeToggle<CR>
" Exit vim if the last buffer is NERDTree
autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif

" comfortable-motion
let g:comfortable_motion_friction = 0.0
let g:comfortable_motion_air_drag = 4.0

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Use deoplete.
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#auto_completion_delay = 3
let g:tern_request_timeout = 1

" clang
" let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so.6.0'
" let g:deoplete#sources#clang#clang_header = '/usr/include/clang/'
" let g:deoplete#sources#clang#sort_algo = 'priority'
" let g:deoplete#sources#clang#clang_complete_database = './Build'
" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.cpp = '[^. *\t]\.\w*|[^. *\t]\::\w*|[^. *\t]\->\w*|#include\s*[<"][^>"]*'
" let g:deoplete#omni#input_patterns={}
" let g:deoplete#omni#input_patterns.cpp = ['[^. *\t]\.\w*','[^. *\t]\::\w*','[^. *\t]\->\w*','#include\s*[<"][^>"]*']
" let g:clang_close_preview = 1

" show documentation when selecting python auto-completion.
let g:deoplete#sources#jedi#show_docstring = 1

" Ocaml
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources.ocaml = ['buffer', 'around', 'member', 'tag']
" let g:deoplete#omni_patterns.ocaml = '[^ ,;\t\[()\]]'

" Rust
let g:racer_cmd = "/home/pb/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let $RUST_SRC_PATH = "/home/pb/.rust/src/rust/src"
" let g:deoplete#sources#rust#racer_binary='/home/pb/.cargo/bin/racer'
" let g:deoplete#sources#rust#rust_source_path='/home/pb/.rust/src/rust/src'
" let g:deoplete#sources#rust#documentation_max_height=20
" let g:deoplete#sources#rust#disable_keymap=1


" remap tab and shift-tab for auto-completion selection.
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

"neomake
" Run NeoMake on read and write operations
if &filetype == 'c' || &filetype == 'cpp'
    autocmd! BufReadPost,BufWritePost * Neomake
    let g:neomake_open_list = 2
endif

" ale
" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '__'
" let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
" let g:ale_lint_on_text_changed = 0
" let g:ale_lint_on_save = 1
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_wq = 0

" Set this. Airline will handle the rest.
let g:airline#extensions#syntastic#enabled = 1

" this is for the airline
let g:airline_powerline_fonts = 1
let g:airline_theme = 'pencil'
" let g:airline_theme='oceanicnext'
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" vim-gitgutter
let g:gitgutter_enabled = 1
" Disable all the key-mappings.
let g:gitgutter_map_keys = 0
