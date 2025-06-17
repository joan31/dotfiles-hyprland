-- Space leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Load native nvim core options
require("core")

-- Load color theme
require("colors.sweet-dark")

-- Load Lazy and import plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { import = "plugins" }
}, {
  defaults = { lazy = true },
  checker = { enabled = true },
})
