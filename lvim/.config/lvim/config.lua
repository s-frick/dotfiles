-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.transparent_window = true
lvim.format_on_save.enabled = true
vim.opt.cmdheight = 2             -- more space in the neovim command line for displaying messages
vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
vim.opt.tabstop = 2               -- insert 2 spaces for a tab
vim.opt.relativenumber = true     -- relative line numbers
vim.opt.wrap = true               -- wrap lines



-- use treesitter folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"


lvim.plugins = {
  "mfussenegger/nvim-jdtls",
  "olexsmir/gopher.nvim",
  "leoluz/nvim-dap-go",
  {
    "jayp0521/mason-null-ls.nvim",
    config = function()
      require("mason-null-ls").setup({
        automatic_installation = false,
        automatic_setup = true,
        ensure_installed = {},
      })
      -- require("mason-null-ls").setup_handlers({})
    end,
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "mrjones2014/nvim-ts-rainbow",
  },
  {
    "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,   -- Enable this plugin (Can be enabled/disabled later via commands)
        throttle = true, -- Throttles plugin updates (may improve performance)
        max_lines = 0,   -- How many lines the window should span. Values <= 0 mean no limit.
        patterns = {
          -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
          },
        },
      }
    end
  },

  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  "elkowar/yuck.vim"
}
-- Skip AutoConfig for java
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "jdtls", "gopls", "marksman" })
-- lvim.builtin.treesitter.matchup.enable = true
lvim.builtin.treesitter.rainbow.enable = true

require("mason-lspconfig").setup({
  ensure_installed = {
    "awk_ls",
    "bashls",
    "cssls",
    "dockerls",
    "gopls",
    "gradle_ls",
    "html",
    "jsonls",
    "jdtls",
    "tsserver",
    "tailwindcss",
    "vuels",
    "yamlls"
  }
})


lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
  "go",
  "gomod",
  "hcl",
  "markdown"
}

-- Formatters - external programs
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black",              filetypes = { "python" } },
  { command = "isort",              filetypes = { "python" } },
  { command = "shfmt",              filetypes = { "sh" } },
  { command = "terraform_fmt",      filetypes = { "terraform" } },
  { command = "prettier",           filetypes = { "typescript", "typescriptreact" } },
  { command = "google-java-format", filetypes = { "java" } }
}

-- Linters - external programs
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } }
}

-- local debuggers = require "lua.lvim.core.dap"
lvim.builtin.dap.active = true
local dap = require('dap')
-- dap.configuration.java = {
--   {
--     type = 'java',
--     request = 'attach',
--     name = "Debug (Attach) - Remote",
--     hostName = "127.0.0.1",
--     port = 5005,
--   },
-- }

-- Remappings
-- lvim.builtin.which_key.mappings["/"] = {
--   "<Plug>(comment_toggle_linewise_current)", "Toggle linewise"
-- }
-- Centers cursor when moving 1/2 page down
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"
