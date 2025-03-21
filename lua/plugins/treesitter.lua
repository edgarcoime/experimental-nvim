return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  event = "VeryLazy",
  build = ":TSUpdate",
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    -- configure treesitter
    ---@diagnostic disable-next-line: missing-fields
    treesitter.setup {
      highlight = {
        enable = true,
        disable = { "rust" },
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      -- autotag = { enable = true },
      -- auto install any that i don't have
      auto_install = true,
      -- ensure languages are installed
      ensure_installed = {
        "json",
        "javascript",
        "typescript",
        "tsx",
        "yaml",
        "html",
        "css",
        "markdown",
        "markdown_inline",
        "svelte",
        "graphql",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    }
  end,
}
