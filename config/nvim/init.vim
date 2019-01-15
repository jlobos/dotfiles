call plug#begin('~/.config/nvim/plugged')

" Colorscheme

Plug 'dracula/vim', { 'as': 'dracula' }

" Git

Plug 'airblade/vim-gitgutter'   " ┐ Shows a git diff in the gutter.
let g:gitgutter_map_keys = 0    " ┘ Disable all key mappings.

" Utils

Plug '/usr/local/opt/fzf'       " ┐ fzf is a general-purpose
Plug 'junegunn/fzf.vim'         " ┘ command-line fuzzy finder.

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Lint

" Ale
Plug 'w0rp/ale'                 " ┐ Asynchronous linting/fixing.
let g:ale_fix_on_save = 1       " ┘ Fix files when you save them.
let g:ale_sign_warning = '→'
let g:ale_sign_error = '→'
let g:ale_fixers = {'javascript': ['prettier']}
let g:ale_linters = {'javascript': ['xo']}

" Wrapper for prettier
Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Edit

Plug 'jiangmiao/auto-pairs'     " Insert or delete brackets,
                                " parens, quotes in pair.

Plug 'tpope/vim-commentary'     " Comment stuff out.

Plug 'tpope/vim-surround'       " Mappings to easily delete, change
                                " and add such surroundings in pairs.

" Syntax

Plug 'pangloss/vim-javascript'  " Javascript indentation and syntax support.

Plug 'ap/vim-css-color'         " ┐ Preview colours in source code.
Plug 'hail2u/vim-css3-syntax'   " ┘ CSS3 syntax.

Plug 'chr4/nginx.vim'           " NGINX syntax highlighting.

Plug 'fatih/vim-go'             " Go development plugin.

Plug 'udalov/kotlin-vim'        " Kotlin syntax.
autocmd Filetype kotlin setlocal tabstop=4 shiftwidth=4
autocmd FileType kotlin setlocal commentstring=//\ %s

Plug 'mattn/emmet-vim'          " The essential toolkit for web-developers.

call plug#end()

"
" Maps
"

let mapleader = ','
let g:mapleader = ','

" Exploration
map <leader>e :Explore<cr>
let g:netrw_banner = 0          " Removing the banner.
let g:netrw_liststyle = 3       " Directory view in netrw.

" fzf
map <leader>f :Files<cr>
" ag (the_silver_searcher) search result
map <leader>a :Ag<space>

" vim-commentary
map <leader>c :Commentary<cr>

" Fast write, quit, refresh
map <leader>w :w!<cr>
map <leader>q :q<cr>
map <leader>r :edit<cr>

" Windows navigation
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l
map <leader>h <C-W>h

" Tab
map <leader>t :tabnew<cr>

" Move a line of text using CTRL+[jk] or Comamnd+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Quickly edit/reload this configuration file
nnoremap <leader>v :source $MYVIMRC<cr>

" To map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

"
" UI
"

if (has("termguicolors"))
  set termguicolors
endif

syntax on

colorscheme dracula

set background=dark

" Comments Italic
hi Comment      gui=italic cterm=italic

"
" :)
"

set autoindent
set autoread
set backspace=eol,start,indent
set clipboard+=unnamedplus
set cmdheight=1
set encoding=utf-8
set expandtab
set fillchars+=vert:\ ,
set foldlevel=2
set foldmethod=indent
set foldnestmax=10
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=0
set lazyredraw
set mouse=
set nobackup
set nofoldenable
set nonumber
set noruler
set noshowcmd
set noswapfile
set nowb
set nowrap
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set whichwrap+=<,>,h,l
set wildmenu

"
" Other
"

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

" Filetype detect for .babelrc
autocmd BufRead .babelrc set filetype=json

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
  augroup END
