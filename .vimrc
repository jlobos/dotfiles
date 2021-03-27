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
  nnoremap <leader>gd :Gdiff<cr>
  nnoremap <leader>gc :G commit -v -q<cr>

" command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  nnoremap <leader>a :Ag<space>
  nnoremap <leader>b :Buffers<cr>
  nnoremap <leader>f :GFiles<cr>
  nnoremap <leader>gs :GFiles?<cr>

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

" Neovim lenguage server client
Plug 'neovim/nvim-lspconfig'

" Auto completion
Plug 'hrsh7th/nvim-compe'
  set completeopt=menuone,noselect
  let g:compe = {}
  let g:compe.enabled = v:true
  let g:compe.autocomplete = v:true
  let g:compe.debug = v:false
  let g:compe.min_length = 1
  let g:compe.preselect = 'enable'
  let g:compe.throttle_time = 80
  let g:compe.source_timeout = 200
  let g:compe.incomplete_delay = 400
  let g:compe.max_abbr_width = 100
  let g:compe.max_kind_width = 100
  let g:compe.max_menu_width = 100
  let g:compe.documentation = v:true
  let g:compe.source = {}
  let g:compe.source.path = v:true
  let g:compe.source.buffer = v:true
  let g:compe.source.calc = v:true
  let g:compe.source.nvim_lsp = v:true
  let g:compe.source.nvim_lua = v:true
  let g:compe.source.vsnip = v:true

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
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Kotlin syntax
Plug 'udalov/kotlin-vim'

" Swift syntax and indent files
Plug 'keith/swift.vim'

" Markdown
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" Rust
Plug 'rust-lang/rust.vim'

call plug#end()

" ============================================================================
" Lua
" ============================================================================

lua << EOF
local nvim_lsp = require('lspconfig')

local servers = { "pyright", "tsserver" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF

" ============================================================================
" Maps
" ============================================================================

" LSP config
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>

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

" Automatically re-read file if a change was detected outside of vim
set autoread
" Make backspace work as you would expect
set backspace=eol,start,indent
" Yank and paste with the system clipboard
set clipboard+=unnamedplus
" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:\ ,
" Hides buffers instead of closing them
set hidden
" Only redraw when necessary
set lazyredraw
" Disable mouse
set mouse=
" Do not wrap long lines by default
set nowrap
" When a bracket is inserted, briefly jump to the matching one
set showmatch
set whichwrap+=<,>,h,l

" Open new windows below the current window
set splitbelow
" Open new windows right of current window
set splitright

"
" Status Line
"

" Don't show statusline
set laststatus=0
" Disable line/column number in status line
set noruler
" Don't dispay mode in command line
set noshowmode
" Don't show last command
set noshowcmd

"
" TAB/Space settings
"

set smartindent
set smarttab
" Indent according to previous line
set autoindent
" Insert spaces when TAB is pressed
set expandtab
" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2
" Indentation amount for < and > commands
set shiftwidth=2

"
" Search
"

" Highlight while searching with / or ?
set incsearch
" Keep matches highlighted
set hlsearch
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
