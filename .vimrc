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
Plug 'airblade/vim-gitgutter'

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
  nnoremap <leader>f :GFiles<cr>
  nnoremap <leader>gs :GFiles?<cr>

" wrapper for prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'mattn/emmet-vim'
  let g:user_emmet_leader_key=','
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,javascript EmmetInstall

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

lua << EOF
-- local nvim_lsp = require('lspconfig')

-- local servers = { "pyright", "tsserver" }
-- for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup { on_attach = on_attach }
-- end
EOF
