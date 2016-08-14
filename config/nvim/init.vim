call plug#begin('~/.config/nvim/plugged')
" syntax
Plug 'ap/vim-css-color'
Plug 'digitaltoad/vim-pug'
Plug 'elzr/vim-json'
Plug 'gavocanov/vim-js-indent'
Plug 'hail2u/vim-css3-syntax'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'othree/yajs.vim'
Plug 'plasticboy/vim-markdown'
" snipmate
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" utils
Plug 'airblade/vim-gitgutter'
Plug 'benekastah/neomake'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/deoplete.nvim'
Plug 'terryma/vim-expand-region'
" theme
Plug 'mhartington/oceanic-next'
Plug 'rakr/vim-one'
call plug#end()

"
" Maps
"

let mapleader=','
let g:mapleader=','
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
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
let g:one_allow_italics=1
colorscheme one

highlight Normal guibg=none
hi LineNr guifg=none guibg=none ctermfg=8 ctermbg=0
hi StatusLine guifg=none guibg=none ctermfg=8 ctermbg=0
hi StatusLineNC guifg=none guibg=none ctermfg=8
hi TabLineFill guibg=none ctermbg=0
hi TabLine guibg=none ctermbg=0
hi TabLineSel guibg=none ctermbg=0
hi VertSplit guifg=none guibg=none ctermfg=0 ctermbg=0
hi GitGutterAdd guibg=none
hi GitGutterChange guibg=none
hi GitGutterDelete guibg=none
hi GitGutterChangeDelete guibg=none

"
" :)
"

set autoindent              " Always set auto indenting on
set autoread                " Set to auto read when a file is changed from the outside
set backspace=eol,start,indent
set clipboard+=unnamedplus  " Normal copy, paste
set cmdheight=1             " Height of the command bar
" set colorcolumn=80
set cursorline              " Highlight current line
set encoding=utf-8          " Set utf8
set expandtab               " Tabs are converted to spaces
set fillchars+=vert:\       " Split bar
set foldlevel=2
set foldmethod=indent
set foldnestmax=10
set hlsearch                " Highlight search results
set ignorecase              " Ignore case when searching
set incsearch               " Makes search act like search in modern browsers
set laststatus=2            " Status bar
set lazyredraw              " Don't redraw while executing macros (good performance config)
set mouse=a                 " Using the mouse
set nobackup
" set noexpandtab
set nofoldenable
set noswapfile
set nowb
set number                  " Line numbers
set numberwidth=3           " Width of line numbers
set ruler                   " Show the cursor line and column number
set shiftwidth=2            " 1 tab == 2 spaces
set showcmd                 " Show comand in bar
set showmatch               " Show matching brackets when text indicator is over them
set smartcase               " When searching try to be smart about cases
set smartindent             " Smart indent
set smarttab                " Be smart when using tabs ;)
set so=10                   " Set 7 lines to the cursor - when moving vertically using j/k
set softtabstop=2
set splitbelow              " Horizontal split below current
set splitright              " Vertical split to right of current
set tabstop=2               " 1 tab == 2 spaces
set textwidth=80
set whichwrap+=<,>,h,l
set wildmenu                " Turn on the WiLd menu
set wrap                    " Wrap lines

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

"
" Settings of Plugins
"

" deoplete, asynchronous keyword completion
let g:deoplete#enable_at_startup = 1

" NERDTree toggle
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable = '»'
let g:NERDTreeDirArrowCollapsible = '«'
map <C-\> :NERDTreeToggle<cr>

" NERDCommenter
let NERDSpaceDelims=1

" Neomake
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']
autocmd! BufWritePost * Neomake

" vim-jsx
let g:jsx_ext_required = 0

" vim-markdown
let g:vim_markdown_folding_disabled = 1
