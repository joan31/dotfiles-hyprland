require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua", "bash", "python" },
  highlight = { enable = true },
  indent = { enable = true },
})
