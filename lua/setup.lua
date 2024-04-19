local cmp = require'cmp'
local copilot = require'copilot'
local copilot_chat = require'CopilotChat'
local copilot_cmp = require'copilot_cmp'
local gitsigns = require'gitsigns'
local lspconfig = require'lspconfig'
local lspkind = require'lspkind'

gitsigns.setup {}

--
-- LSP servers
--
lspconfig.pyright.setup {}
lspconfig.tsserver.setup {}
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

-- Copilot settings
copilot.setup {
  suggestion = { enabled = false },
  panel = { enabled = false },
}
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
