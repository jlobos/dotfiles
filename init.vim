call plug#begin('~/.config/nvim/plugged')

" Colors
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'

" Snipmate
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Git
Plug 'airblade/vim-gitgutter'

" Syntax
Plug 'ap/vim-css-color'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'gavocanov/vim-js-indent'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'othree/yajs.vim'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Utils
Plug 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup = 1
Plug 'scrooloose/nerdtree'
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable = '»'
let g:NERDTreeDirArrowCollapsible = '«'
map <C-n> :NERDTreeToggle<cr>

" Lint
Plug 'benekastah/neomake'
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']
autocmd! BufWritePost * Neomake

" Edit
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
let NERDSpaceDelims=1

call plug#end()

"
" Maps
"

let mapleader=','
let g:mapleader=','
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>r :edit<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Move a line of text using CTRL+[jk] or Comamnd+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Tab
nnoremap <C-t> :tabnew<cr>
nnoremap <C-i> :tabnext<cr>
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR><Paste>

"
" Colors
"

syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
" colorscheme onedark
" colorscheme one
colorscheme OceanicNext

hi Comment gui=italic cterm=italic
hi Normal guibg=none ctermbg=none
hi LineNr guifg=none guibg=none ctermfg=8 ctermbg=0
hi StatusLine guifg=none guibg=none ctermfg=8 ctermbg=0
hi StatusLineNC guifg=none guibg=none ctermfg=8
hi TabLineFill guibg=none ctermbg=0
hi TabLine guibg=none ctermbg=0
hi TabLineSel guibg=none ctermbg=0
hi VertSplit guifg=none guibg=none ctermfg=0 ctermbg=0
hi GitGutterAdd guibg=none ctermbg=none
hi GitGutterChange guibg=none ctermbg=none
hi GitGutterDelete guibg=none ctermbg=none
hi GitGutterChangeDelete guibg=none ctermbg=none
hi NeomakeErrorSign guibg=none ctermbg=none


"
" :)
"

set autoindent
set autoread
set backspace=eol,start,indent
set clipboard+=unnamedplus
set cmdheight=1
" set colorcolumn=80
" set cursorline
set encoding=utf-8
set expandtab
set fillchars+=vert:\
set foldlevel=2
set foldmethod=indent
set foldnestmax=10
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set mouse=a
set nobackup
" set noexpandtab
set nofoldenable
set noswapfile
set nowb
set number
set numberwidth=3
set ruler
set shiftwidth=2
set showcmd
set showmatch
set smartcase
set smartindent
set smarttab
set so=10
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set textwidth=80
set whichwrap+=<,>,h,l
set wildmenu
set wrap

"
" Format the status line
"

set statusline =
set statusline +=\ %f       " File
set statusline +=\ %l:%v    " Current line and column
set statusline +=%=         " End line
set statusline +=\ %{toupper(&fenc!=''?&fenc:&enc)}   " Encoding
set statusline +=\ %{&ft!=''?&ft:'Plaint\ Text'}      " File type

"
" Other
"

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
  augroup END
