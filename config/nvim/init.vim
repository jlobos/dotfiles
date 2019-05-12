call plug#begin('~/.config/nvim/plugged')

" Colorscheme

Plug 'dracula/vim', { 'as': 'dracula' }

" Git

Plug 'airblade/vim-gitgutter'   " ┐ Shows a git diff in the gutter.
let g:gitgutter_map_keys = 0    " ┘ Disable all key mappings.

" Utils

Plug '/usr/local/opt/fzf'       " ┐ fzf is a general-purpose
Plug 'junegunn/fzf.vim'         " ┘ command-line fuzzy finder.

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

" Remap leader key to ,
let g:mapleader = ','

" Exploration
map <leader>e :Explore<cr>
let g:netrw_banner = 0          " Removing the banner.
let g:netrw_liststyle = 3       " Directory view in netrw.

" fzf
map <leader>f :Files<cr>
" ag (the_silver_searcher) search result
map <leader>a :Ag<space>
" Open buffers
map <leader>b :Buffers<cr>

" vim-commentary
map <leader>c :Commentary<cr>

" Fast write, quit, refresh (edit)
map <leader>w :w!<cr>
map <leader>q :q<cr>
map <leader>r :e!<cr>

" Windows navigation
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l
map <leader>h <C-W>h

" Tab
map <leader>t :tabnew<cr>

" Quickly edit/reload this configuration file
nnoremap <leader>v :source $MYVIMRC<cr>

" Terminal
map <leader>s :terminal<cr>
" To map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

"
" UI
"

" Enable true color support
set termguicolors

syntax on
colorscheme dracula

" Vertical Split bar styling
hi VertSplit guibg=bg guifg=bg

"
" Miscellaneous
"

set autoindent
" Automatically re-read file if a change was detected outside of vim
set autoread
set backspace=eol,start,indent
" Yank and paste with the system clipboard
set clipboard+=unnamedplus
set cmdheight=1
set encoding=utf-8
" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:\ ,
set foldlevel=2
set foldmethod=indent
set foldnestmax=10
" Hides buffers instead of closing them
set hidden
set hlsearch
" Ignore case when searching
set ignorecase
set incsearch
set laststatus=0
set lazyredraw
set mouse=
set nofoldenable
" Disable line numbers
set nonumber
set nowb
" Do not wrap long lines by default
set nowrap
set showmatch
set smartindent
set smarttab
" Set preview window to appear at bottom
set splitbelow
set splitright
set tabstop=2
set whichwrap+=<,>,h,l
set wildmenu

"
" Status Line
"

" Disable line/column number in status line
set noruler
" Don't dispay mode in command line
set noshowmode
" Don't show last command
set noshowcmd

"
" TAB/Space settings
"

" Insert spaces when TAB is pressed.
set expandtab
" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2
" Indentation amount for < and > commands.
set shiftwidth=2

"
" Search
"

" Ignore case when searching
set ignorecase
" If the search string has an upper case letter in it, the search will be case sensitive
set smartcase

"
" Backups
"

set nobackup
set noswapfile

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
