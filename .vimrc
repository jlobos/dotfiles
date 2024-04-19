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

" interactive scratchpad
Plug 'metakirby5/codi.vim'

" hyperfocus
Plug 'junegunn/limelight.vim', { 'on': 'Limelight' }
  nnoremap <leader>ll :Limelight!!0.6<cr>

" Shows a git diff in the gutter
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'

" git wrapper
Plug 'tpope/vim-fugitive'
  nnoremap <leader>ga :Gw<cr>
  nnoremap <leader>gc :G commit -v -q<cr>
  nnoremap <leader>gd :Gdiff<cr>

" command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
  nnoremap <leader>a :Ag<space>
  nnoremap <leader>b :Buffers<cr>
  nnoremap <leader>f :Files<cr>
  nnoremap <leader>gf :GFiles?<cr>

" wrapper for prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install --production' }

Plug 'mattn/emmet-vim'
  let g:user_emmet_leader_key=','
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,javascript EmmetInstall

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Mappings to easily delete, change and add such surroundings in pairs
Plug 'tpope/vim-surround'

" Switch between single-line and multiline forms of code
Plug 'AndrewRadev/splitjoin.vim'

" Quick Google lookup directly from Vim
Plug 'szw/vim-g'
  nnoremap <leader>s :Google<space>

Plug 'vim-test/vim-test'
  nnoremap <leader>t :TestNearest<cr>

" Copilot
Plug 'zbirenbaum/copilot.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'canary' }

" Neovim lenguage server client
Plug 'neovim/nvim-lspconfig'
" Completion
Plug 'hrsh7th/nvim-cmp'
" Completion sources
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'zbirenbaum/copilot-cmp'
" Pictograms for neovim lsp completion items
Plug 'onsails/lspkind.nvim'

" Snippet Engine for Neovim written in Lua
Plug 'L3MON4D3/LuaSnip'

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

" Swift syntax and indent files
Plug 'keith/swift.vim'

" Markdown
Plug 'godlygeek/tabular', {'for': 'markdown'}
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" Rust
Plug 'rust-lang/rust.vim'
let g:rustfmt_autosave = 1

call plug#end()

" ============================================================================
" LUA
" ============================================================================

lua require('init')
lua require('setup')
