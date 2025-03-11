vim.loader.enable()

local utils = require("utils")

local config_dir = vim.fn.stdpath("config")

require("globals")

require("core")

require("plugin_specs")
