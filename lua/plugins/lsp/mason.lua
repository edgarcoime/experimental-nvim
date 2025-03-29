return {
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
          border = vim.g.border,
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
    keys = {
      { "<leader>em", "<cmd>Mason<cr>", desc = "Open Mason menu" },
    }
  },
}
