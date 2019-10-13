" Install the vim-plug
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
endif
call plug#begin('~/.nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'yuttie/comfortable-motion.vim'
Plug 'morhetz/gruvbox'
Plug 'godlygeek/csapprox'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"fzf
let g:fzf_command_prefix = 'Fzf'
nmap <leader><tab> <plug>(fzf-maps-n)
nmap <leader><tab> <plug>(fzf-maps-x)
nmap <leader><tab> <plug>(fzf-maps-o)
nmap <leader>ff :FzfFiles<CR>
nmap <leader>fb :FzfBuffers<CR>

set termguicolors
syntax enable
filetype plugin indent on
" colorscheme nofrils-dark

colorscheme gruvbox
let g:gruvbox_italic='1'
let g:gruvbox_italicize_strings='1'
let g:gruvbox_italicize_comments='1'

set background=dark

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


if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

" Status line format
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

map <space> <leader>
" Leader key mapping to ;
" let mapleader = ';'

" stop a window from popping when quit if mistyped.
map q: :q

setlocal spell spelllang=en_us
" Map spell correction to ctrl-L
" imap <c-f> <c-g>u<Esc>[s1z=`]a<c-g>u
" nmap <c-f> [s1z=<c-o>

" toggle Tagbar
map <C-n> :TagbarToggle<return>

" Move a line of text using ALT+[jk] or Command+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" mapping for switching buffers.
nmap <Leader>bn :bn<return>       " buffer next
nmap <Leader>bp :bp<return>       " buffer previous
nmap <Leader>dcb :bd<return>      " buffers delete
" nmap <Leader>bx :bx<return>       " switch buffer viewpoint

" mapping to switch splits.
nmap <Leader>l <C-w>l
nmap <Leader>j <C-w>j
nmap <Leader>h <C-w>h
nmap <Leader>k <C-w>k
nmap <Leader>wq <C-w>q
nmap <Leader>ww <C-w>w

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
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee,*.go,*.ml,*.c,*.cpp,*.h,*.hpp,*.hs :call CleanExtraSpaces()
endif

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

" remap tab and shift-tab for auto-completion selection.
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" this is for the airline
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" vim-gitgutter
let g:gitgutter_enabled = 1
" Disable all the key-mappings.
let g:gitgutter_map_keys = 0

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
