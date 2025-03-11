local fn = vim.fn
local version = vim.version

local M = {}

M.plugin_dir = vim.fn.stdpath("data") .. "/lazy"
M.lazypath = M.plugin_dir .. "/lua/lazy.lua"

return M
