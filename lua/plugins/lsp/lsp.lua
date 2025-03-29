local C = {
   {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  { -- optional cmp completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
  {
    -- Mason is the language server installer
    "williamboman/mason.nvim",
    dependencies = {
      -- maybe needed but don't think so?
      -- 'WhoIsSethDaniel/mason-tool-installer.nvim',
    },
    config = function()
      -- import mason
      local mason = require("mason")

      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- breadcrumb like status bar
      -- bridges the gap between mason and lsp (allows for ensure option. ensuring that lsp is configured for mason)
      { "antosha417/nvim-lsp-file-operations", config = true },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      -- import lspconfig plugin
      local lspconfig = require("lspconfig")
      local util = require("lspconfig/util")

      -- import cmp-nvim-lsp plugin
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- ####################### SETUP MASON REQUIREMENTS #######################
      -- import mason-lspconfig
      local mason_lspconfig = require("mason-lspconfig")

      -- import mason-tool-installer
      local mason_tool_installer = require("mason-tool-installer")

      -- enable mason-lspconfig
      -- Listing all LSP servers
      -- https://github.com/williamboman/mason-lspconfig.nvim
      -- RESPONSIBLE FOR MAKING SURE **LSPS** ARE INSTALLED AND READY FOR MASON
      mason_lspconfig.setup({
        -- list servers mason should install
        ensure_installed = {
          -- Lua tooling
          "lua_ls",
          -- python
          "pyright",
          -- Golang
          "gopls",
          -- rust Use rustacean to enable further integrations
          -- clang
          -- "clangd",
          -- zig
          "zls",
          -- Elixir
          "elixirls",
          -- web
          "ts_ls",
          "html",
          "cssls",
          "tailwindcss",
          "svelte",
          "emmet_ls",
          -- "eslint",
          -- utils (json/toml/bash/etc...)
          -- "jsonls",
          "harper_ls",
          "bashls",
        },
        -- auto-install configured servers (with lspconfig)
        automatic_installation = true, -- not the same as ensure installed
      })

      -- LSPs that don't need extra configs
      -- Found in mason lua
      local defaultLSPs = {
        "lua_ls",
        -- "pyright",
        "gopls",
        "elixirls",
        -- "jsonls",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "svelte",
        "emmet_ls",
        -- "clangd",
        "bashls",
        "zls",
      }

      -- default options application
      local function apply_defaults(srvr)
        lspconfig[srvr].setup({
          -- capabilities = capabilities,
          -- on_attach = on_attach,
        })
      end

      -- loop over defaultLSPs and apply default settings
      for _, srvr in ipairs(defaultLSPs) do
        apply_defaults(srvr)
      end

    end
  },
}
-- return C
return {}
