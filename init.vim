call plug#begin('~/.config/nvim/plugged')

" Colorscheme
Plug 'joshdick/onedark.vim'

" Git
Plug 'airblade/vim-gitgutter'
let g:gitgutter_map_keys = 0

" Utils
Plug 'metakirby5/codi.vim'
Plug 'scrooloose/nerdtree'
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

" Lint
Plug 'benekastah/neomake'
let g:neomake_javascript_enabled_makers = ['standard']
" let g:neomake_javascript_enabled_makers = ['xo']
autocmd! BufWritePost * Neomake

" Edit
Plug 'AndrewRadev/splitjoin.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

"
" Syntax
"

" Pug
Plug 'digitaltoad/vim-pug'
" Javascript
Plug 'gavocanov/vim-js-indent'
Plug 'othree/es.next.syntax.vim'
Plug 'othree/yajs.vim'
" CoffeeScript
Plug 'kchmck/vim-coffee-script'
" Nginx
Plug 'evanmiller/nginx-vim-syntax'
" Api Blueprint
Plug 'kylef/apiblueprint.vim'

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

"
" UI
"

syntax on
set termguicolors
set background=dark
colorscheme onedark

" transparent background color
hi Normal guibg=NONE ctermbg=NONE

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
set noruler
set noshowcmd
set noswapfile
set nowb
set nowrap
set number
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
