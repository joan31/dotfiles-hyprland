local autocmd = vim.api.nvim_create_autocmd

-- Highlight yanked text briefly
autocmd("TextYankPost", {
  callback = function() vim.highlight.on_yank() end
})

-- Set indentation rules based on filetype
autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Use 4 spaces for Python indentation
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

autocmd("FileType", {
  pattern = { "sh", "bash", "zsh" },
  callback = function()
    -- Use 2 spaces for shell scripts indentation
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
  end,
})

-- Change default working directory to ~/Projects if no file opened and current dir is home
autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 and vim.fn.getcwd() == vim.fn.expand("~") then
      vim.cmd("cd ~/Projects")
    end
  end,
})
