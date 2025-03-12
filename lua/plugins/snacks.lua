return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    explorer = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    picker = { enabled = true },
    notifier = { 
      enabled = true,
      timeout = 3000,
    },
    quickfile = { enabled = true },
    -- ?scope = { enabled = true },
    -- ?statuscolumn = { enabled = true },
    words = { enabled = true },
  },
  keys = {
    -- QOL
    { "<leader>n",  function() Snacks.notifier.show_history() end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>gg", function() Snacks.lazygit() end, desc = "Lazygit" }
  }
}
