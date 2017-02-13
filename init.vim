call plug#begin('~/.config/nvim/plugged')

" Colors
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
Plug 'joshdick/onedark.vim'
Plug 'MaxSt/FlatColor'
Plug 'jdkanani/vim-material-theme'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'freeo/vim-kalisi'
Plug 'jlobos/perfect'

" Snipmate
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Git
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0

" Syntax
Plug 'HerringtonDarkholme/yats.vim'
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/html5.vim'
Plug 'ap/vim-css-color'
Plug 'cakebaker/scss-syntax.vim'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'gavocanov/vim-js-indent'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'mustache/vim-mustache-handlebars'
Plug 'posva/vim-vue'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
let g:deoplete#enable_at_startup = 1
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }

" Utils
Plug 'scrooloose/nerdtree'
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

" Lint
Plug 'benekastah/neomake'
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']
autocmd! BufWritePost * Neomake

" Edit
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

call plug#end()

"
" Maps
"

let mapleader = ','
let g:mapleader = ','

" NERD Tree
map <leader>n :NERDTreeToggle<cr>

" Fast write, quit, refresh
map <leader>w :w!<cr>
map <leader>q :q<cr>
map <leader>r :edit<cr>

" Windows vertical & horizontal
map <leader>\| :vnew<cr>
map <leader>- :new<cr>

" Windows navigation
map <leader>j <C-W>j
map <leader>k <C-W>k
map <leader>l <C-W>l
map <leader>h <C-W>h

" Open terminal in new tab
map <leader>s :tabnew \| terminal<cr>

" Terminal adapt to normal navigation
tnoremap <Esc> <C-\><C-n>
tnoremap <leader>h <C-\><C-n><C-w>h
tnoremap <leader>j <C-\><C-n><C-w>j
tnoremap <leader>k <C-\><C-n><C-w>k
tnoremap <leader>l <C-\><C-n><C-w>l

" vim-commentary
map <leader>c :Commentary<cr>

" Tab
map <leader>t :tabnew<cr>
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 :tablast<cr>

" Move a line of text using CTRL+[jk] or Comamnd+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" j/k moves up/down row by row, not line by line
noremap j gj
noremap k gk

"
" UI
"

syntax on
set termguicolors
set background=dark

colorscheme one
" colorscheme onedark
" colorscheme OceanicNext
" colorscheme flatcolor
" colorscheme material-theme
" colorscheme hybrid_material
" colorscheme quantum
" colorscheme kalisi
" colorscheme perfect

" Hacking color scheme

hi Normal guibg=none
hi ErrorMsg guibg=none

set fillchars+=vert:\ ,

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
set foldlevel=2
set foldmethod=indent
set foldnestmax=10
set hidden
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set mouse=
set nobackup
set nofoldenable
set noshowcmd
set noswapfile
set nowb
set nowrap
set number
set numberwidth=3
set ruler
set shiftwidth=2
set showmatch
set smartcase
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabstop=2
set textwidth=80
set whichwrap+=<,>,h,l
set wildmenu

"
" Format the status line
"

set statusline=
set statusline+=\ %f                                 " File
set statusline+=\ %l:%v                              " Current line and column
set statusline+=%=                                   " End line
set statusline+=\ %{toupper(&fenc!=''?&fenc:&enc)}   " Encoding
set statusline+=\ %{&ft!=''?&ft:'Plaint\ Text'}      " File type

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
