local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

local plugin_files = vim.fn.glob(vim.fn.stdpath("config") .. "/lua/plugins/*.lua", false, true)

local plugins = {}
for _, file in ipairs(plugin_files) do
  local name = file:match("([^/]+)%.lua$")
  if name ~= "init" then
    table.insert(plugins, require("plugins." .. name))
  end
end

require("lazy").setup(plugins)
