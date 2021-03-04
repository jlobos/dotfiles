" Remap leader key to ,
let mapleader = ','
let maplocalleader = ','

" ============================================================================
" Plugins
" ============================================================================

call plug#begin('~/.config/nvim/plugged')

" Colorscheme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arzg/vim-colors-xcode'

"
" Utils
"

" hyperfocus
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
  nnoremap <leader>ll :Limelight!!0.6<cr>

" Shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'

" git wrapper
Plug 'tpope/vim-fugitive'
  nnoremap <leader>ga :Gw<cr>

" command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  nnoremap <leader>a :Ag<space>
  nnoremap <leader>b :Buffers<cr>
  nnoremap <leader>f :Files<cr>
  nnoremap <leader>gf :GFiles<cr>
  nnoremap <leader>gs :GFiles?<cr>

" Make your Vim/Neovim as smart as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" wrapper for prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Comment stuff out
Plug 'tpope/vim-commentary'
  nnoremap <leader>c :Commentary<cr>

" Mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-surround'

" Switch between single-line and multiline forms of code
Plug 'AndrewRadev/splitjoin.vim'

" Quick Google lookup directly from Vim
Plug 'szw/vim-g'
  nnoremap <leader>s :Google<space>

Plug 'vim-test/vim-test'
  nnoremap <leader>t :TestNearest<cr>

"
" Syntax
"

" Javascript indentation and syntax support
Plug 'pangloss/vim-javascript'

" Typescript syntax
Plug 'HerringtonDarkholme/yats.vim'

" Preview colours in source code
Plug 'ap/vim-css-color'

" CSS3 syntax
Plug 'hail2u/vim-css3-syntax'

" Go development plugin
Plug 'fatih/vim-go'

" Kotlin syntax
Plug 'udalov/kotlin-vim'

call plug#end()

" ============================================================================
" Maps
" ============================================================================

" Save, Quit and Refresh (edit)
nnoremap <leader>w :update<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>r :e!<cr>

" Exploration
nnoremap <leader>e :Explore<cr>
  let g:netrw_banner = 0          " Removing the banner
  let g:netrw_liststyle = 3       " Directory view in netrw
  let g:netrw_localrmdir="trash"  " Allow netrw to remove non-empty local directories

" Windows navigation
nnoremap <leader>j <C-W>j
nnoremap <leader>k <C-W>k
nnoremap <leader>l <C-W>l
nnoremap <leader>h <C-W>h

" qq to record, Q to replay
nnoremap Q @q

" ============================================================================
" UI
" ============================================================================

" Enable true color support
set termguicolors
" Syntax highlighting
syntax on

" colorscheme dracula
  " hi Comment gui=italic guifg=#6272A4

colorscheme xcodedark
  hi Comment cterm=italic gui=italic

" ============================================================================
" Miscellaneous
" ============================================================================

" Give more space for displaying messages
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
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
set nowritebackup

"
" Other
"

" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

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
