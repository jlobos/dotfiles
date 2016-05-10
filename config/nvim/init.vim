set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.dotfiles/config/nvim/bundle/Vundle.vim
call vundle#begin('~/.dotfiles/config/nvim/bundle')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" syntax
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'plasticboy/vim-markdown'
Plugin 'mxw/vim-jsx'
Plugin 'ap/vim-css-color'
Plugin 'digitaltoad/vim-pug'
" git helpers
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" utils
Plugin 'benekastah/neomake'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'joshdick/onedark.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/deoplete.nvim'
Plugin 'terryma/vim-expand-region'
Plugin 'terryma/vim-multiple-cursors'
" nodejs
" Plugin 'neovim/node-host'
" Plugin 'disusered/node-neovim-plugin'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
filetype plugin on

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let g:mapleader = ","

"
" Colors
"

syntax on
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme onedark

"
" :)
"

set autoindent      " Always set auto indenting on
set autoread        " Set to auto read when a file is changed from the outside
set cmdheight=1     " Height of the command bar
set cursorline      " Highlight current line
set encoding=utf-8  " Set utf8
set expandtab       " Tabs are converted to spaces
set laststatus=2    " Status bar
set lazyredraw      " Don't redraw while executing macros (good performance config)
set mouse=a         " Using the mouse
set number          " Line numbers
set numberwidth=3   " Width of line numbers
set ruler           " Show the cursor line and column number
set shiftwidth=2    " 1 tab == 2 spaces
set showcmd         " Show comand in bar
set smartindent     " Smart indent
set smarttab        " Be smart when using tabs ;)
set so=7            " Set 7 lines to the cursor - when moving vertically using j/k
set softtabstop=2
set splitbelow      " Horizontal split below current
set splitright      " Vertical split to right of current
set tabstop=2       " 1 tab == 2 spaces
set wildmenu        " Turn on the WiLd menu
set wrap            " Wrap lines
set fillchars+=vert:\       " Split bar
set clipboard+=unnamedplus  " Normal copy, paste

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Wrap column settings
set colorcolumn=80
set textwidth=80

"
" Search/Highlight tweaks
"

set hlsearch        " Highlight search results
set ignorecase      " Ignore case when searching
set incsearch       " Makes search act like search in modern browsers
set showmatch       " Show matching brackets when text indicator is over them
set smartcase       " When searching try to be smart about cases

"
" Format the status line
"

func! GitBranch()
  let l:status = fugitive#statusline()
  if !empty(l:status)
    let l:status = substitute(l:status, '[Git(', '', '')
    let l:status = substitute(l:status, ')]', '', '')
    return '   ' . l:status . ' '
  endif
  return ''
endfunc

func! GitDiffNumStat()
  let l:path = expand('%:p')
  if !empty(l:path) && !empty(fugitive#statusline())
    let l:out = system('git diff --numstat ' . expand('%:p'))
    if !empty(l:out)
      let l:list = map(split(l:out), 'matchstr(v:val, "[0-9]*")')
      return ' +' . l:list[0] . ',-' . l:list[1] . ' '
    endif
  endif
  return ''
endfunc

set statusline =%1*\ ❤%*
" set statusline =
set statusline +=\ %f       " File
set statusline +=\ %l:%v    " Current line and column
set statusline +=%=         " End line
set statusline +=\ %{toupper(&fenc!=''?&fenc:&enc)}   " Encoding
set statusline +=\ %{&ft!=''?&ft:'Plaint\ Text'}      " File type
set statusline +=%{GitBranch()}                       " Git branch
set statusline +=%2*%{GitDiffNumStat()}               " Git diff

hi User1 guifg=#F46767 guibg=#2c323b
hi User2 guifg=#E2C08D guibg=#2c323b

"
" Maps
"

" Fast saving
nmap <leader>w :w!<cr>
" Fast quit
nmap <leader>q :q<cr>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Move a line of text using CTRL+[jk] or Comamnd+[jk] on mac
nmap <C-j> mz:m+<cr>`z
nmap <C-k> mz:m-2<cr>`z
vmap <C-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <C-k> :m'<-2<cr>`>my`<mzgv`yo`z

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR><Paste>

" Tab navigation like Firefox.
nnoremap <C-t> :tabnew<cr>
nnoremap <C-i> :tabnext<cr>

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

" ctrlp.vim
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" NERDCommenter
let NERDSpaceDelims=1

" Neomake
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']
autocmd! BufWritePost * Neomake

" vim-jsx
let g:jsx_ext_required = 0
