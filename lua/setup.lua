local cmp = require'cmp'
local copilot = require'copilot'
local copilot_chat = require'CopilotChat'
local copilot_cmp = require'copilot_cmp'
local gitsigns = require'gitsigns'
local lspconfig = require'lspconfig'
local lspkind = require'lspkind'
local nvim_tree = require("nvim-tree")

gitsigns.setup {}
nvim_tree.setup {
  disable_netrw = true,
  view = {
    float = { enable = true },
  },
  renderer = {
    icons = {
      glyphs = {
        git = { untracked = "u" }
      }
    }
  }
}

--
-- LSP servers
--

-- for Deno
lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

-- for JavaScript and TypeScript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}

-- for Arduino
lspconfig.arduino_language_server.setup {
  cmd = {
    "arduino-language-server",
    "-cli-config", "$HOME/Library/Arduino15/arduino-cli.yaml",
  }
}

-- for Python
lspconfig.pyright.setup {}

-- for Swift
lspconfig.sourcekit.setup {
  filetypes = { 'swift' },
}

-- for Lua
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
    },
  },
}

-- for css
-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
lspconfig.cssls.setup {
  capabilities = capabilities,
}

-- K muestra informacion
-- gd salta a definición
-- gD salta a declaración
-- gi muestra implementaciones
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local opts = { buffer = event.buf }
    local map = vim.keymap.set

    map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
  end
})

-- Agregar bordes a ventana de información K
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'rounded' }
)

-- Copilot settings
-- copilot.setup {
--   suggestion = { enabled = false },
--   panel = { enabled = false },
-- }
copilot_chat.setup {
  show_help = false,
  auto_follow_cursor = false,

  question_header = "## ", -- Header to use for user questions
  answer_header = "## ", -- Header to use for AI answers
  error_header = "## Error", -- Header to use for errors
  separator = " ", -- Separator to use in chat

  window = {
    layout = 'float', -- 'vertical', 'horizontal', 'float'
    width = 0.9, -- fractional width of parent, or absolute width in columns when > 1
    height = 0.9, -- fractional height of parent, or absolute height in rows when > 1
    border = 'rounded', -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
    title = '', -- title of chat window
  },
}
copilot_cmp.setup {}

-- Completion settings
cmp.setup {
  snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
  },
  formatting = {
    format = lspkind.cmp_format {
      symbol_map = { Copilot = "" }
    }
  },
  window = {
    completion = cmp.config.window.bordered { scrollbar = false },
    documentation = cmp.config.window.bordered { },
  },
  mapping = cmp.mapping.preset.insert {
    ["<Up>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<Down>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
  sources = {
    { name = 'copilot' },
    { name = 'nvim_lsp' },
    { name = 'buffer' }, -- text within current buffer
    { name = 'path' }, -- file system paths
    { name = 'luasnip' }, -- for luasnip
  }
}
