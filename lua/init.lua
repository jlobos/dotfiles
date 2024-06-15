-- ============================================================================
-- UI
-- ============================================================================

-- Enable true color support
vim.opt.termguicolors = true
-- Syntax highlighting
vim.cmd('syntax on')

-- Configurar el esquema de colores (colorscheme)
-- Configurar el resaltado para los comentarios
vim.cmd [[
  colorscheme dracula
  hi Comment gui=italic guifg=#6272A4
  hi FloatBorder guibg=none guifg=#44475a
  hi NormalFloat guibg=none
]]

-- ============================================================================
-- Maps
-- ============================================================================

-- Save, Quit and Refresh (edit)
vim.api.nvim_set_keymap('n', '<leader>w', ':update<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', ':e!<CR>', { noremap = true, silent = true })

-- Exploration
vim.api.nvim_set_keymap('n', '<leader>e', ':Explore<CR>', { noremap = true, silent = true })

vim.g.netrw_banner = 0            -- Removing the banner
vim.g.netrw_liststyle = 3         -- Directory view in netrw
vim.g.netrw_localrmdir = "trash"  -- Allow netrw to remove non-empty local directories

-- Windows navigation
vim.api.nvim_set_keymap('n', '<leader>j', '<C-W>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', '<C-W>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', '<C-W>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>h', '<C-W>h', { noremap = true, silent = true })

-- ============================================================================
-- Miscellaneous
-- ============================================================================

-- Automatically re-read file if a change was detected outside of vim
vim.opt.autoread = true
-- Make backspace work as you would expect
vim.opt.backspace = 'eol,start,indent'
-- Yank and paste with the system clipboard
vim.opt.clipboard:append('unnamedplus')
-- Change vertical split character to be a space (essentially hide it)
vim.opt.fillchars:append({ vert = ' '})
-- Hides buffers instead of closing them
vim.opt.hidden = true
-- Only redraw when necessary
vim.opt.lazyredraw = true
-- Do not wrap long lines by default
vim.opt.wrap = false
-- When a bracket is inserted, briefly jump to the matching one
vim.opt.showmatch = true
-- Permite moverse a la siguiente/anterior línea con <, >, h, l
vim.opt.whichwrap:append("<,>,h,l")
-- Folding
vim.opt.foldmethod = 'syntax'
vim.opt.foldenable = false
-- Establece el ancho máximo de línea a 80 caracteres.
vim.opt.textwidth = 80


-- Open new windows below the current window
vim.opt.splitbelow = true
-- Open new windows right of current window
vim.opt.splitright = true

--
-- Status Line
--

-- Don't show statusline
vim.opt.laststatus = 0
-- Disable line/column number in status line
vim.opt.ruler = false
-- Don't dispay mode in command line
vim.opt.showmode = false
-- Don't show last command
vim.opt.showcmd = false

--
-- TAB/Space settings
--

vim.opt.smartindent = true
vim.opt.smarttab = true
-- Indent according to previous line
vim.opt.autoindent = true
-- Insert spaces when TAB is pressed
vim.opt.expandtab = true
-- Change number of spaces that a <Tab> counts for during editing ops
vim.opt.softtabstop = 2
-- Indentation amount for < and > commands
vim.opt.shiftwidth = 2

--
-- Search
--

-- Highlight while searching with / or ?
vim.opt.incsearch = true
-- Keep matches highlighted
vim.opt.hlsearch = true
-- Ignore case when searching
vim.opt.ignorecase = true
-- If the search string has an upper case letter in it, the search will be case sensitive
vim.opt.smartcase = true

--
-- Backups
--

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.writebackup = false

-- ============================================================================
-- Other
-- ============================================================================

-- Habilitar la detección de tipo de archivo, plugins y formato automático de indentación
vim.cmd('filetype plugin indent on')

-- Per default, netrw leaves unmodified buffers open. This autocommand
-- deletes netrw's buffer once it's hidden (using ':q', for example)
vim.cmd('autocmd FileType netrw setl bufhidden=delete')

-- Automatically removing all trailing whitespace
vim.cmd('autocmd BufWritePre * :%s/\\s\\+$//e')

-- Make sure Neovim returns to the same line when you reopen a file.
vim.api.nvim_exec([[
  augroup line_return
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
  augroup END
]], false)
